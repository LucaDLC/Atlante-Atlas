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
  const Q = [[0, 0], [1, 0], [1, 1], [0, 1]];
  const mul = (M, [x, y]) => [M[0][0] * x + M[0][1] * y, M[1][0] * x + M[1][1] * y];
  const Vt = (id, x2, y2, t, tono, extra) => Object.assign({ id, tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2, y2, t, tono }, extra || {});

  // 1. definizione: additività
  SCENE.additiva = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 280, 240], dom: [-0.5, 5, -0.5, 4], tacche: 1, numeri: false },
      Vt('u', 1, 1, 'u', 'dato'), Vt('v', 2, 0, 'v', 'dato', { ty: 14 }),
      Vt('tu', 2, 1, 'T(u)', 'due', { nascosto: true }), Vt('tv', 2, 0, 'T(v)', 'due', { nascosto: true, ty: 14 }),
      { id: 'tvc', tipo: 'vett', in: 'ax', x1: 2, y1: 1, x2: 4, y2: 1, t: '', tono: 'due', nascosto: true },
      Vt('tuv', 4, 1, 'T(u + v) = [4, 1]', 'ok', { nascosto: true, tx: -60, ty: -16 }),
      T('m', 470, 40, 'T = H = [[1, 1], [0, 1]]', { size: 13, bold: true }),
      T('c1', 470, 80, '', { size: 13 }), T('c2', 470, 110, '', { size: 13 }), T('c3', 470, 150, '', { size: 13, bold: true }), T('c4', 470, 200, '', { size: 13 }), T('c5', 470, 228, '', { size: 13 })
    ],
    passi: [
      { nota: "Una <b>trasformazione</b> T prende un vettore e ne restituisce un altro. È <b>lineare</b> se rispetta due regole. Prima regola, <b>additività</b>: T(u + v) = T(u) + T(v). Proviamo con T = il taglio H, u = [1, 1], v = [2, 0]." },
      { nota: "Trasformo i due vettori separatamente: T(u) = [2, 1], T(v) = [2, 0].", set: { u: { tono: 'spento' }, v: { tono: 'spento', t: '' }, tu: { nascosto: false }, tv: { nascosto: false }, c1: { t: 'T(u) = [2, 1],  T(v) = [2, 0]' } } },
      { nota: "La loro somma, messi in coda: [2, 1] + [2, 0] = [4, 1].", set: { tv: { nascosto: true }, tvc: { nascosto: false }, c2: { t: 'T(u) + T(v) = [4, 1]' } } },
      { nota: "Trasformando direttamente la somma u + v = [3, 1] si ottiene H·[3, 1] = [4, 1]: lo stesso. <b>Sommare prima o dopo non cambia niente</b>. Seconda regola, <b>omogeneità</b>: T(c·u) = c·T(u), cioè allungare prima o dopo è lo stesso.", set: { tuv: { nascosto: false }, c3: { t: 'T(u + v) = [4, 1] ✓', tono: 'ok' } } },
      { nota: "Una funzione <b>non</b> lineare, f([x₁, x₂]) = [x₁², x₂]: f(u) + f(v) = [1, 1] + [4, 0] = [5, 1], ma f(u + v) = [9, 1]. Il quadrato rompe la regola. Conseguenza delle due regole: T(0) = 0, <b>l'origine resta ferma</b>.", set: { c4: { t: 'f(u) + f(v) = [5, 1]', tono: 'no' }, c5: { t: 'f(u + v) = [9, 1] ✗', tono: 'no' } } }
    ]
  };

  // 2. colonne = immagini della base
  SCENE.colbase = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 280, 240], dom: [-1.5, 4, -0.5, 4], tacche: 1 },
      Vt('e1', 1, 0, 'e₁', 'dato', { ty: 14 }), Vt('e2', 0, 1, 'e₂', 'due', { tx: -22 }),
      Vt('a1', 2, 1, 'T(e₁) = [2, 1]', 'dato', { nascosto: true }), Vt('a2', -1, 1, 'T(e₂) = [−1, 1]', 'due', { nascosto: true, tx: -40, ty: 18 }),
      Vt('p1', 4, 2, '2·T(e₁)', 'dato', { nascosto: true }),
      { id: 'p2', tipo: 'vett', in: 'ax', x1: 4, y1: 2, x2: 3, y2: 3, t: '', tono: 'due', nascosto: true },
      Vt('r', 3, 3, 'T(x) = [3, 3]', 'ok', { nascosto: true, tx: -100, ty: -6 }),
      T('m', 470, 40, 'A = [[2, −1], [1, 1]]', { size: 13, bold: true }),
      T('c1', 470, 80, '', { size: 13 }), T('c2', 470, 110, '', { size: 13 }), T('c3', 470, 150, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "La <b>base standard</b> del piano: e₁ = [1, 0] ed e₂ = [0, 1]. Ogni vettore è una loro combinazione: x = [2, 1] = 2·e₁ + 1·e₂." },
      { nota: "La matrice A = [[2, −1], [1, 1]] manda e₁ nella sua <b>prima colonna</b>, [2, 1], ed e₂ nella <b>seconda</b>, [−1, 1].", set: { a1: { nascosto: false }, a2: { nascosto: false }, c1: { t: 'colonne di A = T(e₁), T(e₂)' } } },
      { nota: "Per la linearità, T(x) = T(2·e₁ + 1·e₂) = 2·T(e₁) + 1·T(e₂). Due volte la prima colonna…", set: { e1: { nascosto: true }, e2: { nascosto: true }, p1: { nascosto: false }, c2: { t: '2·[2, 1] + 1·[−1, 1]' } } },
      { nota: "…più una volta la seconda: T(x) = [3, 3], come A·[2, 1]. <b>Basta sapere dove vanno e₁ ed e₂ per sapere dove va tutto</b>: per costruire la matrice di una trasformazione si scrivono in colonna le immagini della base.", set: { p2: { nascosto: false }, r: { nascosto: false }, c3: { t: 'T(x) = [3, 3]', tono: 'ok' } } }
    ]
  };

  // 3. catalogo (scena originale)
  const passo = (nome, M, nota) => {
    const pts = Q.map(p => mul(M, p));
    return { nota, set: { sq: { punti: pts, tono: 'ora' }, e1: { x2: M[0][0], y2: M[1][0] }, e2: { x2: M[0][1], y2: M[1][1] }, m: { t: nome } } };
  };
  SCENE.trasf = {
    w: 420, h: 280, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [60, 20, 300, 200], dom: [-2.5, 3.5, -1, 3], tacche: 1 },
      { id: 'orig', tipo: 'poli', in: 'ax', punti: Q, tono: 'spento' },
      { id: 'sq', tipo: 'poli', in: 'ax', punti: Q },
      { id: 'e1', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 0, t: 'e₁', tono: 'dato' },
      { id: 'e2', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 0, y2: 1, t: 'e₂', tono: 'due' },
      { id: 'm', tipo: 'testo', x: 210, y: 262, t: 'I = [[1, 0], [0, 1]]', size: 14, bold: true }
    ],
    passi: [
      { nota: '{{j|s005|'}}' },
      passo('S = [[2, 0], [0, 1]]', [[2, 0], [0, 1]], '<b>Scala</b>: e₁ va in [2, 0], e₂ resta. Il quadrato si allunga in orizzontale. Le <b>colonne</b> di S sono proprio le immagini di e₁ ed e₂.'),
      passo('R = [[0, −1], [1, 0]]', [[0, -1], [1, 0]], '<b>Rotazione di 90°</b> in senso antiorario: e₁ → [0, 1], e₂ → [−1, 0]. In generale [[cos φ, −sin φ], [sin φ, cos φ]].'),
      passo('F = [[−1, 0], [0, 1]]', [[-1, 0], [0, 1]], '<b>Riflessione</b> rispetto all\'asse y: e₁ → [−1, 0]. Il quadrato si ribalta come in uno specchio.'),
      passo('H = [[1, 1], [0, 1]]', [[1, 1], [0, 1]], '<b>Taglio (shear)</b>: e₂ → [1, 1], il quadrato diventa un parallelogramma, come un mazzo di carte spinto di lato.'),
      passo('P = [[1, 0], [0, 0]]', [[1, 0], [0, 0]], '<b>Proiezione</b> sull\'asse x: e₂ → [0, 0]. Il quadrato si schiaccia in un segmento. In tutti i casi l\'<b>origine resta ferma</b> e le rette restano rette.')
    ]
  };

  // 4. determinante = fattore d'area
  const det = (nome, M, d, nota, tono) => ({ nota, set: { sq: { punti: Q.map(p => mul(M, p)), tono }, m: { t: nome }, d: { t: 'det = ' + d, tono } } });
  SCENE.aree = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 280, 220], dom: [-2.5, 3, -1, 3], tacche: 1, numeri: false },
      { id: 'orig', tipo: 'poli', in: 'ax', punti: Q, tono: 'spento' },
      { id: 'sq', tipo: 'poli', in: 'ax', punti: Q, tono: 'ora' },
      T('m', 460, 60, 'I', { bold: true }), T('d', 460, 100, 'det = 1', { bold: true, size: 16 }), T('c', 460, 150, '', { size: 13 })
    ],
    passi: [
      det('S = [[2, 0], [0, 1]]', [[2, 0], [0, 1]], 2, "Il <b>determinante</b> dice di quanto la trasformazione moltiplica le aree. La scala S raddoppia la larghezza: l'area passa da 1 a 2, det = 2.", 'ora'),
      det('R = rotazione di 90°', [[0, -1], [1, 0]], 1, "Una rotazione sposta ma non deforma: area invariata, det = 1.", 'ora'),
      det('H = taglio', [[1, 1], [0, 1]], 1, "Il taglio deforma la forma, ma il parallelogramma ha la stessa base e la stessa altezza del quadrato: det = 1.", 'ora'),
      det('F = riflessione', [[-1, 0], [0, 1]], -1, "La riflessione lascia l'area uguale ma <b>ribalta</b> l'orientamento: il segno meno dice proprio questo. det = −1.", 'ora'),
      det('P = proiezione', [[1, 0], [0, 0]], 0, "La proiezione schiaccia il quadrato su un segmento: area 0, <b>det = 0</b>. Un'informazione è andata persa (la y), e non si può più tornare indietro: P non ha inversa (valori controllati con NumPy).", 'no')
    ]
  };

  // 5. composizione
  const img = M => Q.map(p => mul(M, p));
  SCENE.componi = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 280, 220], dom: [-2.5, 2.5, -1, 3], tacche: 1 },
      { id: 'orig', tipo: 'poli', in: 'ax', punti: Q, tono: 'spento' },
      { id: 'sq', tipo: 'poli', in: 'ax', punti: Q, tono: 'ora', nascosto: true },
      T('t', 460, 50, '', { bold: true }), T('c1', 460, 90, '', { size: 13 }), T('c2', 460, 120, '', { size: 13 }), T('c3', 460, 170, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "Comporre vuol dire applicare una trasformazione dopo l'altra. Con R (rotazione di 90°) e S (scala orizzontale per 2): SR vuol dire <b>prima R, poi S</b>, perché nel prodotto (SR)x la matrice più vicina a x agisce per prima.", set: { t: { t: 'SR: prima R, poi S' } } },
      { nota: "Prima R: il quadrato ruota di 90°.", set: { sq: { nascosto: false, punti: img([[0, -1], [1, 0]]) }, c1: { t: 'R: rotazione' } } },
      { nota: "Poi S: allunga in orizzontale per 2. Risultato: un rettangolo largo 2 e alto 1, a sinistra.", set: { sq: { punti: img([[0, -2], [1, 0]]), tono: 'ok' }, c2: { t: 'SR = [[0, −2], [1, 0]]' } } },
      { nota: "Nell'ordine opposto, RS: prima S (allunga in orizzontale)…", set: { sq: { punti: img([[2, 0], [0, 1]]), tono: 'ora' }, t: { t: 'RS: prima S, poi R' }, c1: { t: 'S: scala' }, c2: { t: '' } } },
      { nota: "…poi R (ruota): un rettangolo largo 1 e <b>alto</b> 2. Diverso da prima: <b>SR ≠ RS</b>. È l'esercizio 11 del test, ed è il motivo geometrico per cui il prodotto di matrici non è commutativo (calcolato con NumPy).", set: { sq: { punti: img([[0, -1], [2, 0]]), tono: 'ok' }, c1: { t: 'R: rotazione' }, c2: { t: 'RS = [[0, −1], [2, 0]]' }, c3: { t: 'SR ≠ RS', tono: 'no' } } }
    ]
  };

  // 6. inversa
  SCENE.disfa = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 280, 220], dom: [-2.5, 3, -1, 3], tacche: 1 },
      Vt('x', 1, 2, 'x = [1, 2]', 'dato'),
      Vt('ax1', -2, 1, 'Rx', 'ora', { nascosto: true, tx: -30 }),
      T('c1', 460, 50, '', { size: 13, bold: true }), T('c2', 460, 90, '', { size: 13 }), T('c3', 460, 130, '', { size: 13 }), T('c4', 460, 180, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "L'<b>inversa</b> A⁻¹ è la trasformazione che riporta ogni vettore dov'era: A⁻¹(Ax) = x. Parto da x = [1, 2]." },
      { nota: "R, rotazione di 90°: Rx = [−2, 1].", set: { ax1: { nascosto: false }, c1: { t: 'R: rotazione di +90°' }, c2: { t: 'Rx = [−2, 1]' } } },
      { nota: "L'inversa di una rotazione di 90° è la rotazione di −90°, R⁻¹ = [[0, 1], [−1, 0]] (che è anche Rᵀ: R è ortogonale). R⁻¹(Rx) = [1, 2] = x: si torna al punto di partenza.", set: { ax1: { x2: 1, y2: 2, t: '', tono: 'ok' }, x: { tono: 'ok' }, c3: { t: 'R⁻¹ = rotazione di −90°' }, c4: { t: 'R⁻¹(Rx) = x', tono: 'ok' } } },
      { nota: "Con la proiezione P = [[1, 0], [0, 0]] invece: P·[1, 2] = [1, 0], ma anche P·[1, 5] = [1, 0]. Dal risultato [1, 0] non si può sapere da dove si era partiti: <b>nessuna inversa</b>, coerente con det P = 0.", set: { x: { tono: 'dato' }, ax1: { x2: 1, y2: 0, t: 'Px = [1, 0]', tono: 'no', tx: 8, ty: -12 }, c1: { t: 'P: proiezione' }, c2: { t: 'P[1, 2] = P[1, 5] = [1, 0]' }, c3: { t: 'da [1, 0] non si torna indietro' }, c4: { t: 'det P = 0: niente P⁻¹', tono: 'no' } } }
    ]
  };

  // 7. iniettiva e suriettiva
  SCENE.iniettiva = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 280, 220], dom: [-1, 3, -1, 6], tacche: 1 },
      { id: 'a', tipo: 'punto', in: 'ax', x: 1, y: 2, t: '[1, 2]', tono: 'dato' },
      { id: 'b', tipo: 'punto', in: 'ax', x: 1, y: 5, t: '[1, 5]', tono: 'dato' },
      { id: 'la', tipo: 'linea', in: 'ax', x1: 1, y1: 2, x2: 1, y2: 0, tratt: true, tono: 'no', nascosto: true },
      { id: 'lb', tipo: 'linea', in: 'ax', x1: 1, y1: 5, x2: 1, y2: 2, tratt: true, tono: 'no', nascosto: true },
      { id: 'o', tipo: 'punto', in: 'ax', x: 1, y: 0, t: '[1, 0]', tono: 'no', nascosto: true, ty: 16 },
      { id: 'im', tipo: 'linea', in: 'ax', x1: -1, y1: 0, x2: 3, y2: 0, tono: 'spento', nascosto: true },
      T('m', 460, 40, 'P = [[1, 0], [0, 0]]', { size: 13, bold: true }),
      T('c1', 460, 80, '', { size: 13 }), T('c2', 460, 110, '', { size: 13 }), T('c3', 460, 150, '', { size: 13 }), T('c4', 460, 200, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "Due proprietà che gli esercizi della settimana 3 chiamano <i>one-to-one</i> e <i>onto</i>. Si capiscono bene con una trasformazione che le viola: la proiezione P." },
      { nota: "<b>Iniettiva</b> (<i>one-to-one</i>): ingressi diversi danno uscite diverse. P manda [1, 2] e [1, 5] nello <b>stesso</b> punto [1, 0]: P non è iniettiva. Succede quando le colonne sono dipendenti (qui la seconda colonna è 0).", set: { la: { nascosto: false }, lb: { nascosto: false }, o: { nascosto: false }, c1: { t: 'P[1, 2] = P[1, 5] = [1, 0]' }, c2: { t: 'non iniettiva', tono: 'no' } } },
      { nota: "<b>Suriettiva</b> (<i>onto</i>): ogni punto dello spazio di arrivo è raggiunto da qualche ingresso. Le uscite di P stanno tutte sull'asse x (lo span delle colonne): [0, 1] non si raggiunge mai. P non è suriettiva.", set: { im: { nascosto: false }, c3: { t: 'solo asse x: non suriettiva' } } },
      { nota: "Per una matrice <b>quadrata</b> le due proprietà vanno insieme e valgono esattamente quando det ≠ 0: allora la matrice è invertibile. Per matrici non quadrate no: una 2 × 3 (da ℝ³ a ℝ²) non può essere iniettiva (per esempio [[1, 0, 2], [0, 1, 1]] manda [2, 1, −1] in [0, 0] come il vettore nullo); una 3 × 2 non può essere suriettiva.", set: { c4: { t: 'quadrata: entrambe ⇔ det ≠ 0' } } }
    ]
  };

  // 8. traslazione
  SCENE.traslazione = {
    w: 600, h: 260, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 280, 220], dom: [-1, 3, -1, 3], tacche: 1 },
      { id: 'orig', tipo: 'poli', in: 'ax', punti: Q, tono: 'spento' },
      { id: 'sq', tipo: 'poli', in: 'ax', punti: Q, tono: 'no', nascosto: true },
      { id: 'o', tipo: 'punto', in: 'ax', x: 0, y: 0, t: 'origine', tono: 'ora', tx: 8, ty: 14 },
      T('c1', 460, 60, '', { size: 13, bold: true }), T('c2', 460, 100, '', { size: 13 }), T('c3', 460, 140, '', { size: 13 })
    ],
    passi: [
      { nota: "Spostare tutto di [1, 1]: una <b>traslazione</b>, x ↦ x + [1, 1]. Serve spessissimo (per allineare due pose bisogna anche spostarle)." },
      { nota: "Il quadrato si sposta, e con lui l'origine: 0 ↦ [1, 1].", set: { sq: { nascosto: false, punti: Q.map(([x, y]) => [x + 1, y + 1]) }, o: { x: 1, y: 1, t: '0 ↦ [1, 1]' }, c1: { t: 'x ↦ x + [1, 1]' } } },
      { nota: "Ma una trasformazione lineare lascia <b>sempre</b> ferma l'origine (A·0 = 0). Quindi la traslazione <b>non è lineare</b>, e non esiste nessuna matrice 2 × 2 che la faccia.", set: { c2: { t: 'A·0 = 0 per ogni A', tono: 'no' }, c3: { t: 'nessuna A 2 × 2 trasla' } } },
      { nota: "La soluzione sono le <b>trasformazioni affini</b> Ax + t (lineare più traslazione) e le <b>coordinate omogenee</b>, che aggiungendo una componente 1 ai vettori trasformano la traslazione in un prodotto di matrici 3 × 3 (<a href=\"w05-affine-omogenee.html\">affine e coordinate omogenee</a>)." }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s011|}}</h1>
  <p class="lede">{{s|s012|}}</p>
