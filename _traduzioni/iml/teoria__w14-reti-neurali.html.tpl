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
  const L = w => (w - 3) * (w - 3);
  const ogg = [{ id: 'ax', tipo: 'assi', box: [45, 15, 330, 240], dom: [-4, 11, -3, 66], tacche: 5, etX: 'w', etY: 'L(w)' }];
  for (let k = 0; k < 60; k++) { const a = -4 + k * 0.25, b = a + 0.25; ogg.push({ id: 'c' + k, tipo: 'linea', in: 'ax', x1: a, y1: L(a), x2: b, y2: L(b), tono: 'dato' }); }
  const cammino = (id, ws, tono) => ws.forEach((w, i) => {
    ogg.push({ id: id + 'p' + i, tipo: 'punto', in: 'ax', x: w, y: L(w), r: 4.5, tono, nascosto: true });
    if (i > 0) ogg.push({ id: id + 's' + i, tipo: 'linea', in: 'ax', x1: ws[i - 1], y1: L(ws[i - 1]), x2: w, y2: L(w), tono, nascosto: true });
  });
  const A = [0, 0.6, 1.08, 1.464, 1.771, 2.017], B = [0, 5.4, 1.08, 4.536, 1.771, 3.983], C = [0, 6.6, -1.32, 8.184, -3.221, 10.465];
  cammino('a', A, 'ok'); cammino('b', B, 'ora'); cammino('d', C, 'no');
  ogg.push({ id: 'n', tipo: 'testo', x: 210, y: 292, t: '', size: 13, bold: true });
  const vedi = (pref, n, v) => { const o = {}; for (let i = 0; i < n; i++) { o[pref + 'p' + i] = { nascosto: !v }; if (i) o[pref + 's' + i] = { nascosto: !v }; } return o; };
  SCENE.discesa = {
    w: 420, h: 300, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s003|'}}' },
      { nota: '{{j|s004|'}}', set: Object.assign(vedi('a', 2, true), { n: { t: 'η = 0.1: 0 → 0.6', tono: 'ok' } }) },
      { nota: '{{j|s005|'}}', set: Object.assign(vedi('a', 6, true), { n: { t: 'η = 0.1: 0.6 → 1.08 → 1.46 → 1.77 → 2.02', tono: 'ok' } }) },
      { nota: '{{j|s006|'}}', set: Object.assign(vedi('a', 6, false), vedi('b', 6, true), { n: { t: 'η = 0.9: oscilla ma converge', tono: 'ora' } }) },
      { nota: '{{j|s007|'}}', set: Object.assign(vedi('b', 6, false), vedi('d', 6, true), { n: { t: 'η = 1.1: diverge', tono: 'no' } }) }
    ]
  };
  const og2 = [
    { id: 'x1', tipo: 'nodo', r: 22, x: 70, y: 70, t: 'x1', tono: 'dato' }, { id: 'x2', tipo: 'nodo', r: 22, x: 70, y: 200, t: 'x2', tono: 'dato' },
    { id: 'h1', tipo: 'nodo', r: 22, x: 270, y: 70, t: 'h1' }, { id: 'h2', tipo: 'nodo', r: 22, x: 270, y: 200, t: 'h2' },
    { id: 'y', tipo: 'nodo', r: 24, x: 460, y: 135, t: 'p' },
    { id: 'a11', tipo: 'arco', da: 'x1', a: 'h1', dir: true, t: '0.5' }, { id: 'a12', tipo: 'arco', da: 'x1', a: 'h2', dir: true, t: '1', curva: 26 },
    { id: 'a21', tipo: 'arco', da: 'x2', a: 'h1', dir: true, t: '−1', curva: 26 }, { id: 'a22', tipo: 'arco', da: 'x2', a: 'h2', dir: true, t: '0.5' },
    { id: 'o1', tipo: 'arco', da: 'h1', a: 'y', dir: true, t: '1' }, { id: 'o2', tipo: 'arco', da: 'h2', a: 'y', dir: true, t: '−2' },
    { id: 'n', tipo: 'testo', x: 270, y: 262, t: '', size: 13, bold: true }
  ];
  SCENE.rete = {
    w: 540, h: 275, lato: false,
    legenda: '{{j|s008|'}}',
    oggetti: og2,
    passi: [
      { nota: '{{j|s009|'}}' },
      { nota: '{{j|s010|'}}', set: { x1: { sotto: '1' }, x2: { sotto: '2' } } },
      { nota: '{{j|s011|'}}', set: { h1: { tono: 'ora', sotto: 'z = −1.5 → 0' }, a11: { tono: 'ora' }, a21: { tono: 'ora' } } },
      { nota: '{{j|s012|'}}', set: { h1: { tono: 'ok' }, a11: { tono: null }, a21: { tono: null }, h2: { tono: 'ora', sotto: 'z = 3 → 3' }, a12: { tono: 'ora' }, a22: { tono: 'ora' } } },
      { nota: '{{j|s013|'}}', set: { h2: { tono: 'ok' }, a12: { tono: null }, a22: { tono: null }, y: { tono: 'ok', sotto: 'σ(−5.5) = 0.0041' }, o1: { tono: 'ora' }, o2: { tono: 'ora' }, n: { t: 'passaggio in avanti: 1 e 2 → 0.0041', tono: 'ok' } } }
    ]
  };
  const og3 = [
    { id: 'x', tipo: 'nodo', r: 20, x: 70, y: 50, t: 'x', tono: 'dato' }, { id: 'y', tipo: 'nodo', r: 20, x: 70, y: 150, t: 'y', tono: 'dato' },
    { id: 'z', tipo: 'nodo', r: 20, x: 70, y: 240, t: 'z', tono: 'dato' },
    { id: 'q', tipo: 'nodo', r: 22, x: 250, y: 100, t: '+' }, { id: 'f', tipo: 'nodo', r: 22, x: 430, y: 170, t: '×' },
    { id: 'e1', tipo: 'arco', da: 'x', a: 'q', dir: true }, { id: 'e2', tipo: 'arco', da: 'y', a: 'q', dir: true },
    { id: 'e3', tipo: 'arco', da: 'q', a: 'f', dir: true }, { id: 'e4', tipo: 'arco', da: 'z', a: 'f', dir: true },
    { id: 'n', tipo: 'testo', x: 280, y: 290, t: '', size: 13, bold: true }
  ];
  SCENE.grafo = {
    w: 520, h: 305, lato: false,
    legenda: '{{j|s014|'}}',
    oggetti: og3,
    passi: [
      { nota: '{{j|s015|'}}' },
      { nota: '{{j|s016|'}}', set: { x: { sotto: '1' }, y: { sotto: '2' }, z: { sotto: '3' } } },
      { nota: '{{j|s017|'}}', set: { q: { tono: 'ok', sotto: 'q = 3' } } },
      { nota: '{{j|s018|'}}', set: { f: { tono: 'ok', sotto: 'f = 9' } } },
      { nota: '{{j|s019|'}}', set: { f: { tono: 'ora', sopra: '∂f/∂f = 1' } } },
      { nota: '{{j|s020|'}}', set: { q: { tono: 'ora', sopra: '∂f/∂q = 3' }, z: { tono: 'ora', sopra: '∂f/∂z = 3' }, e3: { tono: 'ora' }, e4: { tono: 'ora' } } },
      { nota: '{{j|s021|'}}', set: { x: { tono: 'ora', sopra: '∂f/∂x = 3' }, y: { tono: 'ora', sopra: '∂f/∂y = 3' }, e1: { tono: 'ora' }, e2: { tono: 'ora' }, n: { t: '∇f = (3, 3, 3)', tono: 'ora' } } }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const D = {"X": [[0.11, -0.31], [-0.25, -1.46], [1.08, 0.69], [-0.2, 0.46], [0.17, -0.33], [0.59, -0.19], [-0.2, -0.48], [0.27, -0.06], [0.33, -0.36], [0.08, -0.54], [0.5, 0.11], [0.2, 0.25], [-0.61, 0.47], [1.23, -0.98], [-1.04, -0.9], [0.5, 0.08], [0.65, 0.43], [0.13, 0.17], [-0.1, 0.52], [-0.68, -0.25], [0.15, 1.08], [-0.46, -0.65], [-0.34, 0.58], [-0.14, 0.79], [-1.12, 0.68], [0.62, -0.85], [0.09, 0.73], [0.05, 0.6], [1.42, 0.16], [-0.17, -0.46], [0.39, -0.12], [-0.11, -0.06], [0.39, -0.64], [-0.92, -1.46], [0.72, 0.04], [0.91, -0.01], [-0.45, 0.29], [-0.05, -0.75], [-0.53, 1.06], [0.21, 0.25], [3.83, 0.09], [4.53, 0.44], [3.54, 0.42], [3.46, 0.61], [4.68, -0.0], [4.86, 0.1], [4.09, -0.0], [3.87, 0.53], [3.74, 0.08], [3.59, 0.01], [3.06, 0.34], [4.24, 1.05], [4.39, 1.97], [4.19, 0.23], [5.12, -0.13], [4.58, -0.07], [4.21, -0.68], [4.54, 0.41], [3.42, 1.51], [4.46, 0.53], [3.55, 0.47], [3.9, 0.93], [4.48, 0.1], [3.67, 0.18], [3.19, 0.15], [3.94, 0.91], [4.79, 0.01], [4.33, 0.23], [5.25, 0.47], [4.3, -0.06], [3.51, 0.62], [3.77, 0.71], [3.06, 0.9], [3.46, 1.53], [3.83, 1.16], [3.16, 0.76], [3.47, 0.21], [4.01, 0.31], [4.16, 0.95], [4.39, 0.45], [1.18, 3.02], [1.88, 2.23], [2.45, 3.36], [1.85, 4.07], [2.4, 3.63], [1.4, 3.69], [2.21, 2.97], [2.63, 3.8], [0.82, 3.57], [1.24, 4.18], [2.48, 2.84], [1.47, 3.56], [1.86, 4.42], [2.44, 3.33], [2.35, 2.28], [2.19, 4.02], [1.89, 3.07], [2.34, 4.68], [2.12, 2.83], [2.87, 2.37], [2.3, 3.15], [2.56, 2.99], [2.79, 3.68], [0.96, 2.32], [1.81, 4.28], [2.08, 3.54], [1.86, 3.94], [2.23, 3.67], [1.41, 4.21], [2.82, 2.72], [3.38, 3.93], [1.71, 2.36], [2.39, 3.83], [1.64, 2.43], [2.67, 3.15], [1.72, 5.21], [3.28, 4.07], [1.73, 3.89], [0.63, 3.56], [1.54, 2.73], [7.5, 4.5]], "ms0.5": [26, [2, 22, 20, 4, 2, 2, 2, 2, 2, 2, 2, 2, 4, 19, 24, 2, 20, 2, 4, 24, 4, 24, 4, 4, 25, 19, 4, 4, 18, 2, 2, 2, 2, 23, 2, 18, 4, 22, 25, 2, 1, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 6, 14, 0, 13, 0, 15, 0, 8, 0, 1, 6, 0, 1, 1, 6, 0, 0, 13, 0, 1, 6, 8, 8, 6, 1, 1, 1, 6, 0, 10, 7, 3, 5, 3, 5, 7, 3, 11, 5, 3, 5, 5, 3, 7, 5, 7, 16, 7, 8, 3, 3, 3, 21, 5, 3, 5, 3, 5, 3, 9, 7, 3, 7, 3, 17, 9, 5, 11, 10, 12], [[4.45, 0.19], [3.74, 0.32], [0.31, -0.04], [2.45, 3.47], [-0.06, 0.42], [2.0, 3.96], [3.9, 0.86], [1.8, 2.61], [3.44, 1.52], [3.33, 4.0], [1.36, 2.87], [0.72, 3.57], [7.5, 4.5], [5.25, 0.47], [4.39, 1.97], [4.21, -0.68], [2.34, 4.68], [1.72, 5.21], [1.42, 0.16], [1.23, -0.98], [1.08, 0.69], [0.96, 2.32], [-0.25, -1.46], [-0.92, -1.46], [-1.04, -0.9], [-1.12, 0.68]]], "ms1.5": [4, [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3], [[4.01, 0.42], [2.08, 3.42], [0.09, 0.07], [7.5, 4.5]]], "ms3": [2, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [[2.17, 1.34], [7.5, 4.5]]], "ms8": [1, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [[2.09, 1.31]]], "path": [[1.2, 1.2], [0.661, 0.802], [0.223, 0.212], [0.123, 0.094]], "ward": [[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0], [41, 40, 40]], "single": [[2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1], [80, 40, 1]]};
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const P = (id, x, y, t, extra) => Object.assign({ id, tipo: 'punto', in: 'ax', x, y, t }, extra || {});
  const L = (id, x1, y1, x2, y2, extra) => Object.assign({ id, tipo: 'linea', in: 'ax', x1, y1, x2, y2 }, extra || {});
  const pl = p => p.concat(p.slice().reverse());
  const curva = (id, pts, tono, extra) => Object.assign({ id, tipo: 'poli', in: 'ax', punti: pl(pts), tono, vuoto: true }, extra || {});
  const cerchio = (cx, cy, r) => Array.from({ length: 41 }, (_, i) => [cx + r * Math.cos(i * Math.PI / 20), cy + r * Math.sin(i * Math.PI / 20)]);
  const TONI = ['dato', 'due', 'ora', 'ok', 'no', 'spento'];
  const colora = labels => Object.fromEntries(labels.map((l, i) => ['x' + i, { tono: TONI[l % TONI.length] }]));

    SCENE.mlpcnn = {
      w: 660, h: 260, lato: true,
      legenda: '{{j|s022|'}}',
      oggetti: [R('img', 30, 50, 140, 140, '784 pixel', { tono: 'dato' }), R('mlp', 260, 50, 90, 140, '100 neuroni', { tono: 'spento' }),
        { id: 'f1', tipo: 'vett', x1: 172, y1: 70, x2: 256, y2: 120, t: '' }, { id: 'f2', tipo: 'vett', x1: 172, y1: 170, x2: 256, y2: 120, t: '' }, { id: 'f3', tipo: 'vett', x1: 172, y1: 120, x2: 256, y2: 80, t: '' },
        R('fil', 40, 60, 36, 36, '3×3', { tono: 'ora', nascosto: true }),
        T('c', 520, 60, '', { size: 12 }), T('c2', 520, 90, '', { size: 12, bold: true }), T('c3', 520, 140, '', { size: 12 }), T('c4', 520, 170, '', { size: 12, bold: true }), T('c5', 330, 230, '', { size: 12 })],
      passi: [
        { nota: "Due modi di collegare un'immagine 28 × 28 (784 pixel) al primo strato." },
        { nota: "<b>MLP</b> (fully connected): ogni uscita è collegata a <b>tutti</b> gli ingressi. 784 → 100 neuroni: 784 · 100 pesi + 100 bias = <b>78 500</b> parametri. Nessuna ipotesi sulla struttura dell'immagine.", set: { mlp: { tono: 'ora' }, c: { t: 'MLP: tutti con tutti' }, c2: { t: '78 500 parametri', tono: 'no' } } },
        { nota: "<b>CNN</b> (convoluzionale): un piccolo filtro 3 × 3 scorre sull'immagine. Ogni uscita è un <b>prodotto interno</b> fra i 9 pesi e un vicinato di 9 pixel: la stessa operazione della correlazione (settimane 7–8).", set: { fil: { nascosto: false }, f1: { nascosto: true }, f2: { nascosto: true }, f3: { nascosto: true }, mlp: { t: 'mappa delle feature', tono: 'spento' }, c3: { t: 'CNN: filtro che scorre' } } },
        { nota: "Gli <b>stessi pesi</b> in ogni posizione (weight sharing): 16 filtri 3 × 3 = 16 · 9 + 16 bias = <b>160</b> parametri. Ipotesi: conta il vicinato locale, e un bordo è un bordo ovunque. I filtri imparati somigliano a quelli per i bordi e a HOG.", set: { fil: { x: 120, y: 140 }, c4: { t: '160 parametri', tono: 'ok' } } },
        { nota: "Allenamento: loss MSE per la regressione (la rete per lo sguardo prevede (x', y')), cross-entropy per la classificazione; epoche di discesa del gradiente su mini-batch; learning rate da scegliere. Tanti parametri ⇒ overfitting: curve di training e validation che si separano. Rimedi: più dati, early stopping, weight decay (= ridge), reti più piccole.", set: { c5: { t: 'MSE o cross-entropy · mini-batch · early stopping · weight decay' } } }
      ]
    };

    const xs = Array.from({ length: 81 }, (_, i) => -4 + i * 0.1);
    const sig = x => 1 / (1 + Math.exp(-x)), relu = x => Math.max(0, x);
    SCENE.attivazioni = {
      w: 660, h: 280, lato: true,
      legenda: '{{j|s023|'}}',
      oggetti: [{ id: 'ax', tipo: 'assi', box: [40, 20, 330, 240], dom: [-4, 4, -2, 4], tacche: 1, etX: 'z', etY: 'g(z)' },
        curva('id', [[-2, -2], [4, 4]], 'no', { nascosto: true }), curva('sg', xs.map(x => [x, sig(x)]), 'dato', { nascosto: true }), curva('th', xs.map(x => [x, Math.tanh(x)]), 'due', { nascosto: true }),
        curva('re', xs.map(x => [x, relu(x)]), 'ok', { nascosto: true }), curva('ab', xs.map(x => [x, Math.abs(x)]), 'ora', { nascosto: true }),
        T('c', 530, 50, '', { size: 12 }), T('c2', 530, 80, '', { size: 12 }), T('c3', 530, 120, '', { size: 12 }), T('c4', 530, 160, '', { size: 12 }), T('c5', 530, 200, '', { size: 12, bold: true })],
      passi: [
        { nota: "Un neurone calcola z = wᵀx e poi applica una <b>funzione di attivazione</b> g(z). Perché serve? Senza, due strati lineari sono ancora lineari: W₂(W₁x) = (W₂W₁)x, una matrice sola. Impilare strati non servirebbe a niente.", set: { id: { nascosto: false }, c: { t: 'W₂(W₁x) = (W₂W₁)x: ancora lineare', tono: 'no' } } },
        { nota: "<b>Sigmoide</b> σ(z) = 1/(1 + e⁻ᶻ): schiaccia tutto fra 0 e 1, quindi si legge come una probabilità (regressione logistica, uscita per la classificazione binaria).", set: { id: { nascosto: true }, sg: { nascosto: false }, c2: { t: 'sigmoide: (0, 1), probabilità' } } },
        { nota: "<b>tanh</b>: la stessa forma, fra −1 e 1, centrata in 0.", set: { th: { nascosto: false }, c3: { t: 'tanh: (−1, 1)' } } },
        { nota: "<b>ReLU</b> max(0, z): 0 per i negativi, z per i positivi. Semplicissima, e la derivata non si spegne per z grandi (la sigmoide invece diventa piatta): è la scelta standard negli strati nascosti.", set: { sg: { nascosto: true }, th: { nascosto: true }, re: { nascosto: false }, c4: { t: 'ReLU: max(0, z), strati nascosti' } } },
        { nota: "Con la non linearità in mezzo, combinando neuroni si ottengono funzioni nuove: per esempio |z| = ReLU(z) + ReLU(−z), una V che nessun modello lineare può fare. Così una rete è una <b>funzione di previsione non lineare</b>: composizione di trasformazioni lineari e non linearità.", set: { ab: { nascosto: false }, c5: { t: '|z| = ReLU(z) + ReLU(−z)', tono: 'ok' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s024|}}</h1>
  <p class="lede">{{s|s025|}}</p>
</header>

<section>
  <h2>{{s|s026|}}</h2>
  <figure class="passi" data-titolo="{{a|s027|}}">
    <div class="passo"><div class="espr">w<sub>nuovo</sub> = w − <mark class="ora">η</mark> · <mark class="due">∇L(w)</mark></div><p class="nota">{{s|s028|}}</p></div>
    <div class="passo"><div class="espr">L(w) = (w − 3)²,  ∇L = 2(w − 3),  η = 0.1,  w₀ = 0:   0 → <mark class="ok">0.6</mark> → 1.08 → 1.464 → …</div><p class="nota">{{s|s029|}}</p></div>
    <div class="passo"><div class="espr">serve quando <mark class="no">non c'è una formula chiusa</mark></div><p class="nota">{{s|s030|}}</p></div>
  </figure>
  <figure class="scena" data-scena="discesa" data-titolo="{{a|s031|}}"></figure>
  <p class="piccolo">{{s|s032|}}</p>
  <figure class="passi" data-titolo="{{a|s033|}}">
    <div class="passo"><div class="espr">∇f = [x₁ − x₂ − 2,  5x₂ − x₁ − 2]  = 0  ⇒  minimo in <mark class="ok">(3, 1)</mark>, f = −4</div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">da (0, 0) con η = 0.1:  (0.2, 0.2) → (0.4, 0.32) → (0.592, 0.4) → …</div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">η = 0.3: <mark class="ok">(3, 1)</mark> in 50 passi;   η = 0.4: <mark class="no">diverge</mark> (f = 1747 dopo 50 passi)</div><p class="nota">{{s|s036|}}</p></div>
  </figure>
  <div class="box regola" data-tit="{{a|s037|}}">
    <p>{{s|s038|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s039|}}</h2>
  <figure class="passi" data-titolo="{{a|s040|}}">
    <div class="passo"><div class="espr">x = [1, 2]      z₁ = <mark class="ora">W₁</mark>x + b₁ = [[0.5, −1], [1, 0.5]]·[1, 2] + [0, 1] = <mark class="dato">[−1.5, 3]</mark></div><p class="nota">{{s|s041|}}</p></div>
    <div class="passo"><div class="espr">h = ReLU(z₁) = max(0, z₁) = <mark class="dato">[0, 3]</mark></div><p class="nota">{{s|s042|}}</p></div>
    <div class="passo"><div class="espr">z₂ = [1, −2]·[0, 3] + 0.5 = −5.5      p = σ(−5.5) = <mark class="ok">0.0041</mark></div><p class="nota">{{s|s043|}}</p></div>
  </figure>
  <figure class="scena" data-scena="rete" data-titolo="{{a|s044|}}"></figure>
</section>

<section>
  <h2>{{s|s045|}}</h2>
  <p>{{s|s046|}}</p>
  <p>{{s|s047|}}</p>
  <p>{{s|s048|}}</p>
  <figure class="scena" data-scena="attivazioni" data-titolo="{{a|s049|}}"></figure>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <figure class="passi" data-titolo="{{a|s051|}}">
    <div class="passo"><div class="espr">avanti:  q = x + y = <mark class="dato">3</mark>,   f = q · z = <mark class="ok">9</mark></div><p class="nota">{{s|s052|}}</p></div>
    <div class="passo"><div class="espr">indietro:  ∂f/∂z = q = <mark class="ora">3</mark>,   ∂f/∂q = z = <mark class="ora">3</mark></div><p class="nota">{{s|s053|}}</p></div>
    <div class="passo"><div class="espr">∂f/∂x = ∂f/∂q · ∂q/∂x = 3 · 1 = <mark class="ok">3</mark>,   ∂f/∂y = 3 · 1 = <mark class="ok">3</mark></div><p class="nota">{{s|s054|}}</p></div>
  </figure>
  <figure class="scena" data-scena="grafo" data-titolo="{{a|s055|}}"></figure>
  <figure class="passi" data-titolo="{{a|s056|}}">
    <div class="passo"><div class="espr">p = σ(wᵀx),   L = −[y log p + (1 − y) log(1 − p)]</div><p class="nota">{{s|s057|}}</p></div>
    <div class="passo"><div class="espr">∂L/∂w = ∂L/∂p · ∂p/∂z · ∂z/∂w = <mark class="ok">(p − y) · x</mark></div><p class="nota">{{s|s058|}}</p></div>
    <div class="passo"><div class="espr">rete intera: stessa cosa, strato per strato, <mark class="ora">dall'uscita all'ingresso</mark></div><p class="nota">{{s|s059|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s060|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th></th><th>{{s|s061|}}</th><th>{{s|s062|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td></tr>
      <tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td><td>{{s|s068|}}</td></tr>
      <tr><td>{{s|s069|}}</td><td>{{s|s070|}}</td><td>{{s|s071|}}</td></tr>
    </tbody>
  </table></div>
  <ul>
    <li>{{s|s072|}}</li>
    <li>{{s|s073|}}</li>
    <li>{{s|s074|}}</li>
  </ul>
  <div class="box esame" data-tit="{{a|s075|}}">
    <p>{{s|s076|}}</p>
  </div>
  <figure class="scena" data-scena="mlpcnn" data-titolo="{{a|s077|}}"></figure>
</section>

</main>
</body>
</html>
