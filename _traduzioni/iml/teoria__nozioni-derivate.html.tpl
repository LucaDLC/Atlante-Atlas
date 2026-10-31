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
SCENE.catena = {
  w: 540, h: 230, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'x', tipo: 'nodo', r: 24, x: 70, y: 110, t: 'x', tono: 'dato' },
    { id: 'u', tipo: 'nodo', forma: 'quadrato', r: 30, x: 270, y: 110, t: '3x + 1' },
    { id: 'y', tipo: 'nodo', forma: 'quadrato', r: 30, x: 470, y: 110, t: 'u⁴' },
    { id: 'e1', tipo: 'arco', da: 'x', a: 'u', dir: true },
    { id: 'e2', tipo: 'arco', da: 'u', a: 'y', dir: true },
    { id: 'n', tipo: 'testo', x: 270, y: 212, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { x: { sotto: 'x = 1' }, u: { tono: 'ok', sotto: 'u = 4' } } },
    { nota: '{{j|s005|'}}', set: { y: { tono: 'ok', sotto: 'y = 256' } } },
    { nota: '{{j|s006|'}}', set: { y: { tono: 'ora', sopra: 'dy/du = 4u³ = 256' }, e2: { tono: 'ora' } } },
    { nota: '{{j|s007|'}}', set: { u: { tono: 'ora', sopra: 'du/dx = 3' }, e1: { tono: 'ora' } } },
    { nota: '{{j|s008|'}}', set: { x: { tono: 'ora', sopra: 'dy/dx = 768' }, n: { t: 'dy/dx = dy/du · du/dx = 256 · 3 = 768', tono: 'ora' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 14 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const pl = p => p.concat(p.slice().reverse());

  // 0. definizione: il rapporto incrementale
  const par = []; for (let x = -0.2; x <= 2.3; x += 0.05) par.push([x, x * x]);
  const sec = h => ({ se: { x1: 0, y1: 1 - (2 + h), x2: 2.3, y2: 1 + (2 + h) * 1.3, nascosto: false }, q: { x: 1 + h, y: (1 + h) * (1 + h), nascosto: false, t: 'x = ' + (1 + h) }, c1: { t: 'h = ' + h }, c2: { t: '(f(1 + h) − f(1)) / h = ' + (2 + h) } });
  SCENE.rapporto = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 280, 230], dom: [-0.2, 2.3, -0.5, 5], tacche: 1, etX: 'x', etY: 'y' },
      { id: 'cu', tipo: 'poli', in: 'ax', punti: pl(par), tono: 'dato' },
      { id: 'p', tipo: 'punto', in: 'ax', x: 1, y: 1, t: '(1, 1)', tono: 'dato', tx: -44 },
      { id: 'se', tipo: 'linea', in: 'ax', x1: 0, y1: -2, x2: 2.3, y2: 4.9, tono: 'ora', nascosto: true },
      { id: 'q', tipo: 'punto', in: 'ax', x: 2, y: 4, t: '', tono: 'ora', nascosto: true },
      T('c0', 460, 40, 'f(x) = x², in x = 1', { bold: true, size: 13 }), T('c1', 460, 80, '', { size: 13 }), T('c2', 460, 110, '', { size: 13 }), T('c3', 460, 170, '', { bold: true })
    ],
    passi: [
      { nota: "La <b>derivata</b> di f in un punto è la <b>pendenza</b> della curva in quel punto. Per calcolarla si parte da una retta che taglia la curva in due punti: la <b>secante</b>." },
      { nota: "Due punti: x = 1 e x = 1 + h, con h = 1. Pendenza della secante = (f(2) − f(1)) / 1 = (4 − 1)/1 = 3. Questo è il <b>rapporto incrementale</b>.", set: sec(1) },
      { nota: "h = 0.5: la pendenza è 2.5. Il secondo punto si avvicina.", set: sec(0.5) },
      { nota: "h = 0.1: 2.1. h = 0.01 darebbe 2.01.", set: sec(0.1) },
      { nota: "Quando h tende a 0 le secanti diventano la <b>tangente</b>, e la pendenza tende a <b>2</b>: f′(1) = 2. Definizione: f′(x) = lim<sub>h→0</sub> (f(x + h) − f(x)) / h. Con la regola della potenza: (x²)′ = 2x, e 2·1 = 2 ✓ (valori calcolati).", set: { se: { x1: 0, y1: -1, x2: 2.3, y2: 3.6, tono: 'ok' }, q: { nascosto: true }, c3: { t: 'f′(1) = 2', tono: 'ok' } } }
    ]
  };

  // 1. regola della potenza e della somma
  SCENE.potenza = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      T('a', 300, 50, 'x⁵', { size: 26, bold: true }),
      T('b', 300, 110, '', { size: 22, bold: true }),
      T('c', 300, 160, '', { size: 14 }), T('d', 300, 200, '', { size: 14 })
    ],
    passi: [
      { nota: "La regola più usata: <b>(xⁿ)′ = n·xⁿ⁻¹</b>. Si parte da x⁵." },
      { nota: "L'esponente <b>scende davanti</b> come moltiplicatore: 5·x…", set: { b: { t: '5 · x', tono: 'ora' } } },
      { nota: "…e l'esponente che resta <b>cala di uno</b>: 5 − 1 = 4. (x⁵)′ = 5x⁴.", set: { b: { t: '5 · x⁴', tono: 'ok' } } },
      { nota: "Vale anche con esponenti negativi e frazionari: 1/x = x⁻¹ → −1·x⁻² = −1/x²; √x = x^(1/2) → (1/2)·x^(−1/2) = 1/(2√x).", set: { c: { t: '(x⁻¹)′ = −x⁻²      (x^½)′ = ½ x^(−½)' } } },
      { nota: "Somma e costanti: si deriva termine per termine, e un numero che moltiplica resta fuori. (3x² − 2x + 1)′ = 3·2x − 2·1 + 0 = <b>6x − 2</b>. La costante sparisce: non cambia la pendenza.", set: { a: { t: '3x² − 2x + 1' }, b: { t: '6x − 2', tono: 'ok' }, d: { t: '3·2x − 2·1 + 0' } } }
    ]
  };

  // 2. prodotto
  SCENE.prodotto = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      R('u', 60, 30, 120, 40, 'u = x²', { tono: 'dato' }), R('v', 260, 30, 120, 40, 'v = sin x', { tono: 'due' }),
      R('du', 60, 100, 120, 40, "u′ = 2x", { tono: 'dato', nascosto: true }), R('dv', 260, 100, 120, 40, "v′ = cos x", { tono: 'due', nascosto: true }),
      T('c1', 300, 180, '', { bold: true, size: 15 }), T('c2', 300, 214, '', { size: 13 }),
      T('n', 500, 60, '', { size: 13 }), T('n2', 500, 100, '', { size: 13 })
    ],
    passi: [
      { nota: "f(x) = x² · sin x è un <b>prodotto</b> di due funzioni: u = x² e v = sin x." },
      { nota: "Si deriva ciascuna per conto suo: u′ = 2x, v′ = cos x.", set: { du: { nascosto: false }, dv: { nascosto: false } } },
      { nota: "La regola: <b>(u·v)′ = u′·v + u·v′</b>. \"Derivo il primo e lascio il secondo, più lascio il primo e derivo il secondo\".", set: { c1: { t: "f′ = 2x · sin x + x² · cos x", tono: 'ok' } } },
      { nota: "L'errore tipico è moltiplicare le due derivate, u′·v′ = 2x·cos x: è sbagliato. Controllo in x = π: 2π·0 + π²·(−1) = −π² ≈ −9.87 (verificato con sympy).", set: { c2: { t: 'in x = π:  −π² ≈ −9.87' }, n: { t: 'NO: u′ · v′', tono: 'no' }, n2: { t: 'SÌ: u′v + uv′', tono: 'ok' } } }
    ]
  };

  // 4. catena con più variabili
  const nd = (id, x, y, t, tono) => ({ id, tipo: 'nodo', x, y, t, tono, r: 24 });
  SCENE.piuvie = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      nd('t', 60, 125, 't'), nd('x', 230, 55, 'x', 'dato'), nd('y', 230, 195, 'y', 'due'), nd('z', 400, 125, 'z', 'ok'),
      { id: 'tx', tipo: 'arco', da: 't', a: 'x', dir: true, t: 'dx/dt = 2t', tono: 'dato' },
      { id: 'xz', tipo: 'arco', da: 'x', a: 'z', dir: true, t: '∂z/∂x = 1', tono: 'dato' },
      { id: 'ty', tipo: 'arco', da: 't', a: 'y', dir: true, t: 'dy/dt = cos t', tono: 'due' },
      { id: 'yz', tipo: 'arco', da: 'y', a: 'z', dir: true, t: '∂z/∂y = 2y', tono: 'due' },
      T('c1', 505, 60, '', { size: 12 }), T('c2', 505, 90, '', { size: 12 }), T('c3', 505, 140, '', { size: 11, bold: true })
    ],
    passi: [
      { nota: "z = x + y², con x = t² e y = sin t (esempio di DW, p. 25). t arriva a z per <b>due strade</b>: attraverso x e attraverso y." },
      { nota: "Su ogni strada si moltiplicano le derivate lungo gli archi: strada di x, ∂z/∂x · dx/dt = 1 · 2t.", set: { c1: { t: 'via x: 1 · 2t', tono: 'dato' } } },
      { nota: "Strada di y: ∂z/∂y · dy/dt = 2y · cos t.", set: { c2: { t: 'via y: 2y · cos t', tono: 'due' } } },
      { nota: "Le strade si <b>sommano</b>: dz/dt = 2t + 2 sin t cos t. In t = 1: 2 + 0.909 = 2.909. È esattamente quello che fa la backpropagation in una rete: moltiplica lungo ogni cammino e somma i cammini (valori calcolati).", set: { c3: { t: 'dz/dt = 2t + 2 sin t cos t', tono: 'ok' } } }
    ]
  };

  // 5. sigmoide e la sua derivata
  const sg = z => 1 / (1 + Math.exp(-z));
  const cs = [], cd = []; for (let z = -6; z <= 6.001; z += 0.2) { cs.push([z, sg(z)]); cd.push([z, sg(z) * (1 - sg(z))]); }
  SCENE.sigmad = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s013|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 300, 220], dom: [-6, 6, 0, 1.05], tacche: 2, etX: 'z', etY: '' },
      { id: 's', tipo: 'poli', in: 'ax', punti: pl(cs), tono: 'dato' },
      { id: 'd', tipo: 'poli', in: 'ax', punti: pl(cd), tono: 'ok', nascosto: true },
      { id: 'p', tipo: 'punto', in: 'ax', x: 0, y: 0.5, t: 'σ(0) = 0.5', tono: 'ora', nascosto: true },
      { id: 'p2', tipo: 'punto', in: 'ax', x: 0, y: 0.25, t: 'σ′(0) = 0.25', tono: 'ok', nascosto: true },
      T('c1', 470, 60, '', { size: 13 }), T('c2', 470, 100, '', { size: 13 }), T('c3', 470, 150, '', { size: 13 })
    ],
    passi: [
      { nota: "La sigmoide σ(z) = 1 / (1 + e⁻ᶻ) schiaccia qualunque numero fra 0 e 1. Serve per la regressione logistica (settimana 10) e nelle reti (settimana 14)." },
      { nota: "La sua derivata ha una forma comoda: <b>σ′(z) = σ(z)·(1 − σ(z))</b> (si ottiene con la catena, verificato con sympy). Si calcola dal valore stesso della sigmoide.", set: { d: { nascosto: false }, c1: { t: 'σ′ = σ(1 − σ)' } } },
      { nota: "In z = 0: σ = 0.5 e σ′ = 0.5·0.5 = <b>0.25</b>, il massimo. Lì la sigmoide è più ripida.", set: { p: { nascosto: false }, p2: { nascosto: false }, c2: { t: 'z = 0: σ′ = 0.25 (massimo)', tono: 'ok' } } },
      { nota: "Lontano da 0 la derivata crolla: in z = 4 vale 0.018. La sigmoide si <b>satura</b>, e un gradiente piccolissimo fa imparare lentamente (<i>vanishing gradient</i>). ReLU, max(0, z), ha derivata 1 per z &gt; 0 e non si satura.", set: { c3: { t: 'z = 4: σ′ ≈ 0.018 (satura)', tono: 'no' } } }
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
  <p>{{s|s017|}}</p>
  <p>{{s|s018|}}</p>
  <div class="mblock"><span class="m">f′(x) = lim<sub>h→0</sub> (f(x + h) − f(x)) / h</span></div>
  <p>{{s|s019|}}</p>
  <figure class="scena" data-scena="rapporto" data-titolo="{{a|s020|}}"></figure>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>f(x)</th><th>f′(x)</th><th>{{s|s022|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s023|}}</td><td>0</td><td>(5)′ = 0</td></tr>
      <tr><td>x</td><td>1</td><td></td></tr>
      <tr><td><b>xⁿ</b></td><td><b>n xⁿ⁻¹</b></td><td>(x⁵)′ = 5x⁴;  (1/x)′ = (x⁻¹)′ = −1/x²;  (√x)′ = (x<sup>1/2</sup>)′ = 1/(2√x)</td></tr>
      <tr><td>eˣ</td><td>eˣ</td><td></td></tr>
      <tr><td>{{s|s024|}}</td><td>1/x</td><td></td></tr>
      <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td><td></td></tr>
      <tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td></td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s029|}}">
    <p>{{s|s030|}}</p>
  </div>
  <figure class="scena" data-scena="potenza" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <figure class="passi" data-titolo="{{a|s033|}}">
    <div class="passo"><div class="espr">u = <mark class="dato">x²</mark>      v = <mark class="due">sin x</mark></div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">u′ = <mark class="dato">2x</mark>      v′ = <mark class="due">cos x</mark></div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">f′ = <mark class="dato">2x</mark> · sin x + x² · <mark class="due">cos x</mark></div><p class="nota">{{s|s036|}}</p></div>
    <div class="passo"><div class="espr">in x = π:  2π · 0 + π² · (−1) = <mark class="ok">−π²</mark></div><p class="nota">{{s|s037|}}</p></div>
  </figure>
  <div class="box regola" data-tit="{{a|s038|}}">
    <p>{{s|s039|}}</p>
  </div>
  <figure class="scena" data-scena="prodotto" data-titolo="{{a|s040|}}"></figure>
