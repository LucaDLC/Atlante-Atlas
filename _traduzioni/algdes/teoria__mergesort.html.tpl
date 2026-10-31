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
const R = (id,y) => ({id,tipo:'celle',x:30,y,cw:50,ch:30,valori:[],indici:false});
SCENE.ms = {
  w: 540, h: 260, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    {id:'r0',tipo:'celle',x:30,y:20,cw:50,ch:30,valori:['5','2','4','7','1','3','2','6'],indici:false,toni:{}},
    {id:'r1',tipo:'celle',x:30,y:110,cw:50,ch:30,valori:['','','','','','','',''],indici:false,toni:{}},
    {id:'r2',tipo:'celle',x:30,y:200,cw:50,ch:30,valori:['','','','','','','',''],indici:false,toni:{}}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{r0:{toni:{0:'dato',1:'dato',2:'dato',3:'dato',4:'dato',5:'dato',6:'dato',7:'dato'}}} },
    { nota: '{{j|s004|'}}', set:{r0:{toni:{0:'ora',1:'ora',2:'ora',3:'ora',4:'due',5:'due',6:'due',7:'due'}}} },
    { nota: '{{j|s005|'}}', set:{r0:{valori:['5','2','4','7','1','3','2','6'],toni:{0:'due',1:'due',2:'ora',3:'ora',4:'ora',5:'ora',6:'due',7:'due'}}} },
    { nota: '{{j|s006|'}}', set:{r1:{valori:['2','5','4','7','1','3','2','6'],toni:{0:'ok',1:'ok',2:'ok',3:'ok',4:'ok',5:'ok',6:'ok',7:'ok'}}, r0:{toni:{}}} },
    { nota: '{{j|s007|'}}', set:{r2:{valori:['2','4','5','7','1','2','3','6'],toni:{0:'ok',1:'ok',2:'ok',3:'ok',4:'ok',5:'ok',6:'ok',7:'ok'}}} },
    { nota: '{{j|s008|'}}', set:{r2:{valori:['1','2','2','3','4','5','6','7'],toni:{0:'ok',1:'ok',2:'ok',3:'ok',4:'ok',5:'ok',6:'ok',7:'ok'}}} }
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
  <figure class="scena" data-scena="ms" data-titolo="{{a|s013|}}"></figure>
</section>
<section>
  <h2>{{s|s014|}}</h2>
<p>{{s|s015|}}</p>
</section>
<section>
  <h2>{{s|s016|}}</h2>
<p>{{s|s017|}}</p>
</section>
<section>
  <h2>{{s|s018|}}</h2>
  <p>{{s|s019|}}</p>
  <p>{{s|s020|}}</p>
</section>
<section>
  <h2>{{s|s021|}}</h2>
<div class="box esame" data-tit="{{a|s022|}}">
<p>{{s|s023|}}</p>
</div>
</section>
<section>
  <h2>{{s|s024|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s025|}}</th><th>{{s|s026|}}</th><th>{{s|s027|}}</th></tr></thead><tbody><tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td><td>O(1)</td></tr><tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>O(n)</td></tr><tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
