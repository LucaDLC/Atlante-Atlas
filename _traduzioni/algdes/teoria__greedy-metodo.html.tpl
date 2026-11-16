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
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t,tono) => ({id,tipo:'rett',x,y,w:58,h:34,t,tono});
SCENE.exch = {
  w: 540, h: 230, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    {id:'l1',tipo:'testo',x:20,y:60,t:'ottimo O',size:12,bold:true,anchor:'start'},
    {id:'l2',tipo:'testo',x:20,y:150,t:'greedy G',size:12,bold:true,anchor:'start'},
    N('o1',110,40,'1','dato'), N('o2',180,40,'2','dato'), N('o3',250,40,'4','dato'),
    N('g1',110,130,'1','dato'), N('g2',180,130,'2','dato'), N('g3',250,130,'3','dato'),
    {id:'x',tipo:'testo',x:440,y:60,t:'',size:12,bold:true},
    {id:'c',tipo:'testo',x:20,y:210,t:'',size:13,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: "Scelgo 3 elementi di costo totale minimo. I numeri nei riquadri sono i <b>costi</b>. Il greedy G prende sempre il più economico rimasto: 1, 2, 3. Prendo una soluzione ottima <b>O</b> qualsiasi: qui O = {1, 2, 4}.", set: {c:{t:'costo G = 6 · costo O = 7'}} },
    { nota: "Guardo O e G in ordine di costo. Le prime due scelte coincidono (1 e 2). La <b>prima differenza</b> è la terza: G ha 3, O ha 4.", set: { o3:{tono:'ora'}, g3:{tono:'ora'}, c:{t:'prima differenza: G prende 3, O prende 4'} } },
    { nota: "Scambio in O il 4 con il 3: O' = O − {4} + {3}. Il numero di elementi non cambia e 3 non costa più di 4 (il greedy ha preso il più economico rimasto), quindi O' è valido e <b>non costa di più</b>: 6 ≤ 7.", set: { o3:{t:'3',tono:'ok'}, g3:{tono:'dato'}, x:{t:"O' = G",tono:'ok'}, c:{t:"O' = {1, 2, 3}: costo 6 ≤ 7",tono:'ok'} } },
    { nota: "Ripeto per ogni differenza: a ogni scambio O si avvicina a G e non peggiora. Alla fine O' = G, e G costa quanto un ottimo: <b>il greedy è ottimo</b>. È l'exchange argument (argomento di scambio).", set: { c:{t:"ogni scambio: valida e non peggiore, fino a O' = G",tono:'ok'} } }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s003|}}</h1>
  <p class="lede">{{s|s004|}}</p>
</header>

<section>
  <h2>{{s|s005|}}</h2>
<p>{{s|s006|}}</p>
<ol>
  <li>{{s|s007|}}</li>
  <li>{{s|s008|}}</li>
</ol>
<p>{{s|s009|}}</p>
<p>{{s|s010|}}</p>
</section>
<section>
  <h2>{{s|s011|}}</h2>
<p>{{s|s012|}}</p>
<ol>
  <li>{{s|s013|}}</li>
  <li>{{s|s014|}}</li>
  <li>{{s|s015|}}</li>
  <li>{{s|s016|}}</li>
</ol>
<div class="box regola" data-tit="{{a|s017|}}"><p>{{s|s018|}}</p></div>
  <figure class="scena" data-scena="exch" data-titolo="{{a|s019|}}"></figure>
</section>
<section>
  <h2>{{s|s020|}}</h2>
<p>{{s|s021|}}</p>
<p>{{s|s022|}}</p>
</section>
<section>
  <h2>{{s|s023|}}</h2>
<p>{{s|s024|}}</p>
<p>{{s|s025|}}</p>
</section>
<section>
  <h2>{{s|s026|}}</h2>
<div class="box esame" data-tit="{{a|s027|}}">
<p>{{s|s028|}}</p>
<p>{{s|s029|}}</p>
</div>
</section>
<section>
  <h2>{{s|s030|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s031|}}</th><th>{{s|s032|}}</th><th>{{s|s033|}}</th></tr></thead><tbody><tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr><tr><td>{{s|s037|}}</td><td>{{s|s038|}}</td><td>{{s|s039|}}</td></tr><tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr><tr><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
