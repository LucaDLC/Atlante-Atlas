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
const N = (id,x,y,t,tono) => ({id,tipo:'rett',x,y,w:110,h:40,t,tono});
SCENE.ovf = {
  w: 540, h: 230, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('a',20,40,'Integer.MAX_VALUE','dato'), N('b',170,40,'+ 1','ora'), N('c',320,40,'= ?','spento'),
    {id:'c1',tipo:'testo',x:20,y:130,t:'',size:13,bold:true,anchor:'start'},
    {id:'c2',tipo:'testo',x:20,y:160,t:'',size:12,anchor:'start'},
    {id:'c3',tipo:'testo',x:20,y:200,t:'',size:12,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{} },
    { nota: '{{j|s004|'}}', set:{c:{t:'-2147483648',tono:'no'},c1:{t:'overflow: int non è un numero infinito',tono:'no'}} },
    { nota: '{{j|s005|'}}', set:{c2:{t:'comparatore: Integer.compare, non a − b',tono:'ok'}} },
    { nota: '{{j|s006|'}}', set:{c:{t:'long: 9.2 · 10^18',tono:'ok'},c3:{t:'usa long per somme grandi',tono:'ok'}} }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s007|}}</h1>
  <p class="lede">{{s|s008|}}</p>
</header>

<section>
  <h2>{{s|s009|}}</h2>
<p>{{s|s010|}}</p>
<p>{{s|s011|}}</p>
</section>
<section>
  <h2>{{s|s012|}}</h2>
<p>{{s|s013|}}</p>
  <figure class="scena" data-scena="ovf" data-titolo="{{a|s014|}}"></figure>
</section>
<section>
  <h2>{{s|s015|}}</h2>
<p>{{s|s016|}}</p>
</section>
<section>
  <h2>{{s|s017|}}</h2>
<p>{{s|s018|}}</p>
</section>
<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <p>{{s|s021|}}</p>
</section>
<section>
  <h2>{{s|s022|}}</h2>
<div class="box esame" data-tit="{{a|s023|}}">
<p>{{s|s024|}}</p>
</div>
</section>
<section>
  <h2>{{s|s025|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s026|}}</th><th>{{s|s027|}}</th><th>{{s|s028|}}</th></tr></thead><tbody><tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr><tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr><tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr><tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
