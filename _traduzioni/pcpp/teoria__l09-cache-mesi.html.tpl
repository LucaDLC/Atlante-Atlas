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
  <figure class="passi" data-titolo="{{a|s007|}}" data-legenda="{{a|s008|}}">
    <div class="passo"><div class="espr">La CPU chiede un <mark class="dato">indirizzo</mark></div><p class="nota">{{s|s009|}}</p></div>
    <div class="passo"><div class="espr">Se è in cache: <mark class="ok">lettura veloce</mark></div><p class="nota">{{s|s010|}}</p></div>
    <div class="passo"><div class="espr">Se non è in cache: <mark class="no">lettura lenta</mark> dalla RAM, e la <mark class="ora">linea</mark> viene copiata in cache</div><p class="nota">{{s|s011|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s012|}}</h2>
  <p>{{s|s013|}}</p>
</section>

<section>
  <h2>{{s|s014|}}</h2>
  <p>{{s|s015|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s016|}}</th><th>{{s|s017|}}</th><th>{{s|s018|}}</th></tr></thead><tbody>
    <tr><td>{{s|s019|}}</td><td>{{s|s020|}}</td><td>{{s|s021|}}</td></tr>
    <tr><td>{{s|s022|}}</td><td>{{s|s023|}}</td><td>{{s|s024|}}</td></tr>
    <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td><td>{{s|s027|}}</td></tr>
    <tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td><td>–</td></tr>
  </tbody></table></div>
  <p>{{s|s030|}}</p>
</section>

<section>
  <h2>{{s|s031|}}</h2>
  <p>{{s|s032|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s033|}}</th><th>{{s|s034|}}</th><th>{{s|s035|}}</th></tr></thead><tbody>
    <tr><td>M o E</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr>
    <tr><td>S</td><td>{{s|s038|}}</td><td>{{s|s039|}}</td></tr>
    <tr><td>I</td><td>{{s|s040|}}</td><td>{{s|s041|}}</td></tr>
    <tr><td>S</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr>
    <tr><td>I</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr>
  </tbody></table></div>
  <figure class="passi" data-titolo="{{a|s046|}}" data-legenda="{{a|s047|}}">
    <div class="passo"><div class="espr">Core 0 <mark class="ora">legge</mark> la linea: stato <mark class="dato">E</mark></div><p class="nota">{{s|s048|}}</p></div>
    <div class="passo"><div class="espr">Core 1 <mark class="ora">legge</mark> la stessa linea: entrambi in <mark class="ok">S</mark></div><p class="nota">{{s|s049|}}</p></div>
    <div class="passo"><div class="espr">Core 0 <mark class="no">scrive</mark>: invalida la copia di core 1 (I), lui passa a <mark class="ora">M</mark></div><p class="nota">{{s|s050|}}</p></div>
    <div class="passo"><div class="espr">Core 1 <mark class="no">rilegge</mark>: la sua copia è I, la prende da core 0 e tutti e due tornano in S</div><p class="nota">{{s|s051|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s052|}}</h2>
  <div class="box idea" data-tit="{{a|s053|}}">{{s|s054|}}</div>
  <div class="box basi" data-tit="{{a|s055|}}">{{s|s056|}}</div>
</section>

</main>
</body>
</html>
