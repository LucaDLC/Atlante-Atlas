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
const r = (id,x,y,t,tono) => ({id,tipo:'rett',x,y,w:58,h:34,t,tono});
SCENE.kar = {
  w: 540, h: 230, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    r('a',60,30,'5','dato'), r('b',130,30,'6','dato'), r('c',220,30,'7','dato'), r('d',290,30,'8','dato'),
    {id:'t1',tipo:'testo',x:20,y:90,t:'56 = 5·10 + 6,   78 = 7·10 + 8',size:12,bold:true,anchor:'start'},
    {id:'m1',tipo:'testo',x:20,y:130,t:'',size:13,bold:true,anchor:'start'},
    {id:'m2',tipo:'testo',x:20,y:160,t:'',size:13,bold:true,anchor:'start'},
    {id:'m3',tipo:'testo',x:20,y:190,t:'',size:13,bold:true,anchor:'start'},
    {id:'tot',tipo:'testo',x:330,y:190,t:'',size:14,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{t1:{t:'56 = 5·10 + 6,   78 = 7·10 + 8'}} },
    { nota: '{{j|s004|'}}', set:{a:{tono:'ora'},c:{tono:'ora'},m1:{t:'ac = 35'}} },
    { nota: '{{j|s005|'}}', set:{a:{tono:'dato'},c:{tono:'dato'},b:{tono:'ora'},d:{tono:'ora'},m2:{t:'bd = 48'}} },
    { nota: '{{j|s006|'}}', set:{b:{tono:'dato'},d:{tono:'dato'},m3:{t:'(a+b)(c+d) = 165, ad + bc = 82'}} },
    { nota: '{{j|s007|'}}', set:{tot:{t:'= 4368 ✓',tono:'ok'}} }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const v = (id,x,t,tono) => ({id,tipo:'rett',x,y:70,w:52,h:36,t,tono});
SCENE.qs = {
  w: 540, h: 230, lato: true,
  legenda: '{{j|s008|'}}',
  oggetti: [
    v('x0',20,'3','spento'), v('x1',76,'8','spento'), v('x2',132,'2','spento'), v('x3',188,'5','ora'), v('x4',244,'1','spento'), v('x5',300,'4','spento'), v('x6',356,'7','spento'), v('x7',412,'6','spento'),
    {id:'t1',tipo:'testo',x:20,y:50,t:'pivot = 5 (il quarto elemento)',size:12,bold:true,anchor:'start'},
    {id:'t2',tipo:'testo',x:20,y:150,t:'',size:13,bold:true,anchor:'start'},
    {id:'t3',tipo:'testo',x:20,y:190,t:'',size:12,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s009|'}}', set:{} },
    { nota: '{{j|s010|'}}', set:{x0:{tono:'dato'},x1:{tono:'due'},x2:{tono:'dato'},x4:{tono:'dato'},x5:{tono:'dato'},x6:{tono:'due'},x7:{tono:'due'}} },
    { nota: '{{j|s011|'}}', set:{x0:{t:'3',tono:'dato'},x2:{t:'2',tono:'dato'},x4:{t:'1',tono:'dato'},x5:{t:'4',tono:'dato'},x3:{t:'5',tono:'ora'},x1:{t:'8',tono:'due'},x6:{t:'7',tono:'due'},x7:{t:'6',tono:'due'},t2:{t:'pivot al posto giusto',tono:'ok'}} },
    { nota: '{{j|s012|'}}', set:{t3:{t:'pivot casuale → O(n log n) atteso'}} }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s013|}}</h1>
  <p class="lede">{{s|s014|}}</p>
</header>

<section>
  <h2>{{s|s015|}}</h2>
<p>{{s|s016|}}</p>
<p>{{s|s017|}}</p>
  <figure class="scena" data-scena="kar" data-titolo="{{a|s018|}}"></figure>
</section>
<section>
  <h2>{{s|s019|}}</h2>
<p>{{s|s020|}}</p>
<p>{{s|s021|}}</p>
  <figure class="scena" data-scena="qs" data-titolo="{{a|s022|}}"></figure>
</section>
<section>
  <h2>{{s|s023|}}</h2>
<div class="box esame" data-tit="{{a|s024|}}">
<p>{{s|s025|}}</p>
</div>
</section>
<section>
  <h2>{{s|s026|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s027|}}</th><th>{{s|s028|}}</th><th>{{s|s029|}}</th></tr></thead><tbody><tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>O(n^1.585)</td></tr><tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
