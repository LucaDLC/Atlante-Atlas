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
SCENE.forlista = {
  w: 560, h: 230, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'X', tipo: 'celle', x: 40, y: 40, cw: 56, ch: 40, valori: ['3', '4', '5'] },
    { id: 'passo', tipo: 'testo', x: 380, y: 60, t: '', size: 14 },
    { id: 'R', tipo: 'celle', x: 40, y: 140, cw: 56, ch: 40, valori: ['', '', '', ''], indici: false },
    { id: 'tr', tipo: 'testo', x: 150, y: 128, t: 'risultato', size: 12 },
    { id: 'n', tipo: 'testo', x: 380, y: 160, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { X: { toni: { 0: 'ora' } }, passo: { t: '3 → 4 → (4, 4): pari' }, R: { valori: ['4', '4', '', ''], toni: { 0: 'ok', 1: 'ok' } } } },
    { nota: '{{j|s005|'}}', set: { X: { toni: { 0: 'ok', 1: 'no' } }, passo: { t: '4 → 5 → (5, 5): dispari' } } },
    { nota: '{{j|s006|'}}', set: { X: { toni: { 0: 'ok', 1: 'no', 2: 'ora' } }, passo: { t: '5 → 6 → (6, 6): pari' }, R: { valori: ['4', '4', '6', '6'], toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok' } } } },
    { nota: '{{j|s007|'}}', set: { X: { toni: { 0: 'ok', 1: 'no', 2: 'ok' } }, passo: { t: '' }, n: { t: 'List(4, 4, 6, 6)', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});
  const A = (id, da, a, extra) => Object.assign({ id, tipo: 'arco', da, a }, extra || {});

    SCENE.catena3 = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [
        R('p1', 20, 40, 170, 40, 'x1 <- Some(4)', { tono: 'spento' }), R('p2', 205, 40, 170, 40, 'x2 <- metà se pari', { tono: 'spento' }), R('p3', 390, 40, 170, 40, 'x3 <- Some(x2 + 1)', { tono: 'spento' }),
        T('v1', 105, 110, '', { bold: true }), T('v2', 290, 110, '', { bold: true }), T('v3', 475, 110, '', { bold: true }),
        T('r', 290, 170, '', { bold: true, size: 15 }), T('c', 290, 210, '', { size: 12 })
      ],
      passi: [
        { nota: "Tre passi, due possono fallire. Ogni passo dà un <b>nome</b> al valore del passo prima. Scritto con flatMap/map o con for…yield è lo stesso codice." },
        { nota: "x1 = 4.", set: { p1: { tono: 'ok' }, v1: { t: 'x1 = 4', tono: 'ok' } } },
        { nota: "4 è pari: Some(4 / 2), x2 = 2.", set: { p2: { tono: 'ok' }, v2: { t: 'x2 = 2', tono: 'ok' } } },
        { nota: "x3 = 3. <code>yield x3.toString</code>: <b>Some(\"3\")</b> (verificato).", set: { p3: { tono: 'ok' }, v3: { t: 'x3 = 3', tono: 'ok' }, r: { t: 'Some("3")', tono: 'ok' } } },
        { nota: "Con Some(5): 5 è dispari, il secondo passo dà <b>None</b> e il terzo non viene mai eseguito. Risultato None.", set: { p1: { t: 'x1 <- Some(5)' }, v1: { t: 'x1 = 5' }, p2: { tono: 'no' }, v2: { t: 'None', tono: 'no' }, p3: { tono: 'spento' }, v3: { t: 'saltato' }, r: { t: 'None', tono: 'no' }, c: { t: 'il primo None ferma la catena' } } }
      ]
    };

    SCENE.traduzione = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [
        T('f1', 150, 40, 'for', { size: 13, bold: true }), T('f2', 150, 70, 'a <- Some(2)', { size: 13 }), T('f3', 150, 100, 'b <- Some(3)', { size: 13 }), T('f4', 150, 130, 'yield a + b', { size: 13 }),
        T('t1', 420, 70, '', { size: 12 }), T('t2', 420, 100, '', { size: 12 }), T('r', 290, 190, '', { bold: true, size: 14 })
      ],
      passi: [
        { nota: "Le regole di traduzione di for…yield, su un esempio con due generatori." },
        { nota: "Un generatore che <b>non</b> è l'ultimo diventa un <b>flatMap</b>: <code>Some(2).flatMap(a =&gt; …)</code>.", set: { f2: { tono: 'ora' }, t1: { t: 'Some(2).flatMap(a =>', tono: 'ora' } } },
        { nota: "L'<b>ultimo</b> generatore insieme a yield diventa un <b>map</b>: <code>Some(3).map(b =&gt; a + b)</code>.", set: { f3: { tono: 'due' }, f4: { tono: 'due' }, t2: { t: '  Some(3).map(b => a + b))', tono: 'due' } } },
        { nota: "Risultato Some(5). Un <code>y = espressione</code> nel for diventa un valore intermedio; un <code>if</code> diventa withFilter. Il for con <b>do</b> (effetti, Unit) è vietato; quello con yield è codice puro.", set: { r: { t: 'Some(2).flatMap(a => Some(3).map(b => a + b)) = Some(5)', tono: 'ok' } } }
      ]
    };

    SCENE.headgrade = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [
        R('l1', 20, 40, 150, 40, '("Ada", 30)', { tono: 'dato' }), R('l2', 180, 40, 150, 40, '("Bob", 27)', { tono: 'dato' }),
        T('e', 290, 120, '', { bold: true, size: 14 }), T('c', 290, 170, '', { size: 12 })
      ],
      passi: [
        { nota: "<code>headGrade</code>: una lista di coppie (nome, voto); voglio il voto del primo, o None. <code>(String, Int)</code> è il tipo coppia: si accede per posizione." },
        { nota: "<code>headOption(lst)</code>: il primo elemento, se c'è. Un Option[(String, Int)].", set: { l1: { tono: 'ora' }, e: { t: 'Some(("Ada", 30))' } } },
        { nota: "<code>.map(_._2)</code>: il primo _ è la coppia dentro l'Option; <code>._2</code> è il secondo pezzo (si conta da 1: _1 è il nome).", set: { e: { t: 'Some(("Ada", 30)).map(_._2) = Some(30)', tono: 'ok' } } },
        { nota: "Con la lista vuota headOption dà None e map non fa niente: None. Errori tipici: <code>_.1</code> non compila (il metodo si chiama _1), e <code>_._1</code> dà la String, non il voto.", set: { l1: { tono: 'spento' }, l2: { tono: 'spento' }, e: { t: 'headGrade(Nil) = None' }, c: { t: '_.1 non compila · _._1 è il nome (String)' } } }
      ]
    };

    SCENE.varianza = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s011|'}}',
      oggetti: [C('x', 40, 30, ['1', '2', '3']), T('m', 400, 50, '', { bold: true }), C('q', 40, 110, ['', '', ''], { toni: { 0: 'spento', 1: 'spento', 2: 'spento' } }), T('v', 400, 130, '', { bold: true }), T('c', 290, 200, '', { size: 12 })],
      passi: [
        { nota: "Esercizio 8: var = media dei quadrati degli scarti dalla media. Due medie, e <b>tutte e due possono fallire</b> (sequenza vuota)." },
        { nota: "Passo 1: <code>m &lt;- mean(xs)</code> = Some(2.0), cioè (1 + 2 + 3) / 3.", set: { x: { toni: { 0: 'ora', 1: 'ora', 2: 'ora' } }, m: { t: 'm = 2.0', tono: 'ora' } } },
        { nota: "Dentro: <code>xs.map(x =&gt; math.pow(x - m, 2))</code>, la map delle sequenze. Scarti −1, 0, 1, al quadrato: 1, 0, 1.", set: { q: { valori: ['1', '0', '1'], toni: { 0: 'due', 1: 'due', 2: 'due' } } } },
        { nota: "Passo 2: la media di quei quadrati <b>può fallire</b> anche lei (Option): per questo serve flatMap, non map. v = 2 / 3.", set: { v: { t: 'v = 0.666…', tono: 'ok' }, c: { t: 'variance(Seq(1, 2, 3)) = Some(0.6666666666666666)', tono: 'ok' } } },
        { nota: "Con <code>Seq()</code> il primo passo dà None e il resto non viene eseguito: None.", set: { x: { valori: ['', '', ''], toni: {} }, m: { t: 'mean(Seq()) = None', tono: 'no' }, q: { valori: ['', '', ''], toni: {} }, v: { t: 'saltato' }, c: { t: 'variance(Seq()) = None', tono: 'no' } } }
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
  <figure class="passi" data-titolo="{{a|s015|}}">
    <div class="passo">
      <div class="espr">Some(4)
  .flatMap { <mark class="dato">x1</mark> => (if x1 % 2 == 0 then Some(x1 / 2) else None)
    .flatMap { <mark class="due">x2</mark> => Some(x2 + 1)
      .map { <mark class="ora">x3</mark> => x3.toString } } }</div>
      <p class="nota">{{s|s016|}}</p>
    </div>
    <div class="passo">
      <div class="espr">Some(4).flatMap { <mark class="dato">x1</mark> =>
  (if x1 % 2 == 0 then Some(x1 / 2) else None).flatMap { <mark class="due">x2</mark> =>
    Some(x2 + 1).map { <mark class="ora">x3</mark> =>
      x3.toString } } }</div>
      <p class="nota">{{s|s017|}}</p>
    </div>
    <div class="passo">
      <div class="espr">for
  <mark class="dato">x1</mark> &lt;- Some(4)
  <mark class="due">x2</mark> &lt;- if x1 % 2 == 0 then Some(x1 / 2) else None
  <mark class="ora">x3</mark> &lt;- Some(x2 + 1)
yield x3.toString</div>
      <p class="nota">{{s|s018|}}</p>
    </div>
    <div class="passo">
      <div class="espr">x1 = <mark class="dato">4</mark>   →   x2 = <mark class="due">2</mark>   →   x3 = <mark class="ora">3</mark>   →   <mark class="ok">Some("3")</mark></div>
      <p class="nota">{{s|s019|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="catena3" data-titolo="{{a|s020|}}"></figure>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s022|}}</th><th>{{s|s023|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s024|}}</td><td>{{s|s025|}}</td></tr>
      <tr><td>{{s|s026|}}</td><td>{{s|s027|}}</td></tr>
      <tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
      <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="passi" data-titolo="{{a|s032|}}">
    <div class="passo">
      <div class="espr">for
  a &lt;- ao
  b &lt;- bo
yield f(a, b)</div>
      <p class="nota">{{s|s033|}}</p>
    </div>
    <div class="passo">
      <div class="espr">for
  <mark class="ora">a &lt;- ao</mark>          <span class="mano">// non è l'ultimo</span>
  b &lt;- bo
yield f(a, b)

<mark class="ora">ao.flatMap(a =></mark> … <mark class="ora">)</mark></div>
      <p class="nota">{{s|s034|}}</p>
    </div>
    <div class="passo">
      <div class="espr">for
  a &lt;- ao
  <mark class="due">b &lt;- bo</mark>          <span class="mano">// è l'ultimo</span>
<mark class="due">yield f(a, b)</mark>

ao.flatMap(a => <mark class="due">bo.map(b => f(a, b))</mark>)</div>
      <p class="nota">{{s|s035|}}</p>
    </div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s036|}}">
    <p>{{s|s037|}}</p>
  </div>
  <div class="box idea" data-tit="{{a|s038|}}">
    <p>{{s|s039|}}</p>
    <p>{{s|s040|}}</p>
    <p>{{s|s041|}}</p>
  </div>
  <figure class="scena" data-scena="traduzione" data-titolo="{{a|s042|}}"></figure>
