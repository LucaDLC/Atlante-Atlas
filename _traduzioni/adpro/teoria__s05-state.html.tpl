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
  const out = ['a', 'b', 'c', 'a', 'b', 'c', 'a'];
  const riempi = k => out.map((v, i) => i < k ? v : '');
  const giro = (k, stato, arco, prossimo) => ({
    nota: `{{j|s002|`}}`,
    righe: [8, 9],
    set: Object.assign({ s1: { tono: null }, s2: { tono: null }, s3: { tono: null }, e12: { tono: null }, e23: { tono: null }, e31: { tono: null } },
      { ['s' + stato]: { tono: 'ora' }, [arco]: { tono: 'ora' }, L: { valori: riempi(k + 1), toni: { [k]: 'ok' } } })
  });
  SCENE.automa = {
    w: 600, h: 270, lato: false,
    legenda: '{{j|s003|'}}',
    codice: { lang: 'scala', testo: `val abc = State[Int, String] {
  case 1 => ("a", 2)
  case 2 => ("b", 3)
  case _ => ("c", 1)
}

def stateToLazyList[S, A](s: State[S, A])(initial: S): LazyList[A] =
  val (a, next) = s.run(initial)
  cons(a, stateToLazyList(s)(next))

stateToLazyList(abc)(1).take(7).toList` },
    oggetti: [
      { id: 's1', tipo: 'nodo', r: 26, x: 90, y: 80, t: '1', tono: null },
      { id: 's2', tipo: 'nodo', r: 26, x: 250, y: 80, t: '2' },
      { id: 's3', tipo: 'nodo', r: 26, x: 170, y: 210, t: '3' },
      { id: 'e12', tipo: 'arco', da: 's1', a: 's2', dir: true, t: 'a' },
      { id: 'e23', tipo: 'arco', da: 's2', a: 's3', dir: true, t: 'b' },
      { id: 'e31', tipo: 'arco', da: 's3', a: 's1', dir: true, t: 'c' },
      { id: 'tl', tipo: 'testo', x: 460, y: 110, t: 'la lazy list prodotta', size: 13 },
      { id: 'L', tipo: 'celle', x: 334, y: 128, cw: 36, ch: 36, valori: riempi(0) },
      { id: 'n', tipo: 'testo', x: 460, y: 222, t: '', size: 13, bold: true }
    ],
    passi: [
      { nota: '{{j|s004|'}}', righe: [1, 2, 3, 4, 5] },
      giro(0, 1, 'e12', 2),
      giro(1, 2, 'e23', 3),
      giro(2, 3, 'e31', 1),
      { nota: '{{j|s005|'}}', righe: [11], set: { s1: { tono: null }, s2: { tono: null }, s3: { tono: null }, e12: { tono: null }, e23: { tono: null }, e31: { tono: null }, L: { valori: out, toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok', 5: 'ok', 6: 'ok' } }, n: { t: 'List(a, b, c, a, b, c, a)', tono: 'ok' } } }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

    SCENE.apistate = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s006|'}}',
      oggetti: [R('s1', 20, 40, 60, 40, '1', { tono: 'ora' }), R('s2', 130, 40, 60, 40, '2', { tono: 'spento' }), R('s3', 240, 40, 60, 40, '3', { tono: 'spento' }),
        F('a1', 82, 60, 126, 60, 'a'), F('a2', 192, 60, 236, 60, 'b'), T('l', 170, 110, 'abc: 1 → "a", 2 → "b", 3 → "c", poi di nuovo 1', { size: 11 }),
        T('e', 440, 50, '', { size: 12, bold: true }), T('r', 440, 80, '', { size: 12 }), T('c', 290, 160, '', { size: 12 }), T('c2', 290, 195, '', { size: 12 })],
      passi: [
        { nota: "<code>State[S, +A](run: S =&gt; (A, S))</code>: lo stesso schema di Rand, con uno stato S qualsiasi. L'automa abc: da 1 produce \"a\" e va in 2, e così via." },
        { nota: "<b>flatMap</b>: fai il tuo passo, poi il passo dell'automa scelto da f, sullo stato nuovo. <code>abc.flatMap(a =&gt; abc.map(b =&gt; a + b)).run(1)</code>: \"a\" (stato 2), poi \"b\" (stato 3).", set: { e: { t: 'flatMap … run(1)' }, r: { t: '("ab", 3)', tono: 'ok' }, s2: { tono: 'ora' }, s3: { tono: 'ora' } } },
        { nota: "<b>map</b> scritto con flatMap: il secondo passo è un automa che non cambia lo stato e restituisce f(a). <b>map2</b> con for/yield: <code>abc.map2(abc)(_ + _).run(2)</code> = (\"bc\", 1).", set: { e: { t: 'map2 … run(2)' }, r: { t: '("bc", 1)', tono: 'ok' } } },
        { nota: "Tre funzioni del file: <code>get</code> legge lo stato (get.run(7) = (7, 7)), <code>set(s)</code> lo sostituisce (set(5).run(7) = ((), 5)), <code>modify(f)</code> = get poi set(f(stato)) (modify(_ * 10).run(4) = ((), 40)).", set: { c: { t: 'get.run(7) = (7, 7) · set(5).run(7) = ((), 5)' }, c2: { t: 'modify(_ * 10).run(4) = ((), 40)' } } },
        { nota: "Con get, set, modify e for/yield il codice <b>sembra</b> imperativo, ma resta puro: è la descrizione di una transizione, che parte quando si chiama <code>run</code>.", set: { e: { t: '' }, r: { t: '' } } }
      ]
    };

    SCENE.statolista = {
      w: 580, h: 200, lato: true,
      legenda: '{{j|s007|'}}',
      oggetti: [C('l', 30, 40, ['', '', '', '', '', '…'], { cw: 80, toni: {} }), T('st', 290, 110, '', { size: 12 }), T('c', 290, 150, '', { size: 12 }), T('c2', 290, 180, '', { size: 12 })],
      passi: [
        { nota: "<code>stateToLazyList(s)(initial)</code>: un passo dell'automa, e il resto della lista è \"lo stesso automa dallo stato successivo\". Nessun caso base." },
        { nota: "Con l'automa \"incrementa\" <code>State[Int, Int](x =&gt; (x, x + 1))</code> da 0: emette 0, stato 1…", set: { l: { valori: ['0', '', '', '', '', '…'], toni: { 0: 'ok', 5: 'spento' } }, st: { t: 'stato: 1' } } },
        { nota: "…1, 2, 3, 4. <code>take(5).toList</code> = List(0, 1, 2, 3, 4) (test Ex10.02). Funziona solo perché cons non calcola la coda finché non serve: con una List normale sarebbe un ciclo infinito.", set: { l: { valori: ['0', '1', '2', '3', '4', '…'], toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok', 5: 'spento' } }, st: { t: 'stato: 5 (il resto non è calcolato)' } } },
        { nota: "Esercizio 11: il generatore di interi è un automa, e la sua <b>traccia</b> è una lista infinita di numeri casuali. <code>lazyInts(SimpleRNG(42)).take(10).toList</code>: 16159453, −1281479697, −340305902, … Automa → lista pigra → take → lista: le astrazioni si compongono.", set: { l: { valori: ['16159453', '-128147…', '-340305…', '-201575…', '1770001…', '…'], toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok', 5: 'spento' } }, st: { t: '' }, c: { t: 'stati vs stream: srotolare un automa dà una lista (pigra)' } } }
      ]
    };

    SCENE.componi = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [T('op', 290, 26, '', { bold: true, size: 14 }), T('e', 290, 60, '', { size: 12 }), R('b1', 30, 80, 240, 44, '', { tono: 'spento' }), R('b2', 310, 80, 240, 44, '', { tono: 'spento' }), F('f', 272, 102, 306, 102, '', { nascosto: true }),
        T('r', 290, 160, '', { bold: true, size: 13 }), T('c', 290, 200, '', { size: 12 })],
      passi: [
        { nota: "State è una <b>monade</b>, come List, Option e LazyList: ha map, flatMap e map2. Con queste si <b>compongono</b> automi (slide 11–13). Esempi con Rand[A] = State[RNG, A] e SimpleRNG(42), tutti verificati." },
        { nota: "<b>map</b> trasforma i valori prodotti, senza toccare lo stato: <code>even = map(int)(n =&gt; n * 2)</code> genera pari. Da SimpleRNG(42): int dà 16159453, even dà 32318906.", set: { op: { t: 'map' }, e: { t: 'val even: Rand[Int] = int.map(n => n * 2)' }, b1: { t: 'int → 16159453', tono: 'ora' }, b2: { t: 'even → 32318906', tono: 'ok' }, f: { nascosto: false }, r: { t: 'stesso stato consumato, valore trasformato' } } },
        { nota: "<b>flatMap</b>: f prende il valore prodotto e costruisce un <b>automa nuovo</b>. Una lista di lunghezza casuale: <code>size.flatMap(n =&gt; ints(n))</code>. Qui size (un intero da 0 a 3) vale 1, e ints(1) gira sullo stato <b>successivo</b>: List(−1281479697). La dimensione è generata con uno stato diverso da quello dei numeri.", set: { op: { t: 'flatMap' }, e: { t: 'val ns: Rand[List[Int]] = size.flatMap(n => ints(n))' }, b1: { t: 'size → 1 (stato G0)', tono: 'ora' }, b2: { t: 'ints(1) → List(-1281479697)', tono: 'ok' }, r: { t: 'il secondo automa dipende dal primo valore' } } },
        { nota: "<b>map2</b>: lo \"zip\" di due automi sullo <b>stesso</b> spazio di stati. Con C = (A, B) è un <b>automa prodotto</b> che sincronizza due calcoli: <code>abc.map2(abc)((a, b) =&gt; (a, b)).run(1)</code> = ((a, b), 3).", set: { op: { t: 'map2' }, e: { t: 'abc.map2(abc)((a, b) => (a, b)).run(1)' }, b1: { t: 'abc da 1 → "a", stato 2', tono: 'ora' }, b2: { t: 'abc da 2 → "b", stato 3', tono: 'ora' }, r: { t: '(("a", "b"), 3)', tono: 'ok' } } },
        { nota: "E <b>sequence</b> mette in fila una lista di automi: <code>sequence(List(abc, abc, abc, abc)).run(1)</code> = (List(a, b, c, a), 2). Ogni cosa con uno stato (generatori, sessioni web, database, protocolli) si scrive così e si compone con gli stessi quattro strumenti.", set: { op: { t: 'sequence' }, e: { t: 'sequence(List(abc, abc, abc, abc)).run(1)' }, b1: { t: '1 → 2 → 3 → 1 → 2', tono: 'ora' }, b2: { t: 'List(a, b, c, a)', tono: 'ok' }, r: { t: '(List(a, b, c, a), 2)', tono: 'ok' }, c: { t: 'map · flatMap · map2 · sequence: come per List e Option' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s009|}}</h1>
  <p class="lede">{{s|s010|}}</p>
</header>

<section>
  <h2>{{s|s011|}}</h2>
  <figure class="passi" data-titolo="{{a|s012|}}">
    <div class="passo"><div class="espr">RNG =&gt; (A, RNG)</div><p class="nota">{{s|s013|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">S</mark> =&gt; (<mark class="ok">A</mark>, <mark class="dato">S</mark>)</div><p class="nota">{{s|s014|}}</p></div>
    <div class="passo"><div class="espr">case class State[<mark class="dato">S</mark>, +<mark class="ok">A</mark>](run: <mark class="dato">S</mark> =&gt; (<mark class="ok">A</mark>, <mark class="dato">S</mark>))</div><p class="nota">{{s|s015|}}</p></div>
    <div class="passo"><div class="espr">type Rand[A] = State[<mark class="dato">RNG</mark>, A]</div><p class="nota">{{s|s016|}}</p></div>
  </figure>
  <figure class="scena" data-scena="automa" data-titolo="{{a|s017|}}"></figure>
  <figure class="passi" data-titolo="{{a|s018|}}">
    <div class="passo"><div class="espr">var x = 0;  while true do { print(x); x += 1 }</div><p class="nota">{{s|s019|}}</p></div>
    <div class="passo"><div class="espr">State[Int, Int](<mark class="dato">x</mark> =&gt; (<mark class="ok">x</mark>, <mark class="dato">x + 1</mark>))</div><p class="nota">{{s|s020|}}</p></div>
    <div class="passo"><div class="espr">stateToLazyList(…)(0).take(5).toList = <mark class="ok">List(0, 1, 2, 3, 4)</mark></div><p class="nota">{{s|s021|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s022|}}</h2>
  <figure class="codice" data-titolo="{{a|s023|}}">
<pre data-lang="scala">case class State[S, +A](run: S =&gt; (A, S)):

  def flatMap[B](f: A =&gt; State[S, B]): State[S, B] =
    State { s =&gt;
      val (a, s1) = run(s)
      f(a).run(s1)
    }

  def map[B](f: A =&gt; B): State[S, B] =
    flatMap(a =&gt; unit(f(a)))

  def map2[B, C](sb: State[S, B])(f: (A, B) =&gt; C): State[S, C] =
    for
      a &lt;- this
      b &lt;- sb
    yield f(a, b)

object State:
  def sequence[S, A](sas: List[State[S, A]]): State[S, List[A]] =
    sas.foldRight(unit[S, List[A]](Nil))((sa, acc) =&gt; sa.map2(acc)(_ :: _))</pre>
    <ol class="spiega">
      <li data-righe="3-7" data-segna="run(s)@ora|f(a).run(s1)@ok"><p>{{s|s024|}}</p></li>
      <li data-righe="9-10" data-segna="unit(f(a))@due"><p>{{s|s025|}}</p></li>
      <li data-righe="12-16" data-segna="a &lt;- this@ora|b &lt;- sb@due"><p>{{s|s026|}}</p></li>
      <li data-righe="18-20" data-segna="unit[S, List[A]](Nil)@due|sa.map2(acc)@ora"><p>{{s|s027|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s028|}}">
    <p>{{s|s029|}}</p>
    <p>{{s|s030|}}</p>
  </div>
  <p>{{s|s031|}}</p>
  <pre class="cod" data-lang="scala" data-segna="sb.map(b =&gt; f(a, b))@due|h.map2(sequence(t))@ora">def map2[B,C](sb: State[S, B])(f: (A, B) =&gt; C): State[S, C] =
  flatMap(a =&gt; sb.map(b =&gt; f(a, b)))

def sequence[S,A](sas: List[State[S, A]]): State[S, List[A]] = sas match
  case Nil =&gt; unit(Nil)
  case h :: t =&gt; h.map2(sequence(t))(_ :: _)</pre>
  <figure class="passi" data-titolo="{{a|s032|}}" data-legenda="{{a|s033|}}">
    <div class="passo"><div class="espr">counter = State[Int, Int](x =&gt; (x, x + 1))     sequence(List(counter, counter, counter)).run(<mark class="dato">0</mark>)</div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">giusto, f(a).run(<mark class="ok">s1</mark>):  display 0 → biglietto <mark class="ora">0</mark> → display 1 → biglietto <mark class="ora">1</mark> → display 2 → biglietto <mark class="ora">2</mark> → display 3</div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">                          = <mark class="ok">(List(0, 1, 2), 3)</mark></div><p class="nota">{{s|s036|}}</p></div>
    <div class="passo"><div class="espr">sbagliato, f(a).run(<mark class="no">s</mark>): = <mark class="no">(List(0, 0, 0), 0)</mark></div><p class="nota">{{s|s037|}}</p></div>
    <div class="passo"><div class="espr">counter.flatMap(a =&gt; counter.map(b =&gt; a * 10 + b)).run(0):   <mark class="ok">(1, 2)</mark>  contro  <mark class="no">(0, 0)</mark></div><p class="nota">{{s|s038|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th></th><th>{{s|s039|}}</th><th>{{s|s040|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr>
      <tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr>
      <tr><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td></tr>
      <tr><td>{{s|s050|}}</td><td>{{s|s051|}}</td><td>{{s|s052|}}</td></tr>
    </tbody>
  </table></div>
  <div class="errori">
    <div class="errore">
<pre data-lang="scala">def flatMap[B](f: A =&gt; State[S, B]): State[S, B] =
  s =&gt;
    val (a, s1) = run(s)
    f(a).run(s1)</pre>
<pre class="msg">Missing parameter type

I could not infer the type of the parameter s
Expected type for the whole anonymous function:
  adpro.state.State[S, B]</pre>
      <div class="fix">{{s|s053|}}</div>
    </div>
    <div class="errore">
<pre data-lang="scala">f(a)(s1)</pre>
<pre class="msg">method apply in trait Function1 does not take more parameters</pre>
      <div class="fix">{{s|s054|}}</div>
    </div>
  </div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s055|}}</th><th>{{s|s056|}}</th><th>{{s|s057|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s058|}}</td><td>{{s|s059|}}</td><td>{{s|s060|}}</td></tr>
      <tr><td>{{s|s061|}}</td><td>{{s|s062|}}</td><td>{{s|s063|}}</td></tr>
      <tr><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>{{s|s066|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s067|}}</p>
  <figure class="scena" data-scena="apistate" data-titolo="{{a|s068|}}"></figure>
</section>

<section>
  <h2>{{s|s069|}}</h2>
  <p>{{s|s070|}}</p>
  <p>{{s|s071|}}</p>
  <p>{{s|s072|}}</p>
  <figure class="scena" data-scena="componi" data-titolo="{{a|s073|}}"></figure>
</section>

<section>
  <h2>{{s|s074|}}</h2>
  <figure class="codice" data-titolo="{{a|s075|}}">
<pre data-lang="scala">def stateToLazyList[S, A](s: State[S, A])(initial: S): LazyList[A] =
  val (a, next) = s.run(initial)
  cons(a, stateToLazyList(s)(next))

def lazyInts(rng: RNG): LazyList[Int] =
  stateToLazyList(State[RNG, Int](_.nextInt))(rng)

lazy val tenStrictInts: List[Int] =
  lazyInts(RNG.SimpleRNG(42)).take(10).toList</pre>
    <ol class="spiega">
      <li data-righe="1-3" data-segna="s.run(initial)@ora|cons(a, stateToLazyList(s)(next))@ok"><p>{{s|s076|}}</p></li>
      <li data-righe="5-6" data-segna="State[RNG, Int](_.nextInt)@due"><p>{{s|s077|}}</p></li>
      <li data-righe="8-9" data-segna="take(10).toList@ok"><p>{{s|s078|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s079|}}">
    <p>{{s|s080|}}</p>
    <p>{{s|s081|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s082|}}" data-legenda="{{a|s083|}}">
    <div class="passo"><div class="espr">counter = State[Int, Int](x =&gt; (x, x + 1))</div><p class="nota">{{s|s084|}}</p></div>
    <div class="passo"><div class="espr">counter.run(<mark class="dato">0</mark>) = (<mark class="ora">0</mark>, <mark class="due">1</mark>)</div><p class="nota">{{s|s085|}}</p></div>
    <div class="passo"><div class="espr">cons(<mark class="ora">0</mark>, ⟨stateToLazyList(counter)(<mark class="due">1</mark>)⟩)</div><p class="nota">{{s|s086|}}</p></div>
    <div class="passo"><div class="espr">{{s|s087|}}</div><p class="nota">{{s|s088|}}</p></div>
    <div class="passo"><div class="espr">{{s|s089|}}</div><p class="nota">{{s|s090|}}</p></div>
    <div class="passo"><div class="espr">{{s|s091|}}</div><p class="nota">{{s|s092|}}</p></div>
  </figure>
  <div class="errori">
    <div class="errore">
<pre data-lang="scala">def stateToList[S, A](s: State[S, A])(initial: S): List[A] =
  val (a, next) = s.run(initial)
  a :: stateToList(s)(next)

stateToList(counter)(0).take(3)</pre>
<pre class="msg">java.lang.StackOverflowError</pre>
      <div class="fix">{{s|s093|}}</div>
    </div>
    <div class="errore">
<pre data-lang="scala">def lazyInts(rng: RNG): LazyList[Int] =
  stateToLazyList(RNG.int)(rng)</pre>
<pre class="msg">Found:    (adpro.state.RNG.int : adpro.state.RNG.Rand[Int])
Required: adpro.state.State[S, Any]</pre>
      <div class="fix">{{s|s094|}}</div>
    </div>
    <div class="errore">
<pre data-lang="scala">lazy val tenStrictInts: List[Int] =
  lazyInts(RNG.SimpleRNG(42)).take(10)</pre>
<pre class="msg">Found:    adpro.lazyList.LazyList[Int]
Required: List[Int]</pre>
      <div class="fix">{{s|s095|}}</div>
    </div>
  </div>
  <div class="box attenzione" data-tit="{{a|s096|}}">
    <p>{{s|s097|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s098|}}">
    <p>{{s|s099|}}</p>
  </div>
  <figure class="scena" data-scena="statolista" data-titolo="{{a|s100|}}"></figure>
</section>

</main>
</body>
</html>
