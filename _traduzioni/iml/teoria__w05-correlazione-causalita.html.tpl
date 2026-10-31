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

  // 1. covarianza
  const X = [2, 4, 5, 7, 9], Y = [3, 5, 4, 8, 10], PR = ['10.2', '1.4', '0.8', '3.2', '14.4'];
  const og1 = [{ id: 'ax', tipo: 'assi', box: [40, 20, 300, 230], dom: [0, 11, 0, 12], tacche: 2, etX: 'x', etY: 'y' }];
  og1.push({ id: 'mx', tipo: 'linea', in: 'ax', x1: 5.4, y1: 0, x2: 5.4, y2: 12, tratt: true, tono: 'due', nascosto: true });
  og1.push({ id: 'my', tipo: 'linea', in: 'ax', x1: 0, y1: 6, x2: 11, y2: 6, tratt: true, tono: 'due', nascosto: true });
  X.forEach((x, i) => og1.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x, y: Y[i], t: '', tono: 'dato' }));
  og1.push(T('c1', 470, 50, '', { size: 13 }), T('c2', 470, 80, '', { size: 13 }), T('c3', 470, 120, '', { size: 13 }), T('c4', 470, 160, '', { bold: true }), T('c5', 470, 200, '', { size: 12 }));
  const etich = Object.fromEntries(X.map((_, i) => ['p' + i, { t: PR[i], tono: 'ok' }]));
  SCENE.cov5 = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: og1,
    passi: [
      { nota: "Cinque coppie (x, y), per esempio ore di studio e voto. Le due variabili sembrano crescere insieme. La <b>covarianza</b> misura proprio questo." },
      { nota: "Si calcolano le medie: x̄ = 5.4 e ȳ = 6 (le linee tratteggiate). Dividono il piano in quattro quadranti.", set: { mx: { nascosto: false }, my: { nascosto: false }, c1: { t: 'x̄ = 5.4,  ȳ = 6' } } },
      { nota: "Per ogni punto si moltiplicano gli scarti dalle medie: (xᵢ − x̄)(yᵢ − ȳ). Un punto in alto a destra o in basso a sinistra dà un prodotto <b>positivo</b>; negli altri due quadranti negativo. Qui sono tutti positivi.", set: Object.assign({ c2: { t: 'prodotti 10.2 1.4 0.8 3.2 14.4', size: 12 } }, etich) },
      { nota: "Si sommano e si divide per n − 1: 30 / 4 = <b>7.5</b>. Positiva: quando x è sopra la sua media, di solito anche y lo è. Negativa: quando uno sale l'altro scende. Vicina a 0: nessuna tendenza lineare.", set: { c3: { t: 'somma = 30' }, c4: { t: 'Cov(x, y) = 30 / 4 = 7.5', tono: 'ok' } } },
      { nota: "Il limite: 7.5 dipende dalle <b>unità di misura</b>. Con il voto in centesimi invece che in decimi la covarianza diventerebbe dieci volte più grande, senza che la relazione cambi. Per questo serve la correlazione (<code>np.cov(x, y)[0, 1]</code> = 7.5, controllato).", set: { c5: { t: 'dipende dalle unità di misura' } } }
    ]
  };

  // 2. correlazione
  const S = {
    a: [[-0.07, -0.3], [0.95, -0.14], [-2.01, -1.5], [0.14, 0.49], [-0.15, -0.4], [-0.88, -1.02], [0.5, 0.14], [-0.42, -0.47], [-0.4, -0.67], [0.08, -0.32], [-0.86, -0.78], [-0.41, -0.23], [0.81, 1.16], [-1.64, -2.37], [2.02, 1.35], [-0.85, -0.79], [-1.21, -0.89], [-0.27, -0.14], [-0.03, 0.36], [1.2, 1.01], [-0.64, 0.17], [0.99, 0.5], [0.33, 0.77], [-0.07, 0.53], [1.57, 2.08]],
    b: [[1.03, -1.42], [0.15, 1.22], [0.09, 1.0], [2.37, 0.27], [-0.28, -0.77], [0.65, -0.2], [-0.18, -0.11], [0.65, -1.07], [-1.53, -2.43], [1.2, 0.07], [1.51, -0.01], [-0.74, 0.48], [-0.08, -1.25], [-0.89, 1.77], [0.35, 0.42], [-0.28, -0.69], [0.89, -0.1], [-0.76, -0.13], [-0.91, 0.19], [1.13, -0.84], [1.43, -0.67], [0.15, -0.84], [-0.22, 0.05], [-0.43, -0.7], [-0.68, -0.82]],
    c: [[1.47, -1.59], [-0.19, 0.59], [-0.08, 1.18], [-0.41, 0.21], [-2.06, 1.59], [-1.16, 0.73], [-0.79, -0.1], [-0.91, 0.84], [1.32, -0.57], [-0.74, 0.76], [0.72, -0.74], [0.32, 0.0], [-0.93, 0.63], [0.42, -0.65], [1.18, -1.45], [0.24, 0.06], [-1.47, 1.11], [-0.64, 0.44], [-2.03, 2.01], [-0.7, 0.28], [0.84, -0.75], [0.45, -0.3], [1.67, -1.37], [1.26, -0.49], [0.53, -0.04]]
  };
  const og2 = [{ id: 'ax', tipo: 'assi', box: [40, 20, 260, 230], dom: [-2.6, 2.6, -2.6, 2.6], tacche: 1, numeri: false, etX: 'x', etY: 'y' }];
  S.a.forEach((p, i) => og2.push({ id: 'q' + i, tipo: 'punto', in: 'ax', x: p[0], y: p[1], t: '', r: 4, tono: 'dato' }));
  og2.push(T('f', 460, 50, 'r = Cov(x, y) / (sₓ · s_y)', { size: 13, bold: true }), T('c1', 460, 100, '', { bold: true, size: 16 }), T('c2', 460, 140, '', { size: 13 }), T('c3', 460, 200, '', { size: 12 }));
  const mostra = (k, r, tono, testo) => Object.assign(Object.fromEntries(S[k].map((p, i) => ['q' + i, { x: p[0], y: p[1] }])), { c1: { t: 'r = ' + r, tono }, c2: { t: testo } });
  SCENE.corr3 = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: og2,
    passi: [
      { nota: "La <b>correlazione</b> (di Pearson) è la covarianza divisa per le due deviazioni standard: <b>r = Cov(x, y) / (sₓ s_y)</b>. Le unità si cancellano, e r sta sempre fra −1 e 1. Per i cinque punti di sopra: 7.5 / (2.70 · 2.92) = 0.952." },
      { nota: "25 punti con r = 0.88: una nuvola allungata che sale. <b>Forte correlazione positiva</b>.", set: mostra('a', '0.88', 'ok', 'forte, positiva') },
      { nota: "r = 0.05: una nuvola tonda, nessuna tendenza lineare.", set: mostra('b', '0.05', null, 'praticamente nessuna') },
      { nota: "r = −0.91: la nuvola scende. <b>Forte correlazione negativa</b>: quando x sale, y scende.", set: mostra('c', '−0.91', 'no', 'forte, negativa') },
      { nota: "r = 1 o −1 solo se i punti stanno esattamente su una retta. Il valore di r dice quanto la nuvola è <b>stretta attorno a una retta</b>, non quanto la retta è ripida (dati simulati con NumPy, r calcolata con <code>np.corrcoef</code>).", set: { c3: { t: 'r misura la strettezza, non la pendenza' } } }
    ]
  };

  // 3. solo relazioni lineari
  const tp = [-2, -1.5, -1, -0.5, 0, 0.5, 1, 1.5, 2];
  const og3 = [{ id: 'ax', tipo: 'assi', box: [40, 20, 280, 230], dom: [-2.5, 2.5, -0.5, 4.5], tacche: 1, etX: 'x', etY: 'y' }];
  tp.forEach((t, i) => og3.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x: t, y: t * t, t: '', tono: 'dato' }));
  const par = []; for (let t = -2.1; t <= 2.11; t += 0.1) par.push([t, t * t]);
  og3.push({ id: 'cu', tipo: 'poli', in: 'ax', punti: par.concat(par.slice().reverse()), tono: 'ok', nascosto: true });
  og3.push(T('c1', 460, 70, '', { bold: true, size: 16 }), T('c2', 460, 110, '', { size: 13 }), T('c3', 460, 160, '', { size: 13 }));
  SCENE.nonlineare = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: og3,
    passi: [
      { nota: "Nove punti con y = x², da x = −2 a x = 2. y dipende <b>completamente</b> da x: conoscendo x si sa y." },
      { nota: "Eppure r = <b>0</b> (calcolato con NumPy). A sinistra y scende quando x sale, a destra sale: i due effetti si annullano.", set: { c1: { t: 'r = 0', tono: 'no' } } },
      { nota: "La relazione c'è, ma non è lineare. <b>La correlazione misura solo relazioni lineari</b>: r = 0 vuol dire \"nessuna retta\", non \"nessuna relazione\". Per questo prima di calcolare r si guarda sempre il grafico.", set: { cu: { nascosto: false }, c2: { t: 'relazione perfetta, ma curva' }, c3: { t: 'r = 0 ≠ indipendenti', tono: 'no' } } }
    ]
  };

  // 4. confondente
  const nd = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 34 }, extra || {});
  SCENE.confondente = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [
      nd('g', 110, 190, 'gelati', 'dato'), nd('a', 390, 190, 'annegam.', 'dato'),
      { id: 'ga', tipo: 'arco', da: 'g', a: 'a', t: 'r alta', tono: 'no', nascosto: true },
      { id: 'ga2', tipo: 'arco', da: 'g', a: 'a', dir: true, t: 'causa?', curva: -50, tono: 'no', nascosto: true },
      nd('t', 250, 60, 'caldo', 'due', { nascosto: true }),
      { id: 'tg', tipo: 'arco', da: 't', a: 'g', dir: true, t: '', tono: 'due', nascosto: true },
      { id: 'ta', tipo: 'arco', da: 't', a: 'a', dir: true, t: '', tono: 'due', nascosto: true },
      T('c', 520, 120, '', { size: 13 }), T('c2', 520, 150, '', { size: 13 })
    ],
    passi: [
      { nota: "Dati di una città, mese per mese: vendite di gelati e annegamenti. Le due serie sono fortemente <b>correlate</b>." },
      { nota: "La tentazione: \"i gelati causano annegamenti\" (o viceversa). La correlazione da sola non dice niente sulla <b>direzione</b> né sull'esistenza di un legame causale.", set: { ga: { nascosto: false }, ga2: { nascosto: false } } },
      { nota: "La spiegazione vera è una terza variabile: il <b>caldo</b>. D'estate si comprano più gelati e si va di più a nuotare. Una variabile che causa entrambe si chiama <b>confondente</b> (<i>confounder</i>).", set: { ga2: { nascosto: true }, t: { nascosto: false }, tg: { nascosto: false }, ta: { nascosto: false }, c: { t: 'caldo → gelati' }, c2: { t: 'caldo → annegamenti' } } },
      { nota: "\"Correlation does not imply causation\". Per stabilire una causa servono esperimenti controllati o analisi che tengano conto dei confondenti. In ML questo conta: un modello che usa una feature correlata ma non causale può smettere di funzionare quando la situazione cambia." }
    ]
  };

  // 5. altre spiegazioni
  const box = (id, x, y, t, tono) => ({ id, tipo: 'nodo', x, y, t, tono, r: 22 });
  const ar = (id, a, b, extra) => Object.assign({ id, tipo: 'arco', da: a, a: b, dir: true, t: '', nascosto: true }, extra || {});
  SCENE.spiegazioni = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: [
      T('h1', 110, 20, '1. A causa B', { size: 12, bold: true }), box('a1', 60, 60, 'A', 'dato'), box('b1', 160, 60, 'B', 'dato'), ar('x1', 'a1', 'b1', { tono: 'ok' }),
      T('h2', 330, 20, '2. B causa A', { size: 12, bold: true, nascosto: true }), box('a2', 280, 60, 'A', 'dato'), box('b2', 380, 60, 'B', 'dato'), ar('x2', 'b2', 'a2', { tono: 'ok' }),
      T('h3', 110, 130, '3. C causa entrambe', { size: 12, bold: true, nascosto: true }), box('a3', 60, 220, 'A', 'dato'), box('b3', 160, 220, 'B', 'dato'), box('c3', 110, 160, 'C', 'due'), ar('x3', 'c3', 'a3', { tono: 'due' }), ar('y3', 'c3', 'b3', { tono: 'due' }),
      T('h4', 330, 130, '4. caso', { size: 12, bold: true, nascosto: true }), box('a4', 280, 200, 'A', 'dato'), box('b4', 380, 200, 'B', 'dato'),
      T('n4', 330, 246, '', { size: 12 }), T('c', 505, 110, '', { size: 12 })
    ],
    passi: [
      { nota: "Quando due variabili A e B sono correlate ci sono almeno quattro spiegazioni. La prima: <b>A causa B</b> (fumare causa malattie ai polmoni).", set: { x1: { nascosto: false } } },
      { nota: "<b>Causa inversa</b>: è B che causa A. Esempio: nelle città con più pompieri ci sono più incendi, ma sono gli incendi grandi a richiedere più pompieri, non il contrario.", set: { h2: { nascosto: false }, x2: { nascosto: false } } },
      { nota: "<b>Confondente</b>: una terza variabile C causa sia A sia B (il caldo per gelati e annegamenti).", set: { h3: { nascosto: false }, x3: { nascosto: false }, y3: { nascosto: false } } },
      { nota: "<b>Caso</b> (correlazione spuria): con tante variabili e pochi dati, qualche coppia risulta correlata per pura coincidenza. Più variabili si confrontano, più correlazioni casuali si trovano. Solo la prima spiegazione è causale: le altre tre producono la stessa correlazione.", set: { h4: { nascosto: false }, n4: { t: 'nessuna freccia: coincidenza' }, c: { t: 'stessa r, quattro storie' } } }
    ]
  };

  // 6. effect size
  const A = [72, 75, 78, 80, 85], B = [70, 72, 74, 77, 77];
  const og6 = [{ id: 'ax', tipo: 'assi', box: [40, 40, 330, 150], dom: [66, 88, 0, 3], tacche: 2, etX: 'voto', etY: '' }];
  A.forEach((v, i) => og6.push({ id: 'a' + i, tipo: 'punto', in: 'ax', x: v, y: 2, t: '', tono: 'ok' }));
  B.forEach((v, i) => og6.push({ id: 'b' + i, tipo: 'punto', in: 'ax', x: v, y: B.slice(0, i).includes(v) ? 1.4 : 1, t: '', tono: 'dato' }));
  og6.push({ id: 'ma', tipo: 'linea', in: 'ax', x1: 78, y1: 1.7, x2: 78, y2: 2.3, tono: 'ok', nascosto: true });
  og6.push({ id: 'mb', tipo: 'linea', in: 'ax', x1: 74, y1: 0.7, x2: 74, y2: 1.3, tono: 'dato', nascosto: true });
  og6.push({ id: 'df', tipo: 'linea', in: 'ax', x1: 74, y1: 2.7, x2: 78, y2: 2.7, tono: 'ora', nascosto: true });
  og6.push(T('ta', 40, 20, 'metodo nuovo', { size: 12, bold: true, anchor: 'start', tono: 'ok' }), T('tb', 40, 230, 'metodo vecchio', { size: 12, bold: true, anchor: 'start', tono: 'dato' }));
  og6.push(T('c1', 490, 50, '', { size: 13 }), T('c2', 490, 80, '', { size: 13 }), T('c3', 490, 120, '', { size: 13 }), T('c4', 490, 160, '', { bold: true, size: 15 }), T('c5', 480, 234, '', { size: 12 }));
  SCENE.effetto = {
    w: 620, h: 250, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: og6,
    passi: [
      { nota: "Due gruppi di 5 studenti, due metodi di studio. Voti del gruppo nuovo: 72, 75, 78, 80, 85; del vecchio: 70, 72, 74, 77, 77. Il metodo nuovo funziona? E <b>quanto</b>?" },
      { nota: "Le medie: 78 contro 74. Differenza 4 punti.", set: { ma: { nascosto: false }, mb: { nascosto: false }, df: { nascosto: false }, c1: { t: 'medie: 78 e 74' }, c2: { t: 'differenza: 4' } } },
      { nota: "4 punti sono tanti o pochi? Dipende da quanto variano i voti <b>dentro</b> ogni gruppo. Deviazioni standard 4.95 e 3.08; la deviazione standard \"combinata\" (<i>pooled</i>) è 4.12.", set: { c3: { t: 's combinata = 4.12' } } },
      { nota: "L'<b>effect size</b> (dimensione dell'effetto) di Cohen: <b>d = (x̄₁ − x̄₂) / s</b> = 4 / 4.12 ≈ <b>0.97</b>. La differenza misurata in \"deviazioni standard\": non dipende dalle unità.", set: { c4: { t: 'd = 4 / 4.12 ≈ 0.97', tono: 'ok' } } },
      { nota: "Lettura convenzionale di Cohen: 0.2 piccolo, 0.5 medio, 0.8 grande. Qui l'effetto è grande, ma con 5 studenti per gruppo è poco affidabile: l'effect size dice <b>quanto</b> è grande una differenza, non <b>quanto siamo sicuri</b> che esista (numeri calcolati con NumPy).", set: { c5: { t: '0.2 piccolo · 0.5 medio · 0.8 grande' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s008|}}</h1>
  <p class="lede">{{s|s009|}}</p>
</header>

<section>
  <h2>{{s|s010|}}</h2>
  <p>{{s|s011|}}</p>
  <div class="mblock"><span class="m">Cov(x, y) = Σᵢ (xᵢ − x̄)(yᵢ − ȳ) / (n − 1)</span></div>
  <p>{{s|s012|}}</p>
  <p>{{s|s013|}}</p>
  <figure class="scena" data-scena="cov5" data-titolo="{{a|s014|}}"></figure>
</section>

<section>
  <h2>{{s|s015|}}</h2>
  <p>{{s|s016|}}</p>
  <div class="mblock"><span class="m">r = Cov(x, y) / (sₓ · s_y)</span></div>
  <p>{{s|s017|}}</p>
  <p>{{s|s018|}}</p>
  <figure class="scena" data-scena="corr3" data-titolo="{{a|s019|}}"></figure>
</section>

<section>
  <h2>{{s|s020|}}</h2>
  <p>{{s|s021|}}</p>
  <p>{{s|s022|}}</p>
  <figure class="scena" data-scena="nonlineare" data-titolo="{{a|s023|}}"></figure>
</section>

<section>
  <h2>{{s|s024|}}</h2>
  <p>{{s|s025|}}</p>
  <p>{{s|s026|}}</p>
  <p>{{s|s027|}}</p>
  <figure class="scena" data-scena="confondente" data-titolo="{{a|s028|}}"></figure>
</section>

<section>
  <h2>{{s|s029|}}</h2>
  <p>{{s|s030|}}</p>
  <p>{{s|s031|}}</p>
  <p>{{s|s032|}}</p>
  <figure class="scena" data-scena="spiegazioni" data-titolo="{{a|s033|}}"></figure>
</section>

<section>
  <h2>{{s|s034|}}</h2>
  <p>{{s|s035|}}</p>
  <p>{{s|s036|}}</p>
  <div class="mblock"><span class="m">d = (x̄₁ − x̄₂) / s</span></div>
  <p>{{s|s037|}}</p>
  <p>{{s|s038|}}</p>
  <figure class="scena" data-scena="effetto" data-titolo="{{a|s039|}}"></figure>
</section>

</main>
</body>
</html>
