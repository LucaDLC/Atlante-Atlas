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
const A = (id,da,a,t) => ({id,tipo:'arco',da,a,dir:false,t});
SCENE.dij = {
  w: 520, h: 270, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('s',60,130,'s'), N('a',230,50,'a'), N('b',230,210,'b'), N('c',400,130,'c'),
    A('sa','s','a','2'), A('sb','s','b','5'), A('ab','a','b','1'), A('ac','a','c','4'), A('bc','b','c','1'),
    {id:'c1',tipo:'testo',x:20,y:28,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{ s:{tono:'dato',sotto:'d=0'}, a:{sotto:'d=∞'}, b:{sotto:'d=∞'}, c:{sotto:'d=∞'}, c1:{t:'coda: s(0) a(∞) b(∞) c(∞)'} } },
    { nota: '{{j|s004|'}}', set:{ s:{tono:'ok',sotto:'d=0'}, sa:{tono:'ok'}, sb:{tono:'ok'}, a:{tono:'dato',sotto:'d=2'}, b:{tono:'dato',sotto:'d=5'}, c1:{t:'fissati: s · coda: a(2) b(5) c(∞)'} } },
    { nota: '{{j|s005|'}}', set:{ a:{tono:'ora',sotto:'d=2'}, ab:{tono:'ok'}, ac:{tono:'ok'}, b:{tono:'dato',sotto:'d=3'}, c:{tono:'dato',sotto:'d=6'}, c1:{t:'fissati: s, a · coda: b(3) c(6)'} } },
    { nota: '{{j|s006|'}}', set:{ b:{tono:'ora',sotto:'d=3'}, bc:{tono:'ok'}, c:{tono:'dato',sotto:'d=4'}, c1:{t:'fissati: s, a, b · coda: c(4)'} } },
    { nota: '{{j|s007|'}}', set:{ c:{tono:'ok',sotto:'d=4'}, a:{tono:'ok',sotto:'d=2'}, b:{tono:'ok',sotto:'d=3'}, c1:{t:'d: s 0 · a 2 · b 3 · c 4',tono:'ok'} } }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s008|}}</h1>
  <p class="lede">{{s|s009|}}</p>
</header>

<section>
  <h2>{{s|s010|}}</h2>
<p>{{s|s011|}}</p>
<p>{{s|s012|}}</p>
  <figure class="scena" data-scena="dij" data-titolo="{{a|s013|}}"></figure>
</section>
<section>
  <h2>{{s|s014|}}</h2>
<p>{{s|s015|}}</p>
<p>{{s|s016|}}</p>
<p>{{s|s017|}}</p>
</section>
<section>
  <h2>{{s|s018|}}</h2>
<p>{{s|s019|}}</p>
<div class="box attenzione" data-tit="{{a|s020|}}"><p>{{s|s021|}}</p></div>
</section>
<section>
  <h2>{{s|s022|}}</h2>
<p>{{s|s023|}}</p>
</section>
<section>
  <h2>{{s|s024|}}</h2>
  <p>{{s|s025|}}</p>
  <p>{{s|s026|}}</p>
</section>
<section>
  <h2>{{s|s027|}}</h2>
<div class="box esame" data-tit="{{a|s028|}}">
<p>{{s|s029|}}</p>
<p>{{s|s030|}}</p>
</div>
</section>
<section>
  <h2>{{s|s031|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s032|}}</th><th>{{s|s033|}}</th><th>{{s|s034|}}</th></tr></thead><tbody><tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr><tr><td>d(v)</td><td>{{s|s038|}}</td><td>{{s|s039|}}</td></tr><tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr><tr><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
