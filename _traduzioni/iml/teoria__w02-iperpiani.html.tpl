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

  // 1. i punti che rendono vera l'equazione
  const pr = (x, y, ok) => ({ q: { x, y, t: '(' + x + ', ' + y + ')', nascosto: false, tono: ok ? 'ok' : 'no' } });
  SCENE.rettavera = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 280, 230], dom: [-1, 4, -1, 8], tacche: 1, etX: 'x', etY: 'y' },
      { id: 'li', tipo: 'linea', in: 'ax', x1: -1, y1: -1, x2: 3.5, y2: 8, tono: 'spento', nascosto: true },
      { id: 'q', tipo: 'punto', in: 'ax', x: 1, y: 3, t: '', nascosto: true },
      T('eq', 460, 50, 'y = 2x + 1', { bold: true, size: 16 }),
      T('c1', 460, 96, ''), T('c2', 460, 126, '', { bold: true })
    ],
    passi: [
      { nota: "Un'equazione come y = 2x + 1 è una <b>domanda</b>: per quali coppie (x, y) è vera? La retta è l'insieme di <b>tutti i punti che la rendono vera</b> (slide 8 della lezione 2: \"all points satisfying the equation\")." },
      { nota: "Il punto (1, 3): 2·1 + 1 = 3. Vera: il punto sta sulla retta.", set: Object.assign(pr(1, 3, true), { c1: { t: '2·1 + 1 = 3' }, c2: { t: 'vera ✓', tono: 'ok' } }) },
      { nota: "Il punto (2, 4): 2·2 + 1 = 5, ma y = 4. Falsa: il punto sta sotto la retta.", set: Object.assign(pr(2, 4, false), { c1: { t: '2·2 + 1 = 5 ≠ 4' }, c2: { t: 'falsa', tono: 'no' } }) },
      { nota: "Il punto (0, 1): 2·0 + 1 = 1. Vera.", set: Object.assign(pr(0, 1, true), { c1: { t: '2·0 + 1 = 1' }, c2: { t: 'vera ✓', tono: 'ok' } }) },
      { nota: "Tutti i punti veri, messi insieme, disegnano la retta. Un modello di regressione è proprio questo: l'insieme dei punti (x, ŷ) che il modello considera \"giusti\".", set: { li: { nascosto: false, tono: 'ok' }, c1: { t: 'tutti i punti veri' }, c2: { t: '= la retta', tono: 'ok' } } }
    ]
  };

  // 2. la retta come w · x = b, con il vettore normale
  SCENE.normale = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 280, 230], dom: [-2, 3, -1, 4], tacche: 1, etX: 'x₁', etY: 'x₂' },
      { id: 'li', tipo: 'linea', in: 'ax', x1: -2, y1: -3, x2: 1.5, y2: 4, tono: 'ok' },
      { id: 'w', tipo: 'vett', in: 'ax', x1: 0, y1: 1, x2: -2, y2: 2, t: 'w = [−2, 1]', tx: -10, ty: -12, tono: 'due', nascosto: true },
      { id: 'p', tipo: 'punto', in: 'ax', x: 1, y: 3, t: '(1, 3)', tono: 'dato', nascosto: true },
      T('e1', 460, 50, '−2x₁ + x₂ = 1', { bold: true, size: 15 }),
      T('e2', 460, 80, 'w · x = b', { bold: true, size: 15, nascosto: true }),
      T('c1', 460, 130, ''), T('c2', 460, 160, '')
    ],
    passi: [
      { nota: "La stessa retta y = 2x + 1, scritta con x₁ al posto di x e x₂ al posto di y, e con le incognite tutte a sinistra: −2x₁ + x₂ = 1." },
      { nota: "La parte sinistra è un <b>prodotto interno</b>: [−2, 1] · [x₁, x₂]. Quindi la retta è l'insieme dei punti x con <b>w · x = b</b>, dove w = [−2, 1] e b = 1. \"Inner product equal to a value\" (slide 17 della lezione 2).", set: { e2: { nascosto: false } } },
      { nota: "Il vettore w è <b>perpendicolare</b> alla retta: si chiama <b>vettore normale</b>. Muoversi lungo la retta non cambia w · x, perché lo spostamento è ortogonale a w.", set: { w: { nascosto: false } } },
      { nota: "Controllo con (1, 3): −2·1 + 1·3 = 1 = b. Sta sulla retta.", set: { p: { nascosto: false }, c1: { t: 'w · (1, 3) = −2 + 3 = 1', tono: 'ok' } } },
      { nota: "Questa forma vale in qualunque dimensione: \"linear equations in x are those that can be represented by an inner product\". Cambia solo la lunghezza di w e di x.", set: { c2: { t: 'vale per ogni n' } } }
    ]
  };

  // 3. il piano in 3D (proiezione obliqua disegnata a mano)
  const P = (x1, x2, z) => [100 + 45 * x1 + 28 * x2, 232 - 20 * x2 - 30 * z];
  const piano = (x1, x2) => 1 + 0.5 * x1 + 0.3 * x2;
  const L = (id, a, b, extra) => Object.assign({ id, tipo: 'linea', x1: a[0], y1: a[1], x2: b[0], y2: b[1] }, extra || {});
  const V = (x1, x2) => P(x1, x2, piano(x1, x2));
  const og3 = [
    L('ax1', P(0, 0, 0), P(4.6, 0, 0), { tono: 'spento' }), L('ax2', P(0, 0, 0), P(0, 5, 0), { tono: 'spento' }), L('ax3', P(0, 0, 0), P(0, 0, 5), { tono: 'spento' }),
    T('l1', P(4.8, 0, 0)[0] + 8, P(4.8, 0, 0)[1], 'x₁', { size: 13 }), T('l2', P(0, 5.2, 0)[0] + 10, P(0, 5.2, 0)[1], 'x₂', { size: 13 }), T('l3', P(0, 0, 5.3)[0], P(0, 0, 5.3)[1] - 4, 'y', { size: 13 }),
    { id: 'pav', tipo: 'poli', punti: [P(0, 0, 0), P(4, 0, 0), P(4, 4, 0), P(0, 4, 0)], tono: 'spento', vuoto: true },
    { id: 'pl', tipo: 'poli', punti: [V(0, 0), V(4, 0), V(4, 4), V(0, 4)], tono: 'ok', nascosto: true },
    L('d1', P(4, 0, 0), V(4, 0), { tratt: true, tono: 'spento', nascosto: true }), L('d2', P(4, 4, 0), V(4, 4), { tratt: true, tono: 'spento', nascosto: true }), L('d3', P(0, 4, 0), V(0, 4), { tratt: true, tono: 'spento', nascosto: true }),
    { id: 'o', tipo: 'punto', x: V(0, 0)[0], y: V(0, 0)[1], t: 'w₀ = 1', tx: -58, tono: 'dato', nascosto: true },
    L('s1', V(0, 0), V(2, 0), { tono: 'ora', nascosto: true }), L('s2', V(0, 0), V(0, 2), { tono: 'due', nascosto: true }),
    T('e', 500, 50, 'y = w₀ + w₁x₁ + w₂x₂', { bold: true, size: 14 }),
    T('c1', 500, 90, '', { size: 13 }), T('c2', 500, 120, '', { size: 13 }), T('c3', 500, 150, '', { size: 13 }), T('c4', 500, 196, '', { size: 13, bold: true })
  ];
  SCENE.piano = {
    w: 620, h: 262, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: og3,
    passi: [
      { nota: "Con <b>due</b> ingressi x₁, x₂ e un'uscita y servono tre assi. Il pavimento grigio sono gli ingressi, l'altezza è y." },
      { nota: "Il modello y = 1 + 0.5·x₁ + 0.3·x₂ assegna un'altezza a ogni punto del pavimento: tutte insieme formano un <b>piano</b> inclinato. Le slide lo chiamano \"affine multivariate function\" (slide 54 della lezione 1).", set: { pl: { nascosto: false }, d1: { nascosto: false }, d2: { nascosto: false }, d3: { nascosto: false }, c1: { t: 'w₀ = 1, w₁ = 0.5, w₂ = 0.3' } } },
      { nota: "<b>w₀</b> è l'altezza del piano sopra l'origine (x₁ = x₂ = 0): l'intercetta, come nella retta.", set: { o: { nascosto: false }, c2: { t: 'w₀: altezza in (0, 0)', tono: 'dato' } } },
      { nota: "<b>w₁</b> è la pendenza nella direzione di x₁: andando avanti di 2 lungo x₁, il piano sale di 2·0.5 = 1.", set: { s1: { nascosto: false }, c3: { t: 'w₁: pendenza lungo x₁', tono: 'ora' } } },
      { nota: "<b>w₂</b> è la pendenza nella direzione di x₂: di 2 lungo x₂, il piano sale di 0.6. Ogni peso dice quanto conta la sua feature.", set: { s2: { nascosto: false }, c4: { t: 'w₂: pendenza lungo x₂', tono: 'due' } } }
    ]
  };

  // 4. iperpiani: 1D, 2D, 3D
  const Q = (x1, x2, z) => [400 + 30 * x1 + 18 * x2, 190 - 14 * x2 - 22 * z];
  const og4 = [
    T('h1', 90, 24, 'n = 1: un punto', { size: 12, bold: true }),
    L('r1', [20, 70], [160, 70], { tono: 'spento' }), { id: 'p1', tipo: 'punto', x: 110, y: 70, t: 'x = 1.5', tono: 'ok', tx: -24, ty: 20 },
    T('h2', 250, 24, 'n = 2: una retta', { size: 12, bold: true, nascosto: true }),
    L('b2x', [190, 170], [310, 170], { tono: 'spento', nascosto: true }), L('b2y', [200, 180], [200, 50], { tono: 'spento', nascosto: true }),
    L('r2', [195, 160], [300, 60], { tono: 'ok', nascosto: true }),
    T('h3', 450, 24, 'n = 3: un piano', { size: 12, bold: true, nascosto: true }),
    { id: 'pav3', tipo: 'poli', punti: [Q(0, 0, 0), Q(4, 0, 0), Q(4, 4, 0), Q(0, 4, 0)], tono: 'spento', vuoto: true, nascosto: true },
    { id: 'pl3', tipo: 'poli', punti: [Q(0, 0, 2), Q(4, 0, 0.5), Q(4, 4, 1.7), Q(0, 4, 3.2)], tono: 'ok', nascosto: true },
    T('e', 310, 222, 'w · x = b', { bold: true, size: 15 }),
    T('d', 310, 250, '', { size: 13 })
  ];
  SCENE.iperpiano = {
    w: 620, h: 262, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: og4,
    passi: [
      { nota: "L'equazione <b>w · x = b</b> ha la stessa forma in ogni dimensione. Con n = 1 ingresso: w₁x₁ = b, per esempio 2x = 3, è soddisfatta da un solo punto, x = 1.5.", set: { d: { t: 'n = 1 → un punto (dimensione 0)' } } },
      { nota: "Con n = 2: w₁x₁ + w₂x₂ = b è una <b>retta</b> nel piano.", set: { h2: { nascosto: false }, b2x: { nascosto: false }, b2y: { nascosto: false }, r2: { nascosto: false }, d: { t: 'n = 2 → una retta (dimensione 1)' } } },
      { nota: "Con n = 3: un <b>piano</b> nello spazio.", set: { h3: { nascosto: false }, pav3: { nascosto: false }, pl3: { nascosto: false }, d: { t: 'n = 3 → un piano (dimensione 2)' } } },
      { nota: "Con n qualsiasi si chiama <b>iperpiano</b> (<i>hyperplane</i>): ha sempre <b>una dimensione in meno</b> dello spazio. Con le 50 feature di una posa, un iperpiano di dimensione 49. Non si disegna, ma è ancora \"un prodotto interno uguale a un valore\".", set: { d: { t: 'n qualsiasi → iperpiano (dimensione n − 1)', tono: 'ok' } } }
    ]
  };

  // 5. i due lati
  const pts = [[1, 3.5, 'no'], [-1, 2.5, 'no'], [2, 2, 'ok'], [0.5, 0.2, 'ok'], [1.5, -0.5, 'ok'], [1, 3, 'ora']];
  const og5 = [
    { id: 'ax', tipo: 'assi', box: [50, 20, 280, 230], dom: [-2, 3, -1, 4], tacche: 1, etX: 'x₁', etY: 'x₂' },
    { id: 'li', tipo: 'linea', in: 'ax', x1: -2, y1: -3, x2: 1.5, y2: 4, tono: 'spento' }
  ];
  pts.forEach(([a, b, t], i) => og5.push({ id: 'q' + i, tipo: 'punto', in: 'ax', x: a, y: b, t: '', nascosto: true }));
  og5.push(T('c1', 470, 60, ''), T('c2', 470, 92, ''), T('c3', 470, 124, ''), T('c4', 470, 180, '', { bold: true, size: 13 }));
  const vedi = (i, tono) => ({ ['q' + i]: { nascosto: false, tono } });
  SCENE.lati = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: og5,
    passi: [
      { nota: "La retta −2x₁ + x₂ = 1 divide il piano in <b>due metà</b>. Per sapere da che parte sta un punto basta il segno di <b>w · x − b</b>." },
      { nota: "(1, 3.5): −2 + 3.5 − 1 = 0.5 > 0. Sta dalla parte verso cui punta w.", set: Object.assign(vedi(0, 'no'), { c1: { t: '(1, 3.5): +0.5 > 0', tono: 'no' } }) },
      { nota: "(2, 2): −4 + 2 − 1 = −3 < 0. Sta dall'altra parte.", set: Object.assign(vedi(2, 'ok'), { c2: { t: '(2, 2): −3 < 0', tono: 'ok' } }) },
      { nota: "(1, 3): −2 + 3 − 1 = 0. Sta <b>sulla</b> retta.", set: Object.assign(vedi(5, 'ora'), { c3: { t: '(1, 3): 0 → sulla retta', tono: 'ora' } }) },
      { nota: "Tutti i punti colorati con il segno. Un <b>classificatore lineare</b> (settimana 10) fa esattamente questo: impara w e b, poi decide la classe di un punto dal segno di w · x − b. L'iperpiano diventa il <b>confine di decisione</b>.", set: Object.assign(vedi(1, 'no'), vedi(3, 'ok'), vedi(4, 'ok'), { c4: { t: 'il segno decide la classe' } }) }
    ]
  };

  // 6. lineare contro affine
  SCENE.linaff = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 280, 230], dom: [-1, 4, -2, 9], tacche: 1, etX: 'x', etY: 'y' },
      { id: 'f', tipo: 'linea', in: 'ax', x1: -1, y1: -2, x2: 4, y2: 8, tono: 'due' },
      { id: 'g', tipo: 'linea', in: 'ax', x1: -1, y1: -1, x2: 3.5, y2: 8, tono: 'ok', nascosto: true },
      { id: 'o', tipo: 'punto', in: 'ax', x: 0, y: 0, t: '(0, 0)', tono: 'due', ty: 14 },
      { id: 'o2', tipo: 'punto', in: 'ax', x: 0, y: 1, t: '(0, 1)', tono: 'ok', nascosto: true, tx: 10, ty: 14 },
      T('c1', 470, 60, 'f(x) = 2x', { bold: true, tono: 'due' }), T('c2', 470, 90, 'f(1) + f(2) = 6 = f(3)', { size: 13, nascosto: true }),
      T('c3', 470, 140, 'g(x) = 2x + 1', { bold: true, tono: 'ok', nascosto: true }), T('c4', 470, 170, '', { size: 13 })
    ],
    passi: [
      { nota: "Una funzione <b>lineare</b> in senso stretto è della forma f(x) = w · x, senza termine costante. Passa sempre per l'<b>origine</b>: f(0) = 0." },
      { nota: "E rispetta la somma: f(1) + f(2) = 2 + 4 = 6 = f(3). In generale f(a + b) = f(a) + f(b) e f(c·a) = c·f(a). Sono le due proprietà che definiscono la linearità (settimana 4).", set: { c2: { nascosto: false } } },
      { nota: "Aggiungendo un termine costante si ottiene una funzione <b>affine</b>: g(x) = 2x + 1. È la stessa retta spostata in su di 1: non passa più per l'origine.", set: { g: { nascosto: false }, o2: { nascosto: false }, c3: { nascosto: false } } },
      { nota: "g non rispetta la somma: g(1) + g(2) = 3 + 5 = 8, ma g(3) = 7. Per questo le slide chiamano la retta di regressione <i>affine mapping</i>. Nel linguaggio di tutti i giorni si dice comunque \"modello lineare\": in ML \"lineare\" di solito vuol dire <b>lineare nei parametri</b>.", set: { c4: { t: 'g(1) + g(2) = 8 ≠ g(3) = 7', tono: 'no' } } }
    ]
  };

  // 7. più uscite
  const n = (id, x, y, t, tono) => ({ id, tipo: 'nodo', x, y, t, tono, r: 24 });
  SCENE.piuuscite = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [
      n('px', 90, 80, '10', 'dato'), n('py', 90, 180, '20', 'dato'),
      T('lx', 40, 80, 'pₓ', { size: 13 }), T('ly', 40, 180, 'p_y', { size: 13 }),
      n('sx', 330, 80, 'x'), n('sy', 330, 180, 'y'),
      { id: 'a1', tipo: 'arco', da: 'px', a: 'sx', dir: true, t: '2' }, { id: 'a2', tipo: 'arco', da: 'py', a: 'sx', dir: true, t: '0.5', curva: 30, nascosto: true },
      { id: 'a3', tipo: 'arco', da: 'px', a: 'sy', dir: true, t: '−0.3', curva: -30, nascosto: true }, { id: 'a4', tipo: 'arco', da: 'py', a: 'sy', dir: true, t: '1.5', nascosto: true },
      T('b1', 330, 40, '+100', { size: 12, nascosto: true }), T('b2', 330, 224, '+50', { size: 12, nascosto: true }),
      T('c1', 480, 80, '', { size: 13 }), T('c2', 480, 180, '', { size: 13 }), T('c3', 480, 240, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "Nell'Assignment 1 la posizione della pupilla (pₓ, p_y) deve diventare il punto guardato sullo schermo (x, y): <b>due uscite</b>. È una funzione a valori vettoriali (slide 57: \"vector valued functions\")." },
      { nota: "Ogni uscita ha il <b>suo</b> iperpiano. La prima: x = 2·pₓ + 0.5·p_y + 100.", set: { a2: { nascosto: false }, b1: { nascosto: false }, sx: { tono: 'ok' }, c1: { t: 'x = 2·10 + 0.5·20 + 100 = 130', tono: 'ok' } } },
      { nota: "La seconda, con pesi diversi: y = −0.3·pₓ + 1.5·p_y + 50 = −3 + 30 + 50 = 77.", set: { a3: { nascosto: false }, a4: { nascosto: false }, b2: { nascosto: false }, sy: { tono: 'ok' }, c2: { t: 'y = −3 + 30 + 50 = 77', tono: 'ok' } } },
      { nota: "Due prodotti interni con due vettori di pesi: messi uno sopra l'altro formano una <b>matrice</b> di pesi W, e il modello si scrive y = Wp + b. È il ponte verso il prodotto matrice-vettore (<a href=\"w03-matrici.html\">settimana 3</a>). I pesi qui sono inventati per l'esempio.", set: { sx: { t: '130' }, sy: { t: '77' }, c3: { t: 'y = W p + b' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s009|}}</h1>
  <p class="lede">{{s|s010|}}</p>
</header>

<section>
  <h2>{{s|s011|}}</h2>
  <p>{{s|s012|}}</p>
  <p>{{s|s013|}}</p>
  <p>{{s|s014|}}</p>
  <figure class="scena" data-scena="rettavera" data-titolo="{{a|s015|}}"></figure>
</section>

<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
  <div class="mblock"><span class="m">w · x = b</span></div>
  <p>{{s|s018|}}</p>
  <p>{{s|s019|}}</p>
  <figure class="scena" data-scena="normale" data-titolo="{{a|s020|}}"></figure>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
  <p>{{s|s023|}}</p>
  <p>{{s|s024|}}</p>
  <figure class="scena" data-scena="piano" data-titolo="{{a|s025|}}"></figure>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <p>{{s|s027|}}</p>
  <p>{{s|s028|}}</p>
  <p>{{s|s029|}}</p>
  <figure class="scena" data-scena="iperpiano" data-titolo="{{a|s030|}}"></figure>
</section>

<section>
  <h2>{{s|s031|}}</h2>
  <p>{{s|s032|}}</p>
  <p>{{s|s033|}}</p>
  <figure class="scena" data-scena="lati" data-titolo="{{a|s034|}}"></figure>
</section>

<section>
  <h2>{{s|s035|}}</h2>
  <p>{{s|s036|}}</p>
  <p>{{s|s037|}}</p>
  <p>{{s|s038|}}</p>
  <figure class="scena" data-scena="linaff" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <p>{{s|s041|}}</p>
  <p>{{s|s042|}}</p>
  <figure class="scena" data-scena="piuuscite" data-titolo="{{a|s043|}}"></figure>
</section>

</main>
</body>
</html>
