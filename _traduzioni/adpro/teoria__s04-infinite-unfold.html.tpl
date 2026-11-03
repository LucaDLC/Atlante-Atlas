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
SCENE.unfold = {
  w: 580, h: 240, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 's0', tipo: 'nodo', r: 22, x: 60, y: 60, t: '0', tono: 'dato' },
    { id: 's1', tipo: 'nodo', r: 22, x: 200, y: 60, t: '1', nascosto: true },
    { id: 's2', tipo: 'nodo', r: 22, x: 340, y: 60, t: '2', nascosto: true },
    { id: 's3', tipo: 'nodo', r: 22, x: 480, y: 60, t: '3', nascosto: true },
    { id: 'e1', tipo: 'arco', da: 's0', a: 's1', dir: true, t: 'emette 0', nascosto: true },
    { id: 'e2', tipo: 'arco', da: 's1', a: 's2', dir: true, t: 'emette 10', nascosto: true },
    { id: 'e3', tipo: 'arco', da: 's2', a: 's3', dir: true, t: 'emette 20', nascosto: true },
    { id: 'L', tipo: 'celle', x: 200, y: 140, cw: 60, ch: 40, valori: ['', '', ''], indici: false },
    { id: 'n', tipo: 'testo', x: 290, y: 222, t: 'f = n => if n < 3 then Some((n * 10, n + 1)) else None', size: 13 }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { s0: { tono: 'ora' }, e1: { nascosto: false }, s1: { nascosto: false, tono: 'dato' }, L: { valori: ['0', '', ''], toni: { 0: 'ok' } } } },
    { nota: '{{j|s005|'}}', set: { s0: { tono: 'dato' }, s1: { tono: 'ora' }, e2: { nascosto: false }, s2: { nascosto: false, tono: 'dato' }, L: { valori: ['0', '10', ''], toni: { 1: 'ok' } } } },
    { nota: '{{j|s006|'}}', set: { s1: { tono: 'dato' }, s2: { tono: 'ora' }, e3: { nascosto: false }, s3: { nascosto: false, tono: 'dato' }, L: { valori: ['0', '10', '20'], toni: { 2: 'ok' } } } },
    { nota: '{{j|s007|'}}', set: { s2: { tono: 'dato' }, s3: { tono: 'no' }, L: { toni: { 0: 'ok', 1: 'ok', 2: 'ok' } } } }
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
  const vuote = n => Array(n).fill('');
  const toni = (n, tono) => Object.fromEntries(Array.from({ length: n }, (_, i) => [i, tono]));

    SCENE.ones = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [
        N('o', 100, 80, '1', 'ok'), T('loop', 100, 45, '↺ la coda è ones stessa', { size: 11 }),
        T('ot', 100, 140, 'ones = cons(1, ones)', { size: 12 }),
        R('f0', 250, 60, 60, 40, '1', { tono: 'ok', nascosto: true }), R('f1', 330, 60, 60, 40, '2', { tono: 'ok', nascosto: true }), R('f2', 410, 60, 60, 40, '3', { tono: 'ok', nascosto: true }), R('fr', 490, 60, 70, 40, 'from(4)', { tono: 'due', nascosto: true }), R('fr1', 330, 60, 70, 40, 'from(2)', { tono: 'due', nascosto: true }),
        T('c', 390, 150, '', { size: 12 }), T('c2', 290, 195, '', { size: 12 })
      ],
      passi: [
        { nota: "<code>val ones = cons(1, ones)</code>: una lista di 1 infinita, che punta a <b>se stessa</b>. Funziona perché il secondo argomento di cons è by-name: ones non viene letto adesso." },
        { nota: "<code>from(n) = cons(n, from(n + 1))</code>: la chiamata ricorsiva sta dentro cons, quindi <b>non parte</b>. from(1) costruisce una cella e si ferma.", set: { f0: { nascosto: false }, fr1: { nascosto: false } } },
        { nota: "Forzando la coda nasce la cella successiva, e così via. <code>take(3)</code> ne forza tre: la coda dopo resta una ricetta.", set: { fr1: { nascosto: true }, f1: { nascosto: false }, f2: { nascosto: false }, fr: { nascosto: false }, c: { t: 'naturals.take(3).toList = List(1, 2, 3)' } } },
        { nota: "<code>naturals = from(1)</code> (il test Ex01.06 vuole la testa 1). Ma <code>naturals.toList</code> non termina mai: vuole tutto. to(n) è uguale, scendendo.", set: { c2: { t: 'naturals.toList: non termina', tono: 'no' } } }
      ]
    };

    SCENE.fibsgo = {
      w: 560, h: 150,
      codice: { lang: 'scala', testo: `lazy val fibs: LazyList[Int] =
  def go(a: Int, b: Int): LazyList[Int] = cons(a, go(b, a + b))
  go(0, 1)` },
      legenda: '{{j|s009|'}}',
      oggetti: [C('l', 20, 30, vuote(6), { toni: {} }), T('g', 280, 110, 'go(0, 1)', { bold: true })],
      passi: [
        { nota: "Come Fibonacci della settimana 1, ma invece di restituire un numero produco la lista di tutti. <code>go(a, b)</code>: emetto a, la finestra scorre.", righe: [3] },
        { nota: "go(0, 1) = cons(0, go(1, 1)).", righe: [2], set: { l: { valori: ['0', '', '', '', '', ''], toni: { 0: 'ok' } }, g: { t: 'cons(0, go(1, 1))' } } },
        { nota: "go(1, 1) = cons(1, go(1, 2)): b diventa a, a + b diventa b.", righe: [2], set: { l: { valori: ['0', '1', '', '', '', ''], toni: { 0: 'ok', 1: 'ok' } }, g: { t: 'cons(1, go(1, 2))' } } },
        { nota: "…go(1, 2) → 1, go(2, 3) → 2, go(3, 5) → 3, go(5, 8) → 5. <code>fibs.take(6).toList</code> = List(0, 1, 1, 2, 3, 5) (verificato). Il tipo, che il file lascia a Any, è LazyList[Int].", righe: [2], set: { l: { valori: ['0', '1', '1', '2', '3', '5'], toni: toni(6, 'ok') }, g: { t: 'List(0, 1, 1, 2, 3, 5)', tono: 'ok' } } }
      ]
    };

    const RA = ['lista creata', 'calcolo f(1)', 'calcolo f(2)', 'List(2, 4)'], RB = ['calcolo f(1)', 'lista creata', 'calcolo f(2)', 'calcolo f(3)', 'List(2, 4)'];
    const og = [T('ha', 150, 24, 'map (foldRight)', { bold: true }), T('hb', 430, 24, 'mapUnfold', { bold: true })];
    RA.forEach((t, i) => og.push(T('a' + i, 150, 60 + i * 30, t, { size: 12, nascosto: true })));
    RB.forEach((t, i) => og.push(T('b' + i, 430, 60 + i * 30, t, { size: 12, nascosto: true })));
    og.push(T('c', 290, 225, '', { size: 12 }));
    SCENE.perchunfold = {
      w: 580, h: 240, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: og,
      passi: [
        { nota: "unfold scrive la ricorsione al posto tuo: tu descrivi un passo solo (Some((valore, nuovoStato)) invece di cons, None invece di empty). Ma c'è una differenza di pigrizia. Esperimento: stampo dentro f e chiedo 2 elementi su 3." },
        { nota: "<b>map con foldRight</b>: la lista viene creata <b>prima</b> di calcolare f(1): foldRight + cons tiene sospesa anche la testa. Poi f(1), f(2). Due calcoli.", set: Object.fromEntries(RA.map((_, i) => ['a' + i, { nascosto: false, tono: 'ora' }])) },
        { nota: "<b>mapUnfold</b>: f(1) viene calcolata <b>prima</b> di creare la lista, e alla fine anche f(3), che non serviva. unfold deve chiamare f per sapere se la risposta è None (fine) o Some. Output reale.", set: Object.assign(Object.fromEntries(RB.map((_, i) => ['b' + i, { nascosto: false, tono: 'ora' }])), { b3: { nascosto: false, tono: 'no' } }) },
        { nota: "Stesso risultato, List(2, 4); unfold è un po' meno pigro. foldRight <b>consuma</b> una lista e dà un valore; unfold parte da un valore (lo stato) e <b>costruisce</b> una lista.", set: { c: { t: 'foldRight: lista → valore · unfold: stato → lista' } } }
      ]
    };

    SCENE.takeunfold = {
      w: 560, h: 170,
      codice: { lang: 'scala', testo: `def takeUnfold(n: Int): LazyList[A] =
  unfold((this, n)) {
    case (Cons(h, t), k) if k > 0 => Some((h(), (t(), k - 1)))
    case _ => None
  }` },
      legenda: '{{j|s011|'}}',
      oggetti: [R('st', 40, 30, 230, 40, 'stato: (5, 6, 7…), k = 2', { tono: 'dato' }), C('o', 300, 30, ['', ''], { toni: {} }), T('c', 280, 120, 'LazyList(5, 6, 7).takeUnfold(2)', { size: 12, bold: true })],
      passi: [
        { nota: "Lo stato di takeUnfold è una <b>coppia</b>: la lista ancora da leggere e quanti elementi mancano. Le parentesi doppie <code>unfold((this, n))</code> mostrano che è un argomento solo.", righe: [2] },
        { nota: "C'è una cella e k = 2 &gt; 0: emetto 5, nuovo stato (6, 7…; 1). k nasce nel pattern, quando il case smonta la coppia.", righe: [3], set: { o: { valori: ['5', ''], toni: { 0: 'ok' } }, st: { t: 'stato: (6, 7…), k = 1' } } },
        { nota: "k = 1: emetto 6, nuovo stato (7…; 0).", righe: [3], set: { o: { valori: ['5', '6'], toni: { 0: 'ok', 1: 'ok' } }, st: { t: 'stato: (7…), k = 0' } } },
        { nota: "k = 0: la guardia è falsa, si cade in <code>case _ =&gt; None</code>, che raccoglie i due modi di finire (lista vuota o contatore a 0): fine. List(5, 6). Stessa idea per fibsUnfold (stato (a, b)), mapUnfold (stato: la lista), zipWith (stato: le due liste).", righe: [4], set: { st: { tono: 'no' }, c: { t: 'List(5, 6)', tono: 'ok' } } }
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
  <figure class="codice" data-titolo="{{a|s015|}}">
<pre data-lang="scala">val ones: LazyList[Int] = cons(1, ones)

def from(n: Int): LazyList[Int] = cons(n, from(n + 1))
def to(n: Int): LazyList[Int] = cons(n, to(n - 1))

lazy val naturals: LazyList[Int] = from(1)</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="cons(1, ones)@ora"><p>{{s|s016|}}</p></li>
      <li data-righe="3" data-segna="from(n + 1)@due"><p>{{s|s017|}}</p></li>
      <li data-righe="4" data-segna="to(n - 1)@due"><p>{{s|s018|}}</p></li>
      <li data-righe="6" data-segna="from(1)@ok"><p>{{s|s019|}}</p></li>
    </ol>
  </figure>
  <div class="box attenzione" data-tit="{{a|s020|}}">
    <p>{{s|s021|}}</p>
  </div>
  <figure class="scena" data-scena="ones" data-titolo="{{a|s022|}}"></figure>
</section>

<section>
  <h2>{{s|s023|}}</h2>
  <p>{{s|s024|}}</p>
  <pre class="cod" data-lang="scala">lazy val fibs: LazyList[Int] =
  def go(a: Int, b: Int): LazyList[Int] = cons(a, go(b, a + b))
  go(0, 1)</pre>
  <figure class="passi" data-titolo="{{a|s025|}}">
    <div class="passo"><div class="espr">go(<mark class="dato">0</mark>, <mark class="due">1</mark>) = cons(<mark class="ok">0</mark>, go(1, 1))</div><p class="nota">{{s|s026|}}</p></div>
    <div class="passo"><div class="espr">go(<mark class="dato">1</mark>, <mark class="due">1</mark>) = cons(<mark class="ok">1</mark>, go(1, 2))</div><p class="nota">{{s|s027|}}</p></div>
    <div class="passo"><div class="espr">go(<mark class="dato">1</mark>, <mark class="due">2</mark>) = cons(<mark class="ok">1</mark>, go(2, 3))</div><p class="nota">…</p></div>
    <div class="passo"><div class="espr">go(2, 3) → <mark class="ok">2</mark>     go(3, 5) → <mark class="ok">3</mark>     go(5, 8) → <mark class="ok">5</mark></div><p class="nota">…</p></div>
    <div class="passo"><div class="espr"><mark class="ok">List(0, 1, 1, 2, 3, 5)</mark></div><p class="nota">{{s|s028|}}</p></div>
  </figure>
  <figure class="scena" data-scena="fibsgo" data-titolo="{{a|s029|}}"></figure>
</section>

<section>
  <h2>{{s|s030|}}</h2>
  <pre class="cod" data-lang="scala">def unfold[A, S](z: S)(f: S => Option[(A, S)]): LazyList[A]</pre>
  <figure class="passi" data-titolo="{{a|s031|}}">
    <div class="passo"><div class="espr">unfold[A, <mark class="dato">S</mark>](<mark class="dato">z: S</mark>)</div><p class="nota">{{s|s032|}}</p></div>
    <div class="passo"><div class="espr">(f: <mark class="dato">S</mark> => Option[(<mark class="ok">A</mark>, <mark class="dato">S</mark>)])</div><p class="nota">{{s|s033|}}</p></div>
    <div class="passo"><div class="espr">{{s|s034|}}</div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">: <mark class="ok">LazyList[A]</mark></div><p class="nota">{{s|s036|}}</p></div>
  </figure>
  <figure class="codice" data-titolo="{{a|s037|}}">
<pre data-lang="scala">def unfold[A, S](z: S)(f: S => Option[(A, S)]): LazyList[A] =
  f(z).map((a, s) => cons(a, unfold(s)(f))).getOrElse(empty)</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="f(z)@dato"><p>{{s|s038|}}</p></li>
      <li data-righe="2" data-segna="(a, s) =>@ora"><p>{{s|s039|}}</p></li>
      <li data-righe="2" data-segna="cons(a, unfold(s)(f))@ok"><p>{{s|s040|}}</p></li>
      <li data-righe="2" data-segna="getOrElse(empty)@no"><p>{{s|s041|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s042|}}">
    <div class="passo"><div class="espr">stato <mark class="dato">0</mark>  →  f(0) = Some((<mark class="ok">0</mark>, <mark class="dato">1</mark>))</div><p class="nota">{{s|s043|}}</p></div>
    <div class="passo"><div class="espr">stato <mark class="dato">1</mark>  →  f(1) = Some((<mark class="ok">10</mark>, <mark class="dato">2</mark>))</div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">stato <mark class="dato">2</mark>  →  f(2) = Some((<mark class="ok">20</mark>, <mark class="dato">3</mark>))</div><p class="nota">{{s|s045|}}</p></div>
    <div class="passo"><div class="espr">stato <mark class="dato">3</mark>  →  f(3) = <mark class="no">None</mark></div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">List(0, 10, 20)</mark></div><p class="nota">{{s|s047|}}</p></div>
  </figure>
  <figure class="scena" data-scena="unfold" data-titolo="{{a|s048|}}"></figure>
</section>

<section>
  <h2>{{s|s049|}}</h2>
  <p>{{s|s050|}}</p>
  <div class="colonne">
    <div class="carta media"><h4>{{s|s051|}}</h4>
<pre class="cod" data-lang="scala" data-segna="cons(f(h()), t().map(f))@ora|empty@no">def map[B](f: A => B): LazyList[B] =
  this match
    case Cons(h, t) =>
      cons(f(h()), t().map(f))
    case Empty => empty</pre></div>
    <div class="carta buona"><h4>{{s|s052|}}</h4>
<pre class="cod" data-lang="scala" data-segna="Some((f(h()), t()))@ok|None@no">def mapUnfold[B](f: A => B): LazyList[B] =
  unfold(this) {
    case Cons(h, t) =>
      Some((f(h()), t()))
    case Empty => None
  }</pre></div>
  </div>
  <p>{{s|s053|}}</p>
  <div class="box idea" data-tit="{{a|s054|}}">
    <p>{{s|s055|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s056|}}">
    <p>{{s|s057|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s058|}}" data-legenda="{{a|s059|}}">
    <div class="passo"><div class="espr testo">{{s|s060|}}</div><p class="nota">{{s|s061|}}</p></div>
    <div class="passo"><div class="espr">map (foldRight)         mapUnfold
  lista creata            <mark class="ora">calcolo f(1)</mark>
  calcolo f(1)            lista creata
  calcolo f(2)            calcolo f(2)
List(2, 4)                <mark class="ora">calcolo f(3)</mark>
                        List(2, 4)</div><p class="nota">{{s|s062|}}</p></div>
  </figure>
  <figure class="scena" data-scena="perchunfold" data-titolo="{{a|s063|}}"></figure>
</section>

<section>
  <h2>{{s|s064|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s065|}}</th><th>{{s|s066|}}</th><th>{{s|s067|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td></tr>
      <tr><td>{{s|s071|}}</td><td>{{s|s072|}}</td><td>{{s|s073|}}</td></tr>
      <tr><td>{{s|s074|}}</td><td>{{s|s075|}}</td><td>{{s|s076|}}</td></tr>
      <tr><td>{{s|s077|}}</td><td>{{s|s078|}}</td><td>{{s|s079|}}</td></tr>
      <tr><td>{{s|s080|}}</td><td>{{s|s081|}}</td><td>{{s|s082|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="codice" data-titolo="{{a|s083|}}">
<pre data-lang="scala">lazy val fibsUnfold: LazyList[Int] =
  unfold((0, 1))((a, b) => Some((a, (b, a + b))))

def mapUnfold[B](f: A => B): LazyList[B] =
  unfold(this) {
    case Cons(h, t) => Some((f(h()), t()))
    case Empty => None
  }

def takeUnfold(n: Int): LazyList[A] =
  unfold((this, n)) {
    case (Cons(h, t), k) if k &gt; 0 => Some((h(), (t(), k - 1)))
    case _ => None
  }

def takeWhileUnfold(p: A => Boolean): LazyList[A] =
  unfold(this) {
    case Cons(h, t) if p(h()) => Some((h(), t()))
    case _ => None
  }

def zipWith[B &gt;: A, C](ope: (=> B, => B) => C)(bs: LazyList[B]): LazyList[C] =
  unfold((this, bs)) {
    case (Cons(h1, t1), Cons(h2, t2)) => Some((ope(h1(), h2()), (t1(), t2())))
    case _ => None
  }</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="(0, 1)@dato|Some((a, (b, a + b)))@ok"><p>{{s|s084|}}</p></li>
      <li data-righe="5-8" data-segna="unfold(this)@dato|Some((f(h()), t()))@ok"><p>{{s|s085|}}</p></li>
      <li data-righe="11-14" data-segna="(this, n)@dato|if k &gt; 0@ora"><p>{{s|s086|}}</p></li>
      <li data-righe="12" data-segna="k@dato"><p>{{s|s087|}}</p></li>
      <li data-righe="13" data-segna="case _ => None@no"><p>{{s|s088|}}</p></li>
      <li data-righe="16-20" data-segna="if p(h())@ora"><p>{{s|s089|}}</p></li>
      <li data-righe="22" data-segna="ope: (=> B, => B) => C@ora"><p>{{s|s090|}}</p></li>
      <li data-righe="23-26" data-segna="(this, bs)@dato|ope(h1(), h2())@ok|(t1(), t2())@due"><p>{{s|s091|}}</p></li>
    </ol>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s092|}}</th><th>{{s|s093|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s094|}}</td><td>{{s|s095|}}</td></tr>
      <tr><td>{{s|s096|}}</td><td>{{s|s097|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s098|}}</p>
  <div class="box inglese" data-tit="{{a|s099|}}">
    <p>{{s|s100|}}</p>
  </div>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def takeUnfold(n: Int): LazyList[A] =
  unfold(this,n) {
    case Cons(h, t) => Some(f(h(), (t(), n-1)))
    case Empty => None
  }</pre>
      <pre class="msg">Not found: f</pre>
      <div class="fix">{{s|s101|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">unfold(this) {
  case _          => None
  case Cons(h, t) => Some((f(h()), t()))
}</pre>
      <pre class="msg">Unreachable case</pre>
      <div class="fix">{{s|s102|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def mapUnfold[B](f: A => B): LazyList[B] = this match
  case Cons(h, t) => Some((f(h()), t()))
  case Empty => None</pre>
      <pre class="msg">Found:    Some[(B, adpro.lazyList.LazyList[A])]
Required: adpro.lazyList.LazyList[B]</pre>
      <div class="fix">{{s|s103|}}</div>
    </div>
  </div>
  <figure class="scena" data-scena="takeunfold" data-titolo="{{a|s104|}}"></figure>
</section>

</main>
</body>
</html>
