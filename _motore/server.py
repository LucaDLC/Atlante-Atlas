"""Server locale per provare gli atlanti nel browser, senza cache.

Uso (da qualsiasi cartella):
    python _motore/server.py          poi apri http://127.0.0.1:8766/
    python _motore/server.py 9000     per usare un'altra porta

I siti funzionano anche con doppio clic su index.html, ma in quel caso le spunte
"Segna come capita" restano solo nel browser. Con questo server le spunte vengono
anche salvate in _stato/capiti.json, e ogni spunta o rimozione va in _stato/storico-capiti.txt.
"""
import datetime
import functools
import http.server
import json
import os
import socketserver
import sys

RADICE = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
CARTELLA_STATO = os.path.join(RADICE, "_stato")
FILE_CAPITI = os.path.join(CARTELLA_STATO, "capiti.json")
STORICO = os.path.join(CARTELLA_STATO, "storico-capiti.txt")
PERCORSO_CAPITI = "/_stato/capiti"


class SenzaCache(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cache-Control", "no-store")
        super().end_headers()

    def _leggi_stato(self):
        if not os.path.exists(FILE_CAPITI):
            return {}
        with open(FILE_CAPITI, encoding="utf-8") as f:
            return json.load(f)

    def _rispondi_json(self, codice, dati):
        corpo = json.dumps(dati, ensure_ascii=False).encode("utf-8")
        self.send_response(codice)
        self.send_header("Content-Type", "application/json; charset=utf-8")
        self.send_header("Content-Length", str(len(corpo)))
        self.end_headers()
        self.wfile.write(corpo)

    def do_GET(self):
        if self.path.split("?")[0] == PERCORSO_CAPITI:
            self._rispondi_json(200, self._leggi_stato())
            return
        super().do_GET()

    def do_POST(self):
        if self.path.split("?")[0] != PERCORSO_CAPITI:
            self.send_error(404)
            return
        try:
            lunghezza = int(self.headers.get("Content-Length", 0))
            dati = json.loads(self.rfile.read(lunghezza).decode("utf-8"))
            sigla = str(dati["sigla"])
            capiti = list(dati["capiti"])
        except (ValueError, KeyError, TypeError):
            self.send_error(400)
            return
        stato = self._leggi_stato()
        stato[sigla] = capiti
        os.makedirs(CARTELLA_STATO, exist_ok=True)
        with open(FILE_CAPITI, "w", encoding="utf-8") as f:
            json.dump(stato, f, ensure_ascii=False, indent=2)
        ora = datetime.datetime.now().isoformat(timespec="seconds")
        esito = "segnata come capita" if dati.get("acceso") else "spunta tolta"
        with open(STORICO, "a", encoding="utf-8") as f:
            f.write(f"{ora}\t{sigla}\t{dati.get('pagina')}\t{esito}\n")
        self._rispondi_json(200, {"ok": True})


if __name__ == "__main__":
    porta = int(sys.argv[1]) if len(sys.argv) > 1 else 8766
    gestore = functools.partial(SenzaCache, directory=RADICE)
    with socketserver.ThreadingTCPServer(("127.0.0.1", porta), gestore) as s:
        print(f"Atlanti su http://127.0.0.1:{porta}/")
        print(f"Spunte salvate in {FILE_CAPITI}")
        s.serve_forever()
