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
const ELEM = ['1','2','3'];
const righe = [[0,'{}'],[1,'{1}'],[2,'{2}'],[3,'{1, 2}'],[4,'{3}'],[5,'{1, 3}'],[6,'{2, 3}'],[7,'{1, 2, 3}']];
const celle = (k) => ['','',''].map((_,i) => ((k >> i) & 1) ? '1' : '0');
SCENE.bits = {
  w: 540, h: 290, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    {id:'h',tipo:'testo',x:20,y:26,t:'k   bit (i = 2,1,0)   sottoinsieme',size:12,bold:true,anchor:'start'},
    ...righe.map(([k,s],i) => ({id:'r'+k,tipo:'testo',x:20,y:52+i*28,t:k + '    ' + celle(k).join(' ') + '     ' + s,size:13,anchor:'start'})),
    {id:'c1',tipo:'testo',x:20,y:282,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{} },
    { nota: '{{j|s004|'}}', set:{r0:{tono:'dato'},r1:{tono:'ora'},c1:{t:'k = 1 → {1}'}} },
    { nota: '{{j|s005|'}}', set:{r0:{tono:'dato'},r1:{tono:'dato'},r2:{tono:'dato'},r3:{tono:'ora'},c1:{t:'k = 3 → {1, 2}'}} },
    { nota: '{{j|s006|'}}', set:{r7:{tono:'ok'},c1:{t:'8 sottoinsiemi = 2³',tono:'ok'}} }
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
  <figure class="scena" data-scena="bits" data-titolo="{{a|s011|}}"></figure>
</section>
<section>
  <h2>{{s|s012|}}</h2>
<p>{{s|s013|}}</p>
<p>{{s|s014|}}</p>
</section>
<section>
  <h2>{{s|s015|}}</h2>
<p>{{s|s016|}}</p>
</section>
<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <p>{{s|s019|}}</p>
</section>
<section>
  <h2>{{s|s020|}}</h2>
  <p>{{s|s021|}}</p>
  <p>{{s|s022|}}</p>
  <ol>
    <li>{{s|s023|}}</li>
    <li>{{s|s024|}}</li>
    <li>{{s|s025|}}</li>
  </ol>
  <figure class="scena" data-scena="perm" data-titolo="{{a|s026|}}"></figure>
  <p>{{s|s027|}}</p>
</section>
<section>
  <h2>{{s|s028|}}</h2>
<div class="box esame" data-tit="{{a|s029|}}">
<p>{{s|s030|}}</p>
</div>
</section>
<section>
  <h2>{{s|s031|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s032|}}</th><th>{{s|s033|}}</th><th>{{s|s034|}}</th></tr></thead><tbody><tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr><tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr><tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr></tbody></table></div>
</section>

</main>
<script>
window.SCENE = window.SCENE || {};
(function () {
const Q = (id,x,t) => ({id,tipo:'rett',x,y:70,w:60,h:50,t});
const ogg = [
  Q('q0',150,'1'), Q('q1',230,'3'), Q('q2',310,'2'),
  {id:'c',tipo:'testo',x:40,y:170,t:'',size:13,bold:true,anchor:'start'}
];
const passi = [
  {nota:"Parto da <b>1 3 2</b>. Da destra: <b>3 2</b> è decrescente, la fila smette di crescere lì. Il <b>1</b> è il pivot: è il numero da aumentare, perché prima del 3 la fila cresce ancora.", set:{q0:{tono:'ora'}, q1:{tono:'due'}, q2:{tono:'due'}, c:{t:'132 → ?'}}},
  {nota:"Nel suffisso cerco il più piccolo numero maggiore di 1: è il <b>2</b>. Li scambio: la fila diventa <b>2 3 1</b>.", set:{q0:{t:'2', tono:'ora'}, q1:{tono:'due'}, q2:{t:'1', tono:'due'}, c:{t:'scambio: 2 3 1'}}},
  {nota:"Il suffisso <b>3 1</b> è decrescente: lo rovescio e diventa <b>1 3</b>, il più piccolo possibile. Risultato: <b>2 1 3</b>, la permutazione successiva a 132.", set:{q0:{tono:'ok'}, q1:{t:'1', tono:'ok'}, q2:{t:'3', tono:'ok'}, c:{t:'132 → 213', tono:'ok'}}}
];
SCENE.perm = {
  w: 540, h: 230, lato: true,
  legenda: '{{j|s044|'}}',
  oggetti: ogg, passi
};
})();
</script>
</body>
</html>
