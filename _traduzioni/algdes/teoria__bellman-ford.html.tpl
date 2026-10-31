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
const A = (id,da,a,t,extra) => Object.assign({id,tipo:'arco',da,a,dir:true,t},extra||{});
SCENE.bf = {
  w: 520, h: 250, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('s',60,120,'s'), N('a',230,50,'a'), N('b',230,190,'b'), N('c',400,120,'c'),
    A('sa','s','a','4'), A('sb','s','b','5'), A('ab','a','b','−3',{tono:'no'}), A('ac','a','c','2'), A('bc','b','c','6'),
    {id:'c1',tipo:'testo',x:20,y:240,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{s:{tono:'dato',sotto:'0'},a:{sotto:'∞'},b:{sotto:'∞'},c:{sotto:'∞'}} },
    { nota: '{{j|s004|'}}', set:{a:{tono:'ora',sotto:'4'},b:{tono:'ora',sotto:'1'},c1:{t:'giro 1: a=4, b=1'}} },
    { nota: '{{j|s005|'}}', set:{c:{tono:'ok',sotto:'6'},a:{tono:'dato',sotto:'4'},b:{tono:'dato',sotto:'1'},ac:{tono:'ok'},bc:{tono:'ok'},c1:{t:'d: s 0 · a 4 · b 1 · c 6',tono:'ok'}} },
    { nota: '{{j|s006|'}}', set:{c1:{t:'O(n·m); un giro in più scopre i cicli negativi'}} }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s007|}}</h1>
  <p class="lede">{{s|s008|}}</p>
</header>

<section>
  <h2>{{s|s009|}}</h2>
<p>{{s|s010|}}</p>
  <figure class="scena" data-scena="bf" data-titolo="{{a|s011|}}"></figure>
</section>
<section>
  <h2>{{s|s012|}}</h2>
<p>{{s|s013|}}</p>
</section>
<section>
  <h2>{{s|s014|}}</h2>
<p>{{s|s015|}}</p>
</section>
<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
  <p>{{s|s018|}}</p>
</section>
<section>
  <h2>{{s|s019|}}</h2>
<div class="box esame" data-tit="{{a|s020|}}">
<p>{{s|s021|}}</p>
</div>
</section>
<section>
  <h2>{{s|s022|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s023|}}</th><th>{{s|s024|}}</th><th>{{s|s025|}}</th></tr></thead><tbody><tr><td>{{s|s026|}}</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr><tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr><tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
