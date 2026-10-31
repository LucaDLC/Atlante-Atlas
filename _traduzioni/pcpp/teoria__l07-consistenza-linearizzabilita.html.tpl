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
SCENE.es711 = {
  w: 640, h: 310, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'lA', tipo: 'testo', x: 30, y: 65, t: 'A', size: 15, bold: true },
    { id: 'lB', tipo: 'testo', x: 30, y: 125, t: 'B', size: 15, bold: true },
    { id: 'tA', tipo: 'linea', x1: 50, y1: 60, x2: 620, y2: 60, tratt: true },
    { id: 'tB', tipo: 'linea', x1: 50, y1: 120, x2: 620, y2: 120, tratt: true },
    { id: 'tt', tipo: 'testo', x: 600, y: 150, t: 'tempo reale →', size: 11.5 },
    { id: 'deq', tipo: 'rett', x: 70, y: 105, w: 120, h: 30, t: 'q.deq(x)', tono: 'due' },
    { id: 'enqx', tipo: 'rett', x: 270, y: 45, w: 120, h: 30, t: 'q.enq(x)', tono: 'dato' },
    { id: 'enqy', tipo: 'rett', x: 430, y: 45, w: 120, h: 30, t: 'q.enq(y)', tono: 'dato' },
    { id: 'ls', tipo: 'testo', x: 30, y: 225, t: 'una alla volta:', size: 12, bold: true, anchor: 'start', nascosto: true },
    { id: 'pd', tipo: 'punto', x: 130, y: 120, r: 6, nascosto: true },
    { id: 'px', tipo: 'punto', x: 330, y: 60, r: 6, nascosto: true },
    { id: 'py', tipo: 'punto', x: 490, y: 60, r: 6, nascosto: true },
    { id: 'coda', tipo: 'testo', x: 320, y: 285, t: '', size: 12.5 }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { ls: { nascosto: false } } },
    { nota: '{{j|s005|'}}', set: { deq: { x: 160, y: 210, tono: 'no' }, enqx: { x: 300, y: 210 }, enqy: { x: 440, y: 210 }, coda: { t: 'coda: [ ]  →  deq(x)?  impossibile', tono: 'no' } } },
    { nota: '{{j|s006|'}}', set: { deq: { x: 300, tono: 'ok' }, enqx: { x: 160, tono: 'ok' }, enqy: { tono: 'ok' }, coda: { t: '[ ] → enq(x) → [x] → deq(x) → [ ] → enq(y) → [y]   ✓', tono: 'ok' } } },
    { nota: '{{j|s007|'}}', set: { deq: { x: 440 }, enqy: { x: 300 }, coda: { t: '[ ] → enq(x) → [x] → enq(y) → [x, y] → deq(x) → [y]   ✓' } } },
    { nota: '{{j|s008|'}}', set: { ls: { nascosto: true }, deq: { x: 70, y: 105, tono: 'due' }, enqx: { x: 270, y: 45, tono: 'dato' }, enqy: { x: 430, y: 45, tono: 'dato' }, coda: { t: '', tono: null } } },
    { nota: '{{j|s009|'}}', set: { pd: { nascosto: false, tono: 'no' }, px: { nascosto: false, tono: 'dato' }, py: { nascosto: false, tono: 'dato' }, deq: { tono: 'no' }, coda: { t: 'deq(x) prima di enq(x) per forza  →  coda vuota  ✗', tono: 'no' } } }
  ]
};
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s010|}}</h1>
  <p class="lede">{{s|s011|}}</p>
</header>

<section>
  <h2>{{s|s012|}}</h2>
  <p>{{s|s013|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s014|}}</th><th>{{s|s015|}}</th></tr></thead>
    <tbody>
      <tr><td><code>A:</code>, <code>B:</code></td><td>{{s|s016|}}</td></tr>
      <tr><td><code>---</code></td><td>{{s|s017|}}</td></tr>
      <tr><td>{{s|s018|}}</td><td>{{s|s019|}}</td></tr>
      <tr><td>{{s|s020|}}</td><td>{{s|s021|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s022|}}</p>
