# Come è fatto questo atlante

Sito statico: si apre con doppio clic su `index.html`, senza installare niente.
Serve internet solo per i font (senza, usa quelli di sistema).

Questo file è identico in ogni atlante e viene copiato da `[ATLANTI]/_motore/LEGGIMI.md`.
Ogni atlante parla di **una sola materia**: non mettere contenuti di un corso nel sito di un altro.

## Cartelle

```
Atlante <materia>/
  index.html          home del corso (info ufficiali, scadenze, orari, calendario, mappa)
  teoria/*.html       una pagina per argomento
  esame/*.html        formato, regole, vecchie prove, allenamento
  assets/sito.js      MENU, calendario, scadenze, orari, data d'esame   ← si modifica a mano
  assets/tema.css     colore di copertina del sito               ← si modifica a mano
  assets/atlas.css    stile comune      ← NON modificare qui: si modifica _motore/atlas.css
  assets/atlas.js     componenti comuni ← NON modificare qui: si modifica _motore/atlas.js
  _archivio/          vecchie versioni, non fanno parte del sito
```

Sopra gli atlanti c'è la **homepage** `[ATLANTI]/index.html` («Atlante Atlas»): collega i quattro atlanti e mostra,
in una pagina, le materie, le scadenze imminenti di tutti i corsi, gli esami con il conto alla rovescia, il
calendario di tutti i corsi, gli orari della settimana e i punti da confermare. Legge `assets/sito.js` di ogni
atlante: non va modificata a mano quando cambia un corso. Il menu di ogni atlante ha in cima la voce
«Mostra gli altri atlanti», che riporta alla homepage (è in `_motore/atlas.js`).

### Dati in `assets/sito.js`

| campo | cosa contiene |
|---|---|
| `esame` | `data` (ISO con ora), `etichetta`, `ora`: alimenta il conto alla rovescia |
| `calendario` | una voce per lezione: `da` (lunedì della settimana), `t`, `sub`, `h`; `pausa`, `esame`, `giorni`, `etichetta` per i casi speciali |
| `lezioneDopo` | giorni tra `da` e il giorno di lezione (es. AlgDes 3 = giovedì), per mostrare la data giusta |
| `task` | scadenze: `data`, `ora`, `t`, `nota`, `tipo` (`consegna`, `orale`, `test`, `azione`, `tappa`), `provvisoria`, `facoltativa`, `soloSettimana` |
| `orario` | `giorno`, `quando` (con ora e aula), `nota` |
| `daConfermare` | punti che la documentazione ufficiale non chiarisce |

Nella home di ogni atlante: `<ul class="scadenze" data-auto data-max="6">`, `<div class="orario" data-auto>`,
`<ul class="settimane" data-auto>`, `<ul class="da-confermare" data-auto>`. Le scadenze non hanno spunta:
lo stato dipende solo dalla data di oggi.

**Spunte «Segna come capita»**: ogni pagina di teoria ha il pulsante in fondo, e il ✓ compare nel menu.
Le spunte restano nel browser e, se l'atlante è aperto con `python _motore/server.py`, vengono anche
salvate in `_stato/capiti.json`. Ogni spunta o rimozione viene registrata in `_stato/storico-capiti.txt`
(data, atlante, pagina, esito). Con il doppio clic su `index.html` il file non si può scrivere: le spunte
restano solo nel browser.

## Aggiungere o modificare contenuti

1. **Nuova pagina**: copia una pagina esistente della stessa cartella (così i percorsi `../assets/` sono giusti),
   cambia `<title>`, `h1`, `lede` e le sezioni. Poi aggiungila al menu in `assets/sito.js`:
   `{ t: 'Titolo nel menu', h: 'teoria/nome-file.html' }` dentro il gruppo giusto.
2. **Argomento non ancora pubblicato**: `{ t: 'S5 · State monad', arriva: '22 set' }`.
3. **Dopo ogni modifica** lancia dalla cartella `[ATLANTI]`:
   `python _motore/sync.py` → copia il motore e controlla menu, link, tag chiusi, evidenziazioni.
   Deve finire con `0 problemi`.
