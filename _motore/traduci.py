# -*- coding: utf-8 -*-
"""Pipeline di traduzione degli atlanti (inglese EN, danese DA).

Uso, dalla cartella del repo:
    python _motore/traduci.py estrai [sigla ...]     crea _traduzioni/<sigla>/<pagina>.tpl e .src (testo italiano)
    python _motore/traduci.py controlla [sigla ...]  dice quali pagine sono complete e cosa non torna
    python _motore/traduci.py costruisci [sigla ...] scrive <atlante>/en/ e <atlante>/da/ con le pagine complete

Le traduzioni si scrivono in _traduzioni/<sigla>/<pagina>.en e .da, una riga per segmento:
    @@s001 testo tradotto (può contenere i tag HTML del testo originale)
Gli ID (s001, s002...) sono quelli del file .src. Non si cambia il numero dei segmenti.
"""
import os
import posixpath
import re
import sys
from html.parser import HTMLParser

RADICE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
DATI = os.path.join(RADICE, "_traduzioni")
ATLANTI = {
    "adpro": "Atlante Advanced Programming",
    "pcpp": "Atlante PCPP",
    "algdes": "Atlante Algorithm Design",
    "iml": "Atlante Machine Learning",
}
LINGUE = ("en", "da")
TAG_TESTO = {"p", "li", "h1", "h2", "h3", "h4", "h5", "dt", "dd", "td", "th", "summary", "figcaption", "blockquote"}
DIV_TESTO = {"box", "lede", "occhiello", "nota", "testo", "idea", "fix"}
# parole italiane di funzione: un <div class="espr"> con almeno una di queste è prosa, non solo formula o codice
PAROLE_IT = ("il", "lo", "la", "gli", "le", "di", "che", "per", "con", "sono", "non", "una", "uno", "nel", "nella",
             "nelle", "nei", "della", "delle", "degli", "del", "dal", "dalla", "da", "se", "ma", "oppure", "quindi",
             "poi", "come", "ogni", "tutti", "tutte", "anche", "solo", "quando", "dove", "cioè", "è", "può", "sul", "sui",
             "questo", "questa")
RE_PROSA_IT = re.compile(r"(?<![\wÀ-ÿ])(?:%s)(?![\wÀ-ÿ])" % "|".join(PAROLE_IT))
ATTR_TESTO = ("data-tit", "data-titolo", "data-legenda")
VUOTI = {"area", "base", "br", "col", "embed", "hr", "img", "input", "link", "meta", "param", "source", "track", "wbr"}
RE_ATTR = re.compile(r'(data-tit|data-titolo|data-legenda)="([^"]*)"')
RE_JS = re.compile(r"\b(nota|legenda)\s*:\s*(['`])((?:\\.|(?!\2).)*?)\2", re.S)
RE_SCRIPT = re.compile(r"<script\b[^>]*>(.*?)</script>", re.S | re.I)
RE_TITOLO = re.compile(r"<title>(.*?)</title>", re.S)
RE_PH = re.compile(r"\{\{([sajt])\|(s\d+)\|(['`]?)\}\}")
RE_LINK = re.compile(r'''(href|src)=(["'])([^"']*)\2''')
RE_LETTERE = re.compile(r"[A-Za-zÀ-ÿ]{2,}")
CHIAVI_LEGENDA = "ok|ora|no|due|dato|spento"
RE_LEGENDA = re.compile(r"(?:%s):[^,]*(?:,(?:%s):[^,]*)*" % (CHIAVI_LEGENDA, CHIAVI_LEGENDA))


def fine_tag(src, i):
    """Indice dopo il '>' che chiude il tag che inizia in src[i]."""
    q = None
    j = i
    while j < len(src):
        c = src[j]
        if q:
            if c == q:
                q = None
        elif c in "\"'":
            q = c
        elif c == ">":
            return j + 1
        j += 1
    raise ValueError("tag non chiuso a %d" % i)


