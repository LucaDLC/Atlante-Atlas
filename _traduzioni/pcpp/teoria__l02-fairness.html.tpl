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
SCENE.code = {
  w: 620, h: 230, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'zE', tipo: 'rett', x: 10, y: 60, w: 190, h: 120 },
    { id: 'zL', tipo: 'rett', x: 225, y: 60, w: 160, h: 120 },
    { id: 'zC', tipo: 'rett', x: 410, y: 60, w: 200, h: 120 },
    { id: 'tE', tipo: 'testo', x: 125, y: 40, t: 'entry queue (per il lock)', size: 12, bold: true },
    { id: 'tL', tipo: 'testo', x: 305, y: 40, t: 'dentro il monitor', size: 12, bold: true },
    { id: 'tC', tipo: 'testo', x: 510, y: 40, t: 'condition queue (await)', size: 12, bold: true },
    { id: 'T1', tipo: 'nodo', x: 55, y: 120, t: 'T1' },
    { id: 'T2', tipo: 'nodo', x: 105, y: 120, t: 'T2' },
    { id: 'T3', tipo: 'nodo', x: 155, y: 120, t: 'T3' },
    { id: 'cod', tipo: 'testo', x: 310, y: 212, t: '', size: 12.5 }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { T2: { x: 305, tono: 'ora' }, cod: { t: 'T2 esegue il metodo' } } },
    { nota: '{{j|s005|'}}', set: { T2: { x: 455, tono: 'due' }, cod: { t: 'T2: c.await()' } } },
    { nota: '{{j|s006|'}}', set: { T1: { x: 510, tono: 'due' }, cod: { t: 'T1: c.await()' } } },
    { nota: '{{j|s007|'}}', set: { T3: { x: 305, tono: 'ora' }, cod: { t: 'T3: c.signal()' } } },
    { nota: '{{j|s008|'}}', set: { T1: { x: 55, tono: 'dato' }, cod: { t: 'T1 torna in entry queue' } } },
    { nota: '{{j|s009|'}}', set: { T3: { nascosto: true }, T1: { x: 305, tono: 'ora' }, cod: { t: 'T3 esce, T1 prende il lock' } } },
    { nota: '{{j|s010|'}}', set: { T1: { x: 55, tono: 'dato' }, T2: { x: 105, tono: 'dato' }, cod: { t: 'variante: T3 aveva fatto signalAll()' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 18 }, extra || {});

  // 1. entry queue fair o no
  SCENE.fairlock = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      R('q', 40, 70, 250, 60, '', { tono: 'spento' }), T('tq', 165, 58, 'entry queue (1 arrivato per primo)', { size: 11 }),
      R('m', 380, 60, 120, 80, '', { tono: 'spento' }), T('tlk', 440, 48, 'lock', { size: 12, bold: true }),
      N('a', 250, 100, '1', 'dato'), N('b', 200, 100, '2', 'dato'), N('c', 150, 100, '3', 'dato'),
      N('x', 440, 100, 'X', 'ora'), N('n', 560, 190, 'N', 'dato', { nascosto: true }),
      T('s', 300, 200, '', { bold: true, size: 12 })
    ],
    passi: [
      { nota: "X ha il lock; tre thread aspettano nella entry queue, arrivati nell'ordine 1, 2, 3." },
      { nota: "X rilascia il lock. Proprio in quel momento arriva un thread nuovo, N.", set: { x: { x: 560, y: 60, tono: 'dato' }, n: { nascosto: false } } },
      { nota: "Con un lock <b>non fair</b> (il default di <code>new ReentrantLock()</code>) N può prendere il lock prima di chi aspetta: un <b>sorpasso</b>. Se succede sempre a sfavore di 1, 1 aspetta per sempre: <b>starvation</b>.", set: { n: { x: 440, y: 100, tono: 'no' }, s: { t: 'non fair: N sorpassa', tono: 'no' } } },
      { nota: "Con <code>new ReentrantLock(true)</code> la entry queue è <b>fair</b>: entra chi aspetta da più tempo, cioè 1 (slide 29). In questo corso <b>fairness</b> vuol dire proprio assenza di starvation. Attenzione: rende fair solo la coda del lock, non la <i>logica</i> del monitor.", set: { n: { x: 560, y: 190, tono: 'dato' }, a: { x: 440, y: 100, tono: 'ok' }, s: { t: 'fair: entra 1, il più vecchio', tono: 'ok' } } }
    ]
  };

  // 2. Mesa contro Hoare
  SCENE.mesahoare = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      R('eq', 20, 60, 140, 140, 'entry queue', { tono: 'spento' }), R('mon', 230, 60, 140, 140, 'monitor', { tono: 'spento' }), R('cq', 440, 60, 140, 140, 'condition queue', { tono: 'spento' }),
      N('r1', 510, 100, 'R1', 'dato'), N('w1', 300, 100, 'W1', 'due'), N('w2', 90, 100, 'W2', 'due'),
      T('st', 300, 226, 'writer = true', { bold: true, size: 12 })
    ],
    passi: [
      { nota: "R1 aspetta nella condition queue perché c'è uno scrittore (W1). W2, un altro scrittore, aspetta nella entry queue." },
      { nota: "W1 finisce: writer = false e <code>signalAll()</code>. R1 viene svegliato. Dove va adesso? Dipende dalla <b>semantica</b> del monitor.", set: { w1: { x: 90, y: 170, tono: 'spento' }, st: { t: 'writer = false', tono: 'ok' } } },
      { nota: "<b>Hoare</b>: chi è svegliato ha la <b>priorità</b> ed entra subito, con la condizione ancora vera. R1 legge in sicurezza.", set: { r1: { x: 300, y: 100, tono: 'ok' } } },
      { nota: "<b>Mesa</b> (la semantica di <b>Java</b>): R1 torna nella entry queue e compete con W2. Se vince W2, entra prima lui…", set: { r1: { x: 90, y: 150, tono: 'dato' }, w2: { x: 300, y: 100, tono: 'due' } } },
      { nota: "…e rimette writer = true. Quando R1 finalmente rientra, la condizione che l'aveva svegliato <b>non vale più</b>. Per questo in Java la guardia di <code>await()</code> sta in un <code>while</code>: R1 ricontrolla e torna ad aspettare.", set: { st: { t: 'writer = true di nuovo', tono: 'no' }, r1: { x: 510, y: 100, tono: 'no' } } }
    ]
  };

  // 3. starvation degli scrittori
  const bar = (id, x, w, y, t, tono) => R(id, x, y, w, 22, t, { tono, nascosto: true });
  SCENE.starvscrittori = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s013|'}}',
    oggetti: [
      T('lr', 50, 60, 'lettori', { bold: true, size: 12 }), T('lw', 50, 150, 'W', { bold: true, size: 12 }),
      bar('r1', 100, 150, 40, 'R1', 'dato'), bar('r2', 200, 150, 66, 'R2', 'dato'), bar('r3', 300, 150, 40, 'R3', 'dato'), bar('r4', 400, 150, 66, 'R4', 'dato'),
      bar('w', 150, 430, 140, 'W aspetta: readers > 0', 'no'),
      T('c', 320, 210, '', { bold: true, size: 12 })
    ],
    passi: [
      { nota: "Nel ReadWriteMonitor base un lettore entra se non c'è uno scrittore <b>dentro</b>; uno scrittore entra solo se non c'è <b>nessun</b> lettore." },
      { nota: "R1 legge. W arriva e aspetta, perché readers &gt; 0.", set: { r1: { nascosto: false }, w: { nascosto: false } } },
      { nota: "Prima che R1 esca arriva R2: nessuno scrittore è dentro, quindi entra. Poi R1 esce, ma readers vale ancora 1.", set: { r2: { nascosto: false } } },
      { nota: "E così via: R3, R4… Se i lettori si danno il cambio senza mai lasciare la stanza vuota, readers non torna mai a 0 e <b>W non scrive mai</b>. Mutua esclusione rispettata, assenza di starvation no.", set: { r3: { nascosto: false }, r4: { nascosto: false }, c: { t: 'readers mai a 0: W affamato', tono: 'no' } } },
      { nota: "Rimedio (FairReadWriteMonitor): lo scrittore <b>prenota</b>, mettendo writer = true <b>prima</b> di aspettare i lettori. I lettori nuovi vedono writer = true e aspettano; quelli già dentro escono, e W entra.", set: { r3: { nascosto: true }, r4: { nascosto: true }, w: { t: 'W prenota, poi scrive', tono: 'ok', x: 350, w: 230 }, c: { t: 'prenotazione: niente starvation', tono: 'ok' } } }
    ]
  };

  // 4. busy-wait
  SCENE.busywait = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s014|'}}',
    oggetti: [
      T('l1', 90, 70, 'busy-wait', { bold: true, size: 12 }), T('l2', 90, 150, 'await()', { bold: true, size: 12 }),
      R('b1', 160, 58, 0, 24, '', { tono: 'no' }), R('b2', 160, 138, 0, 24, '', { tono: 'ok', nascosto: true }),
      T('c1', 470, 70, '', { size: 12 }), T('c2', 470, 150, '', { size: 12 }), T('c', 300, 214, '', { bold: true, size: 12 })
    ],
    passi: [
      { nota: "Due modi di aspettare che una condizione diventi vera. <b>Busy-wait</b>: un ciclo che ricontrolla in continuazione." },
      { nota: "Il thread resta <b>running</b>: ogni giro del ciclo consuma CPU per controllare uno stato che non cambia. Magari toglie la CPU proprio al thread che dovrebbe cambiare lo stato.", set: { b1: { w: 240, t: 'controlla, controlla, …' }, c1: { t: 'CPU occupata', tono: 'no' } } },
      { nota: "Con <code>condition.await()</code> dentro il while, il thread va in <b>blocked</b>: non usa CPU finché qualcuno non chiama <code>signal</code>.", set: { b2: { nascosto: false, w: 240, t: 'bloccato: 0% CPU' }, c2: { t: 'CPU libera per gli altri', tono: 'ok' } } },
      { nota: "Dalle slide: \"Exercise solutions using busy-wait will not be approved\". Negli assignment ogni attesa va fatta bloccandosi (await, wait, acquire, join).", set: { c: { t: 'busy-wait = soluzione non approvata', tono: 'no' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s015|}}</h1>
  <p class="lede">{{s|s016|}}</p>
</header>

<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <div class="box regola" data-tit="{{a|s019|}}">
    <p>{{s|s020|}}</p>
  </div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s021|}}</th><th>{{s|s022|}}</th><th>{{s|s023|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s024|}}</td><td>{{s|s025|}}</td><td>{{s|s026|}}</td></tr>
      <tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="fairlock" data-titolo="{{a|s030|}}"></figure>
