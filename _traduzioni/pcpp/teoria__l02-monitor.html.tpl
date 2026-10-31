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
SCENE.mesa = {
  w: 600, h: 270, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'zE', tipo: 'testo', x: 95, y: 30, t: 'entry queue', size: 13, bold: true },
    { id: 'zM', tipo: 'testo', x: 300, y: 30, t: 'dentro il monitor (lock)', size: 13, bold: true },
    { id: 'zW', tipo: 'testo', x: 505, y: 30, t: 'wait set (condition)', size: 13, bold: true },
    { id: 'b1', tipo: 'linea', x1: 190, y1: 45, x2: 190, y2: 200, tratt: true, tono: 'spento' },
    { id: 'b2', tipo: 'linea', x1: 410, y1: 45, x2: 410, y2: 200, tratt: true, tono: 'spento' },
    { id: 'W1', tipo: 'nodo', r: 22, x: 300, y: 90, t: 'W1', tono: 'due' },
    { id: 'R1', tipo: 'nodo', r: 22, x: 95, y: 90, t: 'R1', tono: 'dato' },
    { id: 'W2', tipo: 'nodo', r: 22, x: 95, y: 160, t: 'W2', tono: 'due', nascosto: true },
    { id: 'st', tipo: 'testo', x: 300, y: 225, t: 'writer = true', size: 14, bold: true },
    { id: 'n', tipo: 'testo', x: 300, y: 255, t: '', size: 13, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { R1: { x: 505, y: 90, tono: 'ora' } } },
    { nota: '{{j|s005|'}}', set: { W1: { x: 540, y: 170, tono: 'spento' }, R1: { x: 95, y: 90, tono: 'dato' }, st: { t: 'writer = false' } } },
    { nota: '{{j|s006|'}}', set: { W1: { nascosto: true }, W2: { nascosto: false, x: 300, y: 110, tono: 'ora' }, st: { t: 'writer = true' } } },
    { nota: '{{j|s007|'}}', set: { W2: { tono: 'due' }, R1: { x: 300, y: 170, tono: 'no' }, n: { t: 'if: R1 e W2 insieme dentro, violazione', tono: 'no' } } },
    { nota: '{{j|s008|'}}', set: { R1: { x: 505, y: 90, tono: 'ok' }, n: { t: 'while: R1 ricontrolla e aspetta di nuovo', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});

  // 1. lettori e scrittori
  SCENE.lettscritt = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      R('res', 230, 50, 160, 130, 'dati condivisi', { tono: 'spento' }),
      N('r1', 80, 60, 'R1', 'dato'), N('r2', 80, 120, 'R2', 'dato'), N('w1', 80, 180, 'W1', 'due'), N('r3', 520, 60, 'R3', 'dato', { nascosto: true }),
      T('c', 310, 218, '', { bold: true })
    ],
    passi: [
      { nota: "Una struttura dati condivisa. I <b>lettori</b> (R) la leggono, gli <b>scrittori</b> (W) la modificano." },
      { nota: "R1 e R2 leggono <b>insieme</b>: nessuno modifica niente, quindi non si danno fastidio.", set: { r1: { x: 280, y: 90, tono: 'ok' }, r2: { x: 340, y: 90, tono: 'ok' }, c: { t: 'più lettori insieme: sì', tono: 'ok' } } },
      { nota: "W1 vuole scrivere, ma ci sono lettori: deve <b>aspettare</b>. Scriverebbe mentre gli altri leggono dati a metà.", set: { w1: { tono: 'no' }, c: { t: 'scrittore con lettori: no', tono: 'no' } } },
      { nota: "I lettori escono, W1 entra <b>da solo</b>. Ora anche un nuovo lettore R3 deve aspettare.", set: { r1: { x: 520, y: 150, tono: 'dato' }, r2: { x: 520, y: 200, tono: 'dato' }, w1: { x: 310, y: 155, tono: 'ok' }, r3: { nascosto: false, x: 520, y: 60, tono: 'no' }, c: { t: 'uno scrittore, da solo', tono: 'ok' } } },
      { nota: "Un lock normale darebbe la sicurezza, ma escluderebbe anche lettore contro lettore, buttando via il parallelismo permesso. Serve qualcosa che decida <b>chi</b> entra in base allo <b>stato</b> (quanti lettori, c'è uno scrittore?): un <b>monitor</b>.", set: { c: { t: 'serve decidere in base allo stato' } } }
    ]
  };

  // 2. il monitor come stanza
  SCENE.stanzamon = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      R('eq', 20, 60, 130, 150, 'entry queue', { tono: 'spento' }), R('mon', 220, 60, 160, 150, 'monitor (1 alla volta)', { tono: 'spento' }), R('cq', 450, 60, 130, 150, 'coda della condition', { tono: 'spento' }),
      N('a', 85, 100, 'A', 'dato'), N('b', 85, 160, 'B', 'dato'),
      T('c', 300, 238, '', { bold: true, size: 12 })
    ],
    passi: [
      { nota: "Un <b>monitor</b>: stato privato, metodi tutti in mutua esclusione (un thread alla volta dentro), e una o più <b>condition variable</b>, code dove i thread aspettano. Chi vuole entrare aspetta nella <b>entry queue</b>, la coda del lock." },
      { nota: "A prende il lock ed entra nel monitor.", set: { a: { x: 300, y: 110, tono: 'ora' }, c: { t: 'lock() → A dentro' } } },
      { nota: "La condizione di A non è vera (per esempio c'è uno scrittore). <code>await()</code> fa due cose <b>insieme</b>: rilascia il lock e mette A nella coda della condition.", set: { a: { x: 515, y: 110, tono: 'due' }, c: { t: 'await(): rilascia il lock + aspetta' } } },
      { nota: "Il lock è libero: entra B.", set: { b: { x: 300, y: 178, tono: 'ora' }, c: { t: 'B dentro' } } },
      { nota: "B cambia lo stato e chiama <code>signalAll()</code> (o <code>signal()</code> per uno solo): A esce dalla coda della condition, ma <b>non</b> entra subito. Torna nella entry queue e deve ricompetere per il lock.", set: { a: { x: 85, y: 110, tono: 'dato' }, c: { t: 'signalAll(): A torna in entry queue' } } },
      { nota: "Quando B esce (unlock), A riprende il lock e continua dopo il suo <code>await()</code>. Da blocked non si passa mai direttamente a running: si passa sempre per la coda del lock.", set: { b: { x: 85, y: 180, tono: 'dato' }, a: { x: 300, y: 110, tono: 'ora' }, c: { t: 'A riprende il lock e continua' } } }
    ]
  };

  // 3. ReadWriteMonitor: lo stato
  const st = (r, w, testo) => ({ s1: { t: 'readers = ' + r }, s2: { t: 'writer = ' + w }, c: { t: testo } });
  SCENE.rwstato = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      R('st', 380, 30, 190, 90, '', { tono: 'ok' }), T('s1', 475, 58, 'readers = 0', { bold: true }), T('s2', 475, 90, 'writer = false', { bold: true }),
      T('c', 190, 60, '', { size: 12 }), T('w', 190, 110, '', { size: 12 }), T('n', 300, 190, '', { size: 12 })
    ],
    passi: [
      { nota: "Lo stato del ReadWriteMonitor: <code>readers</code>, quanti lettori ci sono, e <code>writer</code>, se c'è uno scrittore." },
      { nota: "R1 chiama <code>readLock()</code>: writer è false, quindi non aspetta; readers++.", set: st(1, 'false', 'R1.readLock()') },
      { nota: "R2 fa lo stesso: readers = 2. Due lettori insieme.", set: st(2, 'false', 'R2.readLock()') },
      { nota: "W1 chiama <code>writeLock()</code>: <code>while (readers &gt; 0 || writer)</code> è vero, quindi <code>await()</code>. W1 aspetta nella coda.", set: Object.assign(st(2, 'false', 'W1.writeLock()'), { w: { t: 'W1 in attesa (readers > 0)', tono: 'no' } }) },
      { nota: "R1 e R2 chiamano <code>readUnlock()</code>. Quando readers arriva a 0, l'ultimo chiama <code>signalAll()</code>.", set: Object.assign(st(0, 'false', 'readUnlock() × 2 → signalAll()'), { w: { t: 'W1 svegliato' } }) },
      { nota: "W1 riprende il lock, <b>ricontrolla</b> la condizione nel while (ora falsa) e mette writer = true. Un lettore che arriva adesso aspetterà. Alla fine <code>writeUnlock()</code> rimette writer = false e sveglia tutti.", set: Object.assign(st(0, 'true', 'W1 scrive'), { w: { t: 'nuovi lettori: aspettano', tono: 'no' }, n: { t: 'writeUnlock(): writer = false, signalAll()' } }) }
    ]
  };

  // 4. versione synchronized, fair con gli scrittori
  SCENE.rwsync = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      T('h1', 150, 24, 'ReentrantLock', { bold: true, tono: 'dato' }), T('h2', 450, 24, 'synchronized', { bold: true, tono: 'ok' }),
      T('a1', 150, 60, 'lock() … unlock()', { size: 12 }), T('b1', 450, 60, '', { size: 12 }),
      T('a2', 150, 90, 'condition.await()', { size: 12 }), T('b2', 450, 90, '', { size: 12 }),
      T('a3', 150, 120, 'condition.signalAll()', { size: 12 }), T('b3', 450, 120, '', { size: 12 }),
      T('c', 300, 175, '', { size: 12, bold: true }), T('c2', 300, 205, '', { size: 12 })
    ],
    passi: [
      { nota: "Ogni oggetto Java ha già dentro un <b>lock</b> e una <b>condition variable</b>. L'esercizio 2.1 chiede di riscrivere il monitor con questi." },
      { nota: "Il metodo <code>synchronized</code> prende e rilascia il lock dell'oggetto da solo, anche con le eccezioni: sostituisce lock/try/finally/unlock.", set: { b1: { t: 'metodo synchronized' } } },
      { nota: "<code>this.wait()</code> e <code>this.notifyAll()</code> sostituiscono <code>await()</code> e <code>signalAll()</code>. C'è <b>una sola</b> condition, quella dell'oggetto (esercizio 2.1.3).", set: { b2: { t: 'this.wait()' }, b3: { t: 'this.notifyAll()' } } },
      { nota: "Il trucco della versione fair: in <code>writeLock()</code> lo scrittore mette <b>subito</b> writer = true, poi aspetta che i lettori già dentro escano. I lettori <b>nuovi</b> vedono writer = true e aspettano: lo scrittore non può essere scavalcato all'infinito (niente starvation, <a href=\"l02-fairness.html\">fairness</a>).", set: { c: { t: 'writer = true prima, poi aspetta i lettori', tono: 'ok' }, c2: { t: 'i lettori nuovi si mettono in fila dietro' } } }
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
  <div class="box domanda-tua" data-tit="{{a|s019|}}">
    <p>{{s|s020|}}</p>
  </div>
  <figure class="scena" data-scena="lettscritt" data-titolo="{{a|s021|}}"></figure>
</section>

<section>
  <h2>{{s|s022|}}</h2>
  <div class="box regola" data-tit="{{a|s023|}}">
    <p>{{s|s024|}}</p>
  </div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s025|}}</th><th>{{s|s026|}}</th><th>{{s|s027|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td><td>{{s|s030|}}</td></tr>
      <tr><td>{{s|s031|}}</td><td>{{s|s032|}}</td><td>{{s|s033|}}</td></tr>
      <tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr>
    </tbody>
  </table></div>
  <h3>{{s|s037|}}</h3>
  <div class="colonne">
    <div class="carta"><h4>{{s|s038|}}</h4><p>{{s|s039|}}</p></div>
    <div class="carta"><h4>{{s|s040|}}</h4><p>{{s|s041|}}</p></div>
    <div class="carta"><h4>{{s|s042|}}</h4><p>{{s|s043|}}</p></div>
  </div>
  <p>{{s|s044|}}</p>
  <figure class="scena" data-scena="stanzamon" data-titolo="{{a|s045|}}"></figure>
</section>

<section>
  <h2>{{s|s046|}}</h2>
  <p>{{s|s047|}}</p>
  <figure class="codice" data-titolo="{{a|s048|}}">
<pre data-lang="java">public class ReadWriteMonitor {
    private int readers = 0;
    private boolean writer = false;
    private Lock lock = new ReentrantLock();
    private Condition condition = lock.newCondition();

    public void readLock() {
        lock.lock();
        try {
            while (writer)
                condition.await();
            readers++;
        } catch (InterruptedException e) { e.printStackTrace(); }
        finally { lock.unlock(); }
    }

    public void readUnlock() {
        lock.lock();
        try {
            readers--;
            if (readers == 0)
                condition.signalAll();
        } finally { lock.unlock(); }
    }

    public void writeLock() {
        lock.lock();
        try {
            while (readers &gt; 0 || writer)
                condition.await();
            writer = true;
        } catch (InterruptedException e) { e.printStackTrace(); }
        finally { lock.unlock(); }
    }

    public void writeUnlock() {
        lock.lock();
        try {
            writer = false;
            condition.signalAll();
        } finally { lock.unlock(); }
    }
}</pre>
    <div class="intro"><p>{{s|s049|}}</p></div>
    <ol class="spiega">
      <li data-righe="2-3" data-segna="readers@dato|writer@due"><p>{{s|s050|}}</p></li>
      <li data-righe="4-5" data-segna="new ReentrantLock()@ora|lock.newCondition()@ora"><p>{{s|s051|}}</p></li>
      <li data-righe="8,14" data-segna="lock.lock();@ora|finally { lock.unlock(); }@ok"><p>{{s|s052|}}</p></li>
      <li data-righe="10-11" data-segna="while (writer)@due|condition.await();@ora"><p>{{s|s053|}}</p></li>
      <li data-righe="12" data-segna="readers++;@ok"><p>{{s|s054|}}</p></li>
      <li data-righe="20-22" data-segna="readers--;@dato|if (readers == 0)@due|signalAll()@ora"><p>{{s|s055|}}</p></li>
      <li data-righe="29-31" data-segna="while (readers &gt; 0 || writer)@due|writer = true;@ok"><p>{{s|s056|}}</p></li>
      <li data-righe="39-40" data-segna="writer = false;@dato|condition.signalAll();@ora"><p>{{s|s057|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="rwstato" data-titolo="{{a|s058|}}"></figure>
</section>

<section>
  <h2>{{s|s059|}}</h2>
  <figure class="passi" data-titolo="{{a|s060|}}">
    <div class="passo"><div class="espr">if (writer) condition.await();
readers++;</div><p class="nota">{{s|s061|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">R1</mark>: writer è true  →  await()</div><p class="nota">{{s|s062|}}</p></div>
    <div class="passo"><div class="espr"><mark class="due">W1</mark>: writeUnlock()  →  writer = false, <mark class="ora">signalAll()</mark></div><p class="nota">{{s|s063|}}</p></div>
    <div class="passo"><div class="espr"><mark class="no">W2</mark> prende il lock prima di R1  →  writer = true</div><p class="nota">{{s|s064|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">R1</mark> riprende il lock  →  <mark class="no">readers++</mark> senza ricontrollare</div><p class="nota">{{s|s065|}}</p></div>
    <div class="passo"><div class="espr">while (writer) condition.await();   <mark class="ok">→ R1 ricontrolla e riaspetta</mark></div><p class="nota">{{s|s066|}}</p></div>
  </figure>
  <figure class="scena" data-scena="mesa" data-titolo="{{a|s067|}}"></figure>
  <div class="box domanda-tua" data-tit="{{a|s068|}}">
    <p>{{s|s069|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s070|}}</h2>
  <p>{{s|s071|}}</p>
  <figure class="codice" data-titolo="{{a|s072|}}">
<pre data-lang="java">public class RWSync {
    private int readers = 0;
    private boolean writer = false;

    public synchronized void readLock() throws InterruptedException {
        while (writer) this.wait();
        readers++;
    }
    public synchronized void readUnlock() {
        readers--;
        if (readers == 0) this.notifyAll();
    }
    public synchronized void writeLock() throws InterruptedException {
        while (writer) this.wait();
        writer = true;
        while (readers &gt; 0) this.wait();
    }
    public synchronized void writeUnlock() {
        writer = false;
        this.notifyAll();
    }
}</pre>
    <ol class="spiega">
      <li data-righe="5,9,13,18" data-segna="synchronized*@ora"><p>{{s|s073|}}</p></li>
      <li data-righe="6" data-segna="this.wait()@due"><p>{{s|s074|}}</p></li>
      <li data-righe="14-16" data-segna="writer = true;@ok|while (readers &gt; 0)@due"><p>{{s|s075|}}</p></li>
      <li data-righe="11,20" data-segna="notifyAll()*@ora"><p>{{s|s076|}}</p></li>
    </ol>
  </figure>
  <div class="box esame" data-tit="{{a|s077|}}">
    <p>{{s|s078|}}</p>
  </div>
  <p class="piccolo">{{s|s079|}}</p>
  <figure class="scena" data-scena="rwsync" data-titolo="{{a|s080|}}"></figure>
</section>

</main>
</body>
</html>
