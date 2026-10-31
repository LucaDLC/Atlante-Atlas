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
SCENE.bin = {
  w: 540, h: 230, lato: true,
  legenda: '{{j|s002|'}}',
  codice: { lang: 'pseudo', testo: `lo = 0, hi = n - 1
while lo <= hi:
    mid = (lo + hi) / 2
    if A[mid] == x: trovato
    elif A[mid] < x: lo = mid + 1
    else: hi = mid - 1` },
  oggetti: [
    ...[1,3,4,7,9,11,15,18].map((v,i) => ({id:'c'+i,tipo:'rett',x:30+i*60,y:60,w:54,h:36,t:String(v)})),
    ...[0,1,2,3,4,5,6,7].map(i => ({id:'i'+i,tipo:'testo',x:57+i*60,y:112,t:String(i),size:11})),
    {id:'lo',tipo:'testo',x:30,y:150,t:'',size:13,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{} },
    { nota: '{{j|s004|'}}', set:{c3:{tono:'ora'},lo:{t:'lo = 4, hi = 7'}} },
    { nota: '{{j|s005|'}}', set:{c3:{tono:'no'},c5:{tono:'ora'},lo:{t:'lo = 6, hi = 7'}} },
    { nota: '{{j|s006|'}}', set:{c5:{tono:'no'},c6:{tono:'ok'},lo:{t:'trovato: A[6] = 15',tono:'ok'}} }
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
<ol>
  <li>{{s|s010|}}</li>
  <li>{{s|s011|}}</li>
  <li>{{s|s012|}}</li>
  <li>{{s|s013|}}</li>
  <li>{{s|s014|}}</li>
  <li>{{s|s015|}}</li>
</ol>
</section>
<section>
  <h2>{{s|s016|}}</h2>
<p>{{s|s017|}}</p>
<p>{{s|s018|}}</p>
  <figure class="scena" data-scena="bin" data-titolo="{{a|s019|}}"></figure>
</section>
<section>
  <h2>{{s|s020|}}</h2>
<p>{{s|s021|}}</p>
<ul>
  <li>{{s|s022|}}</li>
  <li>{{s|s023|}}</li>
  <li>{{s|s024|}}</li>
</ul>
<div class="box attenzione" data-tit="{{a|s025|}}"><p>{{s|s026|}}</p></div>
</section>
<section>
  <h2>{{s|s027|}}</h2>
<div class="box esame" data-tit="{{a|s028|}}">
<p>{{s|s029|}}</p>
<p>{{s|s030|}}</p>
</div>
</section>
<section>
  <h2>{{s|s031|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s032|}}</th><th>{{s|s033|}}</th><th>{{s|s034|}}</th></tr></thead><tbody><tr><td>T(n) = T(n/2) + O(1)</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr><tr><td>T(n) = 2T(n/2) + O(n)</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr><tr><td>T(n) = 3T(n/2) + O(n)</td><td>O(n^1.585)</td><td>{{s|s039|}}</td></tr><tr><td>T(n) = 4T(n/2) + O(1)</td><td>O(n²)</td><td>{{s|s040|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
