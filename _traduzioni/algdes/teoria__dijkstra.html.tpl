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
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:20});
const A = (id,da,a,t,extra) => Object.assign({id,tipo:'arco',da,a,dir:true,t},extra||{});
SCENE.dijneg = {
  w: 520, h: 250, lato: true,
  legenda: '{{j|s008|'}}',
  oggetti: [
    N('s',60,125,'s'), N('a',260,50,'a'), N('b',260,200,'b'),
    A('sa','s','a','2'), A('sb','s','b','3'), A('ba','b','a','−2',{tono:'ora'}),
    {id:'c1',tipo:'testo',x:20,y:242,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: "Tre nodi e un arco di peso <b>−2</b> (b → a). La distanza vera di a è <code>s → b → a = 3 − 2 = 1</code>, non 2.", set:{s:{tono:'dato',sotto:'d=0'},c1:{t:'distanza vera di a: 1'}} },
    { nota: "Dijkstra rilassa i vicini di s: <code>d(a) = 2</code>, <code>d(b) = 3</code>. Il minimo è a: lo <b>fissa come definitivo</b>.", set:{a:{tono:'ok',sotto:'d=2 fissato'},b:{tono:'dato',sotto:'d=3'},c1:{t:'a fissato con d = 2'}} },
    { nota: "Poi fissa b (3) e guarda b → a: 3 − 2 = 1 &lt; 2. Ma a è già definitivo e Dijkstra non lo riesamina: resta <b>2, sbagliato</b>. Il presupposto «un cammino più lungo non costa meno» è falso con pesi negativi.", set:{b:{tono:'ok',sotto:'d=3'},a:{tono:'no',sotto:'d=2 ✗ (vero: 1)'},c1:{t:'Dijkstra dà 2, la risposta giusta è 1',tono:'no'}} },
    { nota: "Bellman-Ford non fissa nulla in anticipo: ripete il rilassamento su <b>tutti</b> gli archi, quindi al giro successivo corregge a a 1.", set:{a:{tono:'ok',sotto:'d=1'},c1:{t:'Bellman-Ford: d(a) = 1',tono:'ok'}} }
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
  <figure class="scena" data-scena="dij" data-titolo="{{a|s014|}}"></figure>
</section>
<section>
  <h2>{{s|s015|}}</h2>
<p>{{s|s016|}}</p>
<p>{{s|s017|}}</p>
<p>{{s|s018|}}</p>
</section>
<section>
  <h2>{{s|s019|}}</h2>
<p>{{s|s020|}}</p>
<div class="box attenzione" data-tit="{{a|s021|}}"><p>{{s|s022|}}</p></div>
<figure class="scena" data-scena="dijneg" data-titolo="{{a|s023|}}"></figure>
</section>
<section>
  <h2>{{s|s024|}}</h2>
<p>{{s|s025|}}</p>
</section>
<section>
  <h2>{{s|s026|}}</h2>
  <p>{{s|s027|}}</p>
  <p>{{s|s028|}}</p>
</section>
<section>
  <h2>{{s|s029|}}</h2>
<div class="box esame" data-tit="{{a|s030|}}">
<p>{{s|s031|}}</p>
<p>{{s|s032|}}</p>
</div>
</section>
<section>
  <h2>{{s|s033|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s034|}}</th><th>{{s|s035|}}</th><th>{{s|s036|}}</th></tr></thead><tbody><tr><td>{{s|s037|}}</td><td>{{s|s038|}}</td><td>{{s|s039|}}</td></tr><tr><td>d(v)</td><td>{{s|s040|}}</td><td>{{s|s041|}}</td></tr><tr><td>{{s|s042|}}</td><td>{{s|s043|}}</td><td>{{s|s044|}}</td></tr><tr><td>{{s|s045|}}</td><td>{{s|s046|}}</td><td>{{s|s047|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
