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
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:false});
const Q = v => ({id:'q',tipo:'celle',x:120,y:218,cw:44,ch:30,valori:v,indici:false});
SCENE.bfs = {
  w: 520, h: 270, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('s',60,70,'s'), N('a',170,30,'a'), N('b',170,110,'b'), N('c',280,30,'c'), N('d',280,110,'d'), N('e',390,70,'e'),
    A('sa','s','a'), A('sb','s','b'), A('ac','a','c'), A('bd','b','d'), A('ce','c','e'), A('de','d','e'),
    {id:'lab',tipo:'testo',x:20,y:236,t:'coda',size:12,bold:true,anchor:'start'},
    Q(['s'])
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: { s:{tono:'dato',sotto:'d=0'}, q:{valori:['s'],toni:{0:'dato'}} } },
    { nota: '{{j|s004|'}}', set: { s:{tono:'ora',sotto:'d=0'}, a:{tono:'ok',sotto:'d=1'}, b:{tono:'ok',sotto:'d=1'}, sa:{tono:'ok'}, sb:{tono:'ok'}, q:{valori:['a','b'],toni:{0:'dato',1:'dato'}} } },
    { nota: '{{j|s005|'}}', set: { s:{tono:null,sotto:'d=0'}, a:{tono:'ora',sotto:'d=1'}, c:{tono:'ok',sotto:'d=2'}, ac:{tono:'ok'}, q:{valori:['b','c'],toni:{0:'dato',1:'dato'}} } },
    { nota: '{{j|s006|'}}', set: { a:{tono:'ok',sotto:'d=1'}, b:{tono:'ora',sotto:'d=1'}, d:{tono:'ok',sotto:'d=2'}, bd:{tono:'ok'}, q:{valori:['c','d'],toni:{0:'dato',1:'dato'}} } },
    { nota: '{{j|s007|'}}', set: { b:{tono:'ok',sotto:'d=1'}, c:{tono:'ora',sotto:'d=2'}, e:{tono:'ok',sotto:'d=3'}, ce:{tono:'ok'}, q:{valori:['d','e'],toni:{0:'dato',1:'dato'}} } },
    { nota: '{{j|s008|'}}', set: { c:{tono:'ok',sotto:'d=2'}, d:{tono:'ora',sotto:'d=2'}, de:{tono:'ok'}, q:{valori:['e'],toni:{0:'dato'}} } },
    { nota: '{{j|s009|'}}', set: { d:{tono:'ok',sotto:'d=2'}, e:{tono:'ok',sotto:'d=3'}, q:{valori:['vuota'],toni:{}} } }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t,tono) => ({id,tipo:'nodo',x,y,t,r:20,tono});
const A = (id,da,a,extra) => Object.assign({id,tipo:'arco',da,a,dir:false},extra||{});
SCENE.bip = {
  w: 520, h: 230, lato: true,
  legenda: '{{j|s010|'}}',
  oggetti: [
    N('a',120,40,'a'), N('b',60,160,'b'), N('c',180,160,'c'), N('d',330,100,'d'),
    A('ab','a','b'), A('ac','a','c'), A('bc','b','c',{tono:'no',nascosto:true}), A('ad','a','d'),
    {id:'t1',tipo:'testo',x:320,y:40,t:'',size:12,bold:true}
  ],
  passi: [
    { nota: '{{j|s011|'}}', set: { a:{tono:'dato'} } },
    { nota: '{{j|s012|'}}', set: { b:{tono:'ora'}, c:{tono:'ora'}, d:{tono:'ora'}, ab:{tono:'ok'}, ac:{tono:'ok'}, ad:{tono:'ok'}, t1:{t:'strati: {a} {b,c,d}'} } },
    { nota: '{{j|s013|'}}', set: { bc:{tono:'no',nascosto:false}, t1:{t:'arco nello stesso strato: NON bipartito',tono:'no'} } }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s014|}}</h1>
  <p class="lede">{{s|s015|}}</p>
</header>

<section>
  <h2>{{s|s016|}}</h2>
<p>{{s|s017|}}</p>
<p>{{s|s018|}}</p>
  <figure class="scena" data-scena="bfs" data-titolo="{{a|s019|}}"></figure>
</section>
<section>
  <h2>{{s|s020|}}</h2>
<ol>
  <li>{{s|s021|}}</li>
  <li>{{s|s022|}}</li>
  <li>{{s|s023|}}</li>
  <li>{{s|s024|}}</li>
</ol>
<p>{{s|s025|}}</p>
<div class="box attenzione" data-tit="{{a|s026|}}"><p>{{s|s027|}}</p></div>
</section>
<section>
  <h2>{{s|s028|}}</h2>
<p>{{s|s029|}}</p>
<div class="box idea" data-tit="{{a|s030|}}"><p>{{s|s031|}}</p></div>
</section>
<section>
  <h2>{{s|s032|}}</h2>
<p>{{s|s033|}}</p>
<p>{{s|s034|}}</p>
<ul>
  <li>{{s|s035|}}</li>
  <li>{{s|s036|}}</li>
  <li>{{s|s037|}}</li>
  <li>{{s|s038|}}</li>
</ul>
<p>{{s|s039|}}</p>
</section>
<section>
  <h2>{{s|s040|}}</h2>
<p>{{s|s041|}}</p>
<p>{{s|s042|}}</p>
  <figure class="scena" data-scena="bip" data-titolo="{{a|s043|}}"></figure>
</section>
<section>
  <h2>{{s|s044|}}</h2>
  <p>{{s|s045|}}</p>
  <p>{{s|s046|}}</p>
</section>
<section>
  <h2>{{s|s047|}}</h2>
<div class="box esame" data-tit="{{a|s048|}}">
<p>{{s|s049|}}</p>
<p>{{s|s050|}}</p>
</div>
</section>
<section>
  <h2>{{s|s051|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s052|}}</th><th>{{s|s053|}}</th><th>{{s|s054|}}</th></tr></thead><tbody><tr><td>d(v)</td><td>{{s|s055|}}</td><td>{{s|s056|}}</td></tr><tr><td>{{s|s057|}}</td><td>{{s|s058|}}</td><td>{{s|s059|}}</td></tr><tr><td>{{s|s060|}}</td><td>O(n + m)</td><td>{{s|s061|}}</td></tr><tr><td>{{s|s062|}}</td><td>{{s|s063|}}</td><td>{{s|s064|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
