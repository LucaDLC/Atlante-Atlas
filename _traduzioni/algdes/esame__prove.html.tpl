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
    <thead><tr><th>{{s|s006|}}</th><th>{{s|s007|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s008|}}</td><td>{{s|s009|}}</td></tr>
      <tr><td>{{s|s010|}}</td><td>{{s|s011|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s012|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s013|}}</th><th>{{s|s014|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s015|}}</td><td>{{s|s016|}}</td></tr>
      <tr><td>{{s|s017|}}</td><td>{{s|s018|}}</td></tr>
      <tr><td>{{s|s019|}}</td><td>{{s|s020|}}</td></tr>
      <tr><td>{{s|s021|}}</td><td>{{s|s022|}}</td></tr>
      <tr><td>{{s|s023|}}</td><td>{{s|s024|}}</td></tr>
      <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>

  <h3>{{s|s029|}}</h3>
  <p>{{s|s030|}}</p>
  <figure class="passi" data-titolo="{{a|s031|}}">
    <div class="passo"><div class="espr">4 4<br>1111<br>1110<br>0011<br>0001</div><p class="nota">{{s|s032|}}</p></div>
    <div class="passo"><div class="espr">Gordon: <mark class="ora">1111</mark> (4 uni, l'unica con 4)</div><p class="nota">{{s|s033|}}</p></div>
    <div class="passo"><div class="espr">da 1111 si scende in 1110 (3), 0011 (2), 0001 (1): prende <mark class="ora">1110</mark></div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">da 1110: 0011 e 0001 hanno un 1 in ultima posizione, dove 1110 ha 0 ⇒ <mark class="no">nessuna</mark></div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">ottimo: <mark class="ok">1111, 0011, 0001</mark>, lunghezza 3</div><p class="nota">{{s|s036|}}</p></div>
  </figure>

  <h3>{{s|s037|}}</h3>
  <p>{{s|s038|}}</p>

  <h3>{{s|s039|}}</h3>
  <p>{{s|s040|}}</p>

  <h3>{{s|s041|}}</h3>
  <figure class="passi" data-titolo="{{a|s042|}}">
    <div class="passo"><div class="espr">ordino per numero di 1 <mark class="dato">decrescente</mark>: x₁, …, x<sub>N</sub></div><p class="nota">{{s|s043|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">OPT(i)</mark> = lunghezza della sequenza più lunga che <b>finisce</b> con xᵢ,  i ∈ {1, …, N}</div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">OPT(i) = 1 + max { OPT(j) : j &lt; i, xⱼ si decrementa in xᵢ },   <mark class="due">OPT(i) = 1</mark> se nessun j</div><p class="nota">{{s|s045|}}</p></div>
    <div class="passo"><div class="espr">risposta: <mark class="ok">max<sub>i</sub> OPT(i)</mark>; tempo O(N²K), spazio O(N)</div><p class="nota">{{s|s046|}}</p></div>
  </figure>

  <h3>{{s|s047|}}</h3>
  <p>{{s|s048|}}</p>

  <h3>{{s|s049|}}</h3>
  <p>{{s|s050|}}</p>
</section>

<section>
  <h2>{{s|s051|}}</h2>
  <ul>
    <li>{{s|s052|}}</li>
    <li>{{s|s053|}}</li>
    <li>{{s|s054|}}</li>
  </ul>
  <div class="box domanda-tua" data-tit="{{a|s055|}}">
    <p>{{s|s056|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s057|}}</h2>
  <p>{{s|s058|}}</p>
  <ul>
    <li>{{s|s059|}}</li>
    <li>{{s|s060|}}</li>
  </ul>
  <p>{{s|s061|}}</p>
  <p>{{s|s062|}}</p>
  <div class="box regola" data-tit="{{a|s063|}}">{{s|s064|}}</div>
</section>
<section>
  <h2>{{s|s065|}}</h2>
  <p>{{s|s066|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s067|}}</th><th>{{s|s068|}}</th></tr></thead><tbody>
    <tr><td>{{s|s069|}}</td><td>{{s|s070|}}</td></tr>
    <tr><td>{{s|s071|}}</td><td>{{s|s072|}}</td></tr>
    <tr><td>{{s|s073|}}</td><td>{{s|s074|}}</td></tr>
  </tbody></table></div>
  <p>{{s|s075|}}</p>
  <p>{{s|s076|}}</p>
  <div class="box attenzione" data-tit="{{a|s077|}}">{{s|s078|}}</div>
  <p>{{s|s079|}}</p>
</section>
</main>
</body>
</html>
