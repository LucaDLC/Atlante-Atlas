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
const N = (id,x,y,t,tono) => ({id,tipo:'rett',x,y,w:58,h:34,t,tono});
SCENE.exch = {
  w: 540, h: 230, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    {id:'l1',tipo:'testo',x:20,y:60,t:'ottimo O',size:12,bold:true,anchor:'start'},
    {id:'l2',tipo:'testo',x:20,y:150,t:'greedy G',size:12,bold:true,anchor:'start'},
    N('o1',110,40,'1','dato'), N('o2',180,40,'2','dato'), N('o3',250,40,'3','dato'), N('o4',320,40,'4','spento'),
    N('g1',110,130,'1','dato'), N('g2',180,130,'2','spento'), N('g3',250,130,'3','spento'), N('g4',320,130,'4','dato'),
    {id:'x',tipo:'testo',x:440,y:60,t:'',size:12,bold:true},
    {id:'c',tipo:'testo',x:20,y:210,t:'',size:13,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: {} },
    { nota: '{{j|s004|'}}', set: { o2:{tono:'ora'}, o1:{tono:'ok'}, c:{t:'scambio: O\' = O − {2} + {1}: stessa taglia, costo non maggiore'} } },
    { nota: '{{j|s005|'}}', set: { o3:{tono:'ora'}, g3:{tono:'dato'}, x:{t:'O\' = G',tono:'ok'}, c:{t:'ad ogni scambio la soluzione resta valida e ottima',tono:'ok'} } }
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
<ol>
  <li>{{s|s010|}}</li>
  <li>{{s|s011|}}</li>
</ol>
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
<div class="box regola" data-tit="{{a|s020|}}"><p>{{s|s021|}}</p></div>
  <figure class="scena" data-scena="exch" data-titolo="{{a|s022|}}"></figure>
</section>
<section>
  <h2>{{s|s023|}}</h2>
<p>{{s|s024|}}</p>
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
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s034|}}</th><th>{{s|s035|}}</th><th>{{s|s036|}}</th></tr></thead><tbody><tr><td>{{s|s037|}}</td><td>{{s|s038|}}</td><td>{{s|s039|}}</td></tr><tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr><tr><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr><tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
