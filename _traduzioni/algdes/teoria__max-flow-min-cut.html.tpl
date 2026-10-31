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
  <figure class="scena" data-scena="cut" data-titolo="{{a|s010|}}"></figure>
</section>
<section>
  <h2>{{s|s011|}}</h2>
<p>{{s|s012|}}</p>
</section>
<section>
  <h2>{{s|s013|}}</h2>
<p>{{s|s014|}}</p>
</section>
<section>
  <h2>{{s|s015|}}</h2>
  <p>{{s|s016|}}</p>
  <p>{{s|s017|}}</p>
  <ul>
    <li>{{s|s018|}}</li>
    <li>{{s|s019|}}</li>
    <li>{{s|s020|}}</li>
  </ul>
  <p>{{s|s021|}}</p>
  <p>{{s|s022|}}</p>
  <figure class="scena" data-scena="proj" data-titolo="{{a|s023|}}"></figure>
  <p>{{s|s024|}}</p>
  <p>{{s|s025|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s026|}}</th><th>{{s|s027|}}</th></tr></thead><tbody>
    <tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
    <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
    <tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td></tr>
    <tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td></tr>
    <tr><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr>
    <tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td></tr>
    <tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td></tr>
    <tr><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr>
    <tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr>
    <tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td></tr>
  </tbody></table></div>
</section>
<section>
  <h2>{{s|s048|}}</h2>
<div class="box esame" data-tit="{{a|s049|}}">
<p>{{s|s050|}}</p>
</div>
</section>
<section>
  <h2>{{s|s051|}}</h2>
<div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s052|}}</th><th>{{s|s053|}}</th><th>{{s|s054|}}</th></tr></thead><tbody><tr><td>{{s|s055|}}</td><td>{{s|s056|}}</td><td>{{s|s057|}}</td></tr><tr><td>{{s|s058|}}</td><td>{{s|s059|}}</td><td>{{s|s060|}}</td></tr><tr><td>{{s|s061|}}</td><td>{{s|s062|}}</td><td>{{s|s063|}}</td></tr></tbody></table></div>
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
  legenda: '{{j|s064|'}}',
  oggetti: ogg, passi
};
})();
</script>
</body>
</html>
