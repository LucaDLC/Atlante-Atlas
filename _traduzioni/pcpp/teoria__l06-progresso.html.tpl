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
    <div class="passo"><div class="espr">{{s|s014|}}</div><p class="nota">{{s|s015|}}</p></div>
    <div class="passo"><div class="espr">{{s|s016|}}</div><p class="nota">{{s|s017|}}</p></div>
    <div class="passo"><div class="espr">{{s|s018|}}</div><p class="nota">{{s|s019|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">T1</mark> riparte: CAS(5 → 6) <mark class="no">fallisce</mark>, rilegge 8, CAS(8 → 9) <mark class="ok">riesce</mark></div><p class="nota">{{s|s020|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s022|}}</th><th>{{s|s023|}}</th><th>{{s|s024|}}</th><th>{{s|s025|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s026|}}</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
      <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td><td>{{s|s033|}}</td></tr>
      <tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s038|}}">
    <p>{{s|s039|}}</p>
    <ul>
      <li>{{s|s040|}}</li>
      <li>{{s|s041|}}</li>
    </ul>
    <p>{{s|s042|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s043|}}</h2>
  <p>{{s|s044|}}</p>
  <pre class="cod" data-lang="java" data-segna="compareAndSet(oldValue, newValue)@ora">do {
    oldValue = get();
    newValue = oldValue + delta;
} while (!compareAndSet(oldValue, newValue));</pre>
  <figure class="passi" data-titolo="{{a|s045|}}" data-legenda="{{a|s046|}}">
    <div class="passo"><div class="espr">T1 e T2 leggono 5, provano CAS(5 → 6)</div><p class="nota">{{s|s047|}}</p></div>
    <div class="passo"><div class="espr">T1: CAS <mark class="ok">riesce</mark>   T2: CAS <mark class="no">fallisce</mark></div><p class="nota">{{s|s048|}}</p></div>
    <div class="passo"><div class="espr">{{s|s049|}}</div><p class="nota">{{s|s050|}}</p></div>
    <div class="passo"><div class="espr">{{s|s051|}}</div><p class="nota">{{s|s052|}}</p></div>
  </figure>
  <p>{{s|s053|}}</p>
</section>

<section>
  <h2>{{s|s054|}}</h2>
  <div class="colonne">
    <div class="carta buona"><h4>{{s|s055|}}</h4><p>{{s|s056|}}</p></div>
    <div class="carta media"><h4>{{s|s057|}}</h4><p>{{s|s058|}}</p></div>
  </div>
</section>

<section>
  <h2>{{s|s059|}}</h2>
  <div class="box domanda-tua" data-tit="{{a|s060|}}">
    <p>{{s|s061|}}</p>
    <p>{{s|s062|}}</p>
  </div>
  <div class="colonne">
    <div class="carta"><h4>{{s|s063|}}</h4><p>{{s|s064|}}</p></div>
    <div class="carta"><h4>{{s|s065|}}</h4><p>{{s|s066|}}</p></div>
  </div>
  <div class="box basi" data-tit="{{a|s067|}}">
    <p>{{s|s068|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s069|}}">
    <p>{{s|s070|}}</p>
    <ul>
      <li>{{s|s071|}}</li>
      <li>{{s|s072|}}</li>
      <li>{{s|s073|}}</li>
      <li>{{s|s074|}}</li>
    </ul>
  </div>
</section>

<section>
  <h2>{{s|s075|}}</h2>
  <div class="box domanda-tua" data-tit="{{a|s076|}}">
    <p>{{s|s077|}}</p>
    <p>{{s|s078|}}</p>
  </div>
  <p>{{s|s079|}}</p>
  <figure class="passi" data-titolo="{{a|s080|}}" data-legenda="{{a|s081|}}">
    <div class="passo"><div class="espr">due AtomicInteger: lower, upper   stato (0, 5)</div><p class="nota">{{s|s082|}}</p></div>
    <div class="passo"><div class="espr">T1: setLower(4) controlla 4 ≤ upper=5 ✔    T2: setUpper(3) controlla 3 ≥ lower=0 ✔</div><p class="nota">{{s|s083|}}</p></div>
    <div class="passo"><div class="espr">T1 scrive lower=4, T2 scrive upper=3  →  (4, 3)  <mark class="no">lower &gt; upper</mark></div><p class="nota">{{s|s084|}}</p></div>
    <div class="passo"><div class="espr">{{s|s085|}}</div><p class="nota">{{s|s086|}}</p></div>
  </figure>
  <p>{{s|s087|}}</p>
</section>

<section>
  <h2>{{s|s088|}}</h2>
  <div class="box attenzione" data-tit="{{a|s089|}}">
    <p>{{s|s090|}}</p>
    <p>{{s|s091|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s092|}}">
    <p>{{s|s093|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s094|}}</h2>
  <div class="quiz">
    <div class="domanda">
      <p class="q">{{s|s095|}}</p>
      <div class="opzioni"><button>wait-free</button><button data-giusta>lock-free</button><button>nessuna</button></div>
      <div class="perche"><p>{{s|s096|}}</p></div>
    </div>
    <div class="domanda">
      <p class="q">{{s|s097|}}</p>
      <div class="opzioni"><button>è solo wait-free</button><button data-giusta>è anche lock-free e obstruction-free</button><button>non è lock-free</button></div>
      <div class="perche"><p>{{s|s098|}}</p></div>
    </div>
    <div class="domanda">
      <p class="q">{{s|s099|}}</p>
      <div class="opzioni"><button>lock-free</button><button>wait-free</button><button data-giusta>obstruction-free</button></div>
      <div class="perche"><p>{{s|s100|}}</p></div>
    </div>
  </div>
</section>

</main>
</body>
</html>
