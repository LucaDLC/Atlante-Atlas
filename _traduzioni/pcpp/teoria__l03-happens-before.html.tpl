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
  const nomiM = ['x=0', 'y=0', 'a=0', 'b=0', 'st1', 'st2', 'jt1', 'jt2', '(5)'];
  const og = [];
  nomiM.forEach((t, i) => og.push({ id: 'm' + i, tipo: 'nodo', x: 36 + i * 71, y: 50, r: 24, t, tono: 'dato', nascosto: true }));
  og.push({ id: 'a1', tipo: 'nodo', x: 320, y: 165, r: 24, t: 'a=1', sotto: 't1(1)', nascosto: true });
  og.push({ id: 'a2', tipo: 'nodo', x: 440, y: 165, r: 24, t: 'x=b', sotto: 't1(2)', nascosto: true });
  og.push({ id: 'b3', tipo: 'nodo', x: 390, y: 275, r: 24, t: 'b=1', sotto: 't2(3)', nascosto: true });
  og.push({ id: 'b4', tipo: 'nodo', x: 520, y: 275, r: 24, t: 'y=a', sotto: 't2(4)', nascosto: true });
  for (let i = 0; i < 8; i++) og.push({ id: 'pm' + i, tipo: 'arco', da: 'm' + i, a: 'm' + (i + 1), dir: true, nascosto: true });
  og.push({ id: 'p12', tipo: 'arco', da: 'a1', a: 'a2', dir: true, nascosto: true });
  og.push({ id: 'p34', tipo: 'arco', da: 'b3', a: 'b4', dir: true, nascosto: true });
  og.push({ id: 's1', tipo: 'arco', da: 'm4', a: 'a1', dir: true, nascosto: true });
  og.push({ id: 's2', tipo: 'arco', da: 'm5', a: 'b3', dir: true, nascosto: true });
  og.push({ id: 'e1', tipo: 'arco', da: 'a2', a: 'm6', dir: true, nascosto: true });
  og.push({ id: 'e2', tipo: 'arco', da: 'b4', a: 'm7', dir: true, nascosto: true, curva: -40 });
  og.push({ id: 'q', tipo: 'linea', x1: 320, y1: 190, x2: 520, y2: 250, tratt: true, nascosto: true });
  og.push({ id: 'qt', tipo: 'testo', x: 150, y: 230, t: '', size: 13, bold: true });
  const mostra = ids => Object.fromEntries(ids.map(i => [i, { nascosto: false }]));
  SCENE.grafo = {
    w: 660, h: 320, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: og,
    passi: [
      { nota: '{{j|s003|'}}', set: mostra(['m0', 'm1', 'm2', 'm3', 'm4', 'm5', 'm6', 'm7', 'm8']) },
      { nota: '{{j|s004|'}}', set: mostra(['pm0', 'pm1', 'pm2', 'pm3', 'pm4', 'pm5', 'pm6', 'pm7']) },
      { nota: '{{j|s005|'}}', set: Object.assign(mostra(['a1', 'a2', 'b3', 'b4', 'p12', 'p34']), { a1: { nascosto: false, tono: 'ora' }, a2: { nascosto: false, tono: 'ora' }, b3: { nascosto: false, tono: 'due' }, b4: { nascosto: false, tono: 'due' } }) },
      { nota: '{{j|s006|'}}', set: { s1: { nascosto: false, tono: 'ok' }, s2: { nascosto: false, tono: 'ok' } } },
      { nota: '{{j|s007|'}}', set: { e1: { nascosto: false, tono: 'ok' }, e2: { nascosto: false, tono: 'ok' }, s1: { tono: null }, s2: { tono: null } } },
      { nota: '{{j|s008|'}}', set: { e1: { tono: null }, e2: { tono: null }, m3: { tono: 'ok' }, a2: { tono: 'ok' } } },
      { nota: '{{j|s009|'}}', set: { m3: { tono: 'dato' }, a2: { tono: 'ora' }, a1: { tono: 'no' }, b4: { tono: 'no' }, q: { nascosto: false, tono: 'no' }, qt: { t: 't1(1) ? t2(4)', tono: 'no' } } }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 22 }, extra || {});
  const A = (id, da, a, extra) => Object.assign({ id, tipo: 'arco', da, a, dir: true, nascosto: true }, extra || {});

  // 1. le coppie: ordine, transitività, azioni non ordinate
  SCENE.coppie = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      N('a', 90, 70, 'a', 'dato'), N('b', 300, 70, 'b', 'dato'), N('c', 510, 70, 'c', 'dato'),
      N('d', 200, 180, 'd', 'dato', { nascosto: true }), N('e', 400, 180, 'e', 'dato', { nascosto: true }),
      A('ab', 'a', 'b', { tono: 'ok' }), A('bc', 'b', 'c', { tono: 'ok' }), A('ac', 'a', 'c', { tono: 'due', curva: -60 }),
      { id: 'de', tipo: 'arco', da: 'd', a: 'e', t: '?', tono: 'no', nascosto: true },
      T('c1', 300, 232, '', { size: 12, bold: true })
    ],
    passi: [
      { nota: "Tre azioni di un'esecuzione: a, b, c. Happens-before è un <b>insieme di coppie</b> di azioni: la coppia (a, b) si scrive anche a → b." },
      { nota: "La coppia (a, b) è nell'insieme: <b>a happens-before b</b>. Conseguenza: tutto quello che a ha scritto è <b>visibile</b> a b.", set: { ab: { nascosto: false }, c1: { t: '(a, b) ∈ HB: b vede gli effetti di a' } } },
      { nota: "Anche (b, c) è nell'insieme.", set: { bc: { nascosto: false }, c1: { t: '(b, c) ∈ HB' } } },
      { nota: "Allora c'è anche (a, c), senza bisogno di una regola apposta: è la <b>transitività</b>. Una catena a → b → c contiene tutte e tre le coppie.", set: { ac: { nascosto: false }, c1: { t: 'a → b → c  ⇒  anche (a, c)' } } },
      { nota: "Due azioni d ed e per cui <b>né</b> (d, e) <b>né</b> (e, d) sono nell'insieme: <b>non sono ordinate</b>. Possono avvenire in qualsiasi ordine e nessuna è sicura di vedere l'effetto dell'altra.", set: { d: { nascosto: false, tono: 'no' }, e: { nascosto: false, tono: 'no' }, de: { nascosto: false }, c1: { t: '(d, e) ∉ HB e (e, d) ∉ HB', tono: 'no' } } },
      { nota: "Per questo happens-before è un <b>ordine parziale</b>: alcune coppie sono confrontabili, altre no. Il program order di un singolo thread invece è <b>totale</b>: lì ogni coppia è ordinata.", set: { c1: { t: 'ordine parziale: non tutte le coppie sono confrontabili', tono: null } } }
    ]
  };

  // 2. le otto regole, una per passo
  const reg = (nome, ta, tb, sa, sb, cond, extra) => Object.assign({
    nome: { t: nome }, ta: { t: ta }, tb: { t: tb }, sa: { t: sa }, sb: { t: sb }, ab: { nascosto: false }, cond: { t: cond },
    c: { nascosto: true }, ac: { nascosto: true }, cb: { nascosto: true }, ab2: { nascosto: true }
  }, extra || {});
  SCENE.regole = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      T('nome', 300, 30, 'Le regole di happens-before', { bold: true, size: 14 }),
      N('a', 130, 120, 'a', 'dato'), N('b', 470, 120, 'b', 'due'), N('c', 300, 120, 'c', 'spento', { nascosto: true }),
      T('ta', 130, 78, '', { bold: true }), T('tb', 470, 78, '', { bold: true }), T('sa', 130, 168, '', { size: 12 }), T('sb', 470, 168, '', { size: 12 }),
      A('ab', 'a', 'b', { tono: 'ok' }), A('ac', 'a', 'c', { tono: 'ok' }), A('cb', 'c', 'b', { tono: 'ok' }), A('ab2', 'a', 'b', { tono: 'ok', curva: 70 }),
      T('cond', 300, 220, '', { size: 12 })
    ],
    passi: [
      { nota: "Ci sono <b>otto regole</b> che dicono quando una coppia (a, b) entra in happens-before. Ogni passo è una regola: a sinistra l'azione a, a destra b, sotto di chi sono." },
      { nota: "<b>Program order</b>: a e b sono dello <b>stesso thread</b> e a viene prima nel codice. È l'unica regola dentro un thread.", set: reg('1 · Program order', 't1(1)', 't1(2)', 'thread t1', 'thread t1', 'stesso thread, a prima nel codice') },
      { nota: "<b>Monitor</b>: a è un <code>unlock()</code>, b un <code>lock()</code> <b>successivo sullo stesso</b> lock (vale anche per semafori, barriere, e per l'uscita/entrata di <code>synchronized</code>). È la regola che collega due thread tramite un lock.", set: reg('2 · Monitor', 'unlock', 'lock', 't1: l.unlock()', 't2: l.lock()', 'stesso lock, lock successivo all’unlock') },
      { nota: "<b>Volatile</b>: a è una <b>scrittura</b> di una variabile volatile, b una <b>lettura successiva della stessa</b> variabile. Collega due thread senza lock.", set: reg('3 · Volatile', 'v = 42', 'read v', 'm: scrive v', 't: legge v', 'v volatile, lettura dopo la scrittura') },
      { nota: "<b>Default initialization</b>: l'inizializzazione di default dei campi (0, false, null) viene prima di <b>ogni altra</b> azione del programma. Per questo non si vede mai \"spazzatura\" in un campo.", set: reg('4 · Default init', 'i = 0', 'ogni azione', 'campo int i;', 'di ogni thread', 'valore di default prima di tutto') },
      { nota: "<b>Final field initialization</b>: la scrittura dei campi <code>final</code> nel costruttore viene prima di ogni uso di quei campi, una volta finito il costruttore. Vale anche per i campi static inizializzati nella classe.", set: reg('5 · Final field init', 'final o = …', 'uso di o', 'nel costruttore', 'qualsiasi thread', 'campi final pronti a costruttore finito') },
      { nota: "<b>Thread start</b>: <code>start()</code> viene prima della <b>prima</b> azione del thread avviato. Tutto quello che il main ha fatto prima di start() è visibile al thread nuovo.", set: reg('6 · Thread start', 'start(t1)', 't1(1)', 'main', 'prima azione di t1', 'start prima della prima azione') },
      { nota: "<b>Thread termination</b>: l'<b>ultima</b> azione di un thread viene prima del <code>join()</code> su quel thread (fatto da qualunque altro thread). Dopo join() si vedono tutti i risultati del thread.", set: reg('7 · Thread termination', 't1(2)', 'join(t1)', 'ultima azione di t1', 'main', 'ultima azione prima del join') },
      { nota: "<b>Transitive</b>: se a → c e c → b, allora a → b. È la regola che combina le altre: una catena di coppie, anche di regole diverse, dà una coppia nuova.", set: reg('8 · Transitive', '', '', '', '', 'a → c e c → b  ⇒  a → b', { ab: { nascosto: true }, c: { nascosto: false }, ac: { nascosto: false }, cb: { nascosto: false }, ab2: { nascosto: false } }) }
    ]
  };

  // 3. costruire gli insiemi
  const og = [
    T('lm', 28, 50, 'm', { bold: true }), T('l1', 28, 140, 't1', { bold: true }), T('l2', 28, 220, 't2', { bold: true })
  ];
  const mx = [70, 130, 190, 250, 310, 370, 430, 490, 550], ml = ['ix', 'iy', 'ia', 'ib', 'st1', 'st2', 'j1', 'j2', '5'];
  mx.forEach((x, i) => og.push(N('m' + i, x, 50, ml[i], 'dato', { r: 17 })));
  og.push(N('a1', 250, 140, '1', 'ora', { r: 17 }), N('a2', 370, 140, '2', 'ora', { r: 17 }), N('b3', 370, 220, '3', 'due', { r: 17 }), N('b4', 490, 220, '4', 'due', { r: 17 }));
  for (let i = 0; i < 8; i++) og.push(A('p' + i, 'm' + i, 'm' + (i + 1)));
  og.push(A('pa', 'a1', 'a2'), A('pb', 'b3', 'b4'));
  og.push(A('s1', 'm4', 'a1', { tono: 'ok' }), A('s2', 'm5', 'b3', { tono: 'ok' }), A('t1', 'a2', 'm6', { tono: 'ok' }), A('t2', 'b4', 'm7', { tono: 'ok' }));
  og.push(T('ins', 300, 250, '', { size: 12, bold: true }));
  const vedi = ids => Object.fromEntries(ids.map(k => [k, { nascosto: false }]));
  SCENE.insiemi = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: og,
    passi: [
      { nota: "Nelle slide happens-before si costruisce come <b>unione di insiemi</b>, uno per regola, poi si chiude per transitività. Partiamo dalle azioni di PossibleReordering (ix = init(x), st1 = start(t1), j1 = join(t1)…)." },
      { nota: "<b>POm</b>: il program order del main, una catena di 9 azioni.", set: Object.assign(vedi(['p0', 'p1', 'p2', 'p3', 'p4', 'p5', 'p6', 'p7']), { ins: { t: 'POm = { ix → iy → … → j2 → m(5) }', tono: 'dato' } }) },
      { nota: "<b>PO1</b> e <b>PO2</b>: il program order di t1 e di t2.", set: Object.assign(vedi(['pa', 'pb']), { ins: { t: 'PO1 = { t1(1) → t1(2) }   PO2 = { t2(3) → t2(4) }', tono: null } }) },
      { nota: "<b>S</b>: le coppie della start rule. Ogni start va verso la <b>prima</b> azione del suo thread.", set: Object.assign(vedi(['s1', 's2']), { ins: { t: 'S = { st1 → t1(1), st2 → t2(3) }', tono: 'ok' } }) },
      { nota: "<b>T</b>: le coppie della termination rule. L'<b>ultima</b> azione di ogni thread va verso il suo join.", set: Object.assign(vedi(['t1', 't2']), { ins: { t: 'T = { t1(2) → j1, t2(4) → j2 }', tono: 'ok' } }) },
      { nota: "<b>HB</b> = chiusura transitiva di POm ∪ PO1 ∪ PO2 ∪ S ∪ T: tutte le coppie disegnate più quelle ottenute seguendo i percorsi. Per esempio ib → st1 → t1(1) → t1(2): init(b) è visibile a <code>x = b</code>.", set: { m3: { tono: 'ok' }, a2: { tono: 'ok' }, ins: { t: 'HB = (POm ∪ PO1 ∪ PO2 ∪ S ∪ T)⁺', tono: null } } },
      { nota: "Cerca un percorso fra t1(1) e t2(4) (scrittura e lettura di a): da t1 si esce solo verso j1, da t2 solo verso j2, e dal main non si torna indietro. <b>Nessuna delle due coppie</b> è in HB: data race.", set: { m3: { tono: 'dato' }, a2: { tono: 'ora' }, a1: { tono: 'no' }, b4: { tono: 'no' }, ins: { t: '(t1(1), t2(4)) ∉ HB e (t2(4), t1(1)) ∉ HB', tono: 'no' } } }
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
  <div class="box regola" data-tit="{{a|s016|}}">
    <p>{{s|s017|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s018|}}">
    <div class="passo"><div class="espr">(<mark class="dato">a</mark>, <mark class="ok">b</mark>)    oppure    <mark class="dato">a</mark> → <mark class="ok">b</mark></div><p class="nota">{{s|s019|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">a</mark> → <mark class="due">b</mark> → <mark class="ok">c</mark>    =    (a,b), (b,c), <mark class="ora">(a,c)</mark></div><p class="nota">{{s|s020|}}</p></div>
    <div class="passo"><div class="espr">(a, b) ∉ HB   <b>e</b>   (b, a) ∉ HB</div><p class="nota">{{s|s021|}}</p></div>
    <div class="passo"><div class="espr">happens-before = <mark class="ora">ordine parziale</mark></div><p class="nota">{{s|s022|}}</p></div>
  </figure>
  <figure class="scena" data-scena="coppie" data-titolo="{{a|s023|}}"></figure>
</section>

<section>
  <h2>{{s|s024|}}</h2>
  <p>{{s|s025|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s026|}}</th><th>{{s|s027|}}</th><th>{{s|s028|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td><code>t1(1) → t1(2)</code></td></tr>
      <tr><td>{{s|s031|}}</td><td>{{s|s032|}}</td><td>{{s|s033|}}</td></tr>
      <tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr>
      <tr><td>{{s|s037|}}</td><td>{{s|s038|}}</td><td>{{s|s039|}}</td></tr>
      <tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr>
      <tr><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr>
      <tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr>
      <tr><td>{{s|s049|}}</td><td>a → c e c → b</td><td>{{s|s050|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="regole" data-titolo="{{a|s051|}}"></figure>
</section>

<section>
  <h2>{{s|s052|}}</h2>
  <figure class="scena" data-scena="grafo" data-titolo="{{a|s053|}}"></figure>
  <div class="box domanda-tua" data-tit="{{a|s054|}}">
    <p>{{s|s055|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s056|}}</h2>
  <p>{{s|s057|}}</p>
  <figure class="passi" data-titolo="{{a|s058|}}">
    <div class="passo"><div class="espr">PO<sub>m</sub> = { m(init(x)) → m(init(y)) → m(init(a)) → m(init(b)) → m(start(t1)) → m(start(t2)) → m(join(t1)) → m(join(t2)) → m(5) }</div><p class="nota">{{s|s059|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">PO<sub>1</sub> = { t1(1) → t1(2) }</mark>     <mark class="due">PO<sub>2</sub> = { t2(3) → t2(4) }</mark></div><p class="nota">{{s|s060|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">S = { m(start(t1)) → t1(1),  m(start(t2)) → t2(3) }</mark></div><p class="nota">{{s|s061|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">T = { t1(2) → m(join(t1)),  t2(4) → m(join(t2)) }</mark></div><p class="nota">{{s|s062|}}</p></div>
    <div class="passo"><div class="espr">HB = chiusura transitiva di ( PO<sub>m</sub> ∪ PO<sub>1</sub> ∪ PO<sub>2</sub> ∪ S ∪ T )</div><p class="nota">{{s|s063|}}</p></div>
    <div class="passo"><div class="espr">t1(1) → t2(4) ∉ HB   e   <mark class="no">t2(4) → t1(1) ∉ HB</mark></div><p class="nota">{{s|s064|}}</p></div>
  </figure>
  <figure class="scena" data-scena="insiemi" data-titolo="{{a|s065|}}"></figure>
</section>

</main>
</body>
</html>
