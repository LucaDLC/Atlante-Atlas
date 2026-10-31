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
  <p>{{s|s007|}}</p>
  <figure class="passi" data-titolo="{{a|s008|}}" data-legenda="{{a|s009|}}">
    <div class="passo"><div class="espr">Thread 0 scrive: la linea è in <mark class="ora">M</mark> nella cache del core 0</div><p class="nota">{{s|s010|}}</p></div>
    <div class="passo"><div class="espr">Thread 1 scrive lo stesso dato: il core 1 <mark class="no">invalida</mark> la copia di core 0</div><p class="nota">{{s|s011|}}</p></div>
    <div class="passo"><div class="espr">Thread 0 scrive di nuovo: la linea torna da core 1, <mark class="no">e così via</mark></div><p class="nota">{{s|s012|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s013|}}</h2>
  <p>{{s|s014|}}</p>
  <ul>
    <li>{{s|s015|}}</li>
    <li>{{s|s016|}}</li>
  </ul>
  <p>{{s|s017|}}</p>
</section>

<section>
  <h2>{{s|s018|}}</h2>
  <p>{{s|s019|}}</p>
  <figure class="passi" data-titolo="{{a|s020|}}" data-legenda="{{a|s021|}}">
    <div class="passo"><div class="espr">Thread A scrive il contatore <mark class="dato">a</mark>, Thread B il contatore <mark class="dato">b</mark>: stessa linea</div><p class="nota">{{s|s022|}}</p></div>
    <div class="passo"><div class="espr">Ogni scrittura di A <mark class="no">invalida</mark> la copia di B, e viceversa</div><p class="nota">{{s|s023|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">Soluzione</mark>: <mark class="ok">padding</mark>, cioè spazio vuoto tra i dati, così ognuno sta su una linea propria</div><p class="nota">{{s|s024|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s025|}}</h2>
  <p>{{s|s026|}}</p>
  <div class="box attenzione" data-tit="{{a|s027|}}">{{s|s028|}}</div>
</section>

</main>
</body>
</html>
