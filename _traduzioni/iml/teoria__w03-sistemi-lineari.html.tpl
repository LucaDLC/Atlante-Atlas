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
  const G = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'griglia', x, y, cw: 50, ch: 40, valori: vals }, extra || {});

  // 1. dal sistema alla matrice
  SCENE.allamatrice = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      T('e1', 150, 40, '2·x + 1·y = 4', { size: 17, bold: true }), T('e2', 150, 76, '1·x + 3·y = 7', { size: 17, bold: true }),
      G('A', 50, 130, [['', ''], ['', '']]), T('tA', 100, 118, 'A', { bold: true }),
      G('x', 170, 130, [[''], ['']]), T('tx', 195, 118, 'x', { bold: true }),
      T('eq', 250, 170, '=', { size: 20, bold: true }),
      G('b', 275, 130, [[''], ['']]), T('tb', 300, 118, 'b', { bold: true }),
      T('c', 470, 150, '', { size: 16, bold: true }), T('c2', 470, 186, '', { size: 13 })
    ],
    passi: [
      { nota: "Un sistema di due equazioni lineari in due incognite, x e y. \"Lineare\" vuol dire: ogni incognita è solo moltiplicata per un numero, poi si somma (niente x², niente x·y)." },
      { nota: "I <b>coefficienti</b> (i numeri davanti alle incognite) vanno nella matrice A, <b>una riga per equazione</b>.", set: { A: { valori: [['2', '1'], ['1', '3']], toni: { '0,0': 'dato', '0,1': 'dato', '1,0': 'dato', '1,1': 'dato' } } } },
      { nota: "Le <b>incognite</b> vanno in un vettore x, nello stesso ordine delle colonne: prima x, poi y.", set: { x: { valori: [['x'], ['y']], toni: { '0,0': 'ora', '1,0': 'ora' } } } },
      { nota: "I <b>termini noti</b> (a destra dell'uguale) vanno in un vettore b.", set: { b: { valori: [['4'], ['7']], toni: { '0,0': 'ok', '1,0': 'ok' } } } },
      { nota: "Tutto il sistema diventa <b>Ax = b</b>. Controllo: la riga 1 di A per x dà 2x + 1y, cioè il lato sinistro della prima equazione. È la vista per righe del prodotto matrice-vettore.", set: { c: { t: 'A x = b', tono: 'ok' }, c2: { t: 'riga i di A · x = bᵢ' } } }
    ]
  };

  // 2. vista per righe: due rette
  SCENE.righe = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 25, 280, 240], dom: [-1, 5, -1, 4], tacche: 1, etX: 'x', etY: 'y' },
      { id: 'l1', tipo: 'linea', in: 'ax', x1: 0, y1: 4, x2: 2.5, y2: -1, tono: 'dato', nascosto: true },
      { id: 'l2', tipo: 'linea', in: 'ax', x1: -1, y1: 2.667, x2: 5, y2: 0.667, tono: 'due', nascosto: true },
      { id: 's', tipo: 'punto', in: 'ax', x: 1, y: 2, t: '(1, 2)', tono: 'ok', nascosto: true },
      T('c1', 470, 60, '', { size: 13, tono: 'dato' }), T('c2', 470, 90, '', { size: 13, tono: 'due' }), T('c3', 470, 140, '', { bold: true }), T('c4', 470, 170, '', { size: 13 })
    ],
    passi: [
      { nota: "<b>Vista per righe</b> (<i>row picture</i>): ogni equazione è una retta, l'insieme dei punti che la rendono vera." },
      { nota: "Prima equazione, 2x + y = 4: la retta blu. Ogni punto della retta la soddisfa, per esempio (0, 4) e (2, 0).", set: { l1: { nascosto: false }, c1: { t: '2x + y = 4' } } },
      { nota: "Seconda equazione, x + 3y = 7: la retta viola.", set: { l2: { nascosto: false }, c2: { t: 'x + 3y = 7' } } },
      { nota: "La <b>soluzione</b> del sistema è il punto che sta su <b>entrambe</b> le rette: la loro intersezione, (1, 2).", set: { s: { nascosto: false }, c3: { t: 'soluzione: (1, 2)', tono: 'ok' } } },
      { nota: "Controllo sostituendo: 2·1 + 2 = 4 ✓ e 1 + 3·2 = 7 ✓. Con tre incognite ogni equazione è un piano, e la soluzione è il punto comune ai piani.", set: { c4: { t: '2 + 2 = 4 ✓   1 + 6 = 7 ✓' } } }
    ]
  };

  // 3. tre casi (scena originale)
  SCENE.rette = {
    w: 400, h: 300, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 25, 300, 250], dom: [-1, 5, -1, 4], tacche: 1, etX: 'x', etY: 'y' },
      { id: 'l1', tipo: 'linea', in: 'ax', x1: 0, y1: 4, x2: 2.5, y2: -1, tono: 'dato' },
      { id: 'l2', tipo: 'linea', in: 'ax', x1: -1, y1: 2.667, x2: 5, y2: 0.667, tono: 'due' },
      { id: 's', tipo: 'punto', in: 'ax', x: 1, y: 2, t: '(1, 2)', nascosto: true },
      { id: 'eq', tipo: 'testo', x: 200, y: 292, t: '2x + y = 4    ·    x + 3y = 7', size: 13, bold: true }
    ],
    passi: [
      { nota: '{{j|s005|'}}' },
      { nota: '{{j|s006|'}}', set: { s: { nascosto: false, tono: 'ok' } } },
      { nota: '{{j|s007|'}}', set: { s: { nascosto: true }, l1: { x1: -1, y1: 2, x2: 5, y2: -1, tono: 'dato' }, l2: { x1: -1, y1: 3, x2: 5, y2: 0, tono: 'no' }, eq: { t: 'x + 2y = 3    ·    2x + 4y = 10' } } },
      { nota: '{{j|s008|'}}', set: { l2: { x1: -1, y1: 2, x2: 5, y2: -1, tono: 'ok' }, l1: { tono: 'ok' }, eq: { t: 'x + 2y = 3    ·    2x + 4y = 6' } } }
    ]
  };

  // 4. vista per colonne
  SCENE.percolonne = {
    w: 600, h: 290, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 260, 250], dom: [-0.5, 5, -0.5, 8], tacche: 1, etX: '', etY: '' },
      { id: 'b', tipo: 'punto', in: 'ax', x: 4, y: 7, t: 'b = [4, 7]', tono: 'ok', tx: -80 },
      { id: 'a1', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 1, t: 'a₁', tono: 'due' },
      { id: 'a2', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 3, t: 'a₂', tx: -22, tono: 'due' },
      { id: 'p1', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 1, t: '', tono: 'ora', nascosto: true },
      { id: 'p2', tipo: 'vett', in: 'ax', x1: 2, y1: 1, x2: 4, y2: 7, t: 'y·a₂', tx: 10, tono: 'ora', nascosto: true },
      T('c1', 470, 50, 'x·a₁ + y·a₂ = b', { bold: true }), T('c2', 470, 90, '', { size: 13 }), T('c3', 470, 130, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "<b>Vista per colonne</b> (<i>column picture</i>, slide 61): Ax = b si legge come \"x volte la colonna a₁ più y volte la colonna a₂ deve fare b\". Le colonne sono a₁ = [2, 1] e a₂ = [1, 3]." },
      { nota: "La domanda diventa: <b>quanto</b> di a₁ e quanto di a₂ servono per arrivare a b = [4, 7]? Proviamo x = 1: una volta a₁.", set: { p1: { nascosto: false }, c2: { t: 'x = 1: 1·[2, 1]' } } },
      { nota: "Poi y = 2: due volte a₂, attaccato in coda. Si arriva esattamente in b.", set: { p2: { nascosto: false }, c2: { t: '1·[2, 1] + 2·[1, 3] = [4, 7]' } } },
      { nota: "La soluzione (x, y) = (1, 2) è la stessa della vista per righe: sono i <b>pesi</b> della combinazione di colonne che produce b. Il sistema ha soluzione quando b si può scrivere come combinazione delle colonne.", set: { c3: { t: '(x, y) = (1, 2)', tono: 'ok' } } }
    ]
  };

  // 5. spazio delle colonne / span
  SCENE.span = {
    w: 600, h: 290, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 260, 250], dom: [-1, 5, -1, 8], tacche: 1 },
      { id: 'sp', tipo: 'linea', in: 'ax', x1: -0.5, y1: -1, x2: 4, y2: 8, tono: 'spento', nascosto: true },
      { id: 'a1', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 2, t: 'a₁ = [1, 2]', tx: 12, ty: 4, tono: 'due' },
      { id: 'a2', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 4, t: 'a₂ = [2, 4]', tx: -92, ty: -8, tono: 'due' },
      { id: 'b1', tipo: 'punto', in: 'ax', x: 3, y: 6, t: '[3, 6]', tono: 'ok', nascosto: true },
      { id: 'b2', tipo: 'punto', in: 'ax', x: 3, y: 5, t: '[3, 5]', tono: 'no', nascosto: true, tx: 10, ty: 10 },
      T('c1', 470, 60, 'A = [[1, 2], [2, 4]]', { bold: true, size: 13 }), T('c2', 470, 100, '', { size: 13 }), T('c3', 470, 140, '', { size: 13 }), T('c4', 470, 180, '', { size: 13 })
    ],
    passi: [
      { nota: "Le colonne di A = [[1, 2], [2, 4]] sono a₁ = [1, 2] e a₂ = [2, 4]. Ma a₂ = 2·a₁: puntano nella stessa direzione." },
      { nota: "Tutte le combinazioni x·a₁ + y·a₂ restano su <b>una retta</b>: si chiama lo <b>span</b> delle colonne, o <b>spazio delle colonne</b> (<i>column space</i>, slide 64). Le colonne non \"coprono\" il piano.", set: { sp: { nascosto: false }, c2: { t: 'span = una retta' } } },
      { nota: "b = [3, 6] sta sulla retta: si raggiunge, e in <b>infiniti</b> modi (x + 2y = 3 ha infinite soluzioni).", set: { b1: { nascosto: false }, c3: { t: '[3, 6]: infinite soluzioni', tono: 'ok' } } },
      { nota: "b = [3, 5] è fuori dalla retta: <b>nessuna</b> combinazione delle colonne ci arriva, nessuna soluzione. È l'esercizio 8 del test. Regola della slide 64: \"vectors should span the space to have an inverse\".", set: { b2: { nascosto: false }, c4: { t: '[3, 5]: nessuna soluzione', tono: 'no' } } }
    ]
  };

  // 6. determinante come area
  const par = (a, b) => [[0, 0], a, [a[0] + b[0], a[1] + b[1]], b];
  SCENE.det = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 260, 240], dom: [-1, 4, -1, 5], tacche: 1 },
      { id: 'q', tipo: 'poli', in: 'ax', punti: [[0, 0], [1, 0], [1, 1], [0, 1]], tono: 'spento' },
      { id: 'p', tipo: 'poli', in: 'ax', punti: par([2, 1], [1, 3]), tono: 'ok', nascosto: true },
      T('c1', 470, 50, 'det [[a, b], [c, d]] = ad − bc', { size: 13, bold: true }),
      T('c2', 470, 100, '', { size: 13 }), T('c3', 470, 130, '', { size: 14, bold: true }), T('c4', 470, 180, '', { size: 13 })
    ],
    passi: [
      { nota: "Il <b>determinante</b> di una matrice 2 × 2 [[a, b], [c, d]] è il numero ad − bc. Ha un significato geometrico: di quanto la matrice moltiplica le <b>aree</b>. Il quadrato grigio ha area 1." },
      { nota: "A = [[2, 1], [1, 3]] manda il quadrato unitario nel parallelogramma che ha per lati le colonne [2, 1] e [1, 3].", set: { p: { nascosto: false }, c2: { t: 'A = [[2, 1], [1, 3]]' } } },
      { nota: "L'area del parallelogramma è det A = 2·3 − 1·1 = <b>5</b>: A moltiplica ogni area per 5.", set: { c3: { t: 'det A = 2·3 − 1·1 = 5', tono: 'ok' } } },
      { nota: "Con A = [[1, 2], [2, 4]] le colonne [1, 2] e [2, 4] sono sulla stessa retta: il parallelogramma si <b>schiaccia</b> in un segmento, area 0. det = 1·4 − 2·2 = <b>0</b>. Un piano schiacciato su una retta non si può \"srotolare\": la matrice non ha inversa.", set: { p: { punti: par([1, 2], [2, 4]), tono: 'no' }, c2: { t: 'A = [[1, 2], [2, 4]]' }, c3: { t: 'det = 1·4 − 2·2 = 0', tono: 'no' }, c4: { t: 'area schiacciata: niente inversa' } } }
    ]
  };

  // 7. inversa: la formula passo passo
  SCENE.inversa = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      T('ta', 90, 30, 'A', { bold: true }), G('A', 40, 40, [['2', '1'], ['1', '3']], { toni: { '0,0': 'dato', '0,1': 'dato', '1,0': 'dato', '1,1': 'dato' } }),
      T('tm', 280, 30, '', { bold: true }), G('M', 230, 40, [['', ''], ['', '']], { cw: 60 }),
      T('c1', 480, 60, '', { size: 13 }), T('c2', 480, 100, '', { size: 13 }), T('c3', 480, 140, '', { size: 13, bold: true }),
      T('c4', 300, 200, '', { size: 13 })
    ],
    passi: [
      { nota: "L'<b>inversa</b> A⁻¹ è la matrice che \"disfa\" A: A⁻¹A = I. Per una 2 × 2 c'è una formula: A⁻¹ = (1/det) · [[d, −b], [−c, a]]. Si costruisce in tre mosse." },
      { nota: "Mossa 1: si <b>scambiano</b> i due elementi della diagonale principale, a e d: 2 e 3.", set: { tm: { t: 'scambio a e d' }, M: { valori: [['3', ''], ['', '2']], toni: { '0,0': 'ora', '1,1': 'ora' } } } },
      { nota: "Mossa 2: si <b>cambia segno</b> agli altri due, b e c: 1 diventa −1.", set: { tm: { t: '− a b e c' }, M: { valori: [['3', '−1'], ['−1', '2']], toni: { '0,1': 'ora', '1,0': 'ora' } } } },
      { nota: "Mossa 3: si <b>divide</b> tutto per il determinante, 5. Ecco perché con det = 0 l'inversa non esiste: si dividerebbe per zero.", set: { tm: { t: 'A⁻¹' }, M: { valori: [['0.6', '−0.2'], ['−0.2', '0.4']], toni: { '0,0': 'ok', '0,1': 'ok', '1,0': 'ok', '1,1': 'ok' } }, c1: { t: 'det A = 5' }, c2: { t: 'A⁻¹ = (1/5)·[[3, −1], [−1, 2]]' } } },
      { nota: "Controllo: A⁻¹A = I (verificato con NumPy). E la soluzione del sistema: da Ax = b si moltiplica a sinistra per A⁻¹ e resta <b>x = A⁻¹b</b> = [0.6·4 − 0.2·7, −0.2·4 + 0.4·7] = [1, 2].", set: { c3: { t: 'x = A⁻¹ b = [1, 2]', tono: 'ok' }, c4: { t: 'A⁻¹A = I: la mossa che isola x' } } }
    ]
  };

  // 8. NumPy: solve, inv, errori
  SCENE.numpysolve = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s013|'}}',
    codice: { lang: 'python', testo: `A = np.array([[2, 1], [1, 3]])
b = np.array([4, 7])
np.linalg.det(A)          # 5.000000000000001
np.linalg.solve(A, b)     # array([1., 2.])
S = np.array([[1, 2], [2, 4]])
np.linalg.solve(S, b)     # LinAlgError: Singular matrix` },
    oggetti: [
      T('c1', 300, 50, '', { size: 14 }), T('c2', 300, 100, '', { size: 14, bold: true }), T('c3', 300, 150, '', { size: 14, bold: true }), T('c4', 300, 200, '', { size: 13 })
    ],
    passi: [
      { nota: "Le tre funzioni di NumPy per i sistemi, e cosa aspettarsi.", righe: [1, 2] },
      { nota: "<code>np.linalg.det</code> calcola il determinante in virgola mobile: 5.000000000000001 invece di 5. È un normale errore di arrotondamento: per controllare \"det = 0\" si usa una tolleranza, per esempio <code>abs(d) &lt; 1e-10</code>, mai <code>==</code>.", righe: [3], set: { c1: { t: 'det(A) = 5.000000000000001', tono: 'due' } } },
      { nota: "<code>np.linalg.solve(A, b)</code> risolve il sistema: [1, 2]. È meglio di <code>np.linalg.inv(A) @ b</code>: non calcola l'inversa, è più veloce e più preciso.", righe: [4], set: { c2: { t: 'solve(A, b) = [1, 2]', tono: 'ok' } } },
      { nota: "Con una matrice singolare (det = 0) <code>solve</code> si ferma con <code>LinAlgError: Singular matrix</code> (errore vero, riprodotto). Quando i dati sono più delle incognite si usa invece <code>np.linalg.lstsq</code> (<a href=\"w05-minimi-quadrati.html\">minimi quadrati</a>).", righe: [5, 6], set: { c3: { t: 'LinAlgError: Singular matrix', tono: 'no' }, c4: { t: 'più dati che incognite → lstsq' } } }
    ]
  };

  // 9. imparare = risolvere
  SCENE.imparasist = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s014|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 230, 230], dom: [0, 4, 0, 9], tacche: 1, etX: 'x', etY: 'y' },
      { id: 'p1', tipo: 'punto', in: 'ax', x: 1, y: 3, t: '(1, 3)', tono: 'dato' },
      { id: 'p2', tipo: 'punto', in: 'ax', x: 3, y: 7, t: '(3, 7)', tono: 'dato', tx: -48 },
      { id: 'li', tipo: 'linea', in: 'ax', x1: 0, y1: 1, x2: 4, y2: 9, tono: 'ok', nascosto: true },
      T('m', 440, 40, 'y = w₀ + w₁·x', { bold: true }),
      T('e1', 440, 80, '', { size: 13 }), T('e2', 440, 106, '', { size: 13 }),
      G('M', 330, 130, [['', ''], ['', '']], { cw: 44, ch: 34 }), T('mw', 450, 164, '', { size: 13 }),
      T('r', 440, 230, '', { bold: true })
    ],
    passi: [
      { nota: "Il modello y = w₀ + w₁x e due punti misurati. Le <b>incognite</b> sono i pesi w₀ e w₁; le x e le y sono <b>numeri noti</b>." },
      { nota: "Ogni punto dà un'equazione <b>nei pesi</b>: (1, 3) dà w₀ + 1·w₁ = 3, (3, 7) dà w₀ + 3·w₁ = 7.", set: { e1: { t: 'w₀ + 1·w₁ = 3' }, e2: { t: 'w₀ + 3·w₁ = 7' } } },
      { nota: "In forma matriciale: una riga per punto, [1, x]. La colonna di 1 moltiplica w₀, la colonna delle x moltiplica w₁. Questa matrice è la <b>design matrix</b> (settimana 4).", set: { M: { valori: [['1', '1'], ['1', '3']], toni: { '0,0': 'ora', '1,0': 'ora', '0,1': 'dato', '1,1': 'dato' } }, mw: { t: '· [w₀, w₁] = [3, 7]' } } },
      { nota: "Si risolve: w₁ = 2, w₀ = 1. Il modello è y = 1 + 2x, e passa per entrambi i punti. <b>Imparare un modello lineare = risolvere un sistema lineare nei pesi.</b>", set: { li: { nascosto: false }, r: { t: 'w = [1, 2]  →  y = 1 + 2x', tono: 'ok' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s015|}}</h1>
  <p class="lede">{{s|s016|}}</p>
</header>

<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <p>{{s|s019|}}</p>
  <figure class="passi" data-titolo="{{a|s020|}}">
    <div class="passo"><div class="espr"><mark class="dato">2x + 1y = 4</mark><br><mark class="due">1x + 3y = 7</mark></div><p class="nota">{{s|s021|}}</p></div>
    <div class="passo"><div class="espr">[<mark class="dato">2, 1</mark>] · [x, y] = 4,   [<mark class="due">1, 3</mark>] · [x, y] = 7</div><p class="nota">{{s|s022|}}</p></div>
    <div class="passo"><div class="espr">[[<mark class="dato">2, 1</mark>], [<mark class="due">1, 3</mark>]] · [x, y] = [4, 7]    ⇔    <mark class="ok">A x = b</mark></div><p class="nota">{{s|s023|}}</p></div>
  </figure>
  <figure class="scena" data-scena="allamatrice" data-titolo="{{a|s024|}}"></figure>
</section>

<section>
  <h2>{{s|s025|}}</h2>
  <p>{{s|s026|}}</p>
  <p>{{s|s027|}}</p>
  <p>{{s|s028|}}</p>
  <figure class="scena" data-scena="righe" data-titolo="{{a|s029|}}"></figure>
</section>

<section>
  <h2>{{s|s030|}}</h2>
  <p>{{s|s031|}}</p>
  <p>{{s|s032|}}</p>
  <p>{{s|s033|}}</p>
  <figure class="scena" data-scena="rette" data-titolo="{{a|s034|}}"></figure>
</section>

<section>
  <h2>{{s|s035|}}</h2>
  <p>{{s|s036|}}</p>
  <p>{{s|s037|}}</p>
  <figure class="scena" data-scena="percolonne" data-titolo="{{a|s038|}}"></figure>
</section>

<section>
  <h2>{{s|s039|}}</h2>
  <p>{{s|s040|}}</p>
  <p>{{s|s041|}}</p>
  <p>{{s|s042|}}</p>
  <figure class="scena" data-scena="span" data-titolo="{{a|s043|}}"></figure>
</section>

<section>
  <h2>{{s|s044|}}</h2>
  <p>{{s|s045|}}</p>
  <p>{{s|s046|}}</p>
  <div class="box regola" data-tit="{{a|s047|}}">
    <p>{{s|s048|}}</p>
  </div>
  <figure class="scena" data-scena="det" data-titolo="{{a|s049|}}"></figure>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <p>{{s|s051|}}</p>
  <p>{{s|s052|}}</p>
  <figure class="passi" data-titolo="{{a|s053|}}">
    <div class="passo"><div class="espr">[[a, b], [c, d]]⁻¹ = <mark class="dato">1 / (ad − bc)</mark> · [[d, −b], [−c, a]]</div><p class="nota">{{s|s054|}}</p></div>
    <div class="passo"><div class="espr">A⁻¹ = (1/5) · [[3, −1], [−1, 2]] = [[0.6, −0.2], [−0.2, 0.4]]</div><p class="nota">{{s|s055|}}</p></div>
    <div class="passo"><div class="espr">x = <mark class="ok">A⁻¹b</mark> = [0.6·4 − 0.2·7, −0.2·4 + 0.4·7] = [1, 2]</div><p class="nota">{{s|s056|}}</p></div>
  </figure>
  <figure class="scena" data-scena="inversa" data-titolo="{{a|s057|}}"></figure>
</section>

<section>
  <h2>{{s|s058|}}</h2>
  <p>{{s|s059|}}</p>
  <figure class="codice" data-titolo="{{a|s060|}}">
<pre data-lang="python">A = np.array([[2, 1], [1, 3]])
b = np.array([4, 7])
np.linalg.det(A)            # 5.000000000000001
np.linalg.inv(A) @ b        # array([1., 2.])
np.linalg.solve(A, b)       # array([1., 2.])</pre>
    <ol class="spiega">
      <li data-righe="3" data-segna="5.000000000000001@due"><p>{{s|s061|}}</p></li>
      <li data-righe="4" data-segna="np.linalg.inv(A) @ b@ora"><p>{{s|s062|}}</p></li>
      <li data-righe="5" data-segna="np.linalg.solve(A, b)@ok"><p>{{s|s063|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="numpysolve" data-titolo="{{a|s064|}}"></figure>
</section>

<section>
  <h2>{{s|s065|}}</h2>
  <p>{{s|s066|}}</p>
  <figure class="passi" data-titolo="{{a|s067|}}">
    <div class="passo"><div class="espr">modello: y = <mark class="ora">w₀</mark> + <mark class="ora">w₁</mark> x      dati: (1, 3), (3, 7)</div><p class="nota">{{s|s068|}}</p></div>
    <div class="passo"><div class="espr">w₀ + 1·w₁ = 3<br>w₀ + 3·w₁ = 7</div><p class="nota">{{s|s069|}}</p></div>
    <div class="passo"><div class="espr">[[1, 1], [1, 3]] · [w₀, w₁] = [3, 7]</div><p class="nota">{{s|s070|}}</p></div>
    <div class="passo"><div class="espr">w₁ = 2,  w₀ = 1   ⇒   <mark class="ok">y = 1 + 2x</mark></div><p class="nota">{{s|s071|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s072|}}</th><th>{{s|s073|}}</th><th>{{s|s074|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s075|}}</td><td>{{s|s076|}}</td><td>{{s|s077|}}</td></tr>
      <tr><td>{{s|s078|}}</td><td>{{s|s079|}}</td><td>{{s|s080|}}</td></tr>
      <tr><td>{{s|s081|}}</td><td>{{s|s082|}}</td><td>{{s|s083|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box esame" data-tit="{{a|s084|}}">
    <p>{{s|s085|}}</p>
  </div>
  <figure class="scena" data-scena="imparasist" data-titolo="{{a|s086|}}"></figure>
</section>

</main>
</body>
</html>
