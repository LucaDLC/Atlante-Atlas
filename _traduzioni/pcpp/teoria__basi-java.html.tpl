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
SCENE.startjoin = {
  w: 600, h: 230, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'lm', tipo: 'testo', x: 40, y: 70, t: 'main', size: 14, bold: true },
    { id: 'lt', tipo: 'testo', x: 40, y: 150, t: 'turnstile', size: 14, bold: true },
    { id: 'm', tipo: 'nodo', r: 18, x: 110, y: 70, t: 'm', tono: 'dato' },
    { id: 't', tipo: 'nodo', r: 18, x: 110, y: 150, t: 't', tono: 'due', nascosto: true },
    { id: 'tm', tipo: 'linea', x1: 110, y1: 70, x2: 110, y2: 70, tono: 'dato' },
    { id: 'tt', tipo: 'linea', x1: 230, y1: 150, x2: 230, y2: 150, tono: 'due', nascosto: true },
    { id: 'n', tipo: 'testo', x: 330, y: 210, t: '', size: 13, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: { t: { nascosto: false, tono: 'spento' }, n: { t: 'new: oggetto creato, niente in esecuzione' } } },
    { nota: '{{j|s004|'}}', set: { m: { x: 230, tono: 'ora' }, tm: { x2: 230 }, t: { x: 230, tono: 'due' }, tt: { nascosto: false }, n: { t: 'start(): due thread in parallelo' } } },
    { nota: '{{j|s005|'}}', set: { m: { x: 330, tono: 'dato' }, tm: { x2: 330 }, t: { x: 450 }, tt: { x2: 450 } } },
    { nota: '{{j|s006|'}}', set: { m: { tono: 'no' }, t: { x: 520 }, tt: { x2: 520 }, n: { t: 'join(): il main aspetta', tono: 'no' } } },
    { nota: '{{j|s007|'}}', set: { t: { tono: 'spento' }, m: { x: 540, tono: 'ora' }, tm: { x2: 540 }, n: { t: 'dopo join(): println(counter)', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const F = (id, x1, y1, x2, y2, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t: '' }, extra || {});

  // 1. tre forme, un run()
  SCENE.treforme = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [
      R('a', 20, 30, 220, 40, 'class Turnstile extends Thread', { tono: 'dato', nascosto: true }),
      R('b', 20, 100, 220, 40, 'new Thread(new Runnable() {…})', { tono: 'dato', nascosto: true }),
      R('c', 20, 170, 220, 40, 'new Thread(() -> {…})', { tono: 'dato', nascosto: true }),
      F('fa', 242, 50, 358, 110, { nascosto: true }), F('fb', 242, 120, 358, 120, { nascosto: true }), F('fc', 242, 190, 358, 130, { nascosto: true }),
      R('run', 360, 95, 220, 50, 'run(): counter++ × PEOPLE', { tono: 'ok' })
    ],
    passi: [
      { nota: "Quello che un thread <b>fa</b> sta sempre nel metodo <code>run()</code>. Cambia solo il modo di scriverlo." },
      { nota: "<b>1. Estendere Thread</b>: una classe con il suo <code>run()</code>. Chiara, ma occupa l'unica superclasse della classe.", set: { a: { nascosto: false }, fa: { nascosto: false } } },
      { nota: "<b>2. Un Runnable</b> passato al costruttore di Thread: il comportamento sta in un oggetto separato dal thread che lo esegue.", set: { b: { nascosto: false }, fb: { nascosto: false } } },
      { nota: "<b>3. Una lambda</b>: la forma più corta dello stesso Runnable (<code>() -> { … }</code> = una funzione senza parametri). Tutte e tre producono un thread che esegue lo stesso corpo; nessuna parte finché non si chiama <code>start()</code>.", set: { c: { nascosto: false }, fc: { nascosto: false } } }
    ]
  };

  // 2. il codice nel costruttore
  SCENE.costruttore = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      R('m', 20, 30, 150, 40, 'static main', { tono: 'dato' }),
      R('o', 220, 20, 200, 90, '', { tono: 'ok', nascosto: true }), T('o1', 320, 45, 'CounterThreadsLock', { bold: true, size: 12, nascosto: true }),
      T('o2', 320, 70, 'counter = 0', { size: 12, nascosto: true }), T('o3', 320, 92, 'lock', { size: 12, nascosto: true }),
      F('fm', 172, 50, 218, 60, { nascosto: true }),
      R('t1', 200, 170, 110, 40, 'Turnstile t1', { tono: 'due', nascosto: true }), R('t2', 330, 170, 110, 40, 'Turnstile t2', { tono: 'due', nascosto: true }),
      F('f1', 255, 168, 300, 112, { nascosto: true }), F('f2', 385, 168, 340, 112, { nascosto: true }),
      T('c', 505, 140, '', { size: 12 })
    ],
    passi: [
      { nota: "<code>main</code> è <b>static</b>: appartiene alla classe, non a un oggetto. Da lì non si vedono i campi d'istanza come counter." },
      { nota: "Per questo main fa solo <code>new CounterThreadsLock()</code>: crea l'oggetto, che ha i <b>campi</b> counter e lock. Il lavoro vero sta nel <b>costruttore</b>.", set: { o: { nascosto: false }, o1: { nascosto: false }, o2: { nascosto: false }, o3: { nascosto: false }, fm: { nascosto: false } } },
      { nota: "Il costruttore crea i thread. Turnstile è una <b>classe interna</b> (non static): ogni suo oggetto è legato all'oggetto esterno e ne vede i campi. Tutti i tornelli toccano lo <b>stesso</b> counter: è la memoria condivisa delle lezioni.", set: { t1: { nascosto: false }, t2: { nascosto: false }, f1: { nascosto: false }, f2: { nascosto: false }, c: { t: 'un counter per tutti' } } }
    ]
  };

  // 3. static contro istanza
  SCENE.staticist = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      R('a', 60, 40, 150, 60, '', { tono: null }), T('ta', 135, 58, 'oggetto a', { bold: true, size: 12 }), T('sa', 135, 82, 'saldo = 10', { size: 12, tono: 'dato' }),
      R('b', 60, 140, 150, 60, '', { tono: null }), T('tb', 135, 158, 'oggetto b', { bold: true, size: 12 }), T('sb', 135, 182, 'saldo = 25', { size: 12, tono: 'dato' }),
      R('cl', 390, 90, 170, 60, '', { tono: 'ok', nascosto: true }), T('tc', 475, 108, 'classe Conto', { bold: true, size: 12, nascosto: true }), T('st', 475, 132, 'totale = 35', { size: 12, nascosto: true }),
      F('fa', 212, 70, 388, 112, { nascosto: true }), F('fb', 212, 170, 388, 130, { nascosto: true }),
      T('c', 300, 226, '', { size: 12 })
    ],
    passi: [
      { nota: "Un campo <b>d'istanza</b>, come <code>int saldo</code>, esiste una volta <b>per ogni oggetto</b>: a.saldo e b.saldo sono due variabili diverse." },
      { nota: "Un campo <b>static</b>, come <code>static int totale</code>, esiste <b>una volta sola</b> per tutta la classe: a e b vedono la stessa variabile.", set: { cl: { nascosto: false }, tc: { nascosto: false }, st: { nascosto: false }, fa: { nascosto: false }, fb: { nascosto: false } } },
      { nota: "Per la concorrenza conta tantissimo: <code>synchronized</code> su un metodo d'istanza usa il lock <b>dell'oggetto</b> (a e b hanno due lock diversi), su un metodo static usa il lock <b>della classe</b> (uno solo). Proteggere un campo static con il lock di un oggetto non funziona (esercizio 2.3).", set: { c: { t: 'istanza: lock dell’oggetto · static: lock della classe' } } }
    ]
  };

  // 4. PowerShell e Gradle
  SCENE.gradle = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      R('cmd', 20, 30, 560, 36, 'gradle -PmainClass=lecture01.CounterThreads run', { tono: 'dato' }),
      R('p1', 20, 100, 280, 36, '-PmainClass=lecture01', { tono: 'no', nascosto: true }),
      R('p2', 310, 100, 170, 36, '.CounterThreads', { tono: 'no', nascosto: true }),
      R('p3', 490, 100, 90, 36, 'run', { nascosto: true }),
      T('c', 300, 170, '', { size: 12 }), T('c2', 300, 200, '', { size: 12, bold: true })
    ],
    passi: [
      { nota: "Il comando per eseguire una classe con Gradle, scritto come nelle istruzioni per bash." },
      { nota: "PowerShell interpreta il <b>punto</b> e spezza il parametro in due pezzi: Gradle riceve <code>-PmainClass=lecture01</code> e poi <code>.CounterThreads</code> come se fosse il nome di un task.", set: { p1: { nascosto: false }, p2: { nascosto: false }, p3: { nascosto: false } } },
      { nota: "Risultato: <code>Task '.CounterThreads' not found in root project</code> (errore vero).", set: { c: { t: 'Task \'.CounterThreads\' not found', tono: 'no' } } },
      { nota: "Con le virgolette attorno a tutto il parametro, <code>gradle \"-PmainClass=lecture01.CounterThreads\" run</code>, PowerShell lo passa intero. Lo dice anche la guida Gradle del corso.", set: { cmd: { t: 'gradle "-PmainClass=lecture01.CounterThreads" run', tono: 'ok' }, p1: { nascosto: true }, p2: { nascosto: true }, p3: { nascosto: true }, c2: { t: 'in PowerShell: virgolette', tono: 'ok' } } }
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
  <figure class="codice" data-titolo="{{a|s016|}}">
<pre data-lang="java">// 1) una classe che estende Thread
public class Turnstile extends Thread {
    public void run() {
        for (int i = 0; i &lt; PEOPLE; i++) { counter++; }
    }
}
Turnstile t = new Turnstile();

// 2) un Runnable passato al costruttore
Thread t2 = new Thread(new Runnable() {
    public void run() { for (int i = 0; i &lt; PEOPLE; i++) { counter++; } }
});

// 3) una lambda (la forma più corta)
Thread t3 = new Thread(() -> {
    for (int i = 0; i &lt; PEOPLE; i++) { counter++; }
});</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="extends Thread@ora"><p>{{s|s017|}}</p></li>
      <li data-righe="3-5" data-segna="public void run()@due"><p>{{s|s018|}}</p></li>
      <li data-righe="10-12" data-segna="new Runnable()@ora"><p>{{s|s019|}}</p></li>
      <li data-righe="15-17" data-segna="() ->@ok"><p>{{s|s020|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="treforme" data-titolo="{{a|s021|}}"></figure>
</section>

<section>
  <h2>{{s|s022|}}</h2>
  <figure class="passi" data-titolo="{{a|s023|}}">
    <div class="passo">
      <div class="espr">Turnstile turnstile = <mark class="dato">new Turnstile()</mark>;</div>
      <p class="nota">{{s|s024|}}</p>
    </div>
    <div class="passo">
      <div class="espr">turnstile.<mark class="ora">start()</mark>;</div>
      <p class="nota">{{s|s025|}}</p>
    </div>
    <div class="passo">
      <div class="espr">turnstile.<mark class="due">join()</mark>;</div>
      <p class="nota">{{s|s026|}}</p>
    </div>
    <div class="passo">
      <div class="espr">System.out.println(<mark class="ok">counter</mark> + " people entered");</div>
      <p class="nota">{{s|s027|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="startjoin" data-titolo="{{a|s028|}}"></figure>
  <div class="box attenzione" data-tit="{{a|s029|}}">
    <p>{{s|s030|}}</p>
  </div>
  <div class="box basi" data-tit="{{a|s031|}}">
    <p>{{s|s032|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s033|}}</h2>
  <p>{{s|s034|}}</p>
  <figure class="codice" data-titolo="{{a|s035|}}">
<pre data-lang="java">public class CounterThreadsLock {
    long counter = 0;               // campi dell'oggetto: la memoria condivisa
    Lock lock = new ReentrantLock();

    public CounterThreadsLock() {   // il "main" vero sta qui
        Turnstile t1 = new Turnstile();
        t1.start();
    }

    public static void main(String[] args) {
        new CounterThreadsLock();
    }

    public class Turnstile extends Thread {   // classe interna
        public void run() { counter++; }      // vede i campi di fuori
    }
}</pre>
    <ol class="spiega">
      <li data-righe="2-3" data-segna="long counter = 0;@dato"><p>{{s|s036|}}</p></li>
      <li data-righe="10-12" data-segna="static@no"><p>{{s|s037|}}</p></li>
      <li data-righe="5-8" data-segna="public CounterThreadsLock()@ok"><p>{{s|s038|}}</p></li>
      <li data-righe="14-16" data-segna="public class Turnstile@due|counter++@ora"><p>{{s|s039|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="costruttore" data-titolo="{{a|s040|}}"></figure>
</section>

<section>
  <h2>{{s|s041|}}</h2>
  <div class="colonne">
    <div class="carta">
      <h4>{{s|s042|}}</h4>
      <pre class="cod" data-lang="java">class Conto { int saldo; }
Conto a = new Conto();
Conto b = new Conto();</pre>
      <p>{{s|s043|}}</p>
    </div>
    <div class="carta">
      <h4>{{s|s044|}}</h4>
      <pre class="cod" data-lang="java">class Conto { static int totale; }
Conto a = new Conto();
Conto b = new Conto();</pre>
      <p>{{s|s045|}}</p>
    </div>
  </div>
  <p>{{s|s046|}}</p>
  <figure class="scena" data-scena="staticist" data-titolo="{{a|s047|}}"></figure>
</section>

<section>
  <h2>{{s|s048|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s049|}}</th><th>{{s|s050|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s051|}}</td><td>{{s|s052|}}</td></tr>
      <tr><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr>
      <tr><td>{{s|s055|}}</td><td>{{s|s056|}}</td></tr>
    </tbody>
  </table></div>
  <div class="errori">
    <div class="errore">
      <pre>PS&gt; gradle -PmainClass=lecture01.CounterThreads run</pre>
      <pre class="msg">Task '.CounterThreads' not found in root project 'lecture01' and its subprojects.</pre>
      <div class="fix">PowerShell spezza il parametro al punto e Gradle riceve <code>.CounterThreads</code> come nome di un task. Metti tutto il parametro tra virgolette: <code>gradle "-PmainClass=lecture01.CounterThreads" run</code> (lo dice anche la guida Gradle del corso).</div>
    </div>
  </div>
  <p>{{s|s057|}}</p>
  <figure class="scena" data-scena="gradle" data-titolo="{{a|s058|}}"></figure>
</section>

</main>
</body>
</html>
