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
const R = (id,y) => ({id,tipo:'celle',x:30,y,cw:50,ch:30,valori:[],indici:false});
SCENE.ms = {
  w: 540, h: 260, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    {id:'r0',tipo:'celle',x:30,y:20,cw:50,ch:30,valori:['5','2','4','7','1','3','2','6'],indici:false,toni:{}},
    {id:'r1',tipo:'celle',x:30,y:110,cw:50,ch:30,valori:['','','','','','','',''],indici:false,toni:{}},
    {id:'r2',tipo:'celle',x:30,y:200,cw:50,ch:30,valori:['','','','','','','',''],indici:false,toni:{}}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{r0:{toni:{0:'dato',1:'dato',2:'dato',3:'dato',4:'dato',5:'dato',6:'dato',7:'dato'}}} },
    { nota: '{{j|s004|'}}', set:{r0:{toni:{0:'ora',1:'ora',2:'ora',3:'ora',4:'due',5:'due',6:'due',7:'due'}}} },
    { nota: '{{j|s005|'}}', set:{r0:{valori:['5','2','4','7','1','3','2','6'],toni:{0:'due',1:'due',2:'ora',3:'ora',4:'ora',5:'ora',6:'due',7:'due'}}} },
    { nota: '{{j|s006|'}}', set:{r1:{valori:['2','5','4','7','1','3','2','6'],toni:{0:'ok',1:'ok',2:'ok',3:'ok',4:'ok',5:'ok',6:'ok',7:'ok'}}, r0:{toni:{}}} },
    { nota: '{{j|s007|'}}', set:{r2:{valori:['2','4','5','7','1','2','3','6'],toni:{0:'ok',1:'ok',2:'ok',3:'ok',4:'ok',5:'ok',6:'ok',7:'ok'}}} },
    { nota: '{{j|s008|'}}', set:{r2:{valori:['1','2','2','3','4','5','6','7'],toni:{0:'ok',1:'ok',2:'ok',3:'ok',4:'ok',5:'ok',6:'ok',7:'ok'}}} }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const L = [2,4,5,7], Rr = [1,2,3,6];
const passi = [{nota: "Due liste ordinate, <b>L</b> e <b>R</b>, e un output vuoto. Tengo due indici: <b>i</b> su L e <b>j</b> su R.", set:{}}];
let i = 0, j = 0; const out = [];
const tonoL = k => { const t = {}; for (let x = 0; x < k; x++) t[x] = 'ok'; return t; };
while (i < L.length || j < Rr.length) {
  let nota, sceltaL;
  if (i < L.length && j < Rr.length) {
    sceltaL = L[i] <= Rr[j];
    nota = "Confronto L[" + i + "] = " + L[i] + " con R[" + j + "] = " + Rr[j] + ". " + (sceltaL ? "Il minore è " + L[i] + " (a parità prendo L, così l'ordinamento è stabile)." : "Il minore è " + Rr[j] + ".") + " Lo sposto nell'output e avanzo l'indice di quella lista.";
  } else if (i < L.length) { sceltaL = true; nota = "R è finita: copio il resto di L (" + L[i] + ")."; }
  else { sceltaL = false; nota = "L è finita: copio il resto di R (" + Rr[j] + ")."; }
  const toniL = tonoL(i), toniR = tonoL(j);
  if (i < L.length) toniL[i] = 'ora'; if (j < Rr.length) toniR[j] = 'ora';
  out.push(sceltaL ? L[i++] : Rr[j++]);
  const o = out.map(String).concat(Array(8 - out.length).fill(''));
  const toniO = {}; toniO[out.length - 1] = 'ok';
  passi.push({nota, set:{L:{toni:toniL}, R:{toni:toniR}, O:{valori:o, toni:toniO}}});
}
passi.push({nota: "Ogni elemento è stato spostato una sola volta: <b>n</b> spostamenti, e ogni confronto ne sposta uno. La fusione costa <b>O(n)</b>.", set:{L:{toni:tonoL(4)}, R:{toni:tonoL(4)}}});
SCENE.mrg = {
  w: 540, h: 250, lato: true, legenda: '{{j|s009|'}}',
  oggetti: [
    {id:'tl',tipo:'testo',x:20,y:20,t:'L',size:13,bold:true,anchor:'start'},
    {id:'L',tipo:'celle',x:50,y:28,cw:50,ch:30,valori:L.map(String),indici:false,toni:{}},
    {id:'tr',tipo:'testo',x:290,y:20,t:'R',size:13,bold:true,anchor:'start'},
    {id:'R',tipo:'celle',x:320,y:28,cw:50,ch:30,valori:Rr.map(String),indici:false,toni:{}},
    {id:'to',tipo:'testo',x:20,y:110,t:'output',size:13,bold:true,anchor:'start'},
    {id:'O',tipo:'celle',x:50,y:120,cw:50,ch:30,valori:Array(8).fill(''),indici:false,toni:{}}
  ],
  passi
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
  <figure class="scena" data-scena="ms" data-titolo="{{a|s014|}}"></figure>
</section>
<section>
  <h2>{{s|s015|}}</h2>
<p>{{s|s016|}}</p>
  <figure class="scena" data-scena="mrg" data-titolo="{{a|s017|}}"></figure>
</section>
<section>
  <h2>{{s|s018|}}</h2>
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
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s027|}}</th><th>{{s|s028|}}</th><th>{{s|s029|}}</th></tr></thead><tbody><tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>O(1)</td></tr><tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>O(n)</td></tr><tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
