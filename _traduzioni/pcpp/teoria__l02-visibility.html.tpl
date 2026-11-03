<!doctype html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>{{t|s001|}}</title>
<link rel="stylesheet" href="../assets/atlas.css">
<link rel="stylesheet" href="../assets/tema.css">
<link rel="stylesheet" href="../assets/pcpp.css">
<script src="../assets/sito.js"></script>
<script src="../assets/atlas.js" defer></script>
<script src="../assets/pcpp.js" defer></script>
<script>
window.PROGRAMMI = window.PROGRAMMI || {};
PROGRAMMI.riordino = {
  memoria: { a: 0, b: 0, x: 0, y: 0 },
  thread: [
    { nome: 't1', passi: [
      { n: 1, codice: 'a = 1;', fai: m => { m.a = 1; } },
      { n: 2, codice: 'x = b;', fai: m => { m.x = m.b; } } ] },
    { nome: 't2', passi: [
      { n: 3, codice: 'b = 1;', fai: m => { m.b = 1; } },
      { n: 4, codice: 'y = a;', fai: m => { m.y = m.a; } } ] }
  ],
  esito: m => '(' + m.x + ',' + m.y + ')'
};
PROGRAMMI.riordinoSync = {
  memoria: { a: 0, b: 0, x: 0, y: 0 },
  thread: [
    { nome: 't1', passi: [
      { n: 'L1', codice: 'synchronized (o) {', lock: 'o' },
      { n: 1, codice: '  a = 1;', fai: m => { m.a = 1; } },
      { n: 2, codice: '  x = b;', fai: m => { m.x = m.b; } },
      { n: 'U1', codice: '}', unlock: 'o' } ] },
    { nome: 't2', passi: [
      { n: 'L2', codice: 'synchronized (o) {', lock: 'o' },
      { n: 3, codice: '  b = 1;', fai: m => { m.b = 1; } },
      { n: 4, codice: '  y = a;', fai: m => { m.y = m.a; } },
      { n: 'U2', codice: '}', unlock: 'o' } ] }
  ],
  esito: m => '(' + m.x + ',' + m.y + ')'
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});

  // 1. cache e memoria
  SCENE.cache = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      R('c1', 30, 30, 200, 70, '', { tono: 'dato' }), T('l1', 130, 48, 'CPU 1 · main', { bold: true, size: 12 }), T('v1', 130, 78, 'cache: running = true', { size: 12 }),
      R('c2', 370, 30, 200, 70, '', { tono: 'due' }), T('l2', 470, 48, 'CPU 2 · t1', { bold: true, size: 12 }), T('v2', 470, 78, 'cache: running = true', { size: 12 }),
      R('mem', 180, 170, 240, 50, 'memoria: running = true', { tono: 'spento' }),
      F('f1', 130, 102, 250, 168, '', { nascosto: true }), F('f2', 350, 168, 470, 102, '', { nascosto: true }),
      T('c', 300, 245, '', { bold: true, size: 12 })
    ],
    passi: [
      { nota: "NoVisibility1: t1 gira in <code>while (running)</code>, il main dopo mezzo secondo scrive <code>running = false</code>. I due thread possono stare su CPU diverse, ognuna con la sua <b>cache</b> (una copia veloce della memoria)." },
      { nota: "Il main scrive false, ma la scrittura può restare nella cache della CPU 1 (o in un registro): la memoria e la CPU 2 non la vedono.", set: { v1: { t: 'cache: running = false', tono: 'ok' } } },
      { nota: "t1 continua a leggere la sua copia, true. Anche il compilatore JIT può trasformare il ciclo in <code>while (true)</code>, visto che nel thread nessuno cambia running. Il programma può <b>non terminare mai</b>.", set: { v2: { tono: 'no' }, c: { t: 't1 non vede mai false', tono: 'no' } } },
      { nota: "Con la sincronizzazione (synchronized su lettura e scrittura, oppure <code>volatile boolean running</code>) la scrittura viene resa visibile e la lettura aggiornata: t1 vede false e finisce. La spiegazione con le cache è un'intuizione; la regola precisa è il Java Memory Model: la scrittura è visibile solo se <b>happens-before</b> la lettura.", set: { f1: { nascosto: false }, f2: { nascosto: false }, mem: { t: 'memoria: running = false', tono: 'ok' }, v2: { t: 'cache: running = false', tono: 'ok' }, c: { t: 'con sincronizzazione: visibile', tono: 'ok' } } }
    ]
  };

  // 2. esercizio 2.2: le quattro varianti
  const riga = (id, y, t) => T(id, 150, y, t, { size: 12, anchor: 'start' });
  const esito = (id, y) => T(id, 520, y, '', { size: 12, bold: true });
  SCENE.mutable = {
    w: 620, h: 240, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      T('h', 310, 24, 'main: set(42)  →  t: while (get() == 0)', { bold: true, size: 12 }),
      T('n1', 75, 70, '2.2.1', { bold: true, size: 12 }), riga('d1', 70, 'nessun lock'), esito('e1', 70),
      T('n2', 75, 110, '2.2.2', { bold: true, size: 12 }), riga('d2', 110, 'get e set synchronized'), esito('e2', 110),
      T('n3', 75, 150, '2.2.3', { bold: true, size: 12 }), riga('d3', 150, 'solo set synchronized'), esito('e3', 150),
      T('n4', 75, 190, '2.2.4', { bold: true, size: 12 }), riga('d4', 190, 'value volatile, nessun lock'), esito('e4', 190)
    ],
    passi: [
      { nota: "La domanda di ogni variante: esiste un arco <b>happens-before</b> dalla scrittura <code>set(42)</code> alle letture <code>get()</code>? Se sì, t vede 42 e termina; se no, può girare per sempre." },
      { nota: "<b>Nessun lock</b>: nessuna regola lega scrittura e letture. Può girare per sempre.", set: { e1: { t: 'può non terminare', tono: 'no' } } },
      { nota: "<b>get e set synchronized</b> (stesso lock, quello di mi): l'unlock alla fine di set happens-before il lock del get successivo (regola del monitor). Termina sempre.", set: { e2: { t: 'termina sempre', tono: 'ok' } } },
      { nota: "<b>Solo set synchronized</b>: la regola del monitor collega un unlock e un lock <b>sullo stesso monitor</b>. get non prende nessun lock, quindi non c'è l'arco. Non garantito: mezza sincronizzazione non basta.", set: { e3: { t: 'non garantito', tono: 'no' } } },
      { nota: "<b>value volatile</b>: la scrittura di una variabile volatile happens-before ogni lettura successiva della stessa variabile (regola volatile). Termina sempre, senza lock.", set: { e4: { t: 'termina sempre', tono: 'ok' } } }
    ]
  };

  // 3. volatile non basta per count++
  SCENE.volatilecount = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [
      R('mem', 220, 20, 160, 40, 'volatile count = 5', { tono: 'ok' }),
      T('l1', 60, 100, 't1', { bold: true }), T('l2', 60, 170, 't2', { bold: true }),
      T('a1', 300, 100, '', { size: 12 }), T('a2', 300, 170, '', { size: 12 }), T('c', 300, 222, '', { bold: true, size: 12 })
    ],
    passi: [
      { nota: "<code>volatile</code> garantisce <b>visibilità</b> (ogni lettura vede l'ultima scrittura) e niente <b>riordino</b>. Non garantisce <b>mutua esclusione</b>. Due thread fanno <code>count++</code> su un volatile count che vale 5." },
      { nota: "t1 legge 5: il valore aggiornato, grazie a volatile.", set: { a1: { t: 'temp = count → 5', tono: 'dato' } } },
      { nota: "Prima che t1 scriva, anche t2 legge 5, anche lui aggiornato.", set: { a2: { t: 'temp = count → 5', tono: 'due' } } },
      { nota: "Tutti e due scrivono 6. Un incremento è <b>perso</b>, esattamente come senza volatile. Il problema non era la visibilità, ma che lettura e scrittura non sono <b>atomiche insieme</b>: serve un lock (o un AtomicInteger).", set: { a1: { t: 'count = temp + 1 → 6' }, a2: { t: 'count = temp + 1 → 6', tono: 'no' }, mem: { t: 'volatile count = 6', tono: 'no' }, c: { t: '5 + 2 incrementi = 6: lost update', tono: 'no' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s005|}}</h1>
  <p class="lede">{{s|s006|}}</p>
</header>

<section>
  <h2>{{s|s007|}}</h2>
  <figure class="codice" data-titolo="{{a|s008|}}">
<pre data-lang="java">boolean running = true;
Thread t1 = new Thread(() -> {
    while (running) { /* do nothing */ }
    System.out.println("t1 finishing execution");
});
t1.start();
try { Thread.sleep(500); } catch (InterruptedException e) { }
running = false;
System.out.println("Main finishing execution");</pre>
    <ol class="spiega">
      <li data-righe="3" data-segna="while (running)@dato"><p>{{s|s009|}}</p></li>
      <li data-righe="8" data-segna="running = false;@ora"><p>{{s|s010|}}</p></li>
      <li data-righe="3,8"><p>{{s|s011|}}</p></li>
    </ol>
  </figure>
  <p>{{s|s012|}}</p>
  <div class="box regola" data-tit="{{a|s013|}}">
    <p>{{s|s014|}}</p>
  </div>
  <p>{{s|s015|}}</p>
  <figure class="scena" data-scena="cache" data-titolo="{{a|s016|}}"></figure>
</section>

<section>
  <h2>{{s|s017|}}</h2>
  <pre class="cod" data-lang="java">class MutableInteger {
    private int value = 0;
    public void set(int value) { this.value = value; }
    public int get() { return value; }
}
// t:     while (mi.get() == 0) { }
// main:  Thread.sleep(500); mi.set(42);</pre>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s018|}}</th><th>{{s|s019|}}</th><th>{{s|s020|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s021|}}</td><td class="t-no">{{s|s022|}}</td><td>{{s|s023|}}</td></tr>
      <tr><td>{{s|s024|}}</td><td class="t-ok">{{s|s025|}}</td><td>{{s|s026|}}</td></tr>
      <tr><td>{{s|s027|}}</td><td class="t-no">{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
      <tr><td>{{s|s030|}}</td><td class="t-ok">{{s|s031|}}</td><td>{{s|s032|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box domanda-tua" data-tit="{{a|s033|}}">
    <p>{{s|s034|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s035|}}">
    <p>{{s|s036|}}</p>
  </div>
  <figure class="scena" data-scena="mutable" data-titolo="{{a|s037|}}"></figure>
</section>

<section>
  <h2>{{s|s038|}}</h2>
  <pre class="cod" data-lang="java">// PossibleReordering.java
x = 0; y = 0; a = 0; b = 0;
Thread one   = new Thread(() -> { a = 1; x = b; });
Thread other = new Thread(() -> { b = 1; y = a; });
one.start(); other.start();
one.join();  other.join();
System.out.println("(" + x + "," + y + ")");</pre>
  <p>{{s|s039|}}</p>
  <figure class="interleaving" data-prog="riordino" data-titolo="{{a|s040|}}"></figure>
  <figure class="passi" data-titolo="{{a|s041|}}">
    <div class="passo"><div class="espr">interleaving possibili → <mark class="ok">(0,1)  (1,0)  (1,1)</mark></div><p class="nota">{{s|s042|}}</p></div>
    <div class="passo"><div class="espr">{{s|s043|}}</div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">a=1 → x=b → b=1 → y=a → <mark class="no">a=1</mark></div><p class="nota">{{s|s045|}}</p></div>
    <div class="passo"><div class="espr">x = b;   a = 1;        y = a;   b = 1;   <span class="mano">// riordinato</span></div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr">{{s|s047|}}</div><p class="nota">{{s|s048|}}</p></div>
  </figure>
  <h3>{{s|s049|}}</h3>
  <figure class="interleaving" data-prog="riordinoSync" data-titolo="{{a|s050|}}"></figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s051|}}</th><th>(0,0)</th><th>(0,1)</th><th>(1,0)</th><th>(1,1)</th></tr></thead>
    <tbody>
      <tr><td>{{s|s052|}}</td><td class="t-no">{{s|s053|}}</td><td>{{s|s054|}}</td><td>{{s|s055|}}</td><td>{{s|s056|}}</td></tr>
      <tr><td>{{s|s057|}}</td><td class="t-ok">{{s|s058|}}</td><td>{{s|s059|}}</td><td>{{s|s060|}}</td><td class="t-ok">{{s|s061|}}</td></tr>
      <tr><td>{{s|s062|}}</td><td class="t-ok">{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>{{s|s066|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s067|}}</p>
</section>

<section>
  <h2>{{s|s068|}}</h2>
  <p>{{s|s069|}}</p>
  <ul>
    <li>{{s|s070|}}</li>
    <li>{{s|s071|}}</li>
    <li>{{s|s072|}}</li>
    <li>{{s|s073|}}</li>
  </ul>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th></th><th>{{s|s074|}}</th><th>{{s|s075|}}</th><th>{{s|s076|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s077|}}</td><td class="t-ok">{{s|s078|}}</td><td class="t-ok">{{s|s079|}}</td><td class="t-no">{{s|s080|}}</td></tr>
      <tr><td>{{s|s081|}}</td><td class="t-ok">{{s|s082|}}</td><td class="t-ok">{{s|s083|}}</td><td class="t-ok">{{s|s084|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="volatilecount" data-titolo="{{a|s085|}}"></figure>
</section>

</main>
</body>
</html>
