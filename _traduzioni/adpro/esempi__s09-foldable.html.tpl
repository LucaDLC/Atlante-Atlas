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

val maxMonoid: Monoid[Int] = new Monoid[Int]:
  def combine(a1: Int, a2: Int): Int = a1.max(a2)
  val empty: Int = Int.MinValue

val stringMonoid: Monoid[String] = new Monoid[String]:
  def combine(a1: String, a2: String): String = a1 + a2
  val empty: String = ""

def concatenate[A](as: List[A], m: Monoid[A]): A =
  as.foldLeft(m.empty)(m.combine)

val parole: List[String] = List("monoid", "fold", "map", "reduce")

@main def esempiFoldable(): Unit =
  // foldLeft e foldRight con la stessa operazione: qui la somma delle lunghezze
  println(parole.foldLeft(0)((acc, p) =&gt; acc + p.length))
  println(parole.foldRight(0)((p, acc) =&gt; acc + p.length))
  // map e poi concatenate: il foldMap fatto in due passi
  println(concatenate(parole.map(_.length), maxMonoid))
  println(concatenate(parole.map(_.take(1)), stringMonoid))
  // lista vuota: si ottiene il neutro
  println(concatenate(List.empty[Int], maxMonoid))
  // due modi di raggruppare la stessa lista: stesso risultato
  val a = List("a", "b", "c", "d")
  println(concatenate(a.take(2), stringMonoid) + concatenate(a.drop(2), stringMonoid))
  println(concatenate(a, stringMonoid))</pre>
    <ol class="spiega">
      <li data-righe="16-17" data-segna="as.foldLeft(m.empty)(m.combine)@ora"><p>{{s|s008|}}</p></li>
      <li data-righe="23" data-segna="foldLeft(0)@ora"><p>{{s|s009|}}</p></li>
      <li data-righe="24" data-segna="foldRight(0)@ora"><p>{{s|s010|}}</p></li>
      <li data-righe="26" data-segna="parole.map(_.length)@ora|maxMonoid@due"><p>{{s|s011|}}</p></li>
      <li data-righe="27" data-segna="parole.map(_.take(1))@ora|stringMonoid@due"><p>{{s|s012|}}</p></li>
      <li data-righe="29" data-segna="List.empty[Int]@ora"><p>{{s|s013|}}</p></li>
      <li data-righe="31-32" data-segna="a.take(2)@ora|a.drop(2)@due"><p>{{s|s014|}}</p></li>
      <li data-righe="33" data-segna="concatenate(a, stringMonoid)@ok"><p>{{s|s015|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s016|}}</h2>
  <figure class="codice" data-titolo="{{a|s017|}}">
<pre data-lang="text">19
19
6
mfmr
-2147483648
abcd
abcd</pre>
    <ol class="spiega">
      <li data-righe="1-2"><p>{{s|s018|}}</p></li>
      <li data-righe="3-4"><p>{{s|s019|}}</p></li>
      <li data-righe="5"><p>{{s|s020|}}</p></li>
      <li data-righe="6-7"><p>{{s|s021|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s022|}}</h2>
  <div class="box inglese" data-tit="{{a|s023|}}">{{s|s024|}}</div>
  <div class="box regola" data-tit="{{a|s025|}}">{{s|s026|}}</div>
</section>

</main>
</body>
</html>
