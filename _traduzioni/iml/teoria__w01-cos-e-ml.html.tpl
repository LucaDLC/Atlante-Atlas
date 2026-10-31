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
  const B = (id, x, y, w, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h: 36, t, nascosto: true }, extra || {});
  const F = (id, x1, y1, x2, y2) => ({ id, tipo: 'vett', x1, y1, x2, y2, nascosto: true });
  SCENE.tradml = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      { id: 't1', tipo: 'testo', x: 300, y: 14, t: 'Programmazione tradizionale', size: 13, bold: true },
      B('d1', 20, 30, 120, 'Dati', { tono: 'dato' }), B('p1', 20, 76, 120, 'Programma (regole)', { tono: 'dato' }),
      F('f1', 142, 48, 228, 68), F('f2', 142, 94, 228, 76),
      B('c1', 230, 53, 110, 'Computer'), F('f3', 342, 71, 438, 71), B('o1', 440, 53, 140, 'Output', { tono: 'ok' }),
      { id: 't2', tipo: 'testo', x: 300, y: 142, t: 'Machine learning', size: 13, bold: true, nascosto: true },
      B('d2', 20, 158, 120, 'Dati', { tono: 'dato' }), B('p2', 20, 204, 120, 'Output (esempi)', { tono: 'dato' }),
      F('f4', 142, 176, 228, 196), F('f5', 142, 222, 228, 204),
      B('c2', 230, 181, 110, 'Computer'), F('f6', 342, 199, 438, 199), B('o2', 440, 181, 140, 'Programma = modello', { tono: 'ok' })
    ],
    passi: [
      { nota: "Nella programmazione <b>tradizionale</b> una persona scrive le <b>regole</b>. Il computer riceve i dati e le regole.", set: { d1: { nascosto: false }, p1: { nascosto: false }, f1: { nascosto: false }, f2: { nascosto: false } } },
      { nota: "Il computer applica le regole ai dati, una istruzione alla volta.", set: { c1: { nascosto: false } } },
      { nota: "Esce il risultato (<i>output</i>). Se le regole sono sbagliate o incomplete, l'output è sbagliato: il computer non corregge niente da solo.", set: { f3: { nascosto: false }, o1: { nascosto: false } } },
      { nota: "Nel <b>machine learning</b> le regole non le scriviamo. Diamo al computer i dati <b>insieme agli output giusti</b>: tanti esempi di coppie (ingresso, risposta).", set: { t2: { nascosto: false }, d2: { nascosto: false }, p2: { nascosto: false }, f4: { nascosto: false }, f5: { nascosto: false } } },
      { nota: "Il computer cerca da solo una regola che trasformi quegli ingressi in quelle risposte. Questa fase si chiama <b>training</b> (addestramento).", set: { c2: { nascosto: false } } },
      { nota: "Il risultato del training è un <b>programma</b>: il <b>modello</b>. Da qui in poi lo si usa su dati nuovi, come un programma normale. Slide 3 della lezione 1.", set: { f6: { nascosto: false }, o2: { nascosto: false } } }
    ]
  };

  const W = 100, G = 17, X = i => 14 + i * (W + G);
  const o = [
    { id: 'tt', tipo: 'testo', x: 14, y: 22, t: 'TRAINING', size: 12, bold: true, anchor: 'start' },
    { id: 'tp', tipo: 'testo', x: 14, y: 166, t: 'PREDIZIONE', size: 12, bold: true, anchor: 'start', nascosto: true }
  ];
  const r1 = ['Dati grezzi', 'Pulizia', 'Feature', 'Training', 'Modello'];
  const r2 = ['Dati nuovi', 'Pulizia', 'Feature', 'Modello', 'Previsione'];
  r1.forEach((t, i) => { o.push(B('a' + i, X(i), 34, W, t)); if (i) o.push(F('fa' + i, X(i - 1) + W + 1, 52, X(i) - 1, 52)); });
  o.push(B('et', X(3) - 20, 104, W, 'Etichette y', { tono: 'dato' }), F('fet', X(3) + 30, 103, X(3) + 30, 72));
  r2.forEach((t, i) => { o.push(B('b' + i, X(i), 178, W, t)); if (i) o.push(F('fb' + i, X(i - 1) + W + 1, 196, X(i) - 1, 196)); });
  o.push(F('giu', X(4) + 30, 72, X(3) + 80, 176));
  o.push(B('val', X(4), 248, W, 'Valutazione'), F('fval', X(4) + W / 2, 216, X(4) + W / 2, 246));
  const vedi = ids => Object.fromEntries(ids.map(i => [i, { nascosto: false }]));
  SCENE.pipeline = {
    w: 600, h: 292, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: o,
    passi: [
      { nota: "Si parte dai <b>dati grezzi</b> (<i>raw data</i>): foto, misure, registrazioni, così come escono dagli strumenti.", set: Object.assign(vedi(['a0']), { a0: { nascosto: false, tono: 'ora' } }) },
      { nota: "<b>Pulizia</b> (<i>data wrangling</i>): togliere errori e valori mancanti, ridurre il rumore, trasformare e normalizzare le scale.", set: Object.assign(vedi(['fa1']), { a0: { tono: null }, a1: { nascosto: false, tono: 'ora' } }) },
      { nota: "<b>Feature</b> (<i>feature engineering</i>): da ogni esempio si ricava un <b>vettore di numeri</b>, il vettore delle caratteristiche. Da qui in poi il modello vede solo vettori.", set: Object.assign(vedi(['fa2']), { a1: { tono: null }, a2: { nascosto: false, tono: 'ora' } }) },
      { nota: "<b>Training</b>: il modello riceve i vettori <b>e</b> le <b>etichette</b> (le risposte giuste) e regola i suoi parametri per sbagliare il meno possibile.", set: Object.assign(vedi(['fa3', 'et', 'fet']), { a2: { tono: null }, a3: { nascosto: false, tono: 'ora' } }) },
      { nota: "Esce il <b>modello</b>: una funzione con i parametri ormai fissati.", set: Object.assign(vedi(['fa4']), { a3: { tono: null }, a4: { nascosto: false, tono: 'ok' } }) },
      { nota: "<b>Predizione</b>: arrivano dati mai visti. Passano per le <b>stesse</b> trasformazioni del training (stessa pulizia, stesse feature), altrimenti il modello riceve vettori diversi da quelli su cui ha imparato.", set: vedi(['tp', 'b0', 'fb1', 'b1', 'fb2', 'b2']) },
      { nota: "Il modello addestrato riceve i nuovi vettori e produce la <b>previsione</b>.", set: Object.assign(vedi(['giu', 'fb3', 'b3', 'fb4']), { b3: { nascosto: false, tono: 'ok' }, b4: { nascosto: false, tono: 'ok' } }) },
      { nota: "<b>Valutazione</b>: su dati di cui conosciamo la risposta si confrontano previsioni e verità con una metrica (errore, accuratezza…). Le slide chiedono di <b>memorizzare</b> questo schema (slide 21).", set: vedi(['val', 'fval']) }
    ]
  };

  const P = [[1.5, 2.5], [2.5, 1.8], [3, 3.2], [2, 3.8], [6.5, 6.2], [7.5, 7.4], [8, 6], [7, 8.2]];
  const og = [{ id: 'ax', tipo: 'assi', box: [50, 20, 300, 230], dom: [0, 10, 0, 10], tacche: 2, etX: 'x₁', etY: 'x₂' }];
  P.forEach(([x, y], i) => og.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x, y, t: '' }));
  og.push({ id: 'conf', tipo: 'linea', in: 'ax', x1: 1, y1: 9, x2: 9, y2: 1, tratt: true, nascosto: true });
  og.push({ id: 'reg', tipo: 'linea', in: 'ax', x1: 0, y1: 1.185, x2: 10, y2: 8.985, tono: 'ok', nascosto: true });
  og.push({ id: 'ti', tipo: 'testo', x: 480, y: 40, t: '', size: 13, bold: true });
  og.push({ id: 'ts', tipo: 'testo', x: 480, y: 66, t: '', size: 12 });
  const colora = f => Object.fromEntries(P.map((_, i) => ['p' + i, { tono: f(i) }]));
  SCENE.tipi = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: og,
    passi: [
      { nota: "Otto esempi, ognuno descritto da due numeri (x₁, x₂): per esempio altezza e peso. Per ora sono solo punti.", set: { ti: { t: 'i dati' } } },
      { nota: "<b>Supervisionato</b> (<i>supervised</i>): per ogni esempio conosciamo anche la risposta giusta, l'<b>etichetta</b>. Qui l'etichetta è una categoria (A o B): è un problema di <b>classificazione</b>.", set: Object.assign(colora(i => i < 4 ? 'dato' : 'due'), { ti: { t: 'classificazione' }, ts: { t: 'etichetta = categoria' } }) },
      { nota: "Il modello impara un <b>confine</b> tra le due classi. Un esempio nuovo si classifica guardando da che parte del confine cade.", set: { conf: { nascosto: false }, ts: { t: 'impara un confine' } } },
      { nota: "Se invece l'etichetta è un <b>numero</b> (per esempio: da x₁ prevedere x₂), il problema è di <b>regressione</b>: il modello impara una funzione che dà un numero. Qui la retta dei minimi quadrati, y = 0.78·x + 1.19 (calcolata con NumPy).", set: Object.assign(colora(() => null), { conf: { nascosto: true }, reg: { nascosto: false }, ti: { t: 'regressione' }, ts: { t: 'etichetta = numero' } }) },
      { nota: "<b>Non supervisionato</b> (<i>unsupervised</i>): nessuna etichetta. Il modello cerca da solo struttura nei dati. L'esempio tipico è il <b>clustering</b>: raggruppare i punti vicini.", set: { reg: { nascosto: true }, ti: { t: 'non supervisionato' }, ts: { t: 'nessuna etichetta' } } },
      { nota: "Il clustering trova due gruppi. Stessi colori della classificazione, ma nessuno li ha dati: i gruppi sono <b>scoperti</b>, e il modello non sa come chiamarli.", set: Object.assign(colora(i => i < 4 ? 'dato' : 'due'), { ts: { t: 'gruppi scoperti' } }) }
    ]
  };

  const xs = [0.5, 1.2, 2.0, 2.7, 3.5, 4.3, 5.0], ys = [1.89, 1.06, 1.99, 2.09, 2.74, 3.21, 2.91];
  const vera = t => 1 + 0.5 * t + 0.15 * Math.sin(2 * t);
  const curva = []; for (let t = 0; t <= 6.001; t += 0.1) curva.push([t, vera(t)]);
  const g6 = [1.89, 1.29, 0.94, 0.77, 0.73, 0.79, 0.91, 1.06, 1.23, 1.39, 1.55, 1.68, 1.79, 1.88, 1.95, 1.99, 2.02, 2.03, 2.04, 2.05, 2.05, 2.07, 2.09, 2.13, 2.18, 2.24, 2.32, 2.41, 2.52, 2.63, 2.74, 2.85, 2.96, 3.05, 3.13, 3.19, 3.22, 3.23, 3.21, 3.16, 3.1, 3.02, 2.94, 2.88, 2.86, 2.91, 3.06, 3.36].map((v, i) => [0.5 + i * 0.1, v]);
  const linea = pts => pts.concat(pts.slice().reverse());
  const ob = [{ id: 'ax', tipo: 'assi', box: [50, 20, 330, 220], dom: [0, 6.5, 0, 5], tacche: 1, etX: 'x', etY: 'y' }];
  ob.push({ id: 'vera', tipo: 'poli', in: 'ax', punti: linea(curva), tono: 'spento' });
  xs.forEach((x, i) => ob.push({ id: 's' + i, tipo: 'punto', in: 'ax', x, y: ys[i], t: '', tono: 'dato', nascosto: true }));
  ob.push({ id: 'mod', tipo: 'linea', in: 'ax', x1: 0, y1: 1.211, x2: 6.5, y2: 1.211 + 0.386 * 6.5, tono: 'ok', nascosto: true });
  ob.push({ id: 'g6', tipo: 'poli', in: 'ax', punti: linea(g6), tono: 'no', nascosto: true });
  ob.push({ id: 'xn', tipo: 'linea', in: 'ax', x1: 6, y1: 0, x2: 6, y2: 5, tratt: true, nascosto: true });
  ob.push({ id: 'pr', tipo: 'punto', in: 'ax', x: 6, y: 3.53, t: '3.53', tono: 'ok', tx: -40, nascosto: true });
  ob.push({ id: 'pv', tipo: 'punto', in: 'ax', x: 6, y: 3.92, t: '3.92', tono: 'spento', tx: -40, ty: -12, nascosto: true });
  ob.push({ id: 'nota', tipo: 'testo', x: 215, y: 272, t: 'la funzione vera (sconosciuta)', size: 13 });
  SCENE.bersaglio = {
    w: 440, h: 290, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: ob,
    passi: [
      { nota: "Da qualche parte esiste la <b>funzione vera</b> (<i>ground truth</i>) che lega x e y. Nessuno la conosce: la disegno solo per capire. Le slide la chiamano \"AI as a shooting game\": il bersaglio c'è, ma è nascosto." },
      { nota: "<b>Raccolta dei dati</b>: misuriamo alcuni punti. Ogni misura ha un piccolo errore, il <b>rumore</b> (<i>noise</i>): i punti non stanno esattamente sulla curva.", set: Object.assign(Object.fromEntries(xs.map((_, i) => ['s' + i, { nascosto: false }])), { nota: { t: '7 misure con rumore' } }) },
      { nota: "Questo è tutto ciò che il computer vede: sette punti. La curva vera sparisce.", set: { vera: { nascosto: true }, nota: { t: 'quello che vediamo davvero' } } },
      { nota: "Scegliamo un modello semplice, una retta, e troviamo quella più vicina ai punti: y = 1.211 + 0.386·x (minimi quadrati, calcolati con NumPy).", set: { mod: { nascosto: false }, nota: { t: 'modello: y = 1.211 + 0.386 x' } } },
      { nota: "Lo scopo vero è <b>prevedere dati nuovi</b> (<i>unseen data</i>). In x = 6, dove non abbiamo misure, il modello dice 3.53.", set: { xn: { nascosto: false }, pr: { nascosto: false }, nota: { t: 'previsione in x = 6: 3.53' } } },
      { nota: "La funzione vera lì vale 3.92: la previsione sbaglia di 0.39. Non si sbaglia a zero, perché il rumore e la forma del modello lo impediscono.", set: { vera: { nascosto: false }, pv: { nascosto: false }, nota: { t: 'vero: 3.92, errore 0.39' } } },
      { nota: "Un polinomio di grado 6 passa <b>esattamente</b> per tutti i 7 punti: sui dati l'errore è 0. Ma in x = 6 prevede <b>19.71</b>, fuori dal grafico. Ha memorizzato il rumore invece di capire la tendenza.", set: { g6: { nascosto: false }, nota: { t: 'grado 6: errore 0 sui dati, 19.71 in x = 6' } } },
      { nota: "Morale (slide 24): \"You cannot learn anything from finite data unless you assume something about the structure of the underlying problem\". Scegliere la retta invece del grado 6 è un'<b>ipotesi</b> sulla forma del problema, il <i>bias induttivo</i> (<i>inductive bias</i>).", set: { g6: { nascosto: true }, nota: { t: 'serve un’ipotesi sulla forma' } } }
    ]
  };

  SCENE.nutshell = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: [
      { id: 'tt', tipo: 'testo', x: 95, y: 18, t: 'training set', size: 12, bold: true },
      { id: 'ts', tipo: 'griglia', x: 40, y: 30, cw: 50, ch: 30, intC: ['x', 'y'], valori: [[1, 3], [2, 4], [3, 8]] },
      { id: 'f1', tipo: 'vett', x1: 150, y1: 90, x2: 218, y2: 90, t: 'training', tx: -70, ty: -12, nascosto: true },
      { id: 'mo', tipo: 'rett', x: 222, y: 70, w: 180, h: 40, t: 'f(x) = w₀ + w₁·x', nascosto: true },
      { id: 'pa', tipo: 'testo', x: 312, y: 134, t: '', size: 14, bold: true, tono: 'ora' },
      { id: 'xt', tipo: 'rett', x: 222, y: 180, w: 80, h: 36, t: 'x = 4', tono: 'dato', nascosto: true },
      { id: 'f2', tipo: 'vett', x1: 304, y1: 198, x2: 418, y2: 198, t: 'f(4)', tx: -70, ty: -12, nascosto: true },
      { id: 'yt', tipo: 'rett', x: 420, y: 180, w: 120, h: 36, t: 'ŷ = 10', tono: 'ok', nascosto: true }
    ],
    passi: [
      { nota: "Il <b>training set</b>: N esempi etichettati {(x₁, y₁), …, (x_N, y_N)}. Qui N = 3: (1, 3), (2, 4), (3, 8).", set: { ts: { toni: { '0,0': 'dato', '0,1': 'dato', '1,0': 'dato', '1,1': 'dato', '2,0': 'dato', '2,1': 'dato' } } } },
      { nota: "Si sceglie la forma del modello: una retta f(x) = w₀ + w₁·x. <b>w₀</b> e <b>w₁</b> sono i <b>parametri</b> (<i>weights</i>): le slide li chiamano \"il cervello del modello\".", set: { f1: { nascosto: false }, mo: { nascosto: false } } },
      { nota: "<b>Training</b>: si cercano i parametri che rendono minimo l'errore di previsione sul training set. Con i minimi quadrati escono w₀ = 0 e w₁ = 2.5 (NumPy: <code>lstsq</code>).", set: { pa: { t: 'w₀ = 0,  w₁ = 2.5' }, mo: { t: 'f(x) = 0 + 2.5·x', tono: 'ora' } } },
      { nota: "<b>Test</b>: arriva un x mai visto, x = 4.", set: { xt: { nascosto: false } } },
      { nota: "Il modello calcola f(4) = 0 + 2.5·4 = <b>10</b>. Il cappello su ŷ (\"y cappello\") indica un valore <b>previsto</b>, non misurato.", set: { f2: { nascosto: false }, yt: { nascosto: false } } }
    ]
  };

  const L = [[1, 1, '6.00'], [0, 3, '1.67'], [1, 2, '0.67'], [0, 2.5, '0.50']];
  const orr = [{ id: 'ax', tipo: 'assi', box: [50, 20, 280, 220], dom: [0, 4, 0, 11], tacche: 1, etX: 'x', etY: 'y' }];
  [[1, 3], [2, 4], [3, 8]].forEach(([x, y], i) => orr.push({ id: 'q' + i, tipo: 'punto', in: 'ax', x, y, t: '(' + x + ', ' + y + ')', tono: 'dato' }));
  orr.push({ id: 'li', tipo: 'linea', in: 'ax', x1: 0, y1: 1, x2: 4, y2: 5, tono: 'ora', nascosto: true });
  orr.push({ id: 'r1', tipo: 'testo', x: 350, y: 40, t: '1. dati: 3 punti', anchor: 'start', size: 13 });
  orr.push({ id: 'r2', tipo: 'testo', x: 350, y: 66, t: '2. modello: retta', anchor: 'start', size: 13, nascosto: true });
  orr.push({ id: 'r3', tipo: 'testo', x: 350, y: 92, t: '   loss: minimi quadrati', anchor: 'start', size: 13, nascosto: true });
  orr.push({ id: 'r4', tipo: 'testo', x: 350, y: 118, t: '3. obiettivo: L minima', anchor: 'start', size: 13, nascosto: true });
  orr.push({ id: 'mm', tipo: 'testo', x: 350, y: 160, t: '', anchor: 'start', size: 14, bold: true });
  orr.push({ id: 'll', tipo: 'testo', x: 350, y: 186, t: '', anchor: 'start', size: 14, bold: true });
  const prova = ([w0, w1, l], tono) => ({ li: { nascosto: false, y1: w0, y2: w0 + 4 * w1, tono }, mm: { t: 'y = ' + w0 + ' + ' + w1 + '·x' }, ll: { t: 'L = ' + l, tono } });
  SCENE.ricetta = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: orr,
    passi: [
      { nota: "Passo 1 della ricetta (slide 33): i <b>dati di training</b>, qui tre punti." },
      { nota: "Passo 2: si scelgono il <b>modello</b> (una retta, con i parametri w₀ e w₁) e la <b>loss</b>, cioè come misurare quanto sbaglia: la media dei quadrati degli errori.", set: { r2: { nascosto: false }, r3: { nascosto: false } } },
      { nota: "Passo 3: l'<b>obiettivo</b> è trovare i parametri con la loss più piccola.", set: { r4: { nascosto: false } } },
      { nota: "Passo 4: <b>imparare i parametri</b>. Proviamo w₀ = 1, w₁ = 1: previsioni 2, 3, 4, errori 1, 1, 4, loss (1 + 1 + 16)/3 = <b>6</b>.", set: prova(L[0], 'ora') },
      { nota: "w₀ = 0, w₁ = 3: previsioni 3, 6, 9, errori 0, −2, −1, loss 5/3 ≈ <b>1.67</b>. Meglio.", set: prova(L[1], 'ora') },
      { nota: "w₀ = 1, w₁ = 2: errori 0, −1, 1, loss 2/3 ≈ <b>0.67</b>.", set: prova(L[2], 'ora') },
      { nota: "w₀ = 0, w₁ = 2.5: errori 0.5, −1, 0.5, loss 1.5/3 = <b>0.50</b>. È il minimo: nessuna retta fa meglio (verificato con <code>np.linalg.lstsq</code>). Provare a mano non scala: nelle prossime settimane si impara a trovare il minimo con le matrici e con il gradiente.", set: prova(L[3], 'ok') }
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
  <p>{{s|s012|}}</p>
  <p>{{s|s013|}}</p>
  <figure class="scena" data-scena="tradml" data-titolo="{{a|s014|}}"></figure>
</section>

<section>
  <h2>{{s|s015|}}</h2>
  <p>{{s|s016|}}</p>
  <p>{{s|s017|}}</p>
  <p>{{s|s018|}}</p>
  <p>{{s|s019|}}</p>
  <figure class="scena" data-scena="pipeline" data-titolo="{{a|s020|}}"></figure>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
  <p>{{s|s023|}}</p>
  <p>{{s|s024|}}</p>
  <figure class="scena" data-scena="tipi" data-titolo="{{a|s025|}}"></figure>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <p>{{s|s027|}}</p>
  <p>{{s|s028|}}</p>
  <p>{{s|s029|}}</p>
  <p>{{s|s030|}}</p>
  <figure class="scena" data-scena="bersaglio" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <p>{{s|s033|}}</p>
  <p>{{s|s034|}}</p>
  <p>{{s|s035|}}</p>
  <figure class="scena" data-scena="nutshell" data-titolo="{{a|s036|}}"></figure>
</section>

<section>
  <h2>{{s|s037|}}</h2>
  <p>{{s|s038|}}</p>
  <p>{{s|s039|}}</p>
  <p>{{s|s040|}}</p>
  <figure class="scena" data-scena="ricetta" data-titolo="{{a|s041|}}"></figure>
</section>

</main>
</body>
</html>
