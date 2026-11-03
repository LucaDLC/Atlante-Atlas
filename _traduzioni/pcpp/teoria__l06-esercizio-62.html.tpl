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
SCENE.stati = {
  w: 640, h: 270, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'th', tipo: 'testo', x: 320, y: 30, t: 'holders', size: 14, bold: true },
    { id: 'hold', tipo: 'rett', x: 200, y: 42, w: 240, h: 50, t: 'null' },
    { id: 'R1', tipo: 'nodo', x: 110, y: 180, t: 'R1' },
    { id: 'R2', tipo: 'nodo', x: 200, y: 180, t: 'R2' },
    { id: 'W', tipo: 'nodo', x: 470, y: 180, t: 'W' },
    { id: 'cod', tipo: 'testo', x: 320, y: 255, t: 'new ReadWriteCASLock()', size: 12.5 }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { hold: { t: '[R1]', tono: 'ora' }, R1: { tono: 'ok', sotto: 'true' }, cod: { t: 'R1: readerTryLock()' } } },
    { nota: '{{j|s005|'}}', set: { hold: { t: '[R2 → R1]' }, R2: { tono: 'ok', sotto: 'true' }, cod: { t: 'R2: readerTryLock()' } } },
    { nota: '{{j|s006|'}}', set: { hold: { tono: null }, W: { tono: 'no', sotto: 'false' }, cod: { t: 'W: writerTryLock()' } } },
    { nota: '{{j|s007|'}}', set: { hold: { t: '[R2]', tono: 'ora' }, R1: { tono: null, sotto: '' }, W: { tono: null, sotto: '' }, cod: { t: 'R1: readerUnlock()' } } },
    { nota: '{{j|s008|'}}', set: { hold: { t: 'null' }, R2: { tono: null, sotto: '' }, cod: { t: 'R2: readerUnlock()' } } },
    { nota: '{{j|s009|'}}', set: { hold: { t: 'Writer(W)', tono: 'ora' }, W: { tono: 'ok', sotto: 'true' }, cod: { t: 'W: writerTryLock()' } } },
    { nota: '{{j|s010|'}}', set: { hold: { tono: null }, R1: { tono: 'no', sotto: 'false' }, cod: { t: 'R1: readerTryLock()' } } },
    { nota: '{{j|s011|'}}', set: { R1: { tono: null, sotto: '' }, R2: { tono: 'no', sotto: 'eccezione' }, cod: { t: 'R2: writerUnlock()' } } },
    { nota: '{{j|s012|'}}', set: { hold: { t: 'null', tono: 'ora' }, R2: { tono: null, sotto: '' }, W: { tono: null, sotto: '' }, cod: { t: 'W: writerUnlock()' } } }
  ]
};
SCENE.rimuovi = {
  w: 640, h: 260, lato: false,
  legenda: '{{j|s013|'}}',
  oggetti: [
    { id: 'lv', tipo: 'testo', x: 40, y: 75, t: 'h', size: 14, bold: true, anchor: 'start' },
    { id: 'a3', tipo: 'nodo', x: 130, y: 70, t: 'T3', tono: 'dato' },
    { id: 'a2', tipo: 'nodo', x: 280, y: 70, t: 'T2', tono: 'dato' },
    { id: 'a1', tipo: 'nodo', x: 430, y: 70, t: 'T1', tono: 'dato' },
    { id: 'e32', tipo: 'arco', da: 'a3', a: 'a2', dir: true, t: 'next' },
    { id: 'e21', tipo: 'arco', da: 'a2', a: 'a1', dir: true, t: 'next' },
    { id: 'nul', tipo: 'testo', x: 545, y: 75, t: 'next = null', size: 12 },
    { id: 'ln', tipo: 'testo', x: 40, y: 195, t: 'nuova', size: 14, bold: true, anchor: 'start', nascosto: true },
    { id: 'b3', tipo: 'nodo', x: 130, y: 190, t: 'T3', tono: 'ok', nascosto: true },
    { id: 'e31', tipo: 'arco', da: 'b3', a: 'a1', dir: true, t: 'next', nascosto: true },
    { id: 'cod', tipo: 'testo', x: 320, y: 245, t: 'h.remove(T2)', size: 12.5 }
  ],
  passi: [
    { nota: '{{j|s014|'}}' },
    { nota: '{{j|s015|'}}', set: { a3: { tono: 'ora' }, cod: { t: 'T3 ≠ T2 → new ReaderList(T3, next.remove(T2))' } } },
    { nota: '{{j|s016|'}}', set: { a3: { tono: 'dato' }, a2: { tono: 'no' }, a1: { tono: 'ok' }, cod: { t: 'T2 == T2 → return next (il nodo T1)' } } },
    { nota: '{{j|s017|'}}', set: { ln: { nascosto: false }, b3: { nascosto: false }, e31: { nascosto: false, tono: 'ok' }, cod: { t: 'risultato: T3 → T1' } } },
    { nota: '{{j|s018|'}}', set: { a2: { tono: 'dato' }, a1: { tono: 'dato' }, cod: { t: 'holders.compareAndSet(h, nuova)' } } }
  ]
};
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s019|}}</h1>
  <p class="lede">{{s|s020|}}</p>
