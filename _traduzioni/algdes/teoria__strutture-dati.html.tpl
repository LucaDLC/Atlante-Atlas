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
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s008|}}</h1>
  <p class="lede">{{s|s009|}}</p>
</header>

<section>
  <h2>{{s|s010|}}</h2>
<table class="tab"><thead><tr><th>{{s|s011|}}</th><th>{{s|s012|}}</th><th>{{s|s013|}}</th></tr></thead><tbody>
<tr><td>{{s|s014|}}</td><td>{{s|s015|}}</td><td>{{s|s016|}}</td></tr>
<tr><td>{{s|s017|}}</td><td>{{s|s018|}}</td><td>{{s|s019|}}</td></tr>
<tr><td>{{s|s020|}}</td><td>{{s|s021|}}</td><td>{{s|s022|}}</td></tr>
<tr><td>{{s|s023|}}</td><td>{{s|s024|}}</td><td>{{s|s025|}}</td></tr>
<tr><td>{{s|s026|}}</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr>
<tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
</tbody></table>
</section>
<section>
  <h2>{{s|s032|}}</h2>
<p>{{s|s033|}}</p>
  <figure class="scena" data-scena="cont" data-titolo="{{a|s034|}}"></figure>
</section>
<section>
  <h2>{{s|s035|}}</h2>
<p>{{s|s036|}}</p>
</section>
<section>
  <h2>{{s|s037|}}</h2>
<div class="box esame" data-tit="{{a|s038|}}">
<p>{{s|s039|}}</p>
</div>
</section>
<section>
  <h2>{{s|s040|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s041|}}</th><th>{{s|s042|}}</th><th>{{s|s043|}}</th></tr></thead><tbody><tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr><tr><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td></tr><tr><td>{{s|s050|}}</td><td>O(m α(m, n))</td><td>{{s|s051|}}</td></tr><tr><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
