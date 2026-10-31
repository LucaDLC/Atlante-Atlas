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
PROGRAMMI.addifabsent = {
  memoria: { l: [] },
  thread: ['t1', 't2'],
  locali: { c: false },
  passi: [
    { n: 1, codice: 'boolean c = l.contains(1);', fai: (m, l) => { l.c = m.l.includes(1); } },
    { n: 2, codice: 'if (!c) l.add(1); else l.add(2);', fai: (m, l) => { m.l.push(l.c ? 2 : 1); } }
  ],
  esito: m => 'l = [' + m.l.join(', ') + ']',
  giusto: m => m.l.includes(2)
};
PROGRAMMI.addifabsentlock = {
  memoria: { l: [] },
  thread: ['t1', 't2'],
  locali: { c: false },
  passi: [
    { n: 1, codice: 'synchronized (l) {', lock: 'l' },
    { n: 2, codice: '  boolean c = l.contains(1);', fai: (m, l) => { l.c = m.l.includes(1); } },
    { n: 3, codice: '  if (!c) l.add(1); else l.add(2);', fai: (m, l) => { m.l.push(l.c ? 2 : 1); } },
    { n: 4, codice: '}', unlock: 'l' }
  ],
  esito: m => 'l = [' + m.l.join(', ') + ']',
  giusto: m => m.l.includes(2)
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 18 }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});

    // instance confinement
    SCENE.confina = {
      w: 600, h: 250, lato: true,
      legenda: '{{j|s002|'}}',
      oggetti: [
        R('est', 180, 30, 260, 150, '', { tono: 'dato' }), T('et', 310, 50, 'PersonSet (lock di this)', { bold: true, size: 12 }),
        R('in', 230, 80, 160, 60, 'HashSet mySet', { tono: 'due' }),
        N('t1', 60, 70, 't1', 'ora'), N('t2', 60, 150, 't2', 'ora'), N('t3', 550, 110, 't3', 'ora', { nascosto: true }),
        F('f1', 80, 70, 178, 90, 'addPerson', { tx: -70, ty: -14, nascosto: true }), F('f2', 80, 150, 178, 130, 'contains', { tx: -60, ty: 22, nascosto: true }),
        F('f3', 530, 110, 394, 110, 'l.add(…)', { tx: 40, ty: -12, nascosto: true, tono: 'no' }),
        T('c', 300, 212, '', { size: 12, bold: true }), T('c2', 300, 236, '', { size: 12 })
      ],
      passi: [
        { nota: "<b>Instance confinement</b>: un oggetto <b>non</b> thread-safe (HashSet) chiuso dentro una classe thread-safe (PersonSet). Il set è <code>private final</code>: non scappa ed è pubblicato in modo sicuro." },
        { nota: "Ogni accesso al set passa da un metodo <code>synchronized</code> di PersonSet: la porta è una sola, con il lock di this. Mutua esclusione garantita.", set: { f1: { nascosto: false }, f2: { nascosto: false }, c: { t: 'tutti gli accessi passano dal lock di PersonSet', tono: 'ok' } } },
        { nota: "I metodi restituiscono boolean o niente: il riferimento al set non esce mai. Il set è <b>confinato</b>, PersonSet è thread-safe anche se HashSet non lo è.", set: { c2: { t: 'nessun metodo restituisce mySet' } } },
        { nota: "Le <b>synchronized collections</b> fanno lo stesso in automatico: <code>Collections.synchronizedList(l)</code> restituisce un involucro con ogni metodo sincronizzato.", set: { et: { t: 'synchronizedList(l)' }, in: { t: 'ArrayList l' }, f1: { t: 'add' }, f2: { t: 'get' }, c: { t: 'involucro: ogni metodo sincronizzato' }, c2: { t: '' } } },
        { nota: "Ma funziona solo se nessuno tiene un altro riferimento all'oggetto interno. Se t3 continua a usare <code>l</code> direttamente, quegli accessi <b>saltano il lock</b>: data race sulla lista.", set: { t3: { nascosto: false }, f3: { nascosto: false }, in: { tono: 'no' }, c: { t: 'riferimento diretto a l: il confinamento è rotto', tono: 'no' } } }
      ]
    };
  })();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s003|}}</h1>
  <p class="lede">{{s|s004|}}</p>
