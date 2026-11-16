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
const T0 = [[0,0,0,0,0,0,0],[0,1,1,1,1,1,1],[0,1,6,7,7,7,7],[0,1,6,7,7,18,19]];
const blank = ['','','','','','',''];
const riga = (k) => T0[k].map(String);
const vista = (n) => [0,1,2,3].map(k => k < n ? riga(k) : blank);
SCENE.dpk = {
  w: 560, h: 240, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    {id:'g',tipo:'griglia',x:50,y:40,cw:56,ch:36,valori:vista(1),intR:['0','1','2','3'],intC:['0','1','2','3','4','5','6']},
    {id:'t',tipo:'testo',x:50,y:220,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{g:{valori:vista(1),toni:{}}} },
    { nota: '{{j|s004|'}}', set:{g:{valori:vista(1),toni:{'0,0':'dato','0,1':'dato','0,2':'dato','0,3':'dato','0,4':'dato','0,5':'dato','0,6':'dato'}}} },
    { nota: '{{j|s005|'}}', set:{g:{valori:vista(2),toni:{'1,1':'ok','1,2':'ok','1,3':'ok','1,4':'ok','1,5':'ok','1,6':'ok'}}, t:{t:'riga 1 completa'}} },
    { nota: '{{j|s006|'}}', set:{g:{valori:vista(3),toni:{'2,2':'ok','2,3':'ok','2,4':'ok','2,5':'ok','2,6':'ok'}}, t:{t:'OPT(2,3) = 7'}} },
    { nota: '{{j|s007|'}}', set:{g:{valori:vista(4),toni:{'3,5':'ora','3,6':'ok'}}, t:{t:'OPT(3, 6) = 19: risposta',tono:'ok'}} }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const T0 = [[0,0,0,0,0,0,0],[0,1,1,1,1,1,1],[0,1,6,7,7,7,7],[0,1,6,7,7,18,19]];
const val = T0.map(r => r.map(String));
SCENE.dptr = {
  w: 560, h: 240, lato: true,
  legenda: '{{j|s008|'}}',
  oggetti: [
    {id:'g',tipo:'griglia',x:50,y:40,cw:56,ch:36,valori:val,intR:['0','1','2','3'],intC:['0','1','2','3','4','5','6']},
    {id:'t',tipo:'testo',x:50,y:222,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: "Voglio sapere <b>quali</b> oggetti danno 19. Stessa tabella (oggetti (peso, valore): (1, 1), (2, 6), (5, 18); W = 6). Parto dalla risposta, cella (3, 6), e risalgo.", set:{g:{toni:{'3,6':'ora'}}, t:{t:'parto da OPT(3, 6) = 19'}} },
    { nota: "OPT(3, 6) = 19 è diverso da OPT(2, 6) = 7: senza l'oggetto 3 non si arriva a 19, quindi l'<b>oggetto 3 è preso</b>. Mi sposto in (2, 6 − 5) = (2, 1).", set:{g:{toni:{'3,6':'ok','2,6':'no','2,1':'ora'}}, t:{t:'oggetto 3 preso → budget 1'}} },
    { nota: "OPT(2, 1) = 1 è uguale a OPT(1, 1) = 1: l'oggetto 2 (peso 2) non ci sta in budget 1, quindi <b>non è preso</b>. Scendo in (1, 1).", set:{g:{toni:{'3,6':'ok','2,1':'no','1,1':'ora'}}, t:{t:'oggetto 2 non preso'}} },
    { nota: "OPT(1, 1) = 1 è diverso da OPT(0, 1) = 0: l'<b>oggetto 1 è preso</b>. Budget 1 − 1 = 0, arrivo in (0, 0): finito.", set:{g:{toni:{'3,6':'ok','1,1':'ok','0,1':'no','0,0':'ora'}}, t:{t:'oggetto 1 preso → budget 0'}} },
    { nota: "Soluzione: oggetti 1 e 3. Peso 1 + 5 = 6 ≤ 6, valore 1 + 18 = <b>19</b>. Il traceback costa O(n) dopo aver riempito la tabella.", set:{g:{toni:{'3,6':'ok','1,1':'ok'}}, t:{t:'{1, 3}: peso 6, valore 19',tono:'ok'}} }
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
<ul>
  <li>{{s|s013|}}</li>
  <li>{{s|s014|}}</li>
  <li>{{s|s015|}}</li>
</ul>
</section>
<section>
  <h2>{{s|s016|}}</h2>
<ol>
  <li>{{s|s017|}}</li>
  <li>{{s|s018|}}</li>
  <li>{{s|s019|}}</li>
  <li>{{s|s020|}}</li>
  <li>{{s|s021|}}</li>
  <li>{{s|s022|}}</li>
  <li>{{s|s023|}}</li>
  <li>{{s|s024|}}</li>
</ol>
  <figure class="scena" data-scena="dpk" data-titolo="{{a|s025|}}"></figure>
</section>
<section>
  <h2>{{s|s026|}}</h2>
<p>{{s|s027|}}</p>
<p>{{s|s028|}}</p>
  <figure class="scena" data-scena="dptr" data-titolo="{{a|s029|}}"></figure>
</section>
<section>
  <h2>{{s|s030|}}</h2>
<p>{{s|s031|}}</p>
<ol>
  <li>{{s|s032|}}</li>
  <li>{{s|s033|}}</li>
  <li>{{s|s034|}}</li>
  <li>{{s|s035|}}</li>
  <li>{{s|s036|}}</li>
  <li>{{s|s037|}}</li>
</ol>
</section>
<section>
  <h2>{{s|s038|}}</h2>
  <p>{{s|s039|}}</p>
  <p>{{s|s040|}}</p>
</section>
<section>
  <h2>{{s|s041|}}</h2>
<div class="box esame" data-tit="{{a|s042|}}">
<p>{{s|s043|}}</p>
<p>{{s|s044|}}</p>
</div>
</section>
<section>
  <h2>{{s|s045|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s046|}}</th><th>{{s|s047|}}</th><th>{{s|s048|}}</th></tr></thead><tbody><tr><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td>{{s|s051|}}</td></tr><tr><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr><tr><td>−∞</td><td>{{s|s055|}}</td><td>{{s|s056|}}</td></tr><tr><td>{{s|s057|}}</td><td>{{s|s058|}}</td><td>{{s|s059|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
