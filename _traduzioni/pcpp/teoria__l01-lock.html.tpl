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
PROGRAMMI.senzalock = {
  memoria: { counter: 0 },
  thread: ['t1', 't2'],
  locali: { temp: 0 },
  passi: [
    { n: 1, codice: '// (niente lock)' },
    { n: 2, codice: 'int temp = counter;', fai: (m, l) => { l.temp = m.counter; } },
    { n: 3, codice: 'counter = temp + 1;', fai: (m, l) => { m.counter = l.temp + 1; } },
    { n: 4, codice: '// (niente unlock)' }
  ],
  esito: m => 'counter = ' + m.counter,
  giusto: m => m.counter === 2
};
PROGRAMMI.conlock = {
  memoria: { counter: 0 },
  thread: ['t1', 't2'],
  locali: { temp: 0 },
  passi: [
    { n: 1, codice: 'l.lock();', lock: 'l' },
    { n: 2, codice: 'int temp = counter;', fai: (m, l) => { l.temp = m.counter; } },
    { n: 3, codice: 'counter = temp + 1;', fai: (m, l) => { m.counter = l.temp + 1; } },
    { n: 4, codice: 'l.unlock();', unlock: 'l' }
  ],
  esito: m => 'counter = ' + m.counter,
  giusto: m => m.counter === 2
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});

  // 1. sezione critica
  SCENE.stanza = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      R('sc', 230, 60, 150, 110, 'sezione critica', { tono: 'spento' }),
      T('dentro', 305, 150, 'temp = counter; counter = temp + 1', { size: 10 }),
      N('t1', 120, 90, 't1', 'dato'), N('t2', 120, 150, 't2', 'due'),
      T('c', 300, 210, '', { bold: true })
    ],
    passi: [
      { nota: "La <b>sezione critica</b> è il pezzo di codice che usa la memoria condivisa: qui le due righe che leggono e scrivono counter. È come una stanza in cui può stare <b>una sola</b> persona alla volta." },
      { nota: "t1 entra: esegue lettura e scrittura senza che nessuno si infili a metà.", set: { t1: { x: 305, y: 100, tono: 'ora' }, c: { t: 't1 dentro, t2 fuori ad aspettare' } } },
      { nota: "t1 esce; ora può entrare t2, che legge il valore già aggiornato da t1. L'aggiornamento perso diventa impossibile.", set: { t1: { x: 480, y: 90, tono: 'dato' }, t2: { x: 305, y: 100, tono: 'ora' }, c: { t: 't2 dentro, legge il valore nuovo' } } },
      { nota: "Quanto grande farla? Il più piccola possibile, solo gli accessi alla memoria condivisa. Se contenesse tutto il <code>for</code>, un thread farebbe tutti i suoi giri mentre l'altro aspetta: il programma diventerebbe <b>sequenziale</b>, e i thread non servirebbero a niente (esercizio 1.1.5).", set: { t2: { x: 480, y: 150, tono: 'due' }, sc: { w: 330, x: 140, tono: 'no', t: 'tutto il for: troppo grande' }, dentro: { t: '' }, c: { t: 'sezione critica minima', tono: 'ok' } } }
    ]
  };

  // 2. le tre proprietà
  SCENE.dijkstra = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      R('sc', 240, 70, 130, 90, 'sezione critica', { tono: 'spento' }),
      N('t1', 120, 90, 't1', 'dato'), N('t2', 120, 150, 't2', 'due'),
      T('p', 300, 30, '', { bold: true }), T('c', 300, 210, '', { size: 12 })
    ],
    passi: [
      { nota: "Le tre proprietà di una buona soluzione al problema della mutua esclusione (Dijkstra, slide 54). Una alla volta, vedendo cosa vuol dire violarle." },
      { nota: "<b>Mutual exclusion</b>: al più un thread alla volta nella sezione critica. Violata se ci sono t1 e t2 dentro insieme.", set: { t1: { x: 285, y: 100 }, t2: { x: 325, y: 130 }, sc: { tono: 'no' }, p: { t: 'mutua esclusione violata', tono: 'no' }, c: { t: 'due thread dentro insieme' } } },
      { nota: "<b>Absence of deadlock</b>: i thread prima o poi escono e lasciano entrare gli altri. Violata se tutti restano bloccati per sempre, per esempio perché chi ha il lock non lo rilascia mai.", set: { t1: { x: 270, y: 145 }, t2: { x: 120, y: 150 }, sc: { tono: 'no', t: 'lock mai rilasciato' }, p: { t: 'deadlock', tono: 'no' }, c: { t: 't2 aspetta per sempre' } } },
      { nota: "<b>Absence of starvation</b>: chi è pronto a entrare prima o poi entra. Violata se t2 viene sempre scavalcato: t1 esce e rientra, esce e rientra, e t2 non passa mai. In pratica non sempre si riesce a garantirla (fairness, lezione 2).", set: { sc: { tono: 'spento', t: 'sezione critica' }, p: { t: 'starvation', tono: 'no' }, c: { t: 't1 rientra sempre prima di t2' } } },
      { nota: "Una soluzione corretta rispetta tutte e tre: un thread alla volta, nessuno bloccato per sempre, nessuno scavalcato all'infinito. I lock di Java garantiscono la prima; la seconda dipende dall'usarli bene (try/finally).", set: { t1: { x: 120, y: 90 }, sc: { tono: 'ok' }, p: { t: 'le tre proprietà', tono: 'ok' }, c: { t: '' } } }
    ]
  };

  // 3. dimostrazione per contraddizione
  const pos = { a: 60, b: 180, c: 300, d: 420, e: 540 };
  SCENE.contraddizione = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [
      N('t12', 60, 60, 't1(2)', 'dato', { r: 24 }), N('t22', 200, 60, 't2(2)', 'due', { r: 24 }), N('t13', 340, 60, 't1(3)', 'dato', { r: 24 }), N('t23', 480, 60, 't2(3)', 'due', { r: 24 }),
      { id: 'o1', tipo: 'arco', da: 't12', a: 't22', dir: true, t: '' }, { id: 'o2', tipo: 'arco', da: 't22', a: 't13', dir: true, t: 'assunto', tono: 'no' }, { id: 'o3', tipo: 'arco', da: 't13', a: 't23', dir: true, t: '' },
      N('t21', 200, 170, 't2(1)', 'due', { r: 24, nascosto: true }), N('t14', 340, 170, 't1(4)', 'dato', { r: 24, nascosto: true }),
      { id: 'v1', tipo: 'arco', da: 't21', a: 't22', dir: true, t: 'lock prima', tono: 'ora', nascosto: true },
      { id: 'v2', tipo: 'arco', da: 't14', a: 't21', dir: true, t: 'unlock prima', tono: 'ora', nascosto: true },
      { id: 'v3', tipo: 'arco', da: 't13', a: 't14', dir: true, t: 'program order', tono: 'ora', nascosto: true },
      T('c', 300, 236, '', { bold: true })
    ],
    passi: [
      { nota: "Con il lock, l'interleaving …, t1(2), …, t2(2), …, t1(3), …, t2(3), … (quello del lost update) è possibile? Si <b>assume</b> che lo sia, e si cerca una contraddizione. Le frecce dicono \"viene prima\"." },
      { nota: "t2(2) è dentro la sezione critica: t2 deve aver preso il lock prima, quindi <b>t2(1) prima di t2(2)</b>.", set: { t21: { nascosto: false }, v1: { nascosto: false } } },
      { nota: "t2 può prendere il lock solo dopo che t1 l'ha rilasciato (t1 è dentro, a t1(2)): <b>t1(4) prima di t2(1)</b>.", set: { t14: { nascosto: false }, v2: { nascosto: false } } },
      { nota: "Per il program order di t1: <b>t1(3) prima di t1(4)</b>.", set: { v3: { nascosto: false } } },
      { nota: "Seguendo le frecce: t1(3) → t1(4) → t2(1) → t2(2) → t1(3). t1(3) dovrebbe venire <b>prima di sé stesso</b>: un ciclo. <b>Contraddizione</b>: l'interleaving è impossibile (slide 59–60).", set: { o2: { tono: 'no' }, v1: { tono: 'no' }, v2: { tono: 'no' }, v3: { tono: 'no' }, c: { t: 'ciclo di "prima di": impossibile', tono: 'no' } } }
    ]
  };

  // 4. try/finally
  SCENE.trylock = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [
      R('lk', 250, 20, 110, 36, 'lock libero', { tono: 'ok' }),
      N('t1', 100, 110, 't1', 'dato'), N('t2', 100, 190, 't2', 'due'),
      T('a', 300, 110, '', { size: 12 }), T('b', 300, 190, '', { size: 12 }), T('c', 470, 150, '', { bold: true, size: 12 })
    ],
    passi: [
      { nota: "t1 prende il lock e comincia la sezione critica.", set: { lk: { t: 'lock di t1', tono: 'dato' }, a: { t: 't1: lock(); temp = counter;' } } },
      { nota: "A metà viene lanciata un'<b>eccezione</b>. Senza try/finally il metodo esce subito, e la riga con <code>unlock()</code> non viene mai eseguita.", set: { a: { t: 't1: throw → esce, unlock() saltato', tono: 'no' }, t1: { tono: 'no' } } },
      { nota: "Il lock resta \"di t1\" per sempre. t2 chiama <code>lock()</code> e si blocca: <b>deadlock</b>, anche se t1 non esiste più.", set: { lk: { tono: 'no', t: 'lock mai rilasciato' }, b: { t: 't2: lock() → bloccato per sempre', tono: 'no' } } },
      { nota: "Con l'idioma <code>lock(); try { … } finally { unlock(); }</code> il blocco <code>finally</code> viene eseguito <b>comunque</b>, anche con l'eccezione: il lock si libera e t2 entra. Le slide: le soluzioni senza questo idioma \"cannot be deemed as free from deadlocks\".", set: { lk: { tono: 'ok', t: 'rilasciato in finally' }, t1: { tono: 'dato' }, a: { t: 't1: throw → finally: unlock()', tono: 'ok' }, b: { t: 't2: lock() → entra', tono: 'ok' }, c: { t: 'sempre try/finally' } } }
    ]
  };

  // 5. check-then-act
  SCENE.covid = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: [
      R('cnt', 230, 20, 150, 40, 'counter = 14 999', { tono: 'spento' }),
      T('l1', 60, 100, 't1', { bold: true }), T('l2', 60, 160, 't2', { bold: true }),
      T('a1', 300, 100, '', { size: 12 }), T('a2', 300, 160, '', { size: 12 }), T('c', 300, 220, '', { bold: true })
    ],
    passi: [
      { nota: "Tornello Covid: al massimo 15 000 persone. Versione sbagliata: il <b>controllo</b> è fuori dal lock, solo l'incremento è dentro. counter vale 14 999." },
      { nota: "t1 controlla: 14 999 &lt; 15 000, può entrare.", set: { a1: { t: 'if (counter < MAX) → vero', tono: 'dato' } } },
      { nota: "Prima che t1 incrementi, anche t2 controlla: vede ancora 14 999, può entrare anche lui.", set: { a2: { t: 'if (counter < MAX) → vero', tono: 'due' } } },
      { nota: "Tutti e due incrementano (ognuno nel lock, ma non importa): <b>15 001</b>. Il limite è violato. È una race condition di tipo <b>check-then-act</b>: la decisione si basa su un valore che nel frattempo cambia.", set: { a1: { t: 'lock; counter++ → 15 000' }, a2: { t: 'lock; counter++ → 15 001', tono: 'no' }, cnt: { t: 'counter = 15 001', tono: 'no' }, c: { t: 'limite superato', tono: 'no' } } },
      { nota: "Rimedio: controllo e incremento <b>nella stessa</b> sezione critica. Allora t2 può controllare solo dopo che t1 ha finito, vede 15 000 e non entra. Controllo e azione vanno fatti insieme, sotto lo stesso lock (esercizio 1.3).", set: { cnt: { t: 'counter = 15 000', tono: 'ok' }, a1: { t: 'lock; if (<) counter++ → 15 000; unlock', tono: 'dato' }, a2: { t: 'lock; if (15 000 < 15 000) no; unlock', tono: 'ok' }, c: { t: 'check e act nello stesso lock', tono: 'ok' } } }
    ]
  };

  // 6. schema della risposta
  const passi4 = ['1. il problema', '2. la sezione critica', '3. perché funziona', '4. l’unico output'];
  const og6 = [];
  passi4.forEach((t, i) => og6.push(R('s' + i, 20 + (i % 2) * 290, 30 + Math.floor(i / 2) * 60, 270, 44, t, { nascosto: true })));
  og6.push(T('c1', 300, 170, '', { size: 12 }), T('c2', 300, 196, '', { size: 12 }), T('c3', 300, 224, '', { bold: true }));
  const accendi = k => Object.fromEntries(passi4.map((_, i) => ['s' + i, { nascosto: i > k, tono: i === k ? 'ora' : (i < k ? 'ok' : null) }]));
  SCENE.schema = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: og6,
    passi: [
      { nota: "<b>Il problema</b>, con le parole del corso: count = count + 1 non è atomico, esistono interleaving con un valore vecchio (stale) e un incremento perso: race condition.", set: Object.assign(accendi(0), { c1: { t: 'non atomico → lost update' } }) },
      { nota: "<b>La sezione critica</b>: lettura e scrittura di count, protette da lock()/unlock() sullo <b>stesso</b> ReentrantLock, con try/finally.", set: Object.assign(accendi(1), { c1: { t: 'cosa è protetto, e con che cosa' } }) },
      { nota: "<b>Perché funziona</b>: per la mutua esclusione i passi della sezione critica di un thread non si mescolano con quelli dell'altro. Nel costruttore con 4 passi per thread, gli interleaving passano da 70 a 2, e nei 2 rimasti ogni incremento legge il valore scritto dal precedente.", set: Object.assign(accendi(2), { c1: { t: 'interleaving: da 70 a 2' }, c2: { t: 'restano solo quelli senza lost update' } }) },
      { nota: "<b>L'unico output</b>: ognuno dei 2 × 10 000 000 incrementi aggiunge esattamente 1, quindi il risultato è sempre 20 000 000. È lo schema dell'esercizio 1.1.4, e di quasi ogni risposta all'orale.", set: Object.assign(accendi(3), { c3: { t: 'sempre 20 000 000', tono: 'ok' } }) }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s008|}}</h1>
  <p class="lede">{{s|s009|}}</p>