</section>

<section>
  <h2>{{s|s041|}}</h2>
  <p>{{s|s042|}}</p>
  <figure class="passi" data-titolo="{{a|s043|}}">
    <div class="passo"><div class="espr">dentro: u = <mark class="dato">3x + 1</mark>      fuori: y = <mark class="ora">u⁴</mark></div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">dy/du = <mark class="ora">4u³</mark></div><p class="nota">{{s|s045|}}</p></div>
    <div class="passo"><div class="espr">du/dx = <mark class="dato">3</mark></div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr">dy/dx = <mark class="ora">dy/du</mark> · <mark class="dato">du/dx</mark> = 4(3x + 1)³ · 3 = <mark class="ok">12(3x + 1)³</mark></div><p class="nota">{{s|s047|}}</p></div>
  </figure>
  <figure class="scena" data-scena="catena" data-titolo="{{a|s048|}}"></figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>f(x)</th><th>{{s|s049|}}</th><th>f′(x)</th></tr></thead>
    <tbody>
      <tr><td>e<sup>−x²</sup></td><td>−x²</td><td>e<sup>−x²</sup> · (−2x) = −2x e<sup>−x²</sup></td></tr>
      <tr><td>{{s|s050|}}</td><td>1 + x²</td><td>(1 / (1 + x²)) · 2x = 2x / (1 + x²)</td></tr>
      <tr><td>{{s|s051|}}</td><td>{{s|s052|}}</td><td>{{s|s053|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s054|}}</p>
