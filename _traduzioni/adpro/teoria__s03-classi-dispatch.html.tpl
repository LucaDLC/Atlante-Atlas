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
SCENE.dispatch = {
  w: 580, h: 270, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'ca', tipo: 'nodo', forma: 'quadrato', r: 34, x: 420, y: 60, t: 'class A', sotto: 'f() = A', tono: null },
    { id: 'cb', tipo: 'nodo', forma: 'quadrato', r: 34, x: 420, y: 190, t: 'class B', sotto: 'override f() = B' },
    { id: 'ext', tipo: 'arco', da: 'cb', a: 'ca', dir: true, t: 'extends' },
    { id: 'ob', tipo: 'nodo', r: 30, x: 220, y: 190, t: 'B()', tono: 'dato', nascosto: true },
    { id: 'va', tipo: 'nodo', forma: 'quadrato', r: 26, x: 70, y: 110, t: 'a2: A', tono: 'due', nascosto: true },
    { id: 'rif', tipo: 'arco', da: 'va', a: 'ob', dir: true, nascosto: true },
    { id: 'di', tipo: 'arco', da: 'ob', a: 'cb', dir: true, t: 'è un', nascosto: true },
    { id: 'n', tipo: 'testo', x: 200, y: 40, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { ob: { nascosto: false }, di: { nascosto: false } } },
    { nota: '{{j|s005|'}}', set: { va: { nascosto: false }, rif: { nascosto: false } } },
    { nota: '{{j|s006|'}}', set: { va: { tono: 'ora' }, ca: { tono: 'due' }, n: { t: 'compila: A ha f()', tono: 'due' } } },
    { nota: '{{j|s007|'}}', set: { va: { tono: 'due' }, ca: { tono: null }, ob: { tono: 'ora' }, cb: { tono: 'ora' }, di: { tono: 'ora' }, n: { t: 'a2.f() stampa B', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});
  const A = (id, da, a, extra) => Object.assign({ id, tipo: 'arco', da, a }, extra || {});

    SCENE.costruttore = {
      w: 560, h: 170,
      codice: { lang: 'scala', testo: `class Person(val name: String, val age: Int):
  println("Just constructed a person")
  def description =
    s"$name is $age years old"
val p = Person("Ada", 36)` },
      legenda: '{{j|s008|'}}',
      oggetti: [R('o', 40, 30, 200, 90, '', { tono: 'spento', nascosto: true }), T('ot', 140, 50, 'p: Person', { bold: true, size: 12, nascosto: true }), T('f1', 140, 78, 'name = "Ada"', { size: 12, nascosto: true, tono: 'dato' }), T('f2', 140, 102, 'age = 36', { size: 12, nascosto: true, tono: 'dato' }),
        T('out', 400, 50, '', { size: 12 }), T('d', 400, 100, '', { size: 12 }), T('c', 280, 150, '', { size: 12 })],
      passi: [
        { nota: "Il <b>costruttore primario</b>: i parametri stanno nella prima riga, subito dopo il nome della classe.", righe: [1] },
        { nota: "<code>Person(\"Ada\", 36)</code> (in Scala 3 new non serve) crea l'oggetto. <code>val</code> davanti ai parametri li rende campi pubblici di sola lettura: p.name funziona.", righe: [5], set: { o: { nascosto: false }, ot: { nascosto: false }, f1: { nascosto: false }, f2: { nascosto: false } } },
        { nota: "Le istruzioni nel corpo della classe sono il <b>corpo del costruttore</b>: vengono eseguite a ogni creazione. Stampa \"Just constructed a person\" (verificato).", righe: [2], set: { out: { t: 'stampa: Just constructed a person', tono: 'ora' } } },
        { nota: "Un metodo che usa i campi: <code>p.description</code> = \"Ada is 36 years old\". <code>$name</code> è la forma breve di ${name}. In Java servirebbero campi, getter e costruttore scritti a mano.", righe: [3, 4], set: { d: { t: 'p.description = "Ada is 36 years old"', tono: 'ok' }, c: { t: 'Cons(head: A, tail: List[A]) è proprio un costruttore primario' } } }
      ]
    };

    const K = [['x.hello()', 'Square', 'square'], ['((Printable) x).hello()', 'Square', 'square'], ['y.hello()', 'Triangle', 'triangle'], ['((Printable) y).hello()', 'Triangle', 'triangle']];
    SCENE.dispatchjava = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [
        R('x', 20, 30, 250, 40, 'Square x = new Square()', { tono: 'dato' }), R('y', 310, 30, 250, 40, 'Printable y = new Triangle()', { tono: 'dato' }),
        T('call', 290, 110, '', { bold: true, size: 14 }), T('ogg', 290, 145, '', { size: 12 }), T('out', 290, 185, '', { bold: true }), T('tot', 290, 216, '', { size: 12 })
      ],
      passi: [{ nota: "Il sondaggio della lezione: quattro chiamate a <code>hello()</code>. Il tipo <b>dichiarato</b> serve al compilatore; a runtime la JVM guarda l'oggetto <b>vero</b> e cerca hello partendo dalla sua classe." }].concat(K.map(([c, o, s], i) => ({
        nota: ['x è un Square: stampa square.', 'Il cast dice al compilatore \"trattalo come un Printable\", ma l\'oggetto resta un <b>Square</b>: stampa square.', 'y è dichiarato Printable, ma l\'oggetto creato è un <b>Triangle</b>: stampa triangle.', 'Stesso oggetto, stesso risultato: triangle. È il <b>dispatch dinamico</b>. In Scala, come in Java, Python e JavaScript, tutti i metodi d\'istanza sono virtuali.'][i],
        set: { call: { t: c }, ogg: { t: 'oggetto vero: ' + o, tono: 'ora' }, out: { t: s, tono: 'ok' }, tot: { t: 'finora: ' + K.slice(0, i + 1).map(k => k[2]).join(' ') } }
      })))
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s010|}}</h1>
  <p class="lede">{{s|s011|}}</p>
