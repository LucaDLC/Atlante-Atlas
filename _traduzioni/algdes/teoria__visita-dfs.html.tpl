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
const A = (id,da,a,extra) => Object.assign({id,tipo:'arco',da,a,dir:false},extra||{});
SCENE.dfs = {
  w: 520, h: 270, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('s',60,130,'s'), N('a',170,50,'a'), N('b',280,50,'b'), N('c',390,50,'c'), N('d',390,170,'d'), N('e',60,40,'e'),
    A('sa','s','a'), A('ab','a','b'), A('bc','b','c'), A('cd','c','d'), A('da','d','a',{tono:'no'}), A('se','s','e'),
    {id:'lab',tipo:'testo',x:30,y:235,t:'ordine di visita (numero sotto il nodo)',size:12,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: { s:{tono:'ora',sotto:'1'} } },
    { nota: '{{j|s004|'}}', set: { s:{tono:'dato',sotto:'1'}, a:{tono:'dato',sotto:'2'}, b:{tono:'dato',sotto:'3'}, c:{tono:'dato',sotto:'4'}, d:{tono:'ora',sotto:'5'}, sa:{tono:'ok'}, ab:{tono:'ok'}, bc:{tono:'ok'}, cd:{tono:'ok'} } },
    { nota: '{{j|s005|'}}', set: { d:{tono:'dato',sotto:'5'}, a:{tono:'dato',sotto:'2'}, da:{tono:'no'} } },
    { nota: '{{j|s006|'}}', set: { d:{tono:'ok',sotto:'5'}, c:{tono:'ok',sotto:'4'}, b:{tono:'ok',sotto:'3'}, a:{tono:'ok',sotto:'2'}, da:{tono:null} } },
    { nota: '{{j|s007|'}}', set: { s:{tono:'ora',sotto:'1'}, e:{tono:'ora',sotto:'6'}, se:{tono:'ok'} } }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t,tono) => ({id,tipo:'nodo',x,y,t,r:20,tono});
const A = (id,da,a) => ({id,tipo:'arco',da,a,dir:false});
SCENE.compon = {
  w: 520, h: 210, lato: true,
  legenda: '{{j|s008|'}}',
  oggetti: [
    N('a',60,60,'a'), N('b',150,60,'b'), N('c',105,130,'c'),
    N('d',300,60,'d'), N('e',390,60,'e'),
    N('f',350,150,'f'),
    A('ab','a','b'), A('bc','b','c'), A('ca','c','a'), A('de','d','e'), A('ef','e','f'),
    {id:'t1',tipo:'testo',x:300,y:200,t:'',size:12,bold:true}
  ],
  passi: [
    { nota: '{{j|s009|'}}', set: { a:{tono:'dato'}, b:{tono:'dato'}, c:{tono:'dato'}, t1:{t:'componente 1: {a, b, c}'} } },
    { nota: '{{j|s010|'}}', set: { d:{tono:'ora'}, e:{tono:'ora'}, f:{tono:'ora'}, t1:{t:'componente 2: {d, e, f}'} } },
    { nota: '{{j|s011|'}}', set: { d:{tono:'dato'}, e:{tono:'dato'}, f:{tono:'dato'}, t1:{t:'2 componenti, O(n + m)',tono:'ok'} } }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:20});
