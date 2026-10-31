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
SCENE.strati = {
  w: 580, h: 290, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'an', tipo: 'nodo', forma: 'quadrato', r: 24, x: 120, y: 240, t: 'Animal', sotto: 'name', nascosto: true },
    { id: 'hl', tipo: 'nodo', forma: 'quadrato', r: 24, x: 120, y: 185, t: 'HasLegs', sopra: 'run, jump', nascosto: true },
    { id: 'au', tipo: 'nodo', forma: 'quadrato', r: 24, x: 250, y: 185, t: 'Audible', sopra: 'makeNoise (astratto)', nascosto: true },
    { id: 'fr', tipo: 'nodo', forma: 'quadrato', r: 24, x: 185, y: 110, t: 'Frog', sopra: 'makeNoise = croak!', nascosto: true },
    { id: 're', tipo: 'nodo', forma: 'quadrato', r: 24, x: 185, y: 45, t: 'Registered', sopra: 'var id', nascosto: true },
    { id: 'q', tipo: 'testo', x: 440, y: 120, t: '', size: 14, bold: true },
    { id: 'r', tipo: 'testo', x: 440, y: 160, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: { an: { nascosto: false, tono: 'dato' } } },
    { nota: '{{j|s004|'}}', set: { hl: { nascosto: false, tono: 'dato' }, au: { nascosto: false, tono: 'dato' } } },
    { nota: '{{j|s005|'}}', set: { fr: { nascosto: false, tono: 'dato' } } },
    { nota: '{{j|s006|'}}', set: { re: { nascosto: false, tono: 'dato' } } },
    { nota: '{{j|s007|'}}', set: { fr: { tono: 'ora' }, q: { t: 'f.makeNoise()' }, r: { t: '"croak!"', tono: 'ok' } } },
    { nota: '{{j|s008|'}}', set: { fr: { tono: 'dato' }, hl: { tono: 'ora' }, re: { tono: 'ora' }, q: { t: 'f.run();  f.id = 42' }, r: { t: '"after you!"', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

    SCENE.gerarchia = {
      w: 580, h: 240, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [
        T('hj', 145, 22, 'Java', { bold: true }), T('hs', 435, 22, 'Scala', { bold: true }),
        R('jp', 20, 40, 110, 36, 'Animale', { tono: 'dato' }), R('ji1', 160, 40, 110, 36, 'Salta', { tono: 'due' }),
        R('jc', 80, 150, 130, 40, 'Rana', { tono: 'dato' }), F('j1', 110, 148, 80, 78, ''), F('j2', 180, 148, 210, 78, '', { tratt: true }),
        R('sp', 310, 40, 110, 36, 'Animale', { tono: 'dato', nascosto: true }), R('st1', 450, 40, 110, 36, 'Salta', { tono: 'due', nascosto: true }),
        R('sc', 370, 150, 130, 40, 'Rana', { tono: 'dato', nascosto: true }), F('s1', 400, 148, 370, 78, '', { nascosto: true }), F('s2', 470, 148, 500, 78, '', { nascosto: true }),
        T('c', 290, 222, '', { size: 12 })
      ],
      passi: [
        { nota: "In Java una classe ha <b>un solo genitore</b>, ma può implementare più interfacce. Le interfacce (classiche) danno solo firme: il codice lo scrivi nella classe." },
        { nota: "Un <b>trait</b> Scala è come un'interfaccia che può contenere anche <b>codice e campi</b>. Una classe può mescolarne quanti vuole: <code>class Rana extends Animale, Salta</code>.", set: { sp: { nascosto: false }, st1: { nascosto: false, t: 'trait Salta' }, sc: { nascosto: false }, s1: { nascosto: false }, s2: { nascosto: false, tono: 'ok' } } },
        { nota: "Dal trait la Rana eredita <b>metodi già scritti</b>: salta() funziona senza riscriverlo. Il trait può anche avere metodi astratti, da completare.", set: { st1: { t: 'def salta = …' }, c: { t: 'trait: più genitori, campi, metodi scritti e astratti' } } },
        { nota: "Cosa un trait (nella regola del corso) <b>non</b> ha: argomenti del costruttore. Quelli restano delle classi.", set: { c: { t: 'argomenti del costruttore: solo le classi' } } }
      ]
    };

    SCENE.orderedpoint = {
      w: 560, h: 160,
      codice: { lang: 'scala', testo: `trait OrderedPoint extends scala.math.Ordered[java.awt.Point]:
  this: java.awt.Point =>
  override def compare(that: java.awt.Point): Int =
    if this.x != that.x then if this.x < that.x then -1 else 1
    else if this.y == that.y then 0 else if this.y < that.y then -1 else 1` },
      legenda: '{{j|s010|'}}',
      oggetti: [R('p', 40, 40, 140, 40, 'p = (0, 1)', { tono: 'dato' }), R('q', 380, 40, 140, 40, 'q = (0, 2)', { tono: 'due' }), T('e', 280, 60, 'p < q', { bold: true, size: 15 }), T('c', 280, 130, '', { size: 12 })],
      passi: [
        { nota: "<code>p &lt; q</code>: il metodo &lt; viene da <b>Ordered</b>, che lo definisce come <code>p.compare(q) &lt; 0</code>. Io ho scritto solo compare.", righe: [1], set: { e: { t: 'p.compare(q) < 0' } } },
        { nota: "Il <b>self-type</b> <code>this: java.awt.Point =&gt;</code> dice: questo trait vive dentro un Point. Per questo posso usare this.x e this.y.", righe: [2] },
        { nota: "Prima le x: 0 != 0 è falso, le x sono uguali. Si passa al ramo else.", righe: [4], set: { c: { t: 'this.x != that.x → 0 != 0 → false' } } },
        { nota: "Decide la y: 1 == 2 no, 1 &lt; 2 sì: compare = −1.", righe: [5], set: { c: { t: 'this.y < that.y → 1 < 2 → -1' } } },
        { nota: "−1 &lt; 0: <b>p &lt; q è vero</b>. Ordine lessicografico, come nel dizionario: prima x, poi y.", righe: [5], set: { e: { t: '-1 < 0 → true', tono: 'ok' }, c: { t: 'p < q', tono: 'ok' } } }
      ]
    };

    SCENE.linearizza = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s011|'}}',
      oggetti: [
        T('h', 290, 24, 'class X extends A, B', { bold: true, size: 14 }),
        R('x', 20, 60, 100, 40, 'X', { tono: 'dato' }), R('b', 160, 60, 100, 40, 'B', { tono: 'dato' }), R('a', 300, 60, 100, 40, 'A', { tono: 'dato' }), R('base', 440, 60, 110, 40, 'Base', { tono: 'dato' }),
        F('f1', 122, 80, 156, 80, ''), F('f2', 262, 80, 296, 80, ''), F('f3', 402, 80, 436, 80, ''),
        T('r', 290, 150, '', { bold: true, size: 15 }), T('c', 290, 200, '', { size: 12 })
      ],
      passi: [
        { nota: "A e B ridefiniscono entrambi <code>saluta</code>. Scala mette le classi <b>in fila</b>: parte da X, poi il trait più a destra (B), poi A, poi Base." },
        { nota: "X non ridefinisce saluta: risponde il primo nella fila che lo fa, <b>B</b>: \"B&gt;\" + super.saluta. Il super di B è il <b>successivo nella fila</b>, cioè A (non Base!).", set: { b: { tono: 'ora' }, r: { t: '"B>" + super.saluta' } } },
        { nota: "A risponde \"A&gt;\" + super.saluta, e il suo super è Base.", set: { b: { tono: 'dato' }, a: { tono: 'ora' }, r: { t: '"B>" + "A>" + super.saluta' } } },
        { nota: "Base dà \"Base\". Risultato: <b>\"B&gt;A&gt;Base\"</b>. Con <code>class Y extends B, A</code> la fila si rovescia: \"A&gt;B&gt;Base\". Regola del corso: vince il più a destra.", set: { a: { tono: 'dato' }, base: { tono: 'ora' }, r: { t: '"B>A>Base"', tono: 'ok' }, c: { t: 'Y extends B, A  →  "A>B>Base"' } } }
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
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s016|}}</th><th>{{s|s017|}}</th><th>{{s|s018|}}</th><th>{{s|s019|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s020|}}</td><td class="t-no">{{s|s021|}}</td><td class="t-no">{{s|s022|}}</td><td class="t-ok">{{s|s023|}}</td></tr>
      <tr><td>{{s|s024|}}</td><td class="t-ok">{{s|s025|}}</td><td class="t-ok">{{s|s026|}}</td><td class="t-ok">{{s|s027|}}</td></tr>
      <tr><td>{{s|s028|}}</td><td class="t-ok">{{s|s029|}}</td><td class="t-ok">{{s|s030|}}</td><td class="t-ok">{{s|s031|}}</td></tr>
      <tr><td>{{s|s032|}}</td><td class="t-no">{{s|s033|}}</td><td class="t-ok">{{s|s034|}}</td><td class="t-ok">{{s|s035|}}</td></tr>
      <tr><td>{{s|s036|}}</td><td class="t-ok">{{s|s037|}}</td><td class="t-ok">{{s|s038|}}</td><td class="t-no">{{s|s039|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s040|}}</p>
  <figure class="scena" data-scena="gerarchia" data-titolo="{{a|s041|}}"></figure>
