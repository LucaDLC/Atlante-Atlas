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
const A = 'ALTO', B = 'ALTRO';
const D = [[0,1,2,3,4,5],[1,0,1,2,3,4],[2,1,0,1,2,3],[3,2,1,0,1,2],[4,3,2,1,1,1]];
const vuota = D.map((r,i) => r.map((v,j) => (i===0||j===0) ? String(v) : ''));
SCENE.seq = {
  w: 560, h: 280, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    {id:'g',tipo:'griglia',x:90,y:50,cw:50,ch:34,valori:vuota,intR:['', 'A','L','T','O'].slice(0,5),intC:['','A','L','T','R','O'].slice(0,6)},
    {id:'t',tipo:'testo',x:20,y:270,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{} },
    { nota: '{{j|s004|'}}', set:{g:{valori:vuota,toni:{}}} },
    { nota: '{{j|s005|'}}', set:{g:{valori:D.map((r,i)=>r.map((v,j)=> (i<=1&&j<=1)||(i===0||j===0)?String(v):'')),toni:{'1,1':'ora'}}} },
    { nota: '{{j|s006|'}}', set:{g:{valori:D.map((r,i)=>r.map((v,j)=> (i===4&&j>=4)||(i<=3)?String(v):'')),toni:{'4,4':'ora','4,5':'ok'}}} },
    { nota: '{{j|s007|'}}', set:{g:{valori:D.map(r=>r.map(v=>String(v))),toni:{'4,5':'ok'}}, t:{t:'distanza = 1',tono:'ok'}} }
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
<p>{{s|s013|}}</p>
  <figure class="scena" data-scena="seq" data-titolo="{{a|s014|}}"></figure>
</section>
<section>
  <h2>{{s|s015|}}</h2>
<p>{{s|s016|}}</p>
</section>
<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
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
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s024|}}</th><th>{{s|s025|}}</th><th>{{s|s026|}}</th></tr></thead><tbody><tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr><tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr><tr><td>{{s|s033|}}</td><td>{{s|s034|}}</td><td>{{s|s035|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
