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
</head>
<body>
<main class="pagina">

<header class="testa">
  <div class="occhiello">{{s|s002|}}</div>
  <h1>{{s|s003|}}</h1>
  <p class="lede">{{s|s004|}}</p>
</header>

<section>
  <h2>{{s|s005|}}</h2>
  <figure class="passi" data-titolo="{{a|s006|}}">
    <div class="passo"><div class="espr">case Nil => <mark class="no">Nil</mark>          <span class="mano">// dentro length: Int</span></div><p class="nota">{{s|s007|}}</p></div>
    <div class="passo"><div class="espr">Found:    <mark class="no">(List.Nil : List[Nothing])</mark></div><p class="nota">{{s|s008|}}</p></div>
    <div class="passo"><div class="espr">Required: <mark class="ok">Int</mark></div><p class="nota">{{s|s009|}}</p></div>
    <div class="passo"><div class="espr">case Nil => <mark class="ok">0</mark></div><p class="nota">{{s|s010|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s011|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def length[A](l: List[A]): Int = l match
  case Nil => Nil</pre>
      <pre class="msg">Found:    (List.Nil : List[Nothing])
Required: Int</pre>
      <div class="fix">{{s|s012|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => if t == Nil then h else init(h)</pre>
      <pre class="msg">Found:    (h : A)
Required: List[A]</pre>
      <div class="fix">{{s|s013|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Leaf(value) => value.toString()      // dentro map su Tree</pre>
      <pre class="msg">Found:    String
Required: Tree[B]</pre>
      <div class="fix">{{s|s014|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def map1[A, B](t: Tree[A])(f: A => B): Tree[B] =
  fold(t)(Branch(_, _))(a => Leaf(f(a)))</pre>
      <pre class="msg">Found:    Tree[Any]
Required: Tree[B]</pre>
      <div class="fix">{{s|s015|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def flatMap[B](f: A => Option[B]): Option[B] = this match
  case None => None
  case Some(a) => Some(f(a))</pre>
      <pre class="msg">Found:    Option[B]
Required: B</pre>
      <div class="fix">{{s|s016|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def r: Option[Int] = lst.headOption.map(_._1)</pre>
      <pre class="msg">Found:    (_$1._1 : String)
Required: Int</pre>
      <div class="fix">{{s|s017|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Empty => None          // dentro toList: List[A]</pre>
      <pre class="msg">Found:    None.type
Required: List[A]</pre>
      <div class="fix">{{s|s018|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => cons(h(), t().toList)</pre>
      <pre class="msg">Found:    List[A]
Required: LazyList[A]</pre>
      <div class="fix">{{s|s019|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def take(n: Int): LazyList[A] =
  if n &lt;= 0 then Nil else …</pre>
      <pre class="msg">Found:    (Nil : scala.collection.immutable.Nil.type)
Required: LazyList[A]</pre>
      <div class="fix">{{s|s020|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => h :: t().toList</pre>
      <pre class="msg">Found:    (h : () => A)
Required: A</pre>
      <div class="fix">{{s|s021|}}</div>
    </div>
  </div>
</section>

<section>
  <h2>{{s|s022|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">scala&gt; adpro.intro.Exercise.fib(10)</pre>
      <pre class="msg">value Exercise is not a member of adpro.intro</pre>
      <div class="fix">{{s|s023|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Const(h, t) => h * product(t)</pre>
      <pre class="msg">no pattern match extractor named Const was found</pre>
      <div class="fix">{{s|s024|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Some(X) => X</pre>
      <pre class="msg">Not found: X</pre>
      <div class="fix">{{s|s025|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => if p(h()) then t().forAll(p) else False</pre>
      <pre class="msg">Not found: False</pre>
      <div class="fix">{{s|s026|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">cons(h(), t.takeWhile(p))</pre>
      <pre class="msg">value takeWhile is not a member of () => LazyList[A]</pre>
      <div class="fix">{{s|s027|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => h() :: t</pre>
      <pre class="msg">value :: is not a member of () => LazyList[A]</pre>
      <div class="fix">{{s|s028|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">for x &lt;- Some(4) if x % 2 == 0 yield x      // Option del corso</pre>
      <pre class="msg">value withFilter is not a member of Option.Some[Int]</pre>
      <div class="fix">{{s|s029|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">trait OrderedPoint extends scala.math.Ordered[java.awt.Point]:
  override def compare(that: java.awt.Point): Int =
    if this.x &lt; that.x then -1 else 1</pre>
      <pre class="msg">value x is not a member of OrderedPoint</pre>
      <div class="fix">{{s|s030|}}</div>
    </div>
  </div>
</section>

<section>
  <h2>{{s|s031|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def size[A](t: Tree[A]): Int = match</pre>
      <pre class="msg">expression expected but match found</pre>
      <div class="fix">{{s|s032|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def foldLeft[A, B](l: List[A], z: B, f: (B, A) => B): B =
  case Nil => z</pre>
      <pre class="msg">Missing parameter type

I could not infer the type of the parameter x$1
in expanded function:
  x$1 => x$1 match …</pre>
      <div class="fix">{{s|s033|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case n &lt; 0 => l</pre>
      <pre class="msg">no pattern match extractor named &lt; was found</pre>
      <div class="fix">{{s|s034|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">foldLeft(as, 0, f(acc, _) => acc + 1)</pre>
      <pre class="msg">not a legal formal parameter for a function literal
Not found: acc</pre>
      <div class="fix">{{s|s035|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">val negative = x => x &lt; 0</pre>
      <pre class="msg">Missing parameter type

I could not infer the type of the parameter x</pre>
      <div class="fix">{{s|s036|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">List(1, 2, 3).map(_ * _)</pre>
      <pre class="msg">Wrong number of parameters, expected: 1</pre>
      <div class="fix">{{s|s037|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">lst.headOption.map(_.1)</pre>
      <pre class="msg">',' or ')' expected, but number literal found</pre>
      <div class="fix">{{s|s038|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => h() :: t().toList()</pre>
      <pre class="msg">missing argument for parameter n of method apply in trait LinearSeqOps: (n: Int): A</pre>
      <div class="fix">{{s|s039|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def foldLeft1[A, B](l: List[A], z: B, f: (B, A) => B): B =
  def aiuto(x: B): B = f(x, ???)</pre>
      <pre class="msg">Found:    Unit
Required: B

Maybe the enclosing block is missing a final expression after the definition of `aiuto`?</pre>
      <div class="fix">{{s|s040|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">enum LazyList[+A]:
  case Cons(h: => A, t: => LazyList[A])</pre>
      <pre class="msg">val parameters may not be call-by-name</pre>
      <div class="fix">{{s|s041|}}</div>
    </div>
  </div>
</section>

<section>
  <h2>{{s|s042|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def head[A](l: List[A]): A = l match
  case Cons(h, _) => h</pre>
      <pre class="msg">match may not be exhaustive.

It would fail on pattern case: Nil</pre>
      <div class="fix">{{s|s043|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Some(a) if p(a)  => this
case Some(a) if !p(a) => None
case None             => None</pre>
      <pre class="msg">match may not be exhaustive.

It would fail on pattern case: Option.Some(_)</pre>
      <div class="fix">{{s|s044|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => h
case Cons(1, t) => 1</pre>
      <pre class="msg">Unreachable case</pre>
      <div class="fix">{{s|s045|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => h
case _ => 101</pre>
      <pre class="msg">Unreachable case except for null (if this is intentional, consider writing case null => instead).</pre>
      <div class="fix">{{s|s046|}}</div>
    </div>
  </div>
</section>

<section>
  <h2>{{s|s047|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">@annotation.tailrec
def bonacci(n: Int, acc: Int): Int = … bonacci(n-1, acc) + bonacci(n-2, acc)</pre>
      <pre class="msg">Cannot rewrite recursive call: it is not in tail position</pre>
      <div class="fix">{{s|s048|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">enum Option[+A]:
  def getOrElse(default: A): A</pre>
      <pre class="msg">covariant type A occurs in contravariant position in type A of parameter default</pre>
      <div class="fix">{{s|s049|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">class Cell[-T](init: T):
  private var current = init
  def get = current</pre>
      <pre class="msg">contravariant type T occurs in covariant position in type => T of method get</pre>
      <div class="fix">{{s|s050|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">val animals: Array[Animal] = cats      // cats: Array[Cat]</pre>
      <pre class="msg">Found:    (cats : Array[Cat])
Required: Array[Animal]</pre>
      <div class="fix">{{s|s051|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">trait Audible:
  def makeNoise(): String
class Frog extends Audible</pre>
      <pre class="msg">class Frog needs to be abstract, since def makeNoise(): String in trait Audible is not defined</pre>
      <div class="fix">{{s|s052|}}</div>
    </div>
  </div>
</section>

</main>
</body>
</html>