</section>

<section>
  <h2>{{s|s031|}}</h2>
  <figure class="scena" data-scena="code" data-titolo="{{a|s032|}}"></figure>
  <div class="box idea" data-tit="{{a|s033|}}">
    <p>{{s|s034|}}</p>
    <p class="piccolo">{{s|s035|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s036|}}</h2>
  <div class="colonne">
    <div class="carta">
      <h4>{{s|s037|}}</h4>
      <p>{{s|s038|}}</p>
    </div>
    <div class="carta">
      <h4>{{s|s039|}}</h4>
      <p>{{s|s040|}}</p>
    </div>
  </div>
  <div class="box regola" data-tit="{{a|s041|}}">
    <p>{{s|s042|}}</p>
  </div>
  <figure class="scena" data-scena="mesahoare" data-titolo="{{a|s043|}}"></figure>
</section>

<section>
  <h2>{{s|s044|}}</h2>
  <figure class="passi" data-titolo="{{a|s045|}}">
    <div class="passo"><div class="espr">readLock:   while (<mark class="dato">writer</mark>) await();</div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr">writeLock:  while (<mark class="due">readers &gt; 0</mark> || writer) await();</div><p class="nota">{{s|s047|}}</p></div>
    <div class="passo"><div class="espr">R1 dentro · W aspetta · <mark class="no">R2 entra</mark> · R1 esce · <mark class="no">R3 entra</mark> · R2 esce · …</div><p class="nota">{{s|s048|}}</p></div>
    <div class="passo"><div class="espr">{{s|s049|}}</div><p class="nota">{{s|s050|}}</p></div>
  </figure>
  <figure class="codice" data-titolo="{{a|s051|}}">
