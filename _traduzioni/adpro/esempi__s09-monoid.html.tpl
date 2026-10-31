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
  <p>{{s|s006|}}</p>
  <figure class="codice" data-titolo="{{a|s007|}}">
<pre data-lang="scala">//&gt; using scala 3.8.4
//&gt; using options -Werror -deprecation -feature -source:future

trait Monoid[A]:
  def combine(a1: A, a2: A): A
  def empty: A

val stringMonoid: Monoid[String] = new Monoid[String]:
  def combine(a1: String, a2: String): String = a1 + a2
  val empty: String = ""

val maxMonoid: Monoid[Int] = new Monoid[Int]:
  def combine(a1: Int, a2: Int): Int = a1.max(a2)
  val empty: Int = Int.MinValue

def concatenate[A](as: List[A], m: Monoid[A]): A =
  as.foldLeft(m.empty)(m.combine)

def unitLaw[A](m: Monoid[A], x: A): Boolean =
  m.combine(x, m.empty) == x &amp;&amp; m.combine(m.empty, x) == x

def assocLaw[A](m: Monoid[A], x: A, y: A, z: A): Boolean =
  m.combine(m.combine(x, y), z) == m.combine(x, m.combine(y, z))

val length: String =&gt; Int = s =&gt; s.length

@main def esempiMonoid(): Unit =
  println(concatenate(List("a", "b", "c"), stringMonoid))
  println(concatenate(List(3, 9, 4), maxMonoid))
  println(concatenate(List.empty[Int], maxMonoid))
  println(unitLaw(stringMonoid, "ciao"))
  println(unitLaw(maxMonoid, 7))
  println(assocLaw(maxMonoid, 1, 8, 5))
  println(length("foo" + "bar") == length("foo") + length("bar"))
  println("abc".toList.mkString == "abc")</pre>
    <ol class="spiega">
      <li data-righe="1-2"><p>{{s|s008|}}</p></li>
      <li data-righe="4-6" data-segna="trait Monoid[A]@ora|def combine@due|def empty@due"><p>{{s|s009|}}</p></li>
      <li data-righe="8-10" data-segna="new Monoid[String]@ora|a1 + a2@ok"><p>{{s|s010|}}</p></li>
      <li data-righe="12-14" data-segna="a1.max(a2)@ora|Int.MinValue@due"><p>{{s|s011|}}</p></li>
      <li data-righe="16-17" data-segna="foldLeft(m.empty)(m.combine)@ora"><p>{{s|s012|}}</p></li>
      <li data-righe="19-20" data-segna="m.combine(x, m.empty) == x@ora"><p>{{s|s013|}}</p></li>
      <li data-righe="22-23" data-segna="m.combine(m.combine(x, y), z)@ora|m.combine(x, m.combine(y, z))@due"><p>{{s|s014|}}</p></li>
      <li data-righe="25" data-segna="s.length@ora"><p>{{s|s015|}}</p></li>
      <li data-righe="27-35"><p>{{s|s016|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <figure class="codice" data-titolo="{{a|s019|}}">
<pre data-lang="text">abc
9
-2147483648
true
true
true
true
true</pre>
    <ol class="spiega">
      <li data-righe="1"><p>{{s|s020|}}</p></li>
      <li data-righe="2"><p>{{s|s021|}}</p></li>
      <li data-righe="3"><p>{{s|s022|}}</p></li>
      <li data-righe="4-8"><p>{{s|s023|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s024|}}</h2>
  <div class="box inglese" data-tit="{{a|s025|}}">{{s|s026|}}</div>
  <div class="box attenzione" data-tit="{{a|s027|}}">{{s|s028|}}</div>
</section>

</main>
</body>
</html>
