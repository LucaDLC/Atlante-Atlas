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
  const f = [3, 3, 9, 3, 3, 6, 6, 6], out = ['5', '5', '5', '4', '5', '6'];
  const CW = 56, X0 = 36;
  const passo = n => {
    const toniF = {}; [n - 1, n, n + 1].forEach(i => toniF[i] = 'ora');
    const val = ['–'].concat(out.map((v, i) => i + 1 <= n ? v : '')).concat(['–']);
    const toniY = {}; toniY[n] = 'ok';
    const somma = `(${f[n - 1]} + ${f[n]} + ${f[n + 1]}) / 3 = ${out[n - 1]}`;
    return {
      nota: `{{j|s002|`}}`,
      set: { F: { toni: toniF }, H: { x: X0 + (n - 1) * CW }, Y: { valori: val, toni: toniY }, c: { t: somma } }
    };
  };
  SCENE.media = {
    w: 520, h: 250, lato: false,
    legenda: '{{j|s003|'}}',
    oggetti: [
      { id: 'tf', tipo: 'testo', x: 14, y: 50, t: 'f', size: 15, bold: true },
      { id: 'F', tipo: 'celle', x: X0, y: 30, cw: CW, ch: 40, valori: f.map(String) },
      { id: 'th', tipo: 'testo', x: 14, y: 124, t: 'h', size: 15, bold: true },
      { id: 'H', tipo: 'celle', x: X0, y: 104, cw: CW, ch: 40, valori: ['1/3', '1/3', '1/3'], indici: false, toni: { 0: 'due', 1: 'due', 2: 'due' } },
      { id: 'ty', tipo: 'testo', x: 14, y: 190, t: 'y', size: 15, bold: true },
      { id: 'Y', tipo: 'celle', x: X0, y: 170, cw: CW, ch: 40, valori: ['–', '', '', '', '', '', '', '–'] },
      { id: 'c', tipo: 'testo', x: 260, y: 238, t: '', size: 13, bold: true }
    ],
    passi: [
      { nota: '{{j|s004|'}}' }
    ].concat([1, 2, 3, 4, 5, 6].map(passo)).concat([
      { nota: '{{j|s005|'}}', set: { F: { toni: {} }, Y: { toni: { 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok', 5: 'ok', 6: 'ok' } }, H: { x: X0 + 5 * CW }, c: { t: 'y = [5, 5, 5, 4, 5, 6]' } } }
    ])
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const D = {"tr": [[0.086, 0.428], [0.094, 0.357], [0.114, 0.338], [0.16, 0.726], [0.237, 1.141], [0.391, 0.56], [0.433, 0.695], [0.479, 0.071], [0.517, -0.098], [0.582, -0.03], [0.735, -0.832], [0.801, -1.1]], "te": [[0.107, 0.826], [0.151, -0.037], [0.234, 1.301], [0.353, 0.508], [0.423, -0.035], [0.504, 0.055], [0.537, -0.018], [0.558, -0.492], [0.592, -0.867], [0.639, -0.759], [0.724, -1.002], [0.752, -0.578]], "c1": [[0.086, 0.795], [0.098, 0.771], [0.11, 0.747], [0.121, 0.722], [0.133, 0.698], [0.145, 0.674], [0.157, 0.65], [0.169, 0.626], [0.181, 0.602], [0.193, 0.578], [0.205, 0.554], [0.217, 0.53], [0.229, 0.505], [0.241, 0.481], [0.253, 0.457], [0.265, 0.433], [0.276, 0.409], [0.288, 0.385], [0.3, 0.361], [0.312, 0.337], [0.324, 0.313], [0.336, 0.288], [0.348, 0.264], [0.36, 0.24], [0.372, 0.216], [0.384, 0.192], [0.396, 0.168], [0.408, 0.144], [0.42, 0.12], [0.432, 0.095], [0.443, 0.071], [0.455, 0.047], [0.467, 0.023], [0.479, -0.001], [0.491, -0.025], [0.503, -0.049], [0.515, -0.073], [0.527, -0.097], [0.539, -0.122], [0.551, -0.146], [0.563, -0.17], [0.575, -0.194], [0.587, -0.218], [0.599, -0.242], [0.61, -0.266], [0.622, -0.29], [0.634, -0.315], [0.646, -0.339], [0.658, -0.363], [0.67, -0.387], [0.682, -0.411], [0.694, -0.435], [0.706, -0.459], [0.718, -0.483], [0.73, -0.507], [0.742, -0.532], [0.754, -0.556], [0.765, -0.58], [0.777, -0.604], [0.789, -0.628], [0.801, -0.652]], "m1": [0.146, 0.185], "c3": [[0.086, 0.311], [0.098, 0.403], [0.11, 0.487], [0.121, 0.563], [0.133, 0.631], [0.145, 0.693], [0.157, 0.747], [0.169, 0.794], [0.181, 0.834], [0.193, 0.868], [0.205, 0.896], [0.217, 0.917], [0.229, 0.933], [0.241, 0.943], [0.253, 0.947], [0.265, 0.946], [0.276, 0.941], [0.288, 0.93], [0.3, 0.915], [0.312, 0.895], [0.324, 0.872], [0.336, 0.844], [0.348, 0.813], [0.36, 0.778], [0.372, 0.74], [0.384, 0.698], [0.396, 0.654], [0.408, 0.607], [0.42, 0.558], [0.432, 0.506], [0.443, 0.453], [0.455, 0.397], [0.467, 0.34], [0.479, 0.282], [0.491, 0.222], [0.503, 0.162], [0.515, 0.1], [0.527, 0.039], [0.539, -0.023], [0.551, -0.086], [0.563, -0.148], [0.575, -0.21], [0.587, -0.271], [0.599, -0.331], [0.61, -0.391], [0.622, -0.449], [0.634, -0.506], [0.646, -0.561], [0.658, -0.615], [0.67, -0.666], [0.682, -0.716], [0.694, -0.762], [0.706, -0.806], [0.718, -0.848], [0.73, -0.886], [0.742, -0.92], [0.754, -0.952], [0.765, -0.979], [0.777, -1.003], [0.789, -1.022], [0.801, -1.037]], "m3": [0.023, 0.16], "c9": [[0.086, 0.425], [0.098, 0.348], [0.11, 0.323], [0.121, 0.356], [0.133, 0.442], [0.145, 0.564], [0.157, 0.705], [0.169, 0.846], [0.181, 0.971], [0.193, 1.069], [0.205, 1.134], [0.217, 1.162], [0.229, 1.156], [0.241, 1.118], [0.253, 1.056], [0.265, 0.979], [0.276, 0.894], [0.288, 0.81], [0.3, 0.734], [0.312, 0.671], [0.324, 0.625], [0.336, 0.596], [0.348, 0.584], [0.36, 0.585], [0.372, 0.595], [0.384, 0.609], [0.396, 0.619], [0.408, 0.619], [0.42, 0.605], [0.432, 0.57], [0.443, 0.513], [0.455, 0.433], [0.467, 0.331], [0.479, 0.213], [0.491, 0.086], [0.503, -0.041], [0.515, -0.157], [0.527, -0.248], [0.539, -0.301], [0.551, -0.306], [0.563, -0.251], [0.575, -0.131], [0.587, 0.057], [0.599, 0.309], [0.61, 0.614], [0.622, 0.953], [0.634, 1.298], [0.646, 1.616], [0.658, 1.865], [0.67, 1.999], [0.682, 1.971], [0.694, 1.737], [0.706, 1.268], [0.718, 0.55], [0.73, -0.395], [0.742, -1.5], [0.754, -2.4], [0.765, -2.4], [0.777, -2.4], [0.789, -2.4], [0.801, -1.1]], "m9": [0.004, 1.003], "r0.0": [[0.086, 0.425], [0.098, 0.348], [0.11, 0.323], [0.121, 0.356], [0.133, 0.442], [0.145, 0.564], [0.157, 0.705], [0.169, 0.846], [0.181, 0.971], [0.193, 1.069], [0.205, 1.134], [0.217, 1.162], [0.229, 1.156], [0.241, 1.118], [0.253, 1.056], [0.265, 0.979], [0.276, 0.894], [0.288, 0.81], [0.3, 0.734], [0.312, 0.671], [0.324, 0.625], [0.336, 0.596], [0.348, 0.584], [0.36, 0.585], [0.372, 0.595], [0.384, 0.609], [0.396, 0.619], [0.408, 0.619], [0.42, 0.605], [0.432, 0.57], [0.443, 0.513], [0.455, 0.433], [0.467, 0.331], [0.479, 0.213], [0.491, 0.086], [0.503, -0.041], [0.515, -0.157], [0.527, -0.248], [0.539, -0.301], [0.551, -0.306], [0.563, -0.251], [0.575, -0.131], [0.587, 0.057], [0.599, 0.309], [0.61, 0.614], [0.622, 0.953], [0.634, 1.298], [0.646, 1.616], [0.658, 1.865], [0.67, 1.999], [0.682, 1.971], [0.694, 1.737], [0.706, 1.268], [0.718, 0.55], [0.73, -0.395], [0.742, -1.5], [0.754, -2.4], [0.765, -2.4], [0.777, -2.4], [0.789, -2.4], [0.801, -1.1]], "rn0.0": 6131134.5, "rm0.0": [0.004, 1.003], "r0.001": [[0.086, 0.449], [0.098, 0.486], [0.11, 0.52], [0.121, 0.553], [0.133, 0.582], [0.145, 0.61], [0.157, 0.635], [0.169, 0.658], [0.181, 0.678], [0.193, 0.695], [0.205, 0.71], [0.217, 0.723], [0.229, 0.733], [0.241, 0.74], [0.253, 0.744], [0.265, 0.746], [0.276, 0.745], [0.288, 0.742], [0.3, 0.735], [0.312, 0.726], [0.324, 0.714], [0.336, 0.7], [0.348, 0.682], [0.36, 0.662], [0.372, 0.639], [0.384, 0.614], [0.396, 0.586], [0.408, 0.555], [0.42, 0.521], [0.432, 0.485], [0.443, 0.447], [0.455, 0.406], [0.467, 0.363], [0.479, 0.317], [0.491, 0.269], [0.503, 0.219], [0.515, 0.167], [0.527, 0.113], [0.539, 0.058], [0.551, 0.001], [0.563, -0.058], [0.575, -0.118], [0.587, -0.179], [0.599, -0.24], [0.61, -0.302], [0.622, -0.365], [0.634, -0.427], [0.646, -0.489], [0.658, -0.55], [0.67, -0.611], [0.682, -0.67], [0.694, -0.727], [0.706, -0.782], [0.718, -0.834], [0.73, -0.883], [0.742, -0.928], [0.754, -0.968], [0.765, -1.004], [0.777, -1.033], [0.789, -1.056], [0.801, -1.072]], "rn0.001": 9.7, "rm0.001": [0.035, 0.177], "r1.0": [[0.086, 0.444], [0.098, 0.439], [0.11, 0.434], [0.121, 0.428], [0.133, 0.423], [0.145, 0.417], [0.157, 0.411], [0.169, 0.405], [0.181, 0.399], [0.193, 0.393], [0.205, 0.386], [0.217, 0.379], [0.229, 0.372], [0.241, 0.365], [0.253, 0.357], [0.265, 0.349], [0.276, 0.341], [0.288, 0.332], [0.3, 0.324], [0.312, 0.315], [0.324, 0.305], [0.336, 0.295], [0.348, 0.285], [0.36, 0.275], [0.372, 0.264], [0.384, 0.253], [0.396, 0.241], [0.408, 0.229], [0.42, 0.217], [0.432, 0.204], [0.443, 0.19], [0.455, 0.176], [0.467, 0.162], [0.479, 0.147], [0.491, 0.131], [0.503, 0.115], [0.515, 0.098], [0.527, 0.081], [0.539, 0.062], [0.551, 0.043], [0.563, 0.024], [0.575, 0.003], [0.587, -0.019], [0.599, -0.041], [0.61, -0.064], [0.622, -0.088], [0.634, -0.114], [0.646, -0.14], [0.658, -0.168], [0.67, -0.196], [0.682, -0.226], [0.694, -0.258], [0.706, -0.291], [0.718, -0.325], [0.73, -0.361], [0.742, -0.398], [0.754, -0.437], [0.765, -0.478], [0.777, -0.521], [0.789, -0.566], [0.801, -0.614]], "rn1.0": 1.0, "rm1.0": [0.129, 0.266], "seg": [0.187, 0.048, 0.278, -0.051, -0.231, 0.146, 0.146, -0.054, -0.196, 0.057, -0.623, 0.173, 0.123, -0.41, 0.015, -0.241, 0.189, -0.509, -0.229, 0.177, 1.289, 0.46, 0.875, 1.082, 0.848, 1.398, 0.702, 1.089, 0.738, 1.351, 0.995, 0.907, 0.57, 1.42, 1.188, 1.188, 1.284, 1.087, 0.84, 0.8], "ma3": [0.078, 0.171, 0.092, -0.002, -0.046, 0.02, 0.079, -0.035, -0.064, -0.254, -0.131, -0.109, -0.038, -0.091, -0.212, -0.012, -0.187, -0.183, -0.187, 0.413, 0.642, 0.875, 0.806, 0.935, 1.109, 0.983, 1.063, 0.843, 1.059, 1.028, 1.084, 0.824, 0.966, 1.06, 1.266, 1.22, 1.187, 1.071, 0.909, 0.547], "ma9": [0.026, 0.042, 0.058, 0.052, 0.03, 0.016, -0.059, -0.07, -0.051, -0.071, -0.085, -0.128, -0.101, -0.136, -0.168, -0.079, 0.045, 0.083, 0.225, 0.344, 0.465, 0.599, 0.734, 0.88, 0.942, 0.949, 1.009, 1.012, 0.955, 1.019, 0.996, 1.05, 1.071, 1.11, 1.053, 1.032, 0.931, 0.868, 0.71, 0.578], "std_rum": [0.254, 0.098, 0.047], "conv": [0, 0, 4, 0, 0], "corr": [0, 0, -4, 0, 0], "full": [1.0, 2.0, 5.0, 5.0, 5.0, 4.0, 5.0, 6.0, 4.0, 2.0], "valid": [5.0, 5.0, 5.0, 4.0, 5.0, 6.0], "img": [[0.0, 0.0, 0.0, 9.0, 9.0], [0.0, 0.0, 0.0, 9.0, 9.0], [0.0, 0.0, 0.0, 9.0, 9.0], [0.0, 0.0, 0.0, 9.0, 9.0], [0.0, 0.0, 0.0, 9.0, 9.0]], "f_media": [0.0, 0.0, 3.0, 6.0, 9.0], "f_sharp": [0.0, 0.0, -27.0, 36.0, 9.0], "f_sobel": [0.0, 0.0, 36.0, 36.0, 0.0]};
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const P = (id, x, y, t, extra) => Object.assign({ id, tipo: 'punto', in: 'ax', x, y, t }, extra || {});
  const L = (id, x1, y1, x2, y2, extra) => Object.assign({ id, tipo: 'linea', in: 'ax', x1, y1, x2, y2 }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 36, valori, indici: false }, extra || {});
  const pl = p => p.concat(p.slice().reverse());
  const curva = (id, pts, tono, extra) => Object.assign({ id, tipo: 'poli', in: 'ax', punti: pl(pts), tono, vuoto: true }, extra || {});

    const xs = D.seg.map((_, i) => i);
    const ogf = [{ id: 'ax', tipo: 'assi', box: [40, 20, 420, 220], dom: [0, 39, -0.8, 1.8], tacche: 5, etX: 'campione', etY: 'f' }]
      .concat(D.seg.map((y, i) => P('s' + i, i, y, '', { tono: 'dato', r: 3 })),
        [curva('m3', xs.slice(1, 39).map(i => [i, D.ma3[i]]), 'due', { nascosto: true }), curva('m9', xs.slice(4, 36).map(i => [i, D.ma9[i]]), 'ok', { nascosto: true }),
          L('vero', 0, 0, 19.5, 0, { tono: 'spento', tratt: true }), L('vero2', 19.5, 1, 39, 1, { tono: 'spento', tratt: true }),
          T('c', 570, 40, '', { size: 12 }), T('c2', 570, 90, '', { size: 12 }), T('c3', 570, 150, '', { size: 12 }), T('c4', 575, 215, '', { size: 12 })]);
    SCENE.afiltra = {
      w: 680, h: 270, lato: true,
      legenda: '{{j|s006|'}}',
      oggetti: ogf,
      passi: [
        { nota: "Un gradino (0, poi 1) più rumore casuale. Il rumore cambia da un campione al vicino, il segnale no: una <b>media locale</b> attenua il rumore. Calcolato con NumPy (np.convolve)." },
        { nota: "Media mobile su <b>3</b> campioni: il rumore si riduce (deviazione standard sulla parte piatta " + D.std_rum[0] + " → " + D.std_rum[1] + ").", set: { m3: { nascosto: false }, c: { t: 'rumore: ' + D.std_rum[0] + ' → ' + D.std_rum[1] } } },
        { nota: "Media su <b>9</b>: ancora più liscia (" + D.std_rum[2] + "). Più il filtro è largo, più rumore toglie…", set: { m3: { nascosto: true }, m9: { nascosto: false }, c2: { t: 'su 9: ' + D.std_rum[2] } } },
        { nota: "…e più <b>dettaglio</b> perde: il salto netto del gradino diventa una rampa lunga 9 campioni. È il compromesso di ogni filtro di smoothing. Per lo sguardo: troppo smoothing e le saccadi diventano lente. Filtrare serve anche a <b>estrarre</b> informazioni: bordi, variazioni (derivate, settimana 8), somiglianza con un modello (template matching).", set: { c3: { t: 'il bordo diventa una rampa', tono: 'no' }, c4: { t: 'meno rumore, meno dettaglio' } } }
      ]
    };

    SCENE.convcorr = {
      w: 600, h: 240, lato: true,
      legenda: '{{j|s007|'}}',
      oggetti: [T('tf', 20, 52, 'f', { bold: true }), C('f', 40, 34, ['1', '1', '1', '5', '5', '5']), T('th', 20, 112, 'h', { bold: true }), C('h', 144, 94, ['1', '−1'], { toni: { 0: 'due', 1: 'due' } }),
        T('l1', 450, 52, '', { size: 12 }), T('l2', 450, 82, '', { size: 12 }), T('r', 300, 170, '', { bold: true, size: 14 }), T('c', 300, 210, '', { size: 12 })],
      passi: [
        { nota: "Un filtro è un <b>prodotto interno</b> tra i pesi e un pezzo del segnale. Segnale: un gradino [1, 1, 1, 5, 5, 5]. Filtro non simmetrico: [1, −1]." },
        { nota: "<b>Correlazione</b>: y<sub>n</sub> = Σ h<sub>m</sub> f<sub>n+m</sub>. Il filtro scorre così com'è. Sul salto: 1·1 + (−1)·5 = <b>−4</b>.", set: { f: { toni: { 2: 'ora', 3: 'ora' } }, l1: { t: 'correlate: 1·1 + (−1)·5' }, r: { t: 'correlazione: −4', tono: 'ok' } } },
        { nota: "<b>Convoluzione</b>: y<sub>n</sub> = Σ h<sub>m</sub> f<sub>n−m</sub>: lo stesso, con il filtro <b>capovolto</b> ([−1, 1]). Sul salto: −1·1 + 1·5 = <b>+4</b>. Cambia il segno (verificato con np.convolve e np.correlate).", set: { h: { valori: ['−1', '1'] }, l2: { t: 'convolve: (−1)·1 + 1·5' }, r: { t: 'convoluzione: +4', tono: 'ok' } } },
        { nota: "Con un filtro <b>simmetrico</b> (media, [1, 2, 1], gaussiano) capovolto è uguale: stesso risultato, e nello smoothing la differenza non si vede. In 2D il filtro si ruota di 180°. Nel corso si dice \"filtro\", non \"kernel\": kernel indica già la mappa delle feature Φ(x).", set: { c: { t: 'filtro simmetrico ⇒ correlazione = convoluzione' } } }
      ]
    };

    const riga = D.img[2].map(v => String(v));
    SCENE.filtri2d = {
      w: 620, h: 250, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [T('ti', 90, 52, 'riga 2', { anchor: 'end', size: 12 }), C('im', 100, 34, riga, { cw: 60 }), T('nome', 300, 110, '', { bold: true }), T('to', 90, 152, 'uscita', { anchor: 'end', size: 12 }), C('o', 100, 134, ['', '', '', '', ''], { cw: 60, toni: {} }), T('c', 300, 215, '', { size: 12 })],
      passi: [
        { nota: "Un'immagine 5 × 5 con un bordo verticale: le prime tre colonne valgono 0, le ultime due 9. Guardiamo la riga centrale dopo tre filtri 3 × 3 (scipy.ndimage, bordi replicati)." },
        { nota: "<b>Media 3 × 3</b> (pesi 1/9, somma 1): sfoca. Il salto 0 → 9 diventa 0, 3, 6, 9: una rampa. Dove l'immagine è uniforme il valore non cambia.", set: { nome: { t: 'media 3 × 3' }, o: { valori: D.f_media.map(String), toni: { 2: 'ok', 3: 'ok' } }, c: { t: 'pesi con somma 1: zona piatta invariata' } } },
        { nota: "<b>Sharpening</b> K₂ (9 al centro, −1 intorno, somma 1) = centro + 8·(centro − media dei vicini). Accanto al bordo il pixel scuro diventa più scuro (−27) e quello chiaro più chiaro (36): il bordo sembra più netto. Amplifica anche il rumore.", set: { nome: { t: 'sharpening K₂' }, o: { valori: D.f_sharp.map(String), toni: { 2: 'ok', 3: 'ok' } } } },
        { nota: "<b>Sobel x</b> ([[−1, 0, 1], [−2, 0, 2], [−1, 0, 1]], somma 0): risponde solo dove l'immagine <b>cambia</b> in orizzontale: 36 sul bordo, 0 altrove. Un filtro derivata dà 0 dove non cambia niente (settimana 8).", set: { nome: { t: 'Sobel x' }, o: { valori: D.f_sobel.map(String), toni: { 2: 'ok', 3: 'ok' } }, c: { t: 'somma 0: zona piatta → 0, bordo → valore grande' } } }
      ]
    };

    SCENE.incodice = {
      w: 640, h: 230, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [T('tf', 30, 52, 'f', { bold: true }), C('f', 100, 34, ['3', '3', '9', '3', '3', '6', '6', '6'], { cw: 48 }), T('ty', 30, 100, 'y', { bold: true }), C('y', 4, 114, Array(10).fill(''), { cw: 48, toni: {} }), T('c', 320, 200, '', { size: 12, bold: true })],
      passi: [
        { nota: "<code>np.convolve(f, np.ones(3) / 3, mode)</code>: la media mobile su 3 di un segnale lungo 8. Il <b>mode</b> decide quante uscite." },
        { nota: "<b>\"valid\"</b>: solo le posizioni dove il filtro sta tutto dentro il segnale: 8 − 3 + 1 = <b>6</b> uscite: [5, 5, 5, 4, 5, 6].", set: { y: { x: 148, valori: D.valid.map(v => String(v)).concat(['', '', '', '']), toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok', 5: 'ok' } }, c: { t: 'valid: 6 uscite' } } },
        { nota: "<b>\"full\"</b> (il default): il filtro parte e finisce a metà fuori, e i pezzi mancanti valgono 0. 8 + 3 − 1 = <b>10</b> uscite: le prime e le ultime sono più basse, perché metà finestra è zero.", set: { y: { x: 4, valori: D.full.map(v => String(v)), toni: { 0: 'spento', 1: 'spento', 2: 'ok', 3: 'ok', 4: 'ok', 5: 'ok', 6: 'ok', 7: 'ok', 8: 'spento', 9: 'spento' } }, c: { t: 'full: 10 uscite (bordi con zeri)' } } },
        { nota: "Gli altri strumenti: <code>gaussian_filter1d(px, sigma=2)</code> per lo sguardo (σ decide quanto si sfoca), <code>scipy.ndimage.convolve(image, G3)</code> in 2D con un filtro costruito a mano, <code>skimage.filters.gaussian(image, sigma=5)</code> già pronto.", set: { c: { t: 'gaussian_filter1d · ndimage.convolve · skimage gaussian' } } }
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
  <ul>
    <li>{{s|s013|}}</li>
    <li>{{s|s014|}}</li>
    <li>{{s|s015|}}</li>
  </ul>
  <div class="box attenzione" data-tit="{{a|s016|}}">
    <p>{{s|s017|}}</p>
  </div>
  <figure class="scena" data-scena="afiltra" data-titolo="{{a|s018|}}"></figure>
</section>

<section>
  <h2>{{s|s019|}}</h2>
  <figure class="scena" data-scena="media" data-titolo="{{a|s020|}}"></figure>
  <p class="piccolo">{{s|s021|}}</p>
  <figure class="passi" data-titolo="{{a|s022|}}">
    <div class="passo"><div class="espr">y₂ = <mark class="due">1/3</mark>·<mark class="dato">3</mark> + <mark class="due">1/3</mark>·<mark class="dato">9</mark> + <mark class="due">1/3</mark>·<mark class="dato">3</mark> = <mark class="ok">5</mark></div><p class="nota">{{s|s023|}}</p></div>
    <div class="passo"><div class="espr">y<sub>n</sub> = <mark class="due">h</mark> · [<mark class="dato">f<sub>n−1</sub>, f<sub>n</sub>, f<sub>n+1</sub></mark>]</div><p class="nota">{{s|s024|}}</p></div>
    <div class="passo"><div class="espr">media pesata:  h = [<mark class="due">1, 2, 1</mark>] / 4</div><p class="nota">{{s|s025|}}</p></div>
    <div class="passo"><div class="espr">Σ pesi = <mark class="ok">1</mark>  ⇒  una zona costante resta uguale</div><p class="nota">{{s|s026|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
  <figure class="passi" data-titolo="{{a|s029|}}">
    <div class="passo"><div class="espr">correlazione:  y<sub>n</sub> = Σ<sub>m</sub> h<sub>m</sub> · f<sub><mark class="ora">n + m</mark></sub></div><p class="nota">{{s|s030|}}</p></div>
    <div class="passo"><div class="espr">convoluzione:  y<sub>n</sub> = Σ<sub>m</sub> h<sub>m</sub> · f<sub><mark class="due">n − m</mark></sub></div><p class="nota">{{s|s031|}}</p></div>
    <div class="passo"><div class="espr">filtro simmetrico ([1, 2, 1], gaussiano, media):  <mark class="ok">stesso risultato</mark></div><p class="nota">{{s|s032|}}</p></div>
    <div class="passo"><div class="espr">gradino [1, 1, 1, 5, 5, 5] con [1, −1]:  convolve → <mark class="ok">+4</mark>,  correlate → <mark class="no">−4</mark></div><p class="nota">{{s|s033|}}</p><p class="nota">{{s|s034|}}</p></div>
  </figure>
  <div class="box regola" data-tit="{{a|s035|}}">
    <p>{{s|s036|}}</p>
  </div>
  <div class="box idea" data-tit="{{a|s037|}}">
    <p>{{s|s038|}}</p>
  </div>
  <figure class="scena" data-scena="convcorr" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <p>{{s|s041|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s042|}}</th><th>{{s|s043|}}</th><th>{{s|s044|}}</th><th>{{s|s045|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>1</td><td>{{s|s048|}}</td></tr>
      <tr><td>{{s|s049|}}</td><td>[[1, 2, 1], [2, 4, 2], [1, 2, 1]] / 16</td><td>1</td><td>{{s|s050|}}</td></tr>
      <tr><td>{{s|s051|}}</td><td>[1, 4, 6, 4, 1] ⊗ [1, 4, 6, 4, 1] / 256</td><td>1</td><td>{{s|s052|}}</td></tr>
      <tr><td>{{s|s053|}}</td><td>{{s|s054|}}</td><td>1</td><td>{{s|s055|}}</td></tr>
      <tr><td>{{s|s056|}}</td><td>[[−1, 0, 1], [−2, 0, 2], [−1, 0, 1]]</td><td>0</td><td>{{s|s057|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s058|}}</p>
  <figure class="passi" data-titolo="{{a|s059|}}">
    <div class="passo"><div class="espr">K₂ = 9·<mark class="ora">centro</mark> − 1·(<mark class="dato">8 vicini</mark>)</div><p class="nota">{{s|s060|}}</p></div>
    <div class="passo"><div class="espr">zona uniforme:  centro − media = <mark class="ok">0</mark>  ⇒  pixel invariato</div><p class="nota">{{s|s061|}}</p></div>
    <div class="passo"><div class="espr">vicino a un bordo:  centro − media ≠ 0  ⇒  <mark class="no">amplificato</mark></div><p class="nota">{{s|s062|}}</p></div>
  </figure>
  <div class="box regola" data-tit="{{a|s063|}}">
    <p>{{s|s064|}}</p>
  </div>
  <figure class="scena" data-scena="filtri2d" data-titolo="{{a|s065|}}"></figure>
</section>

<section>
  <h2>{{s|s066|}}</h2>
  <figure class="codice" data-titolo="{{a|s067|}}">
<pre data-lang="python">np.convolve(f, np.ones(3) / 3, "valid")          # 1D: [5, 5, 5, 4, 5, 6]
gaussian_filter1d(px, sigma=2)                    # 1D gaussiano (gaze)
scipy.ndimage.convolve(image, G3)                 # 2D, filtro costruito a mano
skimage.filters.gaussian(image, sigma=5)          # 2D gaussiano pronto</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="&quot;valid&quot;@ora"><p>{{s|s068|}}</p></li>
      <li data-righe="2" data-segna="sigma=2@due"><p>{{s|s069|}}</p></li>
      <li data-righe="3-4" data-segna="G3@due|sigma=5@due"><p>{{s|s070|}}</p></li>
    </ol>
  </figure>
  <div class="box esame" data-tit="{{a|s071|}}">
    <p>{{s|s072|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s073|}}">
    <p>{{s|s074|}}</p>
    <p>{{s|s075|}}</p>
  </div>
  <figure class="scena" data-scena="incodice" data-titolo="{{a|s076|}}"></figure>
</section>

</main>
</body>
</html>
