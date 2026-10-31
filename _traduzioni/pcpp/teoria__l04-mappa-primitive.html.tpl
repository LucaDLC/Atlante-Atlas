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
  const D = [['q1', 'Il valore cambia dopo il costruttore?', 'no → final'], ['q2', 'Solo un flag scritto da uno, letto dagli altri?', 'sì → volatile'],
             ['q3', 'Leggi-e-poi-scrivi o più campi insieme?', 'sì → lock'], ['q4', 'Bisogna aspettare che lo stato diventi giusto?', 'sì → monitor (while)'],
             ['q5', 'Al massimo c thread insieme?', 'sì → Semaphore'], ['q6', 'Tutti devono arrivare allo stesso punto?', 'sì → CyclicBarrier']];
  const ogg = [];
  D.forEach(([id, q, r], k) => {
    ogg.push({ id, tipo: 'testo', x: 20, y: 40 + k * 38, t: q, size: 13, anchor: 'start' });
    ogg.push({ id: id + 'r', tipo: 'testo', x: 420, y: 40 + k * 38, t: r, size: 13, bold: true, anchor: 'start', nascosto: true });
  });
  ogg.push({ id: 'n', tipo: 'testo', x: 300, y: 285, t: 'Caso: un contatore condiviso, count++ da più thread', size: 13, bold: true, tono: 'ora' });
  SCENE.scegli = {
    w: 600, h: 300, lato: false,
    legenda: '{{j|s002|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s003|'}}' },
      { nota: '{{j|s004|'}}', set: { q1: { tono: 'no' }, q1r: { nascosto: false, tono: 'spento' } } },
      { nota: '{{j|s005|'}}', set: { q2: { tono: 'no' }, q2r: { nascosto: false, tono: 'spento' } } },
      { nota: '{{j|s006|'}}', set: { q3: { tono: 'ok' }, q3r: { nascosto: false, tono: 'ok' }, n: { t: 'risposta: synchronized / ReentrantLock', tono: 'ok' } } },
      { nota: '{{j|s007|'}}', set: { q4r: { nascosto: false }, q5r: { nascosto: false }, q6r: { nascosto: false } } }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 18 }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});

    // tre famiglie
    SCENE.famiglie = {
      w: 620, h: 250, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [
        T('h1', 105, 24, '1 · lock', { bold: true }), T('h2', 310, 24, '2 · attesa di una condizione', { bold: true }), T('h3', 515, 24, '3 · solo visibilità', { bold: true }),
        R('s1', 45, 50, 120, 100, '', { tono: 'spento' }), T('l1', 105, 72, 'sezione critica', { size: 12 }), N('a1', 70, 180, 'A', 'dato'), N('a2', 140, 180, 'B', 'dato'),
        R('s2', 250, 50, 120, 100, '', { tono: 'spento' }), T('l2', 310, 72, 'buffer vuoto', { size: 12 }), N('b1', 310, 180, 'C', 'dato'),
        R('s3', 455, 50, 120, 100, '', { tono: 'spento' }), T('l3', 515, 72, 'volatile v = 0', { size: 12 }), N('c1', 480, 180, 'W', 'dato'), N('c2', 550, 180, 'R', 'dato'),
        T('k', 310, 236, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "Le primitive di sincronizzazione del corso si dividono in <b>tre famiglie</b>, secondo il problema che risolvono." },
        { nota: "<b>1 · Lock</b> (synchronized, ReentrantLock): <b>un thread alla volta</b> nella sezione critica. A entra, B aspetta. Dà mutua esclusione e, con la regola del monitor, anche visibilità.", set: { a1: { x: 105, y: 115, tono: 'ora' }, a2: { tono: 'no' }, k: { t: 'lock: uno alla volta' } } },
        { nota: "<b>2 · Attesa di una condizione</b> (monitor con condition, Semaphore, CyclicBarrier): un thread aspetta che lo <b>stato</b> cambi. C vuole prendere da un buffer vuoto: si blocca finché qualcuno non inserisce.", set: { b1: { tono: 'no' }, k: { t: 'condizione: aspetta che lo stato cambi' } } },
        { nota: "…qualcuno inserisce un elemento e segnala: C riparte.", set: { l2: { t: 'buffer: 1 elemento' }, b1: { x: 310, y: 115, tono: 'ora' } } },
        { nota: "<b>3 · Solo visibilità</b> (volatile, final): <b>nessuna</b> mutua esclusione, solo la garanzia che chi legge veda l'ultima scrittura. W scrive v = 1, R legge 1. Ma W e R possono stare \"dentro\" insieme.", set: { s3: { tono: 'ok' }, l3: { t: 'volatile v = 1' }, c1: { x: 490, y: 115, tono: 'ok' }, c2: { x: 540, y: 115, tono: 'ok' }, k: { t: 'visibilità: nessuna esclusione, solo l’ultima scrittura' } } }
      ]
    };

    // la tabella come griglia
    const P = ['synchronized', 'ReentrantLock', 'Condition / wait', 'Semaphore', 'CyclicBarrier', 'volatile', 'final'];
    const og = [T('hme', 330, 24, 'mutua esclusione', { bold: true, size: 12 }), T('hhb', 500, 24, 'da dove viene happens-before', { bold: true, size: 12 })];
    P.forEach((p, i) => {
      og.push(R('p' + i, 20, 36 + i * 30, 180, 26, p, { tono: 'spento' }));
      og.push(R('m' + i, 250, 36 + i * 30, 160, 26, '', { tono: 'spento' }), R('h' + i, 420, 36 + i * 30, 180, 26, '', { tono: 'spento' }));
    });
    const riga = (i, me, hb, tme) => ({ ['p' + i]: { tono: 'ora' }, ['m' + i]: { t: me, tono: tme }, ['h' + i]: { t: hb, tono: 'dato' } });
    SCENE.tabella = {
      w: 620, h: 256, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: og,
      passi: [
        { nota: "Le due colonne più importanti della tabella: la primitiva dà <b>mutua esclusione</b>? E quale regola crea <b>happens-before</b>?" },
        { nota: "<b>synchronized</b> e <b>ReentrantLock</b>: mutua esclusione sì; happens-before dalla regola del monitor (unlock → lock successivo sullo stesso lock). Entrambi rientranti, con proprietario.", set: Object.assign(riga(0, 'sì', 'unlock → lock', 'ok'), riga(1, 'sì', 'unlock → lock', 'ok')) },
        { nota: "<b>Condition</b> e <b>wait/notifyAll</b>: si usano tenendo il lock; l'happens-before passa dal lock (await rilascia e riprende).", set: riga(2, 'con il lock', 'passa dal lock', 'due') },
        { nota: "<b>Semaphore</b>: mutua esclusione solo con 1 permesso (mutex); happens-before da release() a un acquire() riuscito. Nessun proprietario: chiunque può fare release.", set: riga(3, 'solo con 1 permesso', 'release → acquire', 'due') },
        { nota: "<b>CyclicBarrier</b>: nessuna mutua esclusione; le azioni prima di await() happens-before quelle dopo il ritorno da await() negli altri thread.", set: riga(4, 'no', 'prima → dopo await()', 'no') },
        { nota: "<b>volatile</b> e <b>final</b>: solo visibilità. volatile: scrittura → letture successive (e accessi mai in conflitto). final: inizializzazione → ogni uso a costruttore finito.", set: Object.assign(riga(5, 'no', 'scrittura → letture', 'no'), riga(6, 'no', 'init → ogni uso', 'no')) }
      ]
    };

    // gli errori classici: sbagliato → giusto
    const E = [
      ['volatile int count; count++', 'AtomicInteger o lock', 'volatile non rende count++ atomico'],
      ['synchronized di istanza su campo static', 'static synchronized', 'oggetti diversi = lock diversi'],
      ['lock(); …; unlock();', 'lock(); try { … } finally { unlock(); }', 'un’eccezione lascerebbe il lock preso'],
      ['if (!ok) c.await();', 'while (!ok) c.await();', 'al risveglio la condizione può essere falsa'],
      ['while (!ok) { }', 'await() / wait() / acquire()', 'busy-wait: CPU sprecata, vietato'],
      ['mutex.acquire(); spaces.acquire();', 'spaces.acquire(); mutex.acquire();', 'bloccarsi tenendo il mutex: deadlock'],
      ['release() senza acquire()', 'release() solo dopo acquire()', 'i permessi superano la capacità']
    ];
    SCENE.errori = {
      w: 620, h: 220, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [
        T('n', 310, 30, '', { bold: true }),
        R('sb', 20, 60, 280, 50, '', { tono: 'no' }), R('gi', 320, 60, 280, 50, '', { tono: 'ok' }),
        T('ls', 160, 128, 'sbagliato', { size: 12 }), T('lg', 460, 128, 'giusto', { size: 12 }),
        T('p', 310, 180, '', { size: 12, bold: true })
      ],
      passi: [{ nota: "Sette errori che tornano sempre, ognuno con la versione giusta e il perché." }].concat(E.map(([s, g, p], i) => ({
        nota: ['<b>Contatore volatile</b>: niente data race, ma count++ è lettura + scrittura: race condition (esercizio 3.1.8).',
          '<b>Lock sbagliato</b>: un metodo synchronized d\'istanza usa il lock di this, diverso per ogni oggetto. Un campo static va protetto con il lock della classe.',
          '<b>lock() senza finally</b>: se la sezione critica lancia un\'eccezione, unlock() non viene mai eseguito e il lock resta preso per sempre.',
          '<b>if al posto di while</b>: dopo il risveglio un altro thread può aver cambiato di nuovo lo stato, o il risveglio è spurio. Ricontrolla sempre.',
          '<b>Attesa attiva</b>: un ciclo vuoto consuma CPU per controllare uno stato che non cambia. Negli esercizi del corso non è accettata.',
          '<b>Ordine dei semafori</b> nel bounded buffer: prima il posto, poi il mutex. Al contrario, a buffer pieno il produttore blocca tutti.',
          '<b>release() in più</b>: Java non controlla chi rilascia. Un release() senza acquire() aggiunge un permesso che non esisteva.'][i],
        set: { n: { t: 'errore ' + (i + 1) + ' di 7' }, sb: { t: s }, gi: { t: g }, p: { t: p } }
      })))
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

<div class="box domanda-tua" data-tit="{{a|s013|}}">
  <p>{{s|s014|}}</p>
</div>

<section>
  <h2>{{s|s015|}}</h2>
  <div class="colonne">
    <div class="carta"><h4>{{s|s016|}}</h4><p>{{s|s017|}}</p></div>
    <div class="carta"><h4>{{s|s018|}}</h4><p>{{s|s019|}}</p></div>
    <div class="carta"><h4>{{s|s020|}}</h4><p>{{s|s021|}}</p></div>
  </div>
  <figure class="scena" data-scena="famiglie" data-titolo="{{a|s022|}}"></figure>
</section>

<section>
  <h2>{{s|s023|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s024|}}</th><th>{{s|s025|}}</th><th>{{s|s026|}}</th><th>{{s|s027|}}</th><th>{{s|s028|}}</th><th>{{s|s029|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td><td>{{s|s035|}}</td></tr>
      <tr><td>{{s|s036|}}</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td><td>{{s|s041|}}</td></tr>
      <tr><td>{{s|s042|}}</td><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>—</td><td>{{s|s046|}}</td></tr>
      <tr><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td>—</td><td>{{s|s051|}}</td></tr>
      <tr><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td>{{s|s054|}}</td><td>{{s|s055|}}</td><td>{{s|s056|}}</td><td>{{s|s057|}}</td></tr>
      <tr><td>{{s|s058|}}</td><td>{{s|s059|}}</td><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>—</td><td>—</td></tr>
      <tr><td>{{s|s062|}}</td><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>—</td><td>—</td></tr>
      <tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>—</td><td>—</td></tr>
      <tr><td>{{s|s070|}}</td><td>{{s|s071|}}</td><td>{{s|s072|}}</td><td>{{s|s073|}}</td><td>—</td><td>—</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s074|}}</p>
  <figure class="scena" data-scena="tabella" data-titolo="{{a|s075|}}"></figure>
</section>

<section>
  <h2>{{s|s076|}}</h2>
  <figure class="passi" data-titolo="{{a|s077|}}">
    <div class="passo"><div class="espr">il valore non cambia mai dopo il costruttore  →  <mark class="ok">final</mark></div><p class="nota">{{s|s078|}}</p></div>
    <div class="passo"><div class="espr">un thread scrive un flag, gli altri lo leggono e basta  →  <mark class="dato">volatile</mark></div><p class="nota">{{s|s079|}}</p></div>
    <div class="passo"><div class="espr">leggi-e-poi-scrivi, check-then-act, più campi da cambiare insieme  →  <mark class="ora">lock</mark></div><p class="nota">{{s|s080|}}</p></div>
    <div class="passo"><div class="espr">aspettare che lo stato diventi "giusto" (buffer non pieno, nessuno scrittore)  →  <mark class="due">monitor</mark></div><p class="nota">{{s|s081|}}</p></div>
    <div class="passo"><div class="espr">al massimo c thread insieme, o contare risorse  →  <mark class="due">Semaphore</mark></div><p class="nota">{{s|s082|}}</p></div>
    <div class="passo"><div class="espr">aspettare che tutti arrivino allo stesso punto  →  <mark class="due">CyclicBarrier</mark></div><p class="nota">{{s|s083|}}</p></div>
  </figure>
  <figure class="scena" data-scena="scegli" data-titolo="{{a|s084|}}"></figure>
</section>

<section>
  <h2>{{s|s085|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s086|}}</th><th>{{s|s087|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s088|}}</td><td>{{s|s089|}}</td></tr>
      <tr><td>{{s|s090|}}</td><td>{{s|s091|}}</td></tr>
      <tr><td>{{s|s092|}}</td><td>{{s|s093|}}</td></tr>
      <tr><td>{{s|s094|}}</td><td>{{s|s095|}}</td></tr>
      <tr><td>{{s|s096|}}</td><td>{{s|s097|}}</td></tr>
      <tr><td>{{s|s098|}}</td><td>{{s|s099|}}</td></tr>
      <tr><td>{{s|s100|}}</td><td>{{s|s101|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="errori" data-titolo="{{a|s102|}}"></figure>
</section>

</main>
</body>
</html>
