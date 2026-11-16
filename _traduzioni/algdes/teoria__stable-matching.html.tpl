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
const P = (id,x,y,t,tono) => ({id,tipo:'nodo',x,y,t,r:20,tono});
const R = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:20,forma:'quadrato'});
const A = (id,da,a,extra) => Object.assign({id,tipo:'arco',da,a,dir:true},extra||{});
SCENE.gs = {
  w: 520, h: 270, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    P('A',60,50,'A'), P('B',60,130,'B'), P('C',60,210,'C'),
    R('X',440,50,'X'), R('Y',440,130,'Y'), R('Z',440,210,'Z'),
    A('ax','A','X',{tono:'spento',nascosto:true}), A('bx','B','X',{tono:'spento',nascosto:true}), A('by','B','Y',{tono:'spento',nascosto:true}), A('cx','C','X',{tono:'spento',nascosto:true}), A('ay','A','Y',{tono:'spento',nascosto:true}), A('bz','B','Z',{tono:'spento',nascosto:true}),
    {id:'c1',tipo:'testo',x:20,y:255,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{A:{tono:'dato'},B:{tono:'dato'},C:{tono:'dato'},X:{tono:'dato'},Y:{tono:'dato'},Z:{tono:'dato'}} },
    { nota: '{{j|s004|'}}', set:{ax:{nascosto:false,tono:'ok'},A:{tono:'ora'},X:{tono:'ok'},c1:{t:'A–X'}} },
    { nota: '{{j|s005|'}}', set:{by:{nascosto:false,tono:'ok'},B:{tono:'ora'},Y:{tono:'ok'},A:{tono:'dato'},c1:{t:'A–X, B–Y'}} },
    { nota: '{{j|s006|'}}', set:{cx:{nascosto:false,tono:'ok'},C:{tono:'ora'},X:{tono:'ok'},ax:{tono:'no'},A:{tono:'dato'},c1:{t:'C–X; A torna libero'}} },
    { nota: '{{j|s007|'}}', set:{ay:{nascosto:false,tono:'ok'},A:{tono:'ora'},Y:{tono:'ok'},by:{tono:'no'},B:{tono:'dato'},c1:{t:'A–Y; B torna libero'}} },
    { nota: '{{j|s008|'}}', set:{by:{tono:null},bx:{tono:'no'},B:{tono:'ora'},X:{tono:'dato'},c1:{t:'B rifiutato da X'}} },
    { nota: '{{j|s009|'}}', set:{bz:{nascosto:false,tono:'ok'},B:{tono:'ora'},Z:{tono:'ok'},c1:{t:'A–Y, B–Z, C–X: tutti accoppiati',tono:'ok'}} },
    { nota: '{{j|s010|'}}', set:{C:{tono:null},c1:{t:'nessuna coppia instabile',tono:'ok'}} }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s011|}}</h1>
  <p class="lede">{{s|s012|}}</p>
</header>

<section>
  <h2>{{s|s013|}}</h2>
<p>{{s|s014|}}</p>
</section>
<section>
  <h2>{{s|s015|}}</h2>
<ol>
  <li>{{s|s016|}}</li>
  <li>{{s|s017|}}</li>
  <li>{{s|s018|}}</li>
  <li>{{s|s019|}}</li>
</ol>
  <figure class="scena" data-scena="gs" data-titolo="{{a|s020|}}"></figure>
</section>
<section>
  <h2>{{s|s021|}}</h2>
<p>{{s|s022|}}</p>
<p>{{s|s023|}}</p>
<p>{{s|s024|}}</p>
<figure class="passi" data-titolo="{{a|s025|}}" data-legenda="{{a|s026|}}">
  <div class="passo">
    <div class="espr testo">{{s|s027|}}</div>
    <p class="nota">{{s|s028|}}</p>
  </div>
  <div class="passo">
    <div class="espr testo">{{s|s029|}}</div>
    <p class="nota">{{s|s030|}}</p>
  </div>
  <div class="passo">
    <div class="espr testo">{{s|s031|}}</div>
    <p class="nota">{{s|s032|}}</p>
  </div>
  <div class="passo">
    <div class="espr testo">{{s|s033|}}</div>
    <p class="nota">{{s|s034|}}</p>
  </div>
  <div class="passo">
    <div class="espr testo">{{s|s035|}}</div>
    <p class="nota">{{s|s036|}}</p>
  </div>
  <div class="passo">
    <div class="espr testo">{{s|s037|}}</div>
    <p class="nota">{{s|s038|}}</p>
  </div>
</figure>
<div class="box domanda-tua" data-tit="{{a|s039|}}">
<p>{{s|s040|}}</p>
</div><p>{{s|s041|}}</p>
</section>
<section>
  <h2>{{s|s042|}}</h2>
