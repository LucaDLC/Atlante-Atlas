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
  // 1. la formula, colonna per colonna
  const vuota = [['1', '3', '', '', ''], ['2', '4', '', '', ''], ['3', '8', '', '', '']];
  const col = (c, tono) => ({ ['0,' + c]: tono, ['1,' + c]: tono, ['2,' + c]: tono });
  const tab = (vals, toni) => ({ tb: { valori: vals, toni } });
  const v1 = [['1', '3', '3', '', ''], ['2', '4', '5', '', ''], ['3', '8', '7', '', '']];
  const v2 = [['1', '3', '3', '0', ''], ['2', '4', '5', '−1', ''], ['3', '8', '7', '1', '']];
  const v3 = [['1', '3', '3', '0', '0'], ['2', '4', '5', '−1', '1'], ['3', '8', '7', '1', '1']];
  SCENE.simboli = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      { id: 'fo', tipo: 'testo', x: 300, y: 24, t: 'L = (1/N) · Σᵢ (yᵢ − f(xᵢ))²', size: 18, bold: true },
      { id: 'mo', tipo: 'testo', x: 300, y: 54, t: 'modello: f(x) = 1 + 2·x', size: 13 },
      { id: 'tb', tipo: 'griglia', x: 40, y: 70, cw: 80, ch: 30, cwR: 40, intR: ['i = 1', 'i = 2', 'i = 3'], intC: ['xᵢ', 'yᵢ', 'f(xᵢ)', 'yᵢ − f(xᵢ)', '(…)²'], valori: vuota },
      { id: 's1', tipo: 'testo', x: 300, y: 212, t: '', size: 14, bold: true },
      { id: 's2', tipo: 'testo', x: 300, y: 240, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: "La formula, e un dataset di N = 3 punti. Ogni riga della tabella è un punto; il pedice <b>i</b> dice quale.", set: tab(vuota, Object.assign(col(0, 'dato'), col(1, 'dato'))) },
      { nota: "<b>xᵢ</b> è l'ingresso del punto i, <b>yᵢ</b> la risposta vera (la <i>label</i>). Nel punto 2: x₂ = 2, y₂ = 4.", set: tab(vuota, { '1,0': 'dato', '1,1': 'dato' }) },
      { nota: "<b>f(xᵢ)</b>: si mette ogni xᵢ nel modello. f(1) = 1 + 2·1 = 3, f(2) = 5, f(3) = 7: sono le previsioni.", set: tab(v1, col(2, 'due')) },
      { nota: "<b>yᵢ − f(xᵢ)</b>: verità meno previsione. È l'<b>errore</b> del punto i, detto <b>residuo</b> (<i>residual</i>). Può essere negativo: nel punto 2 il modello prevede troppo.", set: tab(v2, col(3, 'ora')) },
      { nota: "<b>( … )²</b>: ogni errore al quadrato, <b>uno per uno</b>. Così diventano tutti positivi.", set: tab(v3, col(4, 'ora')) },
      { nota: "<b>Σᵢ</b> (sigma maiuscola): somma su tutti i punti, da i = 1 a N. 0 + 1 + 1 = 2.", set: Object.assign(tab(v3, col(4, 'ok')), { s1: { t: 'Σ = 0 + 1 + 1 = 2', tono: 'ora' } }) },
      { nota: "<b>1/N</b>: si divide per il numero di <b>punti</b>. L = 2 / 3 ≈ <b>0.667</b>. È la media degli errori al quadrato, detta anche MSE (<i>mean squared error</i>). È l'esercizio 4 del test.", set: { s2: { t: 'L = 2 / 3 ≈ 0.667', tono: 'ok' } } }
    ]
  };

  // 2. prima il quadrato: errori che si cancellano
  const X0 = 250, U = 30;
  const px = v => X0 + v * U;
  SCENE.ordine = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      { id: 'asse', tipo: 'linea', x1: px(-4), y1: 110, x2: px(4), y2: 110, tono: 'spento' },
      { id: 'zero', tipo: 'linea', x1: px(0), y1: 20, x2: px(0), y2: 116, tratt: true, tono: 'spento' },
      { id: 't0', tipo: 'testo', x: px(0), y: 126, t: '0', size: 12 },
      { id: 'e1', tipo: 'vett', x1: px(0), y1: 30, x2: px(3), y2: 30, t: '+3', tono: 'dato' },
      { id: 'e2', tipo: 'vett', x1: px(0), y1: 60, x2: px(-1), y2: 60, t: '−1', tono: 'dato', tx: -26 },
      { id: 'e3', tipo: 'vett', x1: px(0), y1: 90, x2: px(-2), y2: 90, t: '−2', tono: 'dato', tx: -26 },
      { id: 'sm', tipo: 'testo', x: 470, y: 60, t: '', size: 14, bold: true },
      { id: 'q1', tipo: 'rett', x: 60, y: 150, w: 90, h: 90, t: '9', tono: 'ok', nascosto: true },
      { id: 'q2', tipo: 'rett', x: 170, y: 210, w: 30, h: 30, t: '1', tono: 'ok', nascosto: true },
      { id: 'q3', tipo: 'rett', x: 220, y: 180, w: 60, h: 60, t: '4', tono: 'ok', nascosto: true },
      { id: 'sq', tipo: 'testo', x: 440, y: 190, t: '', size: 14, bold: true },
      { id: 'sq2', tipo: 'testo', x: 440, y: 218, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: "Tre errori: +3, −1, −2. Il modello sbaglia su <b>tutti e tre</b> i punti." },
      { nota: "Se si sommasse <b>prima</b>: +3 − 1 − 2 = 0, e 0² = 0. La loss direbbe \"modello perfetto\": gli errori positivi e negativi si sono <b>cancellati</b>.", set: { sm: { t: '(3 − 1 − 2)² = 0²  = 0', tono: 'no' } } },
      { nota: "La formula invece ha il quadrato <b>dentro</b> la somma, attaccato a ogni errore. Il quadrato di un numero è l'area del quadrato con quel lato: 3² = 9.", set: { q1: { nascosto: false } } },
      { nota: "(−1)² = 1 e (−2)² = 4: anche gli errori negativi diventano aree positive.", set: { q2: { nascosto: false }, q3: { nascosto: false } } },
      { nota: "Solo adesso la somma: 9 + 1 + 4 = 14, e la media 14/3 ≈ 4.67. Nessuna cancellazione: ogni errore conta. Ordine giusto: <b>parentesi → quadrato → somma → divisione per N</b>.", set: { sq: { t: '3² + (−1)² + (−2)² = 14', tono: 'ok' }, sq2: { t: 'L = 14 / 3 ≈ 4.67', tono: 'ok' } } }
    ]
  };

  // 3. esempio svolto: la parabola sbagliata (scena originale)
  const f = x => 3 * x * x - 2 * x + 1;
  const P = [[2, 5], [3, 7], [4, 9]];
  const ogg = [{ id: 'ax', tipo: 'assi', box: [45, 15, 330, 240], dom: [1.5, 4.5, 0, 45], tacche: 5, etX: 'x', etY: 'y' }];
  for (let k = 0; k < 24; k++) { const a = 1.5 + k * 0.125, b = a + 0.125; if (f(b) <= 45) ogg.push({ id: 'c' + k, tipo: 'linea', in: 'ax', x1: a, y1: f(a), x2: b, y2: f(b), tono: 'due', nascosto: true }); }
  P.forEach(([x, y], i) => {
    ogg.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x, y, r: 5, tono: 'dato' });
    ogg.push({ id: 'r' + i, tipo: 'linea', in: 'ax', x1: x, y1: y, x2: x, y2: f(x), tono: 'no', nascosto: true });
  });
  ogg.push({ id: 'vera', tipo: 'linea', in: 'ax', x1: 1.5, y1: 4, x2: 4.5, y2: 10, tratt: true, tono: 'ok', nascosto: true });
  ogg.push({ id: 'n', tipo: 'testo', x: 210, y: 292, t: '', size: 13, bold: true });
  const passo = (i, err, q, somma) => ({ nota: `{{j|s004|`}}`, set: { ['r' + i]: { nascosto: false }, n: { t: 'somma dei quadrati: ' + somma, tono: 'no' } } });
  SCENE.residui = {
    w: 420, h: 300, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s006|'}}' },
      { nota: '{{j|s007|'}}', set: Object.fromEntries(ogg.filter(o => /^c\d+$/.test(o.id)).map(o => [o.id, { nascosto: false }])) },
      passo(0, -4, 16, '16'), passo(1, -15, 225, '16 + 225'), passo(2, -32, 1024, '16 + 225 + 1024 = 1265'),
      { nota: '{{j|s008|'}}', set: { n: { t: 'L = 1265 / 3 ≈ 421.7', tono: 'no' } } },
      { nota: '{{j|s009|'}}', set: { vera: { nascosto: false }, n: { t: 'y = 2x + 1: L = 0', tono: 'ok' } } }
    ]
  };

  // 4. quadrato contro valore assoluto
  const par = [], vv = [];
  for (let e = -3; e <= 3.001; e += 0.1) { par.push([e, e * e]); vv.push([e, Math.abs(e)]); }
  const pl = p => p.concat(p.slice().reverse());
  SCENE.assoluto = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 300, 220], dom: [-3, 3, 0, 9], tacche: 1, etX: 'e', etY: 'costo' },
      { id: 'ab', tipo: 'poli', in: 'ax', punti: pl(vv), tono: 'due', nascosto: true },
      { id: 'qu', tipo: 'poli', in: 'ax', punti: pl(par), tono: 'ok', nascosto: true },
      { id: 'm1', tipo: 'punto', in: 'ax', x: 0.5, y: 0.5, t: '', tono: 'due', nascosto: true },
      { id: 'm2', tipo: 'punto', in: 'ax', x: 0.5, y: 0.25, t: '', tono: 'ok', nascosto: true },
      { id: 'g1', tipo: 'punto', in: 'ax', x: 3, y: 3, t: '', tono: 'due', nascosto: true },
      { id: 'g2', tipo: 'punto', in: 'ax', x: 3, y: 9, t: '', tono: 'ok', nascosto: true },
      { id: 'c1', tipo: 'testo', x: 470, y: 60, t: '', size: 14, bold: true },
      { id: 'c2', tipo: 'testo', x: 470, y: 88, t: '', size: 14, bold: true },
      { id: 'c3', tipo: 'testo', x: 470, y: 130, t: '', size: 13 }
    ],
    passi: [
      { nota: "Per non far cancellare gli errori basta renderli positivi. Si potrebbe usare il <b>valore assoluto</b> |e| (il numero senza segno): costo = distanza dallo 0.", set: { ab: { nascosto: false } } },
      { nota: "I minimi quadrati usano invece il <b>quadrato</b> e². Anche lui è sempre ≥ 0.", set: { qu: { nascosto: false } } },
      { nota: "Errore piccolo, e = 0.5: |e| = 0.5 ma e² = 0.25. Il quadrato <b>perdona</b> gli errori piccoli.", set: { m1: { nascosto: false }, m2: { nascosto: false }, c1: { t: 'e = 0.5:  |e| = 0.5   e² = 0.25', tono: 'ora' } } },
      { nota: "Errore grande, e = 3: |e| = 3 ma e² = 9. Il quadrato <b>punisce molto</b> gli errori grandi: un solo punto molto sbagliato pesa come tanti punti un po' sbagliati. È anche il suo difetto: è sensibile ai valori anomali (<i>outlier</i>, settimana 9).", set: { g1: { nascosto: false }, g2: { nascosto: false }, c2: { t: 'e = 3:  |e| = 3   e² = 9', tono: 'ora' } } },
      { nota: "Il vantaggio decisivo: la parabola è <b>liscia</b>, senza la punta che |e| ha in 0. Per questo la loss dei minimi quadrati si minimizza con una formula esatta (settimana 5) e con le derivate (settimana 14). La media di |e| esiste comunque come metrica, la MAE (settimana 11).", set: { c3: { t: 'e² è liscia: niente punta in 0' } } }
    ]
  };

  // 5. la loss come funzione dei parametri
  const Lw = w => (89 - 70 * w + 14 * w * w) / 3;
  const curvaL = []; for (let w = 0.5; w <= 4.501; w += 0.1) curvaL.push([w, Lw(w)]);
  const prova = (w, tono) => ({ li: { y2: 4 * w, tono }, pw: { x: w, y: Lw(w), t: 'L = ' + (Math.round(Lw(w) * 100) / 100), tono }, tw: { t: 'w₁ = ' + w, tono } });
  const o5 = [
    { id: 'axd', tipo: 'assi', box: [40, 40, 220, 190], dom: [0, 4, 0, 12], tacche: 1, etX: 'x', etY: 'y' },
    { id: 'axl', tipo: 'assi', box: [340, 40, 230, 190], dom: [0, 5, 0, 20], tacche: 1, numeri: false, etX: 'w₁', etY: 'L(w₁)' },
    { id: 'td', tipo: 'testo', x: 150, y: 14, t: 'dati e retta y = w₁·x', size: 12, bold: true },
    { id: 'tl', tipo: 'testo', x: 455, y: 14, t: 'la loss al variare di w₁', size: 12, bold: true },
    { id: 'cl', tipo: 'poli', in: 'axl', punti: pl(curvaL), tono: 'spento', nascosto: true },
    { id: 'li', tipo: 'linea', in: 'axd', x1: 0, y1: 0, x2: 4, y2: 4, tono: 'ora' },
    { id: 'pw', tipo: 'punto', in: 'axl', x: 1, y: 11, t: 'L = 11', tono: 'ora' },
    { id: 'tw', tipo: 'testo', x: 150, y: 262, t: 'w₁ = 1', size: 14, bold: true }
  ];
  [[1, 3], [2, 4], [3, 8]].forEach(([x, y], i) => o5.push({ id: 'd' + i, tipo: 'punto', in: 'axd', x, y, t: '', tono: 'dato' }));
  SCENE.lossw = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: o5,
    passi: [
      { nota: "Stessi dati (1, 3), (2, 4), (3, 8). Per semplicità fisso w₀ = 0 e lascio libero solo w₁: il modello è y = w₁·x. Con w₁ = 1 la loss è 11." },
      { nota: "w₁ = 2: la retta si avvicina ai punti, L ≈ 1.67.", set: prova(2, 'ora') },
      { nota: "w₁ = 3: troppo ripida, L ≈ 1.67 di nuovo.", set: prova(3, 'ora') },
      { nota: "w₁ = 4: molto peggio, L = 11.", set: prova(4, 'ora') },
      { nota: "Provando tutti i valori di w₁ la loss disegna una <b>parabola</b>: L(w₁) = (89 − 70·w₁ + 14·w₁²)/3. La loss è una <b>funzione dei parametri</b>, non dei dati: i dati sono fissi, sono i parametri a cambiare.", set: { cl: { nascosto: false } } },
      { nota: "Il fondo della parabola è in w₁ = 2.5, con L = 0.5: è la retta migliore (verificato con NumPy). \"Minimizzare i minimi quadrati\" (slide 36) vuol dire trovare questo fondo. Una parabola ha un solo fondo, e il quadrato garantisce proprio questa forma.", set: prova(2.5, 'ok') }
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
  <div class="mblock"><span class="m">L<sub>f</sub> = <span class="frac"><span>1</span><span>N</span></span> &sum;<sub>i=1</sub><sup>N</sup> (y<sub>i</sub> &minus; f(x<sub>i</sub>))<sup>2</sup></span></div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s016|}}</th><th>{{s|s017|}}</th></tr></thead>
    <tbody>
      <tr><td><span class="m">x<sub>i</sub></span></td><td>{{s|s018|}}</td></tr>
      <tr><td><span class="m">y<sub>i</sub></span></td><td>{{s|s019|}}</td></tr>
      <tr><td><span class="m">f(x<sub>i</sub>)</span></td><td>{{s|s020|}}</td></tr>
      <tr><td>{{s|s021|}}</td><td>{{s|s022|}}</td></tr>
      <tr><td><span class="m">N</span></td><td>{{s|s023|}}</td></tr>
      <tr><td>{{s|s024|}}</td><td>{{s|s025|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s026|}}</p>
  <p>{{s|s027|}}</p>
  <div class="box attenzione" data-tit="{{a|s028|}}">
    <p>{{s|s029|}}</p>
  </div>
  <figure class="scena" data-scena="simboli" data-titolo="{{a|s030|}}"></figure>
</section>

<section>
  <h2>{{s|s031|}}</h2>
  <p>{{s|s032|}}</p>
  <div class="box regola" data-tit="{{a|s033|}}">
    <p>{{s|s034|}}</p>
  </div>
  <div class="colonne">
    <div class="carta buona">
      <h4>{{s|s035|}}</h4>
      <p>{{s|s036|}}</p>
      <p><span class="m">= 16 + 225 + 1024 = 1265</span></p>
    </div>
    <div class="carta cattiva">
      <h4>{{s|s037|}}</h4>
      <p>{{s|s038|}}</p>
      <p>{{s|s039|}}</p>
    </div>
  </div>
  <p>{{s|s040|}}</p>
  <p class="piccolo">{{s|s041|}}</p>
  <figure class="scena" data-scena="ordine" data-titolo="{{a|s042|}}"></figure>
</section>

<section>
  <h2>{{s|s043|}}</h2>
  <p>{{s|s044|}}</p>
  <figure class="passi" data-titolo="{{a|s045|}}" data-legenda="{{a|s046|}}">
    <div class="passo">
      <div class="espr">f1(2) = 9    f1(3) = 22    f1(4) = 41</div>
      <p class="nota">{{s|s047|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="dato">5</mark>&minus;9 = <mark class="ora">&minus;4</mark>    <mark class="dato">7</mark>&minus;22 = <mark class="ora">&minus;15</mark>    <mark class="dato">9</mark>&minus;41 = <mark class="ora">&minus;32</mark></div>
      <p class="nota">{{s|s048|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ora">16    225    1024</mark></div>
      <p class="nota">{{s|s049|}}</p>
    </div>
    <div class="passo">
      <div class="espr">16 + 225 + 1024 = <mark class="ora">1265</mark></div>
      <p class="nota">{{s|s050|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">L = 1265 / 3 &asymp; 421,7</mark></div>
      <p class="nota">{{s|s051|}}</p>
    </div>
  </figure>
  <details class="soluzione"><summary>{{s|s052|}}</summary><div>
    <p>{{s|s053|}}</p>
  </div></details>
  <div class="box idea" data-tit="{{a|s054|}}">
    <p>{{s|s055|}}</p>
  </div>
  <p class="piccolo">{{s|s056|}}</p>
  <figure class="scena" data-scena="residui" data-titolo="{{a|s057|}}"></figure>
</section>

<section>
  <h2>{{s|s058|}}</h2>
  <p>{{s|s059|}}</p>
  <p>{{s|s060|}}</p>
  <p>{{s|s061|}}</p>
  <p>{{s|s062|}}</p>
  <p>{{s|s063|}}</p>
  <figure class="scena" data-scena="assoluto" data-titolo="{{a|s064|}}"></figure>
</section>

<section>
  <h2>{{s|s065|}}</h2>
  <p>{{s|s066|}}</p>
  <p>{{s|s067|}}</p>
  <p>{{s|s068|}}</p>
  <figure class="scena" data-scena="lossw" data-titolo="{{a|s069|}}"></figure>
</section>

</main>
</body>
</html>
