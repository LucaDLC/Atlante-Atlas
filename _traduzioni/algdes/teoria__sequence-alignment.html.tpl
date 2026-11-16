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
const A = 'ALTO', B = 'ALTRO';
const D = [[0,1,2,3,4,5],[1,0,1,2,3,4],[2,1,0,1,2,3],[3,2,1,0,1,2],[4,3,2,1,1,1]];
const vuota = D.map((r,i) => r.map((v,j) => (i===0||j===0) ? String(v) : ''));
SCENE.seq = {
  w: 560, h: 280, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    {id:'g',tipo:'griglia',x:90,y:50,cw:50,ch:34,valori:vuota,intR:['', 'A','L','T','O'].slice(0,5),intC:['','A','L','T','R','O'].slice(0,6)},
    {id:'t',tipo:'testo',x:20,y:270,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{} },
    { nota: '{{j|s004|'}}', set:{g:{valori:vuota,toni:{}}} },
    { nota: '{{j|s005|'}}', set:{g:{valori:D.map((r,i)=>r.map((v,j)=> (i<=1&&j<=1)||(i===0||j===0)?String(v):'')),toni:{'1,1':'ora'}}} },
    { nota: '{{j|s006|'}}', set:{g:{valori:D.map((r,i)=>r.map((v,j)=> (i===4&&j===5)?'':String(v))),toni:{'4,4':'ora'}}} },
    { nota: '{{j|s007|'}}', set:{g:{valori:D.map(r=>r.map(v=>String(v))),toni:{'4,5':'ok'}}, t:{t:'distanza = 1',tono:'ok'}} }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const D = [[0,1,2,3,4,5],[1,0,1,2,3,4],[2,1,0,1,2,3],[3,2,1,0,1,2],[4,3,2,1,1,1]];
SCENE.seqtr = {
  w: 560, h: 280, lato: true,
  legenda: '{{j|s008|'}}',
  oggetti: [
    {id:'g',tipo:'griglia',x:90,y:50,cw:50,ch:34,valori:D.map(r=>r.map(String)),intR:['','A','L','T','O'],intC:['','A','L','T','R','O']},
    {id:'t',tipo:'testo',x:20,y:262,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: "Come per il knapsack, la tabella dà il costo ma non l'allineamento. Lo ricostruisco risalendo dalla cella finale <b>(4, 5) = 1</b> verso (0, 0), seguendo la mossa che ha dato il minimo.", set:{g:{toni:{'4,5':'ora'}}, t:{t:'parto da OPT(4, 5) = 1'}} },
    { nota: "In (4, 5): O e O sono uguali, la diagonale dà OPT(3, 4) + 0 = 1 = valore della cella. Mossa <b>diagonale</b>: allineo O con O. Vado in (3, 4).", set:{g:{toni:{'4,5':'ok','3,4':'ora'}}, t:{t:'O con O (uguali)'}} },
    { nota: "In (3, 4) = 1: la diagonale darebbe OPT(2, 3) + 1 (T≠R) = 2, troppo. Da sinistra: OPT(3, 3) + 1 = 1 ✓. Mossa <b>orizzontale</b>: nella seconda parola c'è una R in più, la <b>inserisco</b>. Vado in (3, 3).", set:{g:{toni:{'4,5':'ok','3,4':'ok','3,3':'ora'}}, t:{t:'inserimento di R'}} },
    { nota: "Da (3, 3) tre diagonali di fila (T con T, L con L, A con A, costo 0) portano in (0, 0).", set:{g:{toni:{'4,5':'ok','3,4':'ok','3,3':'ok','2,2':'ok','1,1':'ok','0,0':'ok'}}, t:{t:'T–T, L–L, A–A'}} },
    { nota: "Allineamento letto da (0, 0) a (4, 5): <code>A L T – O</code> sopra <code>A L T R O</code>. Il trattino è la R inserita: costo 1.", set:{t:{t:'A L T – O / A L T R O · costo 1',tono:'ok'}} }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s009|}}</h1>
  <p class="lede">{{s|s010|}}</p>
</header>

<section>
  <h2>{{s|s011|}}</h2>
<p>{{s|s012|}}</p>
<p>{{s|s013|}}</p>
<p>{{s|s014|}}</p>
  <figure class="scena" data-scena="seq" data-titolo="{{a|s015|}}"></figure>
</section>
<section>
  <h2>{{s|s016|}}</h2>
<p>{{s|s017|}}</p>
  <figure class="scena" data-scena="seqtr" data-titolo="{{a|s018|}}"></figure>
<p>{{s|s019|}}</p>
</section>
<section>
  <h2>{{s|s020|}}</h2>
  <p>{{s|s021|}}</p>
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
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s027|}}</th><th>{{s|s028|}}</th><th>{{s|s029|}}</th></tr></thead><tbody><tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr><tr><td>{{s|s033|}}</td><td>{{s|s034|}}</td><td>{{s|s035|}}</td></tr><tr><td>{{s|s036|}}</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
