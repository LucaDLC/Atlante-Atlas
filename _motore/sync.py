"""Copia il motore comune (atlas.css, atlas.js) dentro ogni atlante e controlla i siti.

Uso (dalla cartella [ATLANTI]):
    python _motore/sync.py                 copia il motore e controlla tutti i siti
    python _motore/sync.py --solo-controllo
    python _motore/sync.py PCPP            solo i siti il cui nome contiene "PCPP"

Cosa controlla per ogni sito:
  - ogni voce del menu in assets/sito.js punta a un file che esiste
  - ogni pagina .html del sito compare nel menu (altrimenti non la trovi dall'indice)
  - ogni pagina carica atlas.css, tema.css, sito.js e atlas.js con il percorso giusto
  - ogni evidenziazione data-segna trova il suo testo e non si sovrappone a un'altra
  - ogni data-scena ha la sua definizione nella pagina
"""
import html
import pathlib
from html.parser import HTMLParser
import re
import shutil
import sys

RADICE = pathlib.Path(__file__).resolve().parent.parent
MOTORE = RADICE / "_motore"
SITI = [
    "Atlante Advanced Programming",
    "Atlante PCPP",
    "Atlante Algorithm Design",
    "Atlante Machine Learning",
]
FILE_MOTORE = ["atlas.css", "atlas.js"]
RUOLI = {"ora", "dato", "due", "ok", "no"}


def copia(sito: pathlib.Path) -> None:
    assets = sito / "assets"
    assets.mkdir(parents=True, exist_ok=True)
    for nome in FILE_MOTORE:
        shutil.copyfile(MOTORE / nome, assets / nome)
    shutil.copyfile(MOTORE / "LEGGIMI.md", sito / "LEGGIMI.md")


# ---------------------------------------------------------------- evidenziazioni
# Stessa logica di leggiSegni / trovaSegni / intervalloRighe in atlas.js.

def testo_pre(interno: str) -> list[str]:
    t = html.unescape(re.sub(r"<[^>]+>", "", interno))
    t = re.sub(r"^\n", "", t)
    t = re.sub(r"\s+$", "", t).replace("\t", "  ")
    return t.split("\n")


def leggi_segni(s: str) -> list[dict]:
    out = []
    for p in filter(None, s.split("|")):
        ruolo = "ora"
        at = p.rfind("@")
        if at > 0 and p[at + 1:] in RUOLI:
            ruolo, p = p[at + 1:], p[:at]
        tutte, occ = False, 1
        if len(p) > 1 and p.endswith("*"):
            tutte, p = True, p[:-1]
        m = re.search(r"#(\d+)$", p)
        if m and len(p) > len(m.group(0)):
            occ, p = int(m.group(1)), p[: -len(m.group(0))]
        out.append({"tok": p, "ruolo": ruolo, "tutte": tutte, "occ": occ})
    return out


def intervallo_righe(s: str, massimo: int) -> list[int]:
    out = []
    for pezzo in (s or "").split(","):
        parti = pezzo.split("-")
        try:
            a = int(parti[0])
        except ValueError:
            continue
        b = int(parti[1]) if len(parti) > 1 and parti[1].strip().isdigit() else a
        out += [k - 1 for k in range(a, b + 1) if 1 <= k <= massimo]
    return out


def verifica_segni(righe: list[str], indici: list[int], segni: list[dict], dove: str) -> list[str]:
    avvisi, mappa = [], {}
    for s in segni:
        conta = 0
        for r in indici:
            t = righe[r] if r < len(righe) else ""
            k = t.find(s["tok"])
            while k >= 0:
                conta += 1
                if s["tutte"] or conta == s["occ"]:
                    mappa.setdefault(r, []).append((k, k + len(s["tok"])))
                if not s["tutte"] and conta >= s["occ"]:
                    break
                k = t.find(s["tok"], k + len(s["tok"]))
            if not s["tutte"] and conta >= s["occ"]:
                break
        if conta < s["occ"]:
            occ = f"#{s['occ']}" if s["occ"] > 1 else ""
            avvisi.append(f"{dove}: non trovo {s['tok']!r}{occ}")
    for r, lista in mappa.items():
        lista.sort()
        fine = -1
        for a, b in lista:
            if a < fine:
                avvisi.append(f"{dove}: {righe[r][a:b]!r} si sovrappone a un'altra evidenziazione (riga {r + 1})")
            fine = max(fine, b)
    return avvisi


def attributo(attrs: str, nome: str) -> str | None:
    m = re.search(rf'\b{nome}="([^"]*)"', attrs)
    return html.unescape(m.group(1)) if m else None