</header>

<section>
  <h2>{{s|s010|}}</h2>
  <div class="box regola" data-tit="{{a|s011|}}">
    <p>{{s|s012|}}</p>
  </div>
  <figure class="codice" data-titolo="{{a|s013|}}">
<pre data-lang="java">public class Turnstile extends Thread {
    public void run() {
        for (int i = 0; i &lt; PEOPLE; i++) {
            // inizio sezione critica
            int temp = counter;
            counter = temp + 1;
            // fine sezione critica
        }
    }
}</pre>
    <ol class="spiega">
      <li data-righe="5-6" data-segna="counter*@ora"><p>{{s|s014|}}</p></li>
      <li data-righe="3" data-segna="int i = 0@dato|i++@dato"><p>{{s|s015|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s016|}}">
    <p>{{s|s017|}}</p>
  </div>
  <figure class="scena" data-scena="stanza" data-titolo="{{a|s018|}}"></figure>
</section>

<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s021|}}</th><th>{{s|s022|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s023|}}</td><td>{{s|s024|}}</td></tr>
      <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td></tr>
      <tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="dijkstra" data-titolo="{{a|s029|}}"></figure>
</section>

<section>
  <h2>{{s|s030|}}</h2>
  <div class="colonne">
    <div class="carta">
      <h4>{{s|s031|}}</h4>
      <p>{{s|s032|}}</p>
    </div>
    <div class="carta">
      <h4>{{s|s033|}}</h4>
      <p>{{s|s034|}}</p>
    </div>
  </div>
  <p>{{s|s035|}}</p>
  <h3>{{s|s036|}}</h3>
  <figure class="interleaving" data-prog="senzalock" data-titolo="{{a|s037|}}"></figure>
  <h3>{{s|s038|}}</h3>
  <figure class="interleaving" data-prog="conlock" data-titolo="{{a|s039|}}"></figure>
  <figure class="passi" data-titolo="{{a|s040|}}">
    <div class="passo"><div class="espr">senza lock:  <mark class="no">70</mark> interleaving  =  8! / (4! · 4!)</div><p class="nota">{{s|s041|}}</p></div>
    <div class="passo"><div class="espr">{{s|s042|}}</div><p class="nota">{{s|s043|}}</p></div>
    <div class="passo"><div class="espr">t1(1), t1(2), t1(3), t1(4), t2(1), t2(2), t2(3), t2(4)
