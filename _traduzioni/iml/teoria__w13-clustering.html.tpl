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
  const X = [1, 2, 3, 10, 11, 12];
  const ogg = [{ id: 'ax', tipo: 'assi', box: [30, 20, 520, 110], dom: [0, 13, 0.1, 0.9], tacche: 1 }];
  X.forEach((x, i) => ogg.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x, y: 0.3, r: 6, tono: null }));
  ogg.push({ id: 'c1', tipo: 'punto', in: 'ax', x: 1, y: 0.7, r: 8, t: 'c1', tx: -8, ty: -14, tono: 'dato' });
  ogg.push({ id: 'c2', tipo: 'punto', in: 'ax', x: 2, y: 0.7, r: 8, t: 'c2', tx: -8, ty: -14, tono: 'due' });
  ogg.push({ id: 'n', tipo: 'testo', x: 290, y: 160, t: 'centri iniziali: 1 e 2', size: 14, bold: true });
  const colori = s => Object.fromEntries(X.map((x, i) => ['p' + i, { tono: s[i] === 1 ? 'dato' : 'due' }]));
  SCENE.kmeans = {
    w: 580, h: 175, lato: false,
    legenda: '{{j|s002|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s003|'}}' },
      { nota: '{{j|s004|'}}', set: Object.assign(colori([1, 2, 2, 2, 2, 2]), { n: { t: 'assegna: [1] | [2, 3, 10, 11, 12]' } }) },
      { nota: '{{j|s005|'}}', set: { c2: { x: 7.6 }, n: { t: 'aggiorna: c1 = 1, c2 = 7.6' } } },
      { nota: '{{j|s006|'}}', set: Object.assign(colori([1, 1, 1, 2, 2, 2]), { n: { t: 'assegna: [1, 2, 3] | [10, 11, 12]' } }) },
      { nota: '{{j|s007|'}}', set: { c1: { x: 2 }, c2: { x: 11 }, n: { t: 'aggiorna: c1 = 2, c2 = 11' } } },
      { nota: '{{j|s008|'}}', set: { n: { t: 'convergenza: inerzia = 4', tono: 'ok' } } }
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

    const X = D.X;
    const base = () => [{ id: 'ax', tipo: 'assi', box: [40, 20, 330, 230], dom: [-2, 8.2, -2, 5.7], tacche: 2, numeri: false, etX: 'x₁', etY: 'x₂' }].concat(X.map(([a, b], i) => P('x' + i, a, b, '', { tono: 'spento', r: 3 })));
    const ogm = base().concat([{ id: 'win', tipo: 'poli', in: 'ax', punti: cerchio(D.path[0][0], D.path[0][1], 1.5), tono: 'ora', vuoto: true, nascosto: true }, P('m', D.path[0][0], D.path[0][1], '', { tono: 'no', r: 6, nascosto: true }),
      T('c', 520, 50, '', { size: 12 }), T('c2', 520, 80, '', { size: 12 }), T('c3', 520, 120, '', { size: 12, bold: true }), T('c4', 520, 160, '', { size: 12 }), T('c5', 520, 200, '', { size: 12 })]);
    const passo = k => ({ m: { nascosto: false, x: D.path[k][0], y: D.path[k][1] }, win: { nascosto: false, punti: cerchio(D.path[k][0], D.path[k][1], 1.5) } });
    const ms = h => D['ms' + h];
    SCENE.meanshift = {
      w: 660, h: 270, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: ogm,
      passi: [
        { nota: "<b>Mean shift</b> (dati di prova: tre gruppi e un punto isolato; sklearn). Si parte da un punto e si guarda solo il suo vicinato: una finestra di raggio <b>h</b> (bandwidth), qui 1.5.", set: passo(0) },
        { nota: "Il punto si sposta sulla <b>media</b> dei vicini nella finestra. La media sta dalla parte dove ci sono più punti: il punto sale verso la zona più densa.", set: Object.assign(passo(1), { c: { t: 'sposta sulla media dei vicini' } }) },
        { nota: "Si ripete finché non si muove più: è arrivato a un <b>massimo della densità</b>. I punti che arrivano allo stesso massimo formano lo stesso cluster.", set: Object.assign(passo(D.path.length - 1), { c2: { t: 'fermo: un massimo di densità' } }) },
        { nota: "Il numero di cluster <b>non si sceglie</b>: esce da solo. Con h = 1.5: " + ms(1.5)[0] + " cluster (i tre gruppi e il punto isolato).", set: Object.assign(colora(ms(1.5)[1]), { win: { nascosto: true }, m: { nascosto: true }, c3: { t: 'h = 1.5: ' + ms(1.5)[0] + ' cluster' } }) },
        { nota: "Si sceglie invece h, che ha lo stesso ruolo di k detto in un altro modo. h = 0.5: " + ms(0.5)[0] + " cluster, ogni piccolo addensamento diventa un gruppo. h = 3: " + ms(3)[0] + ". h = 8: " + ms(8)[0] + ", tutto si fonde.", set: Object.assign(colora(ms(3)[1]), { c4: { t: 'h = 0.5: ' + ms(0.5)[0] + ' · h = 3: ' + ms(3)[0] + ' · h = 8: ' + ms(8)[0] }, c5: { t: '(qui colorato h = 3)' } }) }
      ]
    };

    const oga = base().concat([T('c', 520, 50, '', { size: 12 }), T('c2', 520, 80, '', { size: 12 }), T('c3', 520, 120, '', { size: 12, bold: true }), T('c4', 520, 160, '', { size: 12, bold: true }), T('c5', 520, 200, '', { size: 12 })]);
    SCENE.agglomerativo = {
      w: 660, h: 270, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: oga,
      passi: [
        { nota: "<b>Clustering agglomerativo</b>: all'inizio ogni punto è un cluster (" + X.length + " cluster). Si fondono i due cluster più vicini, e si ripete.", set: { c: { t: X.length + ' cluster, uno per punto' } } },
        { nota: "\"Più vicini\" dipende dal <b>linkage</b>: single (i due punti più vicini fra i gruppi), complete (i più lontani), average, ward (la fusione che fa crescere meno la varianza interna). Il <b>dendrogramma</b> registra ogni fusione e la sua distanza; tagliandolo si sceglie il numero di cluster.", set: { c2: { t: 'single, complete, average, ward' } } },
        { nota: "<b>Ward</b>, tagliato a 3 cluster: gruppi da " + D.ward[1].join(', ') + ". I tre gruppi veri (il punto isolato finisce nel più vicino).", set: Object.assign(colora(D.ward[0]), { c3: { t: 'ward: ' + D.ward[1].join(', '), tono: 'ok' } }) },
        { nota: "<b>Single linkage</b>, sempre 3 cluster: " + D.single[1].join(', ') + ". Il punto isolato diventa un cluster da solo, e due gruppi vicini si \"incatenano\" in uno. Il linkage cambia il risultato (calcolato con sklearn).", set: Object.assign(colora(D.single[0]), { c4: { t: 'single: ' + D.single[1].join(', '), tono: 'no' } }) }
      ]
    };

    const RIGHE = [['si sceglie', 'k', 'h (bandwidth)', 'linkage e taglio'], ['forma dei gruppi', 'tondi, simili', 'qualsiasi', 'dipende dal linkage'], ['costo', 'basso', 'alto', 'alto'], ['risultato extra', 'i centri', 'i massimi', 'il dendrogramma']];
    const ogc = [T('h1', 260, 24, 'k-means', { bold: true }), T('h2', 400, 24, 'mean shift', { bold: true }), T('h3', 540, 24, 'agglomerativo', { bold: true })];
    RIGHE.forEach((r, i) => { ogc.push(T('r' + i, 120, 62 + i * 40, r[0], { size: 12, bold: true, nascosto: true })); [1, 2, 3].forEach(j => ogc.push(R('c' + i + j, 190 + (j - 1) * 140, 44 + i * 40, 136, 30, r[j], { tono: 'spento', nascosto: true }))); });
    ogc.push(T('c', 340, 225, '', { size: 12 }));
    const riga = i => Object.assign({ ['r' + i]: { nascosto: false } }, ...[1, 2, 3].map(j => ({ ['c' + i + j]: { nascosto: false, tono: 'dato' } })));
    SCENE.confronto = {
      w: 640, h: 240, lato: true,
      legenda: '{{j|s011|'}}',
      oggetti: ogc,
      passi: [
        { nota: "Task 17: i tre metodi a confronto, una domanda alla volta." },
        { nota: "<b>Cosa si sceglie</b>: k per k-means, la bandwidth h per mean shift, il linkage e dove tagliare il dendrogramma per l'agglomerativo.", set: riga(0) },
        { nota: "<b>Forma dei gruppi</b>: k-means trova gruppi tondi e simili (ogni punto va al centro più vicino); mean shift gruppi di forma qualsiasi attorno ai massimi di densità; l'agglomerativo dipende dal linkage (single segue le catene).", set: riga(1) },
        { nota: "<b>Costo</b>: k-means è veloce; mean shift e agglomerativo sono più lenti (l'agglomerativo calcola distanze fra tutte le coppie).", set: riga(2) },
        { nota: "<b>Risultato in più</b>: i centri (nell'esercizio sulle 1403 sequenze di pose, una \"posa media\" per gruppo), i massimi di densità, la gerarchia. Senza etichette non c'è un'accuratezza: si valuta con l'inerzia, la stabilità e il senso dei gruppi.", set: Object.assign(riga(3), { c: { t: 'senza etichette: inerzia, stabilità, interpretazione' } }) }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s012|}}</h1>
  <p class="lede">{{s|s013|}}</p>
