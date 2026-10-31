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
  const Y = { m: 60, t1: 130, t2: 200 };
  const ogg = [
    { id: 'lm', tipo: 'testo', x: 24, y: Y.m, t: 'm', size: 15, bold: true },
    { id: 'l1', tipo: 'testo', x: 24, y: Y.t1, t: 't1', size: 15, bold: true },
    { id: 'l2', tipo: 'testo', x: 24, y: Y.t2, t: 't2', size: 15, bold: true }
  ];
  const az = [['in', 'm', 'init', 'x, y, a, b = 0'], ['s1', 'm', 'st1', ''], ['s2', 'm', 'st2', ''], ['a1', 't1', '1', 'a = 1'], ['b3', 't2', '3', 'b = 1'],
              ['a2', 't1', '2', 'x = b'], ['b4', 't2', '4', 'y = a'], ['j1', 'm', 'j1', ''], ['j2', 'm', 'j2', ''], ['p5', 'm', '5', 'print']];
  az.forEach(([id, th, t, s], k) => ogg.push({ id, tipo: 'nodo', r: 15, x: 70 + k * 52, y: Y[th], t, sotto: s, nascosto: true }));
  ogg.push({ id: 'mem', tipo: 'testo', x: 330, y: 250, t: 'a = 0   b = 0   x = 0   y = 0', size: 13, bold: true });
  const vedi = (ids, tono) => Object.fromEntries(ids.map(i => [i, { nascosto: false, tono }]));
  SCENE.esecuzione = {
    w: 620, h: 265, lato: false,
    legenda: '{{j|s002|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s003|'}}' },
      { nota: '{{j|s004|'}}', set: vedi(['in', 's1', 's2'], 'dato') },
      { nota: '{{j|s005|'}}', set: Object.assign(vedi(['a1'], 'ora'), { mem: { t: 'a = 1   b = 0   x = 0   y = 0' } }) },
      { nota: '{{j|s006|'}}', set: Object.assign(vedi(['b3'], 'ora'), { a1: { tono: 'ok' }, mem: { t: 'a = 1   b = 1   x = 0   y = 0' } }) },
      { nota: '{{j|s007|'}}', set: Object.assign(vedi(['a2'], 'ora'), { b3: { tono: 'ok' }, mem: { t: 'a = 1   b = 1   x = 1   y = 0' } }) },
      { nota: '{{j|s008|'}}', set: Object.assign(vedi(['b4'], 'ora'), { a2: { tono: 'ok' }, mem: { t: 'a = 1   b = 1   x = 1   y = 1' } }) },
      { nota: '{{j|s009|'}}', set: Object.assign(vedi(['j1', 'j2', 'p5'], 'dato'), { b4: { tono: 'ok' }, p5: { nascosto: false, tono: 'ok', sotto: 'print (1,1)' } }) }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 22 }, extra || {});

  // 1. sequential consistency
  const out = (id, x, t) => R(id, x, 90, 100, 44, t, { nascosto: true });
  SCENE.seqcons = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      T('h', 300, 30, 'PossibleReordering: che cosa può stampare?', { bold: true, size: 13 }),
      out('o1', 30, '(0,1)'), out('o2', 170, '(1,0)'), out('o3', 310, '(1,1)'), out('o4', 450, '(0,0)'),
      T('c', 300, 180, '', { size: 12 }), T('c2', 300, 210, '', { size: 12, bold: true })
    ],
    passi: [
      { nota: "<b>Sequential consistency</b> (Lamport): il comportamento \"normale\". Ogni thread esegue le sue istruzioni in ordine, e le operazioni sembrano avvenire una alla volta, in un istante, mescolate in qualche interleaving." },
      { nota: "Con PossibleReordering, i 6 interleaving dei 4 passi danno solo (0,1), (1,0) e (1,1). Sono gli output <b>sequenzialmente consistenti</b>.", set: { o1: { nascosto: false, tono: 'ok' }, o2: { nascosto: false, tono: 'ok' }, o3: { nascosto: false, tono: 'ok' }, c: { t: '6 interleaving → 3 output possibili' } } },
      { nota: "Eppure, eseguendo il programma, a volte esce <b>(0,0)</b>: compilatore e CPU hanno scambiato due istruzioni indipendenti. Nessun interleaving lo spiega: non è sequenzialmente consistente, è un comportamento \"paradossale\".", set: { o4: { nascosto: false, tono: 'no' }, c: { t: '(0,0): serve un riordino' } } },
      { nota: "Garantire la SC sempre costerebbe tutte le ottimizzazioni. Il <b>Java Memory Model</b> fa un patto: se il programma è <b>correctly synchronized</b> (nessuna data race), ogni esecuzione è sequenzialmente consistente. Le regole del JMM servono proprio a decidere se un programma lo è.", set: { c2: { t: 'niente data race ⇒ sequential consistency', tono: 'ok' } } }
    ]
  };

  // 2. azioni per tipo
  const A = [['m(init(x))', 'v'], ['m(init(b))', 'v'], ['m(start(t1))', 's'], ['t1(1): a=1', 'v'], ['t1(2): x=b', 'v'], ['m(join(t1))', 's'], ['m(5): println', 'o']];
  const og2 = [];
  A.forEach(([t], i) => og2.push(R('a' + i, 20 + (i % 4) * 142, 40 + Math.floor(i / 4) * 70, 132, 40, t)));
  og2.push(T('c', 300, 200, '', { bold: true, size: 12 }), T('c2', 300, 226, '', { size: 12 }));
  const colora = (tipo, tono) => Object.fromEntries(A.map(([, k], i) => ['a' + i, { tono: k === tipo ? tono : null }]));
  SCENE.azioni = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: og2,
    passi: [
      { nota: "Il JMM ragiona su <b>azioni</b>: coppie t(o), \"il thread t esegue l'operazione o\". Qui alcune azioni di PossibleReordering, con i nomi della slide 13. Ce ne sono di tre tipi." },
      { nota: "<b>Accessi a variabili</b> (<i>variable access</i>): letture e scritture di variabili condivise. <code>x=b</code> è sia una lettura (di b) sia una scrittura (di x).", set: Object.assign(colora('v', 'dato'), { c: { t: 'letture e scritture di variabili' } }) },
      { nota: "<b>Sincronizzazione</b> (<i>synchronization</i>): start, join, lock, unlock, letture e scritture di volatile. Sono le azioni che creano ordini <b>tra</b> thread diversi.", set: Object.assign(colora('s', 'ora'), { c: { t: 'start, join, lock, unlock, volatile' } }) },
      { nota: "<b>Altro</b> (<i>other</i>): tutto il resto, per esempio stampare. Per trovare data race contano soprattutto i primi due tipi.", set: Object.assign(colora('o', 'due'), { c: { t: 'println, new, …' }, c2: { t: 'data race: contano accessi e sincronizzazione' } }) }
    ]
  };

  // 3. program order
  SCENE.programorder = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      T('lm', 30, 50, 'm', { bold: true }), T('l1', 30, 140, 't1', { bold: true }), T('l2', 30, 220, 't2', { bold: true }),
      N('m1', 90, 50, 'init', 'dato', { r: 20 }), N('m2', 190, 50, 'st1', 'dato', { r: 20 }), N('m3', 290, 50, 'st2', 'dato', { r: 20 }), N('m4', 390, 50, 'j1', 'dato', { r: 20 }), N('m5', 490, 50, 'j2', 'dato', { r: 20 }), N('m6', 570, 50, '5', 'dato', { r: 18 }),
      N('a1', 240, 140, '1', 'ora'), N('a2', 340, 140, '2', 'ora'),
      N('b1', 240, 220, '3', 'due'), N('b2', 340, 220, '4', 'due'),
      { id: 'pm1', tipo: 'arco', da: 'm1', a: 'm2', dir: true, nascosto: true }, { id: 'pm2', tipo: 'arco', da: 'm2', a: 'm3', dir: true, nascosto: true }, { id: 'pm3', tipo: 'arco', da: 'm3', a: 'm4', dir: true, nascosto: true }, { id: 'pm4', tipo: 'arco', da: 'm4', a: 'm5', dir: true, nascosto: true }, { id: 'pm5', tipo: 'arco', da: 'm5', a: 'm6', dir: true, nascosto: true },
      { id: 'pa', tipo: 'arco', da: 'a1', a: 'a2', dir: true, nascosto: true }, { id: 'pb', tipo: 'arco', da: 'b1', a: 'b2', dir: true, nascosto: true },
      { id: 'q', tipo: 'arco', da: 'a1', a: 'b1', t: '?', tono: 'no', nascosto: true },
      T('c', 480, 180, '', { size: 12 })
    ],
    passi: [
      { nota: "Il <b>program order</b>: dentro <b>un</b> thread, a viene prima di b se, eseguendo quel thread da solo, a verrebbe eseguita prima di b. È definito sul <b>codice</b>: i riordini di compilatore e CPU non contano." },
      { nota: "Per il main: init → start(t1) → start(t2) → join(t1) → join(t2) → (5). Una catena: ogni coppia di azioni del main è ordinata (ordine totale).", set: { pm1: { nascosto: false }, pm2: { nascosto: false }, pm3: { nascosto: false }, pm4: { nascosto: false }, pm5: { nascosto: false } } },
      { nota: "Per t1: t1(1) → t1(2). Per t2: t2(3) → t2(4).", set: { pa: { nascosto: false }, pb: { nascosto: false } } },
      { nota: "E fra t1(1) e t2(3)? Sono di thread <b>diversi</b>: il program order non dice niente. Per ordinare azioni di thread diversi servono le regole di sincronizzazione (<a href=\"l03-happens-before.html\">happens-before</a>).", set: { q: { nascosto: false }, c: { t: 'fra thread diversi: nessun ordine' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s013|}}</h1>
  <p class="lede">{{s|s014|}}</p>
</header>

<section>
  <h2>{{s|s015|}}</h2>
  <ul>
    <li>{{s|s016|}}</li>
    <li>{{s|s017|}}</li>
    <li>{{s|s018|}}</li>
  </ul>
  <div class="box regola" data-tit="{{a|s019|}}">
    <p>{{s|s020|}}</p>
  </div>
  <p>{{s|s021|}}</p>
  <figure class="scena" data-scena="seqcons" data-titolo="{{a|s022|}}"></figure>
</section>

<section>
  <h2>{{s|s023|}}</h2>
  <div class="box regola" data-tit="{{a|s024|}}">
    <p>{{s|s025|}}</p>
  </div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s026|}}</th><th>{{s|s027|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
      <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
      <tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="codice" data-titolo="{{a|s034|}}">
<pre data-lang="java">// variabili condivise
x = 0;   // (init(x))
y = 0;   // (init(y))
a = 0;   // (init(a))
b = 0;   // (init(b))

Thread one = new Thread(() -> {
    a = 1;   // (1)
    x = b;   // (2)
});
Thread other = new Thread(() -> {
    b = 1;   // (3)
    y = a;   // (4)
});

one.start();     // (start(t1))
other.start();   // (start(t2))
one.join();      // (join(t1))
other.join();    // (join(t2))
System.out.println("(" + x + "," + y + ")");   // (5)</pre>
    <ol class="spiega">
      <li data-righe="2-5" data-segna="(init(x))@dato|(init(y))@dato|(init(a))@dato|(init(b))@dato"><p>{{s|s035|}}</p></li>
      <li data-righe="8-9" data-segna="(1)@ora|(2)@ora"><p>{{s|s036|}}</p></li>
      <li data-righe="12-13" data-segna="(3)@due|(4)@due"><p>{{s|s037|}}</p></li>
      <li data-righe="16-19" data-segna="(start(t1))@ok|(start(t2))@ok|(join(t1))@ok|(join(t2))@ok"><p>{{s|s038|}}</p></li>
      <li data-righe="20" data-segna="(5)@dato"><p>{{s|s039|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="azioni" data-titolo="{{a|s040|}}"></figure>
</section>

<section>
  <h2>{{s|s041|}}</h2>
  <div class="box regola" data-tit="{{a|s042|}}">
    <p>{{s|s043|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s044|}}">
    <div class="passo"><div class="espr"><mark class="dato">m(init(x)), m(init(y)), m(init(a)), m(init(b))</mark></div><p class="nota">{{s|s045|}}</p></div>
    <div class="passo"><div class="espr">…, <mark class="ok">m(start(t1))</mark>, <mark class="ok">m(start(t2))</mark></div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr">…, <mark class="ora">t1(1)</mark>, <mark class="due">t2(3)</mark>, <mark class="ora">t1(2)</mark>, <mark class="due">t2(4)</mark></div><p class="nota">{{s|s047|}}</p></div>
    <div class="passo"><div class="espr">…, <mark class="ok">m(join(t1))</mark>, <mark class="ok">m(join(t2))</mark>, <mark class="dato">m(5)</mark></div><p class="nota">{{s|s048|}}</p></div>
  </figure>
  <figure class="scena" data-scena="esecuzione" data-titolo="{{a|s049|}}"></figure>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <div class="box regola" data-tit="{{a|s051|}}">
    <p>{{s|s052|}}</p>
  </div>
  <p>{{s|s053|}}</p>
  <figure class="passi" data-titolo="{{a|s054|}}">
    <div class="passo">
      <div class="espr">(<mark class="dato">m(init(x))</mark>, <mark class="dato">m(init(y))</mark>)
(m(init(y)), m(init(a)))
(m(init(a)), m(init(b)))
…
(m(join(t2)), m(5))</div>
      <p class="nota">{{s|s055|}}</p>
    </div>
    <div class="passo">
      <div class="espr">m(init(x)) → m(init(y)) → m(init(a)) → m(init(b)) → m(start(t1)) → m(start(t2)) → m(join(t1)) → m(join(t2)) → m(5)</div>
      <p class="nota">{{s|s056|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ora">t1(1) → t1(2)</mark>
<mark class="due">t2(3) → t2(4)</mark></div>
      <p class="nota">{{s|s057|}}</p>
    </div>
    <div class="passo">
      <div class="espr">(t1(1), t2(3))  ?</div>
      <p class="nota">{{s|s058|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="programorder" data-titolo="{{a|s059|}}"></figure>
</section>

</main>
</body>
</html>
