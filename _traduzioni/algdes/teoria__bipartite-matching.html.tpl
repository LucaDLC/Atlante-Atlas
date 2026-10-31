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
const N = (id,x,y,t,tono) => ({id,tipo:'nodo',x,y,t,r:18,tono});
const A = (id,da,a,t,extra) => Object.assign({id,tipo:'arco',da,a,dir:true,t},extra||{});
SCENE.bf = {
  w: 540, h: 290, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('s',40,140,'s'), N('L1',150,50,'1'), N('L2',150,140,'2'), N('L3',150,230,'3'),
    N('RA',380,50,'A'), N('RB',380,140,'B'), N('RC',380,230,'C'), N('t',500,140,'t'),
    A('s1','s','L1','',{tono:'spento'}), A('s2','s','L2','',{tono:'spento'}), A('s3','s','L3','',{tono:'spento'}),
    A('1A','L1','RA','',{tono:'spento'}), A('1B','L1','RB','',{tono:'spento'}),
    A('2A','L2','RA','',{tono:'spento'}),
    A('3B','L3','RB','',{tono:'spento'}), A('3C','L3','RC','',{tono:'spento'}),
    A('At','RA','t','',{tono:'spento'}), A('Bt','RB','t','',{tono:'spento'}), A('Ct','RC','t','',{tono:'spento'}),
    {id:'c1',tipo:'testo',x:20,y:282,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{'1A':{tono:'dato'},'1B':{tono:'dato'},'2A':{tono:'dato'},'3B':{tono:'dato'},'3C':{tono:'dato'}} },
    { nota: '{{j|s004|'}}', set:{s1:{tono:'dato'},s2:{tono:'dato'},s3:{tono:'dato'},At:{tono:'dato'},Bt:{tono:'dato'},Ct:{tono:'dato'}} },
    { nota: '{{j|s005|'}}', set:{'1B':{tono:'ok'},'2A':{tono:'ok'},'3C':{tono:'ok'},c1:{t:'max flow = 3 = matching massimo',tono:'ok'}} },
    { nota: '{{j|s006|'}}', set:{c1:{t:'matching: 1–B, 2–A, 3–C',tono:'ok'}} }
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
  <figure class="scena" data-scena="bf" data-titolo="{{a|s012|}}"></figure>
</section>
<section>
  <h2>{{s|s013|}}</h2>
<p>{{s|s014|}}</p>
<p>{{s|s015|}}</p>
</section>
<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
  <p>{{s|s018|}}</p>
</section>
<section>
  <h2>{{s|s019|}}</h2>
<div class="box esame" data-tit="{{a|s020|}}">
<p>{{s|s021|}}</p>
</div>
</section>
<section>
  <h2>{{s|s022|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s023|}}</th><th>{{s|s024|}}</th><th>{{s|s025|}}</th></tr></thead><tbody><tr><td>L → R</td><td>{{s|s026|}}</td><td>{{s|s027|}}</td></tr><tr><td>s → L, R → t</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr><tr><td>{{s|s030|}}</td><td>O(m√n)</td><td>{{s|s031|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