t2(1), t2(2), t2(3), t2(4), t1(1), t1(2), t1(3), t1(4)</div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">{{s|s045|}}</div><p class="nota">{{s|s046|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s047|}}</h2>
  <p>{{s|s048|}}</p>
  <pre class="cod" data-lang="java">public void run() {
    l.lock();             // (1)
    int temp = counter;   // (2)
    counter = temp + 1;   // (3)
    l.unlock();           // (4)
}</pre>
  <figure class="passi" data-titolo="{{a|s049|}}">
    <div class="passo"><div class="espr">…, <mark class="dato">t1(2)</mark>, …, <mark class="due">t2(2)</mark>, …, <mark class="dato">t1(3)</mark>, …, <mark class="due">t2(3)</mark>, …</div><p class="nota">{{s|s050|}}</p></div>
    <div class="passo"><div class="espr">…, t1(2), …, t1(4), …, <mark class="ora">t2(1)</mark>, …, t2(2), t1(3), t2(3), …</div><p class="nota">{{s|s051|}}</p></div>
    <div class="passo"><div class="espr">…, t1(2), …, <mark class="ora">t1(3)</mark>, …, t1(4), …, t2(1), …, t2(2), <mark class="no">t1(3)</mark>, t2(3), …</div><p class="nota">{{s|s052|}}</p></div>
    <div class="passo"><div class="espr">{{s|s053|}}</div><p class="nota">{{s|s054|}}</p></div>
  </figure>
  <figure class="scena" data-scena="contraddizione" data-titolo="{{a|s055|}}"></figure>
