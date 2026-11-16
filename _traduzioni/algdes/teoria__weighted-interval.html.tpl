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
const J = [[1,3,2],[2,5,4],[4,7,4],[6,9,7],[8,10,2]];
const X = t => 40 + t * 44; const og = [];
for (let t = 0; t <= 10; t++) og.push({id:'tk'+t,tipo:'testo',x:X(t),y:262,t:String(t),size:11});
og.push({id:'asse',tipo:'linea',x1:X(0),y1:250,x2:X(10),y2:250});
J.forEach(([s,f,v],i) => og.push({id:'j'+i,tipo:'rett',x:X(s),y:20+i*40,w:(f-s)*44,h:26,t:'v='+v}));
og.push({id:'c',tipo:'testo',x:40,y:292,t:'',size:12,bold:true,anchor:'start'});
const passi = [{nota:'{{j|s002|'}}', set:{}}];
passi.push({nota:'{{j|s003|'}}', set:{c:{t:'p(1)=0, p(2)=0, p(3)=1, p(4)=2, p(5)=3'}}});
passi.push({nota:'{{j|s004|'}}', set:{j0:{tono:'ora'},j1:{tono:'ora'},c:{t:'OPT(1)=2, OPT(2)=4'}}});
passi.push({nota:'{{j|s005|'}}', set:{j0:{tono:null},j1:{tono:null},j2:{tono:'ora'},j3:{tono:'ora'},c:{t:'OPT(3)=6, OPT(4)=11'}}});
passi.push({nota:'{{j|s006|'}}', set:{j2:{tono:'no'},j3:{tono:'ok'},j1:{tono:'ok'},j4:{tono:'no'},c:{t:'OPT(5) = 11: scelgo j2 e j4',tono:'ok'}}});
SCENE.wis = {w:540,h:300,lato:true,legenda:'{{j|s007|'}}',oggetti:og,passi};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const X = t => 40 + t * 44;
SCENE.wgre = {
  w: 540, h: 200, lato: true,
  legenda: '{{j|s008|'}}',
  oggetti: [
    {id:'big',tipo:'rett',x:X(0),y:20,w:10*44,h:30,t:'v = 10',tono:'dato'},
    {id:'p',tipo:'rett',x:X(0),y:70,w:5*44,h:30,t:'v = 1',tono:'dato'},
    {id:'q',tipo:'rett',x:X(5),y:70,w:5*44,h:30,t:'v = 1',tono:'dato'},
    {id:'c',tipo:'testo',x:40,y:150,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: "Tre intervalli: uno lungo con valore 10 (da 0 a 10) e due corti da 1 (0–5 e 5–10).", set:{} },
    { nota: "Il greedy per fine prende prima i corti (finiscono a 5 e 10): ne prende due, valore <b>2</b>. Il lungo si sovrappone e viene scartato.", set:{p:{tono:'ok'},q:{tono:'ok'},big:{tono:'no'},c:{t:'greedy per fine: valore 2',tono:'no'}} },
    { nota: "L'ottimo è il lungo da solo: valore <b>10</b>. Con i pesi serve la DP (prendere o saltare, job per job).", set:{p:{tono:'no'},q:{tono:'no'},big:{tono:'ok'},c:{t:'ottimo: valore 10',tono:'ok'}} }
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
  <figure class="scena" data-scena="wis" data-titolo="{{a|s013|}}"></figure>
<p>{{s|s014|}}</p>
  <figure class="scena" data-scena="wgre" data-titolo="{{a|s015|}}"></figure>
</section>
<section>
  <h2>{{s|s016|}}</h2>
<p>{{s|s017|}}</p>
</section>
<section>
  <h2>{{s|s018|}}</h2>
  <p>{{s|s019|}}</p>
  <p>{{s|s020|}}</p>
</section>
<section>
  <h2>{{s|s021|}}</h2>
<div class="box esame" data-tit="{{a|s022|}}">
<p>{{s|s023|}}</p>
</div>
</section>
<section>
  <h2>{{s|s024|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s025|}}</th><th>{{s|s026|}}</th><th>{{s|s027|}}</th></tr></thead><tbody><tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td><td>{{s|s030|}}</td></tr><tr><td>{{s|s031|}}</td><td>{{s|s032|}}</td><td>{{s|s033|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
