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
const T0 = [[0,0,0,0,0,0,0],[0,1,1,1,1,1,1],[0,1,6,7,7,7,7],[0,1,6,7,7,18,19]];
const blank = ['','','','','','',''];
const riga = (k) => T0[k].map(String);
const vista = (n) => [0,1,2,3].map(k => k < n ? riga(k) : blank);
SCENE.dpk = {
  w: 560, h: 240, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    {id:'g',tipo:'griglia',x:50,y:40,cw:56,ch:36,valori:vista(1),intR:['0','1','2','3'],intC:['0','1','2','3','4','5','6']},
    {id:'t',tipo:'testo',x:50,y:220,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{g:{valori:vista(1),toni:{}}} },
    { nota: '{{j|s004|'}}', set:{g:{valori:vista(1),toni:{'0,0':'dato','0,1':'dato','0,2':'dato','0,3':'dato','0,4':'dato','0,5':'dato','0,6':'dato'}}} },
    { nota: '{{j|s005|'}}', set:{g:{valori:vista(2),toni:{'1,1':'ok','1,2':'ok','1,3':'ok','1,4':'ok','1,5':'ok','1,6':'ok'}}, t:{t:'riga 1 completa'}} },
    { nota: '{{j|s006|'}}', set:{g:{valori:vista(3),toni:{'2,2':'ok','2,3':'ok','2,4':'ok','2,5':'ok','2,6':'ok'}}, t:{t:'OPT(2,3) = 7'}} },
    { nota: '{{j|s007|'}}', set:{g:{valori:vista(4),toni:{'3,5':'ora','3,6':'ok'}}, t:{t:'OPT(3, 6) = 19: risposta',tono:'ok'}} }
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
<ul>
  <li>{{s|s012|}}</li>
  <li>{{s|s013|}}</li>
  <li>{{s|s014|}}</li>
</ul>
</section>
<section>
  <h2>{{s|s015|}}</h2>
<ol>
  <li>{{s|s016|}}</li>
  <li>{{s|s017|}}</li>
  <li>{{s|s018|}}</li>
  <li>{{s|s019|}}</li>
  <li>{{s|s020|}}</li>
  <li>{{s|s021|}}</li>
  <li>{{s|s022|}}</li>
  <li>{{s|s023|}}</li>
</ol>
  <figure class="scena" data-scena="dpk" data-titolo="{{a|s024|}}"></figure>
</section>
<section>
  <h2>{{s|s025|}}</h2>
<p>{{s|s026|}}</p>
</section>
<section>
  <h2>{{s|s027|}}</h2>
<p>{{s|s028|}}</p>
<ol>
  <li>{{s|s029|}}</li>
  <li>{{s|s030|}}</li>
  <li>{{s|s031|}}</li>
  <li>{{s|s032|}}</li>
  <li>{{s|s033|}}</li>
  <li>{{s|s034|}}</li>
</ol>
</section>
<section>
  <h2>{{s|s035|}}</h2>
  <p>{{s|s036|}}</p>
  <p>{{s|s037|}}</p>
</section>
<section>
  <h2>{{s|s038|}}</h2>
<div class="box esame" data-tit="{{a|s039|}}">
<p>{{s|s040|}}</p>
<p>{{s|s041|}}</p>
</div>
</section>
<section>
  <h2>{{s|s042|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s043|}}</th><th>{{s|s044|}}</th><th>{{s|s045|}}</th></tr></thead><tbody><tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr><tr><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td>{{s|s051|}}</td></tr><tr><td>−∞</td><td>{{s|s052|}}</td><td>{{s|s053|}}</td></tr><tr><td>{{s|s054|}}</td><td>{{s|s055|}}</td><td>{{s|s056|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
