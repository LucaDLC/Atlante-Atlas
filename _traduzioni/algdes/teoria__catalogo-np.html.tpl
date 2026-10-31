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
SCENE.cat = {
  w: 540, h: 300, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    B('is',30,30,'Independent Set'), B('vc',360,30,'Vertex Cover'),
    B('sc',30,130,'Set Cover'), B('sat',360,130,'3SAT'),
    B('ham',30,230,'Hamiltonian cycle'), B('cl',360,230,'Clique'),
    F('f1',180,50,355,50), F('f2',180,150,355,150), F('f3',180,250,355,250),
    {id:'c1',tipo:'testo',x:20,y:270,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{is:{tono:'dato'},vc:{tono:'dato'},sc:{tono:'dato'},sat:{tono:'dato'},ham:{tono:'dato'},cl:{tono:'dato'}} },
    { nota: '{{j|s004|'}}', set:{f1:{tono:'ok'},c1:{t:'IS ≡ VC'}} },
    { nota: '{{j|s005|'}}', set:{f2:{tono:'ok'},f3:{tono:'ok'},c1:{t:'freccia = riduzione P2 ≤p P1 (dal noto al nuovo)',tono:'ok'}} }
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
  <figure class="scena" data-scena="albero" data-titolo="{{a|s020|}}"></figure>
</section>
<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s023|}}</th><th>{{s|s024|}}</th><th>{{s|s025|}}</th></tr></thead><tbody>
    <tr><td>{{s|s026|}}</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr>
    <tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
    <tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr>
    <tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr>
    <tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr>
    <tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr>
    <tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr>
    <tr><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td></tr>
    <tr><td>{{s|s050|}}</td><td>{{s|s051|}}</td><td>{{s|s052|}}</td></tr>
  </tbody></table></div>
  <p>{{s|s053|}}</p>
</section>
<section>
  <h2>{{s|s054|}}</h2>
  <p>{{s|s055|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s056|}}</th><th>{{s|s057|}}</th><th>{{s|s058|}}</th><th>{{s|s059|}}</th></tr></thead><tbody>
    <tr><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>{{s|s062|}}</td><td>{{s|s063|}}</td></tr>
    <tr><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>{{s|s066|}}</td><td>{{s|s067|}}</td></tr>
    <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td><td>{{s|s071|}}</td></tr>
    <tr><td>{{s|s072|}}</td><td>{{s|s073|}}</td><td>{{s|s074|}}</td><td>{{s|s075|}}</td></tr>
    <tr><td>{{s|s076|}}</td><td>{{s|s077|}}</td><td>{{s|s078|}}</td><td>{{s|s079|}}</td></tr>
  </tbody></table></div>
</section>
<section>
  <h2>{{s|s080|}}</h2>
<div class="box esame" data-tit="{{a|s081|}}">
<p>{{s|s082|}}</p>
</div>
</section>
<section>
  <h2>{{s|s083|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s084|}}</th><th>{{s|s085|}}</th><th>{{s|s086|}}</th></tr></thead><tbody><tr><td>{{s|s087|}}</td><td>{{s|s088|}}</td><td>{{s|s089|}}</td></tr><tr><td>{{s|s090|}}</td><td>{{s|s091|}}</td><td>{{s|s092|}}</td></tr><tr><td>{{s|s093|}}</td><td>{{s|s094|}}</td><td>{{s|s095|}}</td></tr><tr><td>{{s|s096|}}</td><td>{{s|s097|}}</td><td>{{s|s098|}}</td></tr></tbody></table></div>
</section>

</main>
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
    w: 620, h: 260, lato: false, legenda: '{{j|s099|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s100|'}}', set: { sat: { tono: 'ok' } } },
      { nota: '{{j|s101|'}}', set: Object.assign(mostra('is', 'vc', 'sc', 'sat_is', 'is_vc', 'vc_sc'), { is: { nascosto: false, tono: 'ok' }, vc: { nascosto: false, tono: 'ok' }, sc: { nascosto: false, tono: 'ok' } }) },
      { nota: '{{j|s102|'}}', set: Object.assign(mostra('ham', 'hc', 'tsp', 'lp', 'sat_ham', 'ham_hc', 'hc_tsp', 'hc_lp'), { is: { tono: null }, vc: { tono: null }, sc: { tono: null }, ham: { nascosto: false, tono: 'ok' }, hc: { nascosto: false, tono: 'ok' }, tsp: { nascosto: false, tono: 'ok' }, lp: { nascosto: false, tono: 'ok' } }) },
      { nota: '{{j|s103|'}}', set: Object.assign(mostra('col', 'ss', 'ks', 'sat_col', 'sat_ss', 'ss_ks'), { ham: { tono: null }, hc: { tono: null }, tsp: { tono: null }, lp: { tono: null }, col: { nascosto: false, tono: 'ok' }, ss: { nascosto: false, tono: 'ok' }, ks: { nascosto: false, tono: 'ok' } }) },
      { nota: '{{j|s104|'}}', set: { col: { tono: null }, ss: { tono: null }, ks: { tono: null } } }
    ]
  };
})();
</script>
</body>
</html>
