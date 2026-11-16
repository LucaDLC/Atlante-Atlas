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
const A = (id,da,a,t,extra) => Object.assign({id,tipo:'arco',da,a,dir:true,t},extra||{});
SCENE.bf = {
  w: 520, h: 250, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('s',60,120,'s'), N('a',230,50,'a'), N('b',230,190,'b'), N('c',400,120,'c'),
    A('sa','s','a','4'), A('sb','s','b','5'), A('ab','a','b','−3',{tono:'no'}), A('ac','a','c','2'), A('bc','b','c','6'),
    {id:'c1',tipo:'testo',x:20,y:240,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{s:{tono:'dato',sotto:'0'},a:{sotto:'∞'},b:{sotto:'∞'},c:{sotto:'∞'}} },
    { nota: '{{j|s004|'}}', set:{a:{tono:'ora',sotto:'4'},b:{tono:'ora',sotto:'1'},c1:{t:'giro 1: a=4, b=1'}} },
    { nota: '{{j|s005|'}}', set:{c:{tono:'ok',sotto:'6'},a:{tono:'dato',sotto:'4'},b:{tono:'dato',sotto:'1'},ac:{tono:'ok'},bc:{tono:'ok'},c1:{t:'d: s 0 · a 4 · b 1 · c 6',tono:'ok'}} },
    { nota: '{{j|s006|'}}', set:{c1:{t:'O(n·m); un giro in più scopre i cicli negativi'}} }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const R = [['0','∞','∞','∞'],['0','4','5','∞'],['0','4','1','6'],['0','4','1','6']];
const vista = n => R.map((r,i) => i < n ? r : ['','','','']);
SCENE.bftab = {
  w: 480, h: 250, lato: true,
  legenda: '{{j|s007|'}}',
  oggetti: [
    {id:'g',tipo:'griglia',x:90,y:40,cw:70,ch:34,valori:vista(1),intR:['i=0','i=1','i=2','i=3'],intC:['s','a','b','c']},
    {id:'t',tipo:'testo',x:20,y:235,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: "<code>OPT(i, v)</code> = costo minimo da s a v usando <b>al più i archi</b>. Riga 0: con zero archi arrivo solo in s (costo 0); gli altri valgono ∞.", set:{g:{valori:vista(1),toni:{'0,0':'dato','0,1':'dato','0,2':'dato','0,3':'dato'}}} },
    { nota: "Riga 1: <code>OPT(1, v) = min( OPT(0, v), min su u→v di OPT(0, u) + peso )</code>. a: 0 + 4 = 4. b: 0 + 5 = 5. c: nessun arco esce da s verso c, resta ∞.", set:{g:{valori:vista(2),toni:{'0,0':'dato','1,1':'ora','1,2':'ora'}},t:{t:'riga 1: a = 4, b = 5'}} },
    { nota: "Riga 2. b: min(5, OPT(1, a) + (−3) = 1) = <b>1</b>: il peso negativo migliora b. c: min(OPT(1, a) + 2 = 6, OPT(1, b) + 6 = 11) = <b>6</b>. Si usa sempre la riga <i>sopra</i>.", set:{g:{valori:vista(3),toni:{'2,2':'ora','2,3':'ora'}},t:{t:'riga 2: b = 1, c = 6'}} },
    { nota: "Riga 3 = riga 2: nessun valore cambia, quindi si può fermare il calcolo. Con n = 4 nodi bastano n − 1 = 3 righe. Se la riga n cambiasse ancora, un ciclo negativo raggiungibile abbasserebbe i costi all'infinito.", set:{g:{valori:vista(4),toni:{'3,0':'ok','3,1':'ok','3,2':'ok','3,3':'ok'}},t:{t:'stabile: s 0 · a 4 · b 1 · c 6',tono:'ok'}} }
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
<p>{{s|s011|}}</p>
  <figure class="scena" data-scena="bf" data-titolo="{{a|s012|}}"></figure>
  <p>{{s|s013|}}</p>
  <figure class="scena" data-scena="bftab" data-titolo="{{a|s014|}}"></figure>
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
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s026|}}</th><th>{{s|s027|}}</th><th>{{s|s028|}}</th></tr></thead><tbody><tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr><tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr><tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