4. **Codice**: ogni frammento di codice e ogni messaggio d'errore va **compilato davvero** prima di metterlo
   (ADPRO: scala-cli con `-Werror -source:future`; PCPP: Java/Gradle; IML: Python). Se non l'hai verificato, non scrivere "verificato".
5. Per provare nel browser senza cache: `python _motore/server.py` e apri http://127.0.0.1:8766/

## Stile delle spiegazioni (vale per tutto)

- Un passo = una sola cosa che cambia, con il perché. Diretto, frasi brevi, niente riempitivi.
- Parti dalle basi e spiega ogni simbolo. Mai dare per scontato.
- I colori hanno sempre lo stesso ruolo:
  `ora` arancio = cosa cambia adesso · `dato` blu = il dato di partenza · `due` viola = secondo ruolo ·
  `ok` verde = il risultato · `no` rosso = scartato o sbagliato.
- Codice: blocco → riga per riga ("uso X perché…") → logica passo passo.
- Termini tecnici in inglese tra parentesi la prima volta; frase pronta in inglese per l'esame dove serve.

## Completezza (regola dell'utente, 25 set 2026)

- Ogni **argomento** (pagina) e ogni **sottoargomento** (sezione `<h2>`) ha una **spiegazione dettagliata** in prosa
  (basi, ogni simbolo, il perché) **e una sua animazione** (`figure.scena`, o i costruttori interattivi di PCPP).
- L'elenco degli argomenti viene dal materiale ufficiale del corso (slide, learning goals, dispense), non solo dagli esercizi.
- **Niente quiz**: gli atlanti spiegano, non interrogano. Le soluzioni degli esercizi possono stare in `details`,
  le risposte modello d'esame restano visibili.