</section>

<section>
  <h2>{{s|s056|}}</h2>
  <div class="colonne">
    <div class="carta cattiva">
      <h4>{{s|s057|}}</h4>
      <pre class="cod" data-lang="java">l.lock();
int temp = counter;
counter = temp + 1;
l.lock();   // blocca per sempre</pre>
      <p>{{s|s058|}}</p>
    </div>
    <div class="carta cattiva">
      <h4>{{s|s059|}}</h4>
      <pre class="cod" data-lang="java">l.lock();
int temp = counter;
throw new Exception();
// unlock() mai eseguito</pre>
      <p>{{s|s060|}}</p>
    </div>
  </div>
  <figure class="codice" data-titolo="{{a|s061|}}">
<pre data-lang="java">Lock l = new ReentrantLock();

l.lock();
try {
    // sezione critica
    counter++;
} finally {
    l.unlock();
}</pre>
    <ol class="spiega">
      <li data-righe="3" data-segna="l.lock();@ora"><p>{{s|s062|}}</p></li>
      <li data-righe="4-6" data-segna="try@dato"><p>{{s|s063|}}</p></li>
      <li data-righe="7-9" data-segna="finally@ok|l.unlock();@ok"><p>{{s|s064|}}</p></li>
    </ol>
  </figure>
  <div class="box esame" data-tit="{{a|s065|}}">
    <p>{{s|s066|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s067|}}">
    <div class="passo"><div class="espr">l.lock();     <span class="mano">// preso (contatore 1)</span></div><p class="nota">{{s|s068|}}</p></div>
    <div class="passo"><div class="espr">{{s|s069|}}</div><p class="nota">{{s|s070|}}</p></div>
    <div class="passo"><div class="espr">l.unlock();   <span class="mano">// ancora suo (contatore 1)</span></div><p class="nota">{{s|s071|}}</p></div>
    <div class="passo"><div class="espr">l.unlock();   <span class="mano">// <mark class="ok">libero</mark> (contatore 0)</span></div><p class="nota">{{s|s072|}}</p></div>
  </figure>
  <figure class="scena" data-scena="trylock" data-titolo="{{a|s073|}}"></figure>
