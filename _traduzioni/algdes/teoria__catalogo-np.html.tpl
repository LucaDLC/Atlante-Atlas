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
const B = (id,x,y,t) => ({id,tipo:'rett',x,y,w:150,h:40,t});
const F = (id,x1,y1,x2,y2) => ({id,tipo:'vett',x1,y1,x2,y2,t:''});
const Bx = (id,x,y,t) => ({id,tipo:'rett',x,y,w:118,h:40,t});
SCENE.cat = {
  w: 540, h: 300, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    Bx('sat',10,30,'3SAT'), Bx('is',145,30,'Independent Set'), Bx('vc',280,30,'Vertex Cover'), Bx('sc',415,30,'Set Cover'),
    F('f1',128,50,145,50), F('f2',263,50,280,50), F('f3',398,50,415,50),
    Bx('tsp',10,150,'TSP'), Bx('ham',145,150,'Ham. cycle'), Bx('lp',280,150,'Longest Path'), Bx('cl',415,150,'Clique'),
    F('g1',145,170,128,170), F('g2',280,170,263,170),
    {id:'c1',tipo:'testo',x:20,y:270,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{sat:{tono:'dato'},is:{tono:'dato'},vc:{tono:'dato'},sc:{tono:'dato'},tsp:{tono:'dato'},ham:{tono:'dato'},lp:{tono:'dato'},cl:{tono:'dato'}} },
    { nota: '{{j|s004|'}}', set:{f1:{tono:'ok'},f2:{tono:'ok'},f3:{tono:'ok'},c1:{t:'3SAT → IS ≡ VC → Set Cover'}} },
    { nota: '{{j|s005|'}}', set:{g1:{tono:'ok'},g2:{tono:'ok'},c1:{t:'Ham. cycle → TSP, Longest Path · Clique = IS sul complemento',tono:'ok'}} }
  ]
};
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s006|}}</h1>
  <p class="lede">{{s|s007|}}</p>
</header>

<section>
  <h2>{{s|s008|}}</h2>
<p>{{s|s009|}}</p>
<ul>
  <li>{{s|s010|}}</li>
  <li>{{s|s011|}}</li>
  <li>{{s|s012|}}</li>
  <li>{{s|s013|}}</li>
  <li>{{s|s014|}}</li>
  <li>{{s|s015|}}</li>
</ul>
  <figure class="scena" data-scena="cat" data-titolo="{{a|s016|}}"></figure>
</section>
<section>
  <h2>{{s|s017|}}</h2>
<p>{{s|s018|}}</p>
</section>
<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <p>{{s|s021|}}</p>
  <ol>
    <li>{{s|s022|}}</li>
    <li>{{s|s023|}}</li>
    <li>{{s|s024|}}</li>
  </ol>
  <p>{{s|s025|}}</p>
  <figure class="scena" data-scena="gadget3sat" data-titolo="{{a|s026|}}"></figure>
</section>
<section>
  <h2>{{s|s027|}}</h2>
  <figure class="scena" data-scena="albero" data-titolo="{{a|s028|}}"></figure>
</section>
<section>
  <h2>{{s|s029|}}</h2>
  <p>{{s|s030|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s031|}}</th><th>{{s|s032|}}</th><th>{{s|s033|}}</th></tr></thead><tbody>
    <tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr>
    <tr><td>{{s|s037|}}</td><td>{{s|s038|}}</td><td>{{s|s039|}}</td></tr>
    <tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr>
    <tr><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr>
    <tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr>
    <tr><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td>{{s|s051|}}</td></tr>
    <tr><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr>
    <tr><td>{{s|s055|}}</td><td>{{s|s056|}}</td><td>{{s|s057|}}</td></tr>
    <tr><td>{{s|s058|}}</td><td>{{s|s059|}}</td><td>{{s|s060|}}</td></tr>
  </tbody></table></div>
  <p>{{s|s061|}}</p>
</section>
<section>
  <h2>{{s|s062|}}</h2>
  <p>{{s|s063|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s064|}}</th><th>{{s|s065|}}</th><th>{{s|s066|}}</th><th>{{s|s067|}}</th></tr></thead><tbody>
    <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td><td>{{s|s071|}}</td></tr>
    <tr><td>{{s|s072|}}</td><td>{{s|s073|}}</td><td>{{s|s074|}}</td><td>{{s|s075|}}</td></tr>
    <tr><td>{{s|s076|}}</td><td>{{s|s077|}}</td><td>{{s|s078|}}</td><td>{{s|s079|}}</td></tr>
    <tr><td>{{s|s080|}}</td><td>{{s|s081|}}</td><td>{{s|s082|}}</td><td>{{s|s083|}}</td></tr>
    <tr><td>{{s|s084|}}</td><td>{{s|s085|}}</td><td>{{s|s086|}}</td><td>{{s|s087|}}</td></tr>
  </tbody></table></div>
</section>
<section>
  <h2>{{s|s088|}}</h2>
<div class="box esame" data-tit="{{a|s089|}}">
<p>{{s|s090|}}</p>
</div>
</section>
<section>
  <h2>{{s|s091|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s092|}}</th><th>{{s|s093|}}</th><th>{{s|s094|}}</th></tr></thead><tbody><tr><td>{{s|s095|}}</td><td>{{s|s096|}}</td><td>{{s|s097|}}</td></tr><tr><td>{{s|s098|}}</td><td>{{s|s099|}}</td><td>{{s|s100|}}</td></tr><tr><td>{{s|s101|}}</td><td>{{s|s102|}}</td><td>{{s|s103|}}</td></tr><tr><td>{{s|s104|}}</td><td>{{s|s105|}}</td><td>{{s|s106|}}</td></tr></tbody></table></div>
