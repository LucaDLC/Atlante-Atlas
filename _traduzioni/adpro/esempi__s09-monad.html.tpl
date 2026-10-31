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

def raddoppiaSePositivo(n: Int): Option[Int] =
  if n &gt; 0 then Some(n * 2) else None

def dimezza(n: Int): Option[Int] =
  if n % 2 == 0 then Some(n / 2) else None

@main def esempiMonad(): Unit =
  // flatMap a catena: se un passo fallisce (None), i passi dopo non girano
  println(Some(3).flatMap(raddoppiaSePositivo).flatMap(dimezza))
  println(Some(-3).flatMap(raddoppiaSePositivo).flatMap(dimezza))
  println(Some(5).flatMap(raddoppiaSePositivo).flatMap(dimezza))
  // map si può scrivere con flatMap e unit (Some)
  println(Some(4).flatMap(a =&gt; Some(a + 1)) == Some(4).map(_ + 1))
  // la forma for è zucchero per flatMap e map
  val coppie = for
    a &lt;- List(1, 2)
    b &lt;- List(3, 4)
  yield (a, b)
  println(coppie)
  println(List(1, 2).flatMap(a =&gt; List(3, 4).map(b =&gt; (a, b))) == coppie)
  // legge dell'identità a destra: x.flatMap(unit) == x
  println(List(1, 2, 3).flatMap(a =&gt; List(a)) == List(1, 2, 3))
  // legge dell'identità a sinistra: unit(y).flatMap(f) == f(y)
  println(List(7).flatMap(raddoppiaLista) == raddoppiaLista(7).toList)

def raddoppiaLista(n: Int): List[Int] = List(n * 2)</pre>
    <ol class="spiega">
      <li data-righe="4-5" data-segna="Some(n * 2)@ora|None@due"><p>{{s|s008|}}</p></li>
      <li data-righe="7-8" data-segna="if n % 2 == 0 then Some(n / 2) else None"><p>{{s|s009|}}</p></li>
      <li data-righe="12" data-segna="flatMap(raddoppiaSePositivo).flatMap(dimezza)@ora"><p>{{s|s010|}}</p></li>
      <li data-righe="13" data-segna="Some(-3)@no"><p>{{s|s011|}}</p></li>
      <li data-righe="16" data-segna="flatMap(a =&gt; Some(a + 1))@ora"><p>{{s|s012|}}</p></li>
      <li data-righe="18-21" data-segna="for@ora|yield (a, b)@due"><p>{{s|s013|}}</p></li>
      <li data-righe="23" data-segna="List(1, 2).flatMap(a =&gt; List(3, 4).map(b =&gt; (a, b)))@ora"><p>{{s|s014|}}</p></li>
      <li data-righe="25" data-segna="flatMap(a =&gt; List(a))@ora"><p>{{s|s015|}}</p></li>
      <li data-righe="27" data-segna="List(7).flatMap(raddoppiaLista)@ora"><p>{{s|s016|}}</p></li>
      <li data-righe="29" data-segna="List(n * 2)@ora"><p>{{s|s017|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s018|}}</h2>
  <figure class="codice" data-titolo="{{a|s019|}}">
<pre data-lang="text">Some(3)
None
Some(5)
true
List((1,3), (1,4), (2,3), (2,4))
true
true
true</pre>
    <ol class="spiega">
      <li data-righe="1-3"><p>{{s|s020|}}</p></li>
      <li data-righe="4"><p>{{s|s021|}}</p></li>
      <li data-righe="5"><p>{{s|s022|}}</p></li>
      <li data-righe="6-8"><p>{{s|s023|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s024|}}</h2>
  <div class="box inglese" data-tit="{{a|s025|}}">{{s|s026|}}</div>
  <div class="box regola" data-tit="{{a|s027|}}">{{s|s028|}}</div>
</section>

</main>
</body>
</html>