</section>

<section>
  <h2>{{s|s042|}}</h2>
  <figure class="codice" data-titolo="{{a|s043|}}">
<pre data-lang="scala">abstract class Animal(val name: String)

trait HasLegs:
  def run(): String = "after you!"
  def jump(): String = "hop!"

trait Audible:
  def makeNoise(): String

trait Registered:
  var id: Int = 0

class Frog(name: String) extends Animal(name), HasLegs, Audible:
  def makeNoise(): String = "croak!"

val f = new Frog("Kaj") with Registered
f.id = 42
println(s"My name is ${f.name}")</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="abstract@due|(val name: String)@dato"><p>{{s|s044|}}</p></li>
      <li data-righe="3-5" data-segna="trait HasLegs@ora"><p>{{s|s045|}}</p></li>
      <li data-righe="7-8" data-segna="def makeNoise(): String@ora"><p>{{s|s046|}}</p></li>
      <li data-righe="10-11" data-segna="var id: Int = 0@due"><p>{{s|s047|}}</p></li>
      <li data-righe="13" data-segna="extends Animal(name)@dato|HasLegs@ora|Audible@ora"><p>{{s|s048|}}</p></li>
      <li data-righe="14" data-segna="def makeNoise(): String = &quot;croak!&quot;@ok"><p>{{s|s049|}}</p></li>
      <li data-righe="16" data-segna="with Registered@ora"><p>{{s|s050|}}</p></li>
      <li data-righe="17-18" data-segna="f.id@ok|f.name@ok"><p>{{s|s051|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="strati" data-titolo="{{a|s052|}}"></figure>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">trait Audible:
  def makeNoise(): String
class Frog extends Audible</pre>
      <pre class="msg">class Frog needs to be abstract, since def makeNoise(): String in trait Audible is not defined</pre>
      <div class="fix">Hai mescolato un trait con un metodo astratto e non l'hai scritto. Aggiungi <code>def makeNoise(): String = …</code> dentro <code>Frog</code>.</div>
    </div>
  </div>
</section>

<section>
  <h2>{{s|s053|}}</h2>
  <p>{{s|s054|}}</p>
  <figure class="codice" data-titolo="{{a|s055|}}">
<pre data-lang="scala">trait OrderedPoint extends scala.math.Ordered[java.awt.Point]:

  this: java.awt.Point =>

  override def compare(that: java.awt.Point): Int =
    if this.x != that.x then if this.x &lt; that.x then -1 else 1
    else if this.y == that.y then 0 else if this.y &lt; that.y then -1 else 1</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="trait OrderedPoint@ora|scala.math.Ordered[java.awt.Point]@dato"><p>{{s|s056|}}</p></li>
      <li data-righe="3" data-segna="this: java.awt.Point =>@due"><p>{{s|s057|}}</p></li>
      <li data-righe="5" data-segna="override def compare(that: java.awt.Point): Int@ora"><p>{{s|s058|}}</p></li>
      <li data-righe="6" data-segna="this.x != that.x@dato|-1@ok|else 1@ok"><p>{{s|s059|}}</p></li>
      <li data-righe="7" data-segna="this.y == that.y@due|0@ok"><p>{{s|s060|}}</p></li>
    </ol>
  </figure>

  <figure class="passi" data-titolo="{{a|s061|}}">
    <div class="passo">
      <div class="espr">val p = new java.awt.Point(0, 1) <mark class="ora">with OrderedPoint</mark>
val q = new java.awt.Point(0, 2) with OrderedPoint</div>
      <p class="nota">{{s|s062|}}</p>
    </div>
    <div class="passo">
      <div class="espr">p &lt; q   =   <mark class="ora">p.compare(q)</mark> &lt; 0</div>
      <p class="nota">{{s|s063|}}</p>
    </div>
    <div class="passo">
      <div class="espr">this.x != that.x   →   <mark class="dato">0</mark> != <mark class="dato">0</mark>   →   <mark class="no">false</mark></div>
      <p class="nota">{{s|s064|}}</p>
    </div>
    <div class="passo">
      <div class="espr">this.y == that.y   →   <mark class="due">1</mark> == <mark class="due">2</mark>   →   false
this.y &lt; that.y    →   1 &lt; 2    →   <mark class="ok">-1</mark></div>
      <p class="nota">{{s|s065|}}</p>
    </div>
    <div class="passo">
      <div class="espr">-1 &lt; 0   →   <mark class="ok">true</mark></div>
      <p class="nota">{{s|s066|}}</p>
    </div>
  </figure>

  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">trait OrderedPoint extends scala.math.Ordered[java.awt.Point]:
  override def compare(that: java.awt.Point): Int =
    if this.x &lt; that.x then -1 else 1</pre>
      <pre class="msg">value x is not a member of OrderedPoint</pre>
      <div class="fix">Senza <code>this: java.awt.Point =></code> il trait non sa di essere dentro un Point, quindi <code>this.x</code> non esiste.</div>
    </div>
  </div>

  <div class="box attenzione" data-tit="{{a|s067|}}">
    <p>{{s|s068|}}</p>
  </div>
  <figure class="scena" data-scena="orderedpoint" data-titolo="{{a|s069|}}"></figure>
</section>

<section>
  <h2>{{s|s070|}}</h2>
  <p>{{s|s071|}}</p>
  <pre class="cod" data-lang="scala">trait Base:
  def saluta: String = "Base"
trait A extends Base:
  override def saluta: String = "A>" + super.saluta
trait B extends Base:
  override def saluta: String = "B>" + super.saluta

class X extends A, B     // X().saluta == "B>A>Base"
class Y extends B, A     // Y().saluta == "A>B>Base"</pre>
  <p class="piccolo">{{s|s072|}}</p>
  <figure class="scena" data-scena="linearizza" data-titolo="{{a|s073|}}"></figure>
</section>

</main>
</body>
</html>
