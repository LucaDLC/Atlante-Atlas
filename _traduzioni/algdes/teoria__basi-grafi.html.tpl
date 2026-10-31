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
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:20});
const A = (id,da,a,extra) => Object.assign({id,tipo:'arco',da,a,dir:false},extra||{});
SCENE.grbase = {
  w: 520, h: 230, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('a',70,60,'a'), N('b',200,40,'b'), N('c',330,60,'c'), N('d',120,160,'d'), N('e',280,160,'e'),
    A('ab','a','b'), A('bc','b','c'), A('ad','a','d'), A('be','b','e'), A('ce','c','e'), A('de','d','e'),
    {id:'c1',tipo:'testo',x:260,y:30,t:'',size:13,bold:true}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: {} },
    { nota: '{{j|s004|'}}', set: { a:{tono:'dato'}, b:{tono:'dato'}, c:{tono:'dato'}, d:{tono:'dato'}, e:{tono:'dato'}, c1:{t:'n = 5'} } },
    { nota: '{{j|s005|'}}', set: { ab:{tono:'ok'}, bc:{tono:'ok'}, ad:{tono:'ok'}, be:{tono:'ok'}, ce:{tono:'ok'}, de:{tono:'ok'}, c1:{t:'m = 6'} } },
    { nota: '{{j|s006|'}}', set: { ab:{tono:null}, bc:{tono:null}, ad:{tono:null}, be:{tono:null}, ce:{tono:null}, de:{tono:null}, b:{tono:'ora', sotto:'grado 3'}, c1:{t:'grado(b) = 3'} } }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:18});
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:false});
SCENE.grstrutture = {
  w: 520, h: 230, lato: true,
  legenda: '{{j|s007|'}}',
  oggetti: [
    N('a',60,50,'a'), N('b',170,50,'b'), N('c',280,50,'c'), N('d',115,170,'d'),
    A('ab','a','b'), A('bc','b','c'), A('ad','a','d'), A('bd','b','d'),
    {id:'la',tipo:'testo',x:340,y:95,t:'lista di adiacenza:',size:12,bold:true,anchor:'start'},
    {id:'l1',tipo:'testo',x:340,y:118,t:'a: b, d',size:12,anchor:'start'},
    {id:'l2',tipo:'testo',x:340,y:138,t:'b: a, c, d',size:12,anchor:'start'},
    {id:'l3',tipo:'testo',x:340,y:158,t:'c: b',size:12,anchor:'start'},
    {id:'l4',tipo:'testo',x:340,y:178,t:'d: a, b',size:12,anchor:'start'},
    {id:'c1',tipo:'testo',x:290,y:215,t:'',size:12,bold:true}
  ],
  passi: [
    { nota: '{{j|s008|'}}', set: {} },
    { nota: '{{j|s009|'}}', set: { b:{tono:'ora'}, l2:{tono:'ora'}, c1:{t:'vicini di b: a, c, d'} } },
    { nota: '{{j|s010|'}}', set: { a:{tono:'ok'}, d:{tono:'ok'}, l1:{tono:'ok'}, c1:{t:'a–d: sì, costo = grado(a)'} } },
    { nota: '{{j|s011|'}}', set: { a:{tono:null}, d:{tono:null}, b:{tono:null}, l1:{tono:null}, l2:{tono:null}, c1:{t:'matrice: O(1) per arco, O(n²) spazio'} } }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s012|}}</h1>
  <p class="lede">{{s|s013|}}</p>
</header>

<section>
  <h2>{{s|s014|}}</h2>
<p>{{s|s015|}}</p>
<p>{{s|s016|}}</p>
<div class="box regola" data-tit="{{a|s017|}}"><p>{{s|s018|}}</p></div>
  <figure class="scena" data-scena="grbase" data-titolo="{{a|s019|}}"></figure>
</section>
<section>
  <h2>{{s|s020|}}</h2>
<p>{{s|s021|}}</p>
<ul>
  <li>{{s|s022|}}</li>
  <li>{{s|s023|}}</li>
</ul>
<p>{{s|s024|}}</p>
  <figure class="scena" data-scena="grstrutture" data-titolo="{{a|s025|}}"></figure>
</section>
<section>
  <h2>{{s|s026|}}</h2>
  <p>{{s|s027|}}</p>
  <p>{{s|s028|}}</p>
</section>
<section>
  <h2>{{s|s029|}}</h2>
<div class="box esame" data-tit="{{a|s030|}}"><p>{{s|s031|}}</p></div>
</section>
<section>
  <h2>{{s|s032|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s033|}}</th><th>{{s|s034|}}</th><th>{{s|s035|}}</th></tr></thead><tbody><tr><td>n</td><td>{{s|s036|}}</td><td>|V|</td></tr><tr><td>m</td><td>{{s|s037|}}</td><td>|E|</td></tr><tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr><tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr><tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
