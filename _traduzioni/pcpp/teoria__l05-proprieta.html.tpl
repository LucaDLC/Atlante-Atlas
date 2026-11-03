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
SCENE.controesempi = {
  w: 600, h: 250, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 't1', tipo: 'testo', x: 20, y: 30, t: 'safety: "size non è mai negativo"', size: 13, bold: true, anchor: 'start' },
    { id: 'S', tipo: 'celle', x: 20, y: 44, cw: 78, ch: 38, valori: ['add', 'remove', 'remove', 'size=−1', '…', '…', '…'], indici: false },
    { id: 'p1', tipo: 'testo', x: 176, y: 100, t: '', size: 12, bold: true },
    { id: 't2', tipo: 'testo', x: 20, y: 140, t: 'liveness: "w2 prima o poi scrive"', size: 13, bold: true, anchor: 'start' },
    { id: 'L', tipo: 'celle', x: 20, y: 154, cw: 78, ch: 38, valori: ['w1 scrive', 'w2 attende', 'w3 scrive', 'w1 scrive', 'w3 scrive', 'w1 scrive', '…'], indici: false },
    { id: 'p2', tipo: 'testo', x: 300, y: 214, t: '', size: 12, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { S: { toni: { 0: 'dato', 1: 'dato', 2: 'dato', 3: 'no' } }, p1: { t: 'prefisso finito: basta questo', tono: 'no' } } },
    { nota: '{{j|s005|'}}', set: { L: { toni: { 0: 'ora', 1: 'ok', 2: 'ora', 3: 'ora', 4: 'ora', 5: 'ora', 6: 'ora' } }, p2: { t: '[w1 scrive, w3 scrive]* all\'infinito: w2 non scrive mai', tono: 'ora' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 18 }, extra || {});

    const pas = (id, i, riga, t, tono) => R(id, 60 + i * 88, riga === 1 ? 60 : 130, 80, 34, t, { tono, nascosto: true });
    const og = [T('l1', 30, 77, 't1', { bold: true }), T('l2', 30, 147, 't2', { bold: true }), R('cnt', 440, 190, 150, 34, 'counter = 0', { tono: 'spento' }), T('c', 220, 207, '', { size: 12, bold: true })];
    for (let i = 0; i < 6; i++) og.push(pas('x' + i, i, 1, '', 'ora'));
    SCENE.daltest = {
      w: 600, h: 240, lato: true,
      legenda: '{{j|s006|'}}',
      oggetti: og,
      passi: [
        { nota: "Proprietà da controllare: <b>dopo k incrementi, counter vale k</b>. Ogni thread fa (1) temp = counter, (2) temp + 1, (3) counter = temp." },
        { nota: "Interleaving <b>sequenziale</b>: t1 fa i suoi tre passi, poi t2 i suoi. t2 legge 1 e scrive 2: nessun incremento perso.", set: { x0: { nascosto: false, t: 't1(1): 0', y: 60, tono: 'ora' }, x1: { nascosto: false, t: 't1(2)', y: 60, tono: 'ora' }, x2: { nascosto: false, t: 't1(3): 1', y: 60, tono: 'ora' }, x3: { nascosto: false, t: 't2(1): 1', y: 130, tono: 'due' }, x4: { nascosto: false, t: 't2(2)', y: 130, tono: 'due' }, x5: { nascosto: false, t: 't2(3): 2', y: 130, tono: 'due' }, cnt: { t: 'counter = 2', tono: 'ok' }, c: { t: '2 incrementi → 2: va bene', tono: 'ok' } } },
        { nota: "Interleaving <b>cattivo</b>: t1(1), t2(1), t1(2), t2(2), t1(3), t2(3). Tutti e due leggono 0 e scrivono 1: un incremento perso. È il <b>controesempio</b> alla proprietà.", set: { x0: { t: 't1(1): 0', y: 60 }, x1: { t: 't2(1): 0', y: 130, tono: 'due' }, x2: { t: 't1(2)', y: 60, tono: 'ora' }, x3: { t: 't2(2)', y: 130, tono: 'due' }, x4: { t: 't1(3): 1', y: 60, tono: 'ora' }, x5: { t: 't2(3): 1', y: 130, tono: 'no' }, cnt: { t: 'counter = 1', tono: 'no' }, c: { t: '2 incrementi → 1: race condition', tono: 'no' } } },
        { nota: "Un test <b>non sceglie</b> l'interleaving: lo decide lo scheduler. Può solo rendere più probabile quello cattivo (tanti thread, tante iterazioni, partenza insieme). Testare = <b>cercare</b> interleaving cattivi; per esplorarli <b>tutti</b> serve la verifica formale.", set: { c: { t: 'test: rende probabili gli interleaving cattivi', tono: null } } }
      ]
    };
  })();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s007|}}</h1>
  <p class="lede">{{s|s008|}}</p>
</header>

<section>
  <h2>{{s|s009|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th></th><th>{{s|s010|}}</th><th>{{s|s011|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s012|}}</td><td>{{s|s013|}}</td><td>{{s|s014|}}</td></tr>
      <tr><td>{{s|s015|}}</td><td>{{s|s016|}}</td><td>{{s|s017|}}</td></tr>
      <tr><td>{{s|s018|}}</td><td>{{s|s019|}}</td><td>{{s|s020|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="controesempi" data-titolo="{{a|s021|}}"></figure>
  <div class="box regola" data-tit="{{a|s022|}}">
    <p>{{s|s023|}}</p>
  </div>
  <div class="box esame" data-tit="{{a|s024|}}">
    <p>{{s|s025|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <figure class="passi" data-titolo="{{a|s027|}}">
    <div class="passo"><div class="espr">(1) int temp = counter;  (2) temp = counter + 1;  (3) counter = temp;</div><p class="nota">{{s|s028|}}</p></div>
    <div class="passo"><div class="espr">t1(1), t1(2), t1(3), t2(1), t2(2), t2(3), …   <mark class="ok">va bene</mark></div><p class="nota">{{s|s029|}}</p></div>
    <div class="passo"><div class="espr">t1(1), t2(1), t1(2), t2(2), t1(3), t2(3), …   <mark class="no">race condition</mark></div><p class="nota">{{s|s030|}}</p></div>
    <div class="passo"><div class="espr">{{s|s031|}}</div><p class="nota">{{s|s032|}}</p></div>
  </figure>
  <figure class="scena" data-scena="daltest" data-titolo="{{a|s033|}}"></figure>
</section>

</main>
</body>
</html>
