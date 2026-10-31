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
const J = [['A',0,3],['B',2,5],['C',4,7],['D',1,8],['E',6,9],['F',8,10]];
const X = t => 40 + t * 40; const ogg = [];
for (let t = 0; t <= 10; t++) ogg.push({id:'tk'+t,tipo:'testo',x:X(t),y:262,t:String(t),size:11});
ogg.push({id:'asse',tipo:'linea',x1:X(0),y1:250,x2:X(10),y2:250});
J.forEach(([n,s,f],i) => ogg.push({id:n,tipo:'rett',x:X(s),y:24+i*34,w:(f-s)*40,h:24,t:n}));
ogg.push({id:'ul',tipo:'linea',x1:X(0),y1:14,x2:X(0),y2:250,tratt:true,tono:'due',nascosto:true});
ogg.push({id:'c',tipo:'testo',x:40,y:302,t:'',size:12,bold:true,anchor:'start'});
const passi = [{nota:'{{j|s002|'}}', set:{}}];
passi.push({nota:'{{j|s003|'}}', set:{c:{t:'ordine per fine: A B C D E F'}}});
let ultimo = 0; const scelti = [];
J.forEach(([n,s,f]) => {
  if (s >= ultimo) { scelti.push(n); ultimo = f;
    passi.push({nota:`{{j|s004|`}}`, set:{[n]:{tono:'ok'}, ul:{nascosto:false}, c:{t:'preso: '+scelti.join(', ')}}});
  } else {
    passi.push({nota:`{{j|s005|`}}`, set:{[n]:{tono:'no'}}});
  }
});
passi.push({nota:`{{j|s006|`}}`, set:{c:{t:'risultato: '+scelti.join(', '),tono:'ok'}}});
SCENE.int = {
  w: 540, h: 320, lato: true,
  legenda: '{{j|s007|'}}',
  oggetti: ogg, passi
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const J = [['A',0,3],['B',1,4],['C',2,6],['D',5,8],['E',6,9]];
const X = t => 40 + t * 40; const ogg = [];
for (let t = 0; t <= 9; t++) ogg.push({id:'tk'+t,tipo:'testo',x:X(t),y:262,t:String(t),size:11});
ogg.push({id:'asse',tipo:'linea',x1:X(0),y1:250,x2:X(9),y2:250});
J.forEach(([n,s,f],i) => ogg.push({id:n,tipo:'rett',x:X(s),y:24+i*34,w:(f-s)*40,h:24,t:n,nascosto:true}));
ogg.push({id:'c',tipo:'testo',x:40,y:302,t:'',size:12,bold:true,anchor:'start'});
const passi = [{nota:'{{j|s008|'}}', set:{}}];
const mostra = [];
passi.push({nota:'{{j|s009|'}}', set:Object.fromEntries(J.map(([n])=>[n,{nascosto:false}]))});
passi.push({nota:'{{j|s010|'}}', set:{A:{tono:'ok'},B:{tono:'due'},C:{tono:'ora'},c:{t:'aule aperte: 3'}}});
passi.push({nota:'{{j|s011|'}}', set:{D:{tono:'ok'},A:{tono:'dato'},c:{t:'D nell\'aula 1'}}});
passi.push({nota:'{{j|s012|'}}', set:{E:{tono:'ok'},c:{t:'aule = profondità = 3',tono:'ok'}}});
SCENE.part = {w:540,h:320,lato:true,legenda:'{{j|s013|'}}',oggetti:ogg,passi};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s014|}}</h1>
  <p class="lede">{{s|s015|}}</p>
</header>

<section>
  <h2>{{s|s016|}}</h2>
<p>{{s|s017|}}</p>
<p>{{s|s018|}}</p>
  <figure class="scena" data-scena="int" data-titolo="{{a|s019|}}"></figure>
</section>
<section>
  <h2>{{s|s020|}}</h2>
<p>{{s|s021|}}</p>
<p>{{s|s022|}}</p>
</section>
<section>
  <h2>{{s|s023|}}</h2>
<p>{{s|s024|}}</p>
<div class="box attenzione" data-tit="{{a|s025|}}"><p>{{s|s026|}}</p></div>
</section>
<section>
  <h2>{{s|s027|}}</h2>
<p>{{s|s028|}}</p>
<p>{{s|s029|}}</p>
  <figure class="scena" data-scena="part" data-titolo="{{a|s030|}}"></figure>
</section>
<section>
  <h2>{{s|s031|}}</h2>
  <p>{{s|s032|}}</p>
  <p>{{s|s033|}}</p>
</section>
<section>
  <h2>{{s|s034|}}</h2>
  <p>{{s|s035|}}</p>
  <p>{{s|s036|}}</p>
  <p>{{s|s037|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s038|}}</th><th>{{s|s039|}}</th></tr></thead><tbody>
    <tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td></tr>
    <tr><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr>
  </tbody></table></div>
  <p>{{s|s044|}}</p>
  <figure class="scena" data-scena="lat" data-titolo="{{a|s045|}}"></figure>
  <div class="box idea" data-tit="{{a|s046|}}">
    <ol>
      <li>{{s|s047|}}</li>
      <li>{{s|s048|}}</li>
      <li>{{s|s049|}}</li>
      <li>{{s|s050|}}</li>
      <li>{{s|s051|}}</li>
    </ol>
  </div>
</section>
<section>
  <h2>{{s|s052|}}</h2>
<div class="box esame" data-tit="{{a|s053|}}">
<p>{{s|s054|}}</p>
<p>{{s|s055|}}</p>
</div>
</section>
<section>
  <h2>{{s|s056|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s057|}}</th><th>{{s|s058|}}</th><th>{{s|s059|}}</th></tr></thead><tbody><tr><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>{{s|s062|}}</td></tr><tr><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td></tr><tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td><td>{{s|s068|}}</td></tr></tbody></table></div>
</section>

</main>
<script>
window.SCENE = window.SCENE || {};
(function () {
const X = t => 40 + t * 60;
const ogg = [];
for (let t = 0; t <= 6; t++) ogg.push({id:'tk'+t, tipo:'testo', x:X(t), y:252, t:String(t), size:11});
ogg.push({id:'asse', tipo:'linea', x1:X(0), y1:242, x2:X(6), y2:242});
ogg.push({id:'lab1', tipo:'testo', x:40, y:24, t:"Ordine EDF: prima A, poi B", size:12, bold:true, anchor:'start'});
ogg.push({id:'lab2', tipo:'testo', x:40, y:112, t:"Ordine inverso: prima B, poi A", size:12, bold:true, anchor:'start'});
ogg.push({id:'a1', tipo:'rett', x:X(0), y:36, w:120, h:30, t:'A (d 3)', nascosto:true});
ogg.push({id:'b1', tipo:'rett', x:X(2), y:36, w:180, h:30, t:'B (d 4)', nascosto:true});
ogg.push({id:'r1', tipo:'rett', x:X(4), y:36, w:60, h:30, t:'', tono:'no', nascosto:true});
ogg.push({id:'b2', tipo:'rett', x:X(0), y:126, w:180, h:30, t:'B (d 4)', nascosto:true});
ogg.push({id:'a2', tipo:'rett', x:X(3), y:126, w:120, h:30, t:'A (d 3)', tono:'no', nascosto:true});
ogg.push({id:'c', tipo:'testo', x:40, y:296, t:'', size:12, bold:true, anchor:'start'});
const passi = [
  {nota:"Due lavori su una macchina. <b>A</b>: durata 2, scadenza 3. <b>B</b>: durata 3, scadenza 4. L’asse orizzontale è il tempo: ogni barra occupa la macchina per la durata del lavoro.", set:{c:{t:'A: durata 2, scadenza 3 · B: durata 3, scadenza 4'}}},
  {nota:"Provo l’ordine <b>EDF</b>: prima <b>A</b>, perché la sua scadenza è più vicina. A parte a 0 e finisce a 2, prima della scadenza 3: <b>in orario</b>, ritardo 0.", set:{a1:{nascosto:false, tono:'ok'}, c:{t:'EDF, passo 1: A finisce a 2, ritardo 0'}}},
  {nota:"Poi <b>B</b>: parte a 2 e finisce a 5. La scadenza è 4, quindi sfora di <b>5 − 4 = 1</b>: è il tratto rosso. Con EDF il ritardo massimo è L = 1.", set:{b1:{nascosto:false, tono:'ora'}, r1:{nascosto:false}, c:{t:'EDF: ritardo massimo L = 1'}}},
  {nota:"Provo l’altro ordine: <b>B prima</b>. B finisce a 3, in orario (3 ≤ 4). Poi A parte a 3 e finisce a 5: scade a 3, quindi ritardo 2.", set:{a1:{tono:'spento'}, b1:{tono:'spento'}, r1:{nascosto:true}, b2:{nascosto:false, tono:'ok'}, a2:{nascosto:false}, c:{t:'B prima: A finisce a 5, ritardo 2'}}},
  {nota:"Ritardo massimo: 1 con EDF, 2 con B prima. EDF è il migliore, e l’argomento di scambio dice che lo è sempre.", set:{a1:{tono:'ok'}, b1:{nascosto:false, tono:'dato'}, r1:{nascosto:false}, b2:{tono:'spento'}, a2:{tono:'spento'}, c:{t:'EDF: L = 1 · inverso: L = 2', tono:'ok'}}}
];
SCENE.lat = {
  w: 540, h: 310, lato: true,
  legenda: '{{j|s069|'}}',
  oggetti: ogg, passi
};
})();
</script>
</body>
</html>