</header>

<section>
  <h2>{{s|s013|}}</h2>
  <p>{{s|s014|}}</p>
  <div class="box regola" data-tit="{{a|s015|}}">
    <p>{{s|s016|}}</p>
  </div>
  <p>{{s|s017|}}</p>
  <p>{{s|s018|}}</p>
  <figure class="scena" data-scena="additiva" data-titolo="{{a|s019|}}"></figure>
</section>

<section>
  <h2>{{s|s020|}}</h2>
  <p>{{s|s021|}}</p>
  <figure class="passi" data-titolo="{{a|s022|}}">
    <div class="passo"><div class="espr">x = [x₁, x₂] = x₁·<mark class="dato">e₁</mark> + x₂·<mark class="due">e₂</mark></div><p class="nota">{{s|s023|}}</p></div>
    <div class="passo"><div class="espr">T(x) = x₁·<mark class="dato">T(e₁)</mark> + x₂·<mark class="due">T(e₂)</mark></div><p class="nota">{{s|s024|}}</p></div>
    <div class="passo"><div class="espr">{{s|s025|}}</div><p class="nota">{{s|s026|}}</p></div>
  </figure>
  <p>{{s|s027|}}</p>
  <figure class="scena" data-scena="colbase" data-titolo="{{a|s028|}}"></figure>
