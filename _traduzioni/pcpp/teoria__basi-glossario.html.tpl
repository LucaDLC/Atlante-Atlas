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
  const az = (id, x, y, t) => ({ id, tipo: 'rett', x, y, w: 120, h: 30, t, nascosto: true });
  SCENE.duerace = {
    w: 600, h: 300, lato: true,
    legenda: '{{j|s002|'}}',
    codice: { lang: 'java', testo: `// A: lista sincronizzata, t1 e t2 con x = 5
if (!list.contains(x))
    list.add(x);

// B: campo normale, nessun lock
boolean done = false;
// t1 e t2 eseguono entrambi:
done = true;` },
    oggetti: [
      { id: 'L1', tipo: 'linea', x1: 70, y1: 80, x2: 570, y2: 80, tratt: true, tono: 'spento' },
      { id: 'L2', tipo: 'linea', x1: 70, y1: 170, x2: 570, y2: 170, tratt: true, tono: 'spento' },
      { id: 'n1', tipo: 'testo', x: 40, y: 80, t: 't1', size: 15, bold: true },
      { id: 'n2', tipo: 'testo', x: 40, y: 170, t: 't2', size: 15, bold: true },
      az('a1', 80, 65, 'contains(5)'), az('a2', 200, 155, 'contains(5)'), az('a3', 320, 65, 'add(5)'), az('a4', 440, 155, 'add(5)'),
      { id: 'r1', tipo: 'testo', x: 140, y: 110, t: 'false', tono: 'dato', nascosto: true },
      { id: 'r2', tipo: 'testo', x: 260, y: 200, t: 'false', tono: 'dato', nascosto: true },
      az('b1', 240, 65, 'done = true'), az('b2', 240, 155, 'done = true'),
      { id: 'race', tipo: 'linea', x1: 300, y1: 97, x2: 300, y2: 153, tratt: true, tono: 'no', nascosto: true },
      { id: 'rl', tipo: 'testo', x: 312, y: 125, t: 'data race', anchor: 'start', tono: 'no', nascosto: true },
      { id: 'mem', tipo: 'rett', x: 200, y: 226, w: 200, h: 34, t: 'list = [ ]' },
      { id: 'fix', tipo: 'testo', x: 300, y: 284, t: '', size: 12 }
    ],
    passi: [
      { nota: "<b>Parte A.</b> t1 e t2 eseguono lo stesso codice con x = 5 su una lista sincronizzata (<code>Collections.synchronizedList</code>): <code>contains</code> e <code>add</code> prendono ciascuno il lock della lista.", righe: [1, 2, 3] },
      { nota: "t1: <code>contains(5)</code> restituisce false. Alla fine del metodo il lock viene rilasciato.", righe: [2], set: { a1: { nascosto: false, tono: 'ora' }, r1: { nascosto: false } } },
      { nota: "t2: <code>contains(5)</code> restituisce false anche a lui: il 5 non c'è ancora.", righe: [2], set: { a1: { tono: null }, a2: { nascosto: false, tono: 'ora' }, r2: { nascosto: false } } },
      { nota: "t1: <code>add(5)</code>. list = [5].", righe: [3], set: { a2: { tono: null }, a3: { nascosto: false, tono: 'ora' }, mem: { t: 'list = [5]' } } },
      { nota: "t2: <code>add(5)</code>, perché aveva già deciso di aggiungerlo. list = [5, 5]: un <b>duplicato</b>.", righe: [3], set: { a3: { tono: null }, a4: { nascosto: false, tono: 'no' }, mem: { t: 'list = [5, 5]', tono: 'no' } } },
      { nota: "<b>Data race? No</b>: ogni accesso alla lista sta dentro un metodo synchronized, quindi è ordinato da happens-before (regola del monitor). <b>Race condition? Sì</b>: se t1 finisse tutto prima di t2, la lista sarebbe [5]. Il risultato dipende dall'interleaving.", righe: [2, 3] },
      { nota: "Rimedio: controllo e aggiunta sono una <b>compound action</b> (check-then-act) e vanno sotto lo <b>stesso</b> lock.", righe: [2, 3], set: { fix: { t: 'synchronized (list) { if (!list.contains(x)) list.add(x); }', tono: 'ok' } } },
      { nota: "<b>Parte B</b>, il contrario. Un campo normale e due thread che scrivono entrambi <code>done = true</code>, senza lock.", righe: [5, 6, 7, 8], set: { a1: { nascosto: true }, a2: { nascosto: true }, a3: { nascosto: true }, a4: { nascosto: true, tono: null }, r1: { nascosto: true }, r2: { nascosto: true }, fix: { t: '' }, mem: { t: 'done = false', tono: null }, b1: { nascosto: false, tono: 'ora' }, b2: { nascosto: false, tono: 'ora' } } },
      { nota: "Due scritture sulla stessa variabile non volatile, non ordinate da happens-before: <b>data race</b>.", righe: [8], set: { race: { nascosto: false }, rl: { nascosto: false } } },
      { nota: "Ma in qualunque ordine vadano, dopo i due join <code>done</code> vale true: il risultato non dipende dall'interleaving, quindi <b>nessuna race condition</b>. Per il JMM il programma resta comunque <b>non</b> correctly synchronized.", righe: [8], set: { b1: { tono: null }, b2: { tono: null }, mem: { t: 'done = true', tono: 'ok' } } }
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
      <tr><td>{{s|s014|}}</td><td>{{s|s015|}}</td><td>{{s|s016|}}</td><td>{{s|s017|}}</td></tr>
      <tr><td>{{s|s018|}}</td><td>{{s|s019|}}</td><td>{{s|s020|}}</td><td>{{s|s021|}}</td></tr>
      <tr><td>{{s|s022|}}</td><td>{{s|s023|}}</td><td>{{s|s024|}}</td><td>{{s|s025|}}</td></tr>
      <tr><td>{{s|s026|}}</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
      <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td><td>{{s|s033|}}</td></tr>
      <tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td></tr>
      <tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td><td>{{s|s041|}}</td></tr>
      <tr><td>{{s|s042|}}</td><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td></tr>
      <tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td></tr>
      <tr><td>{{s|s050|}}</td><td>{{s|s051|}}</td><td>{{s|s052|}}</td><td>{{s|s053|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s054|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s055|}}</th><th>{{s|s056|}}</th><th>{{s|s057|}}</th><th>{{s|s058|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s059|}}</td><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>{{s|s062|}}</td></tr>
      <tr><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>{{s|s066|}}</td></tr>
      <tr><td>{{s|s067|}}</td><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td></tr>
      <tr><td>{{s|s071|}}</td><td>{{s|s072|}}</td><td>{{s|s073|}}</td><td>{{s|s074|}}</td></tr>
      <tr><td>{{s|s075|}}</td><td>{{s|s076|}}</td><td>{{s|s077|}}</td><td>{{s|s078|}}</td></tr>
      <tr><td>{{s|s079|}}</td><td>{{s|s080|}}</td><td>{{s|s081|}}</td><td>{{s|s082|}}</td></tr>
      <tr><td>{{s|s083|}}</td><td>{{s|s084|}}</td><td>{{s|s085|}}</td><td>{{s|s086|}}</td></tr>
      <tr><td>{{s|s087|}}</td><td>{{s|s088|}}</td><td>{{s|s089|}}</td><td>{{s|s090|}}</td></tr>
      <tr><td>{{s|s091|}}</td><td>{{s|s092|}}</td><td>{{s|s093|}}</td><td>{{s|s094|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s095|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s096|}}</th><th>{{s|s097|}}</th><th>{{s|s098|}}</th><th>{{s|s099|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s100|}}</td><td>{{s|s101|}}</td><td>{{s|s102|}}</td><td>{{s|s103|}}</td></tr>
      <tr><td>{{s|s104|}}</td><td>{{s|s105|}}</td><td>{{s|s106|}}</td><td>{{s|s107|}}</td></tr>
      <tr><td>{{s|s108|}}</td><td>{{s|s109|}}</td><td>{{s|s110|}}</td><td>{{s|s111|}}</td></tr>
      <tr><td>{{s|s112|}}</td><td>{{s|s113|}}</td><td>{{s|s114|}}</td><td>{{s|s115|}}</td></tr>
      <tr><td>{{s|s116|}}</td><td>{{s|s117|}}</td><td>{{s|s118|}}</td><td>{{s|s119|}}</td></tr>
      <tr><td>{{s|s120|}}</td><td>{{s|s121|}}</td><td>{{s|s122|}}</td><td>{{s|s123|}}</td></tr>
      <tr><td>{{s|s124|}}</td><td>{{s|s125|}}</td><td>{{s|s126|}}</td><td>{{s|s127|}}</td></tr>
      <tr><td>{{s|s128|}}</td><td>{{s|s129|}}</td><td>{{s|s130|}}</td><td>{{s|s131|}}</td></tr>
      <tr><td>{{s|s132|}}</td><td>{{s|s133|}}</td><td>{{s|s134|}}</td><td>{{s|s135|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s136|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s137|}}</th><th>{{s|s138|}}</th><th>{{s|s139|}}</th><th>{{s|s140|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s141|}}</td><td>{{s|s142|}}</td><td>{{s|s143|}}</td><td>{{s|s144|}}</td></tr>
      <tr><td>{{s|s145|}}</td><td>{{s|s146|}}</td><td>{{s|s147|}}</td><td>{{s|s148|}}</td></tr>
      <tr><td>{{s|s149|}}</td><td>{{s|s150|}}</td><td>{{s|s151|}}</td><td>{{s|s152|}}</td></tr>
      <tr><td>{{s|s153|}}</td><td>{{s|s154|}}</td><td>{{s|s155|}}</td><td>{{s|s156|}}</td></tr>
      <tr><td>{{s|s157|}}</td><td>{{s|s158|}}</td><td>{{s|s159|}}</td><td>{{s|s160|}}</td></tr>
      <tr><td>{{s|s161|}}</td><td>{{s|s162|}}</td><td>{{s|s163|}}</td><td>{{s|s164|}}</td></tr>
      <tr><td>{{s|s165|}}</td><td>{{s|s166|}}</td><td>{{s|s167|}}</td><td>{{s|s168|}}</td></tr>
      <tr><td>{{s|s169|}}</td><td>{{s|s170|}}</td><td>{{s|s171|}}</td><td>{{s|s172|}}</td></tr>
      <tr><td>{{s|s173|}}</td><td>{{s|s174|}}</td><td>{{s|s175|}}</td><td>{{s|s176|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s177|}}</h2>
  <div class="colonne">
    <div class="carta">
      <h4>{{s|s178|}}</h4>
      <p>{{s|s179|}}</p>
    </div>
    <div class="carta">
      <h4>{{s|s180|}}</h4>
      <p>{{s|s181|}}</p>
    </div>
  </div>
  <figure class="scena" data-scena="duerace" data-titolo="{{a|s182|}}"></figure>
</section>

</main>
</body>
</html>
