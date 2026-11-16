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
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:20});
const A = (id,da,a,t,extra) => Object.assign({id,tipo:'arco',da,a,dir:true,t},extra||{});
SCENE.cut = {
  w: 540, h: 260, lato: true,
  legenda: '{{j|s002|'}}',
  oggetti: [
    N('s',60,130,'s'), N('a',240,50,'a'), N('b',240,210,'b'), N('t',420,130,'t'),
    A('sa','s','a','1/1'), A('sb','s','b','1/1'), A('ab','a','b','0/1'), A('at','a','t','1/1'), A('bt','b','t','1/1'),
    {id:'c1',tipo:'testo',x:20,y:250,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: '{{j|s003|'}}', set:{s:{tono:'ok'},c1:{t:'A = ?'}} },
    { nota: '{{j|s004|'}}', set:{s:{tono:'ok'},sa:{tono:'no'},sb:{tono:'no'},c1:{t:'A = {s}'}} },
    { nota: '{{j|s005|'}}', set:{c1:{t:'capacità del taglio = 2 = flusso massimo',tono:'ok'}} }
  ]
};
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:20});
const A = (id,da,a,t,extra) => Object.assign({id,tipo:'arco',da,a,dir:true,t},extra||{});
const base = {s:{tono:null},a:{tono:null},b:{tono:null},t:{tono:null},sa:{tono:null},sb:{tono:null},ab:{tono:null},at:{tono:null},bt:{tono:null}};
const mix = o => Object.assign({}, base, o);
SCENE.cut2 = {
  w: 540, h: 270, lato: true,
  legenda: '{{j|s006|'}}',
  oggetti: [
    N('s',60,135,'s'), N('a',240,55,'a'), N('b',240,215,'b'), N('t',440,135,'t'),
    A('sa','s','a','10'), A('sb','s','b','10'), A('ab','a','b','2'), A('at','a','t','4'), A('bt','b','t','10'),
    {id:'c1',tipo:'testo',x:20,y:258,t:'',size:12,bold:true,anchor:'start'}
  ],
  passi: [
    { nota: "Una rete con capacità 10, 10, 2, 4, 10. Un taglio (A, B) ha s in A e t in B; la sua capacità è la somma degli archi che vanno da <b>A verso B</b> (quelli da B verso A non contano). Elenco i quattro tagli possibili.", set:mix({}) },
    { nota: "A = {s}: contano sa e sb, <b>10 + 10 = 20</b>.", set:mix({s:{tono:'ok'},sa:{tono:'no'},sb:{tono:'no'},c1:{t:'A = {s}: 20'}}) },
    { nota: "A = {s, a}: contano sb (10), ab (2), at (4): <b>16</b>.", set:mix({s:{tono:'ok'},a:{tono:'ok'},sb:{tono:'no'},ab:{tono:'no'},at:{tono:'no'},c1:{t:'A = {s, a}: 16'}}) },
    { nota: "A = {s, b}: contano sa (10) e bt (10): <b>20</b>. L'arco ab va da B ad A: non conta.", set:mix({s:{tono:'ok'},b:{tono:'ok'},sa:{tono:'no'},bt:{tono:'no'},c1:{t:'A = {s, b}: 20'}}) },
    { nota: "A = {s, a, b}: contano at (4) e bt (10): <b>14</b>, il minimo. Ogni flusso ha valore ≤ 14.", set:mix({s:{tono:'ok'},a:{tono:'ok'},b:{tono:'ok'},at:{tono:'no'},bt:{tono:'no'},c1:{t:'A = {s, a, b}: 14 (minimo)'}}) },
    { nota: "E un flusso di valore 14 esiste: s → a → t con 4, s → b → t con 10. Tutti e due gli archi del taglio sono saturi. Quindi <b>max flow = min cut = 14</b>. Nella residua finale da s si raggiunge a (sa ha ancora 6) e da a si raggiunge b (ab ha ancora 2): A = {s, a, b}, proprio il taglio minimo.", set:mix({s:{tono:'ok'},a:{tono:'ok'},b:{tono:'ok'},sa:{t:'4/10'},sb:{t:'10/10'},ab:{t:'0/2'},at:{t:'4/4',tono:'no'},bt:{t:'10/10',tono:'no'},c1:{t:'max flow = min cut = 14',tono:'ok'}}) }
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
<p>{{s|s010|}}</p>
  <figure class="scena" data-scena="cut" data-titolo="{{a|s011|}}"></figure>
</section>
<section>
  <h2>{{s|s012|}}</h2>
<p>{{s|s013|}}</p>
  <figure class="scena" data-scena="cut2" data-titolo="{{a|s014|}}"></figure>
</section>
<section>
  <h2>{{s|s015|}}</h2>
<p>{{s|s016|}}</p>
</section>
<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <p>{{s|s019|}}</p>
  <ul>
    <li>{{s|s020|}}</li>
    <li>{{s|s021|}}</li>
    <li>{{s|s022|}}</li>
  </ul>
  <p>{{s|s023|}}</p>
  <p>{{s|s024|}}</p>
  <figure class="scena" data-scena="proj" data-titolo="{{a|s025|}}"></figure>
  <p>{{s|s026|}}</p>
  <p>{{s|s027|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s028|}}</th><th>{{s|s029|}}</th></tr></thead><tbody>
    <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
    <tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td></tr>
    <tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td></tr>
    <tr><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr>
    <tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td></tr>
    <tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td></tr>
    <tr><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr>
    <tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr>
    <tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td></tr>
    <tr><td>{{s|s048|}}</td><td>{{s|s049|}}</td></tr>
  </tbody></table></div>
</section>
<section>
  <h2>{{s|s050|}}</h2>
<div class="box esame" data-tit="{{a|s051|}}">
<p>{{s|s052|}}</p>
</div>
</section>
<section>
  <h2>{{s|s053|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s054|}}</th><th>{{s|s055|}}</th><th>{{s|s056|}}</th></tr></thead><tbody><tr><td>{{s|s057|}}</td><td>{{s|s058|}}</td><td>{{s|s059|}}</td></tr><tr><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>{{s|s062|}}</td></tr><tr><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td></tr></tbody></table></div>
</section>

</main>
<script>
window.SCENE = window.SCENE || {};
(function () {
const N = (id,x,y,t) => ({id,tipo:'nodo',x,y,t,r:22});
const A = (id,da,a,t,extra) => Object.assign({id,tipo:'arco',da,a,dir:true,t},extra||{});
const ogg = [
  N('S',50,150,'s'), N('T',490,150,'t'),
  N('pa',220,60,'a +5'), N('pc',220,240,'c +4'), N('pb',370,150,'b −2'),
  A('sa','S','pa','5',{tono:'dato'}), A('sc','S','pc','4',{tono:'dato'}),
  A('ab','pa','pb','∞',{tono:'dato'}), A('cb','pc','pb','∞',{tono:'dato'}),
  A('bt','pb','T','2',{tono:'dato'}),
  {id:'c',tipo:'testo',x:40,y:292,t:'',size:12,bold:true,anchor:'start'}
];
const passi = [
  {nota:"Tre progetti: <b>a</b> vale +5, <b>c</b> vale +4, <b>b</b> costa 2 (profitto −2). <b>a</b> richiede <b>b</b>, e anche <b>c</b> richiede <b>b</b>. Voglio il profitto massimo di un insieme che rispetta le richieste.", set:{c:{t:'profitto massimo: quali progetti prendere?'}}},
  {nota:"Regole. Profitto positivo: arco <b>s → progetto</b> con quella capacità (5 e 4). Costo: arco <b>progetto → t</b> (2). Richiesta: arco <b>∞</b> verso il prerequisito, così il taglio non può separare i due progetti.", set:{sa:{tono:'ora'}, sc:{tono:'ora'}, bt:{tono:'ora'}, ab:{tono:'ora'}, cb:{tono:'ora'}, c:{t:'profitti da s, costi verso t, richieste ∞'}}},
  {nota:"C = 5 + 4 = 9 è la somma dei profitti positivi. Taglio con <b>A = {s, a, b, c}</b>: tutti i progetti dal lato di s. Taglia solo l’arco <b>b → t</b>, capacità 2. Costo = C − profitto(A) = 9 − (5 − 2 + 4) = 2.", set:{sa:{tono:'dato'}, sc:{tono:'dato'}, ab:{tono:'dato'}, cb:{tono:'dato'}, bt:{tono:'no'}, c:{t:'taglio A = {s, a, b, c}: costa 2'}}},
  {nota:"Il taglio minimo è 2: non esiste nulla di più economico. Quindi profitto massimo = C − 2 = <b>7</b>: prendo <b>a, b e c</b> insieme. Il lato di <b>s</b> del taglio minimo dice quali progetti prendere.", set:{bt:{tono:'ok'}, c:{t:'profitto massimo = 9 − 2 = 7: prendo a, b, c', tono:'ok'}}}
];
SCENE.proj = {
  w: 540, h: 310, lato: true,
  legenda: '{{j|s066|'}}',
  oggetti: ogg, passi
};
})();
</script>
</body>
</html>
