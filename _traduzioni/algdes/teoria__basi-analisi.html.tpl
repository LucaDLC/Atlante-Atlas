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
const righe = [['log n',3,'dato'],['n',8,'dato'],['n log n',24,'due'],['n²',64,'ora'],['2ⁿ',256,'no']];
const og = [];
righe.forEach(([nome,v,t],i) => {
  og.push({id:'n'+i,tipo:'testo',x:20,y:40+i*44,t:nome,size:14,bold:true,anchor:'start'});
  og.push({id:'b'+i,tipo:'rett',x:120,y:24+i*44,w:Math.log10(v)*120,h:30,t:String(v),tono:t,nascosto:true});
});
og.push({id:'c',tipo:'testo',x:20,y:270,t:'',size:12,bold:true,anchor:'start'});
const passi = [{nota:'{{j|s002|'}}', set:{}}];
passi.push({nota:'{{j|s003|'}}', set:{b0:{nascosto:false},b1:{nascosto:false},c:{t:'log n = 3 · n = 8'}}});
passi.push({nota:'{{j|s004|'}}', set:{b2:{nascosto:false},c:{t:'n log n = 24'}}});
passi.push({nota:'{{j|s005|'}}', set:{b3:{nascosto:false},b4:{nascosto:false},c:{t:'n² = 64 · 2ⁿ = 256',tono:'ok'}}});
SCENE.cres = {w:540,h:300,lato:true,legenda:'{{j|s006|'}}',oggetti:og,passi};
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
</section>
<section>
  <h2>{{s|s011|}}</h2>
<p>{{s|s012|}}</p>
<ul>
  <li>{{s|s013|}}</li>
  <li>{{s|s014|}}</li>
  <li>{{s|s015|}}</li>
  <li>{{s|s016|}}</li>
</ul>
  <figure class="scena" data-scena="cres" data-titolo="{{a|s017|}}"></figure>
</section>
<section>
  <h2>{{s|s018|}}</h2>
<p>{{s|s019|}}</p>
</section>
<section>
  <h2>{{s|s020|}}</h2>
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
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s026|}}</th><th>{{s|s027|}}</th><th>{{s|s028|}}</th></tr></thead><tbody><tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr><tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr><tr><td>O(n²)</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr><tr><td>O(2ⁿ)</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