</header>

<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s023|}}</th><th>{{s|s024|}}</th><th>{{s|s025|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s026|}}</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr>
      <tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
      <tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s035|}}</p>
  <figure class="scena" data-scena="stati" data-titolo="{{a|s036|}}"></figure>
</section>

<section>
  <h2>{{s|s037|}}</h2>
  <figure class="codice" data-titolo="{{a|s038|}}">
<pre data-lang="java">private final AtomicReference&lt;Holders&gt; holders = new AtomicReference&lt;&gt;(null);

private static abstract class Holders { }

private static class ReaderList extends Holders {
    private final Thread thread;
    private final ReaderList next;

    public ReaderList(Thread thread, ReaderList next) {
        this.thread = thread;
        this.next = next;
    }

    public boolean contains(Thread t) {
        for (ReaderList node = this; node != null; node = node.next) {
            if (node.thread == t)
                return true;
        }
        return false;
    }

    public ReaderList remove(Thread t) {
        if (thread == t)
            return next;
        return new ReaderList(thread, next == null ? null : next.remove(t));
    }
}

private static class Writer extends Holders {
    public final Thread thread;

    public Writer(Thread thread) {
        this.thread = thread;
    }
}</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="AtomicReference&lt;Holders&gt;@dato|null@ok"><p>{{s|s039|}}</p></li>
      <li data-righe="3" data-segna="abstract@ora"><p>{{s|s040|}}</p></li>
      <li data-righe="5-12" data-segna="private final*@ok"><p>{{s|s041|}}</p></li>
      <li data-righe="14-20" data-segna="node = node.next@ora"><p>{{s|s042|}}</p></li>
      <li data-righe="22-26" data-segna="return next;@ok|new ReaderList@ora"><p>{{s|s043|}}</p></li>
      <li data-righe="29-35"><p>{{s|s044|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="rimuovi" data-titolo="{{a|s045|}}"></figure>
  <div class="box regola" data-tit="{{a|s046|}}">
    <p>{{s|s047|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s048|}}</h2>
  <figure class="codice" data-titolo="{{a|s049|}}">
<pre data-lang="java">public boolean writerTryLock() {
    final Thread current = Thread.currentThread();
    return holders.compareAndSet(null, new Writer(current));
}

public void writerUnlock() {
    final Thread current = Thread.currentThread();
    final Holders h = holders.get();
    if (h instanceof Writer w &amp;&amp; w.thread == current)
        holders.set(null);
    else
        throw new IllegalStateException("writerUnlock: the calling thread does not hold the write lock");
}</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="Thread.currentThread()@dato"><p>{{s|s050|}}</p></li>
      <li data-righe="3" data-segna="compareAndSet(null, new Writer(current))@ora"><p>{{s|s051|}}</p></li>
      <li data-righe="8-9" data-segna="h instanceof Writer w@dato|w.thread == current@ora"><p>{{s|s052|}}</p></li>
      <li data-righe="10" data-segna="holders.set(null)@ok"><p>{{s|s053|}}</p></li>
      <li data-righe="11-12" data-segna="throw@no"><p>{{s|s054|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s055|}}">
    <p>{{s|s056|}}</p>
    <p>{{s|s057|}}</p>
    <p>{{s|s058|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s059|}}">
    <p>{{s|s060|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s061|}}">
    <p>{{s|s062|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s063|}}</h2>
  <figure class="codice" data-titolo="{{a|s064|}}">
<pre data-lang="java">public boolean readerTryLock() {
    final Thread current = Thread.currentThread();
    while (true) {
        final Holders h = holders.get();
        if (h instanceof Writer)
            return false;
        final ReaderList newList = new ReaderList(current, (ReaderList) h);
        if (holders.compareAndSet(h, newList))
            return true;
    }
}

public void readerUnlock() {
    final Thread current = Thread.currentThread();
    while (true) {
        final Holders h = holders.get();
        if (h instanceof ReaderList readers &amp;&amp; readers.contains(current)) {
            if (holders.compareAndSet(h, readers.remove(current)))
                return;
        } else {
            throw new IllegalStateException("readerUnlock: the calling thread does not hold a read lock");
        }
    }
}</pre>
    <ol class="spiega">
      <li data-righe="3-4" data-segna="while (true)@ora|holders.get()@dato"><p>{{s|s065|}}</p></li>
      <li data-righe="5-6" data-segna="return false;@no"><p>{{s|s066|}}</p></li>
      <li data-righe="7" data-segna="(ReaderList) h@dato"><p>{{s|s067|}}</p></li>
      <li data-righe="8-9" data-segna="compareAndSet(h, newList)@ora|return true;@ok"><p>{{s|s068|}}</p></li>
      <li data-righe="16-17" data-segna="h instanceof ReaderList readers@dato|readers.contains(current)@ora"><p>{{s|s069|}}</p></li>
      <li data-righe="18-19" data-segna="readers.remove(current)@ok"><p>{{s|s070|}}</p></li>
      <li data-righe="20-21" data-segna="throw@no"><p>{{s|s071|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s072|}}" data-legenda="{{a|s073|}}">
    <div class="passo"><div class="espr">holders = [T1]        R2 e R3 chiamano readerTryLock()</div><p class="nota">{{s|s074|}}</p></div>
    <div class="passo"><div class="espr">R2: h = <mark class="dato">[T1]</mark>        R3: h = <mark class="dato">[T1]</mark></div><p class="nota">{{s|s075|}}</p></div>
    <div class="passo"><div class="espr">R2: <mark class="ora">CAS([T1] → [R2 → T1])</mark>  <mark class="ok">riesce</mark></div><p class="nota">{{s|s076|}}</p></div>
    <div class="passo"><div class="espr">R3: <mark class="ora">CAS([T1] → [R3 → T1])</mark>  <mark class="no">fallisce</mark></div><p class="nota">{{s|s077|}}</p></div>
    <div class="passo"><div class="espr">R3: h = <mark class="dato">[R2 → T1]</mark>, <mark class="ora">CAS([R2 → T1] → [R3 → R2 → T1])</mark>  <mark class="ok">riesce</mark></div><p class="nota">{{s|s078|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s079|}}">
    <p>{{s|s080|}}</p>
    <p>{{s|s081|}}</p>
    <p>{{s|s082|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s083|}}">
    <p>{{s|s084|}}</p>
  </div>
  <div class="box idea" data-tit="{{a|s085|}}">
    <p>{{s|s086|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s087|}}</h2>
  <p>{{s|s088|}}</p>
  <figure class="passi" data-titolo="{{a|s089|}}" data-legenda="{{a|s090|}}">
    <div class="passo"><div class="espr">{{s|s091|}}</div><p class="nota">{{s|s092|}}</p></div>
    <div class="passo"><div class="espr">h = holders.get()   →   <mark class="dato">fotografia</mark></div><p class="nota">{{s|s093|}}</p></div>
    <div class="passo"><div class="espr">newList = new ReaderList(current, h)   →   <mark class="due">copia nuova, a parte</mark></div><p class="nota">{{s|s094|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">compareAndSet(h, newList)</mark></div><p class="nota">{{s|s095|}}</p></div>
    <div class="passo"><div class="espr">{{s|s096|}}</div><p class="nota">{{s|s097|}}</p></div>
    <div class="passo"><div class="espr">{{s|s098|}}</div><p class="nota">{{s|s099|}}</p></div>
  </figure>
  <div class="colonne">
    <div class="carta cattiva"><h4>{{s|s100|}}</h4><p>{{s|s101|}}</p></div>
    <div class="carta buona"><h4>{{s|s102|}}</h4><p>{{s|s103|}}</p></div>
  </div>
  <div class="box regola" data-tit="{{a|s104|}}">
    <p>{{s|s105|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s106|}}</h2>
  <p>{{s|s107|}}</p>
  <figure class="codice" data-titolo="{{a|s108|}}">
<pre data-lang="java">@Test
public void cannotTakeReadLockWhileHoldingWriteLock() {
    ReadWriteCASLock lock = new ReadWriteCASLock();
    assertTrue(lock.writerTryLock());
    assertFalse(lock.readerTryLock());
    lock.writerUnlock();
}

@Test
public void cannotTakeWriteLockWhileHoldingReadLock() {
    ReadWriteCASLock lock = new ReadWriteCASLock();
    assertTrue(lock.readerTryLock());
    assertFalse(lock.writerTryLock());
    lock.readerUnlock();
}

@Test
public void cannotUnlockALockYouDoNotHold() {
    ReadWriteCASLock lock = new ReadWriteCASLock();
    assertThrows(IllegalStateException.class, lock::writerUnlock);
    assertThrows(IllegalStateException.class, lock::readerUnlock);
    assertTrue(lock.writerTryLock());
    assertThrows(IllegalStateException.class, lock::readerUnlock);
    lock.writerUnlock();
    assertTrue(lock.readerTryLock());
    assertThrows(IllegalStateException.class, lock::writerUnlock);
    lock.readerUnlock();
}

@Test
public void lockIsFreeAgainAfterUnlock() {
    ReadWriteCASLock lock = new ReadWriteCASLock();
    assertTrue(lock.writerTryLock());
    assertFalse(lock.writerTryLock());
    lock.writerUnlock();
    assertTrue(lock.readerTryLock());
    lock.readerUnlock();
    assertTrue(lock.writerTryLock());
    lock.writerUnlock();
}</pre>
    <ol class="spiega">
      <li data-righe="1-7" data-segna="assertTrue@ok|assertFalse@no"><p>{{s|s109|}}</p></li>
      <li data-righe="9-15"><p>{{s|s110|}}</p></li>
      <li data-righe="17-28" data-segna="assertThrows*@no|lock::writerUnlock#1@dato"><p>{{s|s111|}}</p></li>
      <li data-righe="30-40"><p>{{s|s112|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s113|}}</h2>
  <p>{{s|s114|}}</p>
  <figure class="codice" data-titolo="{{a|s115|}}">
<pre data-lang="java">@RepeatedTest(10)
public void writersAreMutuallyExclusive() {
    final int THREADS = 16;
    final int ATTEMPTS = 10_000;
    final ReadWriteCASLock lock = new ReadWriteCASLock();
    final AtomicInteger holding = new AtomicInteger(0);
    final AtomicInteger overlaps = new AtomicInteger(0);
    final AtomicInteger acquisitions = new AtomicInteger(0);
    final AtomicInteger errors = new AtomicInteger(0);
    final CyclicBarrier barrier = new CyclicBarrier(THREADS + 1);
    final Thread[] threads = new Thread[THREADS];

    for (int t = 0; t &lt; THREADS; t++) {
        threads[t] = new Thread(() -&gt; {
            try {
                barrier.await();
                for (int i = 0; i &lt; ATTEMPTS; i++) {
                    if (lock.writerTryLock()) {
                        acquisitions.incrementAndGet();
                        if (holding.incrementAndGet() &gt; 1)
                            overlaps.incrementAndGet();
                        holding.decrementAndGet();
                        lock.writerUnlock();
                    }
                }
            } catch (InterruptedException | BrokenBarrierException e) {
                e.printStackTrace();
            } catch (IllegalStateException e) {
                errors.incrementAndGet();
            }
        });
        threads[t].start();
    }

    try {
        barrier.await();
        for (Thread thread : threads)
            thread.join();
    } catch (InterruptedException | BrokenBarrierException e) {
        e.printStackTrace();
    }

    assertTrue(acquisitions.get() &gt; 0, "no writer ever got the lock");
    assertEquals(0, overlaps.get(), "two or more writers held the lock at the same time");
    assertEquals(0, errors.get(), "a writer could not release a lock it had acquired");
}</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="@RepeatedTest(10)@ora"><p>{{s|s116|}}</p></li>
      <li data-righe="6-9" data-segna="holding@dato|overlaps@no"><p>{{s|s117|}}</p></li>
      <li data-righe="18-23" data-segna="holding.incrementAndGet() &gt; 1@ora"><p>{{s|s118|}}</p></li>
      <li data-righe="16,28-29,36-38" data-segna="barrier.await()*@dato|thread.join()@ok|IllegalStateException@no"><p>{{s|s119|}}</p></li>
      <li data-righe="43-45"><p>{{s|s120|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s121|}}" data-legenda="{{a|s122|}}">
    <div class="passo"><div class="espr">lock sbagliato: if (holders.get() == null) holders.set(new Writer(current));</div><p class="nota">{{s|s123|}}</p></div>
    <div class="passo"><div class="espr">{{s|s124|}}</div><p class="nota">{{s|s125|}}</p></div>
    <div class="passo"><div class="espr"><mark class="due">W1</mark>: writerUnlock() → <mark class="no">IllegalStateException</mark></div><p class="nota">{{s|s126|}}</p></div>
    <div class="passo"><div class="espr">{{s|s127|}}</div><p class="nota">{{s|s128|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">thread.join()</mark> + catch (IllegalStateException e)</div><p class="nota">{{s|s129|}}</p></div>
  </figure>
  <figure class="codice" data-titolo="{{a|s130|}}">
<pre data-lang="java">new Thread(() -> {
    try {
        barrier.await();
        for (int i = 0; i &lt; ITERATIONS; i++) { /* writerTryLock … writerUnlock */ }
    } catch (InterruptedException | BrokenBarrierException e) {
        e.printStackTrace();
    } finally {
        try {
            barrier.await();
        } catch (InterruptedException | BrokenBarrierException e) {
            e.printStackTrace();
        }
    }
}).start();</pre>
    <div class="intro"><p>{{s|s131|}}</p></div>
    <ol class="spiega">
      <li data-righe="7" data-segna="finally@ok"><p>{{s|s132|}}</p></li>
      <li data-righe="8-12" data-segna="barrier.await();@ora|catch (@ok"><p>{{s|s133|}}</p></li>
      <li data-righe="7-12"><p>{{s|s134|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s135|}}</h2>
  <figure class="codice" data-titolo="{{a|s136|}}">
<pre data-lang="java">public boolean readerTryLock() {
    final Thread current = Thread.currentThread();
    while (true) {
        final Holders h = holders.get();
        if (h instanceof Writer)
            return false;
        final ReaderList readers = (ReaderList) h;
        if (readers != null &amp;&amp; readers.contains(current))
            throw new IllegalStateException("readerTryLock: the calling thread already holds a read lock");
        if (holders.compareAndSet(h, new ReaderList(current, readers)))
            return true;
    }
}</pre>
    <ol class="spiega">
      <li data-righe="7-9" data-segna="readers.contains(current)@ora|throw@no"><p>{{s|s137|}}</p></li>
      <li data-righe="10-11" data-segna="compareAndSet(h, new ReaderList(current, readers))@ok"><p>{{s|s138|}}</p></li>
    </ol>
  </figure>
  <div class="box regola" data-tit="{{a|s139|}}">
    <p>{{s|s140|}}</p>
    <p>{{s|s141|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s142|}}">
    <p>{{s|s143|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s144|}}">
    <p>{{s|s145|}}</p>
  </div>
</section>

</main>
</body>
</html>
