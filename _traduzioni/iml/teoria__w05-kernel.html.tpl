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
  const G = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'griglia', x, y, cw: 44, ch: 30, valori: vals }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const pl = p => p.concat(p.slice().reverse());

  // 1. l'idea (scena originale)
  const X = [-2, -1, 0, 1, 2], f = x => 1 + 0.5 * x * x;
  const ogg = [{ id: 'ax', tipo: 'assi', box: [40, 15, 350, 175], dom: [-2.5, 4.5, 0, 3.5], tacche: 1 }];
  X.forEach((x, i) => ogg.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x, y: f(x), tono: 'dato' }));
  const xs = []; for (let x = -2.2; x <= 2.21; x += 0.2) xs.push(+x.toFixed(2));
  xs.slice(0, -1).forEach((x, k) => ogg.push({ id: 'c' + k, tipo: 'linea', in: 'ax', x1: x, y1: f(x), x2: xs[k + 1], y2: f(xs[k + 1]), tono: 'spento', nascosto: true }));
  ogg.push({ id: 'retta', tipo: 'linea', in: 'ax', x1: -0.2, y1: 0.9, x2: 4.4, y2: 3.2, tono: 'ok', nascosto: true });
  ogg.push({ id: 'ex', tipo: 'testo', x: 380, y: 170, t: 'x', size: 14, bold: true });
  ogg.push({ id: 'n', tipo: 'testo', x: 215, y: 222, t: '', size: 13, bold: true });
  const curva = v => Object.fromEntries(xs.slice(0, -1).map((_, k) => ['c' + k, { nascosto: !v }]));
  const sposta = Object.fromEntries(X.map((x, i) => ['p' + i, { x: x * x, tono: 'ora' }]));
  SCENE.feature = {
    w: 420, h: 235, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s003|'}}' },
      { nota: '{{j|s004|'}}', set: Object.assign(curva(true), { n: { t: 'y = 1 + 0.5 x²' } }) },
      { nota: '{{j|s005|'}}', set: Object.assign(curva(false), sposta, { ex: { t: 'z = x²' }, n: { t: '' } }) },
      { nota: '{{j|s006|'}}', set: { retta: { nascosto: false }, n: { t: 'y = w₀ + w₁ z   con z = x²', tono: 'ok' } } }
    ]
  };

  // 2. φ: da un numero a un vettore
  const giro = (x, v) => ({ xi: { t: 'x = ' + x }, out: { valori: v.map(String), toni: { 0: 'ora', 1: 'ora', 2: 'ora' } } });
  SCENE.phi = {
    w: 600, h: 220, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [
      R('xi', 20, 70, 90, 44, 'x = −1', { tono: 'dato' }),
      { id: 'a1', tipo: 'vett', x1: 112, y1: 92, x2: 168, y2: 92, t: '' },
      R('ph', 170, 60, 150, 64, 'φ(x) = [1, x, x²]', { tono: 'ora' }),
      { id: 'a2', tipo: 'vett', x1: 322, y1: 92, x2: 368, y2: 92, t: '' },
      { id: 'out', tipo: 'celle', x: 370, y: 75, cw: 60, valori: ['', '', ''], etichette: ['1', 'x', 'x²'] },
      T('c', 300, 180, '', { size: 13 })
    ],
    passi: [
      { nota: "Un <b>kernel</b> in questo corso (o <i>feature mapping</i>) è una funzione φ (phi) che trasforma l'ingresso in un <b>vettore di feature</b>. Qui φ(x) = [1, x, x²]." },
      Object.assign({ nota: "x = −1: φ(−1) = [1, −1, 1]." }, { set: giro(-1, [1, -1, 1]) }),
      Object.assign({ nota: "x = 2: φ(2) = [1, 2, 4]." }, { set: giro(2, [1, 2, 4]) }),
      Object.assign({ nota: "x = 3: φ(3) = [1, 3, 9]. Un numero è diventato tre numeri: ogni dato ora vive in uno spazio a 3 dimensioni, lo <b>spazio delle feature</b>. Il modello y = w · φ(x) è lineare in w.", }, { set: Object.assign(giro(3, [1, 3, 9]), { c: { t: 'da ℝ a ℝ³: lo spazio delle feature' } }) })
    ]
  };

  // 3. la design matrix Φ
  const vuote = [['', '', ''], ['', '', ''], ['', '', ''], ['', '', ''], ['', '', '']];
  const Phi = [['1', '−2', '4'], ['1', '−1', '1'], ['1', '0', '0'], ['1', '1', '1'], ['1', '2', '4']];
  const fino = k => Phi.map((r, i) => i < k ? r : ['', '', '']);
  SCENE.phimat = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [
      T('tx', 70, 28, 'x', { bold: true, size: 13 }), G('x', 48, 40, [['−2'], ['−1'], ['0'], ['1'], ['2']], { toni: { '0,0': 'dato', '1,0': 'dato', '2,0': 'dato', '3,0': 'dato', '4,0': 'dato' } }),
      T('tp', 220, 28, 'Φ', { bold: true, size: 13 }), G('P', 150, 40, vuote, { intC: ['1', 'x', 'x²'] }),
      T('c1', 460, 70, '', { size: 13 }), T('c2', 460, 110, '', { size: 13 }), T('c3', 460, 160, '', { bold: true })
    ],
    passi: [
      { nota: "Cinque dati x. Si applica φ a <b>ogni</b> dato e si mette il risultato in riga: la design matrix diventa <b>Φ</b> (Phi maiuscola)." },
      { nota: "Prima riga: φ(−2) = [1, −2, 4].", set: { P: { valori: fino(1), toni: { '0,0': 'ora', '0,1': 'ora', '0,2': 'ora' } } } },
      { nota: "Tutte le righe, una per dato.", set: { P: { valori: Phi, toni: {} }, c1: { t: 'Φ: 5 × 3' } } },
      { nota: "Poi tutto come prima: <b>Φw ≈ y</b>, risolto con i minimi quadrati, w = Φ⁺y. Con le y della parabola si ottiene w = [1, 0, 0.5] (verificato con <code>lstsq</code>). Stessa pseudoinversa, stessa formula chiusa: cambiano solo le colonne.", set: { c2: { t: 'Φ w ≈ y  →  w = Φ⁺ y' }, c3: { t: 'w = [1, 0, 0.5]', tono: 'ok' } } }
    ]
  };

  // 4. kernel in 2D
  SCENE.quad2d = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      R('xi', 20, 80, 100, 44, '(x, y) = (2, 3)', { tono: 'dato' }),
      { id: 'a1', tipo: 'vett', x1: 122, y1: 102, x2: 158, y2: 102, t: '' },
      { id: 'out', tipo: 'celle', x: 160, y: 85, cw: 62, valori: ['', '', '', '', '', ''], etichette: ['1', 'x', 'y', 'x²', 'xy', 'y²'] },
      T('c1', 300, 40, '', { size: 13 }), T('c2', 300, 175, '', { size: 13 }), T('c3', 300, 205, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "Con due ingressi (per esempio la posizione della pupilla, x e y) il polinomio completo di grado 2 ha <b>6</b> termini." },
      { nota: "Il termine costante e i due termini lineari: 1, x = 2, y = 3. Con solo questi il modello è <b>affine</b>.", set: { out: { valori: ['1', '2', '3', '', '', ''], toni: { 0: 'due', 1: 'due', 2: 'due' } }, c1: { t: 'affine: [1, x, y]' } } },
      { nota: "I tre termini quadratici: x² = 4, xy = 6, y² = 9. Il termine misto xy conta: permette al modello di \"piegarsi\" in diagonale.", set: { out: { valori: ['1', '2', '3', '4', '6', '9'], toni: { 0: 'due', 1: 'due', 2: 'due', 3: 'ora', 4: 'ora', 5: 'ora' } }, c1: { t: 'quadratico: [1, x, y, x², xy, y²]' } } },
      { nota: "6 feature = 6 parametri <b>per ogni uscita</b>. Nell'Assignment 1 lo schermo ha due coordinate, quindi 12 parametri in tutto, e servono almeno 6 punti di calibrazione. L'ordine delle colonne deve essere lo stesso in training e in predizione: una colonna scambiata dà previsioni sbagliate senza nessun errore visibile.", set: { c2: { t: 'per ogni coordinata dello schermo: 6 pesi' }, c3: { t: 'ordine delle colonne sempre uguale!', tono: 'no' } } }
    ]
  };

  // 5. seni e coseni
  const tt = [0.0, 0.55, 1.09, 1.64, 2.18, 2.73, 3.27, 3.82, 4.36, 4.91, 5.45, 6.0];
  const yt = [1.92, 1.98, 1.88, 1.48, 0.95, 0.3, -0.11, -0.17, 0.26, 0.87, 1.33, 1.7];
  const og5 = [{ id: 'ax', tipo: 'assi', box: [40, 20, 330, 210], dom: [0, 6.3, -0.5, 2.5], tacche: 1, etX: 't', etY: 'y' }];
  tt.forEach((t, i) => og5.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x: t, y: yt[i], t: '', tono: 'dato' }));
  const fit = []; for (let t = 0; t <= 6.3; t += 0.1) fit.push([t, 0.997 + 0.482 * Math.sin(t) + 0.957 * Math.cos(t)]);
  og5.push({ id: 'ret', tipo: 'linea', in: 'ax', x1: 0, y1: 1.4, x2: 6.3, y2: 0.3, tono: 'no', nascosto: true });
  og5.push({ id: 'cu', tipo: 'poli', in: 'ax', punti: pl(fit), tono: 'ok', nascosto: true });
  og5.push(T('c1', 480, 60, '', { size: 13 }), T('c2', 480, 100, '', { size: 13 }), T('c3', 480, 140, '', { size: 13, bold: true }), T('c4', 480, 180, '', { size: 12 }));
  SCENE.seni = {
    w: 620, h: 262, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: og5,
    passi: [
      { nota: "Misure che <b>oscillano</b> nel tempo (una temperatura nell'arco della giornata, un movimento periodico). Dati simulati con un po' di rumore." },
      { nota: "Una retta non ha speranza: le misure salgono e scendono.", set: { ret: { nascosto: false }, c1: { t: 'retta: sbaglia ovunque', tono: 'no' } } },
      { nota: "Kernel scelto per il problema: <b>φ(t) = [1, sin t, cos t]</b>. Le colonne della design matrix sono le funzioni che \"sanno\" oscillare.", set: { c2: { t: 'φ(t) = [1, sin t, cos t]' } } },
      { nota: "I minimi quadrati danno w = [0.997, 0.482, 0.957] (i valori veri usati per simulare erano [1, 0.5, 1]). Il modello y = w₀ + w₁ sin t + w₂ cos t segue l'oscillazione. Scegliere φ è il vero lavoro: il kernel porta dentro il modello ciò che sappiamo del problema (calcolato con NumPy).", set: { ret: { nascosto: true }, cu: { nascosto: false }, c1: { t: '' }, c3: { t: 'w = [0.997, 0.482, 0.957]', tono: 'ok' }, c4: { t: 'veri: [1, 0.5, 1]' } } }
    ]
  };

  // 6. il prezzo: overfitting
  const X6 = [0.0, 0.111, 0.222, 0.333, 0.444, 0.556, 0.667, 0.778, 0.889, 1.0], Y6 = [0.01, 0.91, 1.23, 0.76, 0.28, -0.45, -0.75, -1.0, -0.49, -0.37];
  const g = i => i * 0.025;
  const C = {
    1: [0.82, 0.78, 0.74, 0.7, 0.66, 0.62, 0.58, 0.54, 0.5, 0.46, 0.42, 0.38, 0.34, 0.3, 0.26, 0.22, 0.17, 0.13, 0.09, 0.05, 0.01, -0.03, -0.07, -0.11, -0.15, -0.19, -0.23, -0.27, -0.31, -0.35, -0.39, -0.43, -0.47, -0.51, -0.55, -0.59, -0.63, -0.67, -0.71, -0.75, -0.8],
    3: [0.11, 0.33, 0.52, 0.68, 0.81, 0.9, 0.97, 1.01, 1.03, 1.03, 1.0, 0.96, 0.9, 0.83, 0.74, 0.64, 0.53, 0.42, 0.29, 0.17, 0.04, -0.09, -0.21, -0.34, -0.46, -0.57, -0.67, -0.76, -0.84, -0.91, -0.96, -0.99, -1.0, -0.99, -0.96, -0.9, -0.81, -0.7, -0.55, -0.38, -0.16],
    9: [0.01, -0.73, -0.47, 0.12, 0.7, 1.12, 1.33, 1.39, 1.33, 1.22, 1.09, 0.97, 0.87, 0.79, 0.71, 0.62, 0.52, 0.4, 0.24, 0.08, -0.1, -0.27, -0.42, -0.54, -0.63, -0.69, -0.73, -0.76, -0.79, -0.84, -0.91, -0.99, -1.06, -1.06, -0.97, -0.71, -0.28, 0.28, 0.77, 0.81, -0.37]
  };
  const cur = d => pl(C[d].map((v, i) => [g(i), v]));
  const og6 = [{ id: 'ax', tipo: 'assi', box: [40, 20, 300, 220], dom: [0, 1, -1.5, 1.6], tacche: 0.5, numeri: false, etX: 'x', etY: 'y' }];
  X6.forEach((x, i) => og6.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x, y: Y6[i], t: '', tono: 'dato' }));
  og6.push({ id: 'cu', tipo: 'poli', in: 'ax', punti: cur(1), tono: 'ok', nascosto: true });
  og6.push(T('d', 470, 50, '', { bold: true }), T('tr', 470, 90, '', { size: 13 }), T('va', 470, 120, '', { size: 13 }), T('c', 470, 170, '', { size: 12 }));
  const gr = (d, tr, va, tono, extra) => Object.assign({ cu: { nascosto: false, punti: cur(d), tono }, d: { t: 'grado ' + d + ': ' + (d + 1) + ' parametri' }, tr: { t: 'errore di training: ' + tr }, va: { t: 'errore su dati nuovi: ' + va, tono } }, extra || {});
  SCENE.prezzo = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: og6,
    passi: [
      { nota: "Dieci punti rumorosi (dati simulati da un'onda). Kernel polinomiali di grado crescente: ogni grado in più è una feature in più, cioè un parametro in più." },
      { nota: "Grado 1 (retta): troppo rigido. Sbaglia sia sui dati di training sia su dati nuovi.", set: gr(1, '0.248', '0.203', 'no') },
      { nota: "Grado 3: segue la forma dell'onda. Errore basso sui dati <b>e</b> su dati nuovi.", set: gr(3, '0.028', '0.024', 'ok') },
      { nota: "Grado 9: 10 parametri per 10 punti. Passa esattamente per tutti (errore di training 0), ma si contorce fra un punto e l'altro: su dati nuovi l'errore sale a 0.363, peggio della retta. È l'<b>overfitting</b>: il modello ha imparato il rumore (numeri calcolati con <code>np.polyfit</code>; i \"dati nuovi\" sono 5 punti della funzione vera).", set: gr(9, '0.000', '0.363', 'no', { c: { t: 'più feature ≠ modello migliore', tono: 'no' } }) }
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
  <p>{{s|s015|}}</p>
  <p>{{s|s016|}}</p>
  <p>{{s|s017|}}</p>
  <figure class="scena" data-scena="feature" data-titolo="{{a|s018|}}"></figure>
</section>

<section>
  <h2>{{s|s019|}}</h2>
  <div class="box regola" data-tit="{{a|s020|}}">
    <p>{{s|s021|}}</p>
  </div>
  <p>{{s|s022|}}</p>
  <p>{{s|s023|}}</p>
  <figure class="scena" data-scena="phi" data-titolo="{{a|s024|}}"></figure>
</section>

<section>
  <h2>{{s|s025|}}</h2>
  <p>{{s|s026|}}</p>
  <figure class="passi" data-titolo="{{a|s027|}}">
    <div class="passo"><div class="espr">modello lineare: riga i = [<mark class="dato">1, xᵢ</mark>]</div><p class="nota">{{s|s028|}}</p></div>
    <div class="passo"><div class="espr">{{s|s029|}}</div><p class="nota">{{s|s030|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">Φ</mark> w ≈ y   ⇒   w = <mark class="ok">Φ⁺ y</mark></div><p class="nota">{{s|s031|}}</p></div>
    <div class="passo"><div class="espr">{{s|s032|}}</div><p class="nota">{{s|s033|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s034|}}</th><th>{{s|s035|}}</th><th>{{s|s036|}}</th><th>{{s|s037|}}</th></tr></thead>
    <tbody>
      <tr><td>x (1D)</td><td>{{s|s038|}}</td><td>[1, x, x²]</td><td>{{s|s039|}}</td></tr>
      <tr><td>x (1D)</td><td>{{s|s040|}}</td><td>[1, x, …, xᵈ]</td><td>{{s|s041|}}</td></tr>
      <tr><td>(x, y) (2D)</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td><td>{{s|s044|}}</td></tr>
      <tr><td>{{s|s045|}}</td><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr>
      <tr><td>(x, y)</td><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td>{{s|s051|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="phimat" data-titolo="{{a|s052|}}"></figure>
</section>

<section>
  <h2>{{s|s053|}}</h2>
  <p>{{s|s054|}}</p>
  <p>{{s|s055|}}</p>
  <div class="box attenzione" data-tit="{{a|s056|}}">
    <p>{{s|s057|}}</p>
  </div>
  <figure class="scena" data-scena="quad2d" data-titolo="{{a|s058|}}"></figure>
</section>

<section>
  <h2>{{s|s059|}}</h2>
  <p>{{s|s060|}}</p>
  <p>{{s|s061|}}</p>
  <figure class="scena" data-scena="seni" data-titolo="{{a|s062|}}"></figure>
</section>

<section>
  <h2>{{s|s063|}}</h2>
  <p>{{s|s064|}}</p>
  <p>{{s|s065|}}</p>
  <div class="box esame" data-tit="{{a|s066|}}">
    <p>{{s|s067|}}</p>
  </div>
  <figure class="scena" data-scena="prezzo" data-titolo="{{a|s068|}}"></figure>
</section>

</main>
</body>
</html>