- La parte pratica (esercizi, codice dell'utente) resta, in aggiunta alla teoria.

## Scheletro di una pagina

```html
<!doctype html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Titolo</title>
<link rel="stylesheet" href="../assets/atlas.css">
<link rel="stylesheet" href="../assets/tema.css">
<script src="../assets/sito.js"></script>
<script src="../assets/atlas.js" defer></script>
</head>
<body>
<main class="pagina">
  <header class="testa">
    <h1>Titolo</h1>
    <p class="lede">Cosa impari, in due frasi.</p>
  </header>
  <section>
    <h2>Prima sezione</h2>
    …
  </section>
</main>
</body>
</html>
```

Sidebar, occhiello, indice della pagina, "segna come capita" e pagine prima/dopo li aggiunge il motore da solo.

## Componenti

### Passi (il foglio Papyro)

Righe che si scrivono una sotto l'altra con Avanti/Indietro/Riproduci/Tutti i passi.

```html
<figure class="passi" data-titolo="factorial(3)" data-legenda="dato:n,ok:risultato">
  <div class="passo">
    <div class="espr">3 * <mark class="ora">factorial(2)</mark></div>
    <p class="nota">Perché succede questo passo.</p>
  </div>
</figure>
```

- `div.espr` è monospazio e rispetta a capo e spazi. Per testo normale: `<div class="espr testo">`.
- `data-modo="sostituisci"`: mostra solo il passo corrente (utile per versioni successive dello stesso codice).
- `data-inizio="tutti"`: parte già con tutti i passi visibili.
- Dentro `espr` scrivi `&lt;` al posto di `<`.

### Codice smontato

Un blocco di codice e una spiegazione per passo, con le righe accese.

```html
<figure class="codice" data-titolo="map su Option">
<pre data-lang="scala">def map[B](f: A => B): Option[B] = this match
  case None => None
  case Some(a) => Some(f(a))</pre>
  <div class="intro"><p>(facoltativo) primo passo senza righe accese</p></div>
  <ol class="spiega">
    <li data-righe="3" data-segna="Some(a)@dato|f(a)@ok"><p>Spiegazione.</p></li>
  </ol>
</figure>
```

- `data-righe`: `3`, `1-3`, `1,4-5`.
- `data-segna`: testi da evidenziare, separati da `|`, nelle righe indicate.
  `testo@ruolo` (ruolo di default `ora`), `testo#2@ruolo` = seconda occorrenza, `testo*@ruolo` = tutte.
  Un testo non può contenere `|` e non deve finire con `*` (aggiungi uno spazio: `n * @no`).
- Lingue: `scala`, `java`, `python`, `erlang`, `fsharp`, `pseudo`.
- `data-segna` funziona anche su `<pre class="cod" data-lang="…">` semplici.

### Scena (animazione SVG)

```html
<figure class="scena" data-scena="bfs" data-titolo="BFS da s"></figure>
<script>
window.SCENE = window.SCENE || {};
SCENE.bfs = {
  w: 520, h: 300,                         // dimensioni del disegno
  lato: true,                             // false = nota sotto il disegno
  legenda: 'ora:in visita,ok:visitato',   // facoltativa
  codice: { lang: 'pseudo', testo: `…` }, // facoltativo, righe accese con passi[i].righe
  oggetti: [
    { id: 's', tipo: 'nodo', x: 60, y: 80, t: 's' },
    { id: 'sa', tipo: 'arco', da: 's', a: 'a', dir: true, t: '3' }
  ],
  passi: [
    { nota: '<p>…</p>', righe: [2], set: { s: { tono: 'ora', sotto: 'd=0' }, sa: { tono: 'ok' } } }
  ]
};
</script>
```

Ogni passo applica `set` sopra lo stato del passo prima. Proprietà comuni: `tono` (`ora|dato|due|ok|no|spento|null`),
`nascosto`, `t` (etichetta). Le posizioni (x, y, x1…, w, h) scorrono con un'animazione.

| tipo | proprietà |
|---|---|
| `nodo` | `x, y, r, t, sotto, sopra, forma:'quadrato'` |
| `arco` | `da, a, dir, t, curva` (si aggancia ai nodi) |
| `rett` | `x, y, w, h, t` |
| `testo` | `x, y, t, size, bold, anchor:'start'` |
| `linea` / `vett` | `x1, y1, x2, y2, tratt` / freccia con `t, tx, ty` |
| `punto` | `x, y, r, t` |
| `celle` | `x, y, cw, ch, valori:[…], toni:{indice:'ora'}, etichette:[…], indici:false` |
| `griglia` | `x, y, cw, ch, valori:[[…]], toni:{'r,c':'ok'}, intR:[…], intC:[…]` |
| `assi` | `box:[x,y,w,h], dom:[xmin,xmax,ymin,ymax], tacche, etX, etY` (tacche: un numero per tutti e due gli assi, oppure `[passoX, passoY]`) |
| `poli` | `punti:[[x,y],…]`, `vuoto:true` = solo contorno |

Con `in: 'idAssi'` punti, vettori, linee, testi e poligoni usano le coordinate del grafico invece dei pixel.
`toni` di celle/griglia viene sostituito per intero a ogni `set`.

### Riquadri

```html
<div class="box idea" data-tit="L'idea">…</div>
```

Tipi: `idea`, `regola`, `attenzione`, `esame` (all'esame), `inglese` (frase in inglese), `basi` (se vieni da…),
`domanda-tua` (dubbi chiesti in chat).

### Soluzioni a comparsa (solo per gli esercizi)

```html
<details class="soluzione"><summary>Mostra la soluzione</summary><div>…</div></details>
```

### Errori tipici

```html
<div class="errori">
  <div class="errore">
    <pre data-lang="scala">codice sbagliato</pre>
    <pre class="msg">messaggio vero del compilatore</pre>
    <div class="fix">Cosa vuol dire e come si sistema.</div>
  </div>
</div>
```

### Altro

- Tabelle: `<div class="tab-wrap"><table class="tab">…</table></div>`
- Confronti: `<div class="colonne"><div class="carta buona|cattiva|media"><h4>…</h4>…</div></div>`
- Matematica in HTML: `<span class="m">x<sub>i</sub></span>`, frazioni `<span class="frac"><span>a</span><span>b</span></span>`,
  matrici `<span class="mat" style="grid-template-columns:repeat(2,auto)"><span>1</span>…</span>`, blocco centrato `<div class="mblock">…</div>`.
- Home: `<div class="conto" data-auto>`, `<ul class="settimane" data-auto>`, `<div class="mappa" data-auto data-sezione="Teoria">`.
