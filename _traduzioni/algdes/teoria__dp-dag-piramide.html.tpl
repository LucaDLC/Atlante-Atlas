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
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:true});
SCENE.dag = {
  w: 520, h: 260, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('p',260,30,'1'), N('l',170,100,'1'), N('r',350,100,'2'), N('a',110,180,'2'), N('b',260,180,'0'), N('c',410,180,'0'),
    A('pl','p','l'), A('pr','p','r'), A('la','l','a'), A('lb','l','b'), A('rb','r','b'), A('rc','r','c'),
    {id:'o',tipo:'testo',x:20,y:240,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{} },
    { nota: '{{j|s004|'}}', set:{a:{tono:'dato',sotto:'OPT 2'},b:{tono:'dato',sotto:'OPT 0'},c:{tono:'dato',sotto:'OPT 0'}} },
    { nota: '{{j|s005|'}}', set:{l:{tono:'ora',sotto:'OPT 3'},r:{tono:'ora',sotto:'OPT 2'}} },
    { nota: '{{j|s006|'}}', set:{p:{tono:'ok',sotto:'OPT 4'},pl:{tono:'ok'},la:{tono:'ok'}} }
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
  <figure class="scena" data-scena="dag" data-titolo="{{a|s011|}}"></figure>
</section>
<section>
  <h2>{{s|s012|}}</h2>
<p>{{s|s013|}}</p>
</section>
<section>
  <h2>{{s|s014|}}</h2>
<p>{{s|s015|}}</p>
</section>
<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
  <p>{{s|s018|}}</p>
</section>
<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <p>{{s|s021|}}</p>
  <ul>
    <li>{{s|s022|}}</li>
    <li>{{s|s023|}}</li>
    <li>{{s|s024|}}</li>
  </ul>
  <p>{{s|s025|}}</p>
  <p>{{s|s026|}}</p>
  <p>{{s|s027|}}</p>
  <p>{{s|s028|}}</p>
  <p>{{s|s029|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th></th><th>{{s|s030|}}</th><th>{{s|s031|}}</th></tr></thead><tbody>
    <tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr>
    <tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr>
    <tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr>
    <tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr>
    <tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr>
  </tbody></table></div>
  <p>{{s|s047|}}</p>
  <div class="box attenzione" data-tit="{{a|s048|}}">{{s|s049|}}</div>
</section>
<section>
  <h2>{{s|s050|}}</h2>
<div class="box esame" data-tit="{{a|s051|}}">
<p>{{s|s052|}}</p>
</div>
</section>
<section>
  <h2>{{s|s053|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s054|}}</th><th>{{s|s055|}}</th><th>{{s|s056|}}</th></tr></thead><tbody><tr><td>{{s|s057|}}</td><td>O(N²)</td><td>{{s|s058|}}</td></tr><tr><td>{{s|s059|}}</td><td>O(n + m)</td><td>{{s|s060|}}</td></tr><tr><td>{{s|s061|}}</td><td>{{s|s062|}}</td><td>{{s|s063|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
