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
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s006|}}</th><th>{{s|s007|}}</th><th>{{s|s008|}}</th><th>{{s|s009|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s010|}}</td><td>{{s|s011|}}</td><td>{{s|s012|}}</td><td>{{s|s013|}}</td></tr>
      <tr><td>{{s|s014|}}</td><td><code>i = i + 1</code></td><td>{{s|s015|}}</td><td>{{s|s016|}}</td></tr>
      <tr><td>{{s|s017|}}</td><td>{{s|s018|}}</td><td>{{s|s019|}}</td><td>{{s|s020|}}</td></tr>
      <tr><td>{{s|s021|}}</td><td>{{s|s022|}}</td><td>{{s|s023|}}</td><td>{{s|s024|}}</td></tr>
      <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr>
      <tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr>
      <tr><td>{{s|s033|}}</td><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box attenzione" data-tit="{{a|s037|}}">
    <p>{{s|s038|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s039|}}</h2>
  <p>{{s|s040|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s041|}}</th><th>{{s|s042|}}</th><th>{{s|s043|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s044|}}</td><td></td><td>{{s|s045|}}</td></tr>
      <tr><td>{{s|s046|}}</td><td></td><td>{{s|s047|}}</td></tr>
      <tr><td>{{s|s048|}}</td><td></td><td>{{s|s049|}}</td></tr>
      <tr><td>{{s|s050|}}</td><td></td><td>{{s|s051|}}</td></tr>
      <tr><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr>
      <tr><td></td><td>{{s|s055|}}</td><td>{{s|s056|}}</td></tr>
      <tr><td>{{s|s057|}}</td><td></td><td>{{s|s058|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s059|}}</p>

  <figure class="passi" data-titolo="{{a|s060|}}" data-modo="sostituisci">
    <div class="passo">
      <div class="espr">def somma(xs: List[Int]): Int =
  <mark class="no">var</mark> tot = 0
  <mark class="no">for</mark> x &lt;- xs do
    <mark class="no">tot = tot + x</mark>
  <mark class="no">return</mark> tot</div>
      <p class="nota">{{s|s061|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def somma(xs: List[Int]): Int =
  @annotation.tailrec
  def go(xs: List[Int], <mark class="ora">tot: Int</mark>): Int = xs match
    case Nil => tot
    case h :: t => go(t, tot + h)
  go(xs, 0)</div>
      <p class="nota">{{s|s062|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def somma(xs: List[Int]): Int = xs match
  case Nil => 0
  case h :: t => <mark class="ora">h + somma(t)</mark></div>
      <p class="nota">{{s|s063|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def somma(xs: List[Int]): Int =
  xs.<mark class="ok">foldLeft(0)(_ + _)</mark></div>
      <p class="nota">{{s|s064|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def somma(xs: List[Int]): Int =
  xs.<mark class="ok">sum</mark></div>
      <p class="nota">{{s|s065|}}</p>
    </div>
  </figure>

  <figure class="passi" data-titolo="{{a|s066|}}" data-modo="sostituisci">
    <div class="passo">
      <div class="espr">def mean(xs: List[Double]): Double =
  if xs.isEmpty then <mark class="no">throw new ArithmeticException("empty")</mark>
  else xs.sum / xs.length</div>
      <p class="nota">{{s|s067|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def mean(xs: List[Double]): <mark class="ok">Option[Double]</mark> =
  if xs.isEmpty then None
  else Some(xs.sum / xs.length)</div>
      <p class="nota">{{s|s068|}}</p>
    </div>
  </figure>
</section>

<section>
  <h2>{{s|s069|}}</h2>
  <div class="box regola" data-tit="{{a|s070|}}">
    <p>{{s|s071|}}</p>
  </div>
  <p>{{s|s072|}}</p>
</section>

<section>
  <h2>{{s|s073|}}</h2>
  <p>{{s|s074|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s075|}}</th><th>{{s|s076|}}</th><th>{{s|s077|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s078|}}</td><td>{{s|s079|}}</td><td>{{s|s080|}}</td></tr>
      <tr><td>{{s|s081|}}</td><td>{{s|s082|}}</td><td>{{s|s083|}}</td></tr>
      <tr><td>{{s|s084|}}</td><td>{{s|s085|}}</td><td>{{s|s086|}}</td></tr>
      <tr><td>{{s|s087|}}</td><td>{{s|s088|}}</td><td>{{s|s089|}}</td></tr>
      <tr><td>{{s|s090|}}</td><td>{{s|s091|}}</td><td>{{s|s092|}}</td></tr>
      <tr><td>{{s|s093|}}</td><td>{{s|s094|}}</td><td>{{s|s095|}}</td></tr>
      <tr><td>{{s|s096|}}</td><td>{{s|s097|}}</td><td>{{s|s098|}}</td></tr>
      <tr><td>{{s|s099|}}</td><td>{{s|s100|}}</td><td></td></tr>
      <tr><td>{{s|s101|}}</td><td>{{s|s102|}}</td><td></td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s103|}}</h2>
  <p>{{s|s104|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s105|}}</th><th>{{s|s106|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s107|}}</td><td>{{s|s108|}}</td></tr>
      <tr><td>{{s|s109|}}</td><td>{{s|s110|}}</td></tr>
      <tr><td>{{s|s111|}}</td><td>{{s|s112|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s113|}}</p>
</section>

<section>
  <h2>{{s|s114|}}</h2>
  <ul>
    <li>{{s|s115|}}</li>
    <li>{{s|s116|}}</li>
    <li>{{s|s117|}}</li>
  </ul>
</section>

</main>
</body>
</html>
