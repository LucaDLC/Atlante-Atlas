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
SCENE.blocco = {
  w: 520, h: 230, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'l0', tipo: 'testo', x: 40, y: 40, t: 'val area =', size: 15, bold: true, anchor: 'start' },
    { id: 'l1', tipo: 'testo', x: 70, y: 75, t: 'val base = 4', size: 15, anchor: 'start' },
    { id: 'l2', tipo: 'testo', x: 70, y: 105, t: 'val altezza = 3', size: 15, anchor: 'start' },
    { id: 'l3', tipo: 'testo', x: 70, y: 135, t: 'base * altezza', size: 15, anchor: 'start' },
    { id: 'v', tipo: 'testo', x: 380, y: 105, t: '', size: 16, bold: true },
    { id: 'n', tipo: 'testo', x: 260, y: 200, t: '', size: 15, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { l1: { tono: 'dato' }, l2: { tono: 'dato' } } },
    { nota: '{{j|s005|'}}', set: { l3: { tono: 'ora' }, v: { t: '4 * 3', tono: 'ora' } } },
    { nota: '{{j|s006|'}}', set: { v: { t: '= 12', tono: 'ok' }, n: { t: 'area = 12', tono: 'ok' } } },
    { nota: '{{j|s007|'}}', set: { l1: { tono: 'spento' }, l2: { tono: 'spento' }, l3: { tono: 'spento' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

    SCENE.modulo = {
      w: 580, h: 240, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [
        R('pk', 20, 20, 400, 200, '', { tono: 'spento' }), T('pkt', 220, 40, 'package adpro.intro', { size: 12 }),
        R('ob', 40, 55, 360, 150, '', { tono: 'spento' }), T('obt', 220, 75, 'object MyModule', { bold: true, size: 12 }),
        R('m1', 60, 90, 150, 32, 'def abs', { tono: 'dato' }), R('m2', 230, 90, 150, 32, 'private formatAbs', { tono: 'no' }),
        R('m3', 60, 140, 150, 32, 'val magic = 42', { tono: 'dato' }), R('m4', 230, 140, 150, 32, '@main printAbs', { tono: 'dato' }),
        T('fu', 500, 60, 'da fuori:', { size: 12, bold: true }), T('c1', 500, 100, '', { size: 12 }), T('c2', 500, 140, '', { size: 12 }), T('c3', 500, 180, '', { size: 12 })
      ],
      passi: [
        { nota: "Il file della settimana 1: un <b>package</b> (la cartella logica) che contiene un <b>object</b>, un contenitore con un solo esemplare. Si usa come spazio dei nomi, come una classe Java con solo metodi static." },
        { nota: "Da fuori si chiama con il nome dell'object: <code>MyModule.abs(-7)</code> = 7. Il nome completo inizia con il package: adpro.intro.MyModule.abs.", set: { m1: { tono: 'ok' }, c1: { t: 'MyModule.abs(-7) → 7', tono: 'ok' } } },
        { nota: "<code>formatAbs</code> è <b>private</b>: si può usare solo dentro MyModule. printAbs la usa; da fuori non si vede.", set: { c2: { t: 'formatAbs: vietato', tono: 'no' } } },
        { nota: "<code>@main</code> segna da dove parte il programma: <code>scala-cli run . -M adpro.intro.printAbs</code>. Stampa \"The absolute value of -58 is 58\" (magic − 100 = −58).", set: { m4: { tono: 'ok' }, c3: { t: 'run: … -58 is 58', tono: 'ok' } } }
      ]
    };

    const K = [['val x = …', 'subito, una volta'], ['def x = …', 'a ogni uso'], ['lazy val x = …', 'al primo uso, poi ricorda'], ['var x = …', 'subito; si può riassegnare']];
    const og = [];
    K.forEach(([k], i) => og.push(R('k' + i, 20, 30 + i * 48, 160, 36, k, { tono: 'spento' }), T('u' + i, 200, 53 + i * 48, '', { size: 12, anchor: 'start' })));
    og.push(T('c', 300, 228, '', { size: 12, bold: true }));
    SCENE.valdef = {
      w: 600, h: 240, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: og,
      passi: [
        { nota: "Quattro modi di dare un nome. La differenza è <b>quando</b> si calcola il valore. Immagina che il calcolo stampi \"calcolo!\" e che x venga usato due volte." },
        { nota: "<b>val</b>: calcola subito, una volta. Due usi, una stampa. Il modo normale, da usare sempre.", set: { k0: { tono: 'ok' }, u0: { t: 'stampa 1 volta, subito' } } },
        { nota: "<b>def</b>: ricalcola a ogni uso. Due usi, due stampe. È una funzione senza argomenti.", set: { k1: { tono: 'ok' }, u1: { t: 'stampa a ogni uso: 2 volte' } } },
        { nota: "<b>lazy val</b>: calcola al primo uso, poi ricorda. Due usi, una stampa, ma solo quando serve (settimana 4).", set: { k2: { tono: 'ok' }, u2: { t: 'stampa 1 volta, al primo uso' } } },
        { nota: "<b>var</b>: calcola subito e si può riassegnare con <code>x = …</code>. Negli esercizi del corso è <b>vietata</b>.", set: { k3: { tono: 'no' }, u3: { t: 'riassegnabile: vietata negli esercizi', tono: 'no' }, c: { t: 'val sempre; def per ricalcolare; lazy val per rimandare' } } }
      ]
    };

    SCENE.scalacli = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [
        R('f', 20, 40, 150, 50, 'Exercises.scala', { tono: 'dato' }), R('cmd', 210, 40, 170, 50, 'scala-cli test . -w', { tono: 'ora' }), R('out', 420, 40, 140, 50, '', { tono: 'spento' }),
        F('a1', 172, 65, 206, 65, ''), F('a2', 382, 65, 416, 65, ''),
        T('c', 290, 130, '', { size: 12, bold: true }), T('c2', 290, 160, '', { size: 12 }), T('c3', 290, 200, '', { size: 12 })
      ],
      passi: [
        { nota: "Il modo consigliato di lavorare: dalla cartella della settimana lanci <code>scala-cli test . -w</code>. Il punto vuol dire \"questa cartella\", -w vuol dire \"rilancia a ogni salvataggio\"." },
        { nota: "Compila e lancia i test di Exercises.test.scala. Finché una funzione è <code>???</code> il suo test fallisce con NotImplementedError.", set: { out: { t: 'test falliti', tono: 'no' }, c: { t: '??? compila, ma lancia NotImplementedError', tono: 'no' } } },
        { nota: "Scrivi la funzione e salvi: i test ripartono da soli.", set: { f: { t: 'salvato ✓' }, out: { t: 'test passati', tono: 'ok' }, c: { t: 'salvi → ricompila → test di nuovo', tono: 'ok' } } },
        { nota: "Per provare a mano: <code>scala-cli repl .</code>, poi <code>import adpro.intro.MyModule.*</code> e <code>abs(-7)</code> → 7. Se \"prima funzionava e ora no\": <code>scala-cli clean .</code>.", set: { cmd: { t: 'scala-cli repl .' }, out: { t: 'abs(-7) = 7', tono: 'ok' }, c2: { t: 'repl: prova le funzioni a mano' }, c3: { t: 'clean: cancella i file generati' } } }
      ]
    };

    SCENE.errrepl = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s011|'}}',
      oggetti: [
        R('e', 20, 30, 540, 40, 'scala> adpro.intro.Exercise.fib(10)', { tono: 'spento' }),
        T('m', 290, 100, '', { size: 12, bold: true }), R('fix', 20, 130, 540, 40, '', { tono: 'ok', nascosto: true }), T('c', 290, 196, '', { size: 12 })
      ],
      passi: [
        { nota: "Nel REPL chiami fib con il nome completo." },
        { nota: "Errore: <code>value Exercise is not a member of adpro.intro</code>. Nel package non esiste niente con quel nome.", set: { e: { tono: 'no' }, m: { t: 'value Exercise is not a member of adpro.intro', tono: 'no' } } },
        { nota: "Controlla il nome esatto dell'object nel file. Se fib sta fuori da ogni object, il nome completo è <code>adpro.intro.fib(10)</code>. E se hai appena modificato il file, riapri il REPL: vede il codice compilato all'avvio.", set: { fix: { nascosto: false, t: 'scala> adpro.intro.fib(10)' }, c: { t: 'nome completo = package + object (se c’è) + funzione' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s012|}}</h1>
  <p class="lede">{{s|s013|}}</p>
</header>

<section>
  <h2>{{s|s014|}}</h2>
  <p>{{s|s015|}}</p>
  <figure class="codice" data-titolo="{{a|s016|}}">
<pre data-lang="scala">package adpro.intro

object MyModule:

  def abs(n: Int): Int =
    if n &lt; 0 then -n else n

  private def formatAbs(x: Int): String =
    s"The absolute value of ${x} is ${abs(x)}"

  val magic: Int = 42
  var result: Option[Int] = None

  @main def printAbs: Unit =
    assert(magic - 84 == magic.-(84))
    println(formatAbs(magic - 100))

end MyModule</pre>
    <div class="intro"><p>{{s|s017|}}</p></div>
    <ol class="spiega">
      <li data-righe="1" data-segna="package@due"><p>{{s|s018|}}</p></li>
      <li data-righe="3" data-segna="object@ora|MyModule@dato"><p>{{s|s019|}}</p></li>
      <li data-righe="3" data-segna=":@ora"><p>{{s|s020|}}</p></li>
      <li data-righe="5" data-segna="def@ora|(n: Int)@dato|: Int#2@ok"><p>{{s|s021|}}</p></li>
      <li data-righe="6" data-segna="if@ora|then@ora|else@ora"><p>{{s|s022|}}</p></li>
      <li data-righe="5-6"><p>{{s|s023|}}</p></li>
      <li data-righe="8" data-segna="private@due"><p>{{s|s024|}}</p></li>
      <li data-righe="9" data-segna="s&quot;@ora|${x}@dato|${abs(x)}@dato"><p>{{s|s025|}}</p></li>
      <li data-righe="11" data-segna="val@ok"><p>{{s|s026|}}</p></li>
      <li data-righe="12" data-segna="var@no"><p>{{s|s027|}}</p></li>
      <li data-righe="14" data-segna="@main@ora|Unit@due"><p>{{s|s028|}}</p></li>
      <li data-righe="15" data-segna="magic - 84@dato|magic.-(84)@ok"><p>{{s|s029|}}</p></li>
      <li data-righe="18"><p>{{s|s030|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="modulo" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <p>{{s|s033|}}</p>
  <figure class="passi" data-titolo="{{a|s034|}}">
    <div class="passo">
      <div class="espr">val area =
  val base = <mark class="dato">4</mark>
  val altezza = <mark class="dato">3</mark>
  base * altezza</div>
      <p class="nota">{{s|s035|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val area =
  val base = 4
  val altezza = 3
  <mark class="ora">base * altezza</mark></div>
      <p class="nota">{{s|s036|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val area = <mark class="ora">4 * 3</mark></div>
      <p class="nota">{{s|s037|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val area = <mark class="ok">12</mark></div>
      <p class="nota">{{s|s038|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="blocco" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s041|}}</th><th>{{s|s042|}}</th><th>{{s|s043|}}</th><th>{{s|s044|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s045|}}</td><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr>
      <tr><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td>{{s|s051|}}</td><td>{{s|s052|}}</td></tr>
      <tr><td>{{s|s053|}}</td><td>{{s|s054|}}</td><td>{{s|s055|}}</td><td>{{s|s056|}}</td></tr>
      <tr><td>{{s|s057|}}</td><td>{{s|s058|}}</td><td>{{s|s059|}}</td><td>{{s|s060|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="valdef" data-titolo="{{a|s061|}}"></figure>
</section>

<section>
  <h2>{{s|s062|}}</h2>
  <p>{{s|s063|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s064|}}</th><th>{{s|s065|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td></tr>
      <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td></tr>
      <tr><td>{{s|s070|}}</td><td>{{s|s071|}}</td></tr>
      <tr><td>{{s|s072|}}</td><td>{{s|s073|}}</td></tr>
      <tr><td>{{s|s074|}}</td><td>{{s|s075|}}</td></tr>
      <tr><td>{{s|s076|}}</td><td>{{s|s077|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s078|}}</p>
  <pre class="cod" data-lang="scala">scala&gt; import adpro.intro.MyModule.*
scala&gt; abs(-7)
val res0: Int = 7</pre>
  <figure class="scena" data-scena="scalacli" data-titolo="{{a|s079|}}"></figure>
</section>

<section>
  <h2>{{s|s080|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">scala&gt; adpro.intro.Exercise.fib(10)</pre>
      <pre class="msg">value Exercise is not a member of adpro.intro</pre>
      <div class="fix">{{s|s081|}}</div>
    </div>
  </div>
  <div class="box attenzione" data-tit="{{a|s082|}}">
    <p>{{s|s083|}}</p>
  </div>
  <figure class="scena" data-scena="errrepl" data-titolo="{{a|s084|}}"></figure>
</section>

</main>
</body>
</html>
