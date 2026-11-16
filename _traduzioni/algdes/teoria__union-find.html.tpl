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
  w: 520, h: 270, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('a',200,40,'a'), N('b',100,130,'b'), N('c',300,130,'c'), N('d',300,220,'d'), N('e',450,130,'e'),
    {id:'ab',tipo:'arco',da:'b',a:'a',dir:true,nascosto:true},
    {id:'cd',tipo:'arco',da:'d',a:'c',dir:true,nascosto:true},
    {id:'ac',tipo:'arco',da:'c',a:'a',dir:true,nascosto:true},
    {id:'da',tipo:'arco',da:'d',a:'a',dir:true,nascosto:true},
    {id:'c1',tipo:'testo',x:20,y:262,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{a:{tono:'dato'},b:{tono:'dato'},c:{tono:'dato'},d:{tono:'dato'},e:{tono:'dato'},c1:{t:'5 insiemi: {a} {b} {c} {d} {e}'}} },
    { nota: '{{j|s004|'}}', set:{b:{tono:'ora',sotto:'figlio di a'}, ab:{nascosto:false,tono:'ok'}, c1:{t:'{a, b} con radice a'}} },
    { nota: '{{j|s005|'}}', set:{d:{tono:'ora',sotto:'figlio di c'}, b:{tono:null,sotto:'figlio di a'}, cd:{nascosto:false,tono:'ok'}, c1:{t:'{a, b} · {c, d} · {e}'}} },
    { nota: '{{j|s006|'}}', set:{c:{tono:'ora',sotto:'figlio di a'}, d:{tono:null}, ac:{nascosto:false,tono:'ok'}, c1:{t:'un solo insieme: {a, b, c, d} con radice a'}} },
    { nota: '{{j|s007|'}}', set:{c:{tono:null},d:{tono:'ok',sotto:'figlio di a'},cd:{nascosto:true},da:{nascosto:false,tono:'ok'},c1:{t:'find(d) = a, e d ora punta direttamente ad a',tono:'ok'}} }
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
<p>{{s|s020|}}</p>
<figure class="passi" data-titolo="{{a|s021|}}" data-legenda="{{a|s022|}}">
  <div class="passo">
    <div class="espr">        a b c d e
parent  <mark class="dato">a b c d e</mark>
size    1 1 1 1 1</div>
    <p class="nota">{{s|s023|}}</p>
  </div>
  <div class="passo">
    <div class="espr">        a b c d e
parent  a <mark class="ora">a</mark> c d e
size    <mark class="ora">2</mark> 1 1 1 1</div>
    <p class="nota">{{s|s024|}}</p>
  </div>
  <div class="passo">
    <div class="espr">        a b c d e
parent  a a c <mark class="ora">c</mark> e
size    2 1 <mark class="ora">2</mark> 1 1</div>
    <p class="nota">{{s|s025|}}</p>
  </div>
  <div class="passo">
    <div class="espr">        a b c d e
parent  a a <mark class="ora">a</mark> c e
size    <mark class="ora">4</mark> 1 2 1 1</div>
    <p class="nota">{{s|s026|}}</p>
  </div>
  <div class="passo">
    <div class="espr">find(d):  d → parent[d] = c → parent[c] = <mark class="ok">a</mark> → parent[a] = a, stop
        a b c d e
parent  a a a <mark class="ora">a</mark> e</div>
    <p class="nota">{{s|s027|}}</p>
  </div>
  <div class="passo">
    <div class="espr">find(b) = a,  find(d) = a   →  <mark class="ok">stesso gruppo</mark>
find(e) = e                 →  <mark class="no">gruppo diverso</mark></div>
    <p class="nota">{{s|s028|}}</p>
  </div>
</figure>
<figure class="codice" data-titolo="{{a|s029|}}">
<pre data-lang="pseudo">make-set(x):  parent[x] = x;  size[x] = 1

find(x):
  if parent[x] == x: return x
  r = find(parent[x])
  parent[x] = r
  return r

union(x, y):
  rx = find(x);  ry = find(y)
  if rx == ry: return
  if size[rx] &lt; size[ry]: swap(rx, ry)
  parent[ry] = rx
  size[rx] = size[rx] + size[ry]</pre>
  <ol class="spiega">
    <li data-righe="1" data-segna="parent[x] = x@dato|size[x] = 1@dato"><p>{{s|s030|}}</p></li>
    <li data-righe="4" data-segna="parent[x] == x@dato"><p>{{s|s031|}}</p></li>
    <li data-righe="5" data-segna="find(parent[x])@ora"><p>{{s|s032|}}</p></li>
    <li data-righe="6-7" data-segna="parent[x] = r@ok"><p>{{s|s033|}}</p></li>
    <li data-righe="10-11" data-segna="rx == ry@no"><p>{{s|s034|}}</p></li>
    <li data-righe="12-13" data-segna="swap(rx, ry)@ora|parent[ry] = rx@ok"><p>{{s|s035|}}</p></li>
    <li data-righe="14" data-segna="size[rx] + size[ry]@ok"><p>{{s|s036|}}</p></li>
  </ol>
</figure>
<div class="box domanda-tua" data-tit="{{a|s037|}}">
<p>{{s|s038|}}</p>
</div>
</section>
<section>
  <h2>{{s|s039|}}</h2>
<p>{{s|s040|}}</p>
<ul>
  <li>{{s|s041|}}</li>
  <li>{{s|s042|}}</li>
</ul>
<p>{{s|s043|}}</p>
<figure class="passi" data-titolo="{{a|s044|}}" data-legenda="{{a|s045|}}">
  <div class="passo">
    <div class="espr testo">{{s|s046|}}</div>
    <p class="nota">{{s|s047|}}</p>
  </div>
  <div class="passo">
    <div class="espr testo">{{s|s048|}}</div>
    <p class="nota">{{s|s049|}}</p>
  </div>
  <div class="passo">
    <div class="espr">{{s|s050|}}</div>
    <p class="nota">{{s|s051|}}</p>
  </div>
  <div class="passo">
    <div class="espr">2ᵏ ≤ n   ⇒   <mark class="ok">k ≤ log₂ n</mark></div>
    <p class="nota">{{s|s052|}}</p>
  </div>
</figure>
</section>
<section>
  <h2>{{s|s053|}}</h2>
<p>{{s|s054|}}</p>
</section>
<section>
  <h2>{{s|s055|}}</h2>
  <p>{{s|s056|}}</p>
  <p>{{s|s057|}}</p>
</section>
<section>
  <h2>{{s|s058|}}</h2>
<div class="box esame" data-tit="{{a|s059|}}">
<p>{{s|s060|}}</p>
<p>{{s|s061|}}</p>
</div>
</section>
<section>
  <h2>{{s|s062|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s063|}}</th><th>{{s|s064|}}</th><th>{{s|s065|}}</th></tr></thead><tbody><tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td><td>O(1)</td></tr><tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td></tr><tr><td>{{s|s071|}}</td><td>{{s|s072|}}</td><td>{{s|s073|}}</td></tr><tr><td>{{s|s074|}}</td><td>O(m α(m, n))</td><td>{{s|s075|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
