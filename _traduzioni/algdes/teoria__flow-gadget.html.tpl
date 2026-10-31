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
    N('u',60,60,'u'), N('w',60,180,'w'), N('v',260,120,'v'), N('x',470,60,'x'), N('y',470,180,'y'),
    A('uv','u','v','',{tono:'dato'}), A('wv','w','v','',{tono:'dato'}), A('vx','v','x','',{tono:'dato'}), A('vy','v','y','',{tono:'dato'}),
    {id:'c1',tipo:'testo',x:20,y:225,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{} },
    { nota: '{{j|s004|'}}', set:{v:{tono:'ora',t:'v_in'}, c1:{t:'v_in → v_out con capacità 1'}} },
    { nota: '{{j|s005|'}}', set:{c1:{t:'capacità del nodo = capacità dell\'arco',tono:'ok'}} }
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
<p>{{s|s010|}}</p>
  <figure class="scena" data-scena="gad" data-titolo="{{a|s011|}}"></figure>
</section>
<section>
  <h2>{{s|s012|}}</h2>
<p>{{s|s013|}}</p>
</section>
<section>
  <h2>{{s|s014|}}</h2>
  <p>{{s|s015|}}</p>
  <ol>
    <li>{{s|s016|}}</li>
    <li>{{s|s017|}}</li>
    <li>{{s|s018|}}</li>
    <li>{{s|s019|}}</li>
    <li>{{s|s020|}}</li>
  </ol>
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
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s026|}}</th><th>{{s|s027|}}</th><th>{{s|s028|}}</th></tr></thead><tbody><tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr><tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