</section>

<section>
  <h2>{{s|s043|}}</h2>
  <pre class="cod" data-lang="scala">for
  x &lt;- List(3, 4, 5)
  incremented = x + 1
  duplicated &lt;- List(incremented, incremented)
  if incremented % 2 == 0
yield duplicated</pre>
  <figure class="passi" data-titolo="{{a|s044|}}">
    <div class="passo"><div class="espr">x = <mark class="dato">3</mark>   incremented = <mark class="ora">4</mark>   duplicated ∈ (4, 4)   4 pari? <mark class="ok">sì</mark>   →   <mark class="ok">4, 4</mark></div><p class="nota">{{s|s045|}}</p></div>
    <div class="passo"><div class="espr">x = <mark class="dato">4</mark>   incremented = <mark class="ora">5</mark>   duplicated ∈ (5, 5)   5 pari? <mark class="no">no</mark>   →   niente</div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr">x = <mark class="dato">5</mark>   incremented = <mark class="ora">6</mark>   duplicated ∈ (6, 6)   6 pari? <mark class="ok">sì</mark>   →   <mark class="ok">6, 6</mark></div><p class="nota">{{s|s047|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">List(4, 4, 6, 6)</mark></div><p class="nota">{{s|s048|}}</p></div>
  </figure>
  <figure class="scena" data-scena="forlista" data-titolo="{{a|s049|}}"></figure>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <p>{{s|s051|}}</p>
  <figure class="codice" data-titolo="{{a|s052|}}">
