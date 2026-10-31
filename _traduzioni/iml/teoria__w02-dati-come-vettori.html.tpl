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
  // 1. che cos'è un vettore
  SCENE.vettore = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 280, 220], dom: [-1, 4, -1, 3], tacche: 1, etX: 'x₁', etY: 'x₂' },
      { id: 'c1', tipo: 'linea', in: 'ax', x1: 0, y1: 0, x2: 3, y2: 0, tono: 'dato', nascosto: true },
      { id: 'c2', tipo: 'linea', in: 'ax', x1: 3, y1: 0, x2: 3, y2: 2, tono: 'dato', nascosto: true },
      { id: 'pp', tipo: 'punto', in: 'ax', x: 3, y: 2, t: '(3, 2)', tono: 'ok', nascosto: true },
      { id: 'vv', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 3, y2: 2, t: 'v', tx: -40, ty: -6, tono: 'ok', nascosto: true },
      { id: 'col', tipo: 'griglia', x: 440, y: 50, cw: 50, ch: 34, valori: [['3'], ['2']] },
      { id: 'tc', tipo: 'testo', x: 465, y: 34, t: 'v =', size: 14, bold: true },
      { id: 'dim', tipo: 'testo', x: 465, y: 150, t: '', size: 13 },
      { id: 'ri', tipo: 'testo', x: 465, y: 180, t: '', size: 13 }
    ],
    passi: [
      { nota: "Un <b>vettore</b> è una lista ordinata di numeri. Questo ne ha due: 3 e 2. Nelle slide si scrive <b>in colonna</b> (vettore colonna, <i>column vector</i>)." },
      { nota: "Ogni numero è una <b>componente</b>. La prima dice quanto andare lungo il primo asse (3), la seconda lungo il secondo (2). L'<b>ordine</b> conta: [3, 2] e [2, 3] sono vettori diversi.", set: { c1: { nascosto: false }, c2: { nascosto: false }, col: { toni: { '0,0': 'dato', '1,0': 'dato' } } } },
      { nota: "Si può vedere come un <b>punto</b> del piano: quello di coordinate (3, 2).", set: { pp: { nascosto: false } } },
      { nota: "Oppure come una <b>freccia</b> che parte dall'origine e arriva in quel punto. Punto e freccia sono due disegni dello stesso vettore.", set: { vv: { nascosto: false }, pp: { t: '' } } },
      { nota: "Il numero di componenti è la <b>dimensione</b>: questo vettore vive in ℝ², con 3 componenti in ℝ³, con n in ℝⁿ. Una posa del corso vive in ℝ⁵⁰. Si disegna fino a 3, ma le regole valgono per ogni n.", set: { dim: { t: '2 componenti: v ∈ ℝ²' }, ri: { t: 'n componenti: v ∈ ℝⁿ' } } }
    ]
  };

  // 2. feature
  const pers = [['A', 170, 65], ['B', 182, 80], ['C', 160, 55], ['D', 175, 72]];
  const og2 = [
    { id: 'tb', tipo: 'griglia', x: 20, y: 30, cw: 64, ch: 30, cwR: 40, intR: pers.map(p => p[0]), intC: ['altezza', 'peso'], valori: pers.map(p => [String(p[1]), String(p[2])]) },
    { id: 'ax', tipo: 'assi', box: [270, 20, 300, 210], dom: [150, 190, 50, 85], tacche: 10, etX: 'altezza (cm)', etY: 'peso (kg)', numeri: false }
  ];
  pers.forEach(([n, h, w], i) => og2.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x: h, y: w, t: n + ' (' + h + ', ' + w + ')', tono: 'dato', nascosto: true }));
  og2.push({ id: 'nt', tipo: 'testo', x: 130, y: 210, t: '', size: 13 });
  const riga = i => Object.fromEntries([0, 1].map(c => [i + ',' + c, 'ora']));
  SCENE.feature = {
    w: 600, h: 260, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: og2,
    passi: [
      { nota: "Una tabella di dati: 4 persone, 2 misure ciascuna (slide 38–39). Ogni colonna è una <b>feature</b> (caratteristica), ogni riga un esempio." },
      { nota: "La riga di A, (170, 65), è un vettore di 2 componenti: un punto nello spazio \"altezza × peso\".", set: { tb: { toni: riga(0) }, p0: { nascosto: false }, nt: { t: 'A = [170, 65]' } } },
      { nota: "Ogni altra riga è un altro punto.", set: { tb: { toni: {} }, p1: { nascosto: false }, p2: { nascosto: false }, p3: { nascosto: false }, nt: { t: '4 righe → 4 punti in ℝ²' } } },
      { nota: "Persone simili stanno <b>vicine</b> (A e D), diverse stanno lontane (B e C). Trasformare i dati in vettori serve proprio a questo: la somiglianza diventa una <b>distanza</b>, che si calcola (<a href=\"w02-norme-distanze.html\">lunghezza e distanza</a>).", set: { p0: { tono: 'ok' }, p3: { tono: 'ok' }, nt: { t: 'vicini = simili' } } }
    ]
  };

  // 3. posa (scena originale)
  const pt = [[0, 2], [0, 1], [-0.5, 0]];
  const ogg = [{ id: 'ax', tipo: 'assi', box: [30, 20, 170, 190], dom: [-1.5, 1.5, -0.3, 2.5], tacche: 1 }];
  pt.forEach((p, i) => ogg.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x: p[0], y: p[1], r: 6, t: 'P' + (i + 1), tx: 10, ty: -6, tono: 'dato' }));
  ogg.push({ id: 's1', tipo: 'linea', in: 'ax', x1: 0, y1: 2, x2: 0, y2: 1, tono: 'dato' });
  ogg.push({ id: 's2', tipo: 'linea', in: 'ax', x1: 0, y1: 1, x2: -0.5, y2: 0, tono: 'dato' });
  ogg.push({ id: 'V', tipo: 'celle', x: 230, y: 90, cw: 46, ch: 40, valori: ['', '', '', '', '', ''], etichette: ['x1', 'y1', 'x2', 'y2', 'x3', 'y3'] });
  ogg.push({ id: 'n', tipo: 'testo', x: 367, y: 186, t: '', size: 13, bold: true });
  const riempi = k => ['0', '2', '0', '1', '−0.5', '0'].map((v, i) => i < k ? v : '');
  SCENE.appiattire = {
    w: 520, h: 215, lato: false,
    legenda: '{{j|s004|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s005|'}}' },
      { nota: '{{j|s006|'}}', set: { p0: { tono: 'ora' }, V: { valori: riempi(2), toni: { 0: 'ora', 1: 'ora' } } } },
      { nota: '{{j|s007|'}}', set: { p0: { tono: 'dato' }, p1: { tono: 'ora' }, V: { valori: riempi(4), toni: { 2: 'ora', 3: 'ora' } } } },
      { nota: '{{j|s008|'}}', set: { p1: { tono: 'dato' }, p2: { tono: 'ora' }, V: { valori: riempi(6), toni: { 4: 'ora', 5: 'ora' } } } },
      { nota: '{{j|s009|'}}', set: { p2: { tono: 'dato' }, V: { toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok', 5: 'ok' } }, n: { t: '3 punti → 6 numeri;  25 punti → 50', tono: 'ok' } } }
    ]
  };

  // 4. immagine
  const img = [['0', '255', '0'], ['255', '255', '255'], ['0', '255', '0']];
  const flat = ['0', '255', '0', '255', '255', '255', '0', '255', '0'];
  const fino = k => flat.map((v, i) => i < k ? v : '');
  const tr = r => Object.fromEntries([0, 1, 2].map(c => [r + ',' + c, 'ora']));
  const tv = (a, b) => Object.fromEntries([...Array(b - a).keys()].map(i => [a + i, 'ora']));
  SCENE.immagine = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      { id: 'im', tipo: 'griglia', x: 30, y: 40, cw: 46, ch: 46, valori: img },
      { id: 'ti', tipo: 'testo', x: 99, y: 24, t: 'immagine 3 × 3', size: 12, bold: true },
      { id: 've', tipo: 'celle', x: 200, y: 90, cw: 42, valori: fino(0), indici: true },
      { id: 'tv', tipo: 'testo', x: 389, y: 70, t: 'vettore di 9 componenti', size: 12, bold: true },
      { id: 'nt', tipo: 'testo', x: 389, y: 170, t: '', size: 13 },
      { id: 'n2', tipo: 'testo', x: 389, y: 200, t: '', size: 13 }
    ],
    passi: [
      { nota: "Un'immagine in scala di grigi è una griglia di <b>pixel</b>, ognuno con un numero: 0 = nero, 255 = bianco. Questa, 3 × 3, disegna una croce (slide 40: \"images as vectors\")." },
      { nota: "Si copia la <b>prima riga</b> di pixel in fila.", set: { im: { toni: tr(0) }, ve: { valori: fino(3), toni: tv(0, 3) } } },
      { nota: "Poi la seconda, attaccata dopo.", set: { im: { toni: tr(1) }, ve: { valori: fino(6), toni: tv(3, 6) } } },
      { nota: "Poi la terza. Riga dopo riga: è quello che fa <code>img.flatten()</code> in NumPy (forma da (3, 3) a (9,)).", set: { im: { toni: tr(2) }, ve: { valori: fino(9), toni: tv(6, 9) } } },
      { nota: "L'immagine è diventata un punto di ℝ⁹. Un'immagine 28 × 28 diventa un vettore di 784 componenti. Due immagini simili hanno vettori vicini: si possono confrontare con le stesse formule dei punti del piano.", set: { im: { toni: {} }, ve: { toni: Object.fromEntries(flat.map((_, i) => [i, 'ok'])) }, nt: { t: '3 × 3 pixel → ℝ⁹' }, n2: { t: '28 × 28 pixel → ℝ⁷⁸⁴' } } }
    ]
  };

  // 5. somma e scalare
  SCENE.somma = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 300, 230], dom: [-2, 5, -3, 5], tacche: 1, etX: 'x₁', etY: 'x₂' },
      { id: 'u', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 1, t: 'u', tono: 'dato' },
      { id: 'v', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 3, t: 'v', tx: -18, tono: 'dato' },
      { id: 'vc', tipo: 'vett', in: 'ax', x1: 2, y1: 1, x2: 3, y2: 4, t: '', tono: 'ora', nascosto: true },
      { id: 'uv', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 3, y2: 4, t: 'u + v', tx: 8, ty: -2, tono: 'ok', nascosto: true },
      { id: 'u2', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 4, y2: 2, t: '2u', tono: 'ok', nascosto: true },
      { id: 'mv', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: -1, y2: -3, t: '−v', tx: 8, tono: 'ok', nascosto: true },
      { id: 'c1', tipo: 'testo', x: 475, y: 50, t: 'u = [2, 1],  v = [1, 3]', size: 13, bold: true },
      { id: 'c2', tipo: 'testo', x: 475, y: 84, t: '', size: 14 },
      { id: 'c3', tipo: 'testo', x: 475, y: 112, t: '', size: 14 }
    ],
    passi: [
      { nota: "Due vettori, u = [2, 1] e v = [1, 3]." },
      { nota: "<b>Somma</b> (slide 43): si sommano le componenti nella stessa posizione. u + v = [2 + 1, 1 + 3] = [3, 4]. Serve che i due vettori abbiano la <b>stessa dimensione</b>.", set: { c2: { t: 'u + v = [2+1, 1+3] = [3, 4]', tono: 'ok' } } },
      { nota: "Nel disegno: si attacca v in coda a u (freccia arancio)…", set: { vc: { nascosto: false } } },
      { nota: "…e la somma è la freccia dall'origine alla fine della catena: [3, 4].", set: { uv: { nascosto: false } } },
      { nota: "<b>Prodotto per uno scalare</b>: uno <b>scalare</b> è un numero singolo. 2u = [2·2, 2·1] = [4, 2]: stessa direzione, lunghezza doppia.", set: { vc: { nascosto: true }, uv: { nascosto: true }, u2: { nascosto: false }, c2: { t: '2u = [4, 2]', tono: 'ok' } } },
      { nota: "Con uno scalare negativo il verso si <b>rovescia</b>: −1·v = [−1, −3]. E la differenza u − v è u + (−1)·v = [1, −2]: componente per componente.", set: { mv: { nascosto: false }, c3: { t: '−v = [−1, −3],  u − v = [1, −2]', tono: 'ok' } } }
    ]
  };

  // 6. combinazione (scena originale)
  SCENE.combinazione = {
    w: 400, h: 280, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 300, 230], dom: [-0.5, 4, -0.5, 3], tacche: 1 },
      { id: 'u', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 0, t: 'u', tx: -6, ty: -12, tono: 'dato' },
      { id: 'v', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 0, y2: 1, t: 'v', tx: 12, ty: 6, tono: 'dato' },
      { id: 'u3', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 3, y2: 0, t: '3u', tx: -14, ty: -12, tono: 'ora', nascosto: true },
      { id: 'v2', tipo: 'vett', in: 'ax', x1: 3, y1: 0, x2: 3, y2: 2, t: '2v', tx: 12, ty: 8, tono: 'ora', nascosto: true },
      { id: 'w', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 3, y2: 2, t: '[3, 2]', tx: -52, ty: -6, tono: 'ok', nascosto: true }
    ],
    passi: [
      { nota: '{{j|s013|'}}' },
      { nota: '{{j|s014|'}}', set: { u3: { nascosto: false } } },
      { nota: '{{j|s015|'}}', set: { v2: { nascosto: false } } },
      { nota: '{{j|s016|'}}', set: { w: { nascosto: false } } }
    ]
  };

  // 7. più dimensioni
  const rigaP = (id, y, vals, et) => ({ id, tipo: 'celle', x: 150, y, cw: 64, valori: vals, indici: false, etichette: et });
  SCENE.dimensioni = {
    w: 600, h: 260, lato: true,
    legenda: '{{j|s017|'}}',
    oggetti: [
      { id: 't0', tipo: 'testo', x: 70, y: 57, t: 'posa 0', size: 13, bold: true },
      rigaP('a', 40, ['−28.00', '−6.49', '−0.12', '−1.17', '0.84', '…']),
      { id: 't1', tipo: 'testo', x: 70, y: 117, t: 'posa 1', size: 13, bold: true },
      rigaP('b', 100, ['−28.79', '−7.15', '−0.09', '−1.12', '0.65', '…']),
      { id: 't2', tipo: 'testo', x: 70, y: 177, t: 'differenza', size: 13, bold: true, nascosto: true },
      Object.assign(rigaP('d', 160, ['−0.80', '−0.67', '0.02', '0.05', '−0.20', '…']), { nascosto: true }),
      { id: 'nt', tipo: 'testo', x: 300, y: 236, t: 'ogni posa: 50 componenti (qui le prime 5)', size: 13 }
    ],
    passi: [
      { nota: "Due pose vere da <code>poses.npy</code>, le righe 0 e 1: 50 componenti ciascuna, qui le prime cinque. Non si possono disegnare 50 assi.", set: { a: { toni: { 0: 'dato', 1: 'dato', 2: 'dato', 3: 'dato', 4: 'dato' } }, b: { toni: { 0: 'dato', 1: 'dato', 2: 'dato', 3: 'dato', 4: 'dato' } } } },
      { nota: "Ma le operazioni si fanno <b>componente per componente</b> come in 2D. La differenza posa 1 − posa 0 ha ancora 50 componenti: −28.79 − (−28.00) = −0.80, e così via (arrotondati a due decimali).", set: { t2: { nascosto: false }, d: { nascosto: false, toni: { 0: 'ora', 1: 'ora', 2: 'ora', 3: 'ora', 4: 'ora' } } } },
      { nota: "Dalla differenza si calcola la distanza fra le due pose, con la stessa formula del piano ma con 50 termini: <b>3.949</b> (<code>np.linalg.norm(P[1] − P[0])</code>, calcolato sul file). \"From two-dimensional vector spaces to higher-dimensional spaces\": le formule restano identiche, cambia solo quanti termini hanno.", set: { nt: { t: 'distanza fra posa 0 e posa 1 = 3.949', tono: 'ok' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s018|}}</h1>
  <p class="lede">{{s|s019|}}</p>
</header>

<section>
  <h2>{{s|s020|}}</h2>
  <p>{{s|s021|}}</p>
  <p>{{s|s022|}}</p>
  <p>{{s|s023|}}</p>
  <div class="box domanda-tua" data-tit="{{a|s024|}}">
    <p>{{s|s025|}}</p>
  </div>
  <figure class="scena" data-scena="vettore" data-titolo="{{a|s026|}}"></figure>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
  <p>{{s|s029|}}</p>
  <p>{{s|s030|}}</p>
  <figure class="scena" data-scena="feature" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <p>{{s|s033|}}</p>
  <p>{{s|s034|}}</p>
  <div class="box inglese" data-tit="{{a|s035|}}">
    <p>{{s|s036|}}</p>
  </div>
  <figure class="scena" data-scena="appiattire" data-titolo="{{a|s037|}}"></figure>
</section>

<section>
  <h2>{{s|s038|}}</h2>
  <p>{{s|s039|}}</p>
  <p>{{s|s040|}}</p>
  <p>{{s|s041|}}</p>
  <figure class="scena" data-scena="immagine" data-titolo="{{a|s042|}}"></figure>
</section>

<section>
  <h2>{{s|s043|}}</h2>
  <p>{{s|s044|}}</p>
  <p>{{s|s045|}}</p>
  <p>{{s|s046|}}</p>
  <p>{{s|s047|}}</p>
  <figure class="scena" data-scena="somma" data-titolo="{{a|s048|}}"></figure>
</section>

<section>
  <h2>{{s|s049|}}</h2>
  <p>{{s|s050|}}</p>
  <div class="mblock"><span class="m">u = [1, 0]</span> &nbsp; <span class="m">v = [0, 1]</span> &nbsp;&rarr;&nbsp; <span class="m">3u + 2v = [3, 2]</span></div>
  <p>{{s|s051|}}</p>
  <div class="box regola" data-tit="{{a|s052|}}">
    <p>{{s|s053|}}</p>
  </div>
  <figure class="scena" data-scena="combinazione" data-titolo="{{a|s054|}}"></figure>
</section>

<section>
  <h2>{{s|s055|}}</h2>
  <p>{{s|s056|}}</p>
  <p>{{s|s057|}}</p>
  <p class="piccolo">{{s|s058|}}</p>
  <figure class="scena" data-scena="dimensioni" data-titolo="{{a|s059|}}"></figure>
</section>

</main>
</body>
</html>
