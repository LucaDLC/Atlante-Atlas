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
const A = (id,da,a,t) => ({id,tipo:'arco',da,a,dir:false,t});
SCENE.kru = {
  w: 520, h: 270, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('a',60,70,'a'), N('b',180,40,'b'), N('c',300,70,'c'), N('d',300,190,'d'), N('e',180,200,'e'),
    A('ab','a','b','1'), A('bc','b','c','2'), A('de','d','e','2'), A('ac','a','c','3'), A('cd','c','d','4'), A('be','b','e','5'),
    {id:'c1',tipo:'testo',x:20,y:250,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{ab:{tono:'dato'},bc:{tono:'dato'},de:{tono:'dato'},ac:{tono:'dato'},cd:{tono:'dato'},be:{tono:'dato'}} },
    { nota: '{{j|s004|'}}', set:{ab:{tono:'ok'},c1:{t:'preso: ab(1)'}} },
    { nota: '{{j|s005|'}}', set:{bc:{tono:'ok'},c1:{t:'preso: ab(1), bc(2)'}} },
    { nota: '{{j|s006|'}}', set:{de:{tono:'ok'},c1:{t:'preso: ab, bc, de (1+2+2)'}} },
    { nota: '{{j|s007|'}}', set:{ac:{tono:'no'},c1:{t:'ac scartato: chiuderebbe un ciclo'}} },
    { nota: '{{j|s008|'}}', set:{cd:{tono:'ok'},ac:{tono:null},c1:{t:'albero: ab, bc, de, cd · costo 9',tono:'ok'}} }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:18});
const A = (id,da,a,t) => ({id,tipo:'arco',da,a,dir:false,t});
SCENE.prim = {
  w: 520, h: 270, lato: true,
  legenda: '{{j|s009|'}}',
  oggetti: [
    N('a',60,70,'a'), N('b',180,40,'b'), N('c',300,70,'c'), N('d',300,190,'d'), N('e',180,200,'e'),
    A('ab','a','b','1'), A('bc','b','c','2'), A('de','d','e','2'), A('ac','a','c','3'), A('cd','c','d','4'), A('be','b','e','5'),
    {id:'c1',tipo:'testo',x:20,y:250,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: "Stesso grafo di Kruskal. Parto dal nodo <b>a</b>: l'albero è {a}. Gli archi che escono dall'albero sono ab (1) e ac (3).", set:{a:{tono:'ok'},ab:{tono:'ora'},ac:{tono:'dato'},c1:{t:'albero {a} · candidati: ab 1, ac 3'}} },
    { nota: "Prendo il più economico: <b>ab = 1</b>. Albero {a, b}. Ora escono ac (3), bc (2), be (5).", set:{ab:{tono:'ok'},b:{tono:'ok'},bc:{tono:'ora'},ac:{tono:'dato'},be:{tono:'dato'},c1:{t:'albero {a, b} · candidati: ac 3, bc 2, be 5'}} },
    { nota: "Il minimo è <b>bc = 2</b>. Albero {a, b, c}. L'arco ac ora ha entrambi gli estremi nell'albero: è interno, non serve più. Escono cd (4) e be (5).", set:{bc:{tono:'ok'},c:{tono:'ok'},ac:{tono:'no'},cd:{tono:'ora'},be:{tono:'dato'},c1:{t:'albero {a, b, c} · candidati: cd 4, be 5'}} },
    { nota: "Il minimo è <b>cd = 4</b>. Albero {a, b, c, d}. Escono de (2) e be (5).", set:{cd:{tono:'ok'},d:{tono:'ok'},de:{tono:'ora'},be:{tono:'dato'},c1:{t:'albero {a, b, c, d} · candidati: de 2, be 5'}} },
    { nota: "Prendo <b>de = 2</b>. Tutti i nodi sono nell'albero (4 = n − 1 archi): costo 1 + 2 + 4 + 2 = <b>9</b>, come Kruskal (cambia l'ordine, non il costo).", set:{de:{tono:'ok'},e:{tono:'ok'},be:{tono:'no'},c1:{t:'costo 9',tono:'ok'}} }
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
<p>{{s|s017|}}</p>
  <figure class="scena" data-scena="kru" data-titolo="{{a|s018|}}"></figure>
</section>
<section>
  <h2>{{s|s019|}}</h2>
<p>{{s|s020|}}</p>
<p>{{s|s021|}}</p>
</section>
<section>
  <h2>{{s|s022|}}</h2>
<p>{{s|s023|}}</p>
  <figure class="scena" data-scena="prim" data-titolo="{{a|s024|}}"></figure>
<p>{{s|s025|}}</p>
<p>{{s|s026|}}</p>
</section>
<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
  <p>{{s|s029|}}</p>
</section>
<section>
  <h2>{{s|s030|}}</h2>
<div class="box esame" data-tit="{{a|s031|}}">
<p>{{s|s032|}}</p>
<p>{{s|s033|}}</p>
</div>
</section>
<section>
  <h2>{{s|s034|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s035|}}</th><th>{{s|s036|}}</th><th>{{s|s037|}}</th></tr></thead><tbody><tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr><tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr><tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr><tr><td>n − 1</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