</header>

<section>
  <h2>{{s|s014|}}</h2>
  <figure class="passi" data-titolo="{{a|s015|}}">
    <div class="passo"><div class="espr">{{s|s016|}}</div><p class="nota">{{s|s017|}}</p></div>
    <div class="passo"><div class="espr">{{s|s018|}}</div><p class="nota">(2 + 3 + 10 + 11 + 12) / 5 = 7.6.</p></div>
    <div class="passo"><div class="espr">{{s|s019|}}</div><p class="nota">{{s|s020|}}</p></div>
    <div class="passo"><div class="espr">{{s|s021|}}</div><p class="nota">{{s|s022|}}</p></div>
  </figure>
  <figure class="scena" data-scena="kmeans" data-titolo="{{a|s023|}}"></figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>k</th><th>1</th><th>2</th><th>3</th><th>4</th><th>5</th><th>6</th></tr></thead>
    <tbody><tr><td>{{s|s024|}}</td><td>4096</td><td>1878</td><td><b>595</b></td><td>509</td><td>433</td><td>379</td></tr></tbody>
  </table></div>
  <p class="piccolo">{{s|s025|}}</p>
  <div class="box attenzione" data-tit="{{a|s026|}}">
    <p>{{s|s027|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s028|}}</h2>
  <figure class="passi" data-titolo="{{a|s029|}}">
    <div class="passo"><div class="espr">{{s|s030|}}</div><p class="nota">{{s|s031|}}</p></div>
    <div class="passo"><div class="espr">{{s|s032|}}</div><p class="nota">{{s|s033|}}</p></div>
    <div class="passo"><div class="espr">{{s|s034|}}</div><p class="nota">{{s|s035|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s036|}}</th><th>0.5</th><th>1.5</th><th>3</th><th>6</th></tr></thead>
    <tbody><tr><td>{{s|s037|}}</td><td>63</td><td><b>3</b></td><td>2</td><td>1</td></tr></tbody>
  </table></div>
  <p class="piccolo">{{s|s038|}}</p>
  <figure class="scena" data-scena="meanshift" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <figure class="passi" data-titolo="{{a|s041|}}">
    <div class="passo"><div class="espr">{{s|s042|}}</div><p class="nota">{{s|s043|}}</p></div>
    <div class="passo"><div class="espr">fondi i due cluster <mark class="ora">più vicini</mark>; ripeti</div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">{{s|s045|}}</div><p class="nota">{{s|s046|}}</p></div>
  </figure>
  <p class="piccolo">{{s|s047|}}</p>
  <figure class="scena" data-scena="agglomerativo" data-titolo="{{a|s048|}}"></figure>
</section>

<section>
  <h2>{{s|s049|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th></th><th>{{s|s050|}}</th><th>{{s|s051|}}</th><th>{{s|s052|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s053|}}</td><td>k</td><td>{{s|s054|}}</td><td>{{s|s055|}}</td></tr>
      <tr><td>{{s|s056|}}</td><td>{{s|s057|}}</td><td>{{s|s058|}}</td><td>{{s|s059|}}</td></tr>
      <tr><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>{{s|s062|}}</td><td>{{s|s063|}}</td></tr>
      <tr><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>{{s|s066|}}</td><td>{{s|s067|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s068|}}</p>
  <div class="box esame" data-tit="{{a|s069|}}">
    <p>{{s|s070|}}</p>
  </div>
  <figure class="scena" data-scena="confronto" data-titolo="{{a|s071|}}"></figure>
</section>

</main>
</body>
</html>
