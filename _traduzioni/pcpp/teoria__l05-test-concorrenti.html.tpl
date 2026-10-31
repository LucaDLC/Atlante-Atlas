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
window.SCENE = window.SCENE || {};
SCENE.barriera = {
  w: 560, h: 300, lato: false,
  legenda: '{{j|s002|'}}',
  codice: { lang: 'java', testo: `barrier = new CyclicBarrier(nrThreads + 1);
for (int i = 0; i < nrThreads; i++)
  new Thread(() -> {
    barrier.await();            // aspetta il via
    for (...) set.add(i);       // il lavoro da testare
    barrier.await();            // ho finito
  }).start();
barrier.await();                // il main da il via
barrier.await();                // il main aspetta la fine
assertEquals(N, set.size());` },
  oggetti: [
    { id: 'bar', tipo: 'linea', x1: 300, y1: 20, x2: 300, y2: 250, tratt: true, tono: 'no' },
    { id: 'tb', tipo: 'testo', x: 300, y: 270, t: 'barriera', size: 13, bold: true },
    { id: 't1', tipo: 'nodo', r: 20, x: 60, y: 50, t: 't1', tono: 'dato' },
    { id: 't2', tipo: 'nodo', r: 20, x: 60, y: 105, t: 't2', tono: 'dato' },
    { id: 't3', tipo: 'nodo', r: 20, x: 60, y: 160, t: 't3', tono: 'dato' },
    { id: 'mn', tipo: 'nodo', forma: 'quadrato', r: 22, x: 60, y: 220, t: 'main', tono: 'due' },
    { id: 'n', tipo: 'testo', x: 440, y: 30, t: 'in attesa: 0 / 4', size: 13, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}', righe: [1] },
    { nota: '{{j|s004|'}}', righe: [4], set: { t1: { x: 270, tono: 'ora' }, n: { t: 'in attesa: 1 / 4' } } },
    { nota: '{{j|s005|'}}', righe: [4], set: { t2: { x: 270, tono: 'ora' }, n: { t: 'in attesa: 2 / 4' } } },
    { nota: '{{j|s006|'}}', righe: [4], set: { t3: { x: 270, tono: 'ora' }, n: { t: 'in attesa: 3 / 4' } } },
    { nota: '{{j|s007|'}}', righe: [8, 5], set: { mn: { x: 270, tono: 'ora' }, t1: { x: 420, tono: 'ok' }, t2: { x: 420, tono: 'ok' }, t3: { x: 420, tono: 'ok' }, n: { t: 'aperta: via!', tono: 'ok' } } },
    { nota: '{{j|s008|'}}', righe: [6, 9, 10], set: { mn: { x: 420, tono: 'ok' }, n: { t: 'assertEquals(N, set.size())', tono: 'ok' } } }
  ]
};
window.PROGRAMMI = window.PROGRAMMI || {};
PROGRAMMI.addset = {
  memoria: { set: [], size: 0 },
  thread: ['t1', 't2'],
  locali: { c: false },
  passi: [
    { n: 1, codice: 'boolean c = set.contains(5);', fai: (m, l) => { l.c = m.set.includes(5); } },
    { n: 2, codice: 'if (!c) tab[i] = new Node(5);', fai: (m, l) => { if (!l.c) m.set = [5]; } },
    { n: 3, codice: 'if (!c) size++;', fai: (m, l) => { if (!l.c) m.size++; } }
  ],
  esito: m => 'set = [' + m.set.join(', ') + '], size = ' + m.size,
  giusto: m => m.size === 1
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 18 }, extra || {});

    SCENE.sem52 = {
      w: 600, h: 240, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [
        R('st', 30, 20, 180, 40, 'state = 0', { tono: 'spento' }), R('cap', 230, 20, 150, 40, 'capacity = 2', { tono: 'spento' }),
        R('sc', 330, 90, 250, 100, '', { tono: 'spento' }), T('sct', 455, 108, 'sezione critica', { size: 12 }),
        N('m', 60, 120, 'm', 'dato'), N('t1', 130, 120, 't1', 'ora'), N('t2', 190, 120, 't2', 'ora'), N('t3', 250, 120, 't3', 'ora'),
        T('c', 300, 222, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "Il semaforo difettoso dell'esercizio 5.2: <code>acquire()</code> aspetta solo se state == capacity; <code>release()</code> fa state-- <b>senza controllare</b> niente. Proprietà (Herlihy): al massimo capacity thread nella sezione critica." },
        { nota: "Il main chiama <code>release()</code> senza aver fatto acquire: state = −1. È come regalare un permesso. Anche il main fa parte dell'interleaving.", set: { st: { t: 'state = −1', tono: 'no' }, m: { tono: 'no' } } },
        { nota: "t1 chiama acquire(): state vale −1, diverso da 2: entra, state = 0.", set: { t1: { x: 380, y: 150, tono: 'ok' }, st: { t: 'state = 0', tono: 'spento' } } },
        { nota: "t2: state vale 0, entra, state = 1.", set: { t2: { x: 450, y: 150, tono: 'ok' }, st: { t: 'state = 1' } } },
        { nota: "t3: state vale 1, entra, state = 2. <b>Tre thread</b> nella sezione critica con capacity = 2: proprietà violata. Il test non dipende dallo scheduling (è sequenziale): basta un @Test normale.", set: { t3: { x: 520, y: 150, tono: 'no' }, st: { t: 'state = 2' }, c: { t: '3 thread dentro con capacity 2: proprietà violata', tono: 'no' } } }
      ]
    };

    const og = [T('lp', 90, 30, 'produttori', { bold: true, size: 12 }), T('lc', 510, 30, 'consumatori', { bold: true, size: 12 }),
      R('buf', 230, 60, 140, 60, 'buffer', { tono: 'spento' }),
      R('p1', 30, 50, 120, 30, 'P1: somma 0', { tono: 'dato' }), R('p2', 30, 100, 120, 30, 'P2: somma 0', { tono: 'dato' }),
      R('c1', 450, 50, 120, 30, 'C1: somma 0', { tono: 'due' }), R('c2', 450, 100, 120, 30, 'C2: somma 0', { tono: 'due' }),
      R('ps', 30, 170, 200, 34, 'putSum = 0', { tono: 'spento' }), R('ts', 370, 170, 200, 34, 'takeSum = 0', { tono: 'spento' }),
      T('c', 300, 228, '', { size: 12, bold: true })];
    SCENE.sommatest = {
      w: 600, h: 240, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: og,
      passi: [
        { nota: "Il test del bounded buffer della lezione. Proprietà: se si mettono e si prendono lo stesso numero di elementi, la <b>somma dei numeri messi</b> è uguale alla <b>somma dei numeri presi</b>." },
        { nota: "Ogni produttore mette numeri casuali e tiene la <b>sua</b> somma locale (nessuna condivisione, nessun costo di sincronizzazione nel test).", set: { p1: { t: 'P1: 7 + 3 = 10' }, p2: { t: 'P2: 5 + 1 = 6' }, buf: { t: '7 3 5 1' } } },
        { nota: "Ogni consumatore prende e somma localmente.", set: { buf: { t: 'buffer vuoto' }, c1: { t: 'C1: 7 + 5 = 12' }, c2: { t: 'C2: 3 + 1 = 4' } } },
        { nota: "Alla fine ognuno aggiunge la sua somma a un <b>AtomicInteger</b> globale: putSum = 16, takeSum = 16. <code>assert(putSum.get() == takeSum.get())</code>.", set: { ps: { t: 'putSum = 16', tono: 'ok' }, ts: { t: 'takeSum = 16', tono: 'ok' }, c: { t: 'somme uguali: nessun elemento perso o duplicato', tono: 'ok' } } },
        { nota: "Se il buffer perdesse un elemento (per esempio due take che leggono lo stesso indice) le somme sarebbero diverse. Attenzione: il test si <b>fida</b> di AtomicInteger. Se l'oggetto usato per controllare fosse sbagliato, il test non varrebbe niente.", set: { c1: { t: 'C1: 7 + 7 = 14' }, ts: { t: 'takeSum = 18', tono: 'no' }, c: { t: 'elemento duplicato: 16 ≠ 18, il test fallisce', tono: 'no' } } }
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
  <figure class="passi" data-titolo="{{a|s014|}}">
    <div class="passo"><div class="espr">1. definisci <mark class="ora">la proprietà</mark> in modo preciso</div><p class="nota">{{s|s015|}}</p></div>
    <div class="passo"><div class="espr">2. un'<mark class="dato">interfaccia</mark> per le classi da testare</div><p class="nota">{{s|s016|}}</p></div>
    <div class="passo"><div class="espr">3. un setup che <mark class="no">massimizza la contesa</mark></div><p class="nota">{{s|s017|}}</p></div>
    <div class="passo"><div class="espr">4. <mark class="ok">ripeti</mark>, con parametri diversi</div><p class="nota">{{s|s018|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s019|}}</th><th>{{s|s020|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s021|}}</td><td>{{s|s022|}}</td></tr>
      <tr><td>{{s|s023|}}</td><td>{{s|s024|}}</td></tr>
      <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td></tr>
      <tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr>
      <tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td></tr>
      <tr><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="barriera" data-titolo="{{a|s033|}}"></figure>
  <div class="box attenzione" data-tit="{{a|s034|}}">
    <p>{{s|s035|}}</p>
    <p>{{s|s036|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s037|}}</h2>
  <p>{{s|s038|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s039|}}</th><th>{{s|s040|}}</th><th>{{s|s041|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s042|}}</td><td>{{s|s043|}}</td><td>{{s|s044|}}</td></tr>
      <tr><td>{{s|s045|}}</td><td>0 / 200</td><td>0 / 200</td></tr>
      <tr><td>{{s|s046|}}</td><td>0 / 200</td><td>0 / 200</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s047|}}</p>
  <h3>{{s|s048|}}</h3>
  <p>{{s|s049|}}</p>
  <figure class="interleaving" data-prog="addset" data-titolo="{{a|s050|}}"></figure>
  <div class="box regola" data-tit="{{a|s051|}}">
    <p>{{s|s052|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s053|}}">
    <div class="passo"><div class="espr">test <mark class="no">fallito</mark>  ⇒  la classe <mark class="no">non è thread-safe</mark></div><p class="nota">{{s|s054|}}</p></div>
    <div class="passo"><div class="espr">test <mark class="ok">passato</mark>  ⇏  thread-safe</div><p class="nota">{{s|s055|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s056|}}</h2>
  <figure class="passi" data-titolo="{{a|s057|}}">
    <div class="passo"><div class="espr">state = 0,  capacity = 2</div><p class="nota">{{s|s058|}}</p></div>
    <div class="passo"><div class="espr">main: release()  →  state = <mark class="no">−1</mark></div><p class="nota">{{s|s059|}}</p></div>
    <div class="passo"><div class="espr">t1: acquire() → state = 0;   t2: acquire() → 1;   t3: acquire() → <mark class="no">2</mark></div><p class="nota">{{s|s060|}}</p></div>
    <div class="passo"><div class="espr"><mark class="no">3 thread</mark> nella sezione critica con capacity = 2</div><p class="nota">{{s|s061|}}</p></div>
  </figure>
  <figure class="scena" data-scena="sem52" data-titolo="{{a|s062|}}"></figure>
  <div class="box regola" data-tit="{{a|s063|}}">
    <p>{{s|s064|}}</p>
  </div>
  <figure class="codice" data-titolo="{{a|s065|}}">
