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
  const e1 = ['0.894', '1.145', '0.505', '0.991', '0.675'];
  const giro = k => ({
    nota: `{{j|s002|`}}`,
    set: {
      F: { toni: Object.fromEntries([0, 1, 2, 3, 4].map(i => [i, i === k ? 'ora' : 'dato'])) },
      E: { valori: e1.map((v, i) => i <= k ? v : ''), toni: Object.fromEntries([0, 1, 2, 3, 4].filter(i => i <= k).map(i => [i, i === k ? 'ora' : null]).filter(x => x[1])) }
    }
  });
  SCENE.kfold = {
    w: 520, h: 236, lato: false,
    legenda: '{{j|s003|'}}',
    oggetti: [
      { id: 't1', tipo: 'testo', x: 260, y: 30, t: '100 punti mescolati, 5 fold da 20', size: 13, bold: true },
      { id: 'F', tipo: 'celle', x: 40, y: 48, cw: 88, ch: 42, valori: ['fold 1', 'fold 2', 'fold 3', 'fold 4', 'fold 5'], indici: false },
      { id: 't2', tipo: 'testo', x: 260, y: 122, t: 'MSE di validazione (grado 1)', size: 13 },
      { id: 'E', tipo: 'celle', x: 40, y: 136, cw: 88, ch: 36, valori: ['', '', '', '', ''], indici: false },
      { id: 'n', tipo: 'testo', x: 260, y: 212, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: '{{j|s004|'}}' }
    ].concat([0, 1, 2, 3, 4].map(giro)).concat([
      { nota: '{{j|s005|'}}', set: { F: { toni: {} }, E: { toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok' } }, n: { t: 'grado 1:  0.842 ± 0.227', tono: 'ok' } } },
      { nota: '{{j|s006|'}}', set: { E: { toni: {} }, n: { t: 'grado 1: 0.842    grado 6: 1.012', tono: 'ok' } } }
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

    SCENE.treinsiemi = {
      w: 620, h: 230, lato: true,
      legenda: '{{j|s007|'}}',
      oggetti: [R('tr', 20, 50, 360, 44, 'training (60%)', { tono: 'dato' }), R('va', 380, 50, 110, 44, 'validation', { tono: 'due' }), R('te', 490, 50, 110, 44, 'test', { tono: 'ora' }),
        T('u1', 200, 120, '', { size: 12 }), T('u2', 435, 140, '', { size: 12 }), T('u3', 545, 120, '', { size: 12 }), T('c', 310, 200, '', { size: 12, bold: true })],
      passi: [
        { nota: "Tre insiemi, tre compiti, e la regola di quante volte li guardi." },
        { nota: "<b>Training</b>: si imparano i parametri w (minimi quadrati). Lo guardi quante volte vuoi.", set: { u1: { t: 'impara w (quante volte vuoi)' } } },
        { nota: "<b>Validation</b>: si sceglie il modello, cioè gli <b>iperparametri</b> che w non contiene: grado del polinomio, λ, feature. Una volta per candidato.", set: { u2: { t: 'sceglie grado, λ' } } },
        { nota: "<b>Test</b>: stima quanto funzionerà il modello finale su dati nuovi. <b>Una volta sola</b>, alla fine.", set: { u3: { t: '1 volta, alla fine' } } },
        { nota: "Se provi tanti modelli e tieni quello che va meglio sul test, il test è diventato un validation set: il risultato è troppo ottimista. Con un solo split (hold-out, 80/20) il numero dipende da quale split è capitato: per questo esiste la k-fold.", set: { te: { tono: 'no' }, c: { t: 'scegliere sul test = stima troppo ottimista', tono: 'no' } } }
      ]
    };

    const ogr = [{ id: 'ax', tipo: 'assi', box: [40, 20, 300, 200], dom: [0.5, 4.5, 0, 5], tacche: 1, etX: 'i', etY: 'y' }];
    [1, 2, 3, 4].forEach((y, i) => ogr.push(P('y' + i, i + 1, y, '', { tono: 'dato', r: 5 }), P('p' + i, i + 1, y, '', { tono: 'ora', r: 5, nascosto: true })));
    ogr.push(L('m', 0.5, 2.5, 4.5, 2.5, { tratt: true, tono: 'spento' }), T('c', 500, 60, '', { size: 12 }), T('c2', 500, 90, '', { size: 12 }), T('c3', 500, 130, '', { size: 14, bold: true }));
    const prev = (ps, r2, tono, t1) => Object.assign(Object.fromEntries(ps.map((p, i) => ['p' + i, { nascosto: false, y: p }])), { c2: { t: t1 }, c3: { t: 'R² = ' + r2, tono } });
    SCENE.r2 = {
      w: 640, h: 250, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: ogr,
      passi: [
        { nota: "<b>R² = 1 − Σ(yᵢ − f(xᵢ))² / Σ(yᵢ − ȳ)²</b>. Sopra: l'errore del modello. Sotto: l'errore di chi prevede sempre la media. y = [1, 2, 3, 4], ȳ = 2.5, Σ(yᵢ − ȳ)² = 5.", set: { c: { t: 'Σ(y − ȳ)² = 5' } } },
        { nota: "Previsioni [1.1, 1.9, 3.2, 3.8]: errore 0.01 + 0.01 + 0.04 + 0.04 = 0.10. R² = 1 − 0.10/5 = <b>0.98</b>: quasi perfetto.", set: prev([1.1, 1.9, 3.2, 3.8], '0.98', 'ok', 'Σ errori² = 0.10') },
        { nota: "Previsioni sempre 2.5 (la media): errore uguale a quello di riferimento. R² = <b>0</b>: non meglio della media.", set: prev([2.5, 2.5, 2.5, 2.5], '0', null, 'Σ errori² = 5') },
        { nota: "Previsioni [4, 3, 2, 1]: errore 9 + 1 + 1 + 9 = 20. R² = 1 − 20/5 = <b>−3</b>: peggio della media (valori da sklearn r2_score). Un R² negativo sul validation è il segno più chiaro di overfitting (nel tutorial: −0.36, −1076…).", set: prev([4, 3, 2, 1], '−3', 'no', 'Σ errori² = 20') }
      ]
    };

    const ogk = [{ id: 'ax', tipo: 'assi', box: [40, 20, 380, 230], dom: [D.tr[0][0] - 0.02, D.tr[D.tr.length - 1][0] + 0.02, -2.4, 2.4], tacche: [0.2, 1], etX: 'x', etY: 'y' },
      curva('r0', D['r0.0'], 'no', { nascosto: true }), curva('r1', D['r0.001'], 'ok', { nascosto: true }), curva('r2', D['r1.0'], 'due', { nascosto: true })]
      .concat(D.tr.map(([x, y], i) => P('t' + i, x, y, '', { tono: 'dato' })), [T('c', 545, 60, '', { size: 12, bold: true }), T('c2', 545, 90, '', { size: 12 }), T('c3', 545, 115, '', { size: 12 }), T('c4', 545, 160, '', { size: 12 })]);
    const rid = (k, lab, tono) => ({ c: { t: lab, tono }, c2: { t: '‖w‖ = ' + D['rn' + k] }, c3: { t: 'MSE train ' + D['rm' + k][0] + ' · test ' + D['rm' + k][1] } });
    SCENE.ridge = {
      w: 660, h: 280, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: ogk,
      passi: [
        { nota: "<b>Ridge</b>: J(w) = ‖y − Φw‖² + λ‖w‖². Sbagliare sui dati costa, ma anche avere pesi grandi. Soluzione: <b>(ΦᵀΦ + λI) w = Φᵀy</b>, λ sulla diagonale. Polinomio di grado 9 sugli stessi 12 punti (calcolato con NumPy)." },
        { nota: "<b>λ = 0</b>: minimi quadrati puri. Pesi enormi, curva che oscilla fra i punti: overfitting.", set: Object.assign({ r0: { nascosto: false } }, rid('0.0', 'λ = 0', 'no')) },
        { nota: "<b>λ = 0.001</b>: i pesi vengono schiacciati (‖w‖ crolla), la curva si calma e il test scende di molto.", set: Object.assign({ r0: { nascosto: true }, r1: { nascosto: false } }, rid('0.001', 'λ = 0.001', 'ok')) },
        { nota: "<b>λ = 1</b>: troppo. Pesi così piccoli che la curva non segue più l'onda: bias. Il training sale e il test risale.", set: Object.assign({ r1: { nascosto: true }, r2: { nascosto: false } }, rid('1.0', 'λ = 1', 'due')) },
        { nota: "λ piccolo → libertà (varianza), λ grande → pesi verso 0 (bias). λ è un <b>iperparametro</b>: si sceglie con il validation set o la cross-validation. In più, con λ &gt; 0 la matrice ΦᵀΦ + λI è sempre invertibile: anche 3 pesi per 2 punti hanno una soluzione unica.", set: { c4: { t: 'λ si sceglie sul validation' } } }
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
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s013|}}</th><th>{{s|s014|}}</th><th>{{s|s015|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s016|}}</td><td>{{s|s017|}}</td><td>{{s|s018|}}</td></tr>
      <tr><td>{{s|s019|}}</td><td>{{s|s020|}}</td><td>{{s|s021|}}</td></tr>
      <tr><td>{{s|s022|}}</td><td>{{s|s023|}}</td><td>{{s|s024|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box attenzione" data-tit="{{a|s025|}}">
    <p>{{s|s026|}}</p>
  </div>
  <p>{{s|s027|}}</p>
  <figure class="scena" data-scena="treinsiemi" data-titolo="{{a|s028|}}"></figure>
</section>

<section>
  <h2>{{s|s029|}}</h2>
  <figure class="scena" data-scena="kfold" data-titolo="{{a|s030|}}"></figure>
  <p class="piccolo">{{s|s031|}}</p>
  <figure class="passi" data-titolo="{{a|s032|}}">
    <div class="passo"><div class="espr">validazione = N / K     training = (K − 1) / K · N</div><p class="nota">{{s|s033|}}</p></div>
    <div class="passo"><div class="espr">K = 2: 50 / 50    K = 5: <mark class="dato">80</mark> / <mark class="ora">20</mark>    K = 10: 90 / 10    K = 100: 99 / 1</div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">K = N: <mark class="ok">leave-one-out</mark></div><p class="nota">{{s|s035|}}</p></div>
  </figure>
  <div class="box attenzione" data-tit="{{a|s036|}}">
    <p>{{s|s037|}}</p>
  </div>
  <ul>
    <li>{{s|s038|}}</li>
    <li>{{s|s039|}}</li>
  </ul>
  <figure class="codice" data-titolo="{{a|s040|}}">
<pre data-lang="python">model = Pipeline([
    ("features", PolynomialFeatures(2)),
    ("model", LinearRegression()),
])
kfold = KFold(n_splits=5, shuffle=True)
results = cross_validate(model, X, y, cv=kfold,
                         scoring="r2", return_train_score=True)
results["test_score"].mean()</pre>
    <ol class="spiega">
      <li data-righe="1-4" data-segna="Pipeline@ora|PolynomialFeatures(2)@dato"><p>{{s|s041|}}</p></li>
      <li data-righe="5" data-segna="shuffle=True@ora"><p>{{s|s042|}}</p></li>
      <li data-righe="6-8" data-segna="test_score@ok|return_train_score=True@dato"><p>{{s|s043|}}</p></li>
    </ol>
  </figure>
  <div class="box attenzione" data-tit="{{a|s044|}}">
    <p>{{s|s045|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s046|}}</h2>
  <div class="box regola" data-tit="{{a|s047|}}">
    <p>{{s|s048|}}</p>
  </div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s049|}}</th><th>R²</th><th>{{s|s050|}}</th></tr></thead>
    <tbody>
      <tr><td>[1.1, 1.9, 3.2, 3.8]</td><td>0.98</td><td>{{s|s051|}}</td></tr>
      <tr><td>{{s|s052|}}</td><td>0</td><td>{{s|s053|}}</td></tr>
      <tr><td>[4, 3, 2, 1]</td><td>−3</td><td>{{s|s054|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s055|}}</p>
  <figure class="scena" data-scena="r2" data-titolo="{{a|s056|}}"></figure>
</section>

<section>
  <h2>{{s|s057|}}</h2>
  <figure class="passi" data-titolo="{{a|s058|}}">
    <div class="passo"><div class="espr">J(w) = <mark class="dato">‖y − Φw‖²</mark> + <mark class="ora">λ</mark><mark class="due">‖w‖²</mark></div><p class="nota">{{s|s059|}}</p></div>
    <div class="passo"><div class="espr">∇J = −2Φᵀ(y − Φw) + 2λw = 0</div><p class="nota">{{s|s060|}}</p></div>
    <div class="passo"><div class="espr">(ΦᵀΦ + <mark class="ora">λI</mark>) w = Φᵀy   ⇒   <mark class="ok">w = (ΦᵀΦ + λI)⁻¹ Φᵀy</mark></div><p class="nota">{{s|s061|}}</p></div>
    <div class="passo"><div class="espr">λ piccolo → modello libero (<mark class="due">varianza</mark>);  λ grande → pesi schiacciati verso 0 (<mark class="ora">bias</mark>)</div><p class="nota">{{s|s062|}}</p></div>
  </figure>
  <figure class="codice" data-titolo="{{a|s063|}}">
<pre data-lang="python">def ridge(Phi, y, lam):
    d = Phi.shape[1]
    return np.linalg.solve(Phi.T @ Phi + lam * np.eye(d), Phi.T @ y)</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="Phi.shape[1]@dato"><p>{{s|s064|}}</p></li>
      <li data-righe="3" data-segna="lam * np.eye(d)@ora|np.linalg.solve@ok"><p>{{s|s065|}}</p></li>
    </ol>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s066|}}</th><th>λ = 0</th><th>10⁻⁴</th><th>0.01</th><th>1</th><th>100</th></tr></thead>
    <tbody>
      <tr><td>{{s|s067|}}</td><td>0.715</td><td>0.729</td><td>0.740</td><td>1.021</td><td>16.15</td></tr>
      <tr><td>{{s|s068|}}</td><td>3021</td><td>4.245</td><td><b>0.951</b></td><td>6.290</td><td>86.44</td></tr>
      <tr><td>‖w‖</td><td>7778</td><td>40.6</td><td>13.2</td><td>9.7</td><td>2.4</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s069|}}</p>
  <div class="box idea" data-tit="{{a|s070|}}">
    <p>{{s|s071|}}</p>
  </div>
  <figure class="scena" data-scena="ridge" data-titolo="{{a|s072|}}"></figure>
</section>

</main>
</body>
</html>
