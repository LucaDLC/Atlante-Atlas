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
SCENE.base = {
  w: 420, h: 300, lato: true,
  legenda: '{{j|s002|'}}',
  codice: { lang: 'python', testo: `P = np.array([4, 3])
A = np.array([[2, 1],
              [1, 2]])          # colonne: a1, a2
xA = np.linalg.solve(A, P)     # [1.667, 0.667]
A @ xA                          # [4., 3.]  (si torna a P)` },
  oggetti: [
    { id: 'ax', tipo: 'assi', box: [40, 20, 340, 255], dom: [-0.5, 5, -0.5, 4], tacche: 1 },
    { id: 'e1', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 0, t: 'e1', tx: -10, ty: -12, tono: 'dato' },
    { id: 'e2', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 0, y2: 1, t: 'e2', tx: 14, ty: 8, tono: 'dato' },
    { id: 'h4', tipo: 'linea', in: 'ax', x1: 0, y1: 0, x2: 4, y2: 0, tratt: true, tono: 'dato', nascosto: true },
    { id: 'v3', tipo: 'linea', in: 'ax', x1: 4, y1: 0, x2: 4, y2: 3, tratt: true, tono: 'dato', nascosto: true },
    { id: 'a1', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 1, t: 'a1', tx: 4, ty: 16, tono: 'due', nascosto: true },
    { id: 'a2', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 2, t: 'a2', tx: -24, ty: 0, tono: 'due', nascosto: true },
    { id: 'c1', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 3.333, y2: 1.667, t: '5/3 · a1', tx: 6, ty: 18, tono: 'ora', nascosto: true },
    { id: 'c2', tipo: 'vett', in: 'ax', x1: 3.333, y1: 1.667, x2: 4, y2: 3, t: '2/3 · a2', tx: -74, ty: 8, tono: 'ora', nascosto: true },
    { id: 'P', tipo: 'punto', in: 'ax', x: 4, y: 3, t: 'P', tx: 10, ty: -8, tono: 'ok' },
    { id: 'n', tipo: 'testo', x: 210, y: 292, t: '', size: 13, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}', righe: [1] },
    { nota: '{{j|s004|'}}', set: { h4: { nascosto: false }, v3: { nascosto: false }, n: { t: 'P = 4·e1 + 3·e2', tono: 'dato' } } },
    { nota: '{{j|s005|'}}', righe: [2, 3], set: { h4: { nascosto: true }, v3: { nascosto: true }, a1: { nascosto: false }, a2: { nascosto: false }, e1: { tono: 'spento' }, e2: { tono: 'spento' }, n: { t: '' } } },
    { nota: '{{j|s006|'}}', righe: [4] },
    { nota: '{{j|s007|'}}', set: { c1: { nascosto: false } } },
    { nota: '{{j|s008|'}}', righe: [5], set: { c2: { nascosto: false }, n: { t: 'P = 5/3·a1 + 2/3·a2', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const D = {"x": [0.0, 0.25, 0.5, 0.75, 1.0, 1.25, 1.5, 1.75, 2.0, 2.25, 2.5, 2.75, 3.0, 3.25, 3.5, 3.75, 4.0, 4.25, 4.5, 4.75, 5.0, 5.25, 5.5, 5.75, 6.0], "f": [0.0, 0.247, 0.479, 0.682, 0.841, 0.949, 0.997, 0.984, 0.909, 0.778, 0.598, 0.382, 0.141, -0.108, -0.351, -0.572, -0.757, -0.895, -0.978, -0.999, -0.959, -0.859, -0.706, -0.508, -0.279], "casuale": [0.0, 0.322, 0.411, 0.459, 0.728, 0.701, 1.013, 1.319, 0.786, 0.623, 0.721, 0.471, 0.167, -0.341, -0.358, -0.398, -1.093, -1.009, -1.453, -1.322, -1.419, -0.918, -1.022, -0.44, -0.24], "sistematico": [0.6, 0.847, 1.079, 1.282, 1.441, 1.549, 1.597, 1.584, 1.509, 1.378, 1.198, 0.982, 0.741, 0.492, 0.249, 0.028, -0.157, -0.295, -0.378, -0.399, -0.359, -0.259, -0.106, 0.092, 0.321], "saleppepe": [0.0, 0.247, 0.479, 0.682, 1.8, 0.949, 0.997, 0.984, 0.909, 0.778, 0.598, -1.8, 0.141, -0.108, -0.351, -0.572, -0.757, -0.895, -0.978, 1.8, -0.959, -0.859, -0.706, -0.508, -0.279], "slope_y": 2.003590857441914, "slope_x": 1.0000154927382434, "py": [[0.18, 1.57], [0.31, -0.45], [-1.07, -1.41], [0.03, 0.85], [-0.97, -1.22], [-0.2, -0.1], [0.85, 2.01], [0.61, 1.73], [0.83, 1.42], [0.55, -0.28], [1.91, 4.39], [0.53, -0.54], [-1.15, -2.1], [-0.1, 0.8], [-0.26, -0.15], [-0.92, -0.3], [-0.23, -0.3], [-0.44, -0.27], [1.25, 2.45], [-2.42, -5.1], [-0.99, -2.32], [0.57, 2.14], [-0.34, -1.94], [0.82, 1.62], [0.81, -0.74], [-2.1, -4.21], [0.62, 1.64], [-0.58, -0.56], [-0.03, -0.51], [1.45, 4.61]], "px": [[1.0, 0.35], [1.62, 0.62], [-1.03, -2.14], [-0.12, 0.05], [-0.37, -1.94], [-0.3, -0.4], [0.82, 1.7], [0.85, 1.21], [0.24, 1.66], [-0.23, 1.09], [-0.27, 3.81], [1.6, 1.05], [-2.15, -2.3], [0.86, -0.2], [0.23, -0.52], [-0.64, -1.84], [-0.71, -0.46], [0.1, -0.87], [4.77, 2.49], [-3.97, -4.84], [-0.3, -1.98], [1.44, 1.15], [-0.63, -0.67], [-0.59, 1.65], [1.23, 1.63], [-2.97, -4.2], [1.94, 1.23], [-1.24, -1.16], [-0.44, -0.07], [-0.26, 2.9]], "std_1": 0.998, "std_10": 0.316, "std_100": 0.1, "desc": [22.4, 3.0, 1505.8399999999997, 38.8051542968199], "desc2": [3.0, 3.0], "tr": [[0.0, 1.79], [1.0, 1.87], [2.0, 1.52], [3.0, 2.39], [4.0, 2.86], [5.0, 4.68], [6.0, 3.53], [7.0, 5.19]], "te": [[0.5, 1.31], [2.5, 2.76], [4.5, 3.25], [6.5, 4.45]], "p7": [0.008353231129090179, -0.1980650691616189, 1.8578432126329238, -8.766511389141694, 21.743927592070747, -26.340541270786048, 11.779314815024934, 1.7873205715809741], "p1": [0.5006, 1.2257], "mse7": [0.0, 3.196], "mse1": [0.338, 0.04], "c7": [[0.0, 1.787], [0.1, 2.723], [0.2, 3.25], [0.3, 3.471], [0.4, 3.47], [0.5, 3.317], [0.6, 3.068], [0.7, 2.769], [0.8, 2.454], [0.9, 2.148], [1.0, 1.872], [1.1, 1.636], [1.2, 1.449], [1.3, 1.313], [1.4, 1.227], [1.5, 1.19], [1.6, 1.196], [1.7, 1.238], [1.8, 1.31], [1.9, 1.405], [2.0, 1.515], [2.1, 1.634], [2.2, 1.756], [2.3, 1.874], [2.4, 1.986], [2.5, 2.087], [2.6, 2.175], [2.7, 2.25], [2.8, 2.31], [2.9, 2.358], [3.0, 2.394], [3.1, 2.421], [3.2, 2.443], [3.3, 2.463], [3.4, 2.484], [3.5, 2.512], [3.6, 2.548], [3.7, 2.599], [3.8, 2.665], [3.9, 2.751], [4.0, 2.857], [4.1, 2.984], [4.2, 3.133], [4.3, 3.302], [4.4, 3.488], [4.5, 3.688], [4.6, 3.897], [4.7, 4.108], [4.8, 4.315], [4.9, 4.509], [5.0, 4.681], [5.1, 4.823], [5.2, 4.925], [5.3, 4.978], [5.4, 4.973], [5.5, 4.904], [5.6, 4.766], [5.7, 4.556], [5.8, 4.275], [5.9, 3.929], [6.0, 3.528], [6.1, 3.09], [6.2, 2.639], [6.3, 2.208], [6.4, 1.843], [6.5, 1.597], [6.6, 1.542], [6.7, 1.762], [6.8, 2.358], [6.9, 3.453], [7.0, 5.188]], "rank": 2, "xA": [1.6667, 0.6667], "xB": [3.5, -0.5], "T": [[1.5, 1.5], [-0.5, 0.5]]};
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const V = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', in: 'ax', x1, y1, x2, y2, t }, extra || {});
  const P = (id, x, y, t, extra) => Object.assign({ id, tipo: 'punto', in: 'ax', x, y, t }, extra || {});
  const L = (id, x1, y1, x2, y2, extra) => Object.assign({ id, tipo: 'linea', in: 'ax', x1, y1, x2, y2 }, extra || {});
  const pl = p => p.concat(p.slice().reverse());

    SCENE.span = {
      w: 640, h: 300, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [
        { id: 'ax', tipo: 'assi', box: [40, 20, 320, 250], dom: [-3, 4, -3, 4], tacche: 1, etX: 'x₁', etY: 'x₂' },
        L('r1', -1.5, -3, 2, 4, { tratt: true, tono: 'ora', nascosto: true }),
        V('v1', 0, 0, 1, 2, 'v₁', { tono: 'dato' }), V('v2', 0, 0, 2, 1, 'v₂', { tono: 'due', nascosto: true }), V('v3', 0, 0, 2, 4, 'v₃ = 2v₁', { tono: 'no', nascosto: true, tx: 6, ty: -6 }),
        T('c', 515, 60, '', { size: 12 }), T('c2', 515, 90, '', { size: 12 }), T('c3', 515, 120, '', { size: 12 })
      ],
      passi: [
        { nota: "Una <b>combinazione lineare</b> di v₁ = (1, 2): c₁v₁, per ogni numero c₁. Lo <b>span</b> è l'insieme di tutte le combinazioni." },
        { nota: "Con un solo vettore, variando c₁ si ottiene una <b>retta</b> per l'origine (c₁ = 0 dà lo 0, che sta sempre nello span).", set: { r1: { nascosto: false }, c: { t: 'span(v₁) = una retta' } } },
        { nota: "Aggiungo v₂ = (2, 1), non allineato: ora c₁v₁ + c₂v₂ raggiunge <b>ogni punto del piano</b>. Una direzione nuova, una dimensione in più.", set: { v2: { nascosto: false }, r1: { tono: 'spento' }, c2: { t: 'span(v₁, v₂) = il piano' } } },
        { nota: "Aggiungo v₃ = (2, 4) = 2v₁: sta già nello span, quindi <b>non aggiunge niente</b>. Lo span resta il piano.", set: { v3: { nascosto: false }, c3: { t: 'v₃ = 2v₁: nessuna direzione nuova', tono: 'no' } } },
        { nota: "Collegamento con i sistemi: <code>Ax = x₁a₁ + x₂a₂ + …</code>, quindi Ax = b ha soluzione solo se b sta nello span delle colonne di A (il <b>column space</b>). A = [[1, 2], [1, 0], [3, 2]] ha due colonne in 3D: il suo column space è un piano dentro lo spazio.", set: { c: { t: 'Ax = b risolvibile ⇔' }, c2: { t: 'b nello span delle colonne' }, c3: { t: '(column space di A)', tono: null } } }
      ]
    };

    SCENE.indip = {
      w: 640, h: 300, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [
        { id: 'ax', tipo: 'assi', box: [40, 20, 320, 250], dom: [-1, 4, -1, 5], tacche: 1, etX: 'x₁', etY: 'x₂' },
        V('v', 0, 0, 1, 2, 'v = (1, 2)', { tono: 'dato', tx: 8, ty: 10 }), V('u', 0, 0, 2, 4, 'u = (2, 4)', { tono: 'due', nascosto: true }),
        V('m', 2, 4, 0, 0, '−2·v', { tono: 'ora', nascosto: true, tx: 30, ty: 40 }),
        T('c', 515, 60, '', { size: 12 }), T('c2', 515, 90, '', { size: 12 }), T('c3', 515, 130, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "<b>Indipendenti</b>: l'unico modo di ottenere 0 con c₁v₁ + … + cₙvₙ è con tutti i pesi a 0. A parole: nessuno si scrive come combinazione degli altri." },
        { nota: "u = (2, 4) = 2 · (1, 2) = 2v: stessa retta.", set: { u: { nascosto: false }, c: { t: 'u = 2v' } } },
        { nota: "Allora 1·u − 2·v = 0: parto dall'origine, vado su u, torno indietro di 2v e sono di nuovo nell'origine. Pesi <b>non nulli</b> (1 e −2) che danno 0: u e v sono <b>dipendenti</b>.", set: { m: { nascosto: false }, c2: { t: '1·u − 2·v = (0, 0)' }, c3: { t: 'dipendenti', tono: 'no' } } },
        { nota: "Come colonne di A = [[2, 1], [4, 2]]: det = 0, rango 1, A·(1, −2) = (0, 0) (verificato con NumPy). Colonne dipendenti ⇒ A⁻¹ non esiste, e Ax = b ha nessuna o infinite soluzioni. In ℝⁿ stanno al massimo n vettori indipendenti.", set: { c: { t: 'det A = 0, rango 1' }, c2: { t: 'A·(1, −2) = (0, 0)' }, c3: { t: 'niente A⁻¹', tono: 'no' } } }
      ]
    };

    SCENE.cambiobase = {
      w: 640, h: 300, lato: true,
      legenda: '{{j|s011|'}}',
      oggetti: [
        { id: 'ax', tipo: 'assi', box: [40, 20, 320, 250], dom: [-1, 5, -1, 4.5], tacche: 1 },
        V('b1', 0, 0, 1, 1, 'b₁', { tono: 'due', tx: -16, ty: -6 }), V('b2', 0, 0, -1, 1, 'b₂', { tono: 'due', tx: -16, ty: -4 }),
        V('p1', 0, 0, 3.5, 3.5, '3.5·b₁', { tono: 'ora', nascosto: true, tx: -60, ty: -6 }), V('p2', 3.5, 3.5, 4, 3, '−0.5·b₂', { tono: 'ora', nascosto: true, tx: 6, ty: 6 }),
        P('P', 4, 3, 'P', { tono: 'ok' }),
        T('c', 515, 50, 'P = (4, 3)', { size: 12 }), T('c2', 515, 80, '', { size: 12 }), T('c3', 515, 110, '', { size: 12 }), T('c4', 515, 150, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "Peter sta in P = (4, 3) (coordinate standard). Anders lo descrive nella sua base A: x<sub>A</sub> = (5/3, 2/3). Bertha usa un'altra base: b₁ = (1, 1), b₂ = (−1, 1)." },
        { nota: "Da A a standard: <code>x<sub>E</sub> = A x<sub>A</sub></code>. Da standard a B: <code>x<sub>B</sub> = B⁻¹ x<sub>E</sub></code>. Insieme: <b>x<sub>B</sub> = B⁻¹A x<sub>A</sub> = T x<sub>A</sub></b>, con T = B⁻¹A la matrice di cambio di base.", set: { c2: { t: 'T = B⁻¹A' }, c3: { t: '= [[1.5, 1.5], [−0.5, 0.5]]' } } },
        { nota: "T · (5/3, 2/3) = (3.5, −0.5). Controllo con i vettori: 3.5 · b₁ = (3.5, 3.5)…", set: { p1: { nascosto: false }, c4: { t: 'x_B = (3.5, −0.5)' } } },
        { nota: "…più −0.5 · b₂ = (0.5, −0.5) dà (4, 3): lo stesso P. Anders ha passato la posizione a Bertha senza passare da (4, 3). Tutto verificato con NumPy. Con una base <b>ortonormale</b> Q⁻¹ = Qᵀ: ogni coordinata è un prodotto interno, ed è la base che sceglie la PCA.", set: { p2: { nascosto: false }, c4: { t: '3.5·b₁ − 0.5·b₂ = (4, 3)', tono: 'ok' } } }
      ]
    };

    const col = (id, x, vals, tono, tit) => [T(id + 't', x + 30, 34, tit, { size: 12, bold: true }), ...vals.map((v, i) => R(id + i, x, 44 + i * 34, 60, 30, v, { tono }))];
    SCENE.perchebasi = {
      w: 560, h: 240, lato: true,
      legenda: '{{j|s012|'}}',
      oggetti: [].concat(col('a', 30, ['1', '1', '1', '1'], 'dato', '1'), col('b', 100, ['0', '1', '2', '3'], 'dato', 'x'), col('c', 170, ['0', '2', '4', '6'], 'dato', '2x'), [T('c', 400, 60, '', { size: 12 }), T('c2', 400, 90, '', { size: 12 }), T('c3', 400, 130, '', { size: 12, bold: true }), T('c4', 280, 215, '', { size: 12 })]),
      passi: [
        { nota: "Una design matrix X con tre colonne: 1, x e 2x. Nei minimi quadrati serve <code>XᵀX</code> invertibile, cioè colonne <b>indipendenti</b>." },
        { nota: "Ma la terza colonna è 2 volte la seconda: è <b>dipendente</b>. Rango 2 invece di 3 (verificato con NumPy).", set: { c0: { tono: 'no' }, c1: { tono: 'no' }, c2: { tono: 'no' }, c3: { tono: 'no' }, c: { t: 'colonna 3 = 2 · colonna 2' }, c2: { t: 'rango(X) = 2' } } },
        { nota: "<code>np.linalg.inv(X.T @ X)</code> → <b>LinAlgError: Singular matrix</b>. Due feature che dicono la stessa cosa: infinite combinazioni di pesi danno la stessa previsione.", set: { c3: { t: 'XᵀX singolare: niente soluzione unica', tono: 'no' } } },
        { nota: "Il resto della settimana in una riga per idea: il <b>column space</b> è dove i minimi quadrati proiettano y; [1, x, x²] è una <b>base di funzioni</b> per i polinomi; il <b>cambio di base</b> descrive i dati con assi più utili, e con pochi vettori di base si riducono le dimensioni (PCA).", set: { c4: { t: 'indipendenza · column space · basi di funzioni · cambio di base → PCA' } } }
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
  <figure class="passi" data-titolo="{{a|s016|}}">
    <div class="passo"><div class="espr"><mark class="ora">c₁</mark>v₁ + <mark class="ora">c₂</mark>v₂ + … + <mark class="ora">cₙ</mark>vₙ</div><p class="nota">{{s|s017|}}</p></div>
    <div class="passo"><div class="espr">{{s|s018|}}</div><p class="nota">{{s|s019|}}</p></div>
    <div class="passo"><div class="espr">{{s|s020|}}</div><p class="nota">{{s|s021|}}</p></div>
    <div class="passo"><div class="espr">{{s|s022|}}</div><p class="nota">{{s|s023|}}</p></div>
  </figure>
  <div class="box regola" data-tit="{{a|s024|}}">
    <p>{{s|s025|}}</p>
  </div>
  <figure class="scena" data-scena="span" data-titolo="{{a|s026|}}"></figure>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <div class="box regola" data-tit="{{a|s028|}}">
    <p>{{s|s029|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s030|}}">
    <div class="passo"><div class="espr"><mark class="dato">u</mark> = (2, 4) = 2 · (1, 2) = 2<mark class="due">v</mark></div><p class="nota">{{s|s031|}}</p></div>
    <div class="passo"><div class="espr">1·<mark class="dato">u</mark> − 2·<mark class="due">v</mark> = (2 − 2, 4 − 4) = <mark class="no">0</mark></div><p class="nota">{{s|s032|}}</p></div>
    <div class="passo"><div class="espr">A = [[2, 1], [4, 2]]:  det = <mark class="no">0</mark>,  rango = 1,  A · (1, −2) = (0, 0)</div><p class="nota">{{s|s033|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s034|}}</th><th>{{s|s035|}}</th><th>{{s|s036|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s037|}}</td><td>≠ 0</td><td>{{s|s038|}}</td></tr>
      <tr><td>{{s|s039|}}</td><td>= 0</td><td>{{s|s040|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box attenzione" data-tit="{{a|s041|}}">
    <p>{{s|s042|}}</p>
  </div>
  <figure class="scena" data-scena="indip" data-titolo="{{a|s043|}}"></figure>
</section>

<section>
  <h2>{{s|s044|}}</h2>
  <div class="box regola" data-tit="{{a|s045|}}">
    <p>{{s|s046|}}</p>
  </div>
  <p>{{s|s047|}}</p>
  <figure class="scena" data-scena="base" data-titolo="{{a|s048|}}"></figure>
</section>

<section>
  <h2>{{s|s049|}}</h2>
  <figure class="passi" data-titolo="{{a|s050|}}">
    <div class="passo"><div class="espr">x<sub>E</sub> = <mark class="due">A</mark> x<sub>A</sub></div><p class="nota">{{s|s051|}}</p></div>
    <div class="passo"><div class="espr">x<sub>A</sub> = <mark class="ora">A⁻¹</mark> x<sub>E</sub></div><p class="nota">{{s|s052|}}</p></div>
    <div class="passo"><div class="espr">x<sub>B</sub> = <mark class="ora">B⁻¹</mark> <mark class="due">A</mark> x<sub>A</sub> = <mark class="ok">T</mark> x<sub>A</sub>,    T = B⁻¹A</div><p class="nota">{{s|s053|}}</p></div>
    <div class="passo"><div class="espr">{{s|s054|}}</div><p class="nota">{{s|s055|}}</p></div>
  </figure>
  <div class="box idea" data-tit="{{a|s056|}}">
    <p>{{s|s057|}}</p>
  </div>
  <figure class="scena" data-scena="cambiobase" data-titolo="{{a|s058|}}"></figure>
</section>

<section>
  <h2>{{s|s059|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s060|}}</th><th>{{s|s061|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s062|}}</td><td>{{s|s063|}}</td></tr>
      <tr><td>{{s|s064|}}</td><td>{{s|s065|}}</td></tr>
      <tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td></tr>
      <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td></tr>
      <tr><td>{{s|s070|}}</td><td>{{s|s071|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box esame" data-tit="{{a|s072|}}">
    <p>{{s|s073|}}</p>
  </div>
  <figure class="scena" data-scena="perchebasi" data-titolo="{{a|s074|}}"></figure>
</section>

</main>
</body>
</html>
