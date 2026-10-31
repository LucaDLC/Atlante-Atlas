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
SCENE.duelock = {
  w: 600, h: 260, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 't1', tipo: 'nodo', x: 60, y: 60, t: 't1', tono: 'dato' },
    { id: 't2', tipo: 'nodo', x: 60, y: 200, t: 't2', tono: 'due' },
    { id: 'Lm', tipo: 'rett', x: 170, y: 40, w: 190, h: 40, t: 'lock di m (this)' },
    { id: 'Lc', tipo: 'rett', x: 170, y: 180, w: 190, h: 40, t: 'lock di Mystery.class' },
    { id: 'sum', tipo: 'nodo', forma: 'quadrato', r: 30, x: 510, y: 130, t: 'sum' },
    { id: 'p1', tipo: 'linea', x1: 85, y1: 60, x2: 170, y2: 60, nascosto: true },
    { id: 'p2', tipo: 'linea', x1: 85, y1: 200, x2: 170, y2: 200, nascosto: true },
    { id: 'a1', tipo: 'vett', x1: 360, y1: 60, x2: 480, y2: 115, nascosto: true },
    { id: 'a2', tipo: 'vett', x1: 360, y1: 200, x2: 480, y2: 145, nascosto: true },
    { id: 'nota', tipo: 'testo', x: 300, y: 130, t: '', size: 12.5, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { p1: { nascosto: false, tono: 'dato' }, Lm: { tono: 'dato' } } },
    { nota: '{{j|s005|'}}', set: { p2: { nascosto: false, tono: 'due' }, Lc: { tono: 'due' } } },
    { nota: '{{j|s006|'}}', set: { a1: { nascosto: false, tono: 'no' }, a2: { nascosto: false, tono: 'no' }, sum: { tono: 'no' }, nota: { t: 'due lock ≠ mutua esclusione', tono: 'no' } } },
    { nota: '{{j|s007|'}}', set: { a1: { nascosto: true }, a2: { nascosto: true }, sum: { tono: null }, nota: { t: '' }, p1: { x2: 170, y2: 200, tono: 'dato' }, Lm: { tono: 'spento' }, Lc: { tono: 'dato' } } },
    { nota: '{{j|s008|'}}', set: { p2: { tono: 'no' }, a1: { nascosto: false, tono: 'ok' }, sum: { tono: 'ok' }, nota: { t: 'stesso lock → un thread alla volta', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 18 }, extra || {});

  // 1. blocco synchronized
  SCENE.syncblock = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      R('blk', 200, 50, 200, 110, '', { tono: 'spento' }), T('tb', 300, 40, 'synchronized (o) { … }', { bold: true, size: 12 }),
      R('lk', 460, 70, 120, 36, 'lock di o: libero', { tono: 'ok' }),
      N('t', 100, 105, 't', 'dato'),
      T('c', 300, 200, '', { bold: true, size: 12 })
    ],
    passi: [
      { nota: "Ogni oggetto Java ha un <b>lock intrinseco</b>. <code>synchronized (o) { … }</code> lo usa per il blocco." },
      { nota: "Entrando nel blocco il thread <b>prende</b> il lock di o (se è occupato, aspetta).", set: { t: { x: 300, y: 105, tono: 'ora' }, lk: { t: 'lock di o: di t', tono: 'ora' } } },
      { nota: "Dentro il blocco viene lanciata un'eccezione.", set: { t: { tono: 'no' }, c: { t: 'throw new RuntimeException()', tono: 'no' } } },
      { nota: "Uscendo dal blocco, <b>in qualunque modo</b> (fine normale, return, eccezione), il lock si rilascia da solo. È esattamente lock + try/finally, scritto dal compilatore per te (verificato: dopo l'eccezione <code>Thread.holdsLock(o)</code> è false). Ed è rientrante, come ReentrantLock.", set: { t: { x: 520, y: 180, tono: 'dato' }, lk: { t: 'lock di o: libero', tono: 'ok' }, c: { t: 'uscita dal blocco = unlock automatico', tono: 'ok' } } }
    ]
  };

  // 2. quale lock
  SCENE.qualelock = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      R('o1', 40, 40, 150, 50, 'oggetto c1 (lock)', { tono: 'dato' }), R('o2', 40, 150, 150, 50, 'oggetto c2 (lock)', { tono: 'due' }),
      R('cl', 400, 95, 170, 50, 'C.class (lock)', { tono: 'ora' }),
      N('t1', 260, 65, 't1', null), N('t2', 260, 175, 't2', null),
      T('c', 300, 232, '', { bold: true, size: 12 })
    ],
    passi: [
      { nota: "Due oggetti della stessa classe C, c1 e c2, e due thread." },
      { nota: "Metodi d'<b>istanza</b> synchronized: t1 chiama c1.method(), t2 chiama c2.method(). Ognuno prende il lock <b>del suo oggetto</b> (this): due lock diversi, quindi girano <b>insieme</b>.", set: { t1: { x: 212, y: 65, tono: 'dato' }, t2: { x: 212, y: 175, tono: 'due' }, c: { t: 'this: due lock, nessuna attesa' } } },
      { nota: "Metodi <b>static</b> synchronized: il lock è quello di <b>C.class</b>, l'oggetto che rappresenta la classe. Ce n'è uno solo per tutti.", set: { t1: { x: 485, y: 170, tono: 'ora' }, t2: { x: 330, y: 175, tono: 'no' }, c: { t: 'C.class: un lock, t2 aspetta', tono: 'no' } } },
      { nota: "Conseguenza (esercizio 2.3, Mystery): un campo <b>static</b> modificato sia da metodi static sia da metodi d'istanza è protetto da <b>due lock diversi</b>, quindi <b>non</b> è protetto. Regola: una variabile condivisa va sempre protetta dallo <b>stesso</b> lock.", set: { c: { t: 'stessa variabile → stesso lock', tono: 'ok' } } }
    ]
  };

  // 3. wait e notify tenendo il lock
  SCENE.waitlock = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      R('cod', 30, 40, 250, 40, 'o.wait();', { tono: 'dato' }),
      T('e', 440, 60, '', { size: 12, bold: true }),
      R('cod2', 30, 120, 250, 40, 'synchronized (o) { o.wait(); }', { tono: 'ok', nascosto: true }),
      T('e2', 440, 140, '', { size: 12, bold: true }), T('c', 300, 205, '', { size: 12 })
    ],
    passi: [
      { nota: "<code>wait()</code>, <code>notify()</code>, <code>notifyAll()</code> sono i corrispondenti di await, signal, signalAll per il lock intrinseco. Ma vanno chiamati <b>tenendo</b> il lock di quell'oggetto." },
      { nota: "Chiamare <code>o.wait()</code> senza essere dentro <code>synchronized (o)</code> fa fallire il programma: <code>java.lang.IllegalMonitorStateException: current thread is not owner</code> (errore vero, JDK 26).", set: { cod: { tono: 'no' }, e: { t: 'IllegalMonitorStateException', tono: 'no' } } },
      { nota: "Dentro <code>synchronized (o)</code> funziona: wait rilascia il lock di o e aspetta, come await. In un metodo synchronized si scrive <code>this.wait()</code>.", set: { cod2: { nascosto: false }, e2: { t: 'ok: rilascia il lock e aspetta', tono: 'ok' } } },
      { nota: "Rispetto a ReentrantLock c'è una sola differenza di fondo: ogni oggetto ha <b>una sola</b> condition, mentre un Lock può crearne quante ne servono con <code>newCondition()</code>.", set: { c: { t: 'synchronized: 1 condition per oggetto' } } }
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
  <div class="colonne">
    <div class="carta">
      <h4>{{s|s016|}}</h4>
      <pre class="cod" data-lang="java">Lock l = new ReentrantLock();
l.lock();
try {
    // sezione critica
} finally {
    l.unlock();
}</pre>
    </div>
    <div class="carta">
      <h4>{{s|s017|}}</h4>
      <pre class="cod" data-lang="java">Object o = new Object();
synchronized (o) {
    // sezione critica
}</pre>
      <p>{{s|s018|}}</p>
    </div>
  </div>
  <figure class="scena" data-scena="syncblock" data-titolo="{{a|s019|}}"></figure>
</section>

<section>
  <h2>{{s|s020|}}</h2>
  <p>{{s|s021|}}</p>
  <figure class="passi" data-titolo="{{a|s022|}}">
    <div class="passo">
      <div class="espr">class C {
  public <mark class="dato">synchronized</mark> T method() { … }
}</div>
      <p class="nota">{{s|s023|}}</p>
    </div>
    <div class="passo">
      <div class="espr">class C {
  public T method() { <mark class="dato">synchronized (this)</mark> { … } }
}</div>
      <p class="nota">{{s|s024|}}</p>
    </div>
    <div class="passo">
      <div class="espr">class C {
  public <mark class="due">static synchronized</mark> T method() { … }
}</div>
      <p class="nota">{{s|s025|}}</p>
    </div>
    <div class="passo">
      <div class="espr">class C {
  public static T method() { <mark class="due">synchronized (C.class)</mark> { … } }
}</div>
      <p class="nota">{{s|s026|}}</p>
    </div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s027|}}</th><th>{{s|s028|}}</th><th>{{s|s029|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr>
      <tr><td>{{s|s033|}}</td><td>{{s|s034|}}</td><td>{{s|s035|}}</td></tr>
      <tr><td>{{s|s036|}}</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="qualelock" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <pre class="cod" data-lang="java">class Mystery {
    private static double sum = 0;
    public static synchronized void addStatic(double x) { sum += x; }
    public synchronized void addInstance(double x)      { sum += x; }
    public static synchronized double sum()             { return sum; }
}</pre>
  <p>{{s|s041|}}</p>
  <figure class="scena" data-scena="duelock" data-titolo="{{a|s042|}}"></figure>
  <figure class="codice" data-titolo="{{a|s043|}}">
<pre data-lang="java">class Mystery {
    private static double sum = 0;
    public static synchronized void addStatic(double x) { sum += x; }
    public synchronized void addInstance(double x) {
        synchronized (Mystery.class) { sum += x; }
    }
    public static synchronized double sum() { return sum; }
}</pre>
    <ol class="spiega">
      <li data-righe="3" data-segna="static synchronized@due"><p>{{s|s044|}}</p></li>
      <li data-righe="5" data-segna="synchronized (Mystery.class)@ok"><p>{{s|s045|}}</p></li>
      <li data-righe="4" data-segna="synchronized@due"><p>{{s|s046|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s047|}}">
    <p>{{s|s048|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s049|}}">
    <p>{{s|s050|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s051|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s052|}}</th><th>{{s|s053|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s054|}}</td><td>{{s|s055|}}</td></tr>
      <tr><td>{{s|s056|}}</td><td>{{s|s057|}}</td></tr>
      <tr><td>{{s|s058|}}</td><td>{{s|s059|}}</td></tr>
      <tr><td>{{s|s060|}}</td><td>{{s|s061|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s062|}}</p>
  <figure class="scena" data-scena="waitlock" data-titolo="{{a|s063|}}"></figure>
</section>

</main>
</body>
</html>
