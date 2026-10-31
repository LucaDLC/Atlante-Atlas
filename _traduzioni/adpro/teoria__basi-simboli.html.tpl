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
  const Y = 132, H = 36;
  const cella = (id, x, t, y) => ({ id, tipo: 'rett', x, y: y ?? Y, w: 60, h: H, t, nascosto: true });
  SCENE.cons = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s002|'}}',
    codice: { lang: 'scala', testo: `val xs = 2 :: 3 :: Nil
val ys = 1 :: xs
val zs = 9 :: xs` },
    oggetti: [
      { id: 'e1', tipo: 'testo', x: 300, y: 22, t: 'xs = 2 :: 3 :: Nil', size: 15, bold: true },
      { id: 'e2', tipo: 'testo', x: 300, y: 48, t: '= 2 :: (3 :: Nil)', size: 15, nascosto: true },
      { id: 'e3', tipo: 'testo', x: 300, y: 74, t: '= Nil.::(3).::(2)', size: 15, nascosto: true },
      { id: 'cur', tipo: 'testo', x: 300, y: 100, t: '', tono: 'ora' },
      { id: 'Nil', tipo: 'rett', x: 490, y: Y, w: 70, h: H, t: 'Nil', nascosto: true },
      cella('c3', 370, '3'), cella('c2', 250, '2'), cella('c1', 130, '1'), cella('c9', 130, '9', 202),
      { id: 'a3', tipo: 'vett', x1: 432, y1: 150, x2: 488, y2: 150, nascosto: true },
      { id: 'a2', tipo: 'vett', x1: 312, y1: 150, x2: 368, y2: 150, nascosto: true },
      { id: 'a1', tipo: 'vett', x1: 192, y1: 150, x2: 248, y2: 150, nascosto: true },
      { id: 'a9', tipo: 'vett', x1: 192, y1: 214, x2: 262, y2: 171, nascosto: true },
      { id: 'nxs', tipo: 'testo', x: 280, y: 118, t: 'xs ↓', size: 12, bold: true, nascosto: true },
      { id: 'nys', tipo: 'testo', x: 160, y: 118, t: 'ys ↓', size: 12, bold: true, nascosto: true },
      { id: 'nzs', tipo: 'testo', x: 118, y: 220, t: 'zs →', size: 12, bold: true, anchor: 'end', nascosto: true },
      { id: 'ris', tipo: 'testo', x: 300, y: 262, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: "Prima riga: <code>2 :: 3 :: Nil</code>. Due <code>::</code> di fila: quale si calcola prima?", righe: [1] },
      { nota: "Un operatore che <b>finisce con i due punti</b> si raggruppa da <b>destra</b>: prima <code>3 :: Nil</code>, poi <code>2 :: (…)</code>.", righe: [1], set: { e2: { nascosto: false } } },
      { nota: "E il metodo appartiene al valore a <b>destra</b>: <code>3 :: Nil</code> è la chiamata <code>Nil.::(3)</code>; sul risultato si chiama <code>.::(2)</code>.", righe: [1], set: { e3: { nascosto: false } } },
      { nota: "<code>Nil.::(3)</code> crea <b>una cella</b>: testa 3, coda Nil (la freccia).", righe: [1], set: { Nil: { nascosto: false }, c3: { nascosto: false, tono: 'ora' }, a3: { nascosto: false }, cur: { t: 'adesso: Nil.::(3)' } } },
      { nota: "<code>.::(2)</code> crea una nuova cella con testa 2 che <b>punta</b> alla lista di prima. La cella 3 non viene copiata né modificata. Questa lista è <code>xs</code>.", righe: [1], set: { c3: { tono: null }, c2: { nascosto: false, tono: 'ora' }, a2: { nascosto: false }, nxs: { nascosto: false }, cur: { t: 'adesso: .::(2)' } } },
      { nota: "<code>1 :: xs</code> = <code>xs.::(1)</code>: <b>una</b> cella nuova che punta a xs. Costa <i>O(1)</i>, qualunque sia la lunghezza di xs.", righe: [2], set: { c2: { tono: null }, c1: { nascosto: false, tono: 'ora' }, a1: { nascosto: false }, nys: { nascosto: false }, cur: { t: 'adesso: xs.::(1)' } } },
      { nota: "<code>9 :: xs</code>: un'altra cella, che punta alla <b>stessa</b> xs. ys e zs condividono le celle 2 e 3. Si può fare perché le liste sono immutabili: nessuno può cambiare xs sotto i piedi di ys.", righe: [3], set: { c1: { tono: null }, c9: { nascosto: false, tono: 'ora' }, a9: { nascosto: false }, nzs: { nascosto: false }, c2: { tono: 'due' }, c3: { tono: 'due' }, cur: { t: 'adesso: xs.::(9)' } } },
      { nota: "ys = List(1, 2, 3) e zs = List(9, 2, 3) con <b>4 celle</b> in tutto, invece di 8 se ogni lista avesse la sua copia. Verificato in Scala 3.8: <code>ys.tail eq xs</code> e <code>zs.tail eq xs</code> danno <code>true</code> (<code>eq</code> confronta l'indirizzo in memoria, non il contenuto).", set: { c9: { tono: null }, cur: { t: '' }, ris: { t: 'ys = List(1, 2, 3)    zs = List(9, 2, 3)', tono: 'ok' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s003|}}</h1>
  <p class="lede">{{s|s004|}}</p>
</header>

<section>
  <h2>{{s|s005|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s006|}}</th><th>{{s|s007|}}</th><th>{{s|s008|}}</th><th>{{s|s009|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s010|}}</td><td>{{s|s011|}}</td><td>{{s|s012|}}</td><td>{{s|s013|}}</td></tr>
      <tr><td><code>[A]</code></td><td>{{s|s014|}}</td><td>{{s|s015|}}</td><td>{{s|s016|}}</td></tr>
      <tr><td>{{s|s017|}}</td><td>{{s|s018|}}</td><td>{{s|s019|}}</td><td>{{s|s020|}}</td></tr>
      <tr><td><code>+A</code></td><td>{{s|s021|}}</td><td>{{s|s022|}}</td><td>{{s|s023|}}</td></tr>
      <tr><td><code>-A</code></td><td>{{s|s024|}}</td><td>{{s|s025|}}</td><td>{{s|s026|}}</td></tr>
      <tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td><td>{{s|s030|}}</td></tr>
      <tr><td>{{s|s031|}}</td><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr>
      <tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr>
      <tr><td>{{s|s039|}}</td><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr>
      <tr><td><code>(A, B)</code></td><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s046|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s047|}}</th><th>{{s|s048|}}</th><th>{{s|s049|}}</th><th>{{s|s050|}}</th></tr></thead>
    <tbody>
      <tr><td><code>A => B</code></td><td>{{s|s051|}}</td><td>{{s|s052|}}</td><td>{{s|s053|}}</td></tr>
      <tr><td><code>x => x + 1</code></td><td>{{s|s054|}}</td><td>{{s|s055|}}</td><td>{{s|s056|}}</td></tr>
      <tr><td><code>_ + 1</code></td><td>{{s|s057|}}</td><td>{{s|s058|}}</td><td>{{s|s059|}}</td></tr>
      <tr><td><code>f(x)(y)</code></td><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>{{s|s062|}}</td></tr>
      <tr><td><code>() => A</code></td><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td></tr>
      <tr><td><code>x: => A</code></td><td>{{s|s066|}}</td><td>{{s|s067|}}</td><td>{{s|s068|}}</td></tr>
      <tr><td>{{s|s069|}}</td><td>{{s|s070|}}</td><td>{{s|s071|}}</td><td>{{s|s072|}}</td></tr>
      <tr><td>{{s|s073|}}</td><td>{{s|s074|}}</td><td>{{s|s075|}}</td><td>{{s|s076|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s077|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s078|}}</th><th>{{s|s079|}}</th><th>{{s|s080|}}</th><th>{{s|s081|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s082|}}</td><td>{{s|s083|}}</td><td>{{s|s084|}}</td><td>{{s|s085|}}</td></tr>
      <tr><td>{{s|s086|}}</td><td>{{s|s087|}}</td><td>{{s|s088|}}</td><td>{{s|s089|}}</td></tr>
      <tr><td>{{s|s090|}}</td><td>{{s|s091|}}</td><td>{{s|s092|}}</td><td>{{s|s093|}}</td></tr>
      <tr><td>{{s|s094|}}</td><td>{{s|s095|}}</td><td>{{s|s096|}}</td><td>{{s|s097|}}</td></tr>
      <tr><td>{{s|s098|}}</td><td>{{s|s099|}}</td><td>{{s|s100|}}</td><td>{{s|s101|}}</td></tr>
      <tr><td>{{s|s102|}}</td><td>{{s|s103|}}</td><td>{{s|s104|}}</td><td>{{s|s105|}}</td></tr>
      <tr><td><code>A*</code></td><td>{{s|s106|}}</td><td>{{s|s107|}}</td><td>{{s|s108|}}</td></tr>
      <tr><td>{{s|s109|}}</td><td>{{s|s110|}}</td><td>{{s|s111|}}</td><td>{{s|s112|}}</td></tr>
      <tr><td><code>p._1</code>, <code>p._2</code></td><td>{{s|s113|}}</td><td>{{s|s114|}}</td><td>{{s|s115|}}</td></tr>
      <tr><td>{{s|s116|}}</td><td>{{s|s117|}}</td><td>{{s|s118|}}</td><td>{{s|s119|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s120|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s121|}}</th><th>{{s|s122|}}</th><th>{{s|s123|}}</th><th>{{s|s124|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s125|}}</td><td>{{s|s126|}}</td><td>{{s|s127|}}</td><td>{{s|s128|}}</td></tr>
      <tr><td>{{s|s129|}}</td><td>{{s|s130|}}</td><td>{{s|s131|}}</td><td>{{s|s132|}}</td></tr>
      <tr><td>{{s|s133|}}</td><td>{{s|s134|}}</td><td>{{s|s135|}}</td><td>{{s|s136|}}</td></tr>
      <tr><td>{{s|s137|}}</td><td>{{s|s138|}}</td><td>{{s|s139|}}</td><td>{{s|s140|}}</td></tr>
      <tr><td>{{s|s141|}}</td><td>{{s|s142|}}</td><td>{{s|s143|}}</td><td>{{s|s144|}}</td></tr>
      <tr><td><code>s"… ${x} …"</code></td><td>{{s|s145|}}</td><td>{{s|s146|}}</td><td>{{s|s147|}}</td></tr>
      <tr><td>{{s|s148|}}</td><td>{{s|s149|}}</td><td>{{s|s150|}}</td><td>{{s|s151|}}</td></tr>
      <tr><td>{{s|s152|}}</td><td>{{s|s153|}}</td><td>{{s|s154|}}</td><td>{{s|s155|}}</td></tr>
      <tr><td><code>???</code></td><td>{{s|s156|}}</td><td>{{s|s157|}}</td><td>{{s|s158|}}</td></tr>
      <tr><td>{{s|s159|}}</td><td>{{s|s160|}}</td><td>{{s|s161|}}</td><td>{{s|s162|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s163|}}</h2>
  <p>{{s|s164|}}</p>
  <figure class="passi" data-titolo="{{a|s165|}}">
    <div class="passo">
      <div class="espr"><mark class="dato">magic</mark> <mark class="ora">-</mark> 84    =    <mark class="dato">magic</mark>.<mark class="ora">-</mark>(84)</div>
      <p class="nota">{{s|s166|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="dato">a</mark> max b    =    <mark class="dato">a</mark>.max(b)</div>
      <p class="nota">{{s|s167|}}</p>
    </div>
    <div class="passo">
      <div class="espr">1 <mark class="ora">::</mark> <mark class="due">xs</mark>    =    <mark class="due">xs</mark>.<mark class="ora">::</mark>(1)</div>
      <p class="nota">{{s|s168|}}</p>
    </div>
    <div class="passo">
      <div class="espr">1 :: 2 :: 3 :: Nil    =    1 :: (2 :: (<mark class="ora">3 :: Nil</mark>))    =    <mark class="ok">List(1, 2, 3)</mark></div>
      <p class="nota">{{s|s169|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="cons" data-titolo="{{a|s170|}}"></figure>
</section>

</main>
</body>
</html>
