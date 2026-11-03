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
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 14 }, extra || {});
  const P = [[0, 1], [1, 3], [2, 2], [3, 5]];
  const assi = () => ({ id: 'ax', tipo: 'assi', box: [50, 15, 260, 232], dom: [-0.5, 3.5, 0, 6], tacche: 1, etX: 'x', etY: 'y' });
  const punti = og => P.forEach(([x, y], i) => og.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x, y, t: '(' + x + ', ' + y + ')', tono: 'dato' }));

  // 1. il problema
  const og1 = [assi()]; punti(og1);
  og1.push({ id: 'li', tipo: 'linea', in: 'ax', x1: -0.5, y1: 0.5, x2: 3.5, y2: 4.5, tono: 'ora', nascosto: true });
  og1.push(T('c1', 450, 60, '', { bold: true }), T('c2', 450, 96, '', { size: 13 }), T('c3', 450, 150, '', { size: 13 }));
  const retta = (w0, w1, sse, nota) => ({ nota, set: { li: { nascosto: false, y1: w0 - 0.5 * w1, y2: w0 + 3.5 * w1 }, c1: { t: 'y = ' + w0 + ' + ' + w1 + 'x' }, c2: { t: 'somma dei quadrati: ' + sse } } });
  SCENE.problema = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: og1,
    passi: [
      { nota: "Quattro punti che non stanno su una retta. Il modello y = w₀ + w₁x ha 2 parametri, i punti danno 4 equazioni: il sistema è <b>sovradeterminato</b> e nessuna retta passa per tutti." },
      retta(1, 1, 3, "Proviamo y = 1 + x: passa per (0, 1) ma sbaglia gli altri. Errori 0, 1, −1, 1."),
      retta(2, 0.5, 4.5, "y = 2 + 0.5x: sbaglia di più."),
      retta(0.5, 1.5, 3.5, "y = 0.5 + 1.5x: passa per (3, 5) ma sbaglia gli altri."),
      { nota: "Ogni retta sbaglia da qualche parte: non si può chiedere \"quella giusta\". Si cambia domanda: <b>quale retta sbaglia di meno?</b> Serve un modo di misurare lo sbaglio totale, e la loss dei minimi quadrati è proprio questo (\"first landmark\" delle slide: learn linear least squares with more data than model parameters).", set: { c3: { t: 'serve un criterio', tono: 'ora' } } }
    ]
  };

  // 2. la loss in forma matriciale
  const cel = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 54, valori: vals, indici: false }, extra || {});
  SCENE.lossmat = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      T('ty', 60, 47, 'y', { bold: true }), cel('y', 90, 30, ['1', '3', '2', '5'], { toni: { 0: 'dato', 1: 'dato', 2: 'dato', 3: 'dato' } }),
      T('tp', 60, 107, 'Xw', { bold: true }), cel('p', 90, 90, ['1', '2', '3', '4'], { toni: { 0: 'due', 1: 'due', 2: 'due', 3: 'due' } }),
      T('tr', 60, 167, 'r', { bold: true, nascosto: true }), cel('r', 90, 150, ['0', '1', '−1', '1'], { nascosto: true, toni: { 0: 'no', 1: 'no', 2: 'no', 3: 'no' } }),
      T('w', 450, 50, 'w = [1, 1]', { bold: true }), T('c1', 450, 100, '', { size: 13 }), T('c2', 450, 140, '', { bold: true, size: 15 }),
      T('f', 300, 236, 'L(w) = ‖y − Xw‖² = Σᵢ rᵢ²', { bold: true })
    ],
    passi: [
      { nota: "Con la design matrix X (righe [1, xᵢ]) tutte le previsioni si calcolano insieme: <b>Xw</b> è il vettore delle 4 previsioni. Con w = [1, 1]: [1, 2, 3, 4]." },
      { nota: "Il vettore dei <b>residui</b> r = y − Xw: verità meno previsione, componente per componente: [0, 1, −1, 1].", set: { tr: { nascosto: false }, r: { nascosto: false } } },
      { nota: "La loss è la somma dei quadrati dei residui, cioè la <b>norma al quadrato</b> del vettore r: ‖r‖² = 0 + 1 + 1 + 1 = 3. La formula matriciale L(w) = ‖y − Xw‖² dice tutto in un colpo, per qualunque numero di punti.", set: { c1: { t: '‖r‖² = 0 + 1 + 1 + 1' }, c2: { t: 'L = 3', tono: 'no' } } },
      { nota: "Con w = [1.1, 1.1]: previsioni [1.1, 2.2, 3.3, 4.4], residui [−0.1, 0.8, −1.3, 0.6], L = 2.7. Più piccola. <b>Minimi quadrati</b> = trovare il w con la L più piccola possibile: w* = argmin ‖y − Xw‖² (argmin = \"il valore di w che rende minimo\").", set: { w: { t: 'w = [1.1, 1.1]' }, p: { valori: ['1.1', '2.2', '3.3', '4.4'] }, r: { valori: ['−0.1', '0.8', '−1.3', '0.6'] }, c1: { t: '0.01 + 0.64 + 1.69 + 0.36' }, c2: { t: 'L = 2.7', tono: 'ok' } } }
    ]
  };

  // 3. la soluzione (scena originale)
  const og3 = [assi()]; punti(og3);
  const w0 = 1.1, w1 = 1.1;
  og3.push({ id: 'retta', tipo: 'linea', in: 'ax', x1: -0.5, y1: w0 - 0.5 * w1, x2: 3.5, y2: w0 + 3.5 * w1, tono: 'ok', nascosto: true });
  P.forEach(([x, y], i) => og3.push({ id: 'r' + i, tipo: 'linea', in: 'ax', x1: x, y1: y, x2: x, y2: w0 + w1 * x, tono: 'no', nascosto: true }));
  og3.push(T('n', 450, 70, '', { bold: true }), T('n2', 450, 110, '', { size: 13 }), T('n3', 450, 140, '', { size: 13 }));
  const res = Object.fromEntries(P.map((_, i) => ['r' + i, { nascosto: false }]));
  SCENE.ls = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s004|'}}',
    codice: { lang: 'python', testo: `x = np.array([0, 1, 2, 3]); y = np.array([1, 3, 2, 5])
X = np.c_[np.ones(4), x]              # design matrix [1, x]
w = np.linalg.lstsq(X, y, rcond=None)[0]   # [1.1, 1.1]
r = y - X @ w                         # residui` },
    oggetti: og3,
    passi: [
      { nota: '{{j|s005|'}}', righe: [1] },
      { nota: '{{j|s006|'}}', righe: [2, 3], set: { retta: { nascosto: false }, n: { t: 'y = 1.1 + 1.1x', tono: 'ok' } } },
      { nota: '{{j|s007|'}}', righe: [4], set: Object.assign({ n2: { t: 'residui: −0.1, 0.8, −1.3, 0.6' } }, res) },
      { nota: '{{j|s008|'}}', set: { n3: { t: 'r · 1 = 0,   r · x = 0', tono: 'ok' } } }
    ]
  };

  // 4. geometria nello spazio dei dati (2 punti, 1 parametro)
  SCENE.proiezioneY = {
    w: 600, h: 290, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 250, 250], dom: [-0.5, 2.8, -0.5, 2.8], tacche: 1, etX: 'misura 1', etY: 'misura 2' },
      { id: 'sp', tipo: 'linea', in: 'ax', x1: -0.25, y1: -0.5, x2: 1.4, y2: 2.8, tono: 'spento', nascosto: true },
      { id: 'x', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 2, t: 'x = [1, 2]', tx: -80, tono: 'due' },
      { id: 'y', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 1, t: 'y = [2, 1]', tono: 'dato', nascosto: true },
      { id: 'yh', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 0.8, y2: 1.6, t: 'ŷ', tx: -18, tono: 'ok', nascosto: true },
      { id: 'r', tipo: 'vett', in: 'ax', x1: 0.8, y1: 1.6, x2: 2, y2: 1, t: 'r', tx: -50, ty: -26, tono: 'no', nascosto: true },
      T('c1', 460, 40, 'modello: y = w·x (1 parametro)', { size: 12, bold: true }),
      T('c2', 460, 80, '', { size: 13 }), T('c3', 460, 110, '', { size: 13 }), T('c4', 460, 150, '', { size: 13 }), T('c5', 460, 190, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "Il trucco per <b>vedere</b> i minimi quadrati: un asse per ogni <b>misura</b>, non per ogni variabile. Con 2 misure, x = [1, 2] (gli ingressi) è un vettore di questo piano. Modello y = w·x, un solo parametro." },
      { nota: "Tutte le previsioni possibili w·x, al variare di w, stanno sulla <b>retta</b> generata da x: lo <b>spazio delle colonne</b> della design matrix.", set: { sp: { nascosto: false }, c2: { t: 'previsioni possibili: w·x' } } },
      { nota: "Le misure vere sono y = [2, 1]. Non stanno su quella retta: nessun w dà previsioni esatte.", set: { y: { nascosto: false }, c3: { t: 'y non è nello span' } } },
      { nota: "La previsione migliore è il punto della retta <b>più vicino</b> a y: la sua <b>proiezione ortogonale</b>. w = (x·y)/(x·x) = 4/5 = 0.8, ŷ = 0.8·[1, 2] = [0.8, 1.6].", set: { yh: { nascosto: false }, c4: { t: 'ŷ = 0.8·x = [0.8, 1.6]', tono: 'ok' } } },
      { nota: "Il residuo r = y − ŷ = [1.2, −0.6] è <b>perpendicolare</b> alla retta: r·x = 1.2 − 1.2 = 0. \"Più vicino\" = distanza ‖y − ŷ‖ minima = somma dei quadrati minima. Con N misure e più colonne è identico, solo in N dimensioni e su un sottospazio invece di una retta (numeri controllati).", set: { r: { nascosto: false }, c5: { t: 'r ⊥ x:  r·x = 0', tono: 'no' } } }
    ]
  };

  // 5. equazioni normali
  const G = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'griglia', x, y, cw: 46, ch: 32, valori: vals }, extra || {});
  SCENE.normali = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      T('t0', 300, 24, 'Xᵀ(y − Xw) = 0   ⇒   XᵀX w = Xᵀy', { bold: true }),
      T('ta', 110, 64, 'XᵀX', { bold: true, size: 13, nascosto: true }), G('A', 60, 76, [['4', '6'], ['6', '14']], { nascosto: true, toni: { '0,0': 'dato', '0,1': 'dato', '1,0': 'dato', '1,1': 'dato' } }),
      T('tb', 240, 64, 'Xᵀy', { bold: true, size: 13, nascosto: true }), G('b', 216, 76, [['11'], ['22']], { nascosto: true, toni: { '0,0': 'due', '1,0': 'due' } }),
      T('c1', 450, 80, '', { size: 13 }), T('c2', 450, 110, '', { size: 13 }), T('c3', 450, 140, '', { size: 13 }),
      T('w', 300, 210, '', { bold: true, size: 15 })
    ],
    passi: [
      { nota: "Il residuo migliore è ortogonale a <b>ogni</b> colonna di X: in forma di matrice Xᵀr = 0, cioè Xᵀ(y − Xw) = 0. Sviluppando: XᵀXw = Xᵀy, le <b>equazioni normali</b> (\"normale\" = perpendicolare)." },
      { nota: "Con i 4 punti: XᵀX è 2 × 2. In alto a sinistra il numero di punti (4), poi Σx = 6, in basso Σx² = 14.", set: { ta: { nascosto: false }, A: { nascosto: false }, c1: { t: '[[N, Σx], [Σx, Σx²]]' } } },
      { nota: "Xᵀy = [Σy, Σxy] = [11, 22].", set: { tb: { nascosto: false }, b: { nascosto: false }, c2: { t: '[Σy, Σxy] = [11, 22]' } } },
      { nota: "Un sistema 2 × 2 normale: det = 4·14 − 6·6 = 20, e w* = (1/20)·[[14, −6], [−6, 4]]·[11, 22] = [1.1, 1.1]. Da 4 equazioni impossibili a 2 equazioni risolvibili: qualunque sia N, XᵀX è sempre quadrata (parametri × parametri).", set: { c3: { t: 'det = 20' }, w: { t: 'w* = (XᵀX)⁻¹Xᵀy = [1.1, 1.1]', tono: 'ok' } } }
    ]
  };

  // 6. pseudoinversa: le forme
  const R6 = (id, x, y, w, h, t, tono, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t, tono }, extra || {});
  SCENE.pinv = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      R6('xt', 20, 60, 110, 44, 'Xᵀ  2 × 4', 'due', { nascosto: true }),
      R6('x', 150, 40, 60, 90, 'X  4 × 2', 'dato'),
      R6('xtx', 230, 60, 70, 60, 'XᵀX 2×2', 'dato', { nascosto: true }),
      R6('xp', 320, 60, 110, 44, 'X⁺  2 × 4', 'ok', { nascosto: true }),
      R6('w', 450, 60, 44, 60, 'w', 'ok', { nascosto: true }),
      T('c1', 300, 170, '', { size: 13 }), T('c2', 300, 200, '', { size: 13 }), T('c3', 300, 230, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "X è <b>alta e stretta</b>: 4 righe (punti), 2 colonne (parametri). Non è quadrata, quindi non ha inversa." },
      { nota: "Moltiplicandola a sinistra per la sua trasposta si ottiene XᵀX: (2 × 4)(4 × 2) = 2 × 2, quadrata. Questa di solito ha l'inversa.", set: { xt: { nascosto: false }, xtx: { nascosto: false }, c1: { t: '(2 × 4)(4 × 2) = 2 × 2' } } },
      { nota: "La <b>pseudoinversa</b> è X⁺ = (XᵀX)⁻¹Xᵀ: (2 × 2)(2 × 4) = 2 × 4. Per la X dei 4 punti: [[0.7, 0.4, 0.1, −0.2], [−0.3, −0.1, 0.1, 0.3]].", set: { xp: { nascosto: false }, c2: { t: 'X⁺ = (XᵀX)⁻¹Xᵀ: 2 × 4' } } },
      { nota: "w* = X⁺y: (2 × 4)(4) = 2 numeri, [1.1, 1.1]. X⁺ fa per le matrici alte quello che l'inversa fa per le quadrate: X⁺X = I (2 × 2). Ma XX⁺ ≠ I: è la matrice 4 × 4 che <b>proietta</b> y sullo spazio delle colonne (valori controllati con <code>np.linalg.pinv</code>).", set: { w: { nascosto: false }, c3: { t: 'w* = X⁺ y = [1.1, 1.1]', tono: 'ok' } } }
    ]
  };

  // 7. NumPy
  SCENE.tremodi = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s012|'}}',
    codice: { lang: 'python', testo: `w = np.linalg.solve(X.T @ X, X.T @ y)
w = np.linalg.pinv(X) @ y
w, res, rank, sv = np.linalg.lstsq(X, y, rcond=None)` },
    oggetti: [
      T('a', 300, 50, '', { size: 14 }), T('b', 300, 90, '', { size: 14 }), T('c', 300, 130, '', { size: 14 }), T('d', 300, 180, '', { size: 13 })
    ],
    passi: [
      { nota: "Tre modi di calcolare w* in NumPy. Tutti partono dalla design matrix <code>X = np.c_[np.ones(4), x]</code>." },
      { nota: "Le <b>equazioni normali</b> con <code>solve</code>: la formula della teoria.", righe: [1], set: { a: { t: 'solve(XᵀX, Xᵀy) → [1.1, 1.1]', tono: 'ok' } } },
      { nota: "La <b>pseudoinversa</b> con <code>pinv</code>, calcolata in modo più stabile.", righe: [2], set: { b: { t: 'pinv(X) @ y → [1.1, 1.1]', tono: 'ok' } } },
      { nota: "<code>lstsq</code> risolve direttamente il problema e restituisce <b>quattro</b> cose: w, la somma dei quadrati dei residui ([2.7]), il rango di X (2) e i valori singolari. Per questo si scrive <code>[0]</code> quando serve solo w. È la scelta consigliata (output reale).", righe: [3], set: { c: { t: 'lstsq → w = [1.1, 1.1]', tono: 'ok' }, d: { t: 'res = [2.7], rank = 2', tono: 'due' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s013|}}</h1>
  <p class="lede">{{s|s014|}}</p>
</header>

<section>
  <h2>{{s|s015|}}</h2>
  <p>{{s|s016|}}</p>
  <p>{{s|s017|}}</p>
  <figure class="scena" data-scena="problema" data-titolo="{{a|s018|}}"></figure>
</section>

<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <figure class="passi" data-titolo="{{a|s021|}}">
    <div class="passo"><div class="espr">{{s|s022|}}</div><p class="nota">{{s|s023|}}</p></div>
    <div class="passo"><div class="espr">L(w) = Σᵢ rᵢ² = <mark class="ok">‖y − Xw‖²</mark></div><p class="nota">{{s|s024|}}</p></div>
    <div class="passo"><div class="espr">w* = argmin<sub>w</sub> ‖y − Xw‖²</div><p class="nota">{{s|s025|}}</p></div>
  </figure>
  <p>{{s|s026|}}</p>
  <figure class="scena" data-scena="lossmat" data-titolo="{{a|s027|}}"></figure>
</section>

<section>
  <h2>{{s|s028|}}</h2>
  <p>{{s|s029|}}</p>
  <p>{{s|s030|}}</p>
  <figure class="scena" data-scena="ls" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <p>{{s|s033|}}</p>
  <figure class="passi" data-titolo="{{a|s034|}}">
    <div class="passo"><div class="espr">Xw = w₀·<mark class="dato">colonna 1</mark> + w₁·<mark class="dato">colonna x</mark></div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">{{s|s036|}}</div><p class="nota">{{s|s037|}}</p></div>
    <div class="passo"><div class="espr">{{s|s038|}}</div><p class="nota">{{s|s039|}}</p></div>
    <div class="passo"><div class="espr">{{s|s040|}}</div><p class="nota">{{s|s041|}}</p></div>
  </figure>
  <div class="box attenzione" data-tit="{{a|s042|}}">
    <p>{{s|s043|}}</p>
  </div>
  <figure class="scena" data-scena="proiezioneY" data-titolo="{{a|s044|}}"></figure>
</section>

<section>
  <h2>{{s|s045|}}</h2>
  <p>{{s|s046|}}</p>
  <div class="mblock"><span class="m">XᵀX w = Xᵀy</span></div>
  <p>{{s|s047|}}</p>
  <figure class="scena" data-scena="normali" data-titolo="{{a|s048|}}"></figure>
</section>

<section>
  <h2>{{s|s049|}}</h2>
  <p>{{s|s050|}}</p>
  <div class="mblock"><span class="m">X⁺ = (XᵀX)⁻¹Xᵀ</span></div>
  <p>{{s|s051|}}</p>
  <p>{{s|s052|}}</p>
  <figure class="scena" data-scena="pinv" data-titolo="{{a|s053|}}"></figure>
</section>

<section>
  <h2>{{s|s054|}}</h2>
  <figure class="codice" data-titolo="{{a|s055|}}">
<pre data-lang="python">X = np.c_[np.ones(4), x]                   # colonne [1, x]
w = np.linalg.solve(X.T @ X, X.T @ y)      # equazioni normali
w = np.linalg.pinv(X) @ y                  # pseudoinversa
w = np.linalg.lstsq(X, y, rcond=None)[0]   # la scelta consigliata</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="np.c_[np.ones(4), x]@dato"><p>{{s|s056|}}</p></li>
      <li data-righe="2" data-segna="X.T @ X@ora|X.T @ y@ora"><p>{{s|s057|}}</p></li>
      <li data-righe="3" data-segna="np.linalg.pinv(X)@due"><p>{{s|s058|}}</p></li>
      <li data-righe="4" data-segna="np.linalg.lstsq@ok"><p>{{s|s059|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="tremodi" data-titolo="{{a|s060|}}"></figure>
</section>

</main>
</body>
</html>