</section>

<section>
  <h2>{{s|s029|}}</h2>
  <p>{{s|s030|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s031|}}</th><th>{{s|s032|}}</th><th>{{s|s033|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s034|}}</td><td>[[sₓ, 0], [0, s<sub>y</sub>]]</td><td>sₓ·s<sub>y</sub></td></tr>
      <tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>1</td></tr>
      <tr><td>{{s|s037|}}</td><td>[[−1, 0], [0, 1]]</td><td>−1</td></tr>
      <tr><td>{{s|s038|}}</td><td>[[1, k], [0, 1]]</td><td>1</td></tr>
      <tr><td>{{s|s039|}}</td><td>[[1, 0], [0, 0]]</td><td>{{s|s040|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s041|}}</p>
  <figure class="scena" data-scena="trasf" data-titolo="{{a|s042|}}"></figure>
</section>

<section>
  <h2>{{s|s043|}}</h2>
  <p>{{s|s044|}}</p>
  <p>{{s|s045|}}</p>
  <figure class="scena" data-scena="aree" data-titolo="{{a|s046|}}"></figure>
</section>

<section>
  <h2>{{s|s047|}}</h2>
  <p>{{s|s048|}}</p>
  <figure class="passi" data-titolo="{{a|s049|}}">
    <div class="passo"><div class="espr">x → <mark class="ora">R</mark>x → <mark class="due">S</mark>(<mark class="ora">R</mark>x) = (<mark class="ok">SR</mark>)x</div><p class="nota">{{s|s050|}}</p></div>
    <div class="passo"><div class="espr">SR = [[0, −2], [1, 0]]     RS = [[0, −1], [2, 0]]</div><p class="nota">{{s|s051|}}</p></div>
  </figure>
  <p>{{s|s052|}}</p>
  <figure class="scena" data-scena="componi" data-titolo="{{a|s053|}}"></figure>
</section>

<section>
  <h2>{{s|s054|}}</h2>
  <p>{{s|s055|}}</p>
  <p>{{s|s056|}}</p>
  <p>{{s|s057|}}</p>
  <figure class="scena" data-scena="disfa" data-titolo="{{a|s058|}}"></figure>
</section>

<section>
  <h2>{{s|s059|}}</h2>
  <p>{{s|s060|}}</p>
  <p>{{s|s061|}}</p>
  <p>{{s|s062|}}</p>
  <p>{{s|s063|}}</p>
  <figure class="scena" data-scena="iniettiva" data-titolo="{{a|s064|}}"></figure>
</section>

<section>
  <h2>{{s|s065|}}</h2>
  <p>{{s|s066|}}</p>
  <div class="box idea" data-tit="{{a|s067|}}">
    <p>{{s|s068|}}</p>
  </div>
  <figure class="scena" data-scena="traslazione" data-titolo="{{a|s069|}}"></figure>
</section>

</main>
</body>
</html>