<p>{{s|s043|}}</p>
</section>
<section>
  <h2>{{s|s044|}}</h2>
  <p>{{s|s045|}}</p>
  <p>{{s|s046|}}</p>
</section>
<section>
  <h2>{{s|s047|}}</h2>
  <p>{{s|s048|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s049|}}</th><th>{{s|s050|}}</th></tr></thead><tbody>
    <tr><td>{{s|s051|}}</td><td>{{s|s052|}}</td></tr>
    <tr><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr>
    <tr><td>{{s|s055|}}</td><td>{{s|s056|}}</td></tr>
    <tr><td>{{s|s057|}}</td><td>{{s|s058|}}</td></tr>
  </tbody></table></div>
  <p>{{s|s059|}}</p>
  <p>{{s|s060|}}</p>
</section>
<section>
  <h2>{{s|s061|}}</h2>
  <p>{{s|s062|}}</p>
  <p>{{s|s063|}}</p>
  <ul>
    <li>{{s|s064|}}</li>
    <li>{{s|s065|}}</li>
    <li>{{s|s066|}}</li>
  </ul>
  <figure class="scena" data-scena="cap" data-titolo="{{a|s067|}}"></figure>
  <p>{{s|s068|}}</p>
</section>
<section>
  <h2>{{s|s069|}}</h2>
<div class="box esame" data-tit="{{a|s070|}}">
<p>{{s|s071|}}</p>
<p>{{s|s072|}}</p>
</div>
</section>
<section>
  <h2>{{s|s073|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s074|}}</th><th>{{s|s075|}}</th><th>{{s|s076|}}</th></tr></thead><tbody><tr><td>{{s|s077|}}</td><td>{{s|s078|}}</td><td>{{s|s079|}}</td></tr><tr><td>{{s|s080|}}</td><td>{{s|s081|}}</td><td>{{s|s082|}}</td></tr><tr><td>{{s|s083|}}</td><td>{{s|s084|}}</td><td>{{s|s085|}}</td></tr><tr><td>{{s|s086|}}</td><td>O(n²)</td><td>{{s|s087|}}</td></tr></tbody></table></div>
</section>

</main>
<script>
window.SCENE = window.SCENE || {};
(function () {
const ogg = [
  {id:'T', tipo:'rett', x:40, y:40, w:200, h:36, t:'Squadra T (2 posti)'},
  {id:'s1', tipo:'rett', x:40, y:96, w:95, h:44, t:'libero'},
  {id:'s2', tipo:'rett', x:145, y:96, w:95, h:44, t:'libero'},
  {id:'P1', tipo:'nodo', x:400, y:50, t:'P1', r:20},
  {id:'P2', tipo:'nodo', x:400, y:120, t:'P2', r:20},
  {id:'P3', tipo:'nodo', x:400, y:190, t:'P3', r:20},
  {id:'c', tipo:'testo', x:40, y:240, t:'', size:12, bold:true, anchor:'start'}
];
const passi = [
  {nota:"La squadra <b>T</b> ha <b>2 posti</b>: è il <b>ricevente</b>. I giocatori sono i <b>proponenti</b>. Ordine di T: P1, P3, P2. Tutti partono liberi.", set:{c:{t:'T: P1 > P3 > P2 · posti liberi: 2'}}},
  {nota:"P1 propone a T. T ha un posto libero: <b>accetta</b>.", set:{s1:{t:'P1', tono:'ok'}, P1:{tono:'ok'}, c:{t:'T: 1 posto libero'}}},
  {nota:"P2 propone a T. Un posto è ancora libero: accetta. T è <b>piena</b>: 2 su 2.", set:{s2:{t:'P2', tono:'ok'}, P2:{tono:'ok'}, T:{tono:'due'}, c:{t:'T piena: P1 e P2'}}},
  {nota:"P3 propone a T. T è piena: confronto P3 con il <b>peggiore</b> dei due tenuti, cioè P2. T preferisce P3 a P2.", set:{P3:{tono:'ora'}, P2:{tono:'due'}, c:{t:'P3 contro P2, il peggiore tenuto'}}},
  {nota:"T preferisce P3: <b>P2 lascia il posto</b> e torna libero. P3 prende il posto. T resta con P1 e P3. P2 proporrà alla prossima squadra della sua lista.", set:{s2:{t:'P3', tono:'ok'}, P3:{tono:'ok'}, P2:{tono:'no'}, T:{tono:'ok'}, c:{t:'T tiene P1 e P3 · P2 torna libero', tono:'ok'}}}
];
SCENE.cap = {
  w: 540, h: 270, lato: true,
  legenda: '{{j|s088|'}}',
  oggetti: ogg, passi
};
})();
</script>
</body>
</html>
