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
  const V = [['TP  50', 'FP  10'], ['FN  5', 'TN  100']];
  const giro = (toni, testo, nota) => ({ nota, set: { M: { toni }, n: { t: testo, tono: 'ok' } } });
  SCENE.confusione = {
    w: 520, h: 230, lato: false,
    legenda: '{{j|s002|'}}',
    oggetti: [
      { id: 'M', tipo: 'griglia', x: 110, y: 20, cw: 130, ch: 54, valori: V, intR: ['previsto +', 'previsto −'], intC: ['vero +', 'vero −'], cwR: 100 },
      { id: 'n', tipo: 'testo', x: 260, y: 212, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: '{{j|s003|'}}' },
      giro({ '0,0': 'ok', '1,1': 'ok', '0,1': 'no', '1,0': 'no' }, 'accuracy = (50 + 100) / 165 = 0.909', '<b>Accuracy</b>: la diagonale (risposte giuste) diviso tutto.'),
      giro({ '0,0': 'ok', '0,1': 'no' }, 'precision = 50 / (50 + 10) = 0.833', '<b>Precision</b>: la riga "previsto +". Di tutte le volte che ho detto positivo, quante erano giuste?'),
      giro({ '0,0': 'ok', '1,0': 'no' }, 'recall = 50 / (50 + 5) = 0.909', '<b>Recall</b>: la colonna "vero +". Di tutti i positivi veri, quanti ne ho trovati?'),
      giro({ '1,1': 'ok', '0,1': 'no' }, 'specificity = 100 / (100 + 10) = 0.909', '<b>Specificity</b>: la colonna "vero −", cioè il true negative rate (non il "false negative rate" delle note).'),
      giro({ '0,0': 'ok', '1,1': 'ok' }, 'F1 = 0.870    MCC = 0.802', '<b>F1</b> combina precision e recall; <b>MCC</b> usa tutte e quattro le caselle. Tutti i valori sono verificati con sklearn.')
    ]
  };
  const fpr = [0, 0, 0, 1 / 3, 1 / 3, 1], tpr = [0, 1 / 3, 2 / 3, 2 / 3, 1, 1], soglie = ['∞', '0.9', '0.8', '0.4', '0.35', '0.1'];
  const og = [{ id: 'ax', tipo: 'assi', box: [50, 20, 250, 230], dom: [0, 1, 0, 1], tacche: 0.5, etX: 'FPR', etY: 'TPR' }];
  og.push({ id: 'area', tipo: 'poli', in: 'ax', punti: [[0, 0], [0, 1 / 3], [0, 2 / 3], [1 / 3, 2 / 3], [1 / 3, 1], [1, 1], [1, 0]], tono: 'ok', nascosto: true });
  og.push({ id: 'diag', tipo: 'linea', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 1, tratt: true, tono: 'spento' });
  fpr.forEach((x, i) => {
    og.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x, y: tpr[i], r: 4.5, tono: 'ora', nascosto: i > 0 });
    if (i > 0) og.push({ id: 's' + i, tipo: 'linea', in: 'ax', x1: fpr[i - 1], y1: tpr[i - 1], x2: x, y2: tpr[i], tono: 'ora', nascosto: true });
  });
  og.push({ id: 'n', tipo: 'testo', x: 175, y: 290, t: '', size: 13, bold: true });
  const passo = i => ({ nota: `{{j|s004|`}}`, set: { ['p' + i]: { nascosto: false }, ['s' + i]: { nascosto: false }, n: { t: 'soglia ' + soglie[i], tono: 'ora' } } });
  SCENE.roc = {
    w: 350, h: 300, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: og,
    passi: [
      { nota: '{{j|s006|'}}' }
    ].concat([1, 2, 3, 4, 5].map(passo)).concat([
      { nota: '{{j|s007|'}}', set: { area: { nascosto: false }, n: { t: 'AUC = 0.889', tono: 'ok' } } }
    ])
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

    const cella = (id, x, y, t, tono) => R(id, x, y, 110, 50, t, { tono });
    SCENE.convenzioni = {
      w: 640, h: 260, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [T('hd', 150, 24, 'DW: [[TP, FP], [FN, TN]]', { bold: true, size: 12 }), cella('a00', 40, 40, 'TP = 40', 'ok'), cella('a01', 150, 40, 'FP = 10', 'no'), cella('a10', 40, 90, 'FN = 5', 'no'), cella('a11', 150, 90, 'TN = 45', 'ok'),
        T('hs', 470, 24, 'sklearn: [[TN, FP], [FN, TP]]', { bold: true, size: 12, nascosto: true }), cella('b00', 360, 40, 'TN = 45', 'ok'), cella('b01', 470, 40, 'FP = 10', 'no'), cella('b10', 360, 90, 'FN = 5', 'no'), cella('b11', 470, 90, 'TP = 40', 'ok'),
        T('c', 320, 175, '', { size: 12 }), T('c2', 320, 205, '', { size: 12 }), T('c3', 320, 235, '', { size: 12, bold: true })]
        .map(o => (o.id[0] === 'b' && o.id.length === 3) ? Object.assign(o, { nascosto: true }) : o),
      passi: [
        { nota: "100 casi, 45 positivi veri e 55 negativi veri. La <b>matrice di confusione</b> conta i quattro esiti possibili." },
        { nota: "<b>TP</b> (vero positivo) e <b>TN</b> (vero negativo): il modello ha ragione.", set: { c: { t: 'TP: dice positivo a un positivo · TN: negativo a un negativo' } } },
        { nota: "<b>FP</b> (falso positivo, falso allarme): dice \"malato\" a un sano. <b>FN</b> (falso negativo, mancato): dice \"sano\" a un malato. Quale costa di più dipende dal problema.", set: { c2: { t: 'FP: falso allarme · FN: caso mancato' } } },
        { nota: "Attenzione alla <b>convenzione</b>: confusion_matrix di sklearn mette le etichette vere sulle righe, in ordine 0 poi 1: i TN finiscono in alto a sinistra. Stessi numeri, posizioni diverse. Prima di leggere una matrice, controlla quale convenzione usa.", set: { hs: { nascosto: false }, b00: { nascosto: false }, b01: { nascosto: false }, b10: { nascosto: false }, b11: { nascosto: false }, c3: { t: 'controlla la convenzione prima di leggere', tono: 'no' } } }
      ]
    };

    const og = [];
    for (let i = 0; i < 100; i++) og.push({ id: 'd' + i, tipo: 'nodo', x: 30 + (i % 20) * 16, y: 40 + Math.floor(i / 20) * 18, t: '', r: 6, tono: i >= 95 ? 'no' : 'dato' });
    og.push(T('c', 500, 50, '', { size: 12 }), T('c2', 500, 80, '', { size: 12 }), T('c3', 500, 110, '', { size: 12 }), T('c4', 500, 140, '', { size: 12 }), T('c5', 320, 175, '', { size: 12 }), T('c6', 320, 205, '', { size: 12 }), T('c7', 320, 235, '', { size: 12 }));
    SCENE.sbilanciate = {
      w: 640, h: 260, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: og,
      passi: [
        { nota: "95 negativi e 5 positivi. Un modello che dice <b>sempre \"negativo\"</b> non ha imparato niente." },
        { nota: "Accuratezza = 95/100 = <b>" + D.sbil[0] + "</b>: sembra ottima.", set: { c: { t: 'accuracy = ' + D.sbil[0], tono: 'ok' } } },
        { nota: "Ma recall = " + D.sbil[1] + " (nessun positivo trovato), F1 = " + D.sbil[2] + ", MCC = " + D.sbil[3] + ": le altre metriche dicono la verità (verificato con sklearn). È il <b>paradosso dell'accuratezza</b>.", set: { c2: { t: 'recall = ' + D.sbil[1], tono: 'no' }, c3: { t: 'F1 = ' + D.sbil[2], tono: 'no' }, c4: { t: 'MCC = ' + D.sbil[3], tono: 'no' } } },
        { nota: "Rimedi: <b>undersampling</b> (togliere negativi a caso: si butta informazione), <b>oversampling</b> (duplicare i positivi: overfitting sui duplicati), <b>SMOTE</b> (positivi sintetici fra vicini: esempi poco realistici). Più metriche adatte (F1, MCC, curva PR), stratified CV, pesi alle classi.", set: { c5: { t: 'under / oversampling, SMOTE' }, c6: { t: 'F1, MCC, PR · stratified CV · pesi' } } },
        { nota: "Il ricampionamento si fa <b>solo sul training</b>: il test deve restare com'è nella realtà, con i suoi 5 positivi su 100.", set: { c7: { t: 'ricampionare solo il training', tono: 'no' } } }
      ]
    };

    const a = D.metr.a, b = D.metr.b;
    const ogr = [T('h', 320, 24, 'y = [3, 5, 7, 9]', { bold: true }), T('rl', 90, 72, 'errori', { anchor: 'end', size: 12 }), C('e', 100, 54, ['1', '−1', '2', '−2']),
      T('m1', 470, 60, '', { size: 12 }), T('m2', 470, 90, '', { size: 12 }), T('m3', 470, 120, '', { size: 12 }), T('m4', 470, 150, '', { size: 12 }), T('c', 320, 210, '', { size: 12 }), T('c2', 320, 238, '', { size: 12 })];
    const mostra = (m, tono) => ({ m1: { t: 'MAE = ' + m[0], tono }, m2: { t: 'MSE = ' + m[1], tono }, m3: { t: 'RMSE = ' + m[2], tono }, m4: { t: 'R² = ' + m[3], tono } });
    SCENE.metricheregr = {
      w: 640, h: 250, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: ogr,
      passi: [
        { nota: "Le metriche per la regressione, sugli stessi errori. Errori: 1, −1, 2, −2." },
        { nota: "<b>MAE</b> = media dei valori assoluti = 1.5 (nell'unità dei dati). <b>MSE</b> = media dei quadrati = 2.5 (unità al quadrato). <b>RMSE</b> = √MSE = 1.58 (di nuovo nell'unità dei dati). <b>R²</b> = 1 − SSres/SStot = 1 − 10/20 = 0.5.", set: mostra(a, null) },
        { nota: "Ora un solo errore diventa grande: −2 → −6. MAE sale di 1 (2.5): cresce in proporzione. MSE quadruplica (10.5) e RMSE raddoppia (3.24): i quadrati puniscono molto gli errori grandi. R² diventa negativo (−1.1): peggio che prevedere sempre la media.", set: Object.assign({ e: { valori: ['1', '−1', '2', '−6'], toni: { 3: 'no' } } }, mostra(b, 'no')) },
        { nota: "Quale usare: MAE è robusta agli outlier (come la norma L1); MSE/RMSE sono sensibili agli errori grandi (norma L2), RMSE si legge nell'unità dei dati; R² confronta con la media. Esempio completo sui dati veri: la valutazione dell'Assignment 1 (MAE, distanza media, RMSE).", set: { c: { t: 'MAE: robusta · MSE/RMSE: puniscono i grandi' }, c2: { t: 'R²: rispetto a prevedere la media' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s011|}}</h1>
  <p class="lede">{{s|s012|}}</p>
</header>

<section>
  <h2>{{s|s013|}}</h2>
  <figure class="passi" data-titolo="{{a|s014|}}">
    <div class="passo"><div class="espr"><mark class="ok">TP</mark> vero positivo    <mark class="ok">TN</mark> vero negativo</div><p class="nota">{{s|s015|}}</p></div>
    <div class="passo"><div class="espr"><mark class="no">FP</mark> falso positivo (falso allarme)    <mark class="no">FN</mark> falso negativo (mancato)</div><p class="nota">{{s|s016|}}</p></div>
    <div class="passo"><div class="espr">DW:  [[<mark class="ok">TP</mark>, <mark class="no">FP</mark>], [<mark class="no">FN</mark>, <mark class="ok">TN</mark>]]      sklearn:  [[<mark class="ok">TN</mark>, <mark class="no">FP</mark>], [<mark class="no">FN</mark>, <mark class="ok">TP</mark>]]</div><p class="nota">{{s|s017|}}</p></div>
  </figure>
  <figure class="scena" data-scena="convenzioni" data-titolo="{{a|s018|}}"></figure>
</section>

<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s021|}}</th><th>{{s|s022|}}</th><th>{{s|s023|}}</th><th>{{s|s024|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td><td>150/165 = <b>0.909</b></td><td>{{s|s027|}}</td></tr>
      <tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td><td>50/60 = <b>0.833</b></td><td>{{s|s030|}}</td></tr>
      <tr><td>{{s|s031|}}</td><td>{{s|s032|}}</td><td>50/55 = <b>0.909</b></td><td>{{s|s033|}}</td></tr>
      <tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td>100/110 = <b>0.909</b></td><td>{{s|s036|}}</td></tr>
      <tr><td>{{s|s037|}}</td><td>{{s|s038|}}</td><td>0.091</td><td>{{s|s039|}}</td></tr>
      <tr><td><b>F1</b></td><td>2 · P · R / (P + R)</td><td><b>0.870</b></td><td>{{s|s040|}}</td></tr>
      <tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td><b>0.802</b></td><td>{{s|s043|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box attenzione" data-tit="{{a|s044|}}">
    <p>{{s|s045|}}</p>
  </div>
  <figure class="scena" data-scena="confusione" data-titolo="{{a|s046|}}"></figure>
  <figure class="passi" data-titolo="{{a|s047|}}">
    <div class="passo"><div class="espr">spam:  conta la <mark class="ok">precision</mark></div><p class="nota">{{s|s048|}}</p></div>
    <div class="passo"><div class="espr">malattia:  conta la <mark class="ok">recall</mark></div><p class="nota">{{s|s049|}}</p></div>
    <div class="passo"><div class="espr">F1: nessuna delle due è sufficiente da sola</div><p class="nota">{{s|s050|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s051|}}</h2>
  <p>{{s|s052|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s053|}}</th><th>0.3</th><th>0.5</th><th>0.85</th></tr></thead>
    <tbody>
      <tr><td>{{s|s054|}}</td><td>0.75</td><td>1.0</td><td>1.0</td></tr>
      <tr><td>{{s|s055|}}</td><td><b>1.0</b></td><td>0.667</td><td>0.333</td></tr>
    </tbody>
  </table></div>
  <figure class="passi" data-titolo="{{a|s056|}}">
    <div class="passo"><div class="espr">soglia ↓  ⇒  più "positivo"  ⇒  recall ↑, precision di solito ↓</div><p class="nota">{{s|s057|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">ROC</mark>: per ogni soglia un punto (FPR, TPR)</div><p class="nota">{{s|s058|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">AUC</mark> = area sotto la ROC = 0.889 qui</div><p class="nota">{{s|s059|}}</p></div>
  </figure>
  <figure class="scena" data-scena="roc" data-titolo="{{a|s060|}}"></figure>
</section>

<section>
  <h2>{{s|s061|}}</h2>
  <figure class="passi" data-titolo="{{a|s062|}}">
    <div class="passo"><div class="espr">95 negativi, 5 positivi;  il modello dice sempre "negativo"</div><p class="nota">{{s|s063|}}</p></div>
    <div class="passo"><div class="espr">accuracy = <mark class="no">0.95</mark>,  recall = 0,  F1 = 0,  MCC = 0</div><p class="nota">{{s|s064|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s065|}}</th><th>{{s|s066|}}</th><th>{{s|s067|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td></tr>
      <tr><td>{{s|s071|}}</td><td>{{s|s072|}}</td><td>{{s|s073|}}</td></tr>
      <tr><td>{{s|s074|}}</td><td>{{s|s075|}}</td><td>{{s|s076|}}</td></tr>
      <tr><td>{{s|s077|}}</td><td>{{s|s078|}}</td><td>–</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s079|}}</p>
  <figure class="scena" data-scena="sbilanciate" data-titolo="{{a|s080|}}"></figure>
</section>

<section>
  <h2>{{s|s081|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s082|}}</th><th>{{s|s083|}}</th><th>{{s|s084|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s085|}}</td><td>{{s|s086|}}</td><td>{{s|s087|}}</td></tr>
      <tr><td>{{s|s088|}}</td><td>{{s|s089|}}</td><td>{{s|s090|}}</td></tr>
      <tr><td>{{s|s091|}}</td><td>{{s|s092|}}</td><td>{{s|s093|}}</td></tr>
      <tr><td>R²</td><td>{{s|s094|}}</td><td>{{s|s095|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s096|}}</p>
  <div class="box esame" data-tit="{{a|s097|}}">
    <p>{{s|s098|}}</p>
  </div>
  <figure class="scena" data-scena="metricheregr" data-titolo="{{a|s099|}}"></figure>
</section>

</main>
</body>
</html>