class Albero(HTMLParser):
    """Registra ogni elemento con le posizioni (nel file) del tag di apertura e di chiusura."""

    def __init__(self, src):
        super().__init__(convert_charrefs=False)
        self.src = src
        self.righe = [0]
        for k, c in enumerate(src):
            if c == "\n":
                self.righe.append(k + 1)
        self.pila = []
        self.nodi = []

    def _pos(self):
        ln, col = self.getpos()
        return self.righe[ln - 1] + col

    def _nuovo(self, tag, attrs, s):
        e = fine_tag(self.src, s)
        nodo = {"tag": tag, "start": s, "aperto": e, "chiuso": None, "figli": [],
                "attrs": dict(attrs), "in_pre": any(p["tag"] == "pre" for p in self.pila),
                "in_mappa": any("mappa" in (p["attrs"].get("class") or "").split() for p in self.pila)}
        if self.pila:
            self.pila[-1]["figli"].append(nodo)
        return nodo

    def handle_starttag(self, tag, attrs):
        if tag in VUOTI:
            self.nodi.append(self._nuovo(tag, attrs, self._pos()))
            return
        self.pila.append(self._nuovo(tag, attrs, self._pos()))

    def handle_startendtag(self, tag, attrs):
        self.nodi.append(self._nuovo(tag, attrs, self._pos()))

    def handle_endtag(self, tag):
        if tag in VUOTI:
            return
        s = self._pos()
        for k in range(len(self.pila) - 1, -1, -1):
            if self.pila[k]["tag"] == tag:
                nodo = self.pila[k]
                nodo["chiuso"] = s
                nodo["interno"] = self.src[nodo["aperto"]:s]
                del self.pila[k:]
                self.nodi.append(nodo)
                return


def e_testo(nodo):
    t = nodo["tag"]
    if nodo["in_pre"]:
        return False
    if t in TAG_TESTO:
        return True
    classi = (nodo["attrs"].get("class") or "").split()
    if t == "div":
        if any(c in DIV_TESTO for c in classi):
            return True
        return "espr" in classi and bool(RE_PROSA_IT.search(re.sub(r"<[^>]+>", " ", nodo.get("interno", ""))))
    # voci della mappa degli argomenti (<a> dentro <div class="mappa">) e legende della home (<span class="l-…">)
    if t == "a":
        return nodo["in_mappa"]
    if t == "span":
        return any(c.startswith("l-") for c in classi)
    return False


def ha_candidati_sotto(nodo):
    for f in nodo["figli"]:
        if e_testo(f) or ha_candidati_sotto(f):
            return True
    return False


def estrai_segmenti(src):
    """Ritorna (lista di segmenti, ordinata nel file). Ogni segmento: dict con tipo, inizio, fine, testo, quote."""
    albero = Albero(src)
    albero.feed(src)
    albero.close()
    segs = []
    # 1. contenuto degli elementi di testo più interni
    for nodo in albero.nodi:
        if not e_testo(nodo) or ha_candidati_sotto(nodo) or nodo["chiuso"] is None:
            continue
        inizio, fine = nodo["aperto"], nodo["chiuso"]
        interno = src[inizio:fine]
        if not RE_LETTERE.search(re.sub(r"<[^>]+>", " ", interno)):
            continue
        segs.append({"tipo": "s", "inizio": inizio, "fine": fine, "testo": re.sub(r"\s+", " ", interno).strip(), "quote": ""})
    # 2. attributi tradotti (nel tag di apertura)
    for nodo in albero.nodi:
        tag_src = src[nodo["start"]:nodo["aperto"]]
        for m in RE_ATTR.finditer(tag_src):
            a = nodo["start"] + m.start(2)
            b = nodo["start"] + m.end(2)
            segs.append({"tipo": "a", "inizio": a, "fine": b, "testo": m.group(2), "quote": ""})
    # 3. note e legende degli script di scena
    for m in RE_SCRIPT.finditer(src):
        base = m.start(1)
        for mj in RE_JS.finditer(m.group(1)):
            a = base + mj.start(3)
            b = base + mj.end(3)
            testo = mj.group(3).replace("\\'", "'").replace("\\`", "`")
            segs.append({"tipo": "j", "inizio": a, "fine": b, "testo": testo, "quote": mj.group(2)})
    # 4. titolo della pagina
    mt = RE_TITOLO.search(src)
    if mt:
        segs.append({"tipo": "t", "inizio": mt.start(1), "fine": mt.end(1), "testo": mt.group(1).strip(), "quote": ""})
    segs.sort(key=lambda s: s["inizio"])
    for k in range(1, len(segs)):
        if segs[k]["inizio"] < segs[k - 1]["fine"]:
            raise ValueError("segmenti sovrapposti: %r" % segs[k]["testo"][:60])
    for k, s in enumerate(segs, 1):
        s["id"] = "s%03d" % k
    return segs


def crea_template(src, segs):
    out = src
    for s in sorted(segs, key=lambda s: s["inizio"], reverse=True):
        out = out[:s["inizio"]] + "{{%s|%s|%s}}" % (s["tipo"], s["id"], s["quote"]) + out[s["fine"]:]
    return out


def pagine_di(atlante):
    base = os.path.join(RADICE, atlante)
    trovate = []
    for dirpath, dirnames, files in os.walk(base):
        dirnames[:] = [d for d in dirnames if d not in ("_archivio", "en", "da")]
        for f in files:
            if f.endswith(".html"):
                trovate.append(os.path.relpath(os.path.join(dirpath, f), base).replace(os.sep, "/"))
    return sorted(trovate)


