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
SCENE.ff = {
  w: 540, h: 260, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('s',60,130,'s'), N('a',240,50,'a'), N('b',240,210,'b'), N('t',420,130,'t'),
    A('sa','s','a','0/1'), A('sb','s','b','0/1'), A('ab','a','b','0/1'), A('at','a','t','0/1'), A('bt','b','t','0/1'),
    {id:'c1',tipo:'testo',x:20,y:250,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{sa:{tono:'dato'},sb:{tono:'dato'},ab:{tono:'dato'},at:{tono:'dato'},bt:{tono:'dato'},c1:{t:'flusso = 0'}} },
    { nota: '{{j|s004|'}}', set:{sa:{t:'1/1',tono:'ok'},ab:{t:'1/1',tono:'ok'},bt:{t:'1/1',tono:'ok'},c1:{t:'flusso = 1'}} },
    { nota: '{{j|s005|'}}', set:{ab:{tono:'no'},c1:{t:'residuo: b → a (disfa a → b)'}} },
    { nota: '{{j|s006|'}}', set:{sb:{t:'1/1',tono:'ok'},ab:{t:'0/1',tono:'no'},at:{t:'1/1',tono:'ok'},bt:{t:'1/1',tono:'ok'},c1:{t:'flusso = 2',tono:'ok'}} },
    { nota: '{{j|s007|'}}', set:{c1:{t:'flusso massimo = 2',tono:'ok'}} }
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
</section>
<section>
  <h2>{{s|s012|}}</h2>
<p>{{s|s013|}}</p>
</section>
<section>
  <h2>{{s|s014|}}</h2>
<p>{{s|s015|}}</p>
  <figure class="scena" data-scena="ff" data-titolo="{{a|s016|}}"></figure>
</section>
<section>
  <h2>{{s|s017|}}</h2>
<p>{{s|s018|}}</p>
<p>{{s|s019|}}</p>
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
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s027|}}</th><th>{{s|s028|}}</th><th>{{s|s029|}}</th></tr></thead><tbody><tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr><tr><td>{{s|s033|}}</td><td>{{s|s034|}}</td><td>{{s|s035|}}</td></tr><tr><td>{{s|s036|}}</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr><tr><td>{{s|s039|}}</td><td>{{s|s040|}}</td><td>{{s|s041|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
