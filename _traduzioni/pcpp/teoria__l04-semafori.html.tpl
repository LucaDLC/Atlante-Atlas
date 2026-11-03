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
SCENE.buttafuori = {
  w: 620, h: 250, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'sc', tipo: 'rett', x: 330, y: 50, w: 200, h: 140 },
    { id: 'tsc', tipo: 'testo', x: 430, y: 40, t: 'sezione critica', size: 12.5, bold: true },
    { id: 'perm', tipo: 'testo', x: 150, y: 40, t: 'permits = 2', size: 16, bold: true },
    { id: 'T1', tipo: 'nodo', x: 40, y: 120, t: 'T1' },
    { id: 'T2', tipo: 'nodo', x: 105, y: 120, t: 'T2' },
    { id: 'T3', tipo: 'nodo', x: 170, y: 120, t: 'T3' },
    { id: 'T4', tipo: 'nodo', x: 235, y: 120, t: 'T4' },
    { id: 'cod', tipo: 'testo', x: 310, y: 232, t: 'new Semaphore(2)', size: 12.5 }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { T1: { x: 385, y: 100, tono: 'ora' }, perm: { t: 'permits = 1', tono: 'ora' }, cod: { t: 'T1: acquire()' } } },
    { nota: '{{j|s005|'}}', set: { T2: { x: 475, y: 100, tono: 'ora' }, perm: { t: 'permits = 0' }, cod: { t: 'T2: acquire()' } } },
    { nota: '{{j|s006|'}}', set: { T3: { tono: 'no', sotto: 'bloccato' }, perm: { tono: 'no' }, cod: { t: 'T3: acquire() → aspetta' } } },
    { nota: '{{j|s007|'}}', set: { T1: { x: 590, y: 120, tono: null }, T3: { x: 385, y: 100, tono: 'dato', sotto: '' }, perm: { tono: null }, cod: { t: 'T1: release() → sveglia T3' } } },
    { nota: '{{j|s008|'}}', set: { T2: { x: 590, y: 175, tono: null }, T3: { tono: 'ora' }, perm: { t: 'permits = 1', tono: 'ok' }, cod: { t: 'T2: release() → c++' } } },
    { nota: '{{j|s009|'}}', set: { T4: { x: 475, y: 100, tono: 'ora' }, perm: { t: 'permits = 0', tono: null }, cod: { t: 'T4: acquire()' } } },
    { nota: '{{j|s010|'}}', set: { perm: { t: 'permits = 1 (!)', tono: 'no' }, cod: { t: 'main: release() senza acquire()' } } }
  ]
};
SCENE.barriera = {
  w: 620, h: 250, lato: false,
  legenda: '{{j|s011|'}}',
  oggetti: [
    { id: 'bar', tipo: 'linea', x1: 330, y1: 30, x2: 330, y2: 205 },
    { id: 'tb', tipo: 'testo', x: 330, y: 22, t: 'barriera (parties = 3)', size: 12, bold: true },
    { id: 'T1', tipo: 'nodo', x: 60, y: 60, t: 'T1' },
    { id: 'T2', tipo: 'nodo', x: 60, y: 118, t: 'T2' },
    { id: 'T3', tipo: 'nodo', x: 60, y: 176, t: 'T3' },
    { id: 'cnt', tipo: 'testo', x: 330, y: 235, t: 'in attesa: 0 / 3', size: 13, bold: true }
  ],
  passi: [
    { nota: '{{j|s012|'}}' },
    { nota: '{{j|s013|'}}', set: { T2: { x: 300, tono: 'due' }, cnt: { t: 'in attesa: 1 / 3' } } },
    { nota: '{{j|s014|'}}', set: { T1: { x: 300, tono: 'due' }, cnt: { t: 'in attesa: 2 / 3' } } },
    { nota: '{{j|s015|'}}', set: { T3: { x: 300, tono: 'due' }, cnt: { t: 'in attesa: 3 / 3', tono: 'ok' }, bar: { tono: 'ok' } } },
    { nota: '{{j|s016|'}}', set: { T1: { x: 430, tono: 'ok' }, T2: { x: 430, tono: 'ok' }, T3: { x: 430, tono: 'ok' } } },
    { nota: '{{j|s017|'}}', set: { cnt: { t: 'in attesa: 0 / 3 (reset)', tono: null }, bar: { tono: null }, T1: { x: 560 }, T2: { x: 560 }, T3: { x: 560 } } }
  ]
};
SCENE.buffer = {
  w: 620, h: 240, lato: false,
  legenda: '{{j|s018|'}}',
  oggetti: [
    { id: 'sp', tipo: 'testo', x: 110, y: 40, t: 'spaces = 3', size: 15, bold: true },
    { id: 'it', tipo: 'testo', x: 510, y: 40, t: 'items = 0', size: 15, bold: true },
    { id: 'buf', tipo: 'celle', x: 235, y: 90, cw: 50, ch: 44, valori: ['', '', ''], indici: false },
    { id: 'P', tipo: 'nodo', x: 110, y: 112, t: 'P' },
    { id: 'C', tipo: 'nodo', x: 510, y: 112, t: 'C' },
    { id: 'tP', tipo: 'testo', x: 110, y: 160, t: 'produttore', size: 12 },
    { id: 'tC', tipo: 'testo', x: 510, y: 160, t: 'consumatore', size: 12 },
    { id: 'cod', tipo: 'testo', x: 310, y: 215, t: 'new BoundedBuffer(3)', size: 12.5 }
  ],
  passi: [
    { nota: '{{j|s019|'}}' },
    { nota: '{{j|s020|'}}', set: { buf: { valori: ['A', '', ''], toni: { 0: 'ora' } }, sp: { t: 'spaces = 2' }, it: { t: 'items = 1' }, P: { tono: 'ora' }, cod: { t: 'P: insert(A)' } } },
    { nota: '{{j|s021|'}}', set: { buf: { valori: ['A', 'B', ''], toni: { 1: 'ora' } }, sp: { t: 'spaces = 1' }, it: { t: 'items = 2' }, cod: { t: 'P: insert(B)' } } },
    { nota: '{{j|s022|'}}', set: { buf: { valori: ['B', '', ''], toni: {} }, sp: { t: 'spaces = 2' }, it: { t: 'items = 1' }, P: { tono: null }, C: { tono: 'ok', sopra: 'A' }, cod: { t: 'C: take() → A' } } },
    { nota: '{{j|s023|'}}', set: { buf: { valori: ['B', 'C', 'D'], toni: { 1: 'ora', 2: 'ora' } }, sp: { t: 'spaces = 0' }, it: { t: 'items = 3' }, C: { tono: null, sopra: '' }, P: { tono: 'ora' }, cod: { t: 'P: insert(C); insert(D)' } } },
    { nota: '{{j|s024|'}}', set: { buf: { toni: {} }, P: { tono: 'no', sopra: 'E' }, sp: { tono: 'no' }, cod: { t: 'P: insert(E) → spaces.acquire() blocca' } } },
    { nota: '{{j|s025|'}}', set: { buf: { valori: ['C', 'D', 'E'], toni: { 2: 'ora' } }, P: { tono: 'ora', sopra: '' }, sp: { tono: null }, C: { tono: 'ok', sopra: 'B' }, cod: { t: 'C: take() → B · P si sveglia e inserisce E' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 18 }, extra || {});

  // 1. Semaphore(5, true) dentro il monitor
  const og = [R('mon', 20, 30, 560, 150, '', { tono: 'spento' }), T('mt', 300, 22, '', { size: 12 }),
    R('sala', 300, 60, 260, 100, '', { tono: 'spento' }), T('salat', 430, 78, 'lettura (max 5)', { size: 12 }), R('perm', 40, 190, 240, 36, 'permessi liberi: 5', { tono: 'ok' }), T('c', 440, 210, '', { size: 12, bold: true })];
  for (let i = 0; i < 7; i++) og.push(N('r' + i, 60 + (i % 4) * 55, 80 + Math.floor(i / 4) * 55, 'R' + (i + 1), 'dato', { nascosto: i > 5 }));
  const dentro = i => ({ x: 330 + (i % 5) * 50, y: 125 });
  SCENE.semjava = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s026|'}}',
    oggetti: og,
    passi: [
      { nota: "L'esempio del corso: il ReadWriteMonitor lascia entrare <b>quanti</b> lettori vuole. Un <code>new Semaphore(5, true)</code> ne fa leggere al massimo <b>5 alla volta</b>. Sei lettori sono già passati da readLock().", set: { mt: { t: 'dentro il monitor (readLock fatto)' } } },
      { nota: "Ogni lettore chiama <code>semReaders.acquire()</code>: se c'è un permesso lo prende (il contatore scende) e prosegue.", set: Object.assign(Object.fromEntries([0, 1, 2, 3, 4].map(i => ['r' + i, Object.assign(dentro(i), { tono: 'ok' })])), { perm: { t: 'permessi liberi: 0', tono: 'no' } }) },
      { nota: "R6 chiama acquire() con 0 permessi: si <b>blocca</b> (senza consumare CPU) finché qualcuno non ne rilascia uno. acquire() può lanciare <code>InterruptedException</code>, che va gestita o dichiarata.", set: { r5: { tono: 'no' }, c: { t: 'R6: acquire() si blocca', tono: 'no' } } },
      { nota: "Arriva anche R7 e si mette in fila dietro R6.", set: { r6: { nascosto: false, tono: 'no' } } },
      { nota: "R1 finisce: <code>release()</code> restituisce il permesso (poi readUnlock(), in ordine inverso). Con <code>fair = true</code> il permesso va a chi aspetta da più tempo: R6, non R7.", set: { r0: { x: 578, y: 212, tono: 'dato' }, r5: Object.assign(dentro(0), { tono: 'ok' }), c: { t: 'fair: entra R6, il più vecchio', tono: 'ok' } } }
    ]
  };

  // 2. bounded buffer con tre semafori
  const cella = i => R('q' + i, 220 + i * 60, 40, 56, 40, '', { tono: 'spento' });
  SCENE.buffer41 = {
    w: 600, h: 256, lato: true,
    legenda: '{{j|s027|'}}',
    oggetti: [
      T('qt', 280, 28, 'queue (capacità 2)', { size: 12 }), cella(0), cella(1),
      R('sp', 20, 110, 170, 36, 'spaces = 2', { tono: 'ok' }), R('it', 215, 110, 170, 36, 'items = 0', { tono: 'no' }), R('mx', 410, 110, 170, 36, 'mutex = 1', { tono: 'ok' }),
      T('op', 300, 180, '', { size: 12, bold: true }), T('op2', 300, 206, '', { size: 12 }), T('op3', 300, 232, '', { size: 12 })
    ],
    passi: [
      { nota: "Tre semafori, tre compiti: <b>spaces</b> conta i posti liberi (parte dalla capacità), <b>items</b> conta gli elementi da prendere (parte da 0), <b>mutex</b> (1 permesso) protegge la LinkedList, che non è thread-safe." },
      { nota: "<code>insert(A)</code>: spaces.acquire() prende un posto (2 → 1), mutex.acquire(), addLast, mutex.release(), poi items.release() (0 → 1): un consumatore ora può prendere.", set: { q0: { t: 'A', tono: 'dato' }, sp: { t: 'spaces = 1' }, it: { t: 'items = 1', tono: 'ok' }, op: { t: 'insert(A)' } } },
      { nota: "<code>insert(B)</code>: stesso giro. Il buffer è pieno: spaces = 0.", set: { q1: { t: 'B', tono: 'dato' }, sp: { t: 'spaces = 0', tono: 'no' }, it: { t: 'items = 2' }, op: { t: 'insert(B): buffer pieno' } } },
      { nota: "<code>insert(C)</code>: spaces.acquire() con 0 permessi, il produttore si <b>blocca</b>. Nota: si blocca <b>prima</b> di prendere il mutex, quindi i consumatori possono ancora entrare.", set: { op: { t: 'insert(C): bloccato in spaces.acquire()', tono: 'no' } } },
      { nota: "<code>take()</code>: items.acquire() (2 → 1), mutex, removeFirst prende A (FIFO), mutex.release(), spaces.release() (0 → 1). Il produttore bloccato si sveglia e inserisce C.", set: { q0: { t: 'B' }, q1: { t: 'C' }, sp: { t: 'spaces = 0' }, op: { t: 'take() → A, poi insert(C) riparte', tono: 'ok' } } },
      { nota: "L'ordine conta: se insert facesse <b>mutex.acquire() prima di spaces.acquire()</b>, a buffer pieno il produttore si bloccherebbe <b>tenendo</b> il mutex. Il consumatore non potrebbe più entrare a liberare un posto: <b>deadlock</b>.", set: { op2: { t: 'sbagliato: mutex.acquire(); spaces.acquire();', tono: 'no' }, op3: { t: 'pieno + mutex preso = nessuno può più prendere: deadlock' } } }
    ]
  };

  // 3. MySemaphore e MyBarrier
  SCENE.mysem = {
    w: 600, h: 256, lato: true,
    legenda: '{{j|s028|'}}',
    oggetti: [
      R('st', 20, 20, 180, 40, 'permits = 1', { tono: 'ok' }), R('cq', 400, 30, 180, 80, '', { tono: 'spento' }), T('cqt', 490, 22, 'coda della condition positive', { size: 11 }),
      N('a', 60, 130, 'A', 'dato'), N('b', 120, 130, 'B', 'dato'),
      T('c', 300, 190, '', { size: 12, bold: true }),
      R('gate', 150, 200, 300, 36, 'MyBarrier: gate = MySemaphore(0)', { tono: 'no', nascosto: true })
    ],
    passi: [
      { nota: "4.3: un semaforo costruito con un <b>monitor</b>: il contatore <code>permits</code> protetto da un ReentrantLock, e una condition <code>positive</code> = \"ci sono permessi\". Qui permits parte da 1." },
      { nota: "A chiama <code>acquire()</code>: prende il lock, <code>while (permits == 0)</code> è falso, quindi permits-- (1 → 0) e rilascia il lock.", set: { a: { x: 300, y: 130, tono: 'ok' }, st: { t: 'permits = 0', tono: 'no' }, c: { t: 'A: permits-- → 0' } } },
      { nota: "B chiama acquire(): permits == 0, quindi <code>positive.await()</code>: rilascia il lock e aspetta nella coda della condition.", set: { b: { x: 490, y: 70, tono: 'due' }, c: { t: 'B: await() sulla condition' } } },
      { nota: "A chiama <code>release()</code>: permits++ (0 → 1) e <code>positive.signal()</code>. È la versione Mesa: il permesso torna nel contatore, non viene \"passato\" a B.", set: { a: { x: 60, y: 130, tono: 'dato' }, st: { t: 'permits = 1', tono: 'ok' }, c: { t: 'A: permits++, signal()' } } },
      { nota: "B si sveglia, riprende il lock e <b>ricontrolla</b> il while (per questo while e non if: anche un risveglio spurio va gestito). permits è 1: lo prende.", set: { b: { x: 300, y: 130, tono: 'ok' }, st: { t: 'permits = 0', tono: 'no' }, c: { t: 'B ricontrolla, poi permits-- → 0', tono: 'ok' } } },
      { nota: "Con i semafori si costruisce poi una <b>barriera</b>: un contatore degli arrivati protetto da un mutex, e un gate con 0 permessi. Chi arriva e non è l'ultimo aspetta al gate; l'ultimo fa parties − 1 release. Funziona anche se l'ultimo apre prima che gli altri arrivino al gate: il semaforo <b>ricorda</b> i permessi, un signal() senza nessuno in attesa invece va perso.", set: { gate: { nascosto: false }, c: { t: 'semaforo: i permessi restano · signal: si perde se nessuno aspetta' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s029|}}</h1>
  <p class="lede">{{s|s030|}}</p>
</header>

<section>
  <h2>{{s|s031|}}</h2>
  <p>{{s|s032|}}</p>
  <div class="box regola" data-tit="{{a|s033|}}">
    <p>{{s|s034|}}</p>
    <ul>
      <li>{{s|s035|}}</li>
      <li>{{s|s036|}}</li>
      <li>{{s|s037|}}</li>
    </ul>
    <p>{{s|s038|}}</p>
  </div>
  <figure class="scena" data-scena="buttafuori" data-titolo="{{a|s039|}}"></figure>
  <div class="colonne">
    <div class="carta"><h4>{{s|s040|}}</h4><p>{{s|s041|}}</p></div>
    <div class="carta"><h4>{{s|s042|}}</h4><p>{{s|s043|}}</p></div>
  </div>
  <div class="box regola" data-tit="{{a|s044|}}">
    <p>{{s|s045|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s046|}}</h2>
  <figure class="codice" data-titolo="{{a|s047|}}">
<pre data-lang="java">ReadWriteMonitor m = new ReadWriteMonitor();
Semaphore semReaders = new Semaphore(5, true);
// ogni lettore:
m.readLock();
semReaders.acquire();
// legge
semReaders.release();
m.readUnlock();</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="5@dato|true@ok"><p>{{s|s048|}}</p></li>
      <li data-righe="4-5" data-segna="m.readLock();@due|semReaders.acquire();@ora"><p>{{s|s049|}}</p></li>
      <li data-righe="7-8" data-segna="semReaders.release();@ora|m.readUnlock();@due"><p>{{s|s050|}}</p></li>
    </ol>
  </figure>
  <div class="box attenzione" data-tit="{{a|s051|}}">
    <p>{{s|s052|}}</p>
  </div>
  <figure class="scena" data-scena="semjava" data-titolo="{{a|s053|}}"></figure>
</section>

<section>
  <h2>{{s|s054|}}</h2>
  <div class="box regola" data-tit="{{a|s055|}}">
    <p>{{s|s056|}}</p>
  </div>
  <figure class="scena" data-scena="barriera" data-titolo="{{a|s057|}}"></figure>
  <figure class="codice" data-titolo="{{a|s058|}}">
<pre data-lang="java">int parties = 10;
CyclicBarrier cb = new CyclicBarrier(parties);
int[] shared_array = new int[parties];

// run() del thread numero index
shared_array[index] = index + 1;
try { cb.await(); } catch (InterruptedException | BrokenBarrierException e) { }
System.out.println(shared_array[(index + 1) % parties]);</pre>
    <ol class="spiega">
      <li data-righe="1-3" data-segna="new CyclicBarrier(parties)@ok|shared_array@dato"><p>{{s|s059|}}</p></li>
      <li data-righe="6" data-segna="shared_array[index]@dato"><p>{{s|s060|}}</p></li>
      <li data-righe="7" data-segna="cb.await()@ok|BrokenBarrierException@no"><p>{{s|s061|}}</p></li>
      <li data-righe="8" data-segna="(index + 1) % parties@due"><p>{{s|s062|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s063|}}">
    <p>{{s|s064|}}</p>
    <p>{{s|s065|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s066|}}" data-legenda="{{a|s067|}}">
    <div class="passo"><div class="espr">new CyclicBarrier(<mark class="dato">N</mark> + <mark class="due">1</mark>)</div><p class="nota">{{s|s068|}}</p></div>
    <div class="passo"><div class="espr">{{s|s069|}}</div><p class="nota">{{s|s070|}}</p></div>
    <div class="passo"><div class="espr"><mark class="due">main</mark>: await()    → N+1 / N+1  → <mark class="ok">aperta</mark>, reset a 0</div><p class="nota">{{s|s071|}}</p></div>
    <div class="passo"><div class="espr">{{s|s072|}}</div><p class="nota">{{s|s073|}}</p></div>
    <div class="passo"><div class="espr">{{s|s074|}}</div><p class="nota">{{s|s075|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s076|}}">
    <p>{{s|s077|}}</p>
    <p>{{s|s078|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s079|}}</h2>
  <ul>
    <li>{{s|s080|}}</li>
    <li>{{s|s081|}}</li>
    <li>{{s|s082|}}</li>
    <li>{{s|s083|}}</li>
  </ul>
  <p>{{s|s084|}}</p>
  <figure class="scena" data-scena="buffer" data-titolo="{{a|s085|}}"></figure>
</section>

<section>
  <h2>{{s|s086|}}</h2>
  <p>{{s|s087|}}</p>
  <figure class="codice" data-titolo="{{a|s088|}}">
<pre data-lang="java">public class BoundedBuffer&lt;T&gt; implements BoundedBufferInteface&lt;T&gt; {
    private final LinkedList&lt;T&gt; queue = new LinkedList&lt;&gt;();
    private final Semaphore items = new Semaphore(0);   // elementi da prendere
    private final Semaphore spaces;                     // posti liberi
    private final Semaphore mutex = new Semaphore(1);   // mutua esclusione sulla coda

    public BoundedBuffer(int capacity) {
        spaces = new Semaphore(capacity);
    }

    public void insert(T elem) throws InterruptedException {
        spaces.acquire();
        mutex.acquire();
        try { queue.addLast(elem); } finally { mutex.release(); }
        items.release();
    }

    public T take() throws InterruptedException {
        items.acquire();
        T elem;
        mutex.acquire();
        try { elem = queue.removeFirst(); } finally { mutex.release(); }
        spaces.release();
        return elem;
    }
}</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="implements BoundedBufferInteface&lt;T&gt;@dato"><p>{{s|s089|}}</p></li>
      <li data-righe="2" data-segna="LinkedList&lt;T&gt;@dato"><p>{{s|s090|}}</p></li>
      <li data-righe="3-5" data-segna="items@ok|spaces@due|mutex@ora"><p>{{s|s091|}}</p></li>
      <li data-righe="7-9" data-segna="new Semaphore(capacity)@due"><p>{{s|s092|}}</p></li>
      <li data-righe="11-12" data-segna="spaces.acquire();@due"><p>{{s|s093|}}</p></li>
      <li data-righe="13-14" data-segna="mutex.acquire();@ora|queue.addLast(elem);@dato|mutex.release();@ora"><p>{{s|s094|}}</p></li>
      <li data-righe="15" data-segna="items.release();@ok"><p>{{s|s095|}}</p></li>
      <li data-righe="18-19" data-segna="items.acquire();@ok"><p>{{s|s096|}}</p></li>
      <li data-righe="21-22" data-segna="queue.removeFirst()@dato"><p>{{s|s097|}}</p></li>
      <li data-righe="23-24" data-segna="spaces.release();@due"><p>{{s|s098|}}</p></li>
      <li data-righe="12-13" data-segna="spaces.acquire();@due|mutex.acquire();@ora"><p>{{s|s099|}}</p></li>
    </ol>
  </figure>

  <h3>{{s|s100|}}</h3>
  <figure class="passi" data-titolo="{{a|s101|}}">
    <div class="passo"><div class="espr">1. <mark class="dato">class state</mark> = { queue, items, spaces, mutex }</div><p class="nota">{{s|s102|}}</p></div>
    <div class="passo"><div class="espr">{{s|s103|}}</div><p class="nota">{{s|s104|}}</p></div>
    <div class="passo"><div class="espr">{{s|s105|}}</div><p class="nota">{{s|s106|}}</p></div>
    <div class="passo"><div class="espr">{{s|s107|}}</div><p class="nota">{{s|s108|}}</p></div>
    <div class="passo"><div class="espr">{{s|s109|}}</div><p class="nota">{{s|s110|}}</p></div>
  </figure>
  <div class="box inglese" data-tit="{{a|s111|}}">
    <p>{{s|s112|}}</p>
  </div>

  <h3>{{s|s113|}}</h3>
  <p>{{s|s114|}}</p>

  <h3>{{s|s115|}}</h3>
  <ul>
    <li>{{s|s116|}}</li>
    <li>{{s|s117|}}</li>
    <li>{{s|s118|}}</li>
  </ul>
  <figure class="scena" data-scena="buffer41" data-titolo="{{a|s119|}}"></figure>
</section>

<section>
  <h2>{{s|s120|}}</h2>
  <p>{{s|s121|}}</p>
  <figure class="codice" data-titolo="{{a|s122|}}">
<pre data-lang="java">class MySemaphore {
    private int permits;                                  // protetto da lock
    private final Lock lock = new ReentrantLock();
    private final Condition positive = lock.newCondition();

    public MySemaphore(int permits) {
        lock.lock();
        try { this.permits = permits; } finally { lock.unlock(); }
    }

    public void acquire() throws InterruptedException {
        lock.lock();
        try {
            while (permits == 0) positive.await();
            permits--;
        } finally { lock.unlock(); }
    }

    public void release() {
        lock.lock();
        try {
            permits++;
            positive.signal();
        } finally { lock.unlock(); }
    }
}</pre>
    <ol class="spiega">
      <li data-righe="2-4" data-segna="permits@dato|positive@ok"><p>{{s|s123|}}</p></li>
      <li data-righe="6-9" data-segna="this.permits = permits;@dato"><p>{{s|s124|}}</p></li>
      <li data-righe="14" data-segna="while (permits == 0)@no|positive.await()@ok"><p>{{s|s125|}}</p></li>
      <li data-righe="15" data-segna="permits--;@ora"><p>{{s|s126|}}</p></li>
      <li data-righe="22-23" data-segna="permits++;@ora|positive.signal();@ok"><p>{{s|s127|}}</p></li>
    </ol>
  </figure>
  <figure class="codice" data-titolo="{{a|s128|}}">
<pre data-lang="java">class MyBarrier {
    private final int parties;
    private int waiting = 0;                              // protetto da mutex
    private final MySemaphore mutex = new MySemaphore(1);
    private final MySemaphore gate = new MySemaphore(0);

    public MyBarrier(int parties) { this.parties = parties; }

    public void await() throws InterruptedException {
        mutex.acquire();
        waiting++;
        if (waiting &lt; parties) {
            mutex.release();
            gate.acquire();                               // aspetta che arrivino tutti
        } else {
            if (waiting == parties)
                for (int i = 0; i &lt; parties - 1; i++) gate.release();
            mutex.release();
        }
    }
}</pre>
    <ol class="spiega">
      <li data-righe="3-5" data-segna="waiting@dato|mutex@ora|gate@ok"><p>{{s|s129|}}</p></li>
      <li data-righe="10-11" data-segna="mutex.acquire();@ora|waiting++;@dato"><p>{{s|s130|}}</p></li>
      <li data-righe="12-14" data-segna="mutex.release();@ora|gate.acquire();@ok"><p>{{s|s131|}}</p></li>
      <li data-righe="16-17" data-segna="gate.release()@ok"><p>{{s|s132|}}</p></li>
      <li data-righe="13-14" data-segna="mutex.release();@ora|gate.acquire();@ok"><p>{{s|s133|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="mysem" data-titolo="{{a|s134|}}"></figure>
</section>

</main>
</body>
</html>