<pre data-lang="java">public void writeLock() {
    lock.lock();
    try {
        while (writer)
            condition.await();
        writer = true;
        while (readers &gt; 0)
            condition.await();
    } catch (InterruptedException e) { e.printStackTrace(); }
    finally { lock.unlock(); }
}</pre>
    <ol class="spiega">
      <li data-righe="4-5" data-segna="while (writer)@due"><p>{{s|s052|}}</p></li>
      <li data-righe="6" data-segna="writer = true;@ora"><p>{{s|s053|}}</p></li>
      <li data-righe="7-8" data-segna="while (readers &gt; 0)@ok"><p>{{s|s054|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s055|}}">
    <p>{{s|s056|}}</p>
  </div>
  <figure class="scena" data-scena="starvscrittori" data-titolo="{{a|s057|}}"></figure>
</section>

<section>
  <h2>{{s|s058|}}</h2>
  <p>{{s|s059|}}</p>
  <div class="colonne">
    <div class="carta cattiva">
      <h4>{{s|s060|}}</h4>
      <pre class="cod" data-lang="java">while (i &gt; 0) {
    // non faccio niente, ricontrollo
}</pre>
      <p>{{s|s061|}}</p>
    </div>
    <div class="carta buona">
      <h4>{{s|s062|}}</h4>
      <pre class="cod" data-lang="java">while (i &gt; 0) {
    condition.await();
}</pre>
      <p>{{s|s063|}}</p>
    </div>
  </div>
  <div class="box esame" data-tit="{{a|s064|}}">
    <p>{{s|s065|}}</p>
  </div>
  <figure class="scena" data-scena="busywait" data-titolo="{{a|s066|}}"></figure>
</section>

</main>
</body>
</html>
