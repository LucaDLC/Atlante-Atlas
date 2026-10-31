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

val lista: List[Int] = 1 :: 2 :: Nil
val vuota: List[Int] = Nil

val trovato: Option[Int] = Some(3)
val niente: Option[Int] = None

def primoOpzione(xs: List[Int]): Option[Int] = xs match
  case Nil =&gt; None
  case h :: _ =&gt; Some(h)

@main def esempiNilNone(): Unit =
  println(lista)
  println(vuota.isEmpty)
  println(Nil == List())
  println(primoOpzione(lista))
  println(primoOpzione(vuota))
  println(trovato.getOrElse(0))
  println(niente.getOrElse(0))
  println(Option(null: String))
  println(Option("ciao"))
  println(None == null)
  val testo: String = null
  println(testo == null)
  try
    println(testo.length)
  catch
    case e: NullPointerException =&gt; println("NPE su null")</pre>
    <ol class="spiega">
      <li data-righe="1-2"><p>{{s|s008|}}</p></li>
      <li data-righe="4" data-segna="1 :: 2 :: Nil@ora"><p>{{s|s009|}}</p></li>
      <li data-righe="5" data-segna="val vuota: List[Int] = Nil@ora"><p>{{s|s010|}}</p></li>
      <li data-righe="7-8" data-segna="None@ora"><p>{{s|s011|}}</p></li>
      <li data-righe="10-12" data-segna="case Nil =&gt; None@ora"><p>{{s|s012|}}</p></li>
      <li data-righe="14-16" data-segna="vuota.isEmpty@ora"><p>{{s|s013|}}</p></li>
      <li data-righe="18-19" data-segna="primoOpzione(vuota)@ora"><p>{{s|s014|}}</p></li>
      <li data-righe="20-21" data-segna="getOrElse(0)@ora"><p>{{s|s015|}}</p></li>
      <li data-righe="22" data-segna="Option(null: String)@ora"><p>{{s|s016|}}</p></li>
      <li data-righe="23" data-segna="Option(&quot;ciao&quot;)@ora"><p>{{s|s017|}}</p></li>
      <li data-righe="24" data-segna="None == null@no"><p>{{s|s018|}}</p></li>
      <li data-righe="25-26" data-segna="val testo: String = null@no"><p>{{s|s019|}}</p></li>
      <li data-righe="27-30" data-segna="testo.length@no"><p>{{s|s020|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <figure class="codice" data-titolo="{{a|s022|}}">
<pre data-lang="text">1
List(1, 2)
true
true
Some(1)
None
3
0
None
Some(ciao)
false
true
NPE su null</pre>
    <ol class="spiega">
      <li data-righe="1"><p>{{s|s023|}}</p></li>
      <li data-righe="2-3"><p>{{s|s024|}}</p></li>
      <li data-righe="4-5"><p>{{s|s025|}}</p></li>
      <li data-righe="6-7"><p>{{s|s026|}}</p></li>
      <li data-righe="8-9"><p>{{s|s027|}}</p></li>
      <li data-righe="10"><p>{{s|s028|}}</p></li>
      <li data-righe="11-12"><p>{{s|s029|}}</p></li>
    </ol>
  </figure>
</section>

</main>
</body>
</html>