</header>

<section>
  <h2>{{s|s005|}}</h2>
  <div class="box regola" data-tit="{{a|s006|}}">
    <p>{{s|s007|}}</p>
  </div>
  <figure class="codice" data-titolo="{{a|s008|}}">
<pre data-lang="java">public class PersonSet {
    private final Set&lt;Person&gt; mySet = new HashSet&lt;Person&gt;();

    public synchronized void addPerson(Person p) {
        mySet.add(p);
    }

    public synchronized boolean contains(Person p) {
        return mySet.contains(p);
    }
}</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="HashSet&lt;Person&gt;@no|private final@ok"><p>{{s|s009|}}</p></li>
      <li data-righe="4-10" data-segna="synchronized*@ok"><p>{{s|s010|}}</p></li>
      <li data-righe="8-10" data-segna="boolean@dato"><p>{{s|s011|}}</p></li>
    </ol>
  </figure>
  <div class="box idea" data-tit="{{a|s012|}}">
    <p>{{s|s013|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s014|}}">
    <p>{{s|s015|}}</p>
  </div>
  <figure class="scena" data-scena="confina" data-titolo="{{a|s016|}}"></figure>
</section>

<section>
  <h2>{{s|s017|}}</h2>
  <figure class="codice" data-titolo="{{a|s018|}}">
<pre data-lang="java">List&lt;Integer&gt; lSync = Collections.synchronizedList(new ArrayList&lt;Integer&gt;());
new Thread(() -> { add1IfAbsent(lSync); }).start();
new Thread(() -> { add1IfAbsent(lSync); }).start();

void add1IfAbsent(List&lt;Integer&gt; l) {
    if (!l.contains(1))
        l.add(1);
    else
        l.add(2);
}</pre>
    <ol class="spiega">
      <li data-righe="1-3" data-segna="Collections.synchronizedList@ok"><p>{{s|s019|}}</p></li>
      <li data-righe="6-7" data-segna="l.contains(1)@due|l.add(1)@ora"><p>{{s|s020|}}</p></li>
      <li data-righe="1-10" data-segna="add1IfAbsent*@no"><p>{{s|s021|}}</p></li>
    </ol>
  </figure>
  <p>{{s|s022|}}</p>
  <figure class="interleaving" data-prog="addifabsent" data-titolo="{{a|s023|}}"></figure>
  <div class="box attenzione" data-tit="{{a|s024|}}">
    <p>{{s|s025|}}</p>
  </div>
  <div class="box regola" data-tit="{{a|s026|}}">
    <p>{{s|s027|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s028|}}</h2>
  <p>{{s|s029|}}</p>

  <h3>{{s|s030|}}</h3>
  <pre class="cod" data-lang="java">public void addIfAbsent(List l, Integer e) {
    synchronized (l) {
        if (!l.contains(e)) l.add(e);
    }
}</pre>
  <p>{{s|s031|}}</p>
  <figure class="interleaving" data-prog="addifabsentlock" data-titolo="{{a|s032|}}"></figure>
  <p class="piccolo">{{s|s033|}}</p>

  <h3>{{s|s034|}}</h3>
  <figure class="codice" data-titolo="{{a|s035|}}">
<pre data-lang="java">class ThreadSafeList&lt;T&gt; {
    private final List&lt;T&gt; l = new ArrayList&lt;&gt;();
    public synchronized void add(T e) { l.add(e); }
    public synchronized boolean contains(T e) { return l.contains(e); }
    public synchronized void addIfAbsent(T e) {
        if (!l.contains(e)) l.add(e);
    }
}</pre>
    <ol class="spiega">
      <li data-righe="5-7" data-segna="public synchronized void addIfAbsent@ok"><p>{{s|s036|}}</p></li>
    </ol>
  </figure>
  <p>{{s|s037|}}</p>
  <div class="errori">
    <div class="errore">
      <pre data-lang="java">public void synchronized addIfAbsent(T e) { if (!l.contains(e)) l.add(e); }</pre>
      <pre class="msg">error: &lt;identifier&gt; expected
error: '(' expected
error: invalid method declaration; return type required</pre>
      <div class="fix"><p>{{s|s038|}}</p></div>
    </div>
  </div>
</section>

</main>
</body>
</html>
