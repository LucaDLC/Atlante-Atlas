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
SCENE.map2 = {
  w: 560, h: 260, lato: false,
  legenda: '{{j|s002|'}}',
  codice: { lang: 'scala', testo: `def map2[A, B, C](ra: Rand[A], rb: Rand[B])(f: (A, B) => C): Rand[C] =
  rng =>
    val (a, r1) = ra(rng)
    val (b, r2) = rb(r1)
    (f(a, b), r2)

map2(nonNegativeInt, double)((_, _))(SimpleRNG(42))` },
  oggetti: [
    { id: 's0', tipo: 'nodo', r: 30, x: 70, y: 120, t: 'rng', sotto: 'seed 42', tono: 'dato' },
    { id: 's1', tipo: 'nodo', r: 30, x: 280, y: 120, t: 'r1', nascosto: true },
    { id: 's2', tipo: 'nodo', r: 30, x: 490, y: 120, t: 'r2', nascosto: true },
    { id: 'g1', tipo: 'arco', da: 's0', a: 's1', dir: true, t: 'ra', nascosto: true },
    { id: 'g2', tipo: 'arco', da: 's1', a: 's2', dir: true, t: 'rb', nascosto: true },
    { id: 'va', tipo: 'testo', x: 175, y: 60, t: '', size: 14, bold: true },
    { id: 'vb', tipo: 'testo', x: 385, y: 60, t: '', size: 14, bold: true },
    { id: 'res', tipo: 'testo', x: 280, y: 215, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}', righe: [1, 2] },
    { nota: '{{j|s004|'}}', righe: [3, 7], set: { g1: { nascosto: false, tono: 'ora' }, s1: { nascosto: false, tono: 'dato' }, va: { t: 'a = 16159453', tono: 'due' } } },
    { nota: '{{j|s005|'}}', righe: [4], set: { g1: { tono: null }, g2: { nascosto: false, tono: 'ora' }, s2: { nascosto: false, tono: 'dato' }, vb: { t: 'b = 0.5967…', tono: 'due' } } },
    { nota: '{{j|s006|'}}', righe: [5], set: { g2: { tono: null }, s2: { tono: 'ok' }, res: { t: '((16159453, 0.5967…), r2)', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

    SCENE.randtipo = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s007|'}}',
      oggetti: [R('in', 20, 60, 110, 44, 'rng', { tono: 'dato' }), R('g', 180, 50, 200, 64, 'Rand[A]', { tono: 'ora' }), R('o1', 430, 40, 130, 36, 'valore: A', { tono: 'ok' }), R('o2', 430, 86, 130, 36, 'rng2', { tono: 'dato' }),
        F('f1', 132, 82, 176, 82, ''), F('f2', 382, 70, 426, 58, ''), F('f3', 382, 94, 426, 104, ''), T('c', 290, 160, '', { size: 12 }), T('c2', 290, 195, '', { size: 12 })],
      passi: [
        { nota: "<code>type Rand[+A] = RNG =&gt; (A, RNG)</code>: un <b>alias di tipo</b>. Un Rand[A] è una funzione: dato uno stato, dà un valore e lo stato nuovo. Si legge \"un A casuale\"." },
        { nota: "<code>unit(a)</code>: dà sempre a e lascia lo stato <b>com'è</b>.", set: { g: { t: 'unit(a)' }, o1: { t: 'a' }, o2: { t: 'rng (uguale)' }, c: { t: 'unit(a) = rng => (a, rng)' } } },
        { nota: "<code>map(s)(f)</code>: fa girare s, applica f al valore, passa avanti lo stato. Chi la usa non vede mai rng.", set: { g: { t: 'map(s)(f)' }, o1: { t: 'f(a)' }, o2: { t: 'rng2 (da s)' }, c: { t: 'map: (a, rng2) = s(rng); (f(a), rng2)' } } },
        { nota: "<code>double2 = map(nonNegativeInt)(i =&gt; i / (Int.MaxValue.toDouble + 1))</code>. Dopo nonNegativeInt non c'è nessuna parentesi: non lo chiami, lo <b>consegni</b> a map, che gli passerà lo stato. Con SimpleRNG(42): 16159453 / 2147483648 = 0.0075…", set: { in: { t: 'SimpleRNG(42)' }, g: { t: 'double2' }, o1: { t: '0.0075…' }, o2: { t: 'rng2' }, c: { t: 'val gen = … non genera niente: è una descrizione' }, c2: { t: 'i numeri nascono quando chiami gen(SimpleRNG(42))' } } }
      ]
    };

    SCENE.sequence5 = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [R('g0', 20, 40, 90, 40, 'G0', { tono: 'dato' }), R('g1', 170, 40, 90, 40, 'G1', { tono: 'dato', nascosto: true }), R('g2', 320, 40, 90, 40, 'G2', { tono: 'dato', nascosto: true }), R('g3', 470, 40, 90, 40, 'G3', { tono: 'dato', nascosto: true }),
        F('a1', 112, 60, 166, 60, '', { nascosto: true }), F('a2', 262, 60, 316, 60, '', { nascosto: true }), F('a3', 412, 60, 466, 60, '', { nascosto: true }),
        C('l', 110, 120, ['', '', ''], { cw: 120, toni: {} }), T('c', 290, 195, '', { size: 12 })],
      passi: [
        { nota: "<code>sequence</code>: da una lista di generatori a un generatore di lista. <code>ints2(3) = sequence(List.fill(3)(int))</code>. Parte da <code>unit(Nil)</code> e aggiunge in testa con map2, che passa lo stato." },
        { nota: "Il primo int gira su G0 (SimpleRNG(42)): 16159453, e produce G1.", set: { g1: { nascosto: false }, a1: { nascosto: false }, l: { valori: ['16159453', '', ''], toni: { 0: 'ok' } } } },
        { nota: "Il secondo gira su <b>G1</b>, non su G0: −1281479697, e produce G2. Usare di nuovo G0 darebbe lo stesso numero.", set: { g2: { nascosto: false }, a2: { nascosto: false }, l: { valori: ['16159453', '-1281479697', ''], toni: { 0: 'ok', 1: 'ok' } } } },
        { nota: "Il terzo su G2: −340305902. Risultato List(16159453, −1281479697, −340305902), uguale a ints(3) (verificato), e lo stato finale G3 per chi continua.", set: { g3: { nascosto: false }, a3: { nascosto: false }, l: { valori: ['16159453', '-1281479697', '-340305902'], toni: { 0: 'ok', 1: 'ok', 2: 'ok' } }, c: { t: '(_ :: _) mette ogni valore davanti alla lista degli altri' } } }
      ]
    };

    SCENE.flatmapdado = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [R('f', 20, 40, 170, 44, 'nonNegativeInt', { tono: 'ora' }), R('i', 220, 40, 150, 44, '', { tono: 'spento' }), R('g', 400, 40, 160, 44, '', { tono: 'spento' }),
        T('c', 290, 120, '', { size: 12 }), T('c2', 290, 150, '', { size: 12 }), T('c3', 290, 190, '', { size: 12, bold: true })],
      passi: [
        { nota: "<code>flatMap(f)(g)</code>: come map, ma <b>g restituisce un altro generatore</b>, scelto in base al valore a, e lo si fa girare subito sullo stato nuovo. Con map2 i due generatori erano fissi; qui il secondo dipende dal primo." },
        { nota: "<code>nonNegativeLessThan(6)</code>, un dado. Primo passo: nonNegativeInt da SimpleRNG(42) dà 16159453.", set: { i: { t: 'i = 16159453', tono: 'ora' } } },
        { nota: "Non lo scarto: lo riduco con il resto. <code>mod = 16159453 % 6 = 1</code>.", set: { g: { t: 'mod = 1', tono: 'due' } } },
        { nota: "Controllo <code>i + (bound − 1) − mod &gt;= 0</code>: vero, quindi <code>unit(1)</code>. Si riprova solo se i cade nell'ultimo pezzo incompleto in cima agli Int (2³¹ mod 6 = 2 valori), dove 0 e 1 uscirebbero un po' più spesso: lì la somma trabocca e diventa negativa.", set: { g: { t: 'unit(1)', tono: 'ok' }, c: { t: '16159453 + 5 − 1 ≥ 0 → unit(1)' }, c2: { t: 'riprova solo nel pezzettino in cima: quasi mai' } } },
        { nota: "Cinque lanci (nonNegativeLessThan(6) + 1) da SimpleRNG(42): <b>2, 3, 2, 4, 5</b> (verificato). La prima idea, \"riprova finché n &lt; 6\", è giusta ma servono in media 358 milioni di tentativi, uno dentro l'altro: la pila finisce.", set: { c3: { t: 'dadi: 2, 3, 2, 4, 5', tono: 'ok' } } }
      ]
    };
  
})();
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
  <figure class="codice" data-titolo="{{a|s013|}}">
