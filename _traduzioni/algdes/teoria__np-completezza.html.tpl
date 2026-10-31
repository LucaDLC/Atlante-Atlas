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
const N = (id,x,y,t,tono) => ({id,tipo:'nodo',x,y,t,r:20,tono});
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:false,tono:'spento'});
SCENE.np = {
  w: 540, h: 260, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('a',80,60,'a','spento'), N('b',230,60,'b','spento'), N('c',380,60,'c','spento'), N('d',155,190,'d','spento'), N('e',305,190,'e','spento'),
    A('ab','a','b'), A('bc','b','c'), A('ad','a','d'), A('bd','b','d'), A('be','b','e'), A('ce','c','e'), A('de','d','e'),
    {id:'c1',tipo:'testo',x:20,y:250,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{b:{tono:'dato'},d:{tono:'dato'},c1:{t:'certificato: {b, d}'}} },
    { nota: '{{j|s004|'}}', set:{ab:{tono:'ok'},bc:{tono:'ok'},ad:{tono:'ok'},bd:{tono:'ok'},be:{tono:'ok'},de:{tono:'ok'},ce:{tono:'no'},c1:{t:'ce non è coperto: il certificato è sbagliato',tono:'no'}} },
    { nota: '{{j|s005|'}}', set:{d:{tono:'no'},e:{tono:'dato'},ab:{tono:'ok'},bc:{tono:'ok'},ad:{tono:'ok'},bd:{tono:'ok'},be:{tono:'ok'},ce:{tono:'ok'},de:{tono:'ok'},c1:{t:'{b, e} copre tutti gli archi: sì',tono:'ok'}} }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s006|}}</h1>
  <p class="lede">{{s|s007|}}</p>
</header>

<section>
  <h2>{{s|s008|}}</h2>
<p>{{s|s009|}}</p>
<p>{{s|s010|}}</p>
<p>{{s|s011|}}</p>
<p>{{s|s012|}}</p>
<div class="box attenzione" data-tit="{{a|s013|}}"><p>{{s|s014|}}</p></div>
</section>
<section>
  <h2>{{s|s015|}}</h2>
<p>{{s|s016|}}</p>
<div class="box attenzione" data-tit="{{a|s017|}}"><p>{{s|s018|}}</p></div>
  <figure class="scena" data-scena="np" data-titolo="{{a|s019|}}"></figure>
</section>
<section>
  <h2>{{s|s020|}}</h2>
<p>{{s|s021|}}</p>
<p>{{s|s022|}}</p>
</section>
<section>
  <h2>{{s|s023|}}</h2>
<div class="box esame" data-tit="{{a|s024|}}">
<p>{{s|s025|}}</p>
</div>
</section>
<section>
  <h2>{{s|s026|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s027|}}</th><th>{{s|s028|}}</th><th>{{s|s029|}}</th></tr></thead><tbody><tr><td>P</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr><tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr><tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr><tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
