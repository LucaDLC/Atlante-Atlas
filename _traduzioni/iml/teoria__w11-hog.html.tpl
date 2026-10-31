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
  const px = [[0, 0, 2, 0], [1, 0, 1, 0], [2, 90, 3, 2], [3, 45, 1, 1]];
  const ogg = [{ id: 'G', tipo: 'griglia', x: 30, y: 40, cw: 44, ch: 44, valori: [['', '', '', ''], ['', '', '', ''], ['', '', '', ''], ['', '', '', '']] }];
  ogg.push({ id: 'tg', tipo: 'testo', x: 118, y: 24, t: 'una cella (4 × 4 pixel)', size: 13 });
  const cx = k => 30 + 22 + (k % 4) * 44, cy = k => 40 + 22 + Math.floor(k / 4) * 44;
  const pix = [5, 6, 9, 10];
  px.forEach(([i, ang, mag], j) => {
    const k = pix[j], L = 8 + mag * 5, a = ang * Math.PI / 180;
    ogg.push({ id: 'v' + j, tipo: 'vett', x1: cx(k) - Math.cos(a) * L / 2, y1: cy(k) + Math.sin(a) * L / 2, x2: cx(k) + Math.cos(a) * L / 2, y2: cy(k) - Math.sin(a) * L / 2, tono: 'dato' });
  });
  const base = 220, sc = 40, etich = ['0°', '45°', '90°', '135°'];
  etich.forEach((t, b) => {
    ogg.push({ id: 'b' + b, tipo: 'rett', x: 280 + b * 60, y: base, w: 44, h: 0.01, t: '', tono: 'ok' });
    ogg.push({ id: 'e' + b, tipo: 'testo', x: 302 + b * 60, y: base + 14, t, size: 12 });
    ogg.push({ id: 'h' + b, tipo: 'testo', x: 302 + b * 60, y: base - 8, t: '', size: 12, bold: true });
  });
  ogg.push({ id: 'th', tipo: 'testo', x: 390, y: 24, t: 'istogramma delle direzioni', size: 13 });
  ogg.push({ id: 'n', tipo: 'testo', x: 270, y: 262, t: '', size: 13, bold: true });
  const barra = (b, v) => ({ ['b' + b]: { y: base - v * sc, h: v * sc }, ['h' + b]: { t: String(v) } });
  SCENE.istogramma = {
    w: 540, h: 275, lato: false,
    legenda: '{{j|s002|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s003|'}}' },
      { nota: '{{j|s004|'}}', set: Object.assign({ v0: { tono: 'ora' } }, barra(0, 2)) },
      { nota: '{{j|s005|'}}', set: Object.assign({ v0: { tono: 'dato' }, v1: { tono: 'ora' } }, barra(0, 3)) },
      { nota: '{{j|s006|'}}', set: Object.assign({ v1: { tono: 'dato' }, v2: { tono: 'ora' } }, barra(2, 3)) },
      { nota: '{{j|s007|'}}', set: Object.assign({ v2: { tono: 'dato' }, v3: { tono: 'ora' } }, barra(1, 1)) },
      { nota: '{{j|s008|'}}', set: { v3: { tono: 'dato' }, n: { t: '[3, 1, 3, 0] → [0.69, 0.23, 0.69, 0]', tono: 'ok' } } }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const D = {"c2": [0.035, 1.061, 29.212], "v2": 0.7853981633974483, "c10": [0.483, 1.713, 2.544], "v10": 0.00249039457019272, "c100": [3.376, 4.771, 0.413], "v100": 1.8681820538375915e-70, "c1000": [12.203, 13.53, 0.109], "v1000": 0.0, "f2": 0.7851, "f3": 0.5225, "f10": 0.0024, "griglia": {"1": 10, "2": 100, "3": 1000, "10": 10000000000}, "eig": [1.0, 3.0], "V": [[-0.7071, 0.7071], [0.7071, 0.7071]], "metr": {"a": [1.5, 2.5, 1.58, 0.5], "b": [2.5, 10.5, 3.24, -1.1]}, "sbil": [0.95, 0.0, 0.0, 0.0]};
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const P = (id, x, y, t, extra) => Object.assign({ id, tipo: 'punto', in: 'ax', x, y, t }, extra || {});
  const L = (id, x1, y1, x2, y2, extra) => Object.assign({ id, tipo: 'linea', in: 'ax', x1, y1, x2, y2 }, extra || {});
  const V = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', in: 'ax', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 36, valori, indici: false }, extra || {});

    SCENE.hogperche = {
      w: 620, h: 250, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [T('t1', 90, 52, 'pixel', { anchor: 'end', size: 12 }), C('px', 100, 34, ['10', '10', '50', '50']), T('t2', 90, 112, 'differenze', { anchor: 'end', size: 12 }), C('gr', 126, 94, ['0', '40', '0'], { toni: { 1: 'ok' } }),
        T('c', 470, 52, '', { size: 12 }), T('c2', 470, 112, '', { size: 12 }), T('c3', 310, 180, '', { size: 12 }), T('c4', 310, 215, '', { size: 12 })],
      passi: [
        { nota: "Perché HOG funziona meglio dei pixel grezzi? Una riga di quattro pixel con un bordo, e le sue differenze (il gradiente): 0, 40, 0." },
        { nota: "<b>Luce</b>: la stessa scena più illuminata (+50 a ogni pixel). I pixel cambiano tutti…", set: { px: { valori: ['60', '60', '100', '100'], toni: { 0: 'no', 1: 'no', 2: 'no', 3: 'no' } }, c: { t: 'pixel: tutti diversi', tono: 'no' } } },
        { nota: "…le differenze <b>no</b>: 0, 40, 0. I gradienti guardano differenze, non valori assoluti; la normalizzazione per blocchi toglie anche il contrasto.", set: { c2: { t: 'gradiente: identico', tono: 'ok' } } },
        { nota: "<b>Piccoli spostamenti</b>: dentro una cella 8 × 8 conta <b>quante</b> direzioni ci sono, non dove esattamente: un bordo spostato di un pixel lascia l'istogramma quasi uguale. <b>Forma</b>: una persona in piedi ha tanti bordi verticali in posizioni simili, e il vettore HOG lo cattura.", set: { c3: { t: 'istogramma per cella: tollera piccoli spostamenti' } } },
        { nota: "Limiti: rotazioni grandi e cambi di scala cambiano le celle; i parametri si scelgono a mano. Ma con buone feature classi intrecciate nello spazio dei pixel diventano quasi separabili da un iperpiano: basta un classificatore lineare. Le CNN imparano da sole filtri simili.", set: { c4: { t: 'buone feature → basta un classificatore lineare' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s010|}}</h1>
  <p class="lede">{{s|s011|}}</p>
</header>

<section>
  <h2>{{s|s012|}}</h2>
  <figure class="passi" data-titolo="{{a|s013|}}">
    <div class="passo"><div class="espr">1. gradiente in ogni pixel:  <mark class="dato">I<sub>x</sub>, I<sub>y</sub></mark>  →  grandezza e <mark class="ora">direzione</mark></div><p class="nota">{{s|s014|}}</p></div>
    <div class="passo"><div class="espr">2. celle di 8 × 8 pixel  →  un <mark class="ora">istogramma delle direzioni</mark> per cella</div><p class="nota">{{s|s015|}}</p></div>
    <div class="passo"><div class="espr">3. blocchi di 2 × 2 celle  →  <mark class="due">normalizzazione</mark></div><p class="nota">{{s|s016|}}</p></div>
    <div class="passo"><div class="espr">4. tutti gli istogrammi in fila  →  <mark class="ok">un vettore di feature</mark></div><p class="nota">{{s|s017|}}</p></div>
  </figure>
  <p class="piccolo">{{s|s018|}}</p>
  <figure class="scena" data-scena="istogramma" data-titolo="{{a|s019|}}"></figure>
  <figure class="codice" data-titolo="{{a|s020|}}">
<pre data-lang="python">fd, hog_image = hog(image, orientations=8, pixels_per_cell=(8, 8),
                    cells_per_block=(2, 2), visualize=True, channel_axis=-1)
X_train = np.array([hog(im, orientations=8, pixels_per_cell=(8, 8),
                        cells_per_block=(2, 2)) for im in images])</pre>
    <ol class="spiega">
      <li data-righe="1-2" data-segna="orientations=8@ora|pixels_per_cell=(8, 8)@dato|cells_per_block=(2, 2)@due"><p>{{s|s021|}}</p></li>
      <li data-righe="3-4" data-segna="X_train@ok"><p>{{s|s022|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s023|}}</h2>
  <ul>
    <li>{{s|s024|}}</li>
    <li>{{s|s025|}}</li>
    <li>{{s|s026|}}</li>
    <li>{{s|s027|}}</li>
  </ul>
  <div class="box idea" data-tit="{{a|s028|}}">
    <p>{{s|s029|}}</p>
  </div>
  <div class="box esame" data-tit="{{a|s030|}}">
    <p>{{s|s031|}}</p>
  </div>
  <figure class="scena" data-scena="hogperche" data-titolo="{{a|s032|}}"></figure>
</section>

</main>
</body>
</html>
