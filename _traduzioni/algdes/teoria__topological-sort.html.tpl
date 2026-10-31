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
const N = (id,x,y,t,sotto) => ({id,tipo:'nodo',x,y,t,r:20,sotto});
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:true});
SCENE.topo = {
  w: 520, h: 250, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('a',50,60,'a','in 0'), N('b',50,190,'b','in 0'), N('c',200,120,'c','in 2'), N('e',340,60,'e','in 1'), N('d',340,190,'d','in 2'),
    A('ac','a','c'), A('bc','b','c'), A('ae','a','e'), A('cd','c','d'), A('ed','e','d'),
    {id:'ord',tipo:'testo',x:260,y:240,t:'ordine: ',size:13,bold:true}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: {} },
    { nota: '{{j|s004|'}}', set: { a:{tono:'dato'}, b:{tono:'dato'} } },
    { nota: '{{j|s005|'}}', set: { a:{tono:'ok'}, c:{tono:null,sotto:'in 1'}, e:{tono:'dato',sotto:'in 0'}, ord:{t:'ordine: a'} } },
    { nota: '{{j|s006|'}}', set: { b:{tono:'ok'}, c:{tono:'dato',sotto:'in 0'}, ord:{t:'ordine: a, b'} } },
    { nota: '{{j|s007|'}}', set: { e:{tono:'ok'}, c:{tono:'dato',sotto:'in 0'}, d:{tono:'dato',sotto:'in 0'}, ord:{t:'ordine: a, b, e, c'} } },
    { nota: '{{j|s008|'}}', set: { d:{tono:'ok'}, ord:{t:'ordine: a, b, e, c, d',tono:'ok'} } }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s009|}}</h1>
  <p class="lede">{{s|s010|}}</p>
</header>

<section>
  <h2>{{s|s011|}}</h2>
<p>{{s|s012|}}</p>
<p>{{s|s013|}}</p>
</section>
<section>
  <h2>{{s|s014|}}</h2>
<p>{{s|s015|}}</p>
<ol>
  <li>{{s|s016|}}</li>
  <li>{{s|s017|}}</li>
  <li>{{s|s018|}}</li>
  <li>{{s|s019|}}</li>
</ol>
<p>{{s|s020|}}</p>
  <figure class="scena" data-scena="topo" data-titolo="{{a|s021|}}"></figure>
</section>
<section>
  <h2>{{s|s022|}}</h2>
<p>{{s|s023|}}</p>
<div class="box regola" data-tit="{{a|s024|}}"><p>{{s|s025|}}</p></div>
</section>
<section>
  <h2>{{s|s026|}}</h2>
<p>{{s|s027|}}</p>
</section>
<section>
  <h2>{{s|s028|}}</h2>
  <p>{{s|s029|}}</p>
  <p>{{s|s030|}}</p>
</section>
<section>
  <h2>{{s|s031|}}</h2>
<div class="box esame" data-tit="{{a|s032|}}">
<p>{{s|s033|}}</p>
</div>
</section>
<section>
  <h2>{{s|s034|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s035|}}</th><th>{{s|s036|}}</th><th>{{s|s037|}}</th></tr></thead><tbody><tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr><tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr><tr><td>{{s|s044|}}</td><td>O(n + m)</td><td>{{s|s045|}}</td></tr><tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