</section>

<section>
  <h2>{{s|s074|}}</h2>
  <p>{{s|s075|}}</p>
  <div class="colonne">
    <div class="carta cattiva">
      <h4>{{s|s076|}}</h4>
      <pre class="cod" data-lang="java">if (counter &lt; MAX_PEOPLE_COVID) {
    lock.lock();
    try { counter++; }
    finally { lock.unlock(); }
}</pre>
      <p>{{s|s077|}}</p>
    </div>
    <div class="carta buona">
      <h4>{{s|s078|}}</h4>
      <pre class="cod" data-lang="java">lock.lock();
try {
    if (counter &lt; MAX_PEOPLE_COVID)
        counter++;
} finally {
    lock.unlock();
}</pre>
      <p>{{s|s079|}}</p>
    </div>
  </div>
  <figure class="scena" data-scena="covid" data-titolo="{{a|s080|}}"></figure>
</section>

<section>
  <h2>{{s|s081|}}</h2>
  <figure class="passi" data-titolo="{{a|s082|}}">
    <div class="passo"><div class="espr testo">{{s|s083|}}</div><p class="nota">{{s|s084|}}</p></div>
    <div class="passo"><div class="espr testo">{{s|s085|}}</div><p class="nota">{{s|s086|}}</p></div>
    <div class="passo"><div class="espr testo">{{s|s087|}}</div><p class="nota">{{s|s088|}}</p></div>
    <div class="passo"><div class="espr testo">{{s|s089|}}</div><p class="nota">{{s|s090|}}</p></div>
  </figure>
  <div class="box inglese" data-tit="{{a|s091|}}">
    <p>{{s|s092|}}</p>
  </div>
  <figure class="scena" data-scena="schema" data-titolo="{{a|s093|}}"></figure>
</section>

</main>
</body>
</html>
