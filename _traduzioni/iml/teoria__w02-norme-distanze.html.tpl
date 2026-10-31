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
  const pl = p => p.concat(p.slice().reverse());
  // 1. norma in 2D
  SCENE.norma = {
    w: 400, h: 300, lato: true,
    legenda: '{{j|s002|'}}',
    codice: { lang: 'python', testo: `import numpy as np
v = np.array([3, 4])
np.sqrt(np.sum(v**2))    # 5.0
np.linalg.norm(v)        # 5.0` },
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 300, 250], dom: [0, 6, 0, 5], tacche: 1, etX: 'x', etY: 'y' },
      { id: 'cx', tipo: 'linea', in: 'ax', x1: 0, y1: 0, x2: 3, y2: 0, tono: 'dato', nascosto: true },
      { id: 'cy', tipo: 'linea', in: 'ax', x1: 3, y1: 0, x2: 3, y2: 4, tono: 'due', nascosto: true },
      { id: 'v', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 3, y2: 4, t: 'v = [3, 4]' },
      { id: 't3', tipo: 'testo', in: 'ax', x: 1.5, y: 0.3, t: '3', size: 14, bold: true, tono: 'dato', nascosto: true },
      { id: 't4', tipo: 'testo', in: 'ax', x: 3.35, y: 2, t: '4', size: 14, bold: true, tono: 'due', nascosto: true },
      { id: 't5', tipo: 'testo', in: 'ax', x: 1.1, y: 2.4, t: '5', size: 15, bold: true, tono: 'ok', nascosto: true }
    ],
    passi: [
      { nota: '{{j|s003|'}}', righe: [2] },
      { nota: '{{j|s004|'}}', set: { cx: { nascosto: false }, t3: { nascosto: false } } },
      { nota: '{{j|s005|'}}', set: { cy: { nascosto: false }, t4: { nascosto: false } } },
      { nota: '{{j|s006|'}}', righe: [3, 4], set: { v: { tono: 'ok' }, t5: { nascosto: false } } }
    ]
  };

  // 2. norma in n dimensioni
  const cc = (id, y, vals, et, extra) => Object.assign({ id, tipo: 'celle', x: 150, y, cw: 60, valori: vals, indici: false, etichette: et }, extra || {});
  SCENE.norman = {
    w: 600, h: 260, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [
      { id: 'tv', tipo: 'testo', x: 80, y: 57, t: 'v', size: 15, bold: true },
      cc('v', 40, ['1', '2', '2'], ['v₁', 'v₂', 'v₃'], { toni: { 0: 'dato', 1: 'dato', 2: 'dato' } }),
      { id: 'tq', tipo: 'testo', x: 80, y: 137, t: 'vᵢ²', size: 15, bold: true, nascosto: true },
      cc('q', 120, ['1', '4', '4'], null, { nascosto: true }),
      { id: 's', tipo: 'testo', x: 450, y: 70, t: '', size: 14 },
      { id: 'r', tipo: 'testo', x: 450, y: 110, t: '', size: 16, bold: true },
      { id: 'f', tipo: 'testo', x: 300, y: 216, t: '‖v‖ = √(v₁² + v₂² + … + vₙ²)', size: 15, bold: true }
    ],
    passi: [
      { nota: "Un vettore di ℝ³: v = [1, 2, 2]. Non serve disegnarlo: la formula è la stessa del piano, con un termine per ogni componente." },
      { nota: "<b>Prima</b> ogni componente al quadrato: 1² = 1, 2² = 4, 2² = 4.", set: { tq: { nascosto: false }, q: { nascosto: false, toni: { 0: 'ora', 1: 'ora', 2: 'ora' } } } },
      { nota: "<b>Poi</b> la somma dei quadrati: 1 + 4 + 4 = 9.", set: { s: { t: 'Σ vᵢ² = 1 + 4 + 4 = 9', tono: 'ora' } } },
      { nota: "<b>Infine</b> la radice: ‖v‖ = √9 = <b>3</b>. Ordine: quadrati → somma → radice, come nella loss. Con 50 componenti (una posa) la somma ha 50 termini, e basta.", set: { r: { t: '‖v‖ = √9 = 3', tono: 'ok' } } }
    ]
  };

  // 3. distanza
  SCENE.distanza = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s008|'}}',
    codice: { lang: 'python', testo: `p = np.array([1, 1])
q = np.array([4, 5])
d = np.linalg.norm(q - p)   # 5.0` },
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 300, 230], dom: [0, 6, 0, 6], tacche: 1, etX: 'x', etY: 'y' },
      { id: 'p', tipo: 'punto', in: 'ax', x: 1, y: 1, t: 'p = (1, 1)', tono: 'dato' },
      { id: 'q', tipo: 'punto', in: 'ax', x: 4, y: 5, t: 'q = (4, 5)', tono: 'dato', tx: -80 },
      { id: 'dx', tipo: 'linea', in: 'ax', x1: 1, y1: 1, x2: 4, y2: 1, tono: 'ora', nascosto: true },
      { id: 'dy', tipo: 'linea', in: 'ax', x1: 4, y1: 1, x2: 4, y2: 5, tono: 'ora', nascosto: true },
      { id: 'tx', tipo: 'testo', in: 'ax', x: 2.5, y: 0.6, t: '4 − 1 = 3', size: 12, tono: 'ora', nascosto: true },
      { id: 'ty', tipo: 'testo', in: 'ax', x: 4.9, y: 3, t: '5 − 1 = 4', size: 12, tono: 'ora', nascosto: true },
      { id: 'pq', tipo: 'linea', in: 'ax', x1: 1, y1: 1, x2: 4, y2: 5, tono: 'ok', nascosto: true },
      { id: 'd', tipo: 'testo', x: 470, y: 90, t: '', size: 15, bold: true },
      { id: 'd2', tipo: 'testo', x: 470, y: 124, t: '', size: 13 }
    ],
    passi: [
      { nota: "Due punti, p = (1, 1) e q = (4, 5). Quanto sono lontani?", righe: [1, 2] },
      { nota: "La <b>differenza</b> q − p = [4 − 1, 5 − 1] = [3, 4] dice di quanto spostarsi da p per arrivare a q.", set: { dx: { nascosto: false }, dy: { nascosto: false }, tx: { nascosto: false }, ty: { nascosto: false }, d2: { t: 'q − p = [3, 4]' } } },
      { nota: "La <b>distanza</b> è la lunghezza di questa differenza: d(p, q) = ‖q − p‖ = √(3² + 4²) = <b>5</b>.", righe: [3], set: { pq: { nascosto: false }, d: { t: 'd(p, q) = ‖q − p‖ = 5', tono: 'ok' } } },
      { nota: "Andare da q a p dà p − q = [−3, −4]: stessa lunghezza, perché i quadrati tolgono il segno. La distanza è <b>simmetrica</b>: d(p, q) = d(q, p). Ed è 0 solo se i due punti coincidono.", set: { d2: { t: 'd(q, p) = ‖[−3, −4]‖ = 5' } } }
    ]
  };

  // 4. len contro norm
  SCENE.lenorm = {
    w: 560, h: 220, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      { id: 'v', tipo: 'celle', x: 40, y: 50, cw: 60, valori: ['3', '4'], etichette: ['indice 0', 'indice 1'] },
      { id: 'tl', tipo: 'testo', x: 100, y: 34, t: 'v = np.array([3, 4])', size: 13, bold: true },
      { id: 'l', tipo: 'testo', x: 360, y: 60, t: '', size: 15, bold: true },
      { id: 'n', tipo: 'testo', x: 360, y: 100, t: '', size: 15, bold: true },
      { id: 'c', tipo: 'testo', x: 280, y: 170, t: '', size: 13 }
    ],
    passi: [
      { nota: "In Python ci sono due \"lunghezze\" diverse, e confonderle è un errore frequente (dubbio chiesto in chat)." },
      { nota: "<code>len(v)</code> conta le <b>componenti</b>: v ha 2 celle, quindi 2. È la dimensione del vettore, non la sua grandezza.", set: { v: { toni: { 0: 'due', 1: 'due' } }, l: { t: 'len(v) = 2', tono: 'due' } } },
      { nota: "<code>np.linalg.norm(v)</code> è la <b>lunghezza geometrica</b> della freccia: √(9 + 16) = 5.", set: { v: { toni: { 0: 'ok', 1: 'ok' } }, n: { t: 'norm(v) = 5.0', tono: 'ok' } } },
      { nota: "Quando usare quale: <code>len</code> per controllare che due vettori abbiano la <b>stessa dimensione</b> prima di sommarli o confrontarli; <code>norm</code> per sapere quanto è <b>grande</b> un vettore o quanto sono <b>lontani</b> due dati: <code>np.linalg.norm(a) &gt; np.linalg.norm(b)</code>.", set: { c: { t: 'len: quante componenti · norm: quanto è lunga' } } }
    ]
  };

  // 5. altre norme: i "cerchi" di raggio 1
  const cerchio = [], rombo = [[1, 0], [0, 1], [-1, 0], [0, -1], [1, 0]], quadro = [[1, 1], [-1, 1], [-1, -1], [1, -1], [1, 1]];
  for (let a = 0; a <= 2 * Math.PI + 0.01; a += 0.1) cerchio.push([Math.cos(a), Math.sin(a)]);
  SCENE.altrenorme = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 230, 230], dom: [-1.5, 1.5, -1.5, 1.5], tacche: 0.5, numeri: false, etX: 'x', etY: 'y' },
      { id: 'c2', tipo: 'poli', in: 'ax', punti: cerchio, tono: 'ok', vuoto: true, nascosto: true },
      { id: 'c1', tipo: 'poli', in: 'ax', punti: rombo, tono: 'due', vuoto: true, nascosto: true },
      { id: 'ci', tipo: 'poli', in: 'ax', punti: quadro, tono: 'ora', vuoto: true, nascosto: true },
      { id: 't1', tipo: 'testo', x: 440, y: 50, t: 'v = [3, 4]', size: 14, bold: true },
      { id: 'n2', tipo: 'testo', x: 440, y: 84, t: 'L2: √(9 + 16) = 5', size: 13, nascosto: true },
      { id: 'n1', tipo: 'testo', x: 440, y: 114, t: 'L1: |3| + |4| = 7', size: 13, nascosto: true },
      { id: 'ni', tipo: 'testo', x: 440, y: 144, t: 'L∞: max(|3|, |4|) = 4', size: 13, nascosto: true },
      { id: 'cm', tipo: 'testo', x: 440, y: 200, t: '', size: 12 }
    ],
    passi: [
      { nota: "La norma L2 non è l'unico modo di misurare la grandezza. Per confrontarle si disegnano i punti che, per ciascuna, hanno norma esattamente 1." },
      { nota: "<b>L2</b> (euclidea), √(Σ vᵢ²): la distanza in linea d'aria. I punti a distanza 1 dall'origine formano un <b>cerchio</b>. Per [3, 4] vale 5.", set: { c2: { nascosto: false }, n2: { nascosto: false }, cm: { t: 'norma 1 in L2: un cerchio' } } },
      { nota: "<b>L1</b> (Manhattan), Σ |vᵢ|: si somma quanto ci si sposta lungo ogni asse, come camminando fra gli isolati di una città. I punti a distanza 1 formano un <b>rombo</b>. Per [3, 4]: 3 + 4 = 7.", set: { c1: { nascosto: false }, n1: { nascosto: false }, cm: { t: 'norma 1 in L1: un rombo' } } },
      { nota: "<b>L∞</b> (massimo), maxᵢ |vᵢ|: conta solo la componente più grande. I punti a distanza 1 formano un <b>quadrato</b>. Per [3, 4]: 4. Norme diverse danno idee diverse di \"vicino\"; in NumPy: <code>np.linalg.norm(v, 1)</code>, <code>np.linalg.norm(v, np.inf)</code> (valori controllati).", set: { ci: { nascosto: false }, ni: { nascosto: false }, cm: { t: 'norma 1 in L∞: un quadrato' } } }
    ]
  };

  // 6. normalizzare
  const cer = []; for (let a = 0; a <= 2 * Math.PI + 0.01; a += 0.1) cer.push([Math.cos(a), Math.sin(a)]);
  SCENE.unitario = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 280, 230], dom: [-3, 4, -1.5, 4.5], tacche: 1, etX: 'x', etY: 'y' },
      { id: 'uc', tipo: 'poli', in: 'ax', punti: cer, tono: 'spento', vuoto: true },
      { id: 'v', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 3, y2: 4, t: 'v = [3, 4]', tono: 'dato' },
      { id: 'u', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 0.6, y2: 0.8, t: '[0.6, 0.8]', tx: 10, ty: 6, tono: 'ok', nascosto: true },
      { id: 'w', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: -2, y2: 1, t: 'w = [−2, 1]', tx: -70, ty: -10, tono: 'dato', nascosto: true },
      { id: 'uw', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: -0.894, y2: 0.447, t: '', tono: 'ok', nascosto: true },
      { id: 'c1', tipo: 'testo', x: 460, y: 60, t: '‖v‖ = 5', size: 14, bold: true },
      { id: 'c2', tipo: 'testo', x: 460, y: 92, t: '', size: 14 },
      { id: 'c3', tipo: 'testo', x: 460, y: 140, t: '', size: 13 },
      { id: 'c4', tipo: 'testo', x: 460, y: 170, t: '', size: 13 }
    ],
    passi: [
      { nota: "Il cerchio grigio contiene i vettori di lunghezza 1, detti <b>unitari</b>. v = [3, 4] è lungo 5." },
      { nota: "<b>Normalizzare</b> v: dividerlo per la sua norma. v / ‖v‖ = [3/5, 4/5] = [0.6, 0.8]. Stessa direzione, lunghezza 1: cade sul cerchio.", set: { u: { nascosto: false }, c2: { t: 'v / ‖v‖ = [0.6, 0.8]', tono: 'ok' } } },
      { nota: "Con w = [−2, 1]: ‖w‖ = √5 ≈ 2.236, e w / ‖w‖ ≈ [−0.894, 0.447]. Anche lui sul cerchio.", set: { w: { nascosto: false }, uw: { nascosto: false }, c3: { t: '‖w‖ = √5 ≈ 2.236' }, c4: { t: 'w / ‖w‖ ≈ [−0.894, 0.447]', tono: 'ok' } } },
      { nota: "Normalizzare <b>toglie la grandezza e tiene la direzione</b>. Serve quando conta solo \"dove punta\" un vettore, per esempio per confrontare direzioni con il coseno (<a href=\"w02-prodotto-interno.html\">prodotto interno</a>). Non si può normalizzare il vettore nullo: la norma è 0." }
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
  <div class="box domanda-tua" data-tit="{{a|s018|}}">
    <p>{{s|s019|}}</p>
  </div>
  <figure class="scena" data-scena="norma" data-titolo="{{a|s020|}}"></figure>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
  <div class="mblock"><span class="m">‖v‖ = √( v₁² + v₂² + … + vₙ² ) = √( Σᵢ vᵢ² )</span></div>
  <p>{{s|s023|}}</p>
  <p>{{s|s024|}}</p>
  <figure class="scena" data-scena="norman" data-titolo="{{a|s025|}}"></figure>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <p>{{s|s027|}}</p>
  <div class="box regola" data-tit="{{a|s028|}}">
    <p>{{s|s029|}}</p>
  </div>
  <p>{{s|s030|}}</p>
  <figure class="codice" data-titolo="{{a|s031|}}">
<pre data-lang="python">import numpy as np
poses = np.load('poses.npy')          # forma (18, 50)
diff = poses[0] - poses[1]            # componente per componente
d = np.linalg.norm(diff)              # un solo numero
d_manuale = np.sqrt(np.sum(diff**2))  # la stessa cosa, a mano</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="(18, 50)@dato"><p>{{s|s032|}}</p></li>
      <li data-righe="3" data-segna="poses[0] - poses[1]@ora"><p>{{s|s033|}}</p></li>
      <li data-righe="4" data-segna="np.linalg.norm(diff)@ok"><p>{{s|s034|}}</p></li>
      <li data-righe="5" data-segna="diff**2@due|np.sum@due|np.sqrt@ok"><p>{{s|s035|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="distanza" data-titolo="{{a|s036|}}"></figure>
</section>

<section>
  <h2>{{s|s037|}}</h2>
  <p>{{s|s038|}}</p>
  <p>{{s|s039|}}</p>
  <p>{{s|s040|}}</p>
  <div class="box domanda-tua" data-tit="{{a|s041|}}">
    <p>{{s|s042|}}</p>
  </div>
  <figure class="scena" data-scena="lenorm" data-titolo="{{a|s043|}}"></figure>
</section>

<section>
  <h2>{{s|s044|}}</h2>
  <p>{{s|s045|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s046|}}</th><th>{{s|s047|}}</th><th>{{s|s048|}}</th><th>{{s|s049|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s050|}}</td><td><span class="m">√(Σ vᵢ²)</span></td><td>5</td><td>{{s|s051|}}</td></tr>
      <tr><td>{{s|s052|}}</td><td><span class="m">Σ |vᵢ|</span></td><td>7</td><td>{{s|s053|}}</td></tr>
      <tr><td>{{s|s054|}}</td><td>{{s|s055|}}</td><td>4</td><td>{{s|s056|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s057|}}</p>
  <p class="piccolo">{{s|s058|}}</p>
  <figure class="scena" data-scena="altrenorme" data-titolo="{{a|s059|}}"></figure>
</section>

<section>
  <h2>{{s|s060|}}</h2>
  <p>{{s|s061|}}</p>
  <p>{{s|s062|}}</p>
  <p>{{s|s063|}}</p>
  <figure class="scena" data-scena="unitario" data-titolo="{{a|s064|}}"></figure>
</section>

</main>
</body>
</html>
