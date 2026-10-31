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
  const xs = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  const Y = [2.0, 0.2, 2.2, 2.2, 2.8, 3.4, 3.0, 4.4, 4.6, 7.2];
  const ogg = [{ id: 'ax', tipo: 'assi', box: [50, 20, 330, 235], dom: [-0.5, 9.5, -1, 13.5], tacche: 2, etX: 'x', etY: 'y' }];
  const retta = (id, a, b, tono, nascosto) => ogg.push({ id, tipo: 'linea', in: 'ax', x1: -0.5, y1: a - 0.5 * b, x2: 9.5, y2: a + 9.5 * b, tono, nascosto });
  retta('f', 1, 0.5, 'ok', false);
  retta('fit', 0.7, 0.56, 'due', true);
  retta('fito', -0.03, 0.89, 'no', true);
  xs.forEach((x, i) => {
    ogg.push({ id: 'r' + i, tipo: 'linea', in: 'ax', x1: x, y1: 1 + 0.5 * x, x2: x, y2: Y[i], tratt: true, tono: 'spento', nascosto: true });
    ogg.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x, y: Y[i], tono: 'dato', nascosto: true });
  });
  ogg.push({ id: 'out', tipo: 'punto', in: 'ax', x: 8, y: 12.6, t: 'outlier', tono: 'no', nascosto: true });
  ogg.push({ id: 'n', tipo: 'testo', x: 215, y: 288, t: '', size: 13, bold: true });
  const tutti = v => Object.fromEntries(xs.map((x, i) => ['p' + i, { nascosto: !v }]));
  const res = v => Object.fromEntries(xs.map((x, i) => ['r' + i, { nascosto: !v }]));
  SCENE.rumore = {
    w: 400, h: 300, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s003|'}}', set: { n: { t: 'f(x) = 1 + 0.5x', tono: 'ok' } } },
      { nota: '{{j|s004|'}}', set: Object.assign(tutti(true), { n: { t: 'Y = f(x) + N', tono: 'dato' } }) },
      { nota: '{{j|s005|'}}', set: Object.assign(res(true), { n: { t: 'N: +1.0, −1.3, +0.2, … media −0.05', tono: null } }) },
      { nota: '{{j|s006|'}}', set: Object.assign(res(false), { fit: { nascosto: false }, n: { t: 'imparata: 0.70 + 0.56x', tono: 'due' } }) },
      { nota: '{{j|s007|'}}', set: { p8: { nascosto: true }, out: { nascosto: false }, n: { t: 'un punto +8', tono: 'no' } } },
      { nota: '{{j|s008|'}}', set: { fito: { nascosto: false }, n: { t: 'con outlier: −0.03 + 0.89x', tono: 'no' } } }
    ]
  };
})();
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

    const xs = D.x;
    const pts = (pref, ys, tono) => ys.map((y, i) => P(pref + i, xs[i], y, '', { tono, nascosto: true, r: 3.5 }));
    const vedi = (pref, n, v) => Object.fromEntries(Array.from({ length: n }, (_, i) => [pref + i, Object.assign({ nascosto: false }, v || {})]));
    const nasc = (pref, n) => Object.fromEntries(Array.from({ length: n }, (_, i) => [pref + i, { nascosto: true }]));
    const n = xs.length;
    SCENE.tiporumore = {
      w: 680, h: 280, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [{ id: 'ax', tipo: 'assi', box: [40, 20, 400, 230], dom: [0, 6.2, -2.2, 2.2], tacche: 1, etX: 'x', etY: 'Y' },
        { id: 'f', tipo: 'poli', in: 'ax', punti: pl(xs.map((x, i) => [x, D.f[i]])), tono: 'ok', vuoto: true }]
        .concat(pts('a', D.casuale, 'dato'), pts('s', D.sistematico, 'no'), pts('p', D.saleppepe, 'due'), [T('c', 570, 60, '', { size: 12 }), T('c2', 570, 90, '', { size: 12 })]),
      passi: [
        { nota: "<b>Y = f(x) + N(x)</b>: la funzione vera (qui sin x) più il rumore. Vediamo i tipi di rumore sulla stessa f." },
        { nota: "<b>Casuale</b>: senza schema, a volte sopra a volte sotto. Si descrive con una distribuzione, spesso 𝒩(0, σ²): media 0, quindi si attenua facendo medie.", set: Object.assign(vedi('a', n), { c: { t: 'casuale: media 0' } }) },
        { nota: "<b>Sistematico</b>: segue una regola e sposta tutto nella stessa direzione (qui +0.6). Fare medie non serve: la media resta spostata. Se lo conosci lo sottrai. Nell'assignment: la testa spostata tra calibrazione e test.", set: Object.assign(nasc('a', n), vedi('s', n), { c: { t: 'sistematico: tutto spostato' }, c2: { t: 'le medie non lo tolgono', tono: 'no' } }) },
        { nota: "<b>Sale e pepe</b> (impulsivo): pochi valori isolati e lontanissimi, come pixel bianchi o neri di un sensore difettoso. Esistono anche il rumore additivo (si somma) e moltiplicativo (cresce con il segnale).", set: Object.assign(nasc('s', n), vedi('p', n), { c: { t: 'sale e pepe: valori isolati' }, c2: { t: '' } }) }
      ]
    };

    const sc = p => p.filter(([x, y]) => Math.abs(x) < 3.2 && Math.abs(y) < 6.5);
    const py = sc(D.py), px = sc(D.px);
    SCENE.xrumore = {
      w: 560, h: 280, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [{ id: 'ax', tipo: 'assi', box: [40, 20, 400, 230], dom: [-3.2, 3.2, -6.5, 6.5], tacche: 2, etX: 'x', etY: 'y' },
        L('vera', -3, -6, 3, 6, { tono: 'ok' }), L('st', -3, -6, 3, 6, { tono: 'no', tratt: true, nascosto: true })]
        .concat(py.map(([x, y], i) => P('a' + i, x, y, '', { tono: 'dato', r: 3.5, nascosto: true })), px.map(([x, y], i) => P('b' + i, x, y, '', { tono: 'due', r: 3.5, nascosto: true })), [T('c', 500, 60, '', { size: 12 }), T('c2', 500, 90, '', { size: 12 })]),
      passi: [
        { nota: "Dati veri y = 2x. Dove sta il rumore cambia tutto, perché i minimi quadrati misurano le distanze <b>verticali</b>: assumono x esatto e tutto l'errore in y." },
        { nota: "Rumore solo su <b>y</b>: i punti si allargano in verticale. La pendenza stimata è giusta in media: <b>≈ 2</b> (simulazione con 100 000 punti).", set: Object.assign(vedi('a', py.length), { st: { nascosto: false }, c: { t: 'rumore su y: pendenza ≈ 2', tono: 'ok' } }) },
        { nota: "Rumore su <b>x</b>, grande quanto la variabilità di x: i punti si allargano in orizzontale, e la retta stimata si <b>appiattisce</b>. Pendenza ≈ <b>1</b>: dimezzata, in modo sistematico.", set: Object.assign(nasc('a', py.length), vedi('b', px.length), { st: { x1: -3, y1: -3, x2: 3, y2: 3 }, c: { t: '' }, c2: { t: 'rumore su x: pendenza ≈ 1', tono: 'no' } }) },
        { nota: "Nell'assignment l'input (il centro pupilla) è rumoroso: anche questo pesa. E attenzione: se il modello è troppo semplice, anche la parte di f che non sa rappresentare <b>sembra</b> rumore. Prima di chiamarlo rumore, chiediti se è il modello a essere sbagliato." }
      ]
    };

    const bar = (id, y, t) => [T(id + 't', 170, y + 17, t, { anchor: 'end', size: 12 }), R(id, 180, y, 0, 26, '', { tono: 'dato' }), T(id + 'v', 190, y + 17, '', { size: 12, anchor: 'start' })];
    SCENE.gestire = {
      w: 560, h: 230, lato: true,
      legenda: '{{j|s011|'}}',
      oggetti: [T('h', 280, 22, 'rumore casuale con σ = 1: quanto oscilla la media di n campioni?', { bold: true, size: 12 })].concat(bar('b1', 40, 'n = 1'), bar('b10', 80, 'n = 10'), bar('b100', 120, 'n = 100'), [R('s', 180, 170, 0, 26, '', { tono: 'no' }), T('st', 170, 187, 'sistematico', { anchor: 'end', size: 12, nascosto: true }), T('sv', 190, 187, '', { size: 12, anchor: 'start' })]),
      passi: [
        { nota: "Primo rimedio: <b>fare medie</b>. Il rumore casuale ha media 0: mediando tanti campioni si cancella in parte. Misuriamo quanto oscilla la media (20 000 prove simulate con NumPy)." },
        { nota: "Un campione solo: oscilla di σ ≈ 1.", set: { b1: { w: D.std_1 * 300 }, b1v: { t: String(D.std_1), x: 190 + D.std_1 * 300 } } },
        { nota: "Media di 10: ≈ 0.32. Media di 100: ≈ 0.10. La regola è <b>σ / √n</b>: 100 volte i dati, un decimo del rumore. È quello che fa l'assignment prendendo il centro pupilla medio per ogni target.", set: { b10: { w: D.std_10 * 300 }, b10v: { t: String(D.std_10), x: 190 + D.std_10 * 300 }, b100: { w: D.std_100 * 300 }, b100v: { t: String(D.std_100), x: 190 + D.std_100 * 300 } } },
        { nota: "Un errore <b>sistematico</b> invece non scende con n: la media resta spostata. Più dati attenuano il rumore casuale, non quello sistematico. Gli altri rimedi: filtrare (media locale, settimana 7), modelli più semplici o regolarizzati, togliere gli outlier con cautela (un outlier può essere proprio il caso interessante, come una frode).", set: { s: { w: 0.6 * 300 }, st: { nascosto: false }, sv: { t: 'resta 0.6 per ogni n', x: 190 + 180 } } }
      ]
    };

    SCENE.descrivi = {
      w: 560, h: 220, lato: true,
      legenda: '{{j|s012|'}}',
      oggetti: [{ id: 'ax', tipo: 'assi', box: [30, 60, 500, 60], dom: [0, 105, 0, 1], tacche: 10, etX: 'valore', numeri: true },
        P('d0', 2, 0.5, '', { tono: 'dato' }), P('d1', 3, 0.5, '', { tono: 'dato' }), P('d2', 3, 0.85, '', { tono: 'dato' }), P('d3', 4, 0.5, '', { tono: 'dato' }), P('d4', 100, 0.5, '100', { tono: 'dato' }),
        L('me', 22.4, 0, 22.4, 1, { tono: 'no', nascosto: true }), L('md', 3, 0, 3, 1, { tono: 'ok', nascosto: true }),
        T('c', 280, 160, '', { size: 12 }), T('c2', 280, 190, '', { size: 12 })],
      passi: [
        { nota: "Una <b>variabile casuale</b> non si conosce in anticipo, ma si descrive. Dati: [2, 3, 3, 4, 100]." },
        { nota: "<b>Media</b> = 112 / 5 = <b>22.4</b>: tirata verso destra dal 100. Non descrive nessuno dei quattro valori piccoli.", set: { me: { nascosto: false }, c: { t: 'media = 22.4', tono: 'no' } } },
        { nota: "<b>Mediana</b>: il valore in mezzo, una volta ordinati: <b>3</b>. Il 100 non la sposta.", set: { md: { nascosto: false }, c2: { t: 'mediana = 3', tono: 'ok' } } },
        { nota: "<b>Varianza</b> 1505.84 e deviazione standard 38.8 (NumPy, dividendo per N): quanto i dati si allargano attorno alla media, gonfiate dall'outlier. Senza il 100, media e mediana valgono tutte e due 3. Per più variabili: vettore medio e covarianza (settimana 9).", set: { c: { t: 'varianza 1505.84 · std 38.8', tono: null }, c2: { t: 'senza il 100: media = mediana = 3' } } }
      ]
    };

    const tr = D.tr, te = D.te, p1 = D.p1;
    const retta = x => p1[0] * x + p1[1];
    SCENE.generalizza = {
      w: 660, h: 280, lato: true,
      legenda: '{{j|s013|'}}',
      oggetti: [{ id: 'ax', tipo: 'assi', box: [40, 20, 380, 230], dom: [-0.3, 7.3, 0, 7], tacche: 1, etX: 'x', etY: 'y' },
        { id: 'c7', tipo: 'poli', in: 'ax', punti: pl(D.c7.filter(([x, y]) => y > -0.1 && y < 7)), tono: 'no', vuoto: true, nascosto: true },
        L('c1', 0, retta(0), 7, retta(7), { tono: 'ok', nascosto: true })]
        .concat(tr.map(([x, y], i) => P('t' + i, x, y, '', { tono: 'dato' })), te.map(([x, y], i) => P('v' + i, x, y, '', { tono: 'due', nascosto: true, r: 6 })),
          [T('c', 550, 60, '', { size: 12 }), T('c2', 550, 90, '', { size: 12 }), T('c3', 550, 130, '', { size: 12 }), T('c4', 550, 160, '', { size: 12 })]),
      passi: [
        { nota: "Lo scopo è stimare <b>f</b>, non ricordare i dati. Otto punti di training, generati da una retta più rumore." },
        { nota: "Un polinomio di grado 7 passa <b>esattamente</b> per tutti e 8: errore di training 0. Ha memorizzato anche il rumore.", set: { c7: { nascosto: false }, c: { t: 'grado 7: MSE train 0', tono: 'no' } } },
        { nota: "Una retta non passa per i punti: errore di training " + D.mse1[0] + ". Sembra peggio.", set: { c1: { nascosto: false }, c2: { t: 'retta: MSE train ' + D.mse1[0], tono: 'ok' } } },
        { nota: "Arrivano dati <b>nuovi</b> (test). Il grado 7: MSE " + D.mse7[1] + ". La retta: " + D.mse1[1] + ". Il modello che \"sapeva tutto\" sbaglia di più. L'<b>errore di generalizzazione</b> è la differenza fra errore sui dati nuovi ed errore sul training (calcolato con NumPy).", set: Object.assign(vedi('v', te.length), { c3: { t: 'grado 7: MSE test ' + D.mse7[1], tono: 'no' }, c4: { t: 'retta: MSE test ' + D.mse1[1], tono: 'ok' } }) },
        { nota: "Con dati finiti infinite funzioni passano per i punti: serve un'ipotesi per scegliere, l'<b>inductive bias</b> (qui: \"la relazione è una retta\"). Un'ipotesi giusta aiuta a generalizzare; una troppo rigida sbaglia ovunque (underfitting). E garbage in, garbage out: nessun modello recupera informazioni che i dati non hanno." }
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
  <figure class="passi" data-titolo="{{a|s017|}}">
    <div class="passo"><div class="espr"><mark class="ok">f(x)</mark></div><p class="nota">{{s|s018|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">Y(x)</mark> = <mark class="ok">f(x)</mark> + <mark class="no">N(x)</mark></div><p class="nota">{{s|s019|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">Y(x)</mark> = <mark class="ok">f(x)</mark> + <mark class="no">N(x)</mark> + <mark class="due">O(x)</mark></div><p class="nota">{{s|s020|}}</p></div>
  </figure>
  <figure class="scena" data-scena="rumore" data-titolo="{{a|s021|}}"></figure>
  <p class="piccolo">{{s|s022|}}</p>
</section>

<section>
  <h2>{{s|s023|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s024|}}</th><th>{{s|s025|}}</th><th>{{s|s026|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
      <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr>
      <tr><td>{{s|s033|}}</td><td>{{s|s034|}}</td><td>{{s|s035|}}</td></tr>
      <tr><td>{{s|s036|}}</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr>
      <tr><td>{{s|s039|}}</td><td>{{s|s040|}}</td><td>{{s|s041|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="passi" data-titolo="{{a|s042|}}">
    <div class="passo"><div class="espr">rumore sull'<mark class="dato">output</mark> (y):  pendenza stimata <mark class="ok">1.999</mark>  (vera 2)</div><p class="nota">{{s|s043|}}</p></div>
    <div class="passo"><div class="espr">rumore sull'<mark class="no">input</mark> (x):  pendenza stimata <mark class="no">0.999</mark>  (vera 2)</div><p class="nota">{{s|s044|}}</p></div>
  </figure>
  <div class="box attenzione" data-tit="{{a|s045|}}">
    <p>{{s|s046|}}</p>
  </div>
  <figure class="scena" data-scena="tiporumore" data-titolo="{{a|s047|}}"></figure>
</section>

<section>
  <h2>{{s|s048|}}</h2>
  <ul>
    <li>{{s|s049|}}</li>
    <li>{{s|s050|}}</li>
    <li>{{s|s051|}}</li>
    <li>{{s|s052|}}</li>
    <li>{{s|s053|}}</li>
  </ul>
  <div class="box attenzione" data-tit="{{a|s054|}}">
    <p>{{s|s055|}}</p>
  </div>
  <figure class="scena" data-scena="gestire" data-titolo="{{a|s056|}}"></figure>
</section>

<section>
  <h2>{{s|s057|}}</h2>
  <p>{{s|s058|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s059|}}</th><th>{{s|s060|}}</th><th>{{s|s061|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s062|}}</td><td>{{s|s063|}}</td><td>22.4</td></tr>
      <tr><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>3</td></tr>
      <tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td><td>1505.84 / 38.8</td></tr>
      <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>–</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s070|}}</p>
  <figure class="scena" data-scena="descrivi" data-titolo="{{a|s071|}}"></figure>
</section>

<section>
  <h2>{{s|s072|}}</h2>
  <figure class="passi" data-titolo="{{a|s073|}}">
    <div class="passo"><div class="espr">scopo: stimare <mark class="ok">f</mark>, non ricordare i <mark class="dato">dati</mark></div><p class="nota">{{s|s074|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">inductive bias</mark>: le ipotesi del modello</div><p class="nota">{{s|s075|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">generalizzazione</mark>: funzionare su dati mai visti</div><p class="nota">{{s|s076|}}</p></div>
    <div class="passo"><div class="espr"><mark class="no">garbage in, garbage out</mark></div><p class="nota">{{s|s077|}}</p></div>
  </figure>
  <div class="box inglese" data-tit="{{a|s078|}}">
    <p>{{s|s079|}}</p>
    <p>{{s|s080|}}</p>
    <p>{{s|s081|}}</p>
  </div>
  <div class="box esame" data-tit="{{a|s082|}}">
    <p>{{s|s083|}}</p>
  </div>
  <figure class="scena" data-scena="generalizza" data-titolo="{{a|s084|}}"></figure>
</section>

</main>
</body>
</html>
