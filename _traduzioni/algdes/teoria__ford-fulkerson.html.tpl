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
  <p>{{s|s023|}}</p>
  <figure class="scena" data-scena="ffslow" data-titolo="{{a|s024|}}"></figure>
</section>
<section>
  <h2>{{s|s025|}}</h2>
  <p>{{s|s026|}}</p>
  <p>{{s|s027|}}</p>
</section>
<section>
  <h2>{{s|s028|}}</h2>
<div class="box esame" data-tit="{{a|s029|}}">
<p>{{s|s030|}}</p>
</div>
</section>
<section>
  <h2>{{s|s031|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s032|}}</th><th>{{s|s033|}}</th><th>{{s|s034|}}</th></tr></thead><tbody><tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr><tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr><tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr><tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr></tbody></table></div>
</section>

</main>
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:20});
const A = (id,da,a,t) => ({id,tipo:'arco',da,a,dir:true,t});
const base = {sa:{t:'0/C',tono:'dato'},sb:{t:'0/C',tono:'dato'},at:{t:'0/C',tono:'dato'},bt:{t:'0/C',tono:'dato'},ab:{t:'0/1',tono:'dato'}};
SCENE.ffslow = {
  w: 540, h: 270, lato: true,
  legenda: '{{j|s047|'}}',
  oggetti: [
    N('s',60,130,'s'), N('a',240,50,'a'), N('b',240,210,'b'), N('t',420,130,'t'),
    A('sa','s','a','0/C'), A('sb','s','b','0/C'), A('ab','a','b','0/1'), A('at','a','t','0/C'), A('bt','b','t','0/C'),
    {id:'c',tipo:'testo',x:20,y:260,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s048|'}}', set: Object.assign({}, base, {c:{t:'flusso = 0 · massimo = 2C'}}) },
    { nota: '{{j|s049|'}}', set: {sa:{t:'1/C',tono:'ok'},ab:{t:'1/1',tono:'ok'},bt:{t:'1/C',tono:'ok'},c:{t:'flusso = 1'}} },
    { nota: '{{j|s050|'}}', set: {sa:{tono:'dato'},bt:{tono:'dato'},sb:{t:'1/C',tono:'ok'},ab:{t:'0/1',tono:'no'},at:{t:'1/C',tono:'ok'},c:{t:'flusso = 2'}} },
    { nota: '{{j|s051|'}}', set: {sa:{t:'2/C',tono:'ok'},ab:{t:'1/1',tono:'ok'},bt:{t:'2/C',tono:'ok'},sb:{tono:'dato'},at:{tono:'dato'},c:{t:'flusso = 3 (aumento 3)'}} },
    { nota: '{{j|s052|'}}', set: {sa:{t:'C/C',tono:'ok'},sb:{t:'C/C',tono:'ok'},at:{t:'C/C',tono:'ok'},bt:{t:'C/C',tono:'ok'},ab:{t:'0/1',tono:'dato'},c:{t:'2C aumenti per flusso 2C',tono:'no'}} },
    { nota: '{{j|s053|'}}', set: Object.assign({}, base, {sa:{t:'C/C',tono:'ok'},at:{t:'C/C',tono:'ok'},c:{t:'aumento 1: flusso = C'}}) },
    { nota: '{{j|s054|'}}', set: {sb:{t:'C/C',tono:'ok'},bt:{t:'C/C',tono:'ok'},c:{t:'2 aumenti: flusso = 2C · O(nm²) in generale',tono:'ok'}} }
  ]
};
})();
</script>
</body>
</html>