class Bilancia(HTMLParser):
    """Controlla che i tag strutturali siano chiusi nell'ordine giusto."""
    TAG = {"main", "header", "section", "figure", "div", "pre", "ol", "ul", "li", "table", "thead", "tbody",
           "tr", "td", "th", "p", "aside", "details", "summary", "span", "mark", "code", "b", "i", "a", "button",
           "h1", "h2", "h3", "h4", "dl", "dt", "dd", "small", "em", "strong", "nav", "label"}

    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.pila, self.errori = [], []

    def handle_starttag(self, tag, attrs):
        if tag in self.TAG:
            self.pila.append((tag, self.getpos()[0]))

    def handle_endtag(self, tag):
        if tag not in self.TAG:
            return
        if self.pila and self.pila[-1][0] == tag:
            self.pila.pop()
            return
        aperto = f"<{self.pila[-1][0]}> della riga {self.pila[-1][1]}" if self.pila else "niente"
        self.errori.append(f"</{tag}> alla riga {self.getpos()[0]}, ma è aperto {aperto}")
        for k in range(len(self.pila) - 1, -1, -1):
            if self.pila[k][0] == tag:
                del self.pila[k:]
                break


def controlla_pagina(testo: str, rel: str) -> list[str]:
    avvisi = []
    b = Bilancia()
    b.feed(testo)
    avvisi += [f"{rel}: {e}" for e in b.errori[:3]]
    avvisi += [f"{rel}: <{t}> della riga {r} mai chiuso" for t, r in b.pila[:3]]
    # figure.codice: il pre e le voci della lista
    for fig in re.finditer(r'<figure class="codice"([^>]*)>(.*?)</figure>', testo, flags=re.S):
        titolo = attributo(fig.group(1), "data-titolo") or "?"
        corpo = fig.group(2)
        pre = re.search(r"<pre[^>]*>(.*?)</pre>", corpo, flags=re.S)
        if not pre:
            avvisi.append(f"{rel} «{titolo}»: codice senza <pre>")
            continue
        righe = testo_pre(pre.group(1))
        for n, li in enumerate(re.finditer(r"<li([^>]*)>", corpo), start=1):
            segni = attributo(li.group(1), "data-segna")
            indici = intervallo_righe(attributo(li.group(1), "data-righe") or "", len(righe))
            if segni:
                avvisi += verifica_segni(righe, indici, leggi_segni(segni), f"{rel} «{titolo}» passo {n}")
    # pre con evidenziazioni fuori dai componenti codice
    senza_codice = re.sub(r'<figure class="codice".*?</figure>', "", testo, flags=re.S)
    for pre in re.finditer(r"<pre([^>]*data-segna=\"[^\"]*\"[^>]*)>(.*?)</pre>", senza_codice, flags=re.S):
        righe = testo_pre(pre.group(2))
        avvisi += verifica_segni(righe, list(range(len(righe))), leggi_segni(attributo(pre.group(1), "data-segna")),
                                 f"{rel} pre «{righe[0][:30]}»")
    # scene dichiarate e definite
    for nome in re.findall(r'data-scena="([^"]+)"', testo):
        if not re.search(rf"\b{re.escape(nome)}\s*=\s*\{{|['\"]?{re.escape(nome)}['\"]?\s*:", testo):
            avvisi.append(f"{rel}: la scena {nome!r} non è definita nella pagina")
    return avvisi


# ---------------------------------------------------------------- sito

def controlla(sito: pathlib.Path) -> int:
    problemi = 0
    sito_js = sito / "assets" / "sito.js"
    if not sito_js.exists():
        print(f"  !! manca {sito_js.relative_to(RADICE)}")
        return 1
    sorgente = re.sub(r"/\*.*?\*/", "", sito_js.read_text(encoding="utf-8"), flags=re.S)
    menu = set(re.findall(r"""\bh\s*:\s*['"]([^'"]+)['"]""", sorgente))
    for h in sorted(menu):
        if not (sito / h).exists():
            print(f"  !! nel menu ma il file non esiste: {h}")
            problemi += 1
    pagine = sorted(p for p in sito.rglob("*.html") if "_archivio" not in p.parts)
    for p in pagine:
        rel = p.relative_to(sito).as_posix()
        if rel not in menu:
            print(f"  !! pagina fuori dal menu: {rel}")
            problemi += 1
        testo = p.read_text(encoding="utf-8")
        su = "../" * (len(p.relative_to(sito).parts) - 1)
        for risorsa in ("assets/atlas.css", "assets/tema.css", "assets/sito.js", "assets/atlas.js"):
            if f'"{su}{risorsa}"' not in testo:
                print(f"  !! {rel}: non carica {su}{risorsa}")
                problemi += 1
        for avviso in controlla_pagina(testo, rel):
            print(f"  !! {avviso}")
            problemi += 1
    print(f"  {len(pagine)} pagine, {len(menu)} voci nel menu, {problemi} problemi")
    return problemi


def main() -> None:
    sys.stdout.reconfigure(encoding="utf-8")
    argomenti = [a for a in sys.argv[1:] if not a.startswith("--")]
    solo_controllo = "--solo-controllo" in sys.argv
    totale = 0
    for nome in SITI:
        if argomenti and not any(a.lower() in nome.lower() for a in argomenti):
            continue
        sito = RADICE / nome
        if not sito.exists():
            print(f"-- {nome}: cartella assente, salto")
            continue
        print(f"-- {nome}")
        if not solo_controllo:
            copia(sito)
        totale += controlla(sito)
    sys.exit(1 if totale else 0)


if __name__ == "__main__":
    main()