</section>

</main>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:20});
  const E = (id,da,a) => ({id,tipo:'arco',da,a,dir:false,t:''});
  SCENE.gadget3sat = {
    w: 540, h: 300, lato: true,
    legenda: '{{j|s107|'}}',
    oggetti: [
      N('x1',70,50,'x'), N('y1',230,50,'y'), N('z1',150,120,'z'),
      N('x2',70,250,'¬x'), N('y2',230,250,'¬y'), N('z2',150,180,'z'),
      E('t1a','x1','y1'), E('t1b','y1','z1'), E('t1c','x1','z1'),
      E('t2a','x2','y2'), E('t2b','y2','z2'), E('t2c','x2','z2'),
      E('cx','x1','x2'), E('cy','y1','y2'),
      {id:'l1',tipo:'testo',x:290,y:50,t:'C1 = (x ∨ y ∨ z)',size:12,bold:true,anchor:'start'},
      {id:'l2',tipo:'testo',x:290,y:250,t:'C2 = (¬x ∨ ¬y ∨ z)',size:12,bold:true,anchor:'start'},
      {id:'c',tipo:'testo',x:290,y:150,t:'',size:12,bold:true,anchor:'start'}
    ],
    passi: [
      { nota: '{{j|s108|'}}', set: {} },
      { nota: '{{j|s109|'}}', set: { x1:{tono:'dato'},y1:{tono:'dato'},z1:{tono:'dato'},x2:{tono:'dato'},y2:{tono:'dato'},z2:{tono:'dato'},t1a:{tono:'dato'},t1b:{tono:'dato'},t1c:{tono:'dato'},t2a:{tono:'dato'},t2b:{tono:'dato'},t2c:{tono:'dato'},c:{t:'al massimo 1 nodo per triangolo'} } },
      { nota: '{{j|s110|'}}', set: { cx:{tono:'due'}, cy:{tono:'due'}, c:{t:'archi viola = letterali opposti'} } },
      { nota: '{{j|s111|'}}', set: { c:{t:'k = 2 (numero di clausole)'} } },
      { nota: '{{j|s112|'}}', set: { x1:{tono:'ok'}, y2:{tono:'ok'}, y1:{tono:'no'}, z1:{tono:'no'}, x2:{tono:'no'}, z2:{tono:'no'}, c:{t:'x=V, y=F, z=F: scelgo x (C1) e ¬y (C2)', tono:'ok'} } },
      { nota: '{{j|s113|'}}', set: { c:{t:'letterali scelti veri: ogni clausola è vera', tono:'ok'} } }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const N = {
    sat: [310, 25, '3-SAT'],
    is: [80, 100, 'Independent Set'], ham: [245, 100, 'Dir. Ham. Cycle'], col: [390, 100, '3-Color'], ss: [530, 100, 'Subset Sum'],
    vc: [80, 170, 'Vertex Cover'], hc: [245, 170, 'Ham. Cycle / Path'], ks: [530, 170, 'Knapsack'],
    sc: [80, 240, 'Set Cover'], tsp: [245, 240, 'TSP'], lp: [390, 240, 'Longest Path']
  };
  const ogg = Object.entries(N).map(([id, [x, y, t]]) => ({ id, tipo: 'testo', x, y, t, size: 12.5, bold: true, nascosto: id !== 'sat' }));
  const A = [['sat', 'is'], ['sat', 'ham'], ['sat', 'col'], ['sat', 'ss'], ['is', 'vc'], ['vc', 'sc'], ['ham', 'hc'], ['hc', 'tsp'], ['hc', 'lp'], ['ss', 'ks']];
  A.forEach(([a, b]) => ogg.push({ id: a + '_' + b, tipo: 'vett', x1: N[a][0], y1: N[a][1] + 8, x2: N[b][0], y2: N[b][1] - 14, nascosto: true }));
  const mostra = (...ids) => Object.fromEntries(ids.map(i => [i, { nascosto: false }]));
  SCENE.albero = {
    w: 620, h: 260, lato: false, legenda: '{{j|s114|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s115|'}}', set: { sat: { tono: 'ok' } } },
      { nota: '{{j|s116|'}}', set: Object.assign(mostra('is', 'vc', 'sc', 'sat_is', 'is_vc', 'vc_sc'), { is: { nascosto: false, tono: 'ok' }, vc: { nascosto: false, tono: 'ok' }, sc: { nascosto: false, tono: 'ok' } }) },
      { nota: '{{j|s117|'}}', set: Object.assign(mostra('ham', 'hc', 'tsp', 'lp', 'sat_ham', 'ham_hc', 'hc_tsp', 'hc_lp'), { is: { tono: null }, vc: { tono: null }, sc: { tono: null }, ham: { nascosto: false, tono: 'ok' }, hc: { nascosto: false, tono: 'ok' }, tsp: { nascosto: false, tono: 'ok' }, lp: { nascosto: false, tono: 'ok' } }) },
      { nota: '{{j|s118|'}}', set: Object.assign(mostra('col', 'ss', 'ks', 'sat_col', 'sat_ss', 'ss_ks'), { ham: { tono: null }, hc: { tono: null }, tsp: { tono: null }, lp: { tono: null }, col: { nascosto: false, tono: 'ok' }, ss: { nascosto: false, tono: 'ok' }, ks: { nascosto: false, tono: 'ok' } }) },
      { nota: '{{j|s119|'}}', set: { col: { tono: null }, ss: { tono: null }, ks: { tono: null } } }
    ]
  };
})();
</script>
</body>
</html>
