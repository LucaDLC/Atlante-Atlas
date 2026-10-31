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
  const N = [
    ['fr', 70, 70, 'frame', 'immagine'], ['so', 190, 70, 'soglia', 'threshold'], ['bo', 310, 70, 'bordi', 'Canny'],
    ['co', 430, 70, 'contorni', 'findContours'], ['el', 550, 70, 'ellisse', 'fitEllipse'],
    ['ce', 550, 215, 'centro', '(px, py)'], ['me', 430, 215, 'media', '9 × 2'], ['fw', 310, 215, 'f_w', 'lstsq'],
    ['sg', 190, 215, 'sguardo', "(x', y')"], ['er', 70, 215, 'errori', 'MAE, RMSE']
  ];
  const ogg = N.map(([id, x, y, t, s]) => ({ id, tipo: 'nodo', forma: 'quadrato', r: 34, x, y, t, sotto: s }));
  for (let i = 0; i + 1 < N.length; i++) ogg.push({ id: 'a' + i, tipo: 'arco', da: N[i][0], a: N[i + 1][0], dir: true });
  ogg.push({ id: 'f1', tipo: 'testo', x: 310, y: 14, t: 'estrarre la feature (preprocessing)', size: 13, bold: true });
  ogg.push({ id: 'f2', tipo: 'testo', x: 310, y: 290, t: 'imparare e valutare il modello', size: 13, bold: true });
  const ids = N.map(n => n[0]);
  const fino = k => Object.fromEntries(ids.map((id, i) => [id, { tono: i < k ? 'ok' : i === k ? 'ora' : null }]));
  const note = [
    'Ogni <b>frame</b> del video è un\'immagine in scala di grigi. Si ritaglia un riquadro attorno all\'occhio (<code>x_top, y_top, x_bottom, y_bottom</code>): la testa era ferma, quindi lo stesso riquadro vale per tutti i frame.',
    '<b>Soglia</b> (threshold): i pixel più chiari di <code>threshold_value</code> diventano bianchi, gli altri neri. La pupilla è la zona più scura. Il valore va regolato per ogni dataset: luce e occhi cambiano.',
    '<b>Canny</b> trova i bordi: i punti dove l\'intensità cambia di colpo. Sono derivate dell\'immagine, le vedrai come filtri nelle settimane 7–8.',
    '<b>findContours</b> unisce i punti di bordo in curve. I contorni con meno di 50 punti si scartano.',
    '<b>fitEllipse</b> adatta un\'ellisse ai contorni, dal più lungo; si tiene la prima che passa il controllo sul rapporto tra gli assi.',
    'Il <b>centro</b> dell\'ellisse, riportato nelle coordinate dell\'immagine intera, è la <b>feature</b>: due numeri (px, py) per frame, salvati in <code>pupil_coordinates.csv</code>.',
    'Per ogni target sullo schermo si prende il centro pupilla <b>medio</b> dei suoi frame. Griglia: 9 target ⇒ una matrice <b>9 × 2</b>. Sono gli input del training.',
    'Il modello <b>f<sub>w</sub></b> impara la funzione pupilla → schermo dalle 9 coppie (pupilla, target), con i minimi quadrati.',
    'Per un frame nuovo: centro pupilla → f<sub>w</sub> → punto stimato sullo schermo <b>(x\', y\')</b>.',
    'Si confronta la stima con il target vero, in pixel: <b>MAE</b>, <b>RMSE</b>, distanza media. È la valutazione del Task 4.'
  ];
  SCENE.pipeline = {
    w: 620, h: 300, lato: false,
    legenda: '{{j|s002|'}}',
    oggetti: ogg,
    passi: [{ nota: '{{j|s003|'}}' }]
      .concat(note.map((n, k) => ({ nota: n, set: fino(k) })))
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

    SCENE.affine = {
      w: 560, h: 260, lato: true,
      legenda: '{{j|s004|'}}',
      oggetti: [R('cam', 20, 60, 140, 110, '', { tono: 'spento' }), T('camt', 90, 50, 'pupilla (≈ 33 px)', { size: 12 }), R('scr', 300, 30, 240, 160, '', { tono: 'spento' }), T('scrt', 420, 22, 'schermo (1720 px fra i target)', { size: 12 }),
        { id: 'pp', tipo: 'nodo', x: 120, y: 100, t: '', r: 6, tono: 'dato' }, { id: 'sp', tipo: 'nodo', x: 340, y: 70, t: '', r: 8, tono: 'due', nascosto: true },
        { id: 'fr', tipo: 'vett', x1: 165, y1: 110, x2: 295, y2: 110, t: '', nascosto: true },
        T('e1', 280, 215, '', { size: 12, bold: true }), T('e2', 280, 240, '', { size: 12 })],
      passi: [
        { nota: "Il problema: dalla posizione della pupilla nell'immagine (x, y) stimare il punto guardato sullo schermo (x', y')." },
        { nota: "Modello affine: <code>x' = a·x + b·y + c</code> e <code>y' = d·x + e·y + f</code>. Tutte e due le coordinate della pupilla servono per tutte e due quelle dello schermo: 6 parametri.", set: { fr: { nascosto: false }, sp: { nascosto: false }, e1: { t: "x' = a·x + b·y + c,   y' = d·x + e·y + f" } } },
        { nota: "Due modelli separati con lo <b>stesso input</b>: w₁ = [a, b, c] per x', w₂ = [d, e, f] per y'. Ogni punto dà la riga [xᵢ, yᵢ, 1]; l'1 moltiplica c, la traslazione (per questo \"affine\").", set: { e2: { t: 'riga i: [xᵢ, yᵢ, 1] · w₁ = x\'ᵢ' } } },
        { nota: "Con i 9 punti della griglia: A (9 × 3) · w₁ = b (9). Sovradeterminato: minimi quadrati con <code>np.linalg.lstsq</code>. Pesi trovati: a ≈ −49.3. Il segno meno: l'occhio è <b>specchiato</b> nell'immagine; la grandezza: 1 px di pupilla ≈ 49 px di schermo.", set: { pp: { x: 60 }, sp: { x: 500 }, e1: { t: 'a ≈ −49: pupilla a destra ⇒ sguardo a sinistra' }, e2: { t: '1 px di errore sulla pupilla ≈ 50 px sullo schermo' } } },
        { nota: "Servono almeno 3 punti <b>non allineati</b>: con 3 punti su una retta le righe [x, y, 1] sono dipendenti e A ha rango 2 (verificato). E il modello amplifica ogni imprecisione del preprocessing: l'assignment avvisa di errori di ±200 px." }
      ]
    };

    const cell = (id, x, y, t, tono) => R(id, x, y, 50, 22, t, { tono });
    const og = [T('hp', 70, 24, 'pupils (N × 2)', { size: 12, bold: true }), T('ha', 260, 24, 'A = np.c_[x, y, 1]', { size: 12, bold: true }), T('hw', 440, 24, 'pesi', { size: 12, bold: true })];
    for (let i = 0; i < 5; i++) {
      og.push(cell('px' + i, 20, 36 + i * 26, 'x' + (i + 1), 'dato'), cell('py' + i, 72, 36 + i * 26, 'y' + (i + 1), 'dato'));
      og.push(cell('ax' + i, 180, 36 + i * 26, 'x' + (i + 1), 'spento'), cell('ay' + i, 232, 36 + i * 26, 'y' + (i + 1), 'spento'), cell('a1' + i, 284, 36 + i * 26, '1', 'spento'));
    }
    og.push(R('wx', 400, 50, 140, 30, 'wx = [a, b, c]', { tono: 'spento', nascosto: true }), R('wy', 400, 90, 140, 30, 'wy = [d, e, f]', { tono: 'spento', nascosto: true }), R('pr', 400, 140, 140, 30, 'pred: N × 2', { tono: 'ok', nascosto: true }), T('c', 280, 200, '', { size: 12 }), T('c2', 280, 226, '', { size: 12 }));
    const tutte = (pref, tono) => Object.fromEntries([0, 1, 2, 3, 4].map(i => [pref + i, { tono }]));
    SCENE.codicegaze = {
      w: 560, h: 240, lato: true,
      legenda: '{{j|s005|'}}',
      oggetti: og,
      passi: [
        { nota: "<code>get_design_matrix(pupils)</code>: da N × 2 (x e y della pupilla) a N × 3. Una riga per punto (qui 5 righe per esempio; la griglia ne ha 9)." },
        { nota: "<code>np.c_[pupils[:, 0], pupils[:, 1], np.ones(len(pupils))]</code> affianca tre colonne: tutte le x, tutte le y, una colonna di 1.", set: Object.assign(tutte('ax', 'dato'), tutte('ay', 'dato'), tutte('a1', 'ora')) },
        { nota: "Due sistemi con la <b>stessa</b> A e due vettori b diversi (le x' e le y' dei target). <code>lstsq</code> restituisce 4 cose; <code>[0]</code> prende i pesi.", set: { wx: { nascosto: false, tono: 'due' }, wy: { nascosto: false, tono: 'due' }, c: { t: 'wx = lstsq(A, screen[:, 0])[0]' } } },
        { nota: "Per prevedere: la design matrix dei punti nuovi con la stessa funzione, poi <code>B @ wx</code> e <code>B @ wy</code>: (N × 3)(3) → N previsioni per coordinata, affiancate in N × 2.", set: { pr: { nascosto: false }, c2: { t: 'pred = np.c_[B @ wx, B @ wy]', tono: 'ok' } } }
      ]
    };

    const E = [[10, 0], [0, 10], [-10, 0], [30, 40]];
    const ogv = [{ id: 'ax', tipo: 'assi', box: [40, 20, 260, 200], dom: [-15, 45, -15, 45], tacche: 10, etX: 'errore x', etY: 'errore y' }];
    E.forEach(([x, y], i) => ogv.push(V('e' + i, 0, 0, x, y, '', { tono: i === 3 ? 'no' : 'dato' })));
    ogv.push(T('c', 440, 50, '', { size: 12 }), T('c2', 440, 80, '', { size: 12 }), T('c3', 440, 110, '', { size: 12 }), T('c4', 440, 150, '', { size: 12, bold: true }), T('c5', 280, 266, '', { size: 12 }));
    SCENE.valutagaze = {
      w: 560, h: 280, lato: true,
      legenda: '{{j|s006|'}}',
      oggetti: ogv,
      passi: [
        { nota: "Quattro previsioni, con gli errori (stima − target) disegnati come vettori: (10, 0), (0, 10), (−10, 0), (30, 40)." },
        { nota: "<b>MAE per coordinata</b>: la media dei valori assoluti, colonna per colonna. x: (10 + 0 + 10 + 30)/4 = 12.5; y: (0 + 10 + 0 + 40)/4 = 12.5.", set: { c: { t: 'MAE = [12.5, 12.5]' } } },
        { nota: "<b>Distanza</b> di ogni punto (norma della riga): 10, 10, 10, 50. La media: <b>20</b> px, \"di quanti pixel sbaglio in media\".", set: { c2: { t: 'distanze: 10, 10, 10, 50' }, c3: { t: 'distanza media = 20' } } },
        { nota: "<b>RMSE</b> = √(media dei quadrati) = √((100 + 100 + 100 + 2500)/4) = √700 ≈ <b>26.5</b>. I quadrati pesano di più l'errore grande: RMSE ≥ distanza media, sempre.", set: { c4: { t: 'RMSE ≈ 26.5 ≥ 20', tono: 'no' } } },
        { nota: "I risultati veri dell'assignment (modello affine, distanza media): grid 62 (ma è il training!), circle 124, line 362, random 411. Su line l'errore medio con segno è x −338: tutte le stime spostate dalla stessa parte. Errore <b>sistematico</b>: la testa si è mossa tra calibrazione e test.", set: { c5: { t: 'grid 62 · circle 124 · line 362 · random 411' } } }
      ]
    };

    const cols = ['x²', 'y²', 'xy', 'x', 'y', '1'], ord = ['1', 'x', 'y', 'xy', 'x²', 'y²'];
    const ogq = [T('ha', 280, 24, 'design matrix del Task 20: colonne', { size: 12, bold: true }), T('hb', 280, 104, 'quad() usa i pesi nell’ordine', { size: 12, bold: true, nascosto: true })];
    cols.forEach((c, i) => ogq.push(R('c' + i, 40 + i * 82, 36, 74, 34, c, { tono: 'dato' }), R('w' + i, 40 + i * 82, 116, 74, 34, ord[i], { tono: 'spento', nascosto: true })));
    ogq.push(T('e', 280, 190, '', { size: 12, bold: true }), T('e2', 280, 220, '', { size: 12 }));
    SCENE.quadratico = {
      w: 560, h: 240, lato: true,
      legenda: '{{j|s007|'}}',
      oggetti: ogq,
      passi: [
        { nota: "Modello quadratico: <code>f(x, y) = ax² + by² + cxy + dx + ey + f</code>. Curvo in x e y, ma ancora <b>lineare nei pesi</b>: stessi minimi quadrati, con una riga [xᵢ², yᵢ², xᵢyᵢ, xᵢ, yᵢ, 1]." },
        { nota: "6 parametri per coordinata ⇒ almeno 6 punti; la griglia ne ha 9. Restano solo 3 equazioni \"in più\" per mediare il rumore: il modello segue anche il rumore (grid 62 → 26, ma circle 124 → 150: overfitting).", set: { e: { t: '6 pesi, 9 punti: poco margine' } } },
        { nota: "Errore vero trovato nel notebook: la funzione <code>quad</code> usa i pesi nell'ordine [1, x, y, xy, x², y²], la design matrix nell'ordine [x², y², xy, x, y, 1]. Ogni peso finisce sulla colonna sbagliata.", set: Object.assign({ hb: { nascosto: false } }, Object.fromEntries(ord.map((_, i) => ['w' + i, { nascosto: false, tono: 'no' }]))) },
        { nota: "Nessun errore di Python, ma la stima per il primo punto della griglia è <b>2.5 · 10⁹ px</b> (vero: 100 px; verificato). Regola: l'ordine delle colonne della design matrix deve essere lo stesso dei pesi in ogni funzione che li usa.", set: { e: { t: 'stima: 2.5 · 10⁹ px invece di 100', tono: 'no' }, e2: { t: 'stesso ordine di colonne ovunque' } } }
      ]
    };

    SCENE.normalizza = {
      w: 560, h: 250, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [T('a', 140, 30, 'colonne di A', { bold: true, size: 12 }), R('r1', 20, 44, 240, 30, 'pupilla x ≈ 280–330', { tono: 'dato' }), R('r2', 20, 80, 240, 30, 'x² ≈ 100 000', { tono: 'dato' }), R('r3', 20, 116, 240, 30, '1', { tono: 'dato' }),
        T('c', 410, 40, '', { size: 12 }), T('c2', 410, 70, '', { size: 12 }), T('c3', 410, 110, '', { size: 12 }), T('c4', 280, 190, '', { size: 12, bold: true }), T('c5', 280, 220, '', { size: 12 })],
      passi: [
        { nota: "Colonne di grandezze molto diverse (pupilla ≈ 300, x² ≈ 100 000, la colonna di 1): la matrice è <b>mal condizionata</b>, i conti perdono cifre." },
        { nota: "Normalizzazione min-max: x̃ = (x − min) / (max − min), tutto tra 0 e 1. Numero di condizionamento di A: affine 1.4 · 10⁴ → 4.2; quadratico 1.9 · 10⁸ → 22.8. Conti più stabili.", set: { r1: { t: 'x̃ in [0, 1]', tono: 'ok' }, r2: { t: 'x̃² in [0, 1]', tono: 'ok' }, c: { t: 'cond(A): 1.4·10⁴ → 4.2' }, c2: { t: 'quadratico: 1.9·10⁸ → 22.8' } } },
        { nota: "Le previsioni restano <b>identiche</b> (scarto 10⁻¹¹ px): normalizzare è un cambio di variabile affine, e un modello affine (o quadratico) nelle variabili nuove lo è anche in quelle vecchie.", set: { c3: { t: 'previsioni identiche', tono: 'ok' } } },
        { nota: "Trappola: rifare lo scaler sui dati di <b>test</b> sembra migliorare (line 362 → 303, random 411 → 141), ma usa il minimo e il massimo dei punti di test, che nella realtà non avresti. È <b>data leakage</b>. Lo scaler si fitta solo sul training; le previsioni si riportano in pixel (inverse_transform) prima di confrontarle.", set: { c4: { t: 'scaler fittato sul test = data leakage', tono: 'no' }, c5: { t: 'fit sul training, transform su tutto' } } }
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
  <ul>
    <li>{{s|s012|}}</li>
    <li>{{s|s013|}}</li>
    <li>{{s|s014|}}</li>
  </ul>
  <figure class="scena" data-scena="pipeline" data-titolo="{{a|s015|}}"></figure>
  <div class="box esame" data-tit="{{a|s016|}}">
    <p>{{s|s017|}}</p>
  </div>
  <div class="box idea" data-tit="{{a|s018|}}">
    <p>{{s|s019|}}</p>
    <ul>
      <li>{{s|s020|}}</li>
      <li>{{s|s021|}}</li>
      <li>{{s|s022|}}</li>
    </ul>
  </div>
  <div class="box idea" data-tit="{{a|s023|}}">
    <p>{{s|s024|}}</p>
    <ol>
      <li>{{s|s025|}}</li>
      <li>{{s|s026|}}</li>
      <li>{{s|s027|}}</li>
      <li>{{s|s028|}}</li>
      <li>{{s|s029|}}</li>
    </ol>
    <p>{{s|s030|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s031|}}</h2>
  <figure class="passi" data-titolo="{{a|s032|}}">
    <div class="passo"><div class="espr">x' = <mark class="ora">a</mark>·<mark class="dato">x</mark> + <mark class="ora">b</mark>·<mark class="dato">y</mark> + <mark class="ora">c</mark>      y' = <mark class="ora">d</mark>·<mark class="dato">x</mark> + <mark class="ora">e</mark>·<mark class="dato">y</mark> + <mark class="ora">f</mark></div><p class="nota">{{s|s033|}}</p></div>
    <div class="passo"><div class="espr">due modelli separati:  w₁ = [<mark class="ora">a, b, c</mark>] per x',   w₂ = [<mark class="ora">d, e, f</mark>] per y'</div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">punto i  →  riga [<mark class="dato">xᵢ, yᵢ, 1</mark>]    con   [xᵢ, yᵢ, 1] · w₁ = <mark class="ok">x'ᵢ</mark></div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">A</mark> (9 × 3) · <mark class="ora">w₁</mark> (3) = <mark class="ok">b</mark> (9)</div><p class="nota">{{s|s036|}}</p></div>
  </figure>
  <div class="box regola" data-tit="{{a|s037|}}">
    <p>{{s|s038|}}</p>
  </div>
  <figure class="scena" data-scena="affine" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <figure class="codice" data-titolo="{{a|s041|}}">
<pre data-lang="python">def get_design_matrix(pupils):             # pupils: N × 2
    return np.c_[pupils[:, 0], pupils[:, 1], np.ones(len(pupils))]

A = get_design_matrix(pupils_train)        # 9 × 3
wx = np.linalg.lstsq(A, screen_train[:, 0], rcond=None)[0]   # [a, b, c]
wy = np.linalg.lstsq(A, screen_train[:, 1], rcond=None)[0]   # [d, e, f]

B = get_design_matrix(pupils_test)         # N × 3
pred = np.c_[B @ wx, B @ wy]               # N × 2</pre>
    <ol class="spiega">
      <li data-righe="1-2" data-segna="pupils[:, 0]@dato|pupils[:, 1]@dato|np.ones(len(pupils))@ora"><p>{{s|s042|}}</p></li>
      <li data-righe="4-6" data-segna="screen_train[:, 0]@ok|screen_train[:, 1]@ok|[0]#2@ora"><p>{{s|s043|}}</p></li>
      <li data-righe="8-9" data-segna="B @ wx@ok|B @ wy@ok"><p>{{s|s044|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s045|}}">
    <div class="passo"><div class="espr">w₁ ≈ [<mark class="ora">−49.3</mark>, −2.5, 16410.8]    w₂ ≈ [2.2, <mark class="ora">44.2</mark>, −10070.7]</div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr">a ≈ −49:  pupilla <mark class="dato">+1 px</mark> a destra  ⇒  sguardo <mark class="no">≈ 49 px</mark> a sinistra</div><p class="nota">{{s|s047|}}</p></div>
    <div class="passo"><div class="espr">errore di <mark class="dato">1 px</mark> sul centro pupilla  ⇒  <mark class="no">~50 px</mark> sullo schermo</div><p class="nota">{{s|s048|}}</p></div>
  </figure>
  <figure class="scena" data-scena="codicegaze" data-titolo="{{a|s049|}}"></figure>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <figure class="codice" data-titolo="{{a|s051|}}">
<pre data-lang="python">err = np.abs(pred - truth)                  # N × 2
mae = err.mean(axis=0)                      # [MAE_x, MAE_y]
d = np.linalg.norm(pred - truth, axis=1)    # distanza di ogni punto
dist = d.mean()
rmse = np.sqrt(np.mean(d ** 2))</pre>
    <ol class="spiega">
      <li data-righe="1-2" data-segna="np.abs@ora|axis=0@ora"><p>{{s|s052|}}</p></li>
      <li data-righe="3-4" data-segna="axis=1@due"><p>{{s|s053|}}</p></li>
      <li data-righe="5" data-segna="d ** 2@no|np.sqrt@ok"><p>{{s|s054|}}</p></li>
    </ol>
  </figure>
  <p class="piccolo">{{s|s055|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s056|}}</th><th>{{s|s057|}}</th><th>{{s|s058|}}</th><th>{{s|s059|}}</th><th>{{s|s060|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s061|}}</td><td>62.4</td><td>68.1</td><td><b>25.8</b></td><td><b>29.1</b></td></tr>
      <tr><td>{{s|s062|}}</td><td><b>123.6</b></td><td><b>136.7</b></td><td>149.6</td><td>165.0</td></tr>
      <tr><td>{{s|s063|}}</td><td>362.4</td><td>381.3</td><td>384.7</td><td>392.0</td></tr>
      <tr><td>{{s|s064|}}</td><td>410.9</td><td>461.6</td><td>409.2</td><td>433.3</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s065|}}</p>
  <div class="box attenzione" data-tit="{{a|s066|}}">
    <p>{{s|s067|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s068|}}">
    <div class="passo"><div class="espr">grid: errore più basso, ma è <mark class="no">training</mark></div><p class="nota">{{s|s069|}}</p></div>
    <div class="passo"><div class="espr">quadratico: grid 62 → <mark class="ok">26</mark>,  circle 124 → <mark class="no">150</mark></div><p class="nota">{{s|s070|}}</p></div>
    <div class="passo"><div class="espr">line: target (100, 540) → pupilla x = 318.1 nella griglia, <mark class="no">329.4</mark> nella registrazione line</div><p class="nota">{{s|s071|}}</p></div>
    <div class="passo"><div class="espr">errore medio con segno su line:  x <mark class="no">−338</mark>, y +123</div><p class="nota">{{s|s072|}}</p></div>
  </figure>
  <div class="box esame" data-tit="{{a|s073|}}">
    <p>{{s|s074|}}</p>
  </div>
  <div class="box regola" data-tit="{{a|s075|}}">
    <p>{{s|s076|}}</p>
    <p>{{s|s077|}}</p>
    <p>{{s|s078|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s079|}}">
    <p>{{s|s080|}}</p>
    <p>{{s|s081|}}</p>
  </div>
  <figure class="scena" data-scena="valutagaze" data-titolo="{{a|s082|}}"></figure>