<pre data-lang="scala">type Rand[+A] = RNG =&gt; (A, RNG)

lazy val int: Rand[Int] = _.nextInt

def unit[A](a: A): Rand[A] = rng =&gt; (a, rng)

def map[A, B](s: Rand[A])(f: A =&gt; B): Rand[B] =
  rng =&gt;
    val (a, rng2) = s(rng)
    (f(a), rng2)

def nonNegativeEven: Rand[Int] = map(nonNegativeInt) { i =&gt; i - i % 2 }</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="Rand[+A]@ora|RNG =&gt; (A, RNG)@dato"><p>{{s|s014|}}</p></li>
      <li data-righe="3" data-segna="_.nextInt@due"><p>{{s|s015|}}</p></li>
      <li data-righe="5" data-segna="(a, rng)@ok"><p>{{s|s016|}}</p></li>
      <li data-righe="7-10" data-segna="s(rng)@ora|f(a)@ok"><p>{{s|s017|}}</p></li>
      <li data-righe="12" data-segna="i - i % 2@ok"><p>{{s|s018|}}</p></li>
    </ol>
  </figure>
  <figure class="codice" data-titolo="{{a|s019|}}">
<pre data-lang="scala">lazy val double2: Rand[Double] =
  map(nonNegativeInt)(i =&gt; i / (Int.MaxValue.toDouble + 1))</pre>
    <ol class="spiega">
      <li data-righe="1-2" data-segna="map(nonNegativeInt)@ora"><p>{{s|s020|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s021|}}">
    <p>{{s|s022|}}</p>
    <pre class="cod" data-lang="scala" data-segna="nonNegativeInt@dato|i =&gt; i / (Int.MaxValue.toDouble + 1)@due">map( nonNegativeInt )( i =&gt; i / (Int.MaxValue.toDouble + 1) )
   1° argomento di map: quale generatore
   2° argomento di map: cosa fare col numero</pre>
    <p>{{s|s023|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s024|}}">
    <p>{{s|s025|}}</p>
  </div>
  <figure class="scena" data-scena="randtipo" data-titolo="{{a|s026|}}"></figure>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <figure class="scena" data-scena="map2" data-titolo="{{a|s028|}}"></figure>
  <div class="box regola" data-tit="{{a|s029|}}">
    <p>{{s|s030|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s031|}}</h2>
  <figure class="codice" data-titolo="{{a|s032|}}">