</section>

<section>
  <h2>{{s|s055|}}</h2>
  <figure class="passi" data-titolo="{{a|s056|}}">
    <div class="passo"><div class="espr">t → <mark class="dato">x</mark> → z      t → <mark class="due">y</mark> → z</div><p class="nota">{{s|s057|}}</p></div>
    <div class="passo"><div class="espr">dz/dt = <mark class="dato">∂z/∂x · dx/dt</mark> + <mark class="due">∂z/∂y · dy/dt</mark></div><p class="nota">{{s|s058|}}</p></div>
    <div class="passo"><div class="espr">= <mark class="dato">1 · 2t</mark> + <mark class="due">2y · cos t</mark></div><p class="nota">{{s|s059|}}</p></div>
    <div class="passo"><div class="espr">= <mark class="ok">2t + 2 sin t cos t</mark></div><p class="nota">{{s|s060|}}</p></div>
  </figure>
  <figure class="scena" data-scena="piuvie" data-titolo="{{a|s061|}}"></figure>
</section>

<section>
  <h2>{{s|s062|}}</h2>
  <figure class="passi" data-titolo="{{a|s063|}}">
    <div class="passo"><div class="espr">σ′(z) = <mark class="ok">σ(z) · (1 − σ(z))</mark></div><p class="nota">{{s|s064|}}</p></div>
    <div class="passo"><div class="espr">in z = 0:  σ = 1/2,  σ′ = 1/2 · 1/2 = <mark class="ok">1/4</mark></div><p class="nota">{{s|s065|}}</p></div>
  </figure>
  <div class="box regola" data-tit="{{a|s066|}}">
    <p>{{s|s067|}}</p>
  </div>
  <div class="box basi" data-tit="{{a|s068|}}">
    <p>{{s|s069|}}</p>
  </div>
  <figure class="scena" data-scena="sigmad" data-titolo="{{a|s070|}}"></figure>
</section>

</main>
</body>
</html>
