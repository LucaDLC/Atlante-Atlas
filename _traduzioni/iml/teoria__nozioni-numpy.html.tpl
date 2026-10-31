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
SCENE.asse = {
  w: 540, h: 262, lato: false,
  legenda: '{{j|s002|'}}',
  codice: { lang: 'python', testo: `M = np.array([[1, 2], [3, 4], [5, 6]])
M.mean(axis=0)          # array([3., 4.])
M.mean(axis=1)          # array([1.5, 3.5, 5.5])
M - M.mean(axis=0)      # [[-2, -2], [0, 0], [2, 2]]` },
  oggetti: [
    { id: 'M', tipo: 'griglia', x: 40, y: 60, cw: 50, ch: 40, valori: [['1', '2'], ['3', '4'], ['5', '6']] },
    { id: 'tM', tipo: 'testo', x: 90, y: 42, t: 'M   (3 × 2)', size: 14, bold: true },
    { id: 'r0', tipo: 'griglia', x: 40, y: 206, cw: 50, ch: 36, valori: [['', '']], nascosto: true },
    { id: 't0', tipo: 'testo', x: 152, y: 226, t: 'axis=0 → una media per colonna', size: 13, anchor: 'start', nascosto: true },
    { id: 'r1', tipo: 'griglia', x: 172, y: 60, cw: 56, ch: 40, valori: [[''], [''], ['']], nascosto: true },
    { id: 't1', tipo: 'testo', x: 200, y: 42, t: 'axis=1', size: 14, bold: true, nascosto: true },
    { id: 'C', tipo: 'griglia', x: 330, y: 60, cw: 50, ch: 40, valori: [['−2', '−2'], ['0', '0'], ['2', '2']], nascosto: true },
    { id: 'tC', tipo: 'testo', x: 380, y: 42, t: 'M − M.mean(axis=0)', size: 14, bold: true, nascosto: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}', righe: [1] },
    { nota: '{{j|s004|'}}', righe: [2], set: { M: { toni: { '0,0': 'ora', '1,0': 'ora', '2,0': 'ora' } }, r0: { nascosto: false, valori: [['3', '']], toni: { '0,0': 'ok' } }, t0: { nascosto: false } } },
    { nota: '{{j|s005|'}}', righe: [2], set: { M: { toni: { '0,1': 'ora', '1,1': 'ora', '2,1': 'ora' } }, r0: { valori: [['3', '4']], toni: { '0,0': 'ok', '0,1': 'ok' } } } },
    { nota: '{{j|s006|'}}', righe: [3], set: { M: { toni: { '0,0': 'due', '0,1': 'due', '1,0': 'due', '1,1': 'due', '2,0': 'due', '2,1': 'due' } }, r0: { toni: {} }, r1: { nascosto: false, valori: [['1.5'], ['3.5'], ['5.5']], toni: { '0,0': 'ok', '1,0': 'ok', '2,0': 'ok' } }, t1: { nascosto: false } } },
    { nota: '{{j|s007|'}}', righe: [4], set: { M: { toni: {} }, r0: { toni: { '0,0': 'dato', '0,1': 'dato' } }, r1: { toni: {} }, C: { nascosto: false, toni: { '0,0': 'ok', '0,1': 'ok', '1,0': 'ok', '1,1': 'ok', '2,0': 'ok', '2,1': 'ok' } }, tC: { nascosto: false } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 14 }, extra || {});
  const G = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'griglia', x, y, cw: 46, ch: 34, valori: vals }, extra || {});
  const C = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 46, valori: vals, indici: false }, extra || {});

  // 1. le tre forme
  SCENE.forme = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [
      T('t1', 90, 30, 'a: (3,)', { bold: true }), C('a', 20, 50, ['1', '2', '3'], { toni: { 0: 'dato', 1: 'dato', 2: 'dato' } }),
      T('t2', 290, 30, '(3, 1)', { bold: true, nascosto: true }), G('col', 266, 42, [['1'], ['2'], ['3']], { nascosto: true, toni: { '0,0': 'ok', '1,0': 'ok', '2,0': 'ok' } }),
      T('t3', 470, 30, '(1, 3)', { bold: true, nascosto: true }), G('riga', 400, 50, [['1', '2', '3']], { nascosto: true, toni: { '0,0': 'due', '0,1': 'due', '0,2': 'due' } }),
      T('c1', 20, 120, '', { size: 12, anchor: 'start' }), T('c2', 290, 200, '', { size: 12 }), T('c3', 470, 120, '', { size: 12 }), T('c4', 300, 236, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "<code>a = np.array([1, 2, 3])</code> ha forma <b>(3,)</b>: una sola dimensione, lunga 3. La virgola c'è perché la forma è sempre una tupla. <b>Non</b> è né riga né colonna.", set: { c1: { t: 'a.T.shape = (3,): nessun effetto' } } },
      { nota: "<code>a.reshape(-1, 1)</code> (o <code>a[:, None]</code>) la trasforma in una <b>colonna</b> vera, (3, 1): 3 righe e 1 colonna. Il −1 vuol dire \"calcola tu\".", set: { t2: { nascosto: false }, col: { nascosto: false }, c2: { t: 'a.reshape(-1, 1) → (3, 1)' } } },
      { nota: "<code>a[None, :]</code> la trasforma in una <b>riga</b> vera, (1, 3).", set: { t3: { nascosto: false }, riga: { nascosto: false }, c3: { t: 'a[None, :] → (1, 3)' } } },
      { nota: "Tre oggetti con gli stessi numeri e tre forme diverse. Nei prodotti e nelle sottrazioni si comportano in modo diverso: prima di ogni conto, <code>.shape</code>.", set: { c4: { t: 'stessi numeri, tre forme', tono: 'ora' } } }
    ]
  };

  // 2. broadcasting
  SCENE.broadcast = {
    w: 620, h: 262, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      T('ty', 45, 30, 'y (3, 1)', { bold: true, size: 13 }), G('y', 22, 42, [['1'], ['2'], ['5']], { toni: { '0,0': 'dato', '1,0': 'dato', '2,0': 'dato' } }),
      T('tp', 160, 30, 'pred (3,)', { bold: true, size: 13 }), C('p', 100, 42, ['1', '3', '5'], { toni: { 0: 'due', 1: 'due', 2: 'due' } }),
      T('tm', 300, 30, 'y − pred', { bold: true, size: 13, nascosto: true }), G('d', 240, 42, [['0', '−2', '−4'], ['1', '−1', '−3'], ['4', '2', '0']], { nascosto: true }),
      T('c1', 470, 60, '', { size: 13 }), T('c2', 470, 100, '', { size: 13, bold: true }), T('c3', 470, 140, '', { size: 13, bold: true }), T('c4', 300, 220, '', { size: 12 })
    ],
    passi: [
      { nota: "Il caso più pericoloso: y letto come <b>colonna</b> (3, 1) e la previsione <code>X @ w</code> come array <b>1D</b> (3,). Sembrano la stessa cosa: tre valori veri e tre previsti." },
      { nota: "<code>y − pred</code> non dà errore. Per il <b>broadcasting</b> NumPy allarga la colonna su 3 colonne e il vettore su 3 righe: esce una matrice <b>3 × 3</b> di tutte le differenze incrociate.", set: { tm: { nascosto: false }, d: { nascosto: false, toni: { '0,1': 'no', '0,2': 'no', '1,0': 'no', '1,2': 'no', '2,0': 'no', '2,1': 'no' } }, c1: { t: 'forma (3, 3), nessun errore' } } },
      { nota: "La media dei quadrati di quella matrice è 5.667: una loss <b>sbagliata</b>, senza nessun avviso.", set: { c2: { t: 'np.mean((y − pred)²) = 5.667', tono: 'no' } } },
      { nota: "La loss giusta usa solo la diagonale, le coppie (vero, previsto) dello stesso punto: (0² + 1² + 0²)/3 = <b>0.333</b>. Rimedio: rendere tutti e due 1D (<code>y.ravel()</code>) e controllare che <code>(y − pred).shape</code> sia (3,). La regola del broadcasting: si confrontano le forme da destra, e un 1 si allarga fino a qualsiasi misura (numeri veri, NumPy 2.4).", set: { d: { toni: { '0,0': 'ok', '1,1': 'ok', '2,2': 'ok' } }, c3: { t: 'giusta: 0.333', tono: 'ok' }, c4: { t: '(3, 1) − (3,) → (3, 3): un 1 si allarga' } } }
    ]
  };

  // 3. operatori
  const giro = (op, vals, nota, tono) => ({ nota, set: { op: { t: op }, r: { valori: vals, toni: Object.fromEntries(vals.map((_, i) => [i, tono])) } } });
  SCENE.operatori = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      T('ta', 50, 57, 'a', { bold: true }), C('a', 80, 40, ['1', '2', '3'], { toni: { 0: 'dato', 1: 'dato', 2: 'dato' } }),
      T('op', 380, 57, '', { bold: true }),
      C('r', 80, 120, [''], {}), T('c', 300, 210, '', { size: 12 })
    ],
    passi: [
      { nota: "Su un array NumPy gli operatori lavorano <b>elemento per elemento</b>, tranne <code>@</code>." },
      giro('a * a', ['1', '4', '9'], "<code>a * a</code>: ogni elemento per sé stesso. Un vettore.", 'ok'),
      giro('a @ a', ['14'], "<code>a @ a</code>: prodotto interno, 1 + 4 + 9 = 14. Un numero.", 'ok'),
      giro('a / 2', ['0.5', '1.0', '1.5'], "<code>a / 2</code>: divisione con la virgola, sempre.", 'ok'),
      giro('a // 2', ['0', '1', '1'], "<code>a // 2</code>: divisione <b>intera</b>, tronca la parte decimale. Diversa da / anche con numeri positivi piccoli.", 'no'),
      { nota: "Sulle <b>liste</b> Python gli stessi simboli fanno altro: <code>[1, 2, 3] * 2</code> ripete la lista, <code>[1, 2, 3, 1, 2, 3]</code>. Per fare i conti, prima <code>np.array(...)</code> (risultati veri).", set: { op: { t: '[1, 2, 3] * 2 (lista)' }, r: { valori: ['1', '2', '3', '1', '2', '3'], toni: { 3: 'no', 4: 'no', 5: 'no' } }, c: { t: 'lista * 2 = ripetizione' } } }
    ]
  };

  // 4. design matrix
  SCENE.designnp = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      T('tx', 50, 47, 'x', { bold: true }), C('x', 70, 30, ['1', '2', '3'], { toni: { 0: 'dato', 1: 'dato', 2: 'dato' } }),
      T('t1', 50, 107, '1', { bold: true }), C('u', 70, 90, ['1', '1', '1'], { toni: { 0: 'due', 1: 'due', 2: 'due' } }),
      T('tc', 380, 22, 'np.c_[np.ones(3), x]', { bold: true, size: 12, nascosto: true }), G('D', 330, 34, [['1', '1'], ['1', '2'], ['1', '3']], { nascosto: true, toni: { '0,0': 'due', '1,0': 'due', '2,0': 'due', '0,1': 'dato', '1,1': 'dato', '2,1': 'dato' } }),
      T('th', 300, 170, '', { bold: true, size: 12 }), C('h', 160, 182, ['1', '1', '1', '1', '2', '3'], { nascosto: true, toni: { 0: 'no', 1: 'no', 2: 'no', 3: 'no', 4: 'no', 5: 'no' } })
    ],
    passi: [
      { nota: "Per la design matrix di una retta servono due colonne: una di 1 (per w₀) e una con le x." },
      { nota: "<code>np.c_[np.ones(3), x]</code> (o <code>np.column_stack</code>) mette i vettori <b>come colonne</b>, uno accanto all'altro: una matrice 3 × 2, righe [1, xᵢ].", set: { tc: { nascosto: false }, D: { nascosto: false } } },
      { nota: "<code>np.hstack([np.ones(3), x])</code> con vettori 1D li <b>attacca in fila</b>: un solo vettore di 6 numeri. Nessun errore, ma non è una matrice, e il prodotto con w fallirà più avanti (output veri).", set: { th: { t: 'np.hstack → un vettore di 6, non una matrice', tono: 'no' }, h: { nascosto: false } } }
    ]
  };

  // 5. alias e dtype
  const nd = (id, x, y, t, tono) => ({ id, tipo: 'nodo', x, y, t, tono, r: 22 });
  SCENE.alias = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      nd('b', 60, 60, 'b', 'dato'), nd('c', 60, 150, 'c', 'dato'),
      C('m', 180, 88, ['1', '2', '3'], { toni: { 0: 'ok', 1: 'ok', 2: 'ok' } }),
      { id: 'fb', tipo: 'vett', x1: 84, y1: 66, x2: 176, y2: 96, t: '' },
      { id: 'fc', tipo: 'vett', x1: 84, y1: 144, x2: 176, y2: 116, t: '', nascosto: true },
      C('m2', 180, 180, ['1', '2', '3'], { nascosto: true, toni: { 0: 'ok', 1: 'ok', 2: 'ok' } }),
      T('c1', 470, 60, '', { size: 13 }), T('c2', 470, 100, '', { size: 13, bold: true }), T('c3', 470, 150, '', { size: 13 })
    ],
    passi: [
      { nota: "<code>b = np.array([1, 2, 3])</code>: in memoria c'è un array, e b è un <b>nome</b> che lo indica." },
      { nota: "<code>c = b</code> <b>non copia</b>: dà un secondo nome allo <b>stesso</b> array.", set: { fc: { nascosto: false }, c1: { t: 'c = b: due nomi, un array' } } },
      { nota: "<code>c[0] = 99</code> modifica l'array… e quindi anche b: <code>b</code> ora vale [99, 2, 3]. Nessun errore, solo un risultato sbagliato più avanti.", set: { m: { valori: ['99', '2', '3'], toni: { 0: 'no', 1: 'ok', 2: 'ok' } }, c2: { t: 'b = [99, 2, 3] !', tono: 'no' } } },
      { nota: "Con <code>c = b.copy()</code> c indica un array <b>nuovo</b>: modificarlo non tocca b. Altra trappola silenziosa: in un array di interi, <code>v[0] = 2.7</code> salva <b>2</b> (troncato). Se servono decimali: <code>np.array([1., 2., 3.])</code> (output veri).", set: { fc: { x2: 176, y2: 196 }, m2: { nascosto: false }, m: { valori: ['1', '2', '3'], toni: { 0: 'ok', 1: 'ok', 2: 'ok' } }, c2: { t: 'c = b.copy(): array separati', tono: 'ok' }, c3: { t: 'interi: 2.7 diventa 2' } } }
    ]
  };

  // 6. errori con messaggio: reshape
  SCENE.reshape = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s013|'}}',
    oggetti: [
      C('v', 20, 30, ['0', '1', '2', '3', '4', '5'], { toni: { 0: 'dato', 1: 'dato', 2: 'dato', 3: 'dato', 4: 'dato', 5: 'dato' } }),
      G('g', 60, 90, [['0', '1'], ['2', '3'], ['4', '5'], ['?', '?']], { nascosto: true, toni: { '3,0': 'no', '3,1': 'no' } }),
      T('c1', 450, 80, '', { size: 13 }), T('c2', 450, 120, '', { size: 13, bold: true }), T('c3', 450, 170, '', { size: 13 })
    ],
    passi: [
      { nota: "<code>np.arange(6)</code>: 6 numeri, da 0 a 5." },
      { nota: "<code>.reshape(4, 2)</code> chiede 4 × 2 = <b>8</b> caselle, ma i numeri sono 6: due caselle resterebbero vuote.", set: { g: { nascosto: false }, c1: { t: 'reshape(4, 2): 8 caselle, 6 numeri' } } },
      { nota: "NumPy si ferma: <code>ValueError: cannot reshape array of size 6 into shape (4,2)</code>. La regola: il prodotto delle nuove dimensioni deve essere uguale al numero di elementi.", set: { c2: { t: 'ValueError', tono: 'no' } } },
      { nota: "<code>reshape(3, 2)</code> funziona: 3 × 2 = 6. Riempie riga per riga. Anche <code>reshape(2, 3)</code> o <code>reshape(-1, 2)</code> (il −1 fa calcolare la dimensione mancante: 3) (errore vero, NumPy 2.4).", set: { g: { valori: [['0', '1'], ['2', '3'], ['4', '5']], toni: { '0,0': 'ok', '0,1': 'ok', '1,0': 'ok', '1,1': 'ok', '2,0': 'ok', '2,1': 'ok' } }, c3: { t: 'reshape(3, 2): 6 = 6 ✓', tono: 'ok' } } }
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
  <p>{{s|s017|}}</p>
  <figure class="codice" data-titolo="{{a|s018|}}">
<pre data-lang="python">a = np.array([1, 2, 3])
a.shape                  # (3,)
a.T.shape                # (3,)
a.reshape(-1, 1).shape   # (3, 1)
a[:, None].shape         # (3, 1)
a[None, :].shape         # (1, 3)
M = np.array([[1, 2], [3, 4], [5, 6]])
M[:, 0].shape            # (3,)
M[:, [0]].shape          # (3, 1)</pre>
    <ol class="spiega">
      <li data-righe="1-2" data-segna="(3,)@dato"><p>{{s|s019|}}</p></li>
      <li data-righe="3" data-segna="a.T.shape@no|(3,)@no"><p>{{s|s020|}}</p></li>
      <li data-righe="4-5" data-segna="(3, 1)*@ok"><p>{{s|s021|}}</p></li>
      <li data-righe="6" data-segna="(1, 3)@ok"><p>{{s|s022|}}</p></li>
      <li data-righe="7-9" data-segna="M[:, 0]@dato|M[:, [0]]@ok"><p>{{s|s023|}}</p></li>
    </ol>
  </figure>
  <div class="box regola" data-tit="{{a|s024|}}">
    <p>{{s|s025|}}</p>
  </div>
  <figure class="scena" data-scena="forme" data-titolo="{{a|s026|}}"></figure>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <figure class="scena" data-scena="asse" data-titolo="{{a|s028|}}"></figure>
  <div class="box regola" data-tit="{{a|s029|}}">
    <p>{{s|s030|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s031|}}</h2>
  <p>{{s|s032|}}</p>
  <figure class="passi" data-titolo="{{a|s033|}}">
    <div class="passo"><div class="espr">(3, <mark class="ok">2</mark>) − (<mark class="ok">2</mark>,)  →  (3, 2)  <mark class="ok">✓</mark></div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">(2, <mark class="no">3</mark>) + (2, <mark class="no">2</mark>)  →  <mark class="no">errore</mark></div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">(3, <mark class="ora">1</mark>) − (<mark class="ora">3</mark>,)  →  <mark class="no">(3, 3)</mark>  senza errori</div><p class="nota">{{s|s036|}}</p></div>
  </figure>
  <div class="errori">
    <div class="errore">
<pre data-lang="python">y = np.array([[1.], [2.], [5.]])       # colonna (3, 1)
pred = np.array([1., 3., 5.])          # vettore (3,)
np.mean((y - pred) ** 2)</pre>
<pre class="msg">(y - pred).shape  →  (3, 3)
np.mean((y - pred) ** 2)  →  5.666666666666667</pre>
      <div class="fix"><p>{{s|s037|}}</p></div>
    </div>
  </div>
  <figure class="scena" data-scena="broadcast" data-titolo="{{a|s038|}}"></figure>
</section>

<section>
  <h2>{{s|s039|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s040|}}</th><th>{{s|s041|}}</th><th>{{s|s042|}}</th></tr></thead>
    <tbody>
      <tr><td><code>a * b</code></td><td>{{s|s043|}}</td><td><code>[1, 2, 3] * [1, 2, 3]</code> → <code>[1, 4, 9]</code></td></tr>
      <tr><td><code>a @ b</code></td><td>{{s|s044|}}</td><td><code>[1, 2, 3] @ [1, 2, 3]</code> → <code>14</code></td></tr>
      <tr><td><code>a ** 2</code></td><td>{{s|s045|}}</td><td><code>[1, 4, 9]</code></td></tr>
      <tr><td><code>a / 2</code></td><td>{{s|s046|}}</td><td><code>[0.5, 1., 1.5]</code></td></tr>
      <tr><td><code>a // 2</code></td><td>{{s|s047|}}</td><td><code>[0, 1, 1]</code></td></tr>
    </tbody>
  </table></div>
  <div class="box attenzione" data-tit="{{a|s048|}}">
    <p>{{s|s049|}}</p>
  </div>
  <figure class="scena" data-scena="operatori" data-titolo="{{a|s050|}}"></figure>
</section>

<section>
  <h2>{{s|s051|}}</h2>
  <p>{{s|s052|}}</p>
  <figure class="codice" data-titolo="{{a|s053|}}">
<pre data-lang="python">x = np.array([1, 2, 3])
np.c_[np.ones(3), x]              # [[1, 1], [1, 2], [1, 3]]
np.column_stack([np.ones(3), x])  # uguale
np.hstack([np.ones(3), x])        # [1, 1, 1, 1, 2, 3]</pre>
    <ol class="spiega">
      <li data-righe="2-3" data-segna="np.c_@ok|np.column_stack@ok"><p>{{s|s054|}}</p></li>
      <li data-righe="4" data-segna="np.hstack@no"><p>{{s|s055|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="designnp" data-titolo="{{a|s056|}}"></figure>
</section>

<section>
  <h2>{{s|s057|}}</h2>
  <p>{{s|s058|}}</p>
  <div class="errori">
    <div class="errore">
<pre data-lang="python">b = np.array([1, 2, 3])
c = b
c[0] = 99</pre>
<pre class="msg">&gt;&gt;&gt; b
array([99,  2,  3])</pre>
      <div class="fix"><p>{{s|s059|}}</p></div>
    </div>
    <div class="errore">
<pre data-lang="python">v = np.array([1, 2, 3])
v[0] = 2.7</pre>
<pre class="msg">&gt;&gt;&gt; v
array([2, 2, 3])</pre>
      <div class="fix"><p>{{s|s060|}}</p></div>
    </div>
    <div class="errore">
<pre data-lang="python">X = np.array([[1., 2.], [3., 5.], [5., 11.]])   # 3 dati, 2 feature
np.cov(X)</pre>
<pre class="msg">array([[ 0.5,  1. ,  3. ],
       [ 1. ,  2. ,  6. ],
       [ 3. ,  6. , 18. ]])</pre>
      <div class="fix"><p>{{s|s061|}}</p></div>
    </div>
  </div>
  <figure class="scena" data-scena="alias" data-titolo="{{a|s062|}}"></figure>
</section>

<section>
  <h2>{{s|s063|}}</h2>
  <p>{{s|s064|}}</p>
  <div class="errori">
    <div class="errore">
<pre data-lang="python">np.linalg.inv(np.array([[1., 2.], [2., 4.]]))</pre>
<pre class="msg">LinAlgError: Singular matrix</pre>
      <div class="fix"><p>{{s|s065|}}</p></div>
    </div>
    <div class="errore">
<pre data-lang="python">np.arange(6).reshape(4, 2)</pre>
<pre class="msg">ValueError: cannot reshape array of size 6 into shape (4,2)</pre>
      <div class="fix"><p>{{s|s066|}}</p></div>
    </div>
  </div>
  <figure class="scena" data-scena="reshape" data-titolo="{{a|s067|}}"></figure>
</section>

</main>
</body>
</html>
