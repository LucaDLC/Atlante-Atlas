<!doctype html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>{{t|s001|}}</title>
<link rel="stylesheet" href="../assets/atlas.css">
<link rel="stylesheet" href="../assets/tema.css">
<script src="../assets/sito.js"></script>
<script src="../assets/atlas.js" defer></script>
<script>
window.SCENE = window.SCENE || {};
SCENE.zip = {
  w: 520, h: 230, lato: false,
  legenda: '{{j|s002|'}}',
  codice: { lang: 'python', testo: `somma = 0
for x, y in zip(a, b):
    somma += x * y
return somma` },
  oggetti: [
    { id: 'ta', tipo: 'testo', x: 30, y: 58, t: 'a', size: 15, bold: true },
    { id: 'A', tipo: 'celle', x: 50, y: 38, cw: 60, ch: 40, valori: ['2', '2'] },
    { id: 'tb', tipo: 'testo', x: 30, y: 138, t: 'b', size: 15, bold: true },
    { id: 'B', tipo: 'celle', x: 50, y: 118, cw: 60, ch: 40, valori: ['3', '4'] },
    { id: 'tz', tipo: 'testo', x: 330, y: 40, t: 'zip(a, b)', size: 13 },
    { id: 'Z', tipo: 'celle', x: 250, y: 58, cw: 80, ch: 40, valori: ['', ''], indici: false },
    { id: 'n', tipo: 'testo', x: 330, y: 150, t: 'somma = 0', size: 15, bold: true, tono: 'ok' }
  ],
  passi: [
    { nota: '{{j|s003|'}}', righe: [1] },
    { nota: '{{j|s004|'}}', righe: [2], set: { A: { toni: { 0: 'dato' } }, B: { toni: { 0: 'due' } }, Z: { valori: ['(2, 3)', ''], toni: { 0: 'ora' } } } },
    { nota: '{{j|s005|'}}', righe: [3], set: { n: { t: 'somma = 0 + 2·3 = 6' } } },
    { nota: '{{j|s006|'}}', righe: [2], set: { A: { toni: { 1: 'dato' } }, B: { toni: { 1: 'due' } }, Z: { valori: ['(2, 3)', '(2, 4)'], toni: { 1: 'ora' } } } },
    { nota: '{{j|s007|'}}', righe: [3, 4], set: { n: { t: 'somma = 6 + 2·4 = 14' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 14 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const C = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 50, valori: vals }, extra || {});
  const G = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'griglia', x, y, cw: 50, ch: 32, valori: vals }, extra || {});

  // 1. notebook in VS Code
  const passi5 = ['estensioni Python e Jupyter', 'Open Folder: la cartella W02', 'apri il file .ipynb', 'Select Kernel: anaconda3', 'Shift + Invio, in ordine'];
  const og1 = [];
  passi5.forEach((t, i) => og1.push(R('b' + i, 150, 14 + i * 46, 300, 36, (i + 1) + '. ' + t, { nascosto: i > 0 })));
  passi5.slice(1).forEach((_, i) => og1.push({ id: 'f' + i, tipo: 'vett', x1: 300, y1: 51 + i * 46, x2: 300, y2: 59 + i * 46, t: '', nascosto: true }));
  const vai = k => Object.assign(Object.fromEntries(passi5.map((_, i) => ['b' + i, { nascosto: i > k, tono: i === k ? 'ora' : (i < k ? 'ok' : null) }])), Object.fromEntries(passi5.slice(1).map((_, i) => ['f' + i, { nascosto: i >= k }])));
  SCENE.notebook = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: og1,
    passi: [
      { nota: "Una volta sola: in VS Code si installano le estensioni <b>Python</b> e <b>Jupyter</b> di Microsoft.", set: vai(0) },
      { nota: "<b>File → Open Folder</b> sulla cartella della settimana (per esempio <code>IML2026/vscode/03-week/W02</code>), non il file da solo: così il notebook vede i dati e i moduli come <code>util_poses.py</code>.", set: vai(1) },
      { nota: "Si apre il notebook <code>.ipynb</code>.", set: vai(2) },
      { nota: "In alto a destra <b>Select Kernel</b> → <b>Python Environments</b> → quello di Anaconda, che ha già NumPy, Matplotlib e seaborn. Il kernel è il Python che esegue le celle.", set: vai(3) },
      { nota: "Si eseguono le celle con <b>Shift + Invio</b>, <b>in ordine</b>: le variabili vivono nella memoria del kernel, quindi una cella che usa <code>np</code> fallisce se non è stata eseguita prima quella con <code>import numpy as np</code>. Riaprendo il notebook, si riparte dall'inizio.", set: vai(4) }
    ]
  };

  // 2. dove Python cerca i moduli
  SCENE.percorso = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      R('w02', 40, 30, 220, 36, 'W02/', { tono: 'dato' }),
      R('nb', 70, 80, 190, 30, '01-poses.ipynb'), R('up', 70, 120, 190, 30, 'util_poses.py', { tono: 'ok' }),
      R('alt', 320, 30, 220, 36, 'Desktop/', { tono: 'dato' }), R('nb2', 350, 80, 190, 30, 'copia.ipynb'),
      T('cwd', 300, 190, '', { bold: true, size: 13 }), T('msg', 300, 222, '', { size: 13 })
    ],
    passi: [
      { nota: "<code>import util_poses</code> non installa niente: cerca un <b>file</b> <code>util_poses.py</code>. Python lo cerca prima di tutto nella <b>cartella di lavoro</b> del notebook." },
      { nota: "Se il notebook gira dalla cartella W02, che contiene <code>util_poses.py</code>, l'import funziona.", set: { w02: { tono: 'ora' }, nb: { tono: 'ora' }, cwd: { t: 'os.getcwd() → …/W02' }, msg: { t: 'import util_poses ✓', tono: 'ok' } } },
      { nota: "Se invece il notebook gira da un'altra cartella (una copia sul Desktop), il file non c'è: <code>ModuleNotFoundError: No module named 'util_poses'</code>.", set: { w02: { tono: 'dato' }, nb: { tono: null }, alt: { tono: 'ora' }, nb2: { tono: 'ora' }, up: { tono: 'no' }, cwd: { t: 'os.getcwd() → …/Desktop' }, msg: { t: 'ModuleNotFoundError', tono: 'no' } } },
      { nota: "Rimedi: aprire il notebook dentro W02, oppure aggiungere la cartella all'elenco di ricerca prima dell'import: <code>import sys; sys.path.append(r\"…\\W02\")</code>. Il controllo si fa con <code>import os; print(os.getcwd())</code> (provato con un modulo di prova).", set: { up: { tono: 'ok' }, msg: { t: 'sys.path.append(…/W02) → import ✓', tono: 'ok' } } }
    ]
  };

  // 3. indici di una lista
  SCENE.indicilista = {
    w: 560, h: 200, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      T('t', 170, 26, 'a = [2, 2, 5]', { bold: true }),
      C('a', 95, 44, ['2', '2', '5'], { etichette: ['0', '1', '2'] }),
      T('neg', 170, 128, '', { size: 12 }), T('c', 420, 60, '', { bold: true, size: 16 }), T('c2', 420, 100, '', { size: 13 })
    ],
    passi: [
      { nota: "Una lista di 3 elementi. Sotto ogni casella il suo <b>indice</b>: si parte da <b>0</b>." },
      { nota: "<code>a[0]</code> è il primo elemento: 2.", set: { a: { toni: { 0: 'ora' } }, c: { t: 'a[0] = 2' } } },
      { nota: "<code>a[2]</code> è il terzo: 5. L'ultimo indice è sempre len(a) − 1; <code>a[3]</code> darebbe <code>IndexError</code>.", set: { a: { toni: { 2: 'ora' } }, c: { t: 'a[2] = 5' }, c2: { t: 'a[3] → IndexError' } } },
      { nota: "Gli indici negativi contano dalla fine: <code>a[-1]</code> è l'ultimo (5), <code>a[-3]</code> il primo. In una matrice NumPy servono due indici: <code>M[i, j]</code>.", set: { a: { toni: { 2: 'ora' } }, neg: { t: 'da destra: −3, −2, −1' }, c: { t: 'a[−1] = 5' }, c2: { t: '' } } }
    ]
  };

  // 5. il bug di va e vb
  SCENE.bugdot = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      R('fuori', 20, 20, 170, 60, 'va = [2, 2]   vb = [3, 4]', { tono: 'no' }),
      R('f', 260, 100, 300, 110, ''),
      T('ft', 410, 118, 'def dot(a, b):', { bold: true, size: 13 }),
      T('fl', 410, 150, 'for x, y in zip(va, vb):', { size: 13, tono: 'no' }),
      T('fs', 410, 180, 's += x * y', { size: 13 }),
      R('arg', 20, 120, 170, 44, 'dot([1, 2], [3, 4])', { tono: 'dato' }),
      { id: 'a1', tipo: 'vett', x1: 192, y1: 142, x2: 258, y2: 130, t: 'a, b' },
      { id: 'a2', tipo: 'vett', x1: 190, y1: 60, x2: 300, y2: 142, t: '', tono: 'no', nascosto: true },
      T('c', 300, 236, '', { bold: true })
    ],
    passi: [
      { nota: "La versione della chat: nessun errore, ma risultato sbagliato. La chiamata passa [1, 2] e [3, 4], che dentro la funzione si chiamano <b>a</b> e <b>b</b>." },
      { nota: "Il ciclo però legge <b>va</b> e <b>vb</b>: le variabili di fuori, non i parametri. Python le trova comunque (sono globali), quindi non protesta.", set: { a2: { nascosto: false } } },
      { nota: "Risultato: dot([1, 2], [3, 4]) = 2·3 + 2·4 = <b>14</b>, invece di 1·3 + 2·4 = 11. Qualunque vettore si passi, calcola sempre va · vb. Il test <code>dot(va, vb) == 14</code> passa per caso (eseguito).", set: { c: { t: 'dot([1, 2], [3, 4]) = 14 ✗  (giusto: 11)', tono: 'no' } } },
      { nota: "Correzione: dentro la funzione usare <b>solo i parametri</b>, <code>zip(a, b)</code>. E fare sempre un test con vettori <b>diversi</b> da quelli di esempio.", set: { fl: { t: 'for x, y in zip(a, b):', tono: 'ok' }, a2: { nascosto: true }, fuori: { tono: 'spento' }, c: { t: 'dot([1, 2], [3, 4]) = 11 ✓', tono: 'ok' } } }
    ]
  };

  // 6. tupla contro lista di coppie
  SCENE.tupla = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      T('t1', 150, 28, 'ms = 4, 6, 7', { bold: true }), C('m', 75, 42, ['4', '6', '7'], { indici: false, toni: { 0: 'dato', 1: 'dato', 2: 'dato' } }),
      T('t2', 150, 128, '', { bold: true }), C('p', 50, 142, ['(0, 1)', '(2, 3)'], { indici: false, cw: 100, nascosto: true }),
      T('c1', 450, 60, '', { size: 13 }), T('c2', 450, 90, '', { size: 13, bold: true }), T('c3', 450, 160, '', { size: 13 }), T('c4', 450, 190, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "Le virgole senza parentesi creano una <b>tupla</b>: <code>ms = 4, 6, 7</code> è (4, 6, 7), tre numeri. Non tre coppie." },
      { nota: "<code>for i, j in ms:</code> prende un elemento alla volta. Il primo è <b>4</b>, e <code>i, j</code> prova a spezzarlo in due valori.", set: { m: { toni: { 0: 'ora', 1: 'dato', 2: 'dato' } }, c1: { t: 'primo giro: 4 → i, j ?' } } },
      { nota: "Un numero non si spezza: <code>TypeError: cannot unpack non-iterable int object</code> (errore vero).", set: { m: { toni: { 0: 'no', 1: 'dato', 2: 'dato' } }, c2: { t: 'TypeError', tono: 'no' } } },
      { nota: "Per scorrere coppie serve una <b>lista di coppie</b>: <code>ms = [(0, 1), (2, 3)]</code>. Ogni elemento è una coppia, e <code>i, j</code> la spacchetta: primo giro i = 0, j = 1.", set: { t2: { t: 'ms = [(0, 1), (2, 3)]' }, p: { nascosto: false, toni: { 0: 'ora' } }, c3: { t: 'primo giro: (0, 1) → i = 0, j = 1' }, c4: { t: 'ok', tono: 'ok' } } }
    ]
  };

  // 7. matrice delle distanze
  const Dm = [['0', '2.24', '4', '5'], ['2.24', '0', '3.61', '3.16'], ['4', '3.61', '0', '3'], ['5', '3.16', '3', '0']];
  const vuota = [['', '', '', ''], ['', '', '', ''], ['', '', '', ''], ['', '', '', '']];
  const riga = r => Dm.map((rr, i) => i <= r ? rr : ['', '', '', '']);
  SCENE.distanze = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s013|'}}',
    oggetti: [
      T('tt', 140, 22, 'res: 4 × 4 (4 pose)', { bold: true, size: 13 }),
      G('D', 20, 34, vuota, { intR: ['A', 'B', 'C', 'D'], intC: ['A', 'B', 'C', 'D'], cwR: 30, cw: 52 }),
      T('c1', 450, 50, '', { size: 13 }), T('c2', 450, 80, '', { size: 13 }), T('c3', 450, 130, '', { size: 12 }), T('c4', 450, 160, '', { size: 12 }), T('c5', 450, 200, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "La stessa costruzione dell'esercizio delle pose (18 × 18), in piccolo: 4 punti A, B, C, D e la matrice <code>res</code> delle loro distanze, riempita con due cicli." },
      { nota: "<code>i = 0</code>: il ciclo interno scorre tutti i j e riempie la riga di A.", set: { D: { valori: riga(0), toni: { '0,0': 'ora', '0,1': 'ora', '0,2': 'ora', '0,3': 'ora' } }, c1: { t: 'for i … for j …' } } },
      { nota: "Tutte le righe. La <b>diagonale</b> è 0 (ogni punto da sé stesso) e la matrice è <b>simmetrica</b>: res[i, j] = res[j, i].", set: { D: { valori: Dm, toni: { '0,0': 'ok', '1,1': 'ok', '2,2': 'ok', '3,3': 'ok' } }, c2: { t: 'diagonale 0, simmetrica' } } },
      { nota: "Metà della matrice ripete l'altra. <code>mask = np.triu(np.ones_like(res))</code> segna il triangolo in alto (diagonale compresa), e la heatmap lo nasconde.", set: { D: { toni: { '0,0': 'spento', '0,1': 'spento', '0,2': 'spento', '0,3': 'spento', '1,1': 'spento', '1,2': 'spento', '1,3': 'spento', '2,2': 'spento', '2,3': 'spento', '3,3': 'spento' } }, c3: { t: 'np.triu: triangolo in alto nascosto' } } },
      { nota: "<code>np.triu_indices(4, k=1)</code> elenca ogni coppia una volta sola (6 coppie; con 18 pose sono 153), e <code>argsort</code> le ordina: la più vicina è A-B (2.24), la più lontana A-D (5). Numeri calcolati con NumPy.", set: { D: { toni: { '1,0': 'ok' } }, c4: { t: 'A-B 2.24, C-D 3, B-D 3.16, …' }, c5: { t: 'più simili: A e B', tono: 'ok' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s014|}}</h1>
  <p class="lede">{{s|s015|}}</p>
</header>

<section>
  <h2>{{s|s016|}}</h2>
  <div class="box domanda-tua" data-tit="{{a|s017|}}">
    <ol>
      <li>{{s|s018|}}</li>
      <li>{{s|s019|}}</li>
      <li>{{s|s020|}}</li>
      <li>{{s|s021|}}</li>
      <li>{{s|s022|}}</li>
    </ol>
  </div>
  <figure class="scena" data-scena="notebook" data-titolo="{{a|s023|}}"></figure>
</section>

<section>
  <h2>{{s|s024|}}</h2>
  <div class="errori">
    <div class="errore">
<pre data-lang="python">import numpy as np
import matplotlib.pyplot as plt
import util_poses</pre>
<pre class="msg">ModuleNotFoundError: No module named 'util_poses'</pre>
      <div class="fix"><p>{{s|s025|}}</p>
      <p>{{s|s026|}}</p></div>
    </div>
  </div>
  <figure class="scena" data-scena="percorso" data-titolo="{{a|s027|}}"></figure>
</section>

<section>
  <h2>{{s|s028|}}</h2>
  <div class="box domanda-tua" data-tit="{{a|s029|}}">
    <p>{{s|s030|}}</p>
  </div>
  <figure class="scena" data-scena="indicilista" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <p>{{s|s033|}}</p>
  <figure class="codice" data-titolo="{{a|s034|}}">
<pre data-lang="python">def dot(a, b):
    if len(a) != len(b):
        raise ValueError("vectors must have the same length")
    somma = 0
    for x, y in zip(a, b):
        somma += x * y
    return somma

va = [2, 2]
vb = [3, 4]
dot(va, vb)          # 14
dot([1, 2], [3, 4])  # 11</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="def@ora|(a, b)@dato"><p>{{s|s035|}}</p></li>
      <li data-righe="2-3" data-segna="len(a) != len(b)@ora|raise@no"><p>{{s|s036|}}</p></li>
      <li data-righe="4" data-segna="somma = 0@ok"><p>{{s|s037|}}</p></li>
      <li data-righe="5" data-segna="zip(a, b)@ora|x, y@dato"><p>{{s|s038|}}</p></li>
      <li data-righe="6" data-segna="+=@ora"><p>{{s|s039|}}</p></li>
      <li data-righe="7" data-segna="return@ok"><p>{{s|s040|}}</p></li>
      <li data-righe="9-12" data-segna="dot([1, 2], [3, 4])@ok"><p>{{s|s041|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s042|}}">
    <div class="passo"><div class="espr"><mark class="ok">somma</mark> = 0</div><p class="nota">{{s|s043|}}</p></div>
    <div class="passo"><div class="espr">giro 1: x = <mark class="dato">2</mark>, y = <mark class="due">3</mark>   <mark class="ok">somma</mark> = 0 + 2·3 = 6</div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">giro 2: x = <mark class="dato">2</mark>, y = <mark class="due">4</mark>   <mark class="ok">somma</mark> = 6 + 2·4 = 14</div><p class="nota">{{s|s045|}}</p></div>
    <div class="passo"><div class="espr">return <mark class="ok">14</mark></div><p class="nota">{{s|s046|}}</p></div>
  </figure>
  <figure class="scena" data-scena="zip" data-titolo="{{a|s047|}}"></figure>
  <div class="box basi" data-tit="{{a|s048|}}">
    <p>{{s|s049|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <div class="errori">
    <div class="errore">
<pre data-lang="python">for a, b in zip(va, vb) (InnerProductSum += a * b)</pre>
<pre class="msg">    for a, b in zip(va, vb) (InnerProductSum += a * b)
                                             ^^
SyntaxError: invalid syntax</pre>
      <div class="fix"><p>{{s|s051|}}</p></div>
    </div>
    <div class="errore">
<pre data-lang="python">for a, b in zip(va, vb):
    InnerProductSum += a * b</pre>
<pre class="msg">&gt;&gt;&gt; dot([1, 2], [3, 4])
14</pre>
      <div class="fix"><p>{{s|s052|}}</p></div>
    </div>
    <div class="errore">
<pre data-lang="python">for x in [1, 2]
    print(x)</pre>
<pre class="msg">SyntaxError: expected ':'</pre>
      <div class="fix"><p>{{s|s053|}}</p></div>
    </div>
    <div class="errore">
<pre data-lang="python">n = 0
for x in [1, 2]:
    n =+ 1</pre>
<pre class="msg">&gt;&gt;&gt; n
1</pre>
      <div class="fix"><p>{{s|s054|}}</p></div>
    </div>
  </div>
  <figure class="scena" data-scena="bugdot" data-titolo="{{a|s055|}}"></figure>
</section>

<section>
  <h2>{{s|s056|}}</h2>
  <div class="box domanda-tua" data-tit="{{a|s057|}}">
    <p>{{s|s058|}}</p>
  </div>
  <div class="errori">
    <div class="errore">
<pre data-lang="python">ms = 4, 6, 7
for i, j in ms:
    plot_pair(poses[i], poses[j])</pre>
<pre class="msg">TypeError: cannot unpack non-iterable int object</pre>
      <div class="fix"><p>{{s|s059|}}</p></div>
    </div>
  </div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s060|}}</th><th>{{s|s061|}}</th><th>{{s|s062|}}</th></tr></thead>
    <tbody>
      <tr><td><code>[4, 6, 7]</code></td><td>{{s|s063|}}</td><td>{{s|s064|}}</td></tr>
      <tr><td>{{s|s065|}}</td><td>{{s|s066|}}</td><td>{{s|s067|}}</td></tr>
      <tr><td><code>[(4, 6), (6, 7)]</code></td><td>{{s|s068|}}</td><td>{{s|s069|}}</td></tr>
      <tr><td>{{s|s070|}}</td><td>{{s|s071|}}</td><td>{{s|s072|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="tupla" data-titolo="{{a|s073|}}"></figure>
</section>

<section>
  <h2>{{s|s074|}}</h2>
  <p>{{s|s075|}}</p>
  <figure class="codice" data-titolo="{{a|s076|}}">
<pre data-lang="python">res = np.zeros((18, 18))
for i in range(18):
    for j in range(18):
        res[i, j] = np.linalg.norm(poses[i] - poses[j])

mask = np.triu(np.ones_like(res))
sns.heatmap(res, annot=True, mask=mask)

righe, colonne = np.triu_indices(18, k=1)
d = res[righe, colonne]
ordine = np.argsort(d)</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="np.zeros((18, 18))@ok"><p>{{s|s077|}}</p></li>
      <li data-righe="2-4" data-segna="res[i, j]@ok|poses[i] - poses[j]@dato"><p>{{s|s078|}}</p></li>
      <li data-righe="6-7" data-segna="np.triu@ora|mask=mask@ora"><p>{{s|s079|}}</p></li>
      <li data-righe="9-11" data-segna="k=1@due|np.argsort(d)@ok"><p>{{s|s080|}}</p></li>
    </ol>
  </figure>
  <div class="errori">
    <div class="errore">
<pre data-lang="python">res = np.linalg.norm(poses[0] - poses[1])
t = np.triu(np.ones_like(res))</pre>
<pre class="msg">TypeError: tri() missing 1 required positional argument: 'N'</pre>
      <div class="fix"><p>{{s|s081|}}</p></div>
    </div>
    <div class="errore">
<pre data-lang="python">D = iml_util.gen_data_subject_0()      # in una cella più in alto
...
results_linear = results_for_model(LinearGaze(), D, D, ...)   # cella del Task 4</pre>
<pre class="msg">NameError: name 'D' is not defined</pre>
      <div class="fix"><p>{{s|s082|}}</p></div>
    </div>
  </div>
  <figure class="scena" data-scena="distanze" data-titolo="{{a|s083|}}"></figure>
</section>

<section>
  <h2>{{s|s084|}}</h2>
  <p>{{s|s085|}}</p>
  <p>{{s|s086|}}</p>
  <p>{{s|s087|}}</p>
  <figure class="codice" data-titolo="{{a|s088|}}">
<pre data-lang="python">class Base:
    def calibra(self, dati):
        ...                              # segnaposto: non fa nulla
    def predici(self, p):
        ...
    def predici_molti(self, ps):         # scritto una volta, usa self.predici
        return [self.predici(p) for p in ps]

class Lineare(Base):                     # eredita predici_molti da Base
    def calibra(self, dati):
        self.k = dati                    # salva il dato nell'oggetto
        return self.k
    def predici(self, p):
        return p * self.k

b = Base()
print(b.calibra(3), b.predici(2))        # None None
l = Lineare()
l.calibra(3)
print(l.predici_molti([1, 2]))           # [3, 6]</pre>
  </figure>
  <div class="box attenzione" data-tit="{{a|s089|}}">
    <p>{{s|s090|}}</p>
  </div>
</section>

</main>
</body>
</html>
