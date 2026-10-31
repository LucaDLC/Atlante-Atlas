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
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:18});
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:false});
SCENE.rid = {
  w: 540, h: 250, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('1',60,60,'1'), N('2',150,60,'2'), N('3',240,60,'3'),
    A('12','1','2'), A('23','2','3'),
    {id:'tit',tipo:'testo',x:60,y:20,t:'Vertex Cover: G, k = 1',size:12,bold:true,anchor:'start'},
    {id:'tss',tipo:'rett',x:330,y:40,w:80,h:30,t:'tessera 1,2',tono:'dato',nascosto:true},
    {id:'tss2',tipo:'rett',x:330,y:90,w:80,h:30,t:'tessera 2,3',tono:'dato',nascosto:true},
    {id:'sale',tipo:'testo',x:330,y:20,t:'',size:12,bold:true,anchor:'start'},
    {id:'c1',tipo:'testo',x:20,y:230,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{} },
    { nota: '{{j|s004|'}}', set:{tss:{nascosto:false},tss2:{nascosto:false},sale:{t:'Sale: tessere = archi'}} },
    { nota: '{{j|s005|'}}', set:{c1:{t:'vertex cover {2} ⇔ compra il valore 2 (costo 1)',tono:'ok'}} }
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
  <figure class="scena" data-scena="rid" data-titolo="{{a|s010|}}"></figure>
</section>
<section>
  <h2>{{s|s011|}}</h2>
<ol>
  <li>{{s|s012|}}</li>
  <li>{{s|s013|}}</li>
  <li>{{s|s014|}}</li>
  <li>{{s|s015|}}</li>
  <li>{{s|s016|}}</li>
  <li>{{s|s017|}}</li>
</ol>
</section>
<section>
  <h2>{{s|s018|}}</h2>
<p>{{s|s019|}}</p>
</section>
<section>
  <h2>{{s|s020|}}</h2>
<div class="box esame" data-tit="{{a|s021|}}">
<p>{{s|s022|}}</p>
</div>
</section>
<section>
  <h2>{{s|s023|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s024|}}</th><th>{{s|s025|}}</th><th>{{s|s026|}}</th></tr></thead><tbody><tr><td>P2 ≤p P1</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr><tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr><tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