</section>

<section>
  <h2>{{s|s083|}}</h2>
  <figure class="passi" data-titolo="{{a|s084|}}">
    <div class="passo"><div class="espr">f(x, y) = <mark class="ora">a</mark>x² + <mark class="ora">b</mark>y² + <mark class="ora">c</mark>xy + <mark class="ora">d</mark>x + <mark class="ora">e</mark>y + <mark class="ora">f</mark></div><p class="nota">{{s|s085|}}</p></div>
    <div class="passo"><div class="espr">riga i = [<mark class="dato">xᵢ², yᵢ², xᵢyᵢ, xᵢ, yᵢ, 1</mark>]</div><p class="nota">{{s|s086|}}</p></div>
    <div class="passo"><div class="espr">6 parametri per coordinata  ⇒  almeno <mark class="ok">6 punti</mark>;  la griglia ne ha 9</div><p class="nota">{{s|s087|}}</p></div>
  </figure>
  <div class="errori">
    <div class="errore">
<pre data-lang="python">A = get_design_matrix_quad(pupils)     # colonne [x², y², xy, x, y, 1]
w = np.linalg.lstsq(A, targets, rcond=None)[0]
quad(w, pupil)   # param[0] + param[1]*x + param[2]*y + param[3]*x*y + ...</pre>
<pre class="msg">stima per il primo punto della griglia: 2.5e9 px   (vero: 100 px)</pre>
      <div class="fix"><p>{{s|s088|}}</p></div>
    </div>
  </div>
  <figure class="scena" data-scena="quadratico" data-titolo="{{a|s089|}}"></figure>
</section>

<section>
  <h2>{{s|s090|}}</h2>
  <figure class="passi" data-titolo="{{a|s091|}}">
    <div class="passo"><div class="espr">pupille ≈ 280–330,  schermo 100–1820,  x² ≈ 100 000</div><p class="nota">{{s|s092|}}</p></div>
    <div class="passo"><div class="espr">condizionamento di A:  affine 1.4·10⁴ → <mark class="ok">4.2</mark>,  quadratico 1.9·10⁸ → <mark class="ok">22.8</mark></div><p class="nota">{{s|s093|}}</p></div>
    <div class="passo"><div class="espr">previsioni (scaler fittato sul training):  <mark class="dato">identiche</mark>  (scarto 10⁻¹¹ px)</div><p class="nota">{{s|s094|}}</p></div>
    <div class="passo"><div class="espr">scaler rifatto sui dati di test:  line 362 → 303,  random 411 → <mark class="no">141</mark></div><p class="nota">{{s|s095|}}</p></div>
  </figure>
  <div class="box attenzione" data-tit="{{a|s096|}}">
    <p>{{s|s097|}}</p>
  </div>
  <figure class="scena" data-scena="normalizza" data-titolo="{{a|s098|}}"></figure>
</section>

</main>
</body>
</html>
