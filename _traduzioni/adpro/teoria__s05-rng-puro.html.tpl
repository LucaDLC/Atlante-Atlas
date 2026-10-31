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
SCENE.catena = {
  w: 560, h: 250, lato: false,
  legenda: '{{j|s002|'}}',
  codice: { lang: 'scala', testo: `val r0 = SimpleRNG(42)
val (n1, r1) = r0.nextInt   // 16159453
val (n2, r2) = r1.nextInt   // -1281479697
r0.nextInt                  // di nuovo (16159453, r1)` },
  oggetti: [
    { id: 'r0', tipo: 'nodo', forma: 'quadrato', r: 40, x: 80, y: 110, t: 'r0', sotto: 'seed 42', tono: 'dato' },
    { id: 'r1', tipo: 'nodo', forma: 'quadrato', r: 40, x: 280, y: 110, t: 'r1', sotto: 'seed 1059025964525', nascosto: true },
    { id: 'r2', tipo: 'nodo', forma: 'quadrato', r: 40, x: 480, y: 110, t: 'r2', sotto: 'seed 197491923327988', nascosto: true },
    { id: 'a1', tipo: 'arco', da: 'r0', a: 'r1', dir: true, t: 'nextInt', nascosto: true },
    { id: 'a2', tipo: 'arco', da: 'r1', a: 'r2', dir: true, t: 'nextInt', nascosto: true },
    { id: 'o1', tipo: 'testo', x: 180, y: 36, t: '', size: 14, bold: true },
    { id: 'o2', tipo: 'testo', x: 380, y: 36, t: '', size: 14, bold: true },
    { id: 'n', tipo: 'testo', x: 280, y: 222, t: '', size: 13, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}', righe: [1] },
    { nota: '{{j|s004|'}}', righe: [2], set: { r0: { tono: 'ora' }, a1: { nascosto: false, tono: 'ora' }, r1: { nascosto: false, tono: 'dato' }, o1: { t: '16159453', tono: 'ok' } } },
    { nota: '{{j|s005|'}}', righe: [3], set: { r0: { tono: 'dato' }, a1: { tono: null }, r1: { tono: 'ora' }, a2: { nascosto: false, tono: 'ora' }, r2: { nascosto: false, tono: 'dato' }, o2: { t: '−1281479697', tono: 'ok' } } },
    { nota: '{{j|s006|'}}', righe: [4], set: { r1: { tono: 'dato' }, a2: { tono: null }, r0: { tono: 'no' }, a1: { tono: 'no' }, o1: { t: '16159453 (di nuovo)', tono: 'no' }, n: { t: 'r0.nextInt == r0.nextInt', tono: 'no' } } }
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

    SCENE.statonascosto = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s007|'}}',
      oggetti: [R('v', 20, 40, 200, 40, 'var rng (nascosto)', { tono: 'no' }), T('e1', 400, 50, '', { size: 12 }), T('e2', 400, 80, '', { size: 12 }),
        R('s0', 20, 130, 90, 40, 'G0', { tono: 'dato', nascosto: true }), R('fn', 150, 125, 140, 50, 'nextInt', { tono: 'ora', nascosto: true }), R('o', 330, 130, 150, 40, '(n, G1)', { tono: 'ok', nascosto: true }),
        F('a', 112, 150, 146, 150, '', { nascosto: true }), F('b', 292, 150, 326, 150, '', { nascosto: true }), T('c', 290, 205, '', { size: 12 })],
      passi: [
        { nota: "<code>def rollDie: Int = rng.nextInt(6)</code> con <code>var rng</code> esterno." },
        { nota: "Stessa espressione, risultati diversi: rollDie = 5, poi rollDie = 0. Dipende da uno stato esterno che cambia a ogni chiamata, e che chiunque può cambiare.", set: { e1: { t: 'rollDie → 5', tono: 'no' }, e2: { t: 'rollDie → 0', tono: 'no' } } },
        { nota: "Quindi <code>rollDie + rollDie ≠ 2 * rollDie</code>: niente trasparenza referenziale. Test e ragionamento diventano difficili.", set: { c: { t: 'rollDie + rollDie ≠ 2 * rollDie', tono: 'no' } } },
        { nota: "Soluzione: rendere lo stato <b>esplicito</b>. <code>nextInt: RNG =&gt; (Int, RNG)</code> non cambia niente: restituisce anche lo stato successivo, e chi la usa lo passa alla chiamata dopo. Stesso G0, stesso risultato, sempre.", set: { v: { tono: 'spento' }, s0: { nascosto: false }, fn: { nascosto: false }, o: { nascosto: false }, a: { nascosto: false }, b: { nascosto: false }, c: { t: 'stato → (valore, nuovo stato)', tono: 'ok' } } }
      ]
    };

    SCENE.testimone = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [R('r0', 20, 40, 80, 40, 'rng', { tono: 'dato' }), R('g1', 130, 40, 140, 40, 'nonNegativeInt', { tono: 'ora' }), R('r1', 300, 40, 70, 40, 'r1', { tono: 'dato', nascosto: true }), R('g2', 400, 40, 90, 40, 'double', { tono: 'ora', nascosto: true }), R('r2', 510, 40, 60, 40, 'r2', { tono: 'dato', nascosto: true }),
        T('v', 290, 120, '', { bold: true }), T('c', 290, 160, '', { size: 12 }), T('c2', 290, 195, '', { size: 12 })],
      passi: [
        { nota: "Esercizio 3, <code>intDouble</code>: un intero e un double, indipendenti. Lo stato passa come un <b>testimone</b> in una staffetta." },
        { nota: "nonNegativeInt riceve rng e restituisce (i, r1).", set: { r1: { nascosto: false } } },
        { nota: "double riceve <b>r1</b> (non rng!) e restituisce (d, r2). Risultato ((i, d), r2): r2 per chi viene dopo.", set: { g2: { nascosto: false }, r2: { nascosto: false }, v: { t: '((i, d), r2)', tono: 'ok' } } },
        { nota: "Usare due volte rng darebbe numeri <b>non indipendenti</b>. In <code>ints(3)</code> la ricorsione fa lo stesso: G0 → G1 → G2 → G3, e lo stato che risale è l'ultimo, G3. Restituire r1 farebbe riuscire di nuovo il secondo numero.", set: { c: { t: 'ints(3)(SimpleRNG(42)) = List(16159453, −1281479697, −340305902)' }, c2: { t: 'lo stato restituito è sempre quello dopo l’ultimo numero' } } }
      ]
    };

    const E = [['else i', 'Not found: i', 'else num'], ['val (numDouble, …) due volte', 'numDouble is already defined', 'numInt per il secondo'], ['((numDouble, numDouble), rand2)', 'Found: Double  Required: Int', '((numDouble, numInt), rand2)'], ['flatMap con foldRight(empty)…', 'Not found: foldRight', 'rng => val (a, r1) = f(rng); g(a)(r1)']];
    SCENE.erroriutente = {
      w: 600, h: 210, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [T('n', 300, 24, '', { bold: true }), R('s', 20, 40, 270, 40, '', { tono: 'no' }), R('g', 310, 40, 270, 40, '', { tono: 'ok' }), T('m', 300, 120, '', { size: 12, bold: true }), T('c', 300, 175, '', { size: 12 })],
      passi: [{ nota: "I 4 errori con cui Scala 3.8.4 fermava il tuo Exercises.scala della settimana 5 (letto e compilato su una copia, il repo non è stato toccato)." }].concat(E.map(([s, m, g], i) => ({
        nota: ['In nonNegativeInt la variabile si chiama num, non i.', 'Nello stesso blocco un nome si dichiara <b>una volta</b>. Il secondo valore è un intero: chiamalo numInt.', 'Conseguenza del primo: la coppia conteneva due Double, ma il tipo di ritorno vuole (Double, Int).', 'Era il flatMap della LazyList: su Rand non c\'è niente da \"foldare\", c\'è una funzione da far girare e poi il secondo generatore.'][i],
        set: { n: { t: 'errore ' + (i + 1) + ' di 4' }, s: { t: s }, g: { t: g }, m: { t: m, tono: 'no' } }
      })))
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
  <pre class="cod" data-lang="scala" data-segna="var rng@no|rng.nextInt(6)@no">var rng = new scala.util.Random
def rollDie: Int = rng.nextInt(6)</pre>
  <figure class="passi" data-titolo="{{a|s013|}}">
    <div class="passo"><div class="espr">rollDie = <mark class="ok">5</mark>,  poi rollDie = <mark class="ok">0</mark></div><p class="nota">{{s|s014|}}</p></div>
    <div class="passo"><div class="espr">rollDie + rollDie  ≠  2 * rollDie</div><p class="nota">{{s|s015|}}</p></div>
    <div class="passo"><div class="espr">rendere lo stato <mark class="ora">esplicito</mark>:  stato → (valore, <mark class="dato">nuovo stato</mark>)</div><p class="nota">{{s|s016|}}</p></div>
  </figure>
  <figure class="scena" data-scena="statonascosto" data-titolo="{{a|s017|}}"></figure>
</section>

<section>
  <h2>{{s|s018|}}</h2>
  <figure class="codice" data-titolo="{{a|s019|}}">
<pre data-lang="scala">trait RNG:
  def nextInt: (Int, RNG)

case class SimpleRNG(seed: Long) extends RNG:
  def nextInt: (Int, RNG) =
    val newSeed = (seed * 0x5DEECE66DL + 0xBL) &amp; 0xFFFFFFFFFFFFL
    val nextRNG = SimpleRNG(newSeed)
    val n = (newSeed &gt;&gt;&gt; 16).toInt
    (n, nextRNG)</pre>
    <ol class="spiega">
      <li data-righe="1-2" data-segna="(Int, RNG)@ok"><p>{{s|s020|}}</p></li>
      <li data-righe="4" data-segna="seed: Long@dato"><p>{{s|s021|}}</p></li>
      <li data-righe="6" data-segna="0x5DEECE66DL@due|&amp;@due"><p>{{s|s022|}}</p></li>
      <li data-righe="7-9" data-segna="&gt;&gt;&gt; 16@ora|(n, nextRNG)@ok"><p>{{s|s023|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="catena" data-titolo="{{a|s024|}}"></figure>
  <p class="piccolo">{{s|s025|}}</p>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <figure class="codice" data-titolo="{{a|s027|}}">
<pre data-lang="scala">def nonNegativeInt(rng: RNG): (Int, RNG) =
  val (i, r) = rng.nextInt
  (if i &lt; 0 then -(i + 1) else i, r)

def double(rng: RNG): (Double, RNG) =
  val (i, r) = nonNegativeInt(rng)
  (i / (Int.MaxValue.toDouble + 1), r)

def intDouble(rng: RNG): ((Int, Double), RNG) =
  val (i, r1) = nonNegativeInt(rng)
  val (d, r2) = double(r1)
  ((i, d), r2)

def doubleInt(rng: RNG): ((Double, Int), RNG) =
  val ((i, d), r) = intDouble(rng)
  ((d, i), r)

def ints(size: Int)(rng: RNG): (List[Int], RNG) =
  if size &lt;= 0 then (Nil, rng)
  else
    val (i, r1) = rng.nextInt
    val (is, r2) = ints(size - 1)(r1)
    (i :: is, r2)</pre>
    <ol class="spiega">
      <li data-righe="1-3" data-segna="-(i + 1)@ora"><p>{{s|s028|}}</p></li>
      <li data-righe="5-7" data-segna="Int.MaxValue.toDouble + 1@due"><p>{{s|s029|}}</p></li>
      <li data-righe="9-12" data-segna="r1@dato|r2@dato"><p>{{s|s030|}}</p></li>
      <li data-righe="14-16" data-segna="intDouble(rng)@ok"><p>{{s|s031|}}</p></li>
      <li data-righe="18-23" data-segna="ints(size - 1)(r1)@ora|(i :: is, r2)@ok"><p>{{s|s032|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s033|}}">
    <p>{{s|s034|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s035|}}" data-legenda="{{a|s036|}}">
    <div class="passo"><div class="espr"><mark class="dato">Int.MaxValue</mark> = 2147483647</div><p class="nota">{{s|s037|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">Int.MaxValue.toDouble</mark> = 2.147483647E9</div><p class="nota">{{s|s038|}}</p></div>
    <div class="passo"><div class="espr">Int.MaxValue.toDouble <mark class="ok">+ 1</mark> = 2.147483648E9</div><p class="nota">{{s|s039|}}</p></div>
    <div class="passo"><div class="espr"><mark class="no">Int.MaxValue + 1</mark> = −2147483648</div><p class="nota">{{s|s040|}}</p></div>
    <div class="passo"><div class="espr">(<mark class="no">Int.MaxValue + 1</mark>).toDouble = −2.147483648E9</div><p class="nota">{{s|s041|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s042|}}">
    <p>{{s|s043|}}</p>
    <pre class="cod" data-lang="pseudo" data-segna="G3*@ok">ints(3)(G0):   r1 = G1  →  chiama ints(2)(G1)
  ints(2)(G1):   r1 = G2  →  chiama ints(1)(G2)
    ints(1)(G2):   r1 = G3  →  chiama ints(0)(G3)
      ints(0)(G3):            →  (Nil, G3)
    ints(1):  r2 = G3       →  (i1 :: Nil, G3)
  ints(2):    r2 = G3       →  (i2 :: …,  G3)
ints(3):      r2 = G3       →  (i3 :: …,  G3)</pre>
    <p>{{s|s044|}}</p>
  </div>
  <div class="box idea" data-tit="{{a|s045|}}">
    <p>{{s|s046|}}</p>
  </div>
  <figure class="scena" data-scena="testimone" data-titolo="{{a|s047|}}"></figure>
</section>

<section>
  <h2>{{s|s048|}}</h2>
  <p>{{s|s049|}}</p>
  <div class="errori">
    <div class="errore">
<pre data-lang="scala">val (num,rand) = rng.nextInt
(if num&lt;0 then -(num+1) else i, rand)</pre>
<pre class="msg">-- [E006] Not Found Error: Exercises.scala:33:33
    (if num&lt;0 then -(num+1) else i, rand)
                                 ^
                                 Not found: i</pre>
      <div class="fix"><p>{{s|s050|}}</p></div>
    </div>
    <div class="errore">
<pre data-lang="scala">val (numDouble, rand1) = double(rng)
val (numDouble, rand2) = nonNegativeInt(rand1)
((numDouble, numDouble), rand2)</pre>
<pre class="msg">-- [E161] Naming Error: Exercises.scala:52:9
numDouble is already defined as value numDouble
-- [E007] Type Mismatch Error: Exercises.scala:53:17
                 Found:    (numDouble : Double)
                 Required: Int</pre>
      <div class="fix"><p>{{s|s051|}}</p></div>
    </div>
    <div class="errore">
<pre data-lang="scala">def flatMap[A,B](f: Rand[A])(g: A =&gt; Rand[B]): Rand[B] =
  foldRight(empty)((a,acc) =&gt; f(a).append(acc))</pre>
<pre class="msg">-- [E006] Not Found Error: Exercises.scala:109:4
    foldRight(empty)((a,acc) =&gt; f(a).append(acc))
    ^^^^^^^^^
    Not found: foldRight</pre>
      <div class="fix"><p>{{s|s052|}}</p></div>
    </div>
  </div>
  <figure class="scena" data-scena="erroriutente" data-titolo="{{a|s053|}}"></figure>
</section>

</main>
</body>
</html>