def nome_file(rel):
    return rel.replace("/", "__")


def cartella_dati(sigla):
    return os.path.join(DATI, sigla)


def comando_estrai(siglas):
    """Riscrive .src e .tpl. I segmenti il cui testo non è cambiato tengono la traduzione già scritta
    (anche se gli ID sono cambiati perché ne è comparso uno nuovo prima); gli altri restano vuoti."""
    for sigla in siglas:
        cart = cartella_dati(sigla)
        os.makedirs(cart, exist_ok=True)
        n = nuovi = 0
        for rel in pagine_di(ATLANTI[sigla]):
            src = open(os.path.join(RADICE, ATLANTI[sigla], rel), encoding="utf-8").read()
            segs = estrai_segmenti(src)
            base = os.path.join(cart, nome_file(rel))
            vecchio_src = leggi_traduzioni(base + ".src")
            vecchie = {lingua: leggi_traduzioni(base + "." + lingua) for lingua in LINGUE}
            ids_per_testo = {}
            for sid, testo in vecchio_src.items():
                ids_per_testo.setdefault(testo, []).append(sid)
            righe_src, righe_tra = [], {lingua: [] for lingua in LINGUE}
            for s in segs:
                testo = s["testo"].replace("\n", " ").strip()
                righe_src.append("@@%s %s" % (s["id"], testo))
                vecchio = ids_per_testo.get(testo)
                vecchio_id = vecchio.pop(0) if vecchio else None
                for lingua in LINGUE:
                    t = vecchie[lingua].get(vecchio_id, "") if vecchio_id else ""
                    righe_tra[lingua].append("@@%s %s" % (s["id"], t))
                if vecchio_id is None:
                    nuovi += 1
            open(base + ".tpl", "w", encoding="utf-8", newline="").write(crea_template(src, segs))
            open(base + ".src", "w", encoding="utf-8", newline="").write("\n".join(righe_src) + "\n")
            for lingua in LINGUE:
                open(base + "." + lingua, "w", encoding="utf-8", newline="").write("\n".join(righe_tra[lingua]) + "\n")
            n += len(segs)
        print(ATLANTI[sigla], "segmenti estratti:", n, "da tradurre:", nuovi)


def leggi_traduzioni(percorso):
    if not os.path.exists(percorso):
        return {}
    out = {}
    for riga in open(percorso, encoding="utf-8").read().splitlines():
        m = re.match(r"^@@(s\d+) ?(.*)$", riga)
        if m:
            out[m.group(1)] = m.group(2).strip()
    return out


def controlla_pagina(sigla, rel, lingua):
    base = os.path.join(cartella_dati(sigla), nome_file(rel))
    if not os.path.exists(base + ".src"):
        return ["manca il file .src (pagina nuova: lancia estrai)"], 0
    if not os.path.exists(base + "." + lingua):
        return ["manca il file .%s" % lingua], 0
    src = leggi_traduzioni(base + ".src")
    tra = leggi_traduzioni(base + "." + lingua)
    errori = []
    for sid, testo_it in src.items():
        if sid not in tra or not tra[sid]:
            errori.append("manca %s" % sid)
            continue
        t = tra[sid]
        if "{{" in t or "}}" in t:
            errori.append("%s: placeholder rotto" % sid)
        if re.findall(r"\$\{[^}]*\}", testo_it) != re.findall(r"\$\{[^}]*\}", t):
            errori.append("%s: le interpolazioni ${...} non tornano" % sid)
        # legende degli attributi data-legenda: "chiave:etichetta,chiave:etichetta" -> le chiavi restano quelle
        if RE_LEGENDA.fullmatch(testo_it.strip()) and re.findall(r"(?:^|,)\s*(\w+):", testo_it) != re.findall(r"(?:^|,)\s*(\w+):", t):
            errori.append("%s: le chiavi della legenda non tornano" % sid)
        if sorted(re.findall(r"<([a-zA-Z][a-zA-Z0-9]*)", testo_it)) != sorted(re.findall(r"<([a-zA-Z][a-zA-Z0-9]*)", t)):
            errori.append("%s: i tag HTML non tornano" % sid)
    return errori, len(src)


def comando_controlla(siglas):
    for sigla in siglas:
        for lingua in LINGUE:
            ok, tot = [], 0
            for rel in pagine_di(ATLANTI[sigla]):
                errori, n = controlla_pagina(sigla, rel, lingua)
                tot += 1
                if not errori:
                    ok.append(rel)
                else:
                    print("  [%s %s] %s: %s" % (sigla, lingua, rel, "; ".join(errori[:3])))
            print("%s %s: pagine complete %d / %d" % (sigla, lingua, len(ok), tot))


