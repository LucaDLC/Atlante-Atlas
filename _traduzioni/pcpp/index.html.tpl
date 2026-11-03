<!doctype html>
<html lang="it">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>{{t|s001|}}</title>
<link rel="stylesheet" href="assets/atlas.css">
<link rel="stylesheet" href="assets/tema.css">
<link rel="stylesheet" href="assets/pcpp.css">
<script src="assets/sito.js"></script>
<script src="assets/atlas.js" defer></script>
<script src="assets/pcpp.js" defer></script>
<script>
(window.PROGRAMMI = window.PROGRAMMI || {}).home = {
  memoria: { counter: 0 },
  thread: ['t1', 't2'],
  locali: { temp: 0 },
  passi: [
    { n: 1, codice: 'int temp = counter;', fai: (m, l) => { l.temp = m.counter; } },
    { n: 2, codice: 'counter = temp + 1;', fai: (m, l) => { m.counter = l.temp + 1; } }
  ],
  esito: m => 'counter = ' + m.counter,
  giusto: m => m.counter === 2
};
</script>
</head>
<body>
<main class="pagina" data-senza-indice>

  <header class="testa copertina">
    <div class="occhiello">{{s|s002|}}</div>
    <p style="margin:18px 0 0">{{s|s003|}}</p>
    <p class="sottotitolo">{{s|s004|}}</p>
    <p class="lede">{{s|s005|}}</p>
  </header>

  <div class="conto" data-auto></div>

  <section>
    <h2>{{s|s006|}}</h2>
    <dl class="fatti">
      <div><dt>{{s|s007|}}</dt><dd>{{s|s008|}}</dd></div>
      <div><dt>{{s|s009|}}</dt><dd>{{s|s010|}}</dd></div>
      <div><dt>{{s|s011|}}</dt><dd>{{s|s012|}}</dd></div>
      <div><dt>{{s|s013|}}</dt><dd>{{s|s014|}}</dd></div>
      <div><dt>{{s|s015|}}</dt><dd>{{s|s016|}}</dd></div>
      <div><dt>{{s|s017|}}</dt><dd>{{s|s018|}}</dd></div>
      <div><dt>{{s|s019|}}</dt><dd>{{s|s020|}}</dd></div>
      <div><dt>{{s|s021|}}</dt><dd>{{s|s022|}}</dd></div>
      <div><dt>{{s|s023|}}</dt><dd>{{s|s024|}}</dd></div>
      <div><dt>{{s|s025|}}</dt><dd>{{s|s026|}}</dd></div>
      <div><dt>{{s|s027|}}</dt><dd>{{s|s028|}}</dd></div>
      <div><dt>{{s|s029|}}</dt><dd>{{s|s030|}}</dd></div>
      <div><dt>{{s|s031|}}</dt><dd>{{s|s032|}}</dd></div>
    </dl>
  </section>



  <section>
    <h2>{{s|s033|}}</h2>
    <p>{{s|s034|}}</p>
    <ul class="scadenze" data-auto data-max="6"></ul>
  </section>

  <section>
    <h2>{{s|s035|}}</h2>
    <div class="orario" data-auto></div>
  </section>

  <section>
    <h2>{{s|s036|}}</h2>
    <p>{{s|s037|}}</p>
    <ul class="settimane" data-auto></ul>
  </section>

  <section>
    <h2>{{s|s038|}}</h2>
    <p>{{s|s039|}}</p>
    <ul class="da-confermare" data-auto></ul>
  </section>

  <section>
    <h2>{{s|s040|}}</h2>
    <p>{{s|s041|}}</p>
    <div class="legenda">
      <span class="l-ora">{{s|s042|}}</span>
      <span class="l-dato">{{s|s043|}}</span>
      <span class="l-due">{{s|s044|}}</span>
      <span class="l-ok">{{s|s045|}}</span>
      <span class="l-no">{{s|s046|}}</span>
    </div>
    <p>{{s|s047|}}</p>
    <figure class="interleaving" data-prog="home" data-titolo="{{a|s048|}}"></figure>
  </section>

  <section>
    <h2>{{s|s049|}}</h2>
    <div class="mappa" data-auto data-sezione="Teoria"></div>
    <h3>{{s|s050|}}</h3>
    <div class="mappa">
      <a href="esame/formato.html">{{s|s051|}}</a>
      <a href="esame/assignment.html">{{s|s052|}}</a>
      <a href="esame/vincoli.html">{{s|s053|}}</a>
      <a href="esame/come-rispondere.html">{{s|s054|}}</a>
      <a href="esame/allenamento.html">{{s|s055|}}</a>
    </div>
  </section>

  <section>
    <h2>{{s|s056|}}</h2>
    <p>{{s|s057|}}</p>
    <ul>
      <li>{{s|s058|}}</li>
      <li>{{s|s059|}}</li>
      <li>{{s|s060|}}</li>
      <li>{{s|s061|}}</li>
      <li>{{s|s062|}}</li>
      <li>{{s|s063|}}</li>
      <li>{{s|s064|}}</li>
    </ul>
    <p class="piccolo">{{s|s065|}}</p>
  </section>

</main>
</body>
</html>
