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
const A = (id,da,a,t) => ({id,tipo:'arco',da,a,dir:false,t});
SCENE.kru = {
  w: 520, h: 270, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('a',60,70,'a'), N('b',180,40,'b'), N('c',300,70,'c'), N('d',300,190,'d'), N('e',180,200,'e'),
    A('ab','a','b','1'), A('bc','b','c','2'), A('de','d','e','2'), A('ac','a','c','3'), A('cd','c','d','4'), A('be','b','e','5'),
    {id:'c1',tipo:'testo',x:20,y:250,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{ab:{tono:'dato'},bc:{tono:'dato'},de:{tono:'dato'},ac:{tono:'dato'},cd:{tono:'dato'},be:{tono:'dato'}} },
    { nota: '{{j|s004|'}}', set:{ab:{tono:'ok'},c1:{t:'preso: ab(1)'}} },
    { nota: '{{j|s005|'}}', set:{bc:{tono:'ok'},c1:{t:'preso: ab(1), bc(2)'}} },
    { nota: '{{j|s006|'}}', set:{de:{tono:'ok'},c1:{t:'preso: ab, bc, de (1+2+2)'}} },
    { nota: '{{j|s007|'}}', set:{ac:{tono:'no'},c1:{t:'ac scartato: chiuderebbe un ciclo'}} },
    { nota: '{{j|s008|'}}', set:{cd:{tono:'ok'},ac:{tono:null},c1:{t:'albero: ab, bc, de, cd · costo 9',tono:'ok'}} }
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
</section>
<section>
  <h2>{{s|s014|}}</h2>
<p>{{s|s015|}}</p>
<p>{{s|s016|}}</p>
  <figure class="scena" data-scena="kru" data-titolo="{{a|s017|}}"></figure>
</section>
<section>
  <h2>{{s|s018|}}</h2>
<p>{{s|s019|}}</p>
<p>{{s|s020|}}</p>
</section>
<section>
  <h2>{{s|s021|}}</h2>
<p>{{s|s022|}}</p>
<p>{{s|s023|}}</p>
</section>
<section>
  <h2>{{s|s024|}}</h2>
  <p>{{s|s025|}}</p>
  <p>{{s|s026|}}</p>
</section>
<section>
  <h2>{{s|s027|}}</h2>
<div class="box esame" data-tit="{{a|s028|}}">
<p>{{s|s029|}}</p>
<p>{{s|s030|}}</p>
</div>
</section>
<section>
  <h2>{{s|s031|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s032|}}</th><th>{{s|s033|}}</th><th>{{s|s034|}}</th></tr></thead><tbody><tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr><tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr><tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr><tr><td>n − 1</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