<pre data-lang="java">CyclicBarrier barrier = new CyclicBarrier(THREADS_NUMBER + 1);   // 3 thread + main
AtomicInteger inCriticalSection = new AtomicInteger(0);

@Test
public void capacity() {
    semaphore.release();
    for (int th = 0; th &lt; THREADS_NUMBER; th++) {
        new Thread(() -> {
            try {
                barrier.await();
                semaphore.acquire();
                inCriticalSection.incrementAndGet();
                barrier.await();
            } catch (InterruptedException | BrokenBarrierException e) { e.printStackTrace(); }
        }).start();
    }
    try { barrier.await(); barrier.await(); }
    catch (InterruptedException | BrokenBarrierException e) { e.printStackTrace(); }
    assertTrue(inCriticalSection.get() &lt;= CAPACITY, "... threads entered the critical section ...");
}</pre>
    <div class="intro"><p>{{s|s066|}}</p></div>
    <ol class="spiega">
      <li data-righe="1" data-segna="THREADS_NUMBER + 1@dato"><p>{{s|s067|}}</p></li>
      <li data-righe="2" data-segna="AtomicInteger@ok"><p>{{s|s068|}}</p></li>
      <li data-righe="6" data-segna="semaphore.release();@no"><p>{{s|s069|}}</p></li>
      <li data-righe="7-8,15" data-segna="new Thread@ora|.start()@ora"><p>{{s|s070|}}</p></li>
      <li data-righe="10,17" data-segna="barrier.await();#1@ora|barrier.await();#2@dato"><p>{{s|s071|}}</p></li>
      <li data-righe="11-12" data-segna="semaphore.acquire();@ora|incrementAndGet()@ok"><p>{{s|s072|}}</p></li>
      <li data-righe="13,17" data-segna="barrier.await();#1@ora|barrier.await();#3@dato"><p>{{s|s073|}}</p></li>
      <li data-righe="19" data-segna="inCriticalSection.get() &lt;= CAPACITY@no"><p>{{s|s074|}}</p></li>
      <li data-righe="6,11" data-segna="semaphore.release();@no|semaphore.acquire();@ora"><p>{{s|s075|}}</p></li>
    </ol>
  </figure>
  <div class="box attenzione" data-tit="{{a|s076|}}">
    <p>{{s|s077|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s078|}}</h2>
  <p>{{s|s079|}}</p>
  <div class="box idea" data-tit="{{a|s080|}}">
    <p>{{s|s081|}}</p>
  </div>
  <figure class="scena" data-scena="sommatest" data-titolo="{{a|s082|}}"></figure>
</section>

</main>
</body>
</html>
