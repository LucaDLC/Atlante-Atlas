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
<script>
window.SCENE = window.SCENE || {};
(function () {
const casi = [
  {nome:'a=4, b=2, c=1', v:[16,32,64,128,256], tono:'ora', fin:'le foglie dominano: Θ(n²)'},
  {nome:'a=2, b=2, c=1', v:[16,16,16,16,16], tono:'dato', fin:'ogni livello pesa uguale: Θ(n log n)'},
  {nome:'a=2, b=2, c=2', v:[256,128,64,32,16], tono:'due', fin:'la radice domina: Θ(n²)'}
];
const og = [{id:'tit',tipo:'testo',x:20,y:24,t:'',size:13,bold:true,anchor:'start'},{id:'fin',tipo:'testo',x:20,y:262,t:'',size:13,bold:true,anchor:'start'}];
casi.forEach((c,k) => c.v.forEach((v,l) => {
  og.push({id:'l'+k+l,tipo:'testo',x:20,y:62+l*38,t:'livello '+l,size:11,anchor:'start',nascosto:true});
  og.push({id:'b'+k+l,tipo:'rett',x:100,y:46+l*38,w:Math.round(v*1.5),h:28,t:String(v),tono:c.tono,nascosto:true});
}));
const mostra = k => { const s = {}; casi.forEach((c,j) => c.v.forEach((v,l) => { s['l'+j+l] = {nascosto: j !== k}; s['b'+j+l] = {nascosto: j !== k}; })); return s; };
const passi = [{nota: "Albero della ricorsione per <code>n = 16</code>, <code>T(n) = a·T(n/b) + n<sup>c</sup></code>. Al livello <i>i</i> ci sono <code>a<sup>i</sup></code> sottoproblemi di taglia <code>n/b<sup>i</sup></code>, ognuno costa <code>(n/b<sup>i</sup>)<sup>c</sup></code>. Ogni barra è il lavoro totale di un livello.", set:Object.assign(mostra(-1),{tit:{t:'lavoro per livello (livelli 0 … 4)'}})}];
casi.forEach((c,k) => passi.push({nota: "<b>"+c.nome+"</b>. Lavoro per livello: " + c.v.join(', ') + ". Somma " + c.v.reduce((x,y)=>x+y,0) + ". " + (k===0?"c = 1 &lt; log₂ 4 = 2: le barre crescono verso il fondo.":k===1?"c = 1 = log₂ 2: le barre sono tutte uguali, con log n livelli.":"c = 2 &gt; log₂ 2 = 1: le barre calano verso il fondo."), set:Object.assign(mostra(k),{tit:{t:'caso '+c.nome},fin:{t:c.fin,tono:'ok'}})}));
SCENE.mast = {w: 540, h: 290, lato: true, legenda: '{{j|s007|'}}', oggetti: og, passi};
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
<ol>
  <li>{{s|s011|}}</li>
  <li>{{s|s012|}}</li>
  <li>{{s|s013|}}</li>
  <li>{{s|s014|}}</li>
  <li>{{s|s015|}}</li>
  <li>{{s|s016|}}</li>
</ol>
</section>
<section>
  <h2>{{s|s017|}}</h2>
<p>{{s|s018|}}</p>
<p>{{s|s019|}}</p>
  <figure class="scena" data-scena="bin" data-titolo="{{a|s020|}}"></figure>
</section>
<section>
  <h2>{{s|s021|}}</h2>
<p>{{s|s022|}}</p>
<ul>
  <li>{{s|s023|}}</li>
  <li>{{s|s024|}}</li>
  <li>{{s|s025|}}</li>
</ul>
  <figure class="scena" data-scena="mast" data-titolo="{{a|s026|}}"></figure>
<div class="box attenzione" data-tit="{{a|s027|}}"><p>{{s|s028|}}</p></div>
</section>
<section>
  <h2>{{s|s029|}}</h2>
<div class="box esame" data-tit="{{a|s030|}}">
<p>{{s|s031|}}</p>
<p>{{s|s032|}}</p>
</div>
</section>
<section>
  <h2>{{s|s033|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s034|}}</th><th>{{s|s035|}}</th><th>{{s|s036|}}</th></tr></thead><tbody><tr><td>T(n) = T(n/2) + O(1)</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr><tr><td>T(n) = 2T(n/2) + O(n)</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr><tr><td>T(n) = 3T(n/2) + O(n)</td><td>O(n^1.585)</td><td>{{s|s041|}}</td></tr><tr><td>T(n) = 4T(n/2) + O(1)</td><td>O(n²)</td><td>{{s|s042|}}</td></tr></tbody></table></div>
</section>

</main>
</body>
</html>
