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
SCENE.dfs = {
  w: 520, h: 270, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('s',60,130,'s'), N('a',170,50,'a'), N('b',280,50,'b'), N('c',390,50,'c'), N('d',390,170,'d'), N('e',60,40,'e'),
    A('sa','s','a'), A('ab','a','b'), A('bc','b','c'), A('cd','c','d'), A('da','d','a',{tono:'no'}), A('se','s','e'),
    {id:'lab',tipo:'testo',x:30,y:235,t:'ordine di visita (numero sotto il nodo)',size:12,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: { s:{tono:'ora',sotto:'1'} } },
    { nota: '{{j|s004|'}}', set: { s:{tono:'dato',sotto:'1'}, a:{tono:'dato',sotto:'2'}, b:{tono:'dato',sotto:'3'}, c:{tono:'dato',sotto:'4'}, d:{tono:'ora',sotto:'5'}, sa:{tono:'ok'}, ab:{tono:'ok'}, bc:{tono:'ok'}, cd:{tono:'ok'} } },
    { nota: '{{j|s005|'}}', set: { d:{tono:'dato',sotto:'5'}, a:{tono:'dato',sotto:'2'}, da:{tono:'no'} } },
    { nota: '{{j|s006|'}}', set: { d:{tono:'ok',sotto:'5'}, c:{tono:'ok',sotto:'4'}, b:{tono:'ok',sotto:'3'}, a:{tono:'ok',sotto:'2'}, da:{tono:null} } },
    { nota: '{{j|s007|'}}', set: { s:{tono:'ora',sotto:'1'}, e:{tono:'ora',sotto:'6'}, se:{tono:'ok'} } }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t,tono) => ({id,tipo:'nodo',x,y,t,r:20,tono});
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:false});
SCENE.compon = {
  w: 520, h: 210, lato: true,
  legenda: '{{j|s008|'}}',
  oggetti: [
    N('a',60,60,'a'), N('b',150,60,'b'), N('c',105,130,'c'),
    N('d',300,60,'d'), N('e',390,60,'e'),
    N('f',350,150,'f'),
    A('ab','a','b'), A('bc','b','c'), A('ca','c','a'), A('de','d','e'), A('ef','e','f'),
    {id:'t1',tipo:'testo',x:300,y:200,t:'',size:12,bold:true}
  ],
  passi: [
    { nota: '{{j|s009|'}}', set: { a:{tono:'dato'}, b:{tono:'dato'}, c:{tono:'dato'}, t1:{t:'componente 1: {a, b, c}'} } },
    { nota: '{{j|s010|'}}', set: { d:{tono:'ora'}, e:{tono:'ora'}, f:{tono:'ora'}, t1:{t:'componente 2: {d, e, f}'} } },
    { nota: '{{j|s011|'}}', set: { d:{tono:'dato'}, e:{tono:'dato'}, f:{tono:'dato'}, t1:{t:'2 componenti, O(n + m)',tono:'ok'} } }
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
  <figure class="scena" data-scena="dfs" data-titolo="{{a|s017|}}"></figure>
</section>
<section>
  <h2>{{s|s018|}}</h2>
<p>{{s|s019|}}</p>
<p>{{s|s020|}}</p>
<div class="box attenzione" data-tit="{{a|s021|}}"><p>{{s|s022|}}</p></div>
</section>
<section>
  <h2>{{s|s023|}}</h2>
<p>{{s|s024|}}</p>
  <figure class="scena" data-scena="compon" data-titolo="{{a|s025|}}"></figure>
</section>
<section>
  <h2>{{s|s026|}}</h2>
<p>{{s|s027|}}</p>
<p>{{s|s028|}}</p>
</section>
<section>
  <h2>{{s|s029|}}</h2>
  <p>{{s|s030|}}</p>
  <p>{{s|s031|}}</p>
</section>
<section>
  <h2>{{s|s032|}}</h2>
<div class="box esame" data-tit="{{a|s033|}}">
<p>{{s|s034|}}</p>
<p>{{s|s035|}}</p>
</div>
</section>
<section>
  <h2>{{s|s036|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s037|}}</th><th>{{s|s038|}}</th><th>{{s|s039|}}</th></tr></thead><tbody><tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr><tr><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr><tr><td>{{s|s046|}}</td><td>O(n + m)</td><td>{{s|s047|}}</td></tr><tr><td>{{s|s048|}}</td><td>{{s|s049|}}</td><td>{{s|s050|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
