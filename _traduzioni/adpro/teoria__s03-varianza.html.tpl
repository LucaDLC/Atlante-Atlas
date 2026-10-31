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
  const box = (id, x, y, w, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h: 38, t, nascosto: true }, extra || {});
  SCENE.frecce = {
    w: 640, h: 290, lato: false,
    oggetti: [
      { id: 'h0', tipo: 'testo', x: 80, y: 22, t: 'i tipi', size: 13, bold: true },
      { id: 'h1', tipo: 'testo', x: 235, y: 22, t: 'covariante (+A)', size: 12, bold: true, nascosto: true },
      { id: 'h2', tipo: 'testo', x: 405, y: 22, t: 'contravariante (-A)', size: 12, bold: true, nascosto: true },
      { id: 'h3', tipo: 'testo', x: 570, y: 22, t: 'invariante', size: 12, bold: true, nascosto: true },
      box('an', 20, 60, 120, 'Animal', { nascosto: false, tono: 'dato' }),
      box('ca', 20, 210, 120, 'Cat', { nascosto: false, tono: 'dato' }),
      { id: 'v0', tipo: 'vett', x1: 80, y1: 208, x2: 80, y2: 100, t: '<:', tx: 8, ty: 55 },
      box('lan', 170, 60, 130, 'List[Animal]'),
      box('lca', 170, 210, 130, 'List[Cat]'),
      { id: 'v1', tipo: 'vett', x1: 235, y1: 208, x2: 235, y2: 100, t: '<:', tx: 8, ty: 55, tono: 'ok', nascosto: true },
      box('pan', 330, 60, 150, 'Printer[Animal]'),
      box('pca', 330, 210, 150, 'Printer[Cat]'),
      { id: 'v2', tipo: 'vett', x1: 405, y1: 100, x2: 405, y2: 208, t: '<:', tx: 8, ty: -55, tono: 'due', nascosto: true },
      box('aan', 510, 60, 120, 'Array[Animal]'),
      box('aca', 510, 210, 120, 'Array[Cat]'),
      { id: 'x3', tipo: 'testo', x: 570, y: 158, t: 'nessuna freccia', size: 12.5, tono: 'no', nascosto: true }
    ],
    passi: [
      { nota: '{{j|s002|'}}' },
      { nota: '{{j|s003|'}}',
        set: { h1: { nascosto: false }, lan: { nascosto: false, tono: 'ok' }, lca: { nascosto: false, tono: 'ok' }, v1: { nascosto: false } } },
      { nota: '{{j|s004|'}}',
        set: { h2: { nascosto: false }, pan: { nascosto: false, tono: 'due' }, pca: { nascosto: false, tono: 'due' }, v2: { nascosto: false } } },
      { nota: '{{j|s005|'}}',
        set: { h3: { nascosto: false }, aan: { nascosto: false, tono: 'no' }, aca: { nascosto: false, tono: 'no' }, x3: { nascosto: false } } }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

    SCENE.covarianza = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s006|'}}',
      oggetti: [R('l', 40, 40, 200, 44, 'cats: List(Tom)', { tono: 'dato' }), R('v', 340, 40, 200, 44, '', { tono: 'spento', nascosto: true }), F('f', 242, 62, 336, 62, '', { nascosto: true }), T('c', 290, 130, '', { size: 12, bold: true }), T('c2', 290, 170, '', { size: 12 })],
      passi: [
        { nota: "Una lista di gatti: <code>val cats: List[Cat] = List(Cat(\"Tom\"))</code>." },
        { nota: "<code>val animals: List[Animal] = cats</code> compila, perché List è dichiarata <b>List[+A]</b>: Cat &lt;: Animal implica List[Cat] &lt;: List[Animal].", set: { v: { nascosto: false, t: 'animals: List[Animal]', tono: 'ora' }, f: { nascosto: false } } },
        { nota: "Leggo: <code>animals.head</code> è promesso Animal. Vero: è Tom, un gatto, quindi un animale.", set: { c: { t: 'animals.head: Animal ✓ (è Tom)', tono: 'ok' } } },
        { nota: "Il pericolo sarebbe <b>scrivere</b> un cane in animals: cats conterrebbe un cane. Ma una List è immutabile: non si scrive. Covarianza sicura. E con Nothing in fondo: un solo Nil (e un solo None) per tutti i tipi.", set: { c2: { t: 'animals.aggiungi(Dog("Rex")): non esiste, List è immutabile', tono: 'no' } } }
      ]
    };

    SCENE.arrayjava = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s007|'}}',
      oggetti: [R('arr', 200, 90, 180, 50, '[ B ]', { tono: 'dato' }), T('nb', 110, 70, 'b: B[]', { bold: true }), T('na', 470, 70, '', { bold: true }), F('fb', 140, 80, 196, 105, ''), F('fa', 440, 80, 384, 105, '', { nascosto: true }), T('c', 290, 180, '', { size: 12, bold: true }), T('c2', 290, 210, '', { size: 12 })],
      passi: [
        { nota: "Variance.java: <code>class B extends A</code>, <code>class C extends A</code>. B e C sono fratelli: un C non è un B. <code>B[] b = { new B() }</code>." },
        { nota: "<code>A[] a = b;</code> compila: in Java gli array sono <b>covarianti</b>. a e b sono <b>lo stesso array</b>, con due nomi.", set: { na: { t: 'a: A[]' }, fa: { nascosto: false } } },
        { nota: "<code>a[0] = new C();</code> per il compilatore va bene: in un array di A ci sta un C. Ma quell'array è l'array di B.", set: { arr: { t: '[ C ] ?', tono: 'due' } } },
        { nota: "Java se ne accorge solo durante l'esecuzione: <b>ArrayStoreException: C</b> (verificato). Chi usa b si aspetta dei B.", set: { arr: { t: '[ B ]', tono: 'no' }, c: { t: 'ArrayStoreException: C (a runtime)', tono: 'no' } } },
        { nota: "Scala rende gli array <b>invarianti</b>: <code>val animals: Array[Animal] = cats</code> → Found: Array[Cat], Required: Array[Animal]. L'errore arriva alla compilazione. Regola: covariante solo se produce, contravariante solo se consuma, invariante se fa tutte e due.", set: { c2: { t: 'Scala: Array invariante, errore prima di eseguire', tono: 'ok' } } }
      ]
    };

    SCENE.contravarianza = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [R('pa', 40, 40, 200, 44, 'stampa ogni Animal', { tono: 'dato' }), R('pc', 340, 40, 200, 44, 'serve: Printer[Cat]', { tono: 'due' }), F('f', 242, 62, 336, 62, '', { nascosto: true }), T('c', 290, 130, '', { size: 12, bold: true }), T('c2', 290, 170, '', { size: 12 })],
      passi: [
        { nota: "<code>trait Printer[-A]</code>: riceve un A e non lo restituisce mai. A compare solo come <b>parametro</b>." },
        { nota: "Dove serve un Printer[Cat], va benissimo uno che stampa <b>animali qualsiasi</b>: <code>val stampaGatti: Printer[Cat] = stampaAnimali</code> compila. La relazione si rovescia: Cat &lt;: Animal ⇒ Printer[Animal] &lt;: Printer[Cat].", set: { f: { nascosto: false }, c: { t: 'Printer[Animal] usato come Printer[Cat] ✓', tono: 'ok' } } },
        { nota: "Il contrario no: un printer che sa stampare solo gatti non può ricevere un cane. Found: Printer[Cat], Required: Printer[Animal].", set: { c2: { t: 'Printer[Cat] come Printer[Animal] ✗', tono: 'no' } } },
        { nota: "Le funzioni sono così: <b>Function1[-A, +B]</b>, contravarianti in cosa entra, covarianti in cosa esce. <code>val g: Cat =&gt; Any = (f: Animal =&gt; String)</code> compila (verificato).", set: { c: { t: 'A => B: entra (-), esce (+)', tono: null } } }
      ]
    };

    SCENE.posizioni = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [R('cell', 200, 60, 180, 60, 'Cell[T]', { tono: 'spento' }), F('in', 60, 90, 196, 90, 'set(x: T)', { tx: -130, ty: -14 }), F('out', 384, 90, 520, 90, 'get: T', { tx: -60, ty: -14 }), T('c', 290, 160, '', { size: 12, bold: true }), T('c2', 290, 196, '', { size: 12 })],
      passi: [
        { nota: "Il compilatore guarda <b>dove</b> compare un tipo dichiarato + o −. In una cella T entra (set, posizione di ingresso) ed esce (get, posizione di uscita)." },
        { nota: "Con <b>+T</b>: T non può entrare. <i>covariant type T occurs in contravariant position in type T of parameter x</i>. Altrimenti una Cell[String] vista come Cell[Any] riceverebbe un numero.", set: { cell: { t: 'Cell[+T]', tono: 'no' }, in: { tono: 'no' }, c: { t: '+T: set rifiutato', tono: 'no' } } },
        { nota: "Con <b>−T</b> (la proposta della slide 14): ora il problema è get, dove T esce. <i>contravariant type T occurs in covariant position</i> (verificato con Scala 3.8).", set: { cell: { t: 'Cell[-T]' }, in: { tono: null }, out: { tono: 'no' }, c: { t: '-T: get rifiutato' } } },
        { nota: "Una cella che si legge <b>e</b> si scrive può essere solo <b>invariante</b>: <code>class Cell[T]</code>.", set: { cell: { t: 'Cell[T]', tono: 'ok' }, out: { tono: null }, c: { t: 'Cell[T]: compila', tono: 'ok' }, c2: { t: 'legge e scrive ⇒ invariante' } } }
      ]
    };

    SCENE.getorelse = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [R('an', 220, 30, 140, 40, 'Animal', { tono: 'spento' }), R('cat', 100, 130, 140, 40, 'Cat', { tono: 'dato' }), R('dog', 340, 130, 140, 40, 'Dog', { tono: 'due' }), F('f1', 170, 128, 250, 72, ''), F('f2', 410, 128, 330, 72, ''), T('c', 290, 200, '', { size: 12, bold: true })],
      passi: [
        { nota: "Option[+A] è covariante, ma getOrElse riceve un default: con <code>getOrElse(default: A)</code> A finirebbe in ingresso. Stesso errore della cella." },
        { nota: "Soluzione: <code>def getOrElse[B &gt;: A](default: =&gt; B): B</code>. Un tipo nuovo B, che è A oppure un tipo <b>più generale</b> di A. Il parametro usa B, non A.", set: { c: { t: 'B >: A: A oppure un suo supertipo' } } },
        { nota: "<code>Some(Cat(\"Tom\")).getOrElse(Dog(\"Rex\"))</code>: A = Cat, il default è un Dog. Scala sceglie come B il tipo <b>più piccolo che li contiene tutti e due</b>: Animal (verificato).", set: { an: { tono: 'ok' }, c: { t: 'B = Animal', tono: 'ok' } } },
        { nota: "Nel caso normale, <code>Some(42).getOrElse(0)</code>, B = A = Int: il vincolo non costringe a niente. Il <code>=&gt;</code> davanti a B è un'altra cosa: default calcolato solo se serve.", set: { an: { t: 'Int', tono: 'ok' }, cat: { t: 'A = Int' }, dog: { t: 'default: Int' }, c: { t: 'B = A = Int' } } }
      ]
    };

    SCENE.sondaggiovar = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s011|'}}',
      oggetti: [T('h', 290, 26, 'class B extends A;  val t: T[A] = new T[B]', { bold: true }), R('d0', 20, 60, 170, 40, 'class T[X]', { tono: 'spento' }), R('d1', 205, 60, 170, 40, 'class T[+X]', { tono: 'spento' }), R('d2', 390, 60, 170, 40, 'class T[-X]', { tono: 'spento' }), T('c', 290, 140, '', { size: 12, bold: true }), T('c2', 290, 175, '', { size: 12 })],
      passi: [
        { nota: "Il sondaggio della lezione: con quale dichiarazione di T compila <code>val t: T[A] = new T[B]</code>? Serve T[B] &lt;: T[A], sapendo B &lt;: A." },
        { nota: "<b>Invariante</b>: nessuna relazione fra T[B] e T[A]. Found: T[B], Required: T[A].", set: { d0: { tono: 'no' } } },
        { nota: "<b>Covariante</b>: stesso verso, B &lt;: A ⇒ T[B] &lt;: T[A]. Compila.", set: { d1: { tono: 'ok' }, c: { t: 'T[+X]: compila', tono: 'ok' } } },
        { nota: "<b>Contravariante</b>: verso rovesciato, T[A] &lt;: T[B]. Non compila (verificato).", set: { d2: { tono: 'no' }, c2: { t: 'solo la covarianza mantiene il verso' } } }
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
  <pre class="cod" data-lang="scala">class Animal(val nome: String)
class Cat(nome: String) extends Animal(nome)

val a: Animal = Cat("Tom")   // ok: un Cat è un Animal</pre>
  <p>{{s|s015|}}</p>
  <p>{{s|s016|}}</p>
  <figure class="scena" data-scena="frecce" data-titolo="{{a|s017|}}"></figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s018|}}</th><th>{{s|s019|}}</th><th>{{s|s020|}}</th><th>{{s|s021|}}</th></tr></thead>
    <tbody>
      <tr><td><code>T[+A]</code></td><td>{{s|s022|}}</td><td>{{s|s023|}}</td><td>{{s|s024|}}</td></tr>
      <tr><td><code>T[-A]</code></td><td>{{s|s025|}}</td><td>{{s|s026|}}</td><td>{{s|s027|}}</td></tr>
      <tr><td><code>T[A]</code></td><td>{{s|s028|}}</td><td>{{s|s029|}}</td><td>{{s|s030|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s031|}}</p>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <figure class="passi" data-titolo="{{a|s033|}}">
    <div class="passo">
      <div class="espr">val cats: List[<mark class="dato">Cat</mark>] = List(Cat("Tom"))</div>
      <p class="nota">{{s|s034|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val animals: List[<mark class="ora">Animal</mark>] = cats</div>
      <p class="nota">{{s|s035|}}</p>
    </div>
    <div class="passo">
      <div class="espr">animals.head   <span class="mano">// un Animal</span></div>
      <p class="nota">{{s|s036|}}</p>
    </div>
    <div class="passo">
      <div class="espr">animals<mark class="no">.aggiungi(Dog("Rex"))</mark>   <span class="mano">// non esiste</span></div>
      <p class="nota">{{s|s037|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">Nil: List[Nothing]  &lt;:  List[Int], List[String], …</mark></div>
      <p class="nota">{{s|s038|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="covarianza" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <p>{{s|s041|}}</p>
  <figure class="passi" data-titolo="{{a|s042|}}">
    <div class="passo">
      <div class="espr">class A {}   class B extends A {}   class C extends A {}</div>
      <p class="nota">{{s|s043|}}</p>
    </div>
    <div class="passo">
      <div class="espr">B[] b = { <mark class="dato">new B()</mark> };</div>
      <p class="nota">{{s|s044|}}</p>
    </div>
    <div class="passo">
      <div class="espr">A[] a = <mark class="due">b</mark>;</div>
      <p class="nota">{{s|s045|}}</p>
    </div>
    <div class="passo">
      <div class="espr">a[0] = <mark class="no">new C()</mark>;</div>
      <p class="nota">{{s|s046|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="no">ArrayStoreException: C</mark></div>
      <p class="nota">{{s|s047|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val animals: Array[Animal] = cats   <span class="mano">// in Scala</span>
<mark class="ok">Found:    (cats : Array[Cat])
Required: Array[Animal]</mark></div>
      <p class="nota">{{s|s048|}}</p>
    </div>
  </figure>
  <div class="box regola" data-tit="{{a|s049|}}">
    <p>{{s|s050|}}</p>
  </div>
  <figure class="scena" data-scena="arrayjava" data-titolo="{{a|s051|}}"></figure>
</section>

<section>
  <h2>{{s|s052|}}</h2>
  <figure class="passi" data-titolo="{{a|s053|}}">
    <div class="passo">
      <div class="espr">trait Printer[<mark class="due">-A</mark>]:
  def print(a: A): String</div>
      <p class="nota">{{s|s054|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val stampaAnimali: Printer[Animal] = a => "animale " + a.nome</div>
      <p class="nota">{{s|s055|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val stampaGatti: Printer[<mark class="ora">Cat</mark>] = <mark class="due">stampaAnimali</mark></div>
      <p class="nota">{{s|s056|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val pa: Printer[Animal] = <mark class="no">pg</mark>   <span class="mano">// pg: Printer[Cat]</span>
Found:    (pg : Printer[Cat])
Required: Printer[Animal]</div>
      <p class="nota">{{s|s057|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val f: Animal => String = _.nome
val g: <mark class="due">Cat</mark> => <mark class="ok">Any</mark> = f</div>
      <p class="nota">{{s|s058|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="contravarianza" data-titolo="{{a|s059|}}"></figure>
</section>

<section>
  <h2>{{s|s060|}}</h2>
  <p>{{s|s061|}}</p>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">class Cell[+T](init: T):
  private var current = init
  def get = current
  def set(x: T): Unit = current = x</pre>
      <pre class="msg">covariant type T occurs in contravariant position in type T of parameter x</pre>
      <div class="fix">Con <code>+T</code> la cella potrebbe diventare una <code>Cell[Any]</code> e ricevere un numero dentro una cella di stringhe. Il compilatore blocca <code>set</code>, dove T entra.</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">class Cell[-T](init: T):
  private var current = init
  def get = current
  def set(x: T): Unit = current = x</pre>
      <pre class="msg">contravariant type T occurs in covariant position in type => T of method get</pre>
      <div class="fix">La slide 14 propone <code>[-T]</code>, ma compilando con Scala 3.8 anche questo viene rifiutato: ora il problema è <code>get</code>, dove T esce. Una cella che si legge <b>e</b> si scrive può essere solo <b>invariante</b>: <code>class Cell[T]</code>.</div>
    </div>
  </div>
  <figure class="scena" data-scena="posizioni" data-titolo="{{a|s062|}}"></figure>
</section>

<section>
  <h2>{{s|s063|}}</h2>
  <p>{{s|s064|}}</p>
  <figure class="passi" data-titolo="{{a|s065|}}">
    <div class="passo">
      <div class="espr">enum Option[+A]:
  def getOrElse(default: <mark class="no">A</mark>): A</div>
      <p class="nota">{{s|s066|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="no">covariant type A occurs in contravariant position in type A of parameter default</mark></div>
      <p class="nota">{{s|s067|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def getOrElse[<mark class="ora">B &gt;: A</mark>](default: => <mark class="ora">B</mark>): <mark class="ora">B</mark></div>
      <p class="nota">{{s|s068|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val o: Option[<mark class="dato">Cat</mark>] = Some(Cat("Tom"))
o.getOrElse(<mark class="due">Dog("Rex")</mark>)   <span class="mano">// tipo: Animal</span></div>
      <p class="nota">{{s|s069|}}</p>
    </div>
    <div class="passo">
      <div class="espr">Some(42).getOrElse(0)   <span class="mano">// B = A = Int</span></div>
      <p class="nota">{{s|s070|}}</p>
    </div>
  </figure>
  <p>{{s|s071|}}</p>
  <figure class="scena" data-scena="getorelse" data-titolo="{{a|s072|}}"></figure>
</section>

<section>
  <h2>{{s|s073|}}</h2>
  <pre class="cod" data-lang="scala">class A
class B extends A
val t: T[A] = new T[B]</pre>
  <p>{{s|s074|}}</p>
  <div class="box inglese" data-tit="{{a|s075|}}">
    <p>{{s|s076|}}</p>
  </div>
  <figure class="scena" data-scena="sondaggiovar" data-titolo="{{a|s077|}}"></figure>
</section>

</main>
</body>
</html>
