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
const N = (id,x,y,t,sotto) => ({id,tipo:'nodo',x,y,t,r:20,sotto});
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:true});
SCENE.topo = {
  w: 520, h: 250, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('a',50,60,'a','in 0'), N('b',50,190,'b','in 0'), N('c',200,120,'c','in 2'), N('e',340,60,'e','in 1'), N('d',340,190,'d','in 2'),
    A('ac','a','c'), A('bc','b','c'), A('ae','a','e'), A('cd','c','d'), A('ed','e','d'),
    {id:'ord',tipo:'testo',x:260,y:240,t:'ordine: ',size:13,bold:true}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: {} },
    { nota: '{{j|s004|'}}', set: { a:{tono:'dato'}, b:{tono:'dato'} } },
    { nota: '{{j|s005|'}}', set: { a:{tono:'ok'}, c:{tono:null,sotto:'in 1'}, e:{tono:'dato',sotto:'in 0'}, ord:{t:'ordine: a'} } },
    { nota: '{{j|s006|'}}', set: { b:{tono:'ok'}, c:{tono:'dato',sotto:'in 0'}, ord:{t:'ordine: a, b'} } },
    { nota: '{{j|s007|'}}', set: { e:{tono:'ok'}, c:{tono:'ok',sotto:'in 0'}, d:{tono:'dato',sotto:'in 0'}, ord:{t:'ordine: a, b, e, c'} } },
    { nota: '{{j|s008|'}}', set: { d:{tono:'ok'}, ord:{t:'ordine: a, b, e, c, d',tono:'ok'} } }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:20});
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:true});
SCENE.topodfs = {
  w: 520, h: 250, lato: true,
  legenda: '{{j|s009|'}}',
  oggetti: [
    N('a',50,60,'a'), N('b',50,190,'b'), N('c',200,120,'c'), N('e',340,60,'e'), N('d',340,190,'d'),
    A('ac','a','c'), A('bc','b','c'), A('ae','a','e'), A('cd','c','d'), A('ed','e','d'),
    {id:'ord',tipo:'testo',x:260,y:240,t:'',size:13,bold:true}
  ],
  passi: [
    { nota: "Stesso DAG. Lancio la DFS da <b>a</b> e scrivo per ogni nodo il numero di <b>fine</b> f, cioè l'ordine in cui il nodo finisce. a ha vicini c ed e: scendo su <b>c</b>, poi su <b>d</b>.", set:{a:{tono:'ora'},c:{tono:'ora'},d:{tono:'ora'}} },
    { nota: "d non ha archi uscenti: <b>finisce per primo</b>, f = 1. Torno a c: il suo unico vicino è finito, quindi finisce c, f = 2.", set:{d:{tono:'ok',sotto:'f=1'},c:{tono:'ok',sotto:'f=2'}} },
    { nota: "Da a resta il vicino <b>e</b>. Il suo vicino d è già visitato: e finisce, f = 3. Poi finisce a, f = 4.", set:{e:{tono:'ok',sotto:'f=3'},a:{tono:'ok',sotto:'f=4'}} },
    { nota: "b non è ancora stato visitato: nuova DFS da <b>b</b>. Il suo vicino c è già finito, quindi b finisce subito, f = 5.", set:{b:{tono:'ok',sotto:'f=5'},ord:{t:'ordine di fine: d, c, e, a, b'}} },
    { nota: "Leggo l'ordine di fine <b>al contrario</b>: b, a, e, c, d. Controllo: b→c, a→c, a→e, c→d, e→d vanno tutti da sinistra a destra. È un ordinamento topologico (diverso da quello di Kahn, ma valido).", set:{ord:{t:'ordine topologico: b, a, e, c, d',tono:'ok'}} }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s010|}}</h1>
  <p class="lede">{{s|s011|}}</p>
</header>

<section>
  <h2>{{s|s012|}}</h2>
<p>{{s|s013|}}</p>
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
</ol>
<p>{{s|s021|}}</p>
  <figure class="scena" data-scena="topo" data-titolo="{{a|s022|}}"></figure>
</section>
<section>
  <h2>{{s|s023|}}</h2>
<p>{{s|s024|}}</p>
<div class="box regola" data-tit="{{a|s025|}}"><p>{{s|s026|}}</p></div>
  <figure class="scena" data-scena="topodfs" data-titolo="{{a|s027|}}"></figure>
</section>
<section>
  <h2>{{s|s028|}}</h2>
<p>{{s|s029|}}</p>
</section>
<section>
  <h2>{{s|s030|}}</h2>
  <p>{{s|s031|}}</p>
  <p>{{s|s032|}}</p>
</section>
<section>
  <h2>{{s|s033|}}</h2>
<div class="box esame" data-tit="{{a|s034|}}">
<p>{{s|s035|}}</p>
</div>
</section>
<section>
  <h2>{{s|s036|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s037|}}</th><th>{{s|s038|}}</th><th>{{s|s039|}}</th></tr></thead><tbody><tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr><tr><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr><tr><td>{{s|s046|}}</td><td>O(n + m)</td><td>{{s|s047|}}</td></tr><tr><td>{{s|s048|}}</td><td>{{s|s049|}}</td><td>{{s|s050|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
