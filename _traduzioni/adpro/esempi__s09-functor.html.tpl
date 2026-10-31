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

def distribute[A, B](fab: List[(A, B)]): (List[A], List[B]) =
  (fab.map(_._1), fab.map(_._2))

def map2[A, B, C](fa: Option[A], fb: Option[B])(f: (A, B) =&gt; C): Option[C] =
  fa.flatMap(a =&gt; fb.map(b =&gt; f(a, b)))

@main def esempiFunctor(): Unit =
  val doppio: Int =&gt; Int = _ * 2
  println(List(1, 2, 3).map(doppio))
  println(Option(3).map(doppio))
  println(Option.empty[Int].map(doppio))
  // legge dell'identità: map(identity) non cambia la struttura
  println(List(1, 2, 3).map(identity) == List(1, 2, 3))
  println(Option(3).map(identity) == Option(3))
  // distribute: da una lista di coppie a una coppia di liste
  val persone = List(("John", 35), ("Andrzej", 39), ("Stefan", 18))
  println(distribute(persone))
  // map2: combina due contenitori, se uno dei due è vuoto il risultato è None
  println(map2(Some("John"), Some(35))((n, e) =&gt; s"$n ($e)"))
  println(map2(Some("John"), Option.empty[Int])((n, e) =&gt; s"$n ($e)"))</pre>
    <ol class="spiega">
      <li data-righe="4-5" data-segna="fab.map(_._1)@ora|fab.map(_._2)@due"><p>{{s|s008|}}</p></li>
      <li data-righe="7-8" data-segna="fa.flatMap(a =&gt; fb.map(b =&gt; f(a, b)))@ora"><p>{{s|s009|}}</p></li>
      <li data-righe="11" data-segna="_ * 2@ora"><p>{{s|s010|}}</p></li>
      <li data-righe="12-14" data-segna="map(doppio)@ora"><p>{{s|s011|}}</p></li>
      <li data-righe="16-17" data-segna="map(identity)@ora"><p>{{s|s012|}}</p></li>
      <li data-righe="19-20" data-segna="persone"><p>{{s|s013|}}</p></li>
      <li data-righe="22" data-segna="Some(35)@ora"><p>{{s|s014|}}</p></li>
      <li data-righe="23" data-segna="Option.empty[Int]@no"><p>{{s|s015|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s016|}}</h2>
  <figure class="codice" data-titolo="{{a|s017|}}">
<pre data-lang="text">List(2, 4, 6)
Some(6)
None
true
true
(List(John, Andrzej, Stefan),List(35, 39, 18))
Some(John (35))
None</pre>
    <ol class="spiega">
      <li data-righe="1-3"><p>{{s|s018|}}</p></li>
      <li data-righe="4-5"><p>{{s|s019|}}</p></li>
      <li data-righe="6"><p>{{s|s020|}}</p></li>
      <li data-righe="7-8"><p>{{s|s021|}}</p></li>
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
