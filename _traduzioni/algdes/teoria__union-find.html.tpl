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
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:20});
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:true});
SCENE.uf = {
  w: 520, h: 250, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('a',60,60,'a'), N('b',170,60,'b'), N('c',280,60,'c'), N('d',390,60,'d'), N('e',470,160,'e'),
    {id:'c1',tipo:'testo',x:20,y:225,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{a:{tono:'dato'},b:{tono:'dato'},c:{tono:'dato'},d:{tono:'dato'},e:{tono:'dato'},c1:{t:'5 insiemi: {a} {b} {c} {d} {e}'}} },
    { nota: '{{j|s004|'}}', set:{b:{tono:'ora',sotto:'figlio di a'}, a:{tono:'dato'}, ab:{tono:'ok'}, c1:{t:'{a, b} con radice a'}} },
    { nota: '{{j|s005|'}}', set:{d:{tono:'ora',sotto:'figlio di c'}, c:{tono:'dato'}, cd:{tono:'ok'}, c1:{t:'{a, b} · {c, d} · {e}'}} },
    { nota: '{{j|s006|'}}', set:{c:{tono:'ora',sotto:'figlio di a'}, d:{tono:'dato',sotto:'figlio di c'}, ac:{tono:'ok'}, c1:{t:'un solo insieme: {a, b, c, d} con radice a'}} },
    { nota: '{{j|s007|'}}', set:{d:{tono:'ok',sotto:'figlio di a'},c:{tono:'dato'},da:{tono:'ok'},c1:{t:'find(d) = a, e d ora punta direttamente ad a',tono:'ok'}} }
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
<ul>
  <li>{{s|s011|}}</li>
  <li>{{s|s012|}}</li>
  <li>{{s|s013|}}</li>
</ul>
<p>{{s|s014|}}</p>
  <figure class="scena" data-scena="uf" data-titolo="{{a|s015|}}"></figure>
</section>
<section>
  <h2>{{s|s016|}}</h2>
<p>{{s|s017|}}</p>
<ul>
  <li>{{s|s018|}}</li>
  <li>{{s|s019|}}</li>
</ul>
</section>
<section>
  <h2>{{s|s020|}}</h2>
<p>{{s|s021|}}</p>
</section>
<section>
  <h2>{{s|s022|}}</h2>
  <p>{{s|s023|}}</p>
  <p>{{s|s024|}}</p>
</section>
<section>
  <h2>{{s|s025|}}</h2>
<div class="box esame" data-tit="{{a|s026|}}">
<p>{{s|s027|}}</p>
<p>{{s|s028|}}</p>
</div>
</section>
<section>
  <h2>{{s|s029|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s030|}}</th><th>{{s|s031|}}</th><th>{{s|s032|}}</th></tr></thead><tbody><tr><td>{{s|s033|}}</td><td>{{s|s034|}}</td><td>O(1)</td></tr><tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr><tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr><tr><td>{{s|s041|}}</td><td>O(m α(m, n))</td><td>{{s|s042|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
