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
  w: 560, h: 300,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'nuovo', tipo: 'nodo', forma: 'quadrato', r: 26, x: 60, y: 70, t: 'new' },
    { id: 'en', tipo: 'nodo', r: 42, x: 200, y: 70, t: 'enabled' },
    { id: 'ru', tipo: 'nodo', r: 42, x: 430, y: 70, t: 'running' },
    { id: 'bl', tipo: 'nodo', r: 42, x: 315, y: 235, t: 'blocked' },
    { id: 'fine', tipo: 'nodo', forma: 'quadrato', r: 26, x: 520, y: 235, t: 'fine' },
    { id: 'aS', tipo: 'arco', da: 'nuovo', a: 'en', dir: true, t: 'start()' },
    { id: 'aR', tipo: 'arco', da: 'en', a: 'ru', dir: true, t: 'schedule', curva: -30 },
    { id: 'aP', tipo: 'arco', da: 'ru', a: 'en', dir: true, t: 'suspend', curva: -30 },
    { id: 'aW', tipo: 'arco', da: 'ru', a: 'bl', dir: true, t: 'wait' },
    { id: 'aE', tipo: 'arco', da: 'bl', a: 'en', dir: true, t: 'event' },
    { id: 'aF', tipo: 'arco', da: 'ru', a: 'fine', dir: true, t: 'run() finisce' }
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: { nuovo: { tono: 'ora' } } },
    { nota: '{{j|s004|'}}', set: { nuovo: { tono: null }, aS: { tono: 'dato' }, en: { tono: 'ora' } } },
    { nota: '{{j|s005|'}}', set: { aS: { tono: null }, en: { tono: null }, aR: { tono: 'dato' }, ru: { tono: 'ora' } } },
    { nota: '{{j|s006|'}}', set: { aR: { tono: null }, ru: { tono: null }, aP: { tono: 'dato' }, en: { tono: 'ora' } } },
    { nota: '{{j|s007|'}}', set: { aP: { tono: null }, en: { tono: null }, aR: { tono: 'dato' }, ru: { tono: 'ora' } } },
    { nota: '{{j|s008|'}}', set: { aR: { tono: null }, ru: { tono: null }, aW: { tono: 'dato' }, bl: { tono: 'ora' } } },
    { nota: '{{j|s009|'}}', set: { aW: { tono: null }, bl: { tono: null }, aE: { tono: 'dato' }, en: { tono: 'ora' } } },
    { nota: '{{j|s010|'}}', set: { aE: { tono: null }, en: { tono: null }, aR: { tono: 'dato' }, ru: { tono: 'ora' } } },
    { nota: '{{j|s011|'}}', set: { aR: { tono: null }, ru: { tono: null }, aF: { tono: 'dato' }, fine: { tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const L = (id, x1, y1, x2, y2, extra) => Object.assign({ id, tipo: 'linea', x1, y1, x2, y2 }, extra || {});
  SCENE.tornello = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      T('m', 50, 60, 'main', { bold: true }), T('t', 50, 150, 'tornello', { bold: true }),
      L('lm', 90, 60, 570, 60, { tono: 'spento', tratt: true }), L('lt', 90, 150, 570, 150, { tono: 'spento', tratt: true, nascosto: true }),
      R('crea', 95, 45, 90, 30, 'new, start()', { tono: 'dato', nascosto: true }),
      R('join', 195, 45, 250, 30, 'join(): aspetta', { nascosto: true }),
      R('run', 195, 135, 250, 30, 'counter++ × 10 000', { tono: 'due', nascosto: true }),
      { id: 'fj', tipo: 'vett', x1: 447, y1: 135, x2: 460, y2: 77, t: '', nascosto: true },
      R('pr', 455, 45, 115, 30, 'println', { tono: 'ok', nascosto: true }),
      T('c', 320, 210, 'counter = 0', { bold: true, size: 15 })
    ],
    passi: [
      { nota: "All'inizio esiste solo il thread <b>main</b>, che esegue il programma. <code>counter</code> è un campo condiviso, vale 0." },
      { nota: "<code>new Turnstile()</code> crea l'oggetto thread, <code>start()</code> lo fa partire: da qui ci sono <b>due</b> flussi di istruzioni.", set: { crea: { nascosto: false, tono: 'ora' }, lt: { nascosto: false } } },
      { nota: "Il tornello esegue <code>run()</code>: 10 000 volte <code>counter++</code>. Intanto il main chiama <code>join()</code> e resta <b>bloccato</b> finché il tornello non ha finito.", set: { crea: { tono: 'dato' }, join: { nascosto: false }, run: { nascosto: false, tono: 'ora' }, c: { t: 'counter sale: 1, 2, …' } } },
      { nota: "Il tornello termina, <code>join()</code> ritorna, il main stampa. Con <b>un solo</b> tornello il risultato è sempre 10 000: nessun altro thread tocca counter mentre lui lavora.", set: { run: { tono: 'due' }, fj: { nascosto: false }, pr: { nascosto: false }, c: { t: '10000 people entered', tono: 'ok' } } }
    ]
  };

  const seg = (id, lane, a, b, tono) => R(id, 120 + a * 40, lane === 1 ? 50 : 100, (b - a) * 40, 24, '', { tono, nascosto: true });
  const vedi = (pref, n, extra) => Object.assign(Object.fromEntries([...Array(n).keys()].map(i => [pref + i, { nascosto: false }])), extra || {});
  const nascondi = (pref, n) => Object.fromEntries([...Array(n).keys()].map(i => [pref + i, { nascosto: true }]));
  SCENE.scheduler = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s013|'}}',
    oggetti: [
      T('l1', 60, 62, 't1', { bold: true }), T('l2', 60, 112, 't2', { bold: true }),
      L('a1', 115, 62, 560, 62, { tono: 'spento', tratt: true }), L('a2', 115, 112, 560, 112, { tono: 'spento', tratt: true }),
      seg('x0', 1, 0, 4, 'dato'), seg('x1', 1, 5, 10, 'dato'),
      seg('y0', 2, 0, 3, 'due'), seg('y1', 2, 4, 10, 'due'),
      seg('z0', 1, 0, 2, 'dato'), seg('z1', 2, 2, 5, 'due'), seg('z2', 1, 5, 7, 'dato'), seg('z3', 2, 7, 8, 'due'), seg('z4', 1, 8, 10, 'dato'),
      T('c', 330, 170, '', { bold: true }), T('c2', 330, 200, '', { size: 12 })
    ],
    passi: [
      { nota: "Due thread <b>t1</b> e <b>t2</b>, entrambi pronti a eseguire (<i>enabled</i>). Chi va in esecuzione (<i>running</i>) lo decide lo <b>scheduler</b> del sistema operativo." },
      { nota: "Un'esecuzione possibile: lo scheduler fa andare t1, lo sospende per un attimo, lo riprende. t2 non esegue mai in questo tratto.", set: vedi('x', 2, { c: { t: 'esecuzione 1: solo t1' } }) },
      { nota: "Un'altra: solo t2.", set: Object.assign(nascondi('x', 2), vedi('y', 2, { c: { t: 'esecuzione 2: solo t2' } })) },
      { nota: "Un'altra ancora: t1 e t2 si alternano a pezzi di lunghezza arbitraria. E così via: le esecuzioni possibili sono <b>infinite</b>, e lo scheduler non è controllabile né prevedibile.", set: Object.assign(nascondi('y', 2), vedi('z', 5, { c: { t: 'esecuzione 3: si alternano' } })) },
      { nota: "Conseguenza: <b>nessuna assunzione</b> è lecita su chi esegue dopo. Un test che passa ha visto una esecuzione fra infinite: la correttezza si argomenta con i vincoli (mutua esclusione, happens-before), non con le prove.", set: { c2: { t: 'un test vede una sola esecuzione', tono: 'no' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s014|}}</h1>
  <p class="lede">{{s|s015|}}</p>
</header>

<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
  <p>{{s|s018|}}</p>
  <figure class="codice" data-titolo="{{a|s019|}}">
<pre data-lang="java">class CounterThreads {
    long counter = 0;
    final long PEOPLE = 10_000;

    Turnstile turnstile = new Turnstile();
    turnstile.start();
    turnstile.join();
    System.out.println(counter + " people entered");

    public class Turnstile extends Thread {
        public void run() {
            for (int i = 0; i &lt; PEOPLE; i++) {
                counter++;
            }
        }
    }
}</pre>
    <ol class="spiega">
      <li data-righe="2-3" data-segna="long counter = 0;@dato"><p>{{s|s020|}}</p></li>
      <li data-righe="5-6" data-segna="new Turnstile()@due|start()@ora"><p>{{s|s021|}}</p></li>
      <li data-righe="7" data-segna="join()@due"><p>{{s|s022|}}</p></li>
      <li data-righe="10-16" data-segna="counter++@ora"><p>{{s|s023|}}</p></li>
      <li data-righe="8" data-segna="counter@ok"><p>{{s|s024|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="tornello" data-titolo="{{a|s025|}}"></figure>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <p>{{s|s027|}}</p>
  <figure class="scena" data-scena="stati" data-titolo="{{a|s028|}}"></figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s029|}}</th><th>{{s|s030|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr>
      <tr><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr>
      <tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr>
      <tr><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s039|}}">
    <p>{{s|s040|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s041|}}</h2>
  <p>{{s|s042|}}</p>
  <pre class="cod">1. t1(running) → t1(enabled) → t1(running) → t1(enabled) → …
2. t2(running) → t2(enabled) → t2(running) → t2(enabled) → …
3. t1(running) → t1(enabled) → t2(running) → t2(enabled) → …
4. … infinite esecuzioni diverse</pre>
  <div class="box attenzione" data-tit="{{a|s043|}}">
    <p>{{s|s044|}}</p>
  </div>
  <figure class="scena" data-scena="scheduler" data-titolo="{{a|s045|}}"></figure>
</section>

</main>
</body>
</html>
