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
  <figure class="passi" data-titolo="{{a|s006|}}">
    <div class="passo"><div class="espr"><mark class="dato">1. definisci</mark> i termini della domanda</div><p class="nota">{{s|s007|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">2. esempio piccolo</mark>: il contatore con due thread</div><p class="nota">{{s|s008|}}</p></div>
    <div class="passo"><div class="espr"><mark class="due">3. il meccanismo</mark>: interleaving o happens-before</div><p class="nota">{{s|s009|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">4. conclusione</mark> legata alla domanda</div><p class="nota">{{s|s010|}}</p></div>
    <div class="passo"><div class="espr"><mark class="no">5. il limite</mark></div><p class="nota">{{s|s011|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s012|}}</h2>
  <p>{{s|s013|}}</p>
  <figure class="passi" data-titolo="{{a|s014|}}">
    <div class="passo"><div class="espr">qual è la <mark class="dato">sezione critica</mark></div><p class="nota">{{s|s015|}}</p></div>
    <div class="passo"><div class="espr">il lock dà <mark class="ok">mutua esclusione</mark></div><p class="nota">{{s|s016|}}</p></div>
    <div class="passo"><div class="espr">quali <mark class="no">interleaving</mark> diventano impossibili</div><p class="nota">{{s|s017|}}</p></div>
    <div class="passo"><div class="espr">quindi <mark class="ok">l'unico output possibile</mark> è…</div><p class="nota">{{s|s018|}}</p></div>
  </figure>
  <div class="box inglese" data-tit="{{a|s019|}}">
    <p>{{s|s020|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
  <ul>
    <li>{{s|s023|}}</li>
    <li>{{s|s024|}}</li>
  </ul>
  <div class="box inglese" data-tit="{{a|s025|}}">
    <p>{{s|s026|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
  <figure class="passi" data-titolo="{{a|s029|}}">
    <div class="passo"><div class="espr">1. numera le operazioni e <mark class="dato">classifica le azioni</mark></div><p class="nota">{{s|s030|}}</p></div>
    <div class="passo"><div class="espr">2. <mark class="dato">program order</mark> di ogni thread</div><p class="nota">{{s|s031|}}</p></div>
    <div class="passo"><div class="espr">3. <mark class="ora">synchronization order</mark> possibili</div><p class="nota">{{s|s032|}}</p></div>
    <div class="passo"><div class="espr">4. insiemi <mark class="ora">happens-before</mark>: PO ∪ start ∪ termination ∪ monitor ∪ volatile, chiusura transitiva</div><p class="nota">{{s|s033|}}</p></div>
    <div class="passo"><div class="espr">5. <mark class="due">coppie in conflitto</mark>: stessa variabile non volatile, almeno una scrittura</div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">6. ogni coppia è ordinata in ogni HB? <mark class="ok">sì → nessuna data race</mark> · <mark class="no">no → data race</mark></div><p class="nota">{{s|s035|}}</p></div>
  </figure>
  <div class="box inglese" data-tit="{{a|s036|}}">
    <p>{{s|s037|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s038|}}</h2>
  <p>{{s|s039|}}</p>
  <div class="box inglese" data-tit="{{a|s040|}}">
    <p>{{s|s041|}}</p>
  </div>
  <p>{{s|s042|}}</p>
</section>

<section>
  <h2>{{s|s043|}}</h2>
  <p>{{s|s044|}}</p>
  <div class="box inglese" data-tit="{{a|s045|}}">
    <p>{{s|s046|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s047|}}</h2>
  <p>{{s|s048|}}</p>
  <ul>
    <li>{{s|s049|}}</li>
    <li>{{s|s050|}}</li>
    <li>{{s|s051|}}</li>
  </ul>
</section>

<section>
  <h2>{{s|s052|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s053|}}</th><th>{{s|s054|}}</th><th>{{s|s055|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s056|}}</td><td>{{s|s057|}}</td><td>{{s|s058|}}</td></tr>
      <tr><td>{{s|s059|}}</td><td>{{s|s060|}}</td><td>{{s|s061|}}</td></tr>
      <tr><td>{{s|s062|}}</td><td>{{s|s063|}}</td><td>{{s|s064|}}</td></tr>
      <tr><td>{{s|s065|}}</td><td>{{s|s066|}}</td><td>{{s|s067|}}</td></tr>
      <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td></tr>
      <tr><td>{{s|s071|}}</td><td>{{s|s072|}}</td><td>{{s|s073|}}</td></tr>
    </tbody>
  </table></div>
</section>

</main>
</body>
</html>
