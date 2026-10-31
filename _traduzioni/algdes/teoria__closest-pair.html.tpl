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
const P = [['A',0.5,1.0],['B',1.5,3.0],['C',2.5,1.2],['D',3.5,3.5],['E',4.2,1.4],['F',5.5,2.5]];
const SX = x => 40 + x * 75, SY = y => 230 - y * 55;
const og = P.map(([n,x,y],i) => ({id:n,tipo:'punto',x:SX(x),y:SY(y),r:6,t:n,tx:8,ty:-8}));
og.push({id:'mid',tipo:'linea',x1:SX(3),y1:20,x2:SX(3),y2:235,tratt:true,tono:'due',nascosto:true});
og.push({id:'band',tipo:'rett',x:SX(2.5),y:20,w:SX(3.5)-SX(2.5),h:215,t:'',nascosto:true,tono:'spento'});
og.push({id:'c',tipo:'testo',x:20,y:262,t:'',size:12,bold:true,anchor:'start'});
og.push({id:'pair',tipo:'linea',x1:SX(P[0][1]),y1:SY(P[0][2]),x2:SX(P[0][1]),y2:SY(P[0][2]),nascosto:true,tono:'ok'});
SCENE.cp = {
  w: 540, h: 290, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: og,
  passi: [
    { nota: '{{j|s003|'}}', set:{} },
    { nota: '{{j|s004|'}}', set:{mid:{nascosto:false}} },
    { nota: '{{j|s005|'}}', set:{mid:{nascosto:false},c:{t:'δ = min(sinistra, destra)'}} },
    { nota: '{{j|s006|'}}', set:{band:{nascosto:false}} },
    { nota: '{{j|s007|'}}', set:{c:{t:'coppia più vicina: E–F',tono:'ok'}} }
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
  <figure class="scena" data-scena="cp" data-titolo="{{a|s012|}}"></figure>
</section>
<section>
  <h2>{{s|s013|}}</h2>
<p>{{s|s014|}}</p>
</section>
<section>
  <h2>{{s|s015|}}</h2>
<p>{{s|s016|}}</p>
</section>
<section>
  <h2>{{s|s017|}}</h2>
<div class="box esame" data-tit="{{a|s018|}}">
<p>{{s|s019|}}</p>
</div>
</section>
<section>
  <h2>{{s|s020|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s021|}}</th><th>{{s|s022|}}</th><th>{{s|s023|}}</th></tr></thead><tbody><tr><td>{{s|s024|}}</td><td>{{s|s025|}}</td><td>{{s|s026|}}</td></tr><tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr><tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
