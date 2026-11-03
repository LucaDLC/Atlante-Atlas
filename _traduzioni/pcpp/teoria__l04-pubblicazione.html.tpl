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
SCENE.pubblica = {
  w: 620, h: 250, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'c1', tipo: 'rett', x: 10, y: 40, w: 180, h: 150 },
    { id: 'mm', tipo: 'rett', x: 220, y: 40, w: 180, h: 150 },
    { id: 'c2', tipo: 'rett', x: 430, y: 40, w: 180, h: 150 },
    { id: 'l1', tipo: 'testo', x: 100, y: 28, t: 'cache di T1', size: 12.5, bold: true },
    { id: 'lm', tipo: 'testo', x: 310, y: 28, t: 'memoria principale', size: 12.5, bold: true },
    { id: 'l2', tipo: 'testo', x: 520, y: 28, t: 'cache di T2', size: 12.5, bold: true },
    { id: 'x1', tipo: 'testo', x: 100, y: 100, t: '', size: 15, bold: true },
    { id: 'u1', tipo: 'testo', x: 100, y: 145, t: '', size: 15, bold: true },
    { id: 'xm', tipo: 'testo', x: 310, y: 100, t: '', size: 15, bold: true },
    { id: 'um', tipo: 'testo', x: 310, y: 145, t: 'u = null', size: 15, bold: true },
    { id: 'x2', tipo: 'testo', x: 520, y: 100, t: '', size: 15, bold: true },
    { id: 'u2', tipo: 'testo', x: 520, y: 145, t: '', size: 15, bold: true },
    { id: 'cod', tipo: 'testo', x: 310, y: 225, t: '', size: 12.5 }
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: { cod: { t: 'T1: u = new UnsafeInitialization();' } } },
    { nota: '{{j|s004|'}}', set: { x1: { t: 'x = 0', tono: 'dato' }, xm: { t: 'x = 0', tono: 'dato' }, cod: { t: 'oggetto creato: x = 0 (default)' } } },
    { nota: '{{j|s005|'}}', set: { x1: { t: 'x = 42', tono: 'ora' }, cod: { t: 'costruttore: this.x = 42;' } } },
    { nota: '{{j|s006|'}}', set: { u1: { t: 'u = obj', tono: 'ora' }, um: { t: 'u = obj', tono: 'ora' }, cod: { t: 'T1: u = obj  (arriva in memoria per prima)' } } },
    { nota: '{{j|s007|'}}', set: { u2: { t: 'u = obj', tono: 'due' }, x2: { t: 'x = 0', tono: 'no' }, xm: { tono: 'no' }, cod: { t: 'T2: u != null ma u.readX() == 0' } } },
    { nota: '{{j|s008|'}}', set: { x1: { tono: 'ora' }, cod: { t: 't1(x = 42) e t2(lettura x): non ordinate' } } },
    { nota: '{{j|s009|'}}', set: { xm: { t: 'x = 42', tono: 'ok' }, x2: { t: 'x = 42', tono: 'ok' }, x1: { tono: 'ok' }, cod: { t: 'final int x → pubblicazione sicura' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});
  const A = (id, da, a, extra) => Object.assign({ id, tipo: 'arco', da, a, dir: true, nascosto: true }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const vedi = (ids, v) => Object.fromEntries(ids.map(k => [k, Object.assign({ nascosto: false }, v || {})]));

  // 1. i modi per pubblicare in modo sicuro
  SCENE.modisicuri = {
    w: 620, h: 256, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      T('la', 24, 60, 'A', { bold: true }), T('lb', 24, 170, 'B', { bold: true }),
      N('c', 90, 60, 'new', 'dato', { sotto: 'costruttore' }), N('w', 230, 60, 'o=', 'dato', { sotto: 'o = new Object()' }), N('p', 370, 60, 'pub', 'dato', { sotto: 'shared = s' }),
      N('r', 430, 170, 'rif', 'due', { sotto: 'legge shared' }), N('u', 560, 170, 'uso', 'due', { sotto: 's.o.hashCode()' }),
      A('cw', 'c', 'w', { nascosto: false }), A('wp', 'w', 'p', { nascosto: false }), A('ru', 'r', 'u', { nascosto: false }),
      A('pr', 'p', 'r', { t: 'solo se c’è una regola' }), A('wu', 'w', 'u', { tono: 'ok', curva: -40 }),
      T('m', 310, 236, '', { size: 12, bold: true })
    ],
    passi: [
      { nota: "<b>Pubblicare</b> un oggetto = renderlo raggiungibile da altri thread. A costruisce l'oggetto e scrive il riferimento in un campo condiviso; B legge il riferimento e usa l'oggetto." },
      { nota: "Il problema: senza una regola, fra la scrittura del campo <code>o</code> nel costruttore e l'uso in B <b>non c'è happens-before</b>. B può vedere il riferimento all'oggetto, ma il campo o ancora a null: un oggetto \"a metà\".", set: { u: { tono: 'no' }, m: { t: 'senza regola: B può vedere o == null', tono: 'no' } } },
      { nota: "<b>final</b> (il modo standard, per primitivi e riferimenti): l'inizializzazione di un campo final happens-before ogni uso successivo, a costruttore finito. Blocca il riferimento, non il contenuto dell'oggetto puntato.", set: { wu: { nascosto: false }, u: { tono: 'ok' }, m: { t: 'final Object o: inizializzazione → ogni uso', tono: 'ok' } } },
      { nota: "<b>Valore di default</b> (0, false, null): l'inizializzazione di default happens-before ogni altra azione. Funziona se il default va bene come valore iniziale, come <code>private int x;</code> lasciato a 0.", set: { w: { t: 'x=0', sotto: 'int x; (default)' }, m: { t: 'default: prima di ogni altra azione del programma' } } },
      { nota: "<b>volatile</b> (solo primitivi, nella tabella delle slide): una scrittura volatile happens-before le letture successive. Da usare solo se il campo deve comunque essere volatile, perché costa prestazioni.", set: { w: { t: 'v=', sotto: 'volatile int v' }, m: { t: 'volatile: scrittura → letture successive' } } },
      { nota: "<b>static</b>: l'inizializzazione dei campi static happens-before ogni altro uso, come per final. Ha senso solo se il campo deve essere della classe, non del singolo oggetto.", set: { w: { t: 's=', sotto: 'static int s = 1' }, m: { t: 'static: inizializzazione della classe → ogni uso' } } }
    ]
  };

  // 2. immutabilità: final blocca il riferimento, non l'oggetto
  SCENE.immutabile = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      R('obj', 30, 40, 200, 90, '', { tono: 'spento' }), T('ot', 130, 60, 'ThreeStooges', { bold: true, size: 12 }), R('f', 50, 76, 160, 36, 'final stooges', { tono: 'dato' }),
      R('set', 350, 50, 220, 70, '{ }', { tono: 'due' }),
      F('ref', 212, 94, 346, 88, '', {}), F('ref2', 212, 100, 346, 170, '', { nascosto: true, tono: 'no' }),
      R('set2', 350, 150, 160, 40, 'altro set', { tono: 'no', nascosto: true }),
      T('c', 300, 228, '', { size: 12, bold: true })
    ],
    passi: [
      { nota: "Un campo <b>immutabile</b> non cambia dopo l'inizializzazione: pensalo come una costante. ThreeStooges ha un solo campo, <code>private final Set stooges</code>, che punta a un HashSet." },
      { nota: "Il costruttore riempie il set: add(\"Moe\"), add(\"Larry\"), add(\"Curly\"). Il <b>contenuto</b> dell'oggetto cambia: final non lo impedisce.", set: { set: { t: '{ Moe, Larry, Curly }' }, c: { t: 'final non blocca il contenuto dell’oggetto' } } },
      { nota: "final blocca il <b>riferimento</b>: <code>stooges = altroSet</code> non compila.", set: { ref2: { nascosto: false }, set2: { nascosto: false }, c: { t: 'riassegnare un campo final: errore di compilazione', tono: 'no' } } },
      { nota: "E garantisce la <b>safe publication</b>: chi vede l'oggetto ThreeStooges vede anche il set già riempito dal costruttore (regola final field).", set: { ref2: { nascosto: true }, set2: { nascosto: true }, f: { tono: 'ok' }, c: { t: 'chi vede l’oggetto vede il set pieno', tono: 'ok' } } },
      { nota: "Dopo la pubblicazione l'unico metodo, <code>isStooge</code>, fa solo <code>contains</code>: legge e restituisce un boolean, il set non esce. Letture concorrenti <b>non sono in conflitto</b> (nessuna scrittura): niente synchronized, e la classe è thread-safe.", set: { set: { tono: 'ok' }, c: { t: 'solo letture dopo la pubblicazione: nessun lock serve' } } }
    ]
  };

  // 3. mutua esclusione: Stooges con addStooge
  SCENE.mutuaesc = {
    w: 620, h: 250, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      T('l1', 22, 70, 't1', { bold: true }), T('l2', 22, 180, 't2', { bold: true }),
      N('a0', 90, 70, 'lk', 'ora', { sopra: 'lock(this)' }), N('a1', 190, 70, 'add', 'ora', { sopra: 'stooges.add' }), N('a2', 290, 70, 'ul', 'ora', { sopra: 'unlock' }),
      N('b0', 370, 180, 'lk', 'due', { sotto: 'lock(this)', nascosto: true }), N('b1', 470, 180, 'con', 'due', { sotto: 'contains' }), N('b2', 570, 180, 'ul', 'due', { sotto: 'unlock', nascosto: true }),
      A('p0', 'a0', 'a1', { nascosto: false }), A('p1', 'a1', 'a2', { nascosto: false }), A('q0', 'b0', 'b1'), A('q1', 'b1', 'b2'),
      { id: 'k', tipo: 'arco', da: 'a1', a: 'b1', t: '?', tono: 'no', nascosto: true },
      A('mon', 'a2', 'b0', { tono: 'ok' }),
      T('c', 310, 240, '', { size: 12, bold: true })
    ],
    passi: [
      { nota: "Aggiungiamo <code>addStooge</code>: ora il set viene <b>scritto</b> anche dopo la pubblicazione. Lo stato è diventato <b>mutabile</b>." },
      { nota: "Se isStooge restasse senza synchronized: t1 scrive (add) sotto lock, t2 legge (contains) senza. Nessuna regola li collega: <b>data race</b>.", set: { k: { nascosto: false }, a1: { tono: 'no' }, b1: { tono: 'no' }, c: { t: 'contains senza lock: data race', tono: 'no' } } },
      { nota: "Con <b>entrambi</b> i metodi synchronized sullo stesso lock (this), la regola del monitor aggiunge unlock → lock: add e contains sono <b>ordinate</b>, in un verso o nell'altro.", set: Object.assign(vedi(['b0', 'b2', 'q0', 'q1', 'mon']), { k: { nascosto: true }, a1: { tono: 'ok' }, b1: { tono: 'ok' }, c: { t: 'stesso lock per letture e scritture: ordinate', tono: 'ok' } }) },
      { nota: "Il riassunto dei cinque punti per Stooges: stato = il set; private e mai restituito; final, quindi pubblicato in modo sicuro; mutabile, quindi ogni accesso sotto <b>lo stesso lock</b>. Thread-safe.", set: { c: { t: 'stato mutabile ⇒ ogni accesso con lo stesso lock' } } }
    ]
  };

  // 4. esercizio 4.2: Person
  SCENE.person42 = {
    w: 620, h: 262, lato: true,
    legenda: '{{j|s013|'}}',
    oggetti: [
      R('cls', 20, 20, 250, 70, '', { tono: 'ora' }), T('ct', 145, 40, 'static: nextId, firstCreated', { bold: true, size: 12 }), T('cv', 100, 70, 'nextId = 0', { size: 12 }),
      N('t1', 70, 150, 't1', 'due'), N('t2', 200, 150, 't2', 'due'),
      R('p1', 330, 20, 270, 100, '', { tono: 'spento', nascosto: true }), T('p1a', 465, 42, 'Person (id = 0)', { bold: true, size: 12, nascosto: true }),
      T('p1b', 465, 70, 'final id: nessun lock', { size: 12, tono: 'ok', nascosto: true }), T('p1c', 465, 96, 'name, zip, address: lock di this', { size: 12, nascosto: true }),
      R('za', 330, 150, 270, 40, 'zip = 2300, address = "Kbh"', { tono: 'dato', nascosto: true }),
      T('c', 310, 236, '', { size: 12, bold: true })
    ],
    passi: [
      { nota: "Il contatore degli id è di <b>tutte</b> le persone: campi <code>static</code> nextId e firstCreated. Due thread creano una persona ciascuno, nello stesso momento." },
      { nota: "Entrambi i costruttori chiamano <code>assignId</code>, che è <b>static synchronized</b>: il lock è quello di <b>Person.class</b>, uno solo per tutta la classe. t1 entra e prende nextId = 0.", set: { t1: { x: 222, y: 68, tono: 'ora' }, cv: { t: 'nextId = 1' }, c: { t: 't1 → id 0' } } },
      { nota: "t2 aspetta il lock di Person.class, poi prende 1. Id distinti. Senza <code>static</code>, ognuno userebbe il lock del <b>proprio</b> oggetto: nessuna mutua esclusione, due persone con lo stesso id.", set: { t1: { x: 70, y: 150, tono: 'due' }, t2: { x: 222, y: 68, tono: 'ora' }, cv: { t: 'nextId = 2' }, c: { t: 't2 → id 1: static synchronized = un lock per la classe' } } },
      { nota: "Nell'oggetto: <code>id</code> è <b>final</b>: immutabile e pubblicato in modo sicuro, quindi getId non ha lock. Gli altri campi cambiano: ogni lettura e scrittura prende il lock di <b>this</b>.", set: Object.assign(vedi(['p1', 'p1a', 'p1b', 'p1c']), { t2: { x: 200, y: 150, tono: 'due' }, c: { t: 'final → nessun lock   ·   mutabili → lock di this' } }) },
      { nota: "<code>setZipAndAddress</code> scrive zip e address nello <b>stesso</b> blocco synchronized: chi legge con il lock vede o la coppia vecchia o quella nuova, mai zip nuovo con address vecchio. I getter restituiscono int e String (immutabile): niente escaping.", set: { za: { nascosto: false }, c: { t: 'zip e address cambiano insieme, sotto lo stesso lock', tono: 'ok' } } }
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
  <div class="box regola" data-tit="{{a|s017|}}">
    <p>{{s|s018|}}</p>
    <p>{{s|s019|}}</p>
  </div>
  <figure class="codice" data-titolo="{{a|s020|}}">
<pre data-lang="java">class UnsafeInitialization {
    private int x;
    private Object o;
    public UnsafeInitialization() {
        this.x = 42;
        this.o = new Object();
    }
    public int readX() { return this.x; }
    public Object readO() { return this.o; }
}

// T1
u = new UnsafeInitialization();
// T2
if (u != null &amp;&amp; u.readX() != 42) System.out.println("x is not equal 42");</pre>
    <ol class="spiega">
      <li data-righe="2-3" data-segna="private int x;@dato|private Object o;@dato"><p>{{s|s021|}}</p></li>
      <li data-righe="4-7" data-segna="this.x = 42;@ora|this.o = new Object();@ora"><p>{{s|s022|}}</p></li>
      <li data-righe="12-13" data-segna="u = new UnsafeInitialization();@ora"><p>{{s|s023|}}</p></li>
      <li data-righe="14-15" data-segna="u != null@due|u.readX() != 42@no"><p>{{s|s024|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="pubblica" data-titolo="{{a|s025|}}"></figure>
  <div class="box attenzione" data-tit="{{a|s026|}}">
    <p>{{s|s027|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s028|}}">
    <p>{{s|s029|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s030|}}</h2>
  <p>{{s|s031|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s032|}}</th><th>{{s|s033|}}</th><th>{{s|s034|}}</th><th>{{s|s035|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s036|}}</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td><td>{{s|s039|}}</td></tr>
      <tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>—</td><td>{{s|s042|}}</td></tr>
      <tr><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr>
      <tr><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td><td>{{s|s050|}}</td></tr>
    </tbody>
  </table></div>
  <pre class="cod" data-lang="java">public class SafeInitialization {
    private int x;              // lasciato al default 0
    private final Object o;     // final
    public SafeInitialization() {
        x = 0;
        o = new Object();
    }
}</pre>
  <figure class="passi" data-titolo="{{a|s051|}}">
    <div class="passo"><div class="espr">{{s|s052|}}</div><p class="nota">{{s|s053|}}</p></div>
    <div class="passo"><div class="espr">{{s|s054|}}</div><p class="nota">{{s|s055|}}</p></div>
    <div class="passo"><div class="espr">{{s|s056|}}</div><p class="nota">{{s|s057|}}</p></div>
    <div class="passo"><div class="espr">inizializzazione → pubblicazione  ⇒  <mark class="ok">safe publication</mark></div><p class="nota">{{s|s058|}}</p></div>
  </figure>
  <div class="box esame" data-tit="{{a|s059|}}">
    <p>{{s|s060|}}</p>
  </div>
  <figure class="scena" data-scena="modisicuri" data-titolo="{{a|s061|}}"></figure>
</section>

<section>
  <h2>{{s|s062|}}</h2>
  <ul>
    <li>{{s|s063|}}</li>
    <li>{{s|s064|}}</li>
    <li>{{s|s065|}}</li>
  </ul>
  <div class="box regola" data-tit="{{a|s066|}}">
    <p>{{s|s067|}}</p>
  </div>
  <figure class="codice" data-titolo="{{a|s068|}}">
<pre data-lang="java">public final class ThreeStooges {
    private final Set&lt;String&gt; stooges = new HashSet&lt;String&gt;();

    public ThreeStooges() {
        stooges.add("Moe");
        stooges.add("Larry");
        stooges.add("Curly");
    }

    public boolean isStooge(String name) {
        return stooges.contains(name);
    }
}</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="private final@ok|stooges@dato"><p>{{s|s069|}}</p></li>
      <li data-righe="4-8" data-segna="stooges.add*@ora"><p>{{s|s070|}}</p></li>
      <li data-righe="10-12" data-segna="contains@due"><p>{{s|s071|}}</p></li>
      <li data-righe="10" data-segna="public boolean isStooge@ok"><p>{{s|s072|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="immutabile" data-titolo="{{a|s073|}}"></figure>
</section>

<section>
  <h2>{{s|s074|}}</h2>
  <p>{{s|s075|}}</p>
  <figure class="codice" data-titolo="{{a|s076|}}">
<pre data-lang="java">public final class Stooges {
    private final Set&lt;String&gt; stooges = new HashSet&lt;String&gt;();
    // costruttore come prima
    public synchronized boolean isStooge(String name) {
        return stooges.contains(name);
    }
    public synchronized void addStooge(String name) {
        stooges.add(name);
    }
}</pre>
    <ol class="spiega">
      <li data-righe="7-9" data-segna="stooges.add(name);@no"><p>{{s|s077|}}</p></li>
      <li data-righe="4-8" data-segna="synchronized*@ok"><p>{{s|s078|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s079|}}">
    <div class="passo"><div class="espr">1. <mark class="dato">class state</mark>: elenco i campi</div><p class="nota">{{s|s080|}}</p></div>
    <div class="passo"><div class="espr">2. <mark class="dato">escaping</mark>: campi private, nessun metodo restituisce riferimenti allo stato</div><p class="nota">{{s|s081|}}</p></div>
    <div class="passo"><div class="espr">{{s|s082|}}</div><p class="nota">{{s|s083|}}</p></div>
    <div class="passo"><div class="espr">{{s|s084|}}</div><p class="nota">{{s|s085|}}</p></div>
    <div class="passo"><div class="espr">{{s|s086|}}</div><p class="nota">{{s|s087|}}</p></div>
  </figure>
  <figure class="scena" data-scena="mutuaesc" data-titolo="{{a|s088|}}"></figure>
</section>

<section>
  <h2>{{s|s089|}}</h2>
  <p>{{s|s090|}}</p>
  <figure class="codice" data-titolo="{{a|s091|}}">
<pre data-lang="java">public class Person {
    private static long nextId = 0;
    private static boolean firstCreated = false;

    private final long id;
    private String name;
    private int zip;
    private String address;

    public Person() { this.id = assignId(-1); }
    public Person(long initialId) { this.id = assignId(initialId); }

    private static synchronized long assignId(long initialId) {
        if (!firstCreated) {
            firstCreated = true;
            if (initialId >= 0) nextId = initialId;
        }
        return nextId++;
    }

    public long getId() { return id; }
    public synchronized String getName() { return name; }
    public synchronized void setName(String name) { this.name = name; }
    public synchronized int getZip() { return zip; }
    public synchronized String getAddress() { return address; }
    public synchronized void setZipAndAddress(int zip, String address) {
        this.zip = zip;
        this.address = address;
    }
}</pre>
    <ol class="spiega">
      <li data-righe="2-3" data-segna="nextId@dato|firstCreated@dato"><p>{{s|s092|}}</p></li>
      <li data-righe="5" data-segna="private final long id;@ok"><p>{{s|s093|}}</p></li>
      <li data-righe="6-8" data-segna="name;@due|zip;@due|address;@due"><p>{{s|s094|}}</p></li>
      <li data-righe="10-11" data-segna="assignId(-1)@ora|assignId(initialId)@ora"><p>{{s|s095|}}</p></li>
      <li data-righe="13-19" data-segna="static synchronized@ok|firstCreated = true;@ora|nextId = initialId;@ora|nextId++@ora"><p>{{s|s096|}}</p></li>
      <li data-righe="21" data-segna="return id;@ok"><p>{{s|s097|}}</p></li>
      <li data-righe="22-29" data-segna="synchronized*@ok"><p>{{s|s098|}}</p></li>
    </ol>
  </figure>
  <div class="box inglese" data-tit="{{a|s099|}}">
    <p>{{s|s100|}}</p>
  </div>
  <ul>
    <li>{{s|s101|}}</li>
    <li>{{s|s102|}}</li>
  </ul>
  <div class="box attenzione" data-tit="{{a|s103|}}">
    <p>{{s|s104|}}</p>
    <p>{{s|s105|}}</p>
    <p>{{s|s106|}}</p>
    <p>{{s|s107|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s108|}}">
    <p>{{s|s109|}}</p>
    <p>{{s|s110|}}</p>
  </div>
  <figure class="scena" data-scena="person42" data-titolo="{{a|s111|}}"></figure>
</section>

</main>
</body>
</html>
