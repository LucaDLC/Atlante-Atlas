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
passi.push({nota:'{{j|s004|'}}', set:{j0:{tono:'ok'},c:{t:'OPT(1)=2, OPT(2)=4'}}});
passi.push({nota:'{{j|s005|'}}', set:{j2:{tono:'ok'},j3:{tono:'ok'},c:{t:'OPT(3)=6, OPT(4)=11'}}});
passi.push({nota:'{{j|s006|'}}', set:{j4:{tono:'no'},c:{t:'OPT(5) = 11: scelgo j2 e j4',tono:'ok'}}});
SCENE.wis = {w:540,h:300,lato:true,legenda:'{{j|s007|'}}',oggetti:og,passi};
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
  <figure class="scena" data-scena="wis" data-titolo="{{a|s012|}}"></figure>
</section>
<section>
  <h2>{{s|s013|}}</h2>
<p>{{s|s014|}}</p>
</section>
<section>
  <h2>{{s|s015|}}</h2>
  <p>{{s|s016|}}</p>
  <p>{{s|s017|}}</p>
</section>
<section>
  <h2>{{s|s018|}}</h2>
<div class="box esame" data-tit="{{a|s019|}}">
<p>{{s|s020|}}</p>
</div>
</section>
<section>
  <h2>{{s|s021|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s022|}}</th><th>{{s|s023|}}</th><th>{{s|s024|}}</th></tr></thead><tbody><tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td><td>{{s|s027|}}</td></tr><tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td><td>{{s|s030|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
