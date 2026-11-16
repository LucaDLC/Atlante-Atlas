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
const seq = [0,1,2,3,4,5,6,7,8].map(n => n.toString(2).padStart(4,'0').split(''));
const cc = (k) => seq[k].map(String);
SCENE.cont = {
  w: 540, h: 230, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    {id:'g',tipo:'celle',x:40,y:60,cw:58,ch:40,valori:cc(0),indici:false},
    {id:'lab',tipo:'testo',x:40,y:40,t:'bit 3  bit 2  bit 1  bit 0',size:11,anchor:'start'},
    {id:'c1',tipo:'testo',x:40,y:150,t:'',size:13,bold:true,anchor:'start'},
    {id:'c2',tipo:'testo',x:40,y:180,t:'',size:12,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{} },
    { nota: '{{j|s004|'}}', set:{g:{valori:cc(1),toni:{3:'ora'}},c1:{t:'0000 → 0001: 1 bit'}} },
    { nota: '{{j|s005|'}}', set:{g:{valori:cc(2),toni:{2:'ora',3:'no'}},c1:{t:'0001 → 0010: 2 bit'}} },
    { nota: '{{j|s006|'}}', set:{g:{valori:cc(4),toni:{1:'ora',2:'no',3:'no'}},c1:{t:'0011 → 0100: 3 bit'}} },
    { nota: '{{j|s007|'}}', set:{g:{valori:cc(8),toni:{0:'ok'}},c1:{t:'totale 15 cambi in 8 incrementi',tono:'ok'},c2:{t:'costo ammortizzato: O(1) per incremento'}} }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const passi = [{nota: "Un array dinamico (come <code>ArrayList</code>) raddoppia la capacità quando è pieno: copia tutti gli elementi in un array doppio. Conto il costo di ogni inserimento: 1 per scrivere, più le copie.", set:{}}];
const og = [{id:'g',tipo:'celle',x:30,y:50,cw:40,ch:30,valori:Array(8).fill(''),indici:false,toni:{}},{id:'t',tipo:'testo',x:30,y:130,t:'',size:13,bold:true,anchor:'start'},{id:'t2',tipo:'testo',x:30,y:160,t:'',size:12,anchor:'start'}];
let cap = 1, n = 0, copie = 0;
for (let k = 1; k <= 8; k++) {
  let nota = "Inserimento " + k + ". ";
  if (n === cap) { copie += n; nota += "L'array è pieno (" + n + " elementi): copio " + n + " elementi in un array di capacità " + (2*cap) + ". Costo " + (n + 1) + "."; cap *= 2; }
  else nota += "C'è posto: costo 1.";
  n++;
  const v = Array(8).fill(''); for (let i = 0; i < n; i++) v[i] = String(i + 1);
  const toni = {}; toni[n-1] = 'ora';
  passi.push({nota, set:{g:{valori:v,toni}, t:{t:"dopo " + k + " inserimenti: copie totali = " + copie}, t2:{t:"costo totale " + (k + copie) + " ≤ 3·" + k}}});
}
passi.push({nota: "Le copie sono 1 + 2 + 4 = 7 < 8: in generale le copie totali sono meno di <b>2n</b>. Quindi n inserimenti costano meno di 3n: <b>O(1) ammortizzato</b> per inserimento, anche se uno singolo può costare O(n).", set:{t:{t:"copie < 2n → O(1) ammortizzato",tono:'ok'}}});
SCENE.arr = {w: 540, h: 200, lato: true, legenda: '{{j|s008|'}}', oggetti: og, passi};
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
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s012|}}</th><th>{{s|s013|}}</th><th>{{s|s014|}}</th></tr></thead><tbody>
<tr><td>{{s|s015|}}</td><td>{{s|s016|}}</td><td>{{s|s017|}}</td></tr>
<tr><td>{{s|s018|}}</td><td>{{s|s019|}}</td><td>{{s|s020|}}</td></tr>
<tr><td>{{s|s021|}}</td><td>{{s|s022|}}</td><td>{{s|s023|}}</td></tr>
<tr><td>{{s|s024|}}</td><td>{{s|s025|}}</td><td>{{s|s026|}}</td></tr>
<tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
<tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr>
</tbody></table></div>
</section>
<section>
  <h2>{{s|s033|}}</h2>
<p>{{s|s034|}}</p>
  <figure class="scena" data-scena="cont" data-titolo="{{a|s035|}}"></figure>
<p>{{s|s036|}}</p>
  <figure class="scena" data-scena="arr" data-titolo="{{a|s037|}}"></figure>
</section>
<section>
  <h2>{{s|s038|}}</h2>
<p>{{s|s039|}}</p>
</section>
<section>
  <h2>{{s|s040|}}</h2>
<div class="box esame" data-tit="{{a|s041|}}">
<p>{{s|s042|}}</p>
</div>
</section>
<section>
  <h2>{{s|s043|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s044|}}</th><th>{{s|s045|}}</th><th>{{s|s046|}}</th></tr></thead><tbody><tr><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td></tr><tr><td>{{s|s050|}}</td><td>{{s|s051|}}</td><td>{{s|s052|}}</td></tr><tr><td>{{s|s053|}}</td><td>O(m α(m, n))</td><td>{{s|s054|}}</td></tr><tr><td>{{s|s055|}}</td><td>{{s|s056|}}</td><td>{{s|s057|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