<pre data-lang="scala">def sequence[A](ras: List[Rand[A]]): Rand[List[A]] =
  ras.foldRight(unit(List.empty[A]))((ra, acc) =&gt; map2(ra, acc)(_ :: _))

def ints2(size: Int): Rand[List[Int]] =
  sequence(List.fill(size)(int))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="List[Rand[A]]@dato|Rand[List[A]]@ok"><p>{{s|s033|}}</p></li>
      <li data-righe="2" data-segna="unit(List.empty[A])@due|map2(ra, acc)@ora"><p>{{s|s034|}}</p></li>
      <li data-righe="4-5" data-segna="List.fill(size)(int)@ora"><p>{{s|s035|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s036|}}">
    <p>{{s|s037|}}</p>
    <p>{{s|s038|}}</p>
  </div>
  <div class="box idea" data-tit="{{a|s039|}}">
    <p>{{s|s040|}}</p>
  </div>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">map(nonNegativeInt(rng), Int.MaxValue.toDouble)</pre>
      <pre class="msg">Not found: rng</pre>
      <div class="fix">{{s|s041|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case (h, t) =&gt; map2(h, sequence(t))(_ :: _)</pre>
      <pre class="msg">Found:    (h : Any)
Required: adpro.state.RNG.Rand[Any]</pre>
      <div class="fix">{{s|s042|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case h :: t =&gt; map2(h, sequence(t))(_, _)</pre>
      <pre class="msg">Wrong number of parameters, expected: 1</pre>
      <div class="fix">{{s|s043|}}</div>
    </div>
  </div>
  <figure class="scena" data-scena="sequence5" data-titolo="{{a|s044|}}"></figure>
</section>

<section>
  <h2>{{s|s045|}}</h2>
  <figure class="codice" data-titolo="{{a|s046|}}">
<pre data-lang="scala">def flatMap[A, B](f: Rand[A])(g: A =&gt; Rand[B]): Rand[B] =
  rng =&gt;
    val (a, r1) = f(rng)
    g(a)(r1)

def nonNegativeLessThan(bound: Int): Rand[Int] =
  flatMap(nonNegativeInt) { i =&gt;
    val mod = i % bound
    if i + (bound - 1) - mod &gt;= 0 then unit(mod)
    else nonNegativeLessThan(bound)
  }</pre>
    <ol class="spiega">
      <li data-righe="1-4" data-segna="f(rng)@ora|g(a)(r1)@ok"><p>{{s|s047|}}</p></li>
      <li data-righe="6-8" data-segna="i % bound@due"><p>{{s|s048|}}</p></li>
      <li data-righe="9-10" data-segna="&gt;= 0@no|nonNegativeLessThan(bound)@ora"><p>{{s|s049|}}</p></li>
    </ol>
  </figure>
  <p class="piccolo">{{s|s050|}}</p>
  <div class="box domanda-tua" data-tit="{{a|s051|}}">
    <p>{{s|s052|}}</p>
    <p>{{s|s053|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s054|}}">
    <p>{{s|s055|}}</p>
    <p>{{s|s056|}}</p>
    <p>{{s|s057|}}</p>
  </div>
  <div class="errori">
    <div class="errore">
<pre data-lang="scala">def nonNegativeLessThan(bound: Int): Rand[Int] =
  flatMap(nonNegativeInt) { n =&gt;
    if n &gt;= bound then nonNegativeLessThan(bound) else unit(n) }

nonNegativeLessThan(6)(SimpleRNG(42))</pre>
<pre class="msg">Exception in thread "main" java.lang.StackOverflowError
	at adpro.state.RNG$.nonNegativeInt(Exercises.scala:32)
	at adpro.state.RNG$.nonNegativeLessThan$$anonfun$1(Exercises.scala:114)
	at adpro.state.RNG$.flatMap$$anonfun$1(Exercises.scala:109)
	…</pre>
      <div class="fix">{{s|s058|}}</div>
    </div>
  </div>
  <figure class="scena" data-scena="flatmapdado" data-titolo="{{a|s059|}}"></figure>
  <figure class="passi" data-titolo="{{a|s060|}}" data-legenda="{{a|s061|}}">
    <div class="passo"><div class="espr">n      0 1 2 | 3 4 5 | 6 7
n % 3  0 1 2 | 0 1 2 | <mark class="no">0 1</mark></div><p class="nota">{{s|s062|}}</p></div>
    <div class="passo"><div class="espr">{{s|s063|}}</div><p class="nota">{{s|s064|}}</p></div>
    <div class="passo"><div class="espr">n = 4:  4 − 1 + 2 = 5 ≤ 7  → <mark class="ok">unit(1)</mark>
n = 6:  6 − 0 + 2 = 8 &gt; 7  → <mark class="no">riprova</mark>
n = 7:  7 − 1 + 2 = 8 &gt; 7  → <mark class="no">riprova</mark></div><p class="nota">{{s|s065|}}</p></div>
    <div class="passo"><div class="espr">2147483648 = 6 × 357913941 + <mark class="ora">2</mark>   → ultimo blocco: 2147483646, 2147483647</div><p class="nota">{{s|s066|}}</p></div>
    <div class="passo"><div class="espr">n = 2147483645: 2147483645 + 5 − 5 =  2147483645 → <mark class="ok">unit(5)</mark>
n = 2147483646: 2147483646 + 5 − 0 = <mark class="no">−2147483645</mark> → riprova
n = 2147483647: 2147483647 + 5 − 1 = <mark class="no">−2147483645</mark> → riprova</div><p class="nota">{{s|s067|}}</p></div>
    <div class="passo"><div class="espr">Fake(List(2147483647, 16)):  <mark class="no">2147483647</mark> → riprova su rng2 → <mark class="dato">16</mark>, mod 4, 16 + 5 − 4 = 17 ≥ 0 → <mark class="ok">(4, Fake(List()))</mark></div><p class="nota">{{s|s068|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s069|}}">
    <p>{{s|s070|}}</p>
    <pre class="cod" data-lang="scala" data-segna="double@dato|(d * bound).toInt@ok">def nonNegativeLessThan(bound: Int): Rand[Int] =
  flatMap(double) { d =&gt; unit((d * bound).toInt) }</pre>
    <p>{{s|s071|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s072|}}" data-legenda="{{a|s073|}}">
    <div class="passo"><div class="espr">0 ─── 1/6 ─── 2/6 ─── 3/6 ─── 4/6 ─── 5/6 ─── 1
  fetta 0  fetta 1  fetta 2  fetta 3  fetta 4  fetta 5</div><p class="nota">{{s|s074|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">0.2</mark> × 6 = <mark class="ora">1.2</mark> → toInt → <mark class="ok">1</mark></div><p class="nota">{{s|s075|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">0.5</mark> × 6 = <mark class="ora">3.0</mark> → <mark class="ok">3</mark>     <mark class="dato">0.7</mark> × 6 = <mark class="ora">4.19…</mark> → <mark class="ok">4</mark>     <mark class="dato">0.99</mark> × 6 = <mark class="ora">5.94</mark> → <mark class="ok">5</mark></div><p class="nota">{{s|s076|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s077|}}">
    <p>{{s|s078|}}</p>
    <p>{{s|s079|}}</p>
  </div>
</section>

</main>
</body>
</html>