<pre data-lang="scala">def headGrade(lst: List[(String, Int)]): Option[Int] =
  headOption(lst).map(_._2)

def headGrade1(lst: List[(String, Int)]): Option[Int] =
  for p &lt;- headOption(lst) yield p._2</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="(String, Int)@dato"><p>{{s|s053|}}</p></li>
      <li data-righe="2" data-segna="headOption(lst)@due"><p>{{s|s054|}}</p></li>
      <li data-righe="2" data-segna="_@ora"><p>{{s|s055|}}</p></li>
      <li data-righe="2" data-segna="._2@ok"><p>{{s|s056|}}</p></li>
      <li data-righe="5" data-segna="p &lt;- headOption(lst)@due|p._2@ok"><p>{{s|s057|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s058|}}">
    <p>{{s|s059|}}</p>
  </div>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">headOption(lst).map(_.1)</pre>
      <pre class="msg">',' or ')' expected, but number literal found</pre>
      <div class="fix">Non è un indice: il metodo si chiama <code>_1</code>, con il trattino basso. Quindi <code>_._1</code>.</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def r: Option[Int] = lst.headOption.map(_._1)</pre>
      <pre class="msg">Found:    (_$1._1 : String)
Required: Int</pre>
      <div class="fix"><code>_1</code> è il nome, una String. Il voto è <code>_2</code>.</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">for x &lt;- Some(4) if x % 2 == 0 yield x   // con l'Option del corso</pre>
      <pre class="msg">value withFilter is not a member of Option.Some[Int]</pre>
      <div class="fix">Un <code>if</code> dentro un <code>for</code> cerca il metodo <code>withFilter</code>, non <code>filter</code>. L'Option degli esercizi non ce l'ha. Nessun esercizio lo richiede: usa <code>.filter</code> fuori dal for.</div>
    </div>
  </div>
  <figure class="scena" data-scena="headgrade" data-titolo="{{a|s060|}}"></figure>
