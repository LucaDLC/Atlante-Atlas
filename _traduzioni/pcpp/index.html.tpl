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
      <span class="l-ora"><i></i>arancio · la cosa che cambia adesso</span>
      <span class="l-dato"><i></i>blu · il dato di partenza (e il thread t1)</span>
      <span class="l-due"><i></i>viola · un secondo ruolo (e il thread t2)</span>
      <span class="l-ok"><i></i>verde · il risultato</span>
      <span class="l-no"><i></i>rosso · scartato o sbagliato</span>
    </div>
    <p>{{s|s042|}}</p>
    <figure class="interleaving" data-prog="home" data-titolo="{{a|s043|}}"></figure>
  </section>

  <section>
    <h2>{{s|s044|}}</h2>
    <div class="mappa" data-auto data-sezione="Teoria"></div>
    <h3>{{s|s045|}}</h3>
    <div class="mappa">
      <a href="esame/formato.html"><small>esame</small><b>Com'è l'esame orale</b><span>Formato, date, cosa valutano</span></a>
      <a href="esame/assignment.html"><small>ammissione</small><b>Assignment e oral feedback</b><span>Consegne, gruppi, repository, sessioni</span></a>
      <a href="esame/vincoli.html"><small>regole</small><b>Vincoli e divieti</b><span>Busy-wait, try/finally, cosa non viene approvato</span></a>
      <a href="esame/come-rispondere.html"><small>orale</small><b>Come rispondere</b><span>Schemi di risposta e frasi pronte in inglese</span></a>
      <a href="esame/allenamento.html"><small>allenamento</small><b>Domande orali e risposte modello</b><span>Le domande "blue box" delle lezioni, con la risposta aperta</span></a>
    </div>
  </section>

  <section>
    <h2>{{s|s046|}}</h2>
    <p>{{s|s047|}}</p>
    <ul>
      <li>{{s|s048|}}</li>
      <li>{{s|s049|}}</li>
      <li>{{s|s050|}}</li>
      <li>{{s|s051|}}</li>
      <li>{{s|s052|}}</li>
      <li>{{s|s053|}}</li>
      <li>{{s|s054|}}</li>
    </ul>
    <p class="piccolo">{{s|s055|}}</p>
  </section>

</main>
</body>
</html>