def escape_js(testo, quote):
    if quote == "'":
        return re.sub(r"(?<!\\)'", r"\\'", testo)
    if quote == "`":
        return re.sub(r"(?<!\\)`", r"\\`", testo)
    return testo


def riscrivi_link(link, rel, lingua, insieme):
    """Link di una pagina tradotta, che sta in <atlante>/<lingua>/<rel>.
    Un link interno a una pagina tradotta punta alla sua copia tradotta; gli altri (assets, pagine non tradotte,
    cartelle fuori dall'atlante) puntano all'originale italiano. Il percorso si ricalcola perché la pagina è un livello più in basso."""
    if link == "" or re.match(r"^(https?:|mailto:|#|data:|javascript:|/)", link):
        return link
    percorso, sep, frammento = link.partition("#")
    if not percorso:
        return link
    cartella = posixpath.dirname(rel) or "."
    bersaglio = posixpath.normpath(posixpath.join(cartella, percorso))
    if not bersaglio.startswith("..") and bersaglio in insieme:
        nuovo = posixpath.relpath(bersaglio, cartella)
    else:
        nuovo = posixpath.relpath(bersaglio, posixpath.join(lingua, cartella))
    return nuovo + sep + frammento


def costruisci_pagina(sigla, rel, lingua, insieme):
    base = os.path.join(cartella_dati(sigla), nome_file(rel))
    tpl = open(base + ".tpl", encoding="utf-8").read()
    tra = leggi_traduzioni(base + "." + lingua)

    def sostituisci(m):
        tipo, sid, quote = m.group(1), m.group(2), m.group(3)
        t = tra[sid]
        if tipo == "a":
            return t.replace('"', "&quot;")
        if tipo == "j":
            return escape_js(t, quote)
        return t

    out = RE_PH.sub(sostituisci, tpl)

    def link(m):
        return '%s=%s%s%s' % (m.group(1), m.group(2), riscrivi_link(m.group(3), rel, lingua, insieme), m.group(2))
    out = RE_LINK.sub(link, out)
    return out


def comando_costruisci(siglas):
    for sigla in siglas:
        atlante = ATLANTI[sigla]
        for lingua in LINGUE:
            pagine = pagine_di(atlante)
            complete = [r for r in pagine if not controlla_pagina(sigla, r, lingua)[0]]
            insieme = set(complete)
            for rel in complete:
                out = costruisci_pagina(sigla, rel, lingua, insieme)
                destinazione = os.path.join(RADICE, atlante, lingua, rel)
                os.makedirs(os.path.dirname(destinazione), exist_ok=True)
                open(destinazione, "w", encoding="utf-8", newline="").write(out)
            print("%s %s: scritte %d pagine (su %d)" % (atlante, lingua, len(complete), len(pagine)))
            aggiorna_manifesto(atlante, lingua, complete)


def aggiorna_manifesto(atlante, lingua, pagine):
    """Scrive in assets/sito.js la lista delle pagine tradotte: SITO.tradotte = { en: [...], da: [...] }."""
    import json
    percorso = os.path.join(RADICE, atlante, "assets", "sito.js")
    testo = open(percorso, encoding="utf-8", newline="").read()
    crlf = "\r\n" in testo
    t = testo.replace("\r\n", "\n")
    righe = t.split("\n")
    tradotte = {}
    for riga in righe:
        if riga.startswith("  tradotte: "):
            tradotte = json.loads(riga[len("  tradotte: "):].rstrip(","))
    tradotte[lingua] = sorted(pagine)
    nuova = "  tradotte: " + json.dumps(tradotte, ensure_ascii=False) + ","
    if any(r.startswith("  tradotte: ") for r in righe):
        righe = [nuova if r.startswith("  tradotte: ") else r for r in righe]
    else:
        i = righe.index("  menu: [")
        righe.insert(i, nuova)
    t = "\n".join(righe)
    if crlf:
        t = t.replace("\n", "\r\n")
    open(percorso, "w", encoding="utf-8", newline="").write(t)


def main():
    if len(sys.argv) < 2 or sys.argv[1] not in ("estrai", "controlla", "costruisci"):
        print(__doc__)
        return
    comando = sys.argv[1]
    siglas = sys.argv[2:] or list(ATLANTI)
    for s in siglas:
        if s not in ATLANTI:
            sys.exit("sigla sconosciuta: " + s)
    {"estrai": comando_estrai, "controlla": comando_controlla, "costruisci": comando_costruisci}[comando](siglas)


if __name__ == "__main__":
    main()