</section>

<section>
  <h2>{{s|s061|}}</h2>
  <p>{{s|s062|}}</p>
  <figure class="codice" data-titolo="{{a|s063|}}">
<pre data-lang="scala">def variance(xs: Seq[Double]): Option[Double] =
  mean(xs).flatMap(m => mean(xs.map(x => math.pow(x - m, 2))))

def variance1(xs: Seq[Double]): Option[Double] =
  for
    m &lt;- mean(xs)
    v &lt;- mean(xs.map(x => math.pow(x - m, 2)))
  yield v</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="mean(xs)@dato"><p>{{s|s064|}}</p></li>
      <li data-righe="2" data-segna="flatMap(m =>@ora"><p>{{s|s065|}}</p></li>
      <li data-righe="2" data-segna="xs.map(x => math.pow(x - m, 2))@due"><p>{{s|s066|}}</p></li>
      <li data-righe="2" data-segna="mean(xs.map@ok"><p>{{s|s067|}}</p></li>
      <li data-righe="5-8" data-segna="m &lt;- mean(xs)@dato|v &lt;- mean@ok"><p>{{s|s068|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s069|}}">
    <div class="passo"><div class="espr">m &lt;- mean(Seq(1, 2, 3)) = <mark class="dato">Some(2.0)</mark></div><p class="nota">(1 + 2 + 3) / 3 = 2.</p></div>
    <div class="passo"><div class="espr">xs.map(x => (x - <mark class="dato">2</mark>)²) = Seq(<mark class="due">1.0</mark>, <mark class="due">0.0</mark>, <mark class="due">1.0</mark>)</div><p class="nota">{{s|s070|}}</p></div>
    <div class="passo"><div class="espr">v &lt;- mean(Seq(1, 0, 1)) = Some(0.666…)</div><p class="nota">2 / 3.</p></div>
    <div class="passo"><div class="espr"><mark class="ok">Some(0.6666666666666666)</mark></div><p class="nota">{{s|s071|}}</p></div>
  </figure>
  <figure class="scena" data-scena="varianza" data-titolo="{{a|s072|}}"></figure>
</section>

</main>
</body>
</html>
