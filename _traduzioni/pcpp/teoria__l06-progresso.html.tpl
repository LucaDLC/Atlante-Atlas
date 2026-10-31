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
  <h1>{{s|s002|}}</h1>
  <p class="lede">{{s|s003|}}</p>
</header>

<section>
  <h2>{{s|s004|}}</h2>
  <p>{{s|s005|}}</p>
  <p>{{s|s006|}}</p>
  <div class="box domanda-tua" data-tit="{{a|s007|}}">
    <p>{{s|s008|}}</p>
    <ul>
      <li>{{s|s009|}}</li>
      <li>{{s|s010|}}</li>
    </ul>
    <p>{{s|s011|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s012|}}" data-legenda="{{a|s013|}}">
    <div class="passo"><div class="espr"><mark class="dato">T1</mark> legge 5, e lo scheduler lo sospende per 1 secondo</div><p class="nota">{{s|s014|}}</p></div>
    <div class="passo"><div class="espr">con un lock:  <mark class="dato">T1</mark> tiene il lock  →  <mark class="due">T2, T3, T4</mark> <mark class="no">aspettano 1 secondo</mark></div><p class="nota">{{s|s015|}}</p></div>
    <div class="passo"><div class="espr">con il CAS:  <mark class="due">T2, T3, T4</mark> <mark class="ok">incrementano</mark>  5 → 6 → 7 → 8</div><p class="nota">{{s|s016|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">T1</mark> riparte: CAS(5 → 6) <mark class="no">fallisce</mark>, rilegge 8, CAS(8 → 9) <mark class="ok">riesce</mark></div><p class="nota">{{s|s017|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s018|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s019|}}</th><th>{{s|s020|}}</th><th>{{s|s021|}}</th><th>{{s|s022|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s023|}}</td><td>{{s|s024|}}</td><td>{{s|s025|}}</td><td>{{s|s026|}}</td></tr>
      <tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td><td>{{s|s030|}}</td></tr>
      <tr><td>{{s|s031|}}</td><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s035|}}">
    <p>{{s|s036|}}</p>
    <ul>
      <li>{{s|s037|}}</li>
      <li>{{s|s038|}}</li>
    </ul>
    <p>{{s|s039|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <p>{{s|s041|}}</p>
  <pre class="cod" data-lang="java" data-segna="compareAndSet(oldValue, newValue)@ora">do {
    oldValue = get();
    newValue = oldValue + delta;
} while (!compareAndSet(oldValue, newValue));</pre>
  <figure class="passi" data-titolo="{{a|s042|}}" data-legenda="{{a|s043|}}">
    <div class="passo"><div class="espr">T1 e T2 leggono 5, provano CAS(5 → 6)</div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">T1: CAS <mark class="ok">riesce</mark>   T2: CAS <mark class="no">fallisce</mark></div><p class="nota">{{s|s045|}}</p></div>
    <div class="passo"><div class="espr">T2 fallisce <mark class="ora">solo perché</mark> T1 è riuscito</div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr">T2 può perdere <mark class="no">per sempre</mark></div><p class="nota">{{s|s047|}}</p></div>
  </figure>
  <p>{{s|s048|}}</p>
</section>

<section>
  <h2>{{s|s049|}}</h2>
  <div class="colonne">
    <div class="carta buona"><h4>{{s|s050|}}</h4><p>{{s|s051|}}</p></div>
    <div class="carta media"><h4>{{s|s052|}}</h4><p>{{s|s053|}}</p></div>
  </div>
</section>

<section>
  <h2>{{s|s054|}}</h2>
  <div class="box domanda-tua" data-tit="{{a|s055|}}">
    <p>{{s|s056|}}</p>
    <p>{{s|s057|}}</p>
  </div>
  <div class="colonne">
    <div class="carta"><h4>{{s|s058|}}</h4><p>{{s|s059|}}</p></div>
    <div class="carta"><h4>{{s|s060|}}</h4><p>{{s|s061|}}</p></div>
  </div>
  <div class="box basi" data-tit="{{a|s062|}}">
    <p>{{s|s063|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s064|}}">
    <p>{{s|s065|}}</p>
    <ul>
      <li>{{s|s066|}}</li>
      <li>{{s|s067|}}</li>
      <li>{{s|s068|}}</li>
      <li>{{s|s069|}}</li>
    </ul>
  </div>
</section>

<section>
  <h2>{{s|s070|}}</h2>
  <div class="box domanda-tua" data-tit="{{a|s071|}}">
    <p>{{s|s072|}}</p>
    <p>{{s|s073|}}</p>
  </div>
  <p>{{s|s074|}}</p>
  <figure class="passi" data-titolo="{{a|s075|}}" data-legenda="{{a|s076|}}">
    <div class="passo"><div class="espr">due AtomicInteger: lower, upper   stato (0, 5)</div><p class="nota">{{s|s077|}}</p></div>
    <div class="passo"><div class="espr">T1: setLower(4) controlla 4 ≤ upper=5 ✔    T2: setUpper(3) controlla 3 ≥ lower=0 ✔</div><p class="nota">{{s|s078|}}</p></div>
    <div class="passo"><div class="espr">T1 scrive lower=4, T2 scrive upper=3  →  (4, 3)  <mark class="no">lower &gt; upper</mark></div><p class="nota">{{s|s079|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">AtomicReference&lt;IntPair&gt;</mark>: la coppia in un oggetto immutabile</div><p class="nota">{{s|s080|}}</p></div>
  </figure>
  <p>{{s|s081|}}</p>
</section>

<section>
  <h2>{{s|s082|}}</h2>
  <div class="box attenzione" data-tit="{{a|s083|}}">
    <p>{{s|s084|}}</p>
    <p>{{s|s085|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s086|}}">
    <p>{{s|s087|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s088|}}</h2>
  <div class="quiz">
    <div class="domanda">
      <p class="q">{{s|s089|}}</p>
      <div class="opzioni"><button>wait-free</button><button data-giusta>lock-free</button><button>nessuna</button></div>
      <div class="perche"><p>{{s|s090|}}</p></div>
    </div>
    <div class="domanda">
      <p class="q">{{s|s091|}}</p>
      <div class="opzioni"><button>è solo wait-free</button><button data-giusta>è anche lock-free e obstruction-free</button><button>non è lock-free</button></div>
      <div class="perche"><p>{{s|s092|}}</p></div>
    </div>
    <div class="domanda">
      <p class="q">{{s|s093|}}</p>
      <div class="opzioni"><button>lock-free</button><button>wait-free</button><button data-giusta>obstruction-free</button></div>
      <div class="perche"><p>{{s|s094|}}</p></div>
    </div>
  </div>
</section>

</main>
</body>
</html>
