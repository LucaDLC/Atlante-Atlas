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
const A = (id,da,a,t,extra) => Object.assign({id,tipo:'arco',da,a,dir:true,t},extra||{});
SCENE.gad = {
  w: 540, h: 240, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('u',60,60,'u'), N('w',60,180,'w'), N('vin',250,120,'v'), N('vout',250,120,''), N('x',480,60,'x'), N('y',480,180,'y'),
    A('uv','u','vin','',{tono:'dato'}), A('wv','w','vin','',{tono:'dato'}), A('vx','vout','x','',{tono:'dato'}), A('vy','vout','y','',{tono:'dato'}),
    A('vv','vin','vout','',{nascosto:true}),
    {id:'c1',tipo:'testo',x:20,y:225,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{vin:{tono:'ora'}} },
    { nota: '{{j|s004|'}}', set:{vin:{t:'v_in',tono:'ora'}, vout:{x:370,t:'v_out',tono:'ora'}, vv:{nascosto:false}, c1:{t:'v_in → v_out'}} },
    { nota: '{{j|s005|'}}', set:{vv:{t:'1',tono:'ok'}, c1:{t:'capacità del nodo = capacità di v_in → v_out',tono:'ok'}} },
    { nota: '{{j|s006|'}}', set:{uv:{tono:'ok'}, vx:{tono:'ok'}, vv:{tono:'ok'}, wv:{tono:'no'}, vy:{tono:'no'}, c1:{t:'un solo cammino attraversa v',tono:'ok'}} }
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
  <figure class="scena" data-scena="gad" data-titolo="{{a|s012|}}"></figure>
</section>
<section>
  <h2>{{s|s013|}}</h2>
<p>{{s|s014|}}</p>
</section>
<section>
  <h2>{{s|s015|}}</h2>
  <p>{{s|s016|}}</p>
  <ol>
    <li>{{s|s017|}}</li>
    <li>{{s|s018|}}</li>
    <li>{{s|s019|}}</li>
    <li>{{s|s020|}}</li>
    <li>{{s|s021|}}</li>
  </ol>
  <p>{{s|s022|}}</p>
</section>
<section>
  <h2>{{s|s023|}}</h2>
<div class="box esame" data-tit="{{a|s024|}}">
<p>{{s|s025|}}</p>
</div>
</section>
<section>
  <h2>{{s|s026|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s027|}}</th><th>{{s|s028|}}</th><th>{{s|s029|}}</th></tr></thead><tbody><tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr><tr><td>{{s|s033|}}</td><td>{{s|s034|}}</td><td>{{s|s035|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
