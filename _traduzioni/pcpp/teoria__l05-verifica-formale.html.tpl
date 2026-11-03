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
  // albero di tutti gli interleaving: t1 e t2 fanno una volta R (temp = counter) e W (counter = temp + 1)
  const N = [
    ['r', 310, 40, 'via', 0, null],
    ['a', 135, 100, 'R1', 1, 'r'], ['b', 485, 100, 'R2', 1, 'r'],
    ['aA', 60, 160, 'W1', 2, 'a'], ['ab', 210, 160, 'R2', 2, 'a'], ['ba', 410, 160, 'R1', 2, 'b'], ['bB', 560, 160, 'W2', 2, 'b'],
    ['aAb', 60, 220, 'R2', 3, 'aA'], ['abA', 160, 220, 'W1', 3, 'ab'], ['abB', 260, 220, 'W2', 3, 'ab'],
    ['baA', 360, 220, 'W1', 3, 'ba'], ['baB', 460, 220, 'W2', 3, 'ba'], ['bBa', 560, 220, 'R1', 3, 'bB'],
    ['L1', 60, 280, '2', 4, 'aAb'], ['L2', 160, 280, '1', 4, 'abA'], ['L3', 260, 280, '1', 4, 'abB'],
    ['L4', 360, 280, '1', 4, 'baA'], ['L5', 460, 280, '1', 4, 'baB'], ['L6', 560, 280, '2', 4, 'bBa']
  ];
  const seq = { L1: 'R1 W1 R2 W2', L2: 'R1 R2 W1 W2', L3: 'R1 R2 W2 W1', L4: 'R2 R1 W1 W2', L5: 'R2 R1 W2 W1', L6: 'R2 W2 R1 W1' };
  const ogg = [];
  N.forEach(([id, x, y, t, liv, pad]) => {
    ogg.push({ id, tipo: 'nodo', r: liv === 4 ? 18 : 17, x, y, t, sotto: liv === 4 ? seq[id] : undefined, nascosto: liv > 0 });
    if (pad) ogg.push({ id: 'e' + id, tipo: 'arco', da: pad, a: id, dir: true, nascosto: true });
  });
  const mostra = liv => Object.fromEntries(N.filter(n => n[4] === liv).flatMap(n => [[n[0], { nascosto: false }], ['e' + n[0], { nascosto: false }]]));
  const foglie = { L1: { tono: 'ok' }, L2: { tono: 'no' }, L3: { tono: 'no' }, L4: { tono: 'no' }, L5: { tono: 'no' }, L6: { tono: 'ok' } };
  SCENE.albero = {
    w: 620, h: 330, lato: false,
    legenda: '{{j|s002|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s003|'}}' },
      { nota: '{{j|s004|'}}', set: mostra(1) },
      { nota: '{{j|s005|'}}', set: mostra(2) },
      { nota: '{{j|s006|'}}', set: mostra(3) },
      { nota: '{{j|s007|'}}', set: Object.assign(mostra(4), foglie) },
      { nota: '{{j|s008|'}}', set: { r: { tono: 'ora' }, a: { tono: 'ora' }, ab: { tono: 'ora' }, abA: { tono: 'ora' }, L2: { tono: 'ora' }, ea: { tono: 'ora' }, eab: { tono: 'ora' }, eabA: { tono: 'ora' }, eL2: { tono: 'ora' } } }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 18 }, extra || {});

    const coda = (id, i) => R(id, 30 + i * 80, 150, 72, 34, '', { tono: 'spento', nascosto: true });
    SCENE.jpfdead = {
      w: 600, h: 250, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [
        R('buf', 200, 30, 200, 40, 'buffer (1 posto): vuoto', { tono: 'spento' }),
        T('wt', 60, 135, 'in attesa (un solo wait set):', { size: 12, anchor: 'start' }),
        coda('w0', 0), coda('w1', 1), coda('w2', 2), coda('w3', 3), coda('w4', 4), coda('w5', 5),
        T('op', 300, 100, '', { size: 12 }), T('c', 300, 218, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "Il BoundedBuffer di JPF: <b>un solo</b> monitor (synchronized, wait) e <code>notify()</code>, che sveglia <b>uno qualsiasi</b> dei thread in attesa. Produttori e consumatori aspettano nello stesso insieme. Buffer da 1 posto, produttori P1, P2, consumatori C1, C2." },
        { nota: "C1 e C2 chiedono un elemento: buffer vuoto, tutti e due in wait.", set: { w0: { nascosto: false, t: 'C1', tono: 'due' }, w1: { nascosto: false, t: 'C2', tono: 'due' }, op: { t: 'C1 get, C2 get: vuoto → wait' } } },
        { nota: "P1 mette un elemento (count = 1) e fa notify: sveglia C1. Poi P1 prova a mettere ancora: pieno, wait. P2: pieno, wait.", set: { buf: { t: 'buffer: pieno' }, w0: { t: 'C2' }, w1: { t: 'P1', tono: 'dato' }, w2: { nascosto: false, t: 'P2', tono: 'dato' }, op: { t: 'P1 put → notify C1; P1, P2: pieno → wait' } } },
        { nota: "C1 prende l'elemento (count = 0) e fa notify. Sveglia il <b>waiter sbagliato</b>: C2, un altro consumatore, invece di un produttore.", set: { buf: { t: 'buffer: vuoto' }, w0: { t: 'P1', tono: 'dato' }, w1: { t: 'P2', tono: 'dato' }, w2: { nascosto: true }, op: { t: 'C1 get → notify sveglia C2' } } },
        { nota: "C1 riprova: vuoto, wait. C2 si sveglia: vuoto, wait. Ora <b>tutti</b> aspettano e nessuno può più notificare nessuno: <b>deadlock</b>.", set: { w2: { nascosto: false, t: 'C1', tono: 'due' }, w3: { nascosto: false, t: 'C2', tono: 'due' }, op: { t: 'C1, C2: vuoto → wait' }, c: { t: 'tutti in wait: deadlock', tono: 'no' } } },
        { nota: "Con <code>notifyAll()</code> si svegliano tutti, e ognuno ricontrolla la sua condizione nel while: un produttore trova spazio e sblocca. Con i test uno scenario così capita di rado; <b>JPF</b> lo trova esplorando gli stati (target.args = 2,4,1).", set: { c: { t: 'notifyAll: un produttore riparte, niente deadlock', tono: 'ok' } } }
      ]
    };

    // esplosione degli stati: barre in scala logaritmica
    const D = [['2 thread × 3 passi', 20, 1.3], ['2 × 10', 184756, 5.27], ['3 × 10', 5550996791340, 12.74], ['4 × 10', 4.7e21, 21.67]];
    const og = [T('h', 300, 24, 'Numero di interleaving (scala logaritmica)', { bold: true, size: 12 })];
    D.forEach(([t], i) => og.push(T('e' + i, 150, 64 + i * 44, t, { size: 12, anchor: 'end' }), R('b' + i, 160, 48 + i * 44, 0, 28, '', { tono: 'dato' }), T('v' + i, 170, 67 + i * 44, '', { size: 12, anchor: 'start' })));
    og.push(T('c', 300, 238, '', { size: 12, bold: true }));
    const fmt = ['20', '184 756', '5,5 · 10¹²', '4,7 · 10²¹'];
    const bar = i => ({ ['b' + i]: { w: D[i][2] * 16 }, ['v' + i]: { t: fmt[i], x: 170 + D[i][2] * 16 } });
    SCENE.esplosione = {
      w: 600, h: 250, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: og,
      passi: [
        { nota: "La verifica formale esplora <b>tutti</b> gli interleaving. Quanti sono? Con n thread di k passi ciascuno: (n·k)! / (k!)ⁿ. Le barre sono in scala logaritmica: ogni tacca in più moltiplica, non somma." },
        { nota: "2 thread di 3 passi: <b>20</b> interleaving. Si esplorano a mano.", set: bar(0) },
        { nota: "2 thread di 10 passi: <b>184 756</b>. Per un computer ancora poco.", set: bar(1) },
        { nota: "3 thread di 10 passi: circa <b>5,5 · 10¹²</b>. Un thread in più ha moltiplicato per 30 milioni.", set: Object.assign(bar(2), { b2: { w: D[2][2] * 16, tono: 'no' } }) },
        { nota: "4 thread di 10 passi: circa <b>4,7 · 10²¹</b>. È l'<b>esplosione degli stati</b>: anche programmi piccoli hanno più stati di quanti se ne possano visitare. Si riduce con astrazioni, approssimazioni, problemi più piccoli. Per questo nella pratica si usano anche i test, che trovano controesempi ma non dimostrano l'assenza di errori.", set: Object.assign(bar(3), { b3: { w: D[3][2] * 16, tono: 'no' }, c: { t: 'test: trovano errori · verifica: tutti gli interleaving, a caro prezzo' } }) }
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
  <figure class="scena" data-scena="albero" data-titolo="{{a|s014|}}"></figure>
  <p class="piccolo">{{s|s015|}}</p>
  <figure class="passi" data-titolo="{{a|s016|}}">
    <div class="passo"><div class="espr">{{s|s017|}}</div><p class="nota">{{s|s018|}}</p></div>
    <div class="passo"><div class="espr">interleaving diversi:  C(40, 20) = <mark class="no">137 846 528 820</mark></div><p class="nota">{{s|s019|}}</p></div>
    <div class="passo"><div class="espr">stati diversi raggiungibili:  <mark class="ok">45 525</mark></div><p class="nota">{{s|s020|}}</p></div>
    <div class="passo"><div class="espr">{{s|s021|}}</div><p class="nota">{{s|s022|}}</p></div>
  </figure>
  <p class="piccolo">{{s|s023|}}</p>
</section>

<section>
  <h2>{{s|s024|}}</h2>
  <p>{{s|s025|}}</p>
  <figure class="passi" data-titolo="{{a|s026|}}">
    <div class="passo"><div class="espr">C1 get: vuoto → wait.   C2 get: vuoto → wait.          in attesa: [C1, C2]</div><p class="nota">{{s|s027|}}</p></div>
    <div class="passo"><div class="espr">P1 put: count = 1, <mark class="dato">notify → C1</mark>.   P1 put: pieno → wait.   P2 put: pieno → wait.</div><p class="nota">{{s|s028|}}</p></div>
    <div class="passo"><div class="espr">C1 get: count = 0, <mark class="no">notify → C2</mark></div><p class="nota">{{s|s029|}}</p></div>
    <div class="passo"><div class="espr">C1 get: vuoto → wait.   C2 si sveglia: vuoto → wait.</div><p class="nota">{{s|s030|}}</p></div>
    <div class="passo"><div class="espr">{{s|s031|}}</div><p class="nota">{{s|s032|}}</p></div>
  </figure>
  <figure class="scena" data-scena="jpfdead" data-titolo="{{a|s033|}}"></figure>
</section>

<section>
  <h2>{{s|s034|}}</h2>
  <ul>
    <li>{{s|s035|}}</li>
    <li>{{s|s036|}}</li>
    <li>{{s|s037|}}</li>
  </ul>
  <div class="box esame" data-tit="{{a|s038|}}">
    <p>{{s|s039|}}</p>
  </div>
  <figure class="scena" data-scena="esplosione" data-titolo="{{a|s040|}}"></figure>
</section>

</main>
</body>
</html>