</section>

<section>
  <h2>{{s|s023|}}</h2>
  <p>{{s|s024|}}</p>
  <ol>
    <li>{{s|s025|}}</li>
    <li>{{s|s026|}}</li>
    <li>{{s|s027|}}</li>
  </ol>
  <p>{{s|s028|}}</p>
  <div class="box idea" data-tit="{{a|s029|}}">
    <p>{{s|s030|}}</p>
  </div>
  <figure class="scena" data-scena="es711" data-titolo="{{a|s031|}}"></figure>
  <div class="box domanda-tua" data-tit="{{a|s032|}}">
    <p>{{s|s033|}}</p>
    <p>{{s|s034|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s035|}}">
    <p>{{s|s036|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s037|}}">
    <p>{{s|s038|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s039|}}</h2>
  <p>{{s|s040|}}</p>
  <ol start="4">
    <li>{{s|s041|}}</li>
  </ol>
  <p>{{s|s042|}}</p>
  <div class="colonne">
    <div class="carta media"><h4>{{s|s043|}}</h4><p>{{s|s044|}}</p></div>
    <div class="carta buona"><h4>{{s|s045|}}</h4><p>{{s|s046|}}</p></div>
  </div>
  <div class="box regola" data-tit="{{a|s047|}}">
    <p>{{s|s048|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s049|}}">
    <p>{{s|s050|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s051|}}</h2>
  <p>{{s|s052|}}</p>
  <figure class="passi" data-titolo="{{a|s053|}}" data-legenda="{{a|s054|}}">
    <div class="passo"><div class="espr">A: ---|       <mark class="dato">q.enq(x)</mark>          |-->
B: ------|<mark class="due">q.deq(x)</mark>|---------------></div><p class="nota">{{s|s055|}}</p></div>
    <div class="passo"><div class="espr">A: ---|  <mark class="dato">●</mark>    q.enq(x)          |-->
B: ------|<mark class="due">●</mark>q.deq(x)|---------------></div><p class="nota">{{s|s056|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">&lt;q.enq(x),q.deq(x)&gt;</mark>     [ ] → [x] → [ ]</div><p class="nota">{{s|s057|}}</p></div>
  </figure>
  <figure class="passi" data-titolo="{{a|s058|}}" data-legenda="{{a|s059|}}">
    <div class="passo"><div class="espr">A: ---|<mark class="dato">q.enq(x)</mark>|-----|<mark class="dato">q.enq(y)</mark>|-->
B: --|         <mark class="due">q.deq(y)</mark>          |-></div><p class="nota">{{s|s060|}}</p></div>
    <div class="passo"><div class="espr">&lt;<mark class="due">q.deq(y)</mark>,q.enq(x),q.enq(y)&gt;     [ ] → deq(y)?   <mark class="no">✗</mark></div><p class="nota">{{s|s061|}}</p></div>
    <div class="passo"><div class="espr">&lt;q.enq(x),<mark class="due">q.deq(y)</mark>,q.enq(y)&gt;     [x] → deq restituirebbe x   <mark class="no">✗</mark></div><p class="nota">{{s|s062|}}</p></div>
    <div class="passo"><div class="espr">&lt;q.enq(x),q.enq(y),<mark class="due">q.deq(y)</mark>&gt;     [x, y] → deq restituirebbe x   <mark class="no">✗</mark></div><p class="nota">{{s|s063|}}</p></div>
    <div class="passo"><div class="espr"><mark class="no">nessuna posizione funziona → non linearizzabile</mark></div><p class="nota">{{s|s064|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s065|}}">
    <p>{{s|s066|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s067|}}">
    <p>{{s|s068|}}</p>
  </div>
</section>

</main>
</body>
</html>
