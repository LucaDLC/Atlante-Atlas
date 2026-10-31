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
SCENE.fuga = {
  w: 600, h: 270, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'box', tipo: 'rett', x: 175, y: 26, w: 260, h: 212 },
    { id: 'tbox', tipo: 'testo', x: 305, y: 16, t: 'oggetto IntArrayList · lock = this', size: 12, bold: true },
    { id: 'T1', tipo: 'nodo', x: 60, y: 60, t: 'T1' },
    { id: 'T2', tipo: 'nodo', x: 60, y: 200, t: 'T2' },
    { id: 'set', tipo: 'nodo', x: 250, y: 60, t: 'set', forma: 'quadrato' },
    { id: 'get', tipo: 'nodo', x: 250, y: 200, t: 'get', forma: 'quadrato' },
    { id: 'a', tipo: 'nodo', x: 375, y: 120, t: 'a', sotto: 'la lista (class state)' },
    { id: 'copia', tipo: 'nodo', x: 520, y: 200, t: 'copia', nascosto: true },
    { id: 'T1set', tipo: 'arco', da: 'T1', a: 'set', dir: true, nascosto: true },
    { id: 'seta', tipo: 'arco', da: 'set', a: 'a', dir: true, t: 'a.set(0,1)', nascosto: true },
    { id: 'T2get', tipo: 'arco', da: 'T2', a: 'get', dir: true, nascosto: true },
    { id: 'geta', tipo: 'arco', da: 'get', a: 'a', dir: true, t: 'return a', nascosto: true },
    { id: 'T2a', tipo: 'arco', da: 'T2', a: 'a', dir: true, t: 'set(0,42)', nascosto: true },
    { id: 'getc', tipo: 'arco', da: 'get', a: 'copia', dir: true, nascosto: true },
    { id: 'cod', tipo: 'testo', x: 300, y: 262, t: '', size: 12.5 }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { T1: { tono: 'ora' }, T1set: { nascosto: false, tono: 'ora' }, set: { tono: 'ora' }, seta: { nascosto: false, tono: 'ora' }, a: { tono: 'ora' }, cod: { t: 'T1: array.set(0,1)  → con lock' } } },
    { nota: '{{j|s005|'}}', set: { T1: { tono: null }, T1set: { nascosto: true }, set: { tono: null }, seta: { nascosto: true }, a: { tono: 'due' }, T2: { tono: 'due' }, T2get: { nascosto: false, tono: 'due' }, get: { tono: 'due' }, geta: { nascosto: false, tono: 'due' }, cod: { t: 'T2: array.get()  → con lock, ritorna il riferimento' } } },
    { nota: '{{j|s006|'}}', set: { T2get: { nascosto: true }, geta: { nascosto: true }, get: { tono: null }, T2a: { nascosto: false, tono: 'no' }, T2: { tono: 'no' }, a: { tono: 'no' }, cod: { t: 'T2: array.get().set(0,42)  → senza lock' } } },
    { nota: '{{j|s007|'}}', set: { T1: { tono: 'ora' }, seta: { nascosto: false, tono: 'ora' }, set: { tono: 'ora' }, cod: { t: 'due scritture su a, non ordinate da happens-before' } } },
    { nota: '{{j|s008|'}}', set: { T1: { tono: null }, seta: { nascosto: true }, set: { tono: null }, T2a: { nascosto: true }, a: { tono: 'ok' }, T2: { tono: 'ok' }, get: { tono: 'ok' }, copia: { nascosto: false, tono: 'ok' }, getc: { nascosto: false, tono: 'ok', t: 'return new ArrayList<>(a)' }, cod: { t: 'lo stato resta dentro l\'oggetto' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const vedi = (ids, v) => Object.fromEntries(ids.map(k => [k, Object.assign({ nascosto: false }, v || {})]));

  // 1. correttezza e specifica
  const comp = ['server', 'GUI', 'database', 'rete', 'log', 'cache', 'scheduler', 'parser'];
  const og1 = [R('spec', 110, 16, 380, 36, 'specifica: "un solo scrittore, e solo senza lettori"', { tono: 'ok', nascosto: true })];
  comp.forEach((t, i) => og1.push(R('k' + i, 30 + (i % 4) * 140, 76 + Math.floor(i / 4) * 50, 120, 36, t, { tono: 'spento', nascosto: true })));
  og1.push(R('cls', 200, 76, 200, 86, '', { tono: 'dato', nascosto: true }), T('cl1', 300, 96, 'class ReadWriteMonitor', { bold: true, size: 12, nascosto: true }),
    T('cl2', 300, 122, 'campi: readers, writer', { size: 12, nascosto: true }), T('cl3', 300, 146, 'metodi: readLock(), writeLock()…', { size: 12, nascosto: true }));
  og1.push(N('t1', 90, 210, 't1', 'ora', { nascosto: true }), N('t2', 300, 210, 't2', 'ora', { nascosto: true }), N('t3', 510, 210, 't3', 'ora', { nascosto: true }));
  og1.push(F('f1', 110, 192, 220, 162, '', { nascosto: true }), F('f2', 300, 190, 300, 164, '', { nascosto: true }), F('f3', 490, 192, 380, 162, '', { nascosto: true }));
  SCENE.specifica = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: og1,
    passi: [
      { nota: "Un programma è <b>corretto</b> se rispetta la sua <b>specifica</b>: una frase precisa su cosa deve fare. Nel corso le specifiche restano frasi, niente logica formale.", set: vedi(['spec']) },
      { nota: "Un programma vero è enorme: server, interfaccia, database, migliaia di righe. Ragionare su tutti gli interleaving di tutto è ingestibile.", set: vedi(comp.map((_, i) => 'k' + i)) },
      { nota: "L'idea della programmazione a oggetti: analizzare <b>una classe alla volta</b>. Una classe ha dei campi (lo stato) e dei metodi che li leggono e scrivono.", set: Object.assign(Object.fromEntries(comp.map((_, i) => ['k' + i, { nascosto: true }])), vedi(['cls', 'cl1', 'cl2', 'cl3'])) },
      { nota: "In concorrenza, da fuori la classe vede solo due cose: <b>chiamate di metodo</b> e <b>accessi ai campi</b>, fatti da più thread insieme. La domanda diventa: comunque si intreccino queste chiamate, la classe si comporta bene? È la base della definizione di thread-safe.", set: vedi(['t1', 't2', 't3', 'f1', 'f2', 'f3']) }
    ]
  };

  // 2. la definizione
  SCENE.defts = {
    w: 600, h: 256, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      R('obj', 190, 20, 220, 120, '', { tono: 'spento' }), T('ot', 300, 38, 'oggetto c di classe C', { bold: true, size: 12 }),
      R('fa', 210, 56, 80, 34, 'campo x', { tono: 'dato' }), R('fb', 310, 56, 80, 34, 'campo y', { tono: 'dato' }),
      T('mt', 300, 120, 'metodi: m1(), m2(), m3()', { size: 12 }),
      N('t1', 70, 70, 't1', 'ora'), N('t2', 70, 150, 't2', 'ora'), N('t3', 530, 110, 't3', 'ora'),
      F('a1', 92, 70, 205, 72, 'm1()', { nascosto: true }), F('a2', 90, 145, 240, 94, 'm2()', { nascosto: true, tx: -80, ty: 34 }), F('a3', 508, 108, 395, 76, 'c.y = 5', { nascosto: true, tx: 10, ty: -10 }),
      T('c', 300, 200, '', { size: 12, bold: true }), T('c2', 300, 228, '', { size: 12 })
    ],
    passi: [
      { nota: "La definizione del corso: <b>una classe è thread-safe se nessuna esecuzione concorrente di chiamate di metodo o accessi ai campi, su oggetti della classe, produce data race sui campi della classe</b>." },
      { nota: "\"Esecuzione concorrente\": più thread usano lo <b>stesso</b> oggetto insieme, chiamando metodi e, se sono visibili, leggendo e scrivendo i campi direttamente.", set: vedi(['a1', 'a2', 'a3']) },
      { nota: "\"Nessuna data race sui campi\": per <b>ogni</b> coppia di accessi allo stesso campo con almeno una scrittura, c'è happens-before in un verso o nell'altro. <b>Qualsiasi</b> intreccio, non solo quelli che capitano nei test.", set: { fa: { tono: 'ok' }, fb: { tono: 'ok' }, c: { t: 'ogni coppia in conflitto sui campi è ordinata', tono: 'ok' } } },
      { nota: "Basta <b>una</b> esecuzione con una data race su un campo e la classe non è thread-safe. Qui t3 scrive y direttamente (campo pubblico, senza lock) mentre m2() lo legge sotto lock: non ordinati.", set: { fb: { tono: 'no' }, a3: { tono: 'no' }, c: { t: 'una sola data race su un campo ⇒ non thread-safe', tono: 'no' } } },
      { nota: "Cosa la definizione <b>non</b> promette: che il risultato sia quello giusto. Una classe thread-safe può comunque far parte di un programma con <b>race condition</b> (check-then-act, pagina confinamento). Thread-safe = niente data race, e basta.", set: { fb: { tono: 'ok' }, a3: { tono: null }, c: { t: 'thread-safe = niente data race sui campi', tono: 'ok' }, c2: { t: 'non vuol dire: niente race condition' } } }
    ]
  };

  // 3. la checklist applicata a un contatore
  const V = ['1 class state', '2 escaping', '3 safe publication', '4 immutability', '5 mutual exclusion'];
  const og3 = V.map((t, i) => R('v' + i, 20, 20 + i * 42, 190, 34, t, { tono: 'spento' }));
  og3.push(R('cod', 250, 20, 330, 110, '', { tono: 'spento' }),
    T('k1', 265, 44, 'class Counter {', { size: 12, anchor: 'start' }), T('k2', 280, 68, 'private int count;', { size: 12, anchor: 'start' }),
    T('k3', 280, 92, 'synchronized void inc() { count++; }', { size: 12, anchor: 'start' }), T('k4', 280, 116, 'synchronized int get() { return count; }', { size: 12, anchor: 'start' }),
    T('r', 415, 170, '', { size: 12, bold: true }), T('r2', 415, 196, '', { size: 12 }), T('fin', 300, 240, '', { size: 12, bold: true }));
  const pv = (i, a, b) => Object.assign(Object.fromEntries(V.map((_, k) => ['v' + k, { tono: k < i ? 'ok' : k === i ? 'ora' : 'spento' }])), { r: { t: a }, r2: { t: b } });
  SCENE.checklist = {
    w: 600, h: 256, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: og3,
    passi: [
      { nota: "Per dimostrare che una classe è thread-safe si passano <b>sempre</b> i cinque elementi, nell'ordine. Proviamo su un contatore." },
      { nota: "<b>1 · Class state</b>: quali sono i campi? Solo <code>count</code>. Sono le variabili condivise da proteggere.", set: pv(0, 'stato: count', '(i parametri dei metodi non contano)') },
      { nota: "<b>2 · Escaping</b>: lo stato è raggiungibile solo dai metodi? count è <code>private</code> e get() restituisce un int (una copia), non un riferimento allo stato.", set: pv(1, 'private, nessun riferimento esce', '') },
      { nota: "<b>3 · Safe publication</b>: i valori iniziali sono visibili a tutti i thread? count parte dal default 0, e l'inizializzazione di default happens-before ogni altra azione.", set: pv(2, 'count = 0 di default: pubblicato', '') },
      { nota: "<b>4 · Immutability</b>: quali campi non cambiano mai? Nessuno: count cambia a ogni inc(). Niente scorciatoie, serve il lock.", set: pv(3, 'count cambia: è mutabile', '') },
      { nota: "<b>5 · Mutual exclusion</b>: ogni accesso allo stato mutabile usa lo <b>stesso</b> lock? inc() e get() sono synchronized sul lock di this: la regola del monitor ordina ogni coppia di accessi.", set: pv(4, 'inc e get: stesso lock (this)', '') },
      { nota: "Tutti e cinque controllati: Counter è thread-safe. Una risposta che dice solo \"i metodi sono synchronized\" copre il punto 5 e basta: è incompleta.", set: Object.assign(pv(5, '', ''), { fin: { t: '5 elementi coperti ⇒ Counter è thread-safe', tono: 'ok' } }) }
    ]
  };

  // 4. class state: il parametro non è stato della classe
  SCENE.classstate = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      R('c', 60, 30, 200, 90, '', { tono: 'spento' }), T('ct', 160, 50, 'oggetto c : C', { bold: true, size: 12 }), R('ci', 100, 66, 120, 34, 'private int i', { tono: 'dato' }),
      R('l', 360, 50, 180, 50, 'ArrayList l', { tono: 'due' }),
      N('ta', 450, 190, 'A', 'ora'), N('tb', 160, 190, 'B', 'ora'),
      F('fa', 450, 168, 450, 104, 'l.add(1), senza lock', { tx: -60, ty: 40, nascosto: true }),
      F('fb', 160, 168, 160, 124, 'c.n(l)', { tx: 8, ty: 20, nascosto: true }), F('fb2', 262, 80, 356, 76, 'l.add(42)', { tx: -60, ty: -12, nascosto: true }),
      T('k', 300, 236, '', { size: 12, bold: true })
    ],
    passi: [
      { nota: "Lo <b>stato</b> di una classe sono i suoi <b>campi</b>. Lo stato di C è solo <code>i</code>. La lista l è un oggetto esterno: arriva a C come parametro del metodo n." },
      { nota: "Il thread A aggiunge alla lista <b>senza lock</b>.", set: vedi(['fa']) },
      { nota: "Il thread B chiama <code>c.n(l)</code>: n è synchronized (lock di c) e fa <code>l.add(42)</code>.", set: vedi(['fb', 'fb2']) },
      { nota: "Le due add sulla lista non sono ordinate: A non prende il lock di c. <b>Data race sulla lista</b>: il programma non è thread-safe (a volte la lista ha meno di 2 elementi).", set: { l: { tono: 'no' }, k: { t: 'data race sulla lista: il programma non è thread-safe', tono: 'no' } } },
      { nota: "Ma <b>C resta thread-safe</b>: la definizione guarda solo i campi di C, e su i non c'è nessuna data race. Una classe non può garantire happens-before su oggetti che altri usano senza passare da lei: meglio non scrivere metodi che modificano oggetti ricevuti come parametro.", set: { ci: { tono: 'ok' }, k: { t: 'C è thread-safe: la data race non è su un suo campo', tono: 'ok' } } }
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
  <p>{{s|s019|}}</p>
  <figure class="scena" data-scena="specifica" data-titolo="{{a|s020|}}"></figure>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <div class="box regola" data-tit="{{a|s022|}}">
    <p>{{s|s023|}}</p>
    <p>{{s|s024|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s025|}}">
    <p>{{s|s026|}}</p>
    <p>{{s|s027|}}</p>
  </div>
  <div class="box regola" data-tit="{{a|s028|}}">
    <p>{{s|s029|}}</p>
  </div>
  <div class="colonne">
    <div class="carta buona"><h4>{{s|s030|}}</h4><p>{{s|s031|}}</p></div>
    <div class="carta cattiva"><h4>{{s|s032|}}</h4><p>{{s|s033|}}</p></div>
  </div>
  <figure class="scena" data-scena="defts" data-titolo="{{a|s034|}}"></figure>
</section>

<section>
  <h2>{{s|s035|}}</h2>
  <p>{{s|s036|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>#</th><th>{{s|s037|}}</th><th>{{s|s038|}}</th><th>{{s|s039|}}</th></tr></thead>
    <tbody>
      <tr><td>1</td><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr>
      <tr><td>2</td><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr>
      <tr><td>3</td><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr>
      <tr><td>4</td><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td>{{s|s051|}}</td></tr>
      <tr><td>5</td><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box esame" data-tit="{{a|s055|}}">
    <p>{{s|s056|}}</p>
  </div>
  <figure class="scena" data-scena="checklist" data-titolo="{{a|s057|}}"></figure>
</section>

<section>
  <h2>{{s|s058|}}</h2>
  <p>{{s|s059|}}</p>
  <p>{{s|s060|}}</p>
  <figure class="codice" data-titolo="{{a|s061|}}">
<pre data-lang="java">class C {
    private int i = 0;                         // class state
    public synchronized void n(List&lt;Integer&gt; l) {
        l.add(42);                             // l non è class state
    }
}

ArrayList&lt;Integer&gt; l = new ArrayList&lt;&gt;();
C c = new C();
new Thread(() -> { l.add(1); }).start();      // senza lock
new Thread(() -> { c.n(l); }).start();        // con il lock di c</pre>
    <ol class="spiega">
      <li data-righe="1-2" data-segna="private int i = 0;@dato"><p>{{s|s062|}}</p></li>
      <li data-righe="3-4" data-segna="synchronized@ok|l.add(42)@due"><p>{{s|s063|}}</p></li>
      <li data-righe="10-11" data-segna="l.add(1)@no|c.n(l)@ok"><p>{{s|s064|}}</p></li>
      <li data-righe="1-6" data-segna="class C@ok"><p>{{s|s065|}}</p></li>
    </ol>
  </figure>
  <div class="box idea" data-tit="{{a|s066|}}">
    <p>{{s|s067|}}</p>
  </div>
  <figure class="scena" data-scena="classstate" data-titolo="{{a|s068|}}"></figure>
</section>

<section>
  <h2>{{s|s069|}}</h2>
  <div class="box regola" data-tit="{{a|s070|}}">
    <p>{{s|s071|}}</p>
  </div>

  <h3>{{s|s072|}}</h3>
  <figure class="codice" data-titolo="{{a|s073|}}">
<pre data-lang="java">class Counter {
    int i = 0;                                 // manca private
    public synchronized void inc() { i++; }
    public synchronized int get() { return i; }
}

Counter c = new Counter();
new Thread(() -> { c.inc(); }).start();       // (1) i++ con il lock
new Thread(() -> { c.i++; }).start();         // (2) i++ senza lock</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="int i = 0;@dato"><p>{{s|s074|}}</p></li>
      <li data-righe="3-4" data-segna="synchronized*@ok"><p>{{s|s075|}}</p></li>
      <li data-righe="8-9" data-segna="c.inc()@ok|c.i++@no"><p>{{s|s076|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s077|}}">
    <div class="passo"><div class="espr"><mark class="ora">t1(lock)</mark> → t1(1) → <mark class="ora">t1(unlock)</mark>      <mark class="no">t2(2)</mark></div><p class="nota">{{s|s078|}}</p></div>
    <div class="passo"><div class="espr">t1(1) e t2(2): stessa variabile <mark class="dato">i</mark>, due scritture</div><p class="nota">{{s|s079|}}</p></div>
    <div class="passo"><div class="espr">m(start(t1)) → t1(lock)      m(start(t2)) → t2(2)</div><p class="nota">{{s|s080|}}</p></div>
    <div class="passo"><div class="espr">regola del monitor: serve <mark class="no">un lock anche in t2</mark></div><p class="nota">{{s|s081|}}</p></div>
    <div class="passo"><div class="espr">t1(1) ↛ t2(2)  e  t2(2) ↛ t1(1)  ⇒  <mark class="no">data race sul campo i</mark>  ⇒  Counter non thread-safe</div><p class="nota">{{s|s082|}}</p></div>
  </figure>
  <p>{{s|s083|}}</p>

  <h3>{{s|s084|}}</h3>
  <p>{{s|s085|}}</p>
  <figure class="codice" data-titolo="{{a|s086|}}">
<pre data-lang="java">class IntArrayList {
    private final List&lt;Integer&gt; a = new ArrayList&lt;Integer&gt;();
    public synchronized void set(Integer index, Integer elem) { a.set(index, elem); }
    public synchronized List&lt;Integer&gt; get() { return a; }
}

IntArrayList array = new IntArrayList();
new Thread(() -> { array.set(0, 1); }).start();        // con lock
new Thread(() -> { array.get().set(0, 42); }).start(); // senza lock</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="private final@ok|a = new@dato"><p>{{s|s087|}}</p></li>
      <li data-righe="4" data-segna="return a;@no"><p>{{s|s088|}}</p></li>
      <li data-righe="9" data-segna=".set(0, 42)@no"><p>{{s|s089|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="fuga" data-titolo="{{a|s090|}}"></figure>
  <div class="box regola" data-tit="{{a|s091|}}">
    <p>{{s|s092|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s093|}}">
    <p>{{s|s094|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s095|}}">
    <p>{{s|s096|}}</p>
    <p>{{s|s097|}}</p>
    <p>{{s|s098|}}</p>
  </div>
</section>

</main>
</body>
</html>