</header>

<section>
  <h2>{{s|s012|}}</h2>
  <p>{{s|s013|}}</p>
  <div class="colonne">
    <div class="carta">
      <h4>{{s|s014|}}</h4>
      <pre class="cod" data-lang="scala">class Person(val name: String, val age: Int):
  println("Just constructed a person")
  def description =
    s"$name is $age years old"</pre>
    </div>
    <div class="carta">
      <h4>{{s|s015|}}</h4>
      <pre class="cod" data-lang="java">class Person {
  private String name;
  private int age;
  public String name() { return name; }
  public int age() { return age; }
  public Person(String name, int age) {
    this.name = name;
    this.age = age;
    System.out.println("Just constructed a person");
  }
  public String description() {
    return name + " is " + age + " years old";
  }
}</pre>
    </div>
  </div>
  <figure class="codice" data-titolo="{{a|s016|}}">
<pre data-lang="scala">class Person(val name: String, val age: Int):
  println("Just constructed a person")
  def description =
    s"$name is $age years old"

val p = Person("Ada", 36)</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="(val name: String, val age: Int)@dato"><p>{{s|s017|}}</p></li>
      <li data-righe="1" data-segna="val@ora"><p>{{s|s018|}}</p></li>
      <li data-righe="2" data-segna="println@due"><p>{{s|s019|}}</p></li>
      <li data-righe="3-4" data-segna="$name@dato|$age@dato"><p>{{s|s020|}}</p></li>
      <li data-righe="6" data-segna="Person(&quot;Ada&quot;, 36)@ok"><p>{{s|s021|}}</p></li>
    </ol>
  </figure>
  <p class="piccolo">{{s|s022|}}</p>
  <figure class="scena" data-scena="costruttore" data-titolo="{{a|s023|}}"Ada", 36): cosa succede alla creazione"></figure>
</section>

<section>
  <h2>{{s|s024|}}</h2>
  <pre class="cod" data-lang="java">class Printable            { void hello() { print("printable "); } }
class Triangle extends Printable { void hello() { print("triangle "); } }
class Square   extends Printable { void hello() { print("square "); } }

Square x    = new Square();
Printable y = new Triangle();

x.hello();
((Printable) x).hello();
y.hello();
((Printable) y).hello();</pre>
  <figure class="passi" data-titolo="{{a|s025|}}">
    <div class="passo"><div class="espr">Printable y = <mark class="dato">new Triangle()</mark>;</div><p class="nota">{{s|s026|}}</p></div>
    <div class="passo"><div class="espr"><mark class="due">(Printable)</mark> y</div><p class="nota">{{s|s027|}}</p></div>
    <div class="passo"><div class="espr">.hello()   →   di quale classe? <mark class="ora">Triangle</mark></div><p class="nota">{{s|s028|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">triangle</mark></div><p class="nota">{{s|s029|}}</p></div>
  </figure>
  <div class="box regola" data-tit="{{a|s030|}}">
    <p>{{s|s031|}}</p>
  </div>
  <p>{{s|s032|}}</p>
  <figure class="scena" data-scena="dispatchjava" data-titolo="{{a|s033|}}"></figure>
</section>

<section>
  <h2>{{s|s034|}}</h2>
  <p>{{s|s035|}}</p>
  <figure class="scena" data-scena="dispatch" data-titolo="{{a|s036|}}"></figure>
  <figure class="codice" data-titolo="{{a|s037|}}">
<pre data-lang="scala">class A:
  def f() = println("A")
  val g = () => println("A")

class B extends A:
  override def f() = println("B")
  override val g = () => println("B")

val b1 = B()
val a2: A = b1
a2.f()
a2.g()</pre>
    <ol class="spiega">
      <li data-righe="2-3" data-segna="def f()@ora|val g@due"><p>{{s|s038|}}</p></li>
      <li data-righe="6-7" data-segna="override def f()@ora|override val g@due"><p>{{s|s039|}}</p></li>
      <li data-righe="10" data-segna="a2: A@dato"><p>{{s|s040|}}</p></li>
      <li data-righe="11" data-segna="a2.f()@ok"><p>{{s|s041|}}</p></li>
      <li data-righe="12" data-segna="a2.g()@ok"><p>{{s|s042|}}</p></li>
    </ol>
  </figure>
</section>

</main>
</body>
</html>