const A = (id,da,a,extra) => Object.assign({id,tipo:'arco',da,a,dir:true},extra||{});
SCENE.dfsdir = {
  w: 520, h: 260, lato: true,
  legenda: '{{j|s012|'}}',
  oggetti: [
    N('s',60,130,'s'), N('a',180,50,'a'), N('b',320,50,'b'), N('c',320,190,'c'), N('d',180,210,'d'),
    A('sa','s','a'), A('ab','a','b'), A('bc','b','c'), A('ca','c','a'), A('sd','s','d'), A('dc','d','c'),
    {id:'c1',tipo:'testo',x:20,y:252,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: "Grafo <b>diretto</b>. La DFS dà a ogni nodo tre stati: non visto, <b>in corso</b> (sulla pila, ha ancora vicini da guardare), <b>finito</b>. Scendo s → a → b → c, scrivendo il numero di scoperta d.", set:{s:{tono:'dato',sotto:'d=1'},a:{tono:'dato',sotto:'d=2'},b:{tono:'dato',sotto:'d=3'},c:{tono:'ora',sotto:'d=4'},c1:{t:'sulla pila: s, a, b, c'}} },
    { nota: "Da c l'arco verso <b>a</b>: a è <b>in corso</b>, cioè è un antenato di c sulla pila. È un <b>back edge</b>: chiude il ciclo a → b → c → a.", set:{ca:{tono:'no'},a:{tono:'ora'},c1:{t:'a è in corso: ciclo a → b → c → a',tono:'no'}} },
    { nota: "c non ha altro: finisce (f=5). Poi b (f=6) e a (f=7). Tornano indietro in questo ordine.", set:{ca:{tono:null},a:{tono:'ok',sotto:'d=2 f=7'},b:{tono:'ok',sotto:'d=3 f=6'},c:{tono:'ok',sotto:'d=4 f=5'},c1:{t:'finiti: c, b, a'}} },
    { nota: "Da s resta il vicino <b>d</b> (d=8). L'arco d → c punta a c, che è già <b>finito</b>: non è un antenato, quindi <b>non c'è ciclo</b>. Regola per i grafi diretti: ciclo solo se l'arco va verso un nodo <i>in corso</i>.", set:{d:{tono:'ora',sotto:'d=8'},dc:{tono:'due'},c1:{t:'d → c verso un nodo finito: nessun ciclo',tono:'ok'}} },
    { nota: "d finisce (f=9), poi s (f=10). Il ciclo trovato è uno solo, quello con l'arco all'indietro. Costo O(n + m).", set:{d:{tono:'ok',sotto:'d=8 f=9'},s:{tono:'ok',sotto:'d=1 f=10'},c1:{t:'un solo back edge: un ciclo',tono:'ok'}} }
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
  <figure class="scena" data-scena="dfs" data-titolo="{{a|s018|}}"></figure>
</section>
<section>
  <h2>{{s|s019|}}</h2>
<p>{{s|s020|}}</p>
<p>{{s|s021|}}</p>
<div class="box attenzione" data-tit="{{a|s022|}}"><p>{{s|s023|}}</p></div>
</section>
<section>
  <h2>{{s|s024|}}</h2>
<p>{{s|s025|}}</p>
  <figure class="scena" data-scena="compon" data-titolo="{{a|s026|}}"></figure>
</section>
<section>
  <h2>{{s|s027|}}</h2>
<p>{{s|s028|}}</p>
<p>{{s|s029|}}</p>
  <figure class="scena" data-scena="dfsdir" data-titolo="{{a|s030|}}"></figure>
</section>
<section>
  <h2>{{s|s031|}}</h2>
<p>{{s|s032|}}</p>
<p>{{s|s033|}}</p>
</section>
<section>
  <h2>{{s|s034|}}</h2>
  <p>{{s|s035|}}</p>
  <p>{{s|s036|}}</p>
</section>
<section>
  <h2>{{s|s037|}}</h2>
<div class="box esame" data-tit="{{a|s038|}}">
<p>{{s|s039|}}</p>
<p>{{s|s040|}}</p>
</div>
</section>
<section>
  <h2>{{s|s041|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s042|}}</th><th>{{s|s043|}}</th><th>{{s|s044|}}</th></tr></thead><tbody><tr><td>{{s|s045|}}</td><td>{{s|s046|}}</td><td>{{s|s047|}}</td></tr><tr><td>{{s|s048|}}</td><td>{{s|s049|}}</td><td>{{s|s050|}}</td></tr><tr><td>{{s|s051|}}</td><td>O(n + m)</td><td>{{s|s052|}}</td></tr><tr><td>{{s|s053|}}</td><td>{{s|s054|}}</td><td>{{s|s055|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
