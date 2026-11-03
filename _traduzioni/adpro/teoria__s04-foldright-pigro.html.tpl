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
  const vuoto = ['?', '?', '?', '?', '?', '?', '?', '?'];
  const forza = k => vuoto.map((v, i) => i <= k ? String(i) : '?');
  const toni = (k, ult) => Object.fromEntries(vuoto.map((v, i) => [i, i < k ? 'no' : i === k ? ult : null]).filter(x => x[1]));
  SCENE.exists = {
    w: 560, h: 210, lato: false,
    legenda: '{{j|s002|'}}',
    oggetti: [
      { id: 't', tipo: 'testo', x: 280, y: 22, t: 'from(0): 0, 1, 2, 3, 4, … (infinita)', size: 13, bold: true },
      { id: 'L', tipo: 'celle', x: 40, y: 44, cw: 58, ch: 42, valori: vuoto, indici: false },
      { id: 'v', tipo: 'testo', x: 280, y: 130, t: '', size: 14 },
      { id: 'n', tipo: 'testo', x: 280, y: 180, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: '{{j|s003|'}}' },
      { nota: '{{j|s004|'}}', set: { L: { valori: forza(0), toni: toni(0, 'ora') }, v: { t: 'p(0) = false  →  serve il resto' } } },
      { nota: '{{j|s005|'}}', set: { L: { valori: forza(1), toni: toni(1, 'ora') }, v: { t: 'p(1) = false  →  serve il resto' } } },
      { nota: '{{j|s006|'}}', set: { L: { valori: forza(2), toni: toni(2, 'ora') }, v: { t: 'p(2) = false  →  serve il resto' } } },
      { nota: '{{j|s007|'}}', set: { L: { valori: forza(3), toni: toni(3, 'ok') }, v: { t: 'p(3) = true  →  stop' } } },
      { nota: '{{j|s008|'}}', set: { n: { t: 'from(0).exists(_ > 2) = true', tono: 'ok' } } }
    ]
  };
})();
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

    SCENE.firmapigra = {
      w: 560, h: 150,
      codice: { lang: 'scala', testo: `def foldRight[B, C >: B](z: => B)(f: (A, => C) => C): C = this match
  case Empty => z
  case Cons(h, t) => f(h(), t().foldRight(z)(f))` },
      legenda: '{{j|s009|'}}',
      oggetti: [R('h', 30, 40, 180, 40, 'h(): la testa', { tono: 'spento' }), R('t', 240, 40, 290, 40, 't().foldRight(z)(f): il resto', { tono: 'spento' }), T('c', 280, 120, '', { size: 12 })],
      passi: [
        { nota: "La firma del corso ha due <code>=&gt;</code>, e sono il punto di tutto.", righe: [1] },
        { nota: "Il primo parametro di f è normale: la <b>testa</b> viene calcolata subito, <code>h()</code>.", righe: [3], set: { h: { tono: 'ok' } } },
        { nota: "Il secondo è <b>by-name</b> (<code>=&gt; C</code>): f riceve \"il risultato del resto\" come <b>ricetta</b>, non calcolata. Viene eseguita solo se f usa quel parametro.", righe: [1, 3], set: { t: { tono: 'due' }, c: { t: 'se f non usa il resto, il resto non viene mai calcolato' } } },
        { nota: "Anche <code>z</code> è by-name: si calcola solo se si arriva davvero in fondo. <code>C &gt;: B</code> aiuta il compilatore: si parte da None o empty e si ottiene un tipo più generale, come Option[A].", righe: [1, 2], set: { c: { t: 'z: => B, calcolato solo in fondo' } } }
      ]
    };

    SCENE.dovez = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [T('hr', 290, 24, 'LazyList(1, 2, 3).fold…("z")((a, acc) => s"f($a, $acc)")', { bold: true, size: 12 }), T('r', 290, 70, '', { size: 14, tono: 'ora' }), T('l', 290, 120, '', { size: 14, tono: 'due' }), T('c', 290, 170, '', { size: 12 }), T('c2', 290, 200, '', { size: 12 })],
      passi: [
        { nota: "Per vedere dove finisce z, invece di fare conti stampo la <b>formula</b> che ogni fold costruisce." },
        { nota: "<b>foldRight</b>: f riceve la testa e la ricetta del resto; si scende finché la lista finisce, e al posto del resto c'è z. <b>1 è il più lontano da z.</b>", set: { r: { t: 'foldRight: f(1, f(2, f(3, z)))' } } },
        { nota: "<b>foldLeft</b>: f(h(), z) diventa il nuovo z e si riparte dalla coda; in coda. Stessi elementi, parentesi al contrario: <b>1 è il primo a incontrare z</b>.", set: { l: { t: 'foldLeft: f(3, f(2, f(1, z)))' } } },
        { nota: "Conseguenze (verificate): ricostruendo con cons, foldRight dà List(1, 2, 3), foldLeft la lista invertita. Su una lista infinita foldRight si ferma se f non usa acc; foldLeft non termina mai (\"Eager; cannot be used to work with infinite lazy lists\").", set: { c: { t: 'naturals.foldRight(false)((a, acc) => a > 3 || acc) = true', tono: 'ok' }, c2: { t: 'naturals.foldLeft(…): non termina', tono: 'no' } } }
      ]
    };

    SCENE.headopt1 = {
      w: 560, h: 150,
      codice: { lang: 'scala', testo: `def headOption1: Option[A] =
  foldRight(None)((a, _) => Some(a))` },
      legenda: '{{j|s011|'}}',
      oggetti: [C('l', 30, 40, ['0', '?', '?', '?', '…'], { cw: 60, toni: toni(5, 'spento') }), T('c', 280, 120, '', { size: 12, bold: true })],
      passi: [
        { nota: "headOption con foldRight: z = None (lista vuota), f = <code>(a, _) =&gt; Some(a)</code>.", righe: [2] },
        { nota: "Primo passo: f(0, _). f <b>ignora</b> il secondo parametro (_): la ricetta del resto non viene mai eseguita.", righe: [2], set: { l: { toni: Object.assign(toni(5, 'spento'), { 0: 'ok' }) } } },
        { nota: "Risultato Some(0), con <b>una sola</b> testa calcolata (verificato). Su una List normale lo stesso codice attraverserebbe tutta la lista prima di rispondere.", righe: [2], set: { c: { t: 'Some(0): una testa calcolata, il resto mai', tono: 'ok' } } }
      ]
    };

    SCENE.takewhile1 = {
      w: 560, h: 150,
      codice: { lang: 'scala', testo: `def takeWhile1(p: A => Boolean): LazyList[A] =
  foldRight(empty)((a, acc) => if p(a) then cons(a, acc) else empty)` },
      legenda: '{{j|s012|'}}',
      oggetti: [C('l', 30, 40, ['1', '2', '3', '4', '5', '…'], { cw: 60, toni: toni(6, 'spento') }), T('c', 280, 120, 'naturals.takeWhile1(_ < 4)', { size: 12, bold: true })],
      passi: [
        { nota: "a è l'elemento, acc la ricetta del takeWhile del resto. Su naturals, p = _ &lt; 4.", righe: [2] },
        { nota: "1, 2, 3 vanno bene: <code>cons(a, acc)</code>. cons è by-name: acc non viene forzato qui, solo quando qualcuno legge la coda.", righe: [2], set: { l: { toni: Object.assign(toni(6, 'spento'), { 0: 'ok', 1: 'ok', 2: 'ok' }) } } },
        { nota: "4 non va: <code>empty</code>, senza guardare acc. Il resto infinito non viene mai toccato: List(1, 2, 3).", righe: [2], set: { l: { toni: Object.assign(toni(6, 'spento'), { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'no' }) }, c: { t: '.toList = List(1, 2, 3)', tono: 'ok' } } }
      ]
    };

    SCENE.appendz = {
      w: 580, h: 200, lato: true,
      legenda: '{{j|s013|'}}',
      oggetti: [C('a', 40, 50, ['1', '2'], { toni: toni(2, 'dato') }), C('b', 300, 50, ['8', '9'], { toni: toni(2, 'due') }), T('e', 290, 130, '', { bold: true, size: 13 }), T('c', 290, 175, '', { size: 12 })],
      passi: [
        { nota: "Esercizio 8: map, filter, append, flatMap con foldRight, costruendo con cons così il resto resta una ricetta. Il caso interessante è <code>append</code>: cosa va in z?" },
        { nota: "Con foldRight z è <b>quello che c'è quando la lista finisce</b>. In append, quando this finisce, arriva that. Quindi z = that.", set: { e: { t: 'foldRight(that)((a, acc) => cons(a, acc))' } } },
        { nota: "<code>LazyList(1, 2).append(LazyList(8, 9))</code> = f(1, f(2, that)) = cons(1, cons(2, that)) = List(1, 2, 8, 9). that è by-name: si calcola solo se si arriva in fondo.", set: { e: { t: 'cons(1, cons(2, that)) → List(1, 2, 8, 9)', tono: 'ok' } } },
        { nota: "Per map, filter e flatMap \"cosa c'è quando la lista finisce\" è <code>empty</code>; solo per append è that. Attenzione: filter con un p mai vero, su una lista infinita, non si ferma.", set: { c: { t: 'map / filter / flatMap: z = empty · append: z = that' } } }
      ]
    };

    SCENE.findlazy = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s014|'}}',
      oggetti: [T('h1', 290, 24, 'from(0).find(_ > 2)', { bold: true }), C('l', 40, 40, ['0', '1', '2', '3', '4', '5', '…'], { cw: 60, toni: toni(7, 'spento') }),
        T('h2', 290, 120, 'List(1, 2, 3, 4).filter(_ > 2).headOption', { bold: true, nascosto: true }), C('s', 40, 136, ['1', '2', '3', '4'], { cw: 60, toni: toni(4, 'spento'), nascosto: true })],
      passi: [
        { nota: "<code>find(p) = this.filter(p).headOption</code>. Su una lista normale sembrerebbe uno spreco: filtrare tutto per usarne uno." },
        { nota: "Su LazyList: filter produce il risultato <b>pigramente</b>, headOption chiede solo il primo. Calcolati 0, 1, 2, 3 e basta (verificato). Risultato Some(3).", set: { l: { toni: Object.assign(toni(7, 'spento'), { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok' }) } } },
        { nota: "Su List: filter è <b>strict</b>, controlla tutti e 4 e crea una lista intera, poi se ne usa uno (verificato stampando).", set: { h2: { nascosto: false }, s: { nascosto: false, toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'no' } } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s015|}}</h1>
  <p class="lede">{{s|s016|}}</p>
</header>

<section>
  <h2>{{s|s017|}}</h2>
  <figure class="codice" data-titolo="{{a|s018|}}">
<pre data-lang="scala">def foldRight[B, C &gt;: B](z: => B)(f: (A, => C) => C): C = this match
  case Empty => z
  case Cons(h, t) => f(h(), t().foldRight(z)(f))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="(A, => C)@ora"><p>{{s|s019|}}</p></li>
      <li data-righe="3" data-segna="t().foldRight(z)(f)@due"><p>{{s|s020|}}</p></li>
      <li data-righe="3" data-segna="h()@dato"><p>{{s|s021|}}</p></li>
      <li data-righe="1" data-segna="z: => B@ok"><p>{{s|s022|}}</p></li>
      <li data-righe="1" data-segna="[B, C &gt;: B]@due"><p>{{s|s023|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="firmapigra" data-titolo="{{a|s024|}}"></figure>
</section>

<section>
  <h2>{{s|s025|}}</h2>
  <p>{{s|s026|}}</p>
  <pre class="cod" data-lang="scala">LazyList(1, 2, 3).foldRight("z")((a, acc) => s"f($a, $acc)")
LazyList(1, 2, 3).foldLeft("z") ((a, acc) => s"f($a, $acc)")</pre>
  <figure class="passi" data-titolo="{{a|s027|}}" data-legenda="{{a|s028|}}">
    <div class="passo"><div class="espr">f(<mark class="dato">1</mark>, <mark class="due">foldRight su (2,3)</mark>)</div><p class="nota">{{s|s029|}}</p></div>
    <div class="passo"><div class="espr">f(1, f(<mark class="dato">2</mark>, <mark class="due">foldRight su (3)</mark>))</div><p class="nota">{{s|s030|}}</p></div>
    <div class="passo"><div class="espr">f(1, f(2, f(<mark class="dato">3</mark>, <mark class="due">foldRight su ()</mark>)))</div><p class="nota">{{s|s031|}}</p></div>
    <div class="passo"><div class="espr">f(1, f(2, f(3, <mark class="ok">z</mark>)))</div><p class="nota">{{s|s032|}}</p></div>
  </figure>
  <figure class="passi" data-titolo="{{a|s033|}}" data-legenda="{{a|s034|}}">
    <div class="passo"><div class="espr">foldLeft(<mark class="ora">f(1, z)</mark>) su (2,3)</div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">foldLeft(<mark class="ora">f(2, f(1, z))</mark>) su (3)</div><p class="nota">{{s|s036|}}</p></div>
    <div class="passo"><div class="espr">foldLeft(<mark class="ora">f(3, f(2, f(1, z)))</mark>) su ()</div><p class="nota">{{s|s037|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">f(3, f(2, f(1, z)))</mark></div><p class="nota">{{s|s038|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s039|}}</th><th>{{s|s040|}}</th><th>{{s|s041|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s042|}}</td><td>{{s|s043|}}</td><td>{{s|s044|}}</td></tr>
      <tr><td>{{s|s045|}}</td><td>{{s|s046|}}</td><td>{{s|s047|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s048|}}">
    <p>{{s|s049|}}</p>
  </div>
  <figure class="scena" data-scena="dovez" data-titolo="{{a|s050|}}"></figure>
</section>

<section>
  <h2>{{s|s051|}}</h2>
  <pre class="cod" data-lang="scala">def exists(p: A => Boolean): Boolean =
  foldRight(false)((a, b) => p(a) || b)</pre>
  <figure class="passi" data-titolo="{{a|s052|}}">
    <div class="passo"><div class="espr">f(<mark class="dato">0</mark>, <mark class="due">[resto]</mark>) = p(0) || <mark class="due">[resto]</mark> = <mark class="no">false</mark> || <mark class="due">[resto]</mark></div><p class="nota">{{s|s053|}}</p></div>
    <div class="passo"><div class="espr">f(<mark class="dato">1</mark>, [resto]) = false || [resto]</div><p class="nota">{{s|s054|}}</p></div>
    <div class="passo"><div class="espr">f(<mark class="dato">2</mark>, [resto]) = false || [resto]</div><p class="nota">{{s|s055|}}</p></div>
    <div class="passo"><div class="espr">f(<mark class="dato">3</mark>, <mark class="no">[resto]</mark>) = <mark class="ok">true</mark> || <mark class="no">[resto]</mark></div><p class="nota">{{s|s056|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">true</mark></div><p class="nota">{{s|s057|}}</p></div>
  </figure>
  <figure class="scena" data-scena="exists" data-titolo="{{a|s058|}}"></figure>
</section>

<section>
  <h2>{{s|s059|}}</h2>
  <pre class="cod" data-lang="scala">def headOption1: Option[A] =
  foldRight(None)((a, _) => Some(a))</pre>
  <figure class="passi" data-titolo="{{a|s060|}}">
    <div class="passo"><div class="espr">f(<mark class="dato">0</mark>, <mark class="no">_</mark>) = Some(0)</div><p class="nota">{{s|s061|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">Some(0)</mark></div><p class="nota">{{s|s062|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s063|}}">
    <p>{{s|s064|}}</p>
  </div>
  <figure class="scena" data-scena="headopt1" data-titolo="{{a|s065|}}"></figure>
</section>

<section>
  <h2>{{s|s066|}}</h2>
  <figure class="codice" data-titolo="{{a|s067|}}">
<pre data-lang="scala">def takeWhile1(p: A => Boolean): LazyList[A] =
  foldRight(empty)((a, acc) => if p(a) then cons(a, acc) else empty)</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="foldRight(empty)@ok"><p>{{s|s068|}}</p></li>
      <li data-righe="2" data-segna="(a, acc) =>@dato"><p>{{s|s069|}}</p></li>
      <li data-righe="2" data-segna="cons(a, acc)@ora"><p>{{s|s070|}}</p></li>
      <li data-righe="2" data-segna="else empty@no"><p>{{s|s071|}}</p></li>
    </ol>
  </figure>
  <pre class="cod" data-lang="scala">naturals.takeWhile1(_ &lt; 4).toList   // List(1, 2, 3)</pre>
  <figure class="scena" data-scena="takewhile1" data-titolo="{{a|s072|}}"></figure>
</section>

<section>
  <h2>{{s|s073|}}</h2>
  <p>{{s|s074|}}</p>
  <figure class="codice" data-titolo="{{a|s075|}}">
<pre data-lang="scala">def map[B](f: A => B): LazyList[B] =
  foldRight(empty[B])((a, acc) => cons(f(a), acc))

def filter(p: A => Boolean): LazyList[A] =
  foldRight(empty[A])((a, acc) => if p(a) then cons(a, acc) else acc)

def append[B &gt;: A](that: => LazyList[B]): LazyList[B] =
  foldRight(that)((a, acc) => cons(a, acc))

def flatMap[B](f: A => LazyList[B]): LazyList[B] =
  foldRight(empty[B])((a, acc) => f(a).append(acc))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="[B](f: A => B): LazyList[B]@due"><p>{{s|s076|}}</p></li>
      <li data-righe="2" data-segna="empty[B]@ok|cons(f(a), acc)@ora"><p>{{s|s077|}}</p></li>
      <li data-righe="5" data-segna="if p(a) then cons(a, acc) else acc@ora"><p>{{s|s078|}}</p></li>
      <li data-righe="7" data-segna="that: => LazyList[B]@dato|[B &gt;: A]@due"><p>{{s|s079|}}</p></li>
      <li data-righe="8" data-segna="foldRight(that)@ok"><p>{{s|s080|}}</p></li>
      <li data-righe="11" data-segna="f(a).append(acc)@ora"><p>{{s|s081|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s082|}}">
    <p>{{s|s083|}}</p>
    <p>{{s|s084|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s085|}}">
    <p>{{s|s086|}}</p>
    <pre class="cod" data-lang="scala">LazyList(1, 2).append(LazyList(8, 9))
= f(1, f(2, that))  =  cons(1, cons(2, that))   // List(1, 2, 8, 9)</pre>
    <p>{{s|s087|}}</p>
  </div>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def map(f: A => B): LazyList[B] = …</pre>
      <pre class="msg">Not found: type B</pre>
      <div class="fix">{{s|s088|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">foldRight(empty)((a,acc => cons(f(a), acc)))</pre>
      <pre class="msg">Not found: a</pre>
      <div class="fix">{{s|s089|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">foldRight(empty)((a,acc) => cons((a,that,acc)))</pre>
      <pre class="msg">Found:    (A, adpro.lazyList.LazyList[B], adpro.lazyList.LazyList[B])
Required: B</pre>
      <div class="fix">{{s|s090|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def flatMap[B](f: A => LazyList[B]): LazyList[B] =
  foldRight(empty)((a,acc) => cons(f(a), acc))</pre>
      <pre class="msg">Found:    adpro.lazyList.LazyList[B]
Required: B</pre>
      <div class="fix">{{s|s091|}}</div>
    </div>
  </div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s092|}}</th><th>{{s|s093|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s094|}}</td><td>{{s|s095|}}</td></tr>
      <tr><td>{{s|s096|}}</td><td>{{s|s097|}}</td></tr>
      <tr><td>{{s|s098|}}</td><td>{{s|s099|}}</td></tr>
      <tr><td>{{s|s100|}}</td><td>{{s|s101|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box idea" data-tit="{{a|s102|}}">
    <p>{{s|s103|}}</p>
  </div>
  <p class="piccolo">{{s|s104|}}</p>
  <figure class="scena" data-scena="appendz" data-titolo="{{a|s105|}}"></figure>
</section>

<section>
  <h2>{{s|s106|}}</h2>
  <pre class="cod" data-lang="scala">def find(p: A => Boolean): Option[A] = this.filter(p).headOption</pre>
  <div class="colonne">
    <div class="carta buona">
      <h4>{{s|s107|}}</h4>
      <p>{{s|s108|}}</p>
    </div>
    <div class="carta cattiva">
      <h4>{{s|s109|}}</h4>
      <p>{{s|s110|}}</p>
    </div>
  </div>
  <div class="box inglese" data-tit="{{a|s111|}}">
    <p>{{s|s112|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s113|}}">
    <p>{{s|s114|}}</p>
    <p>{{s|s115|}}</p>
  </div>
  <figure class="scena" data-scena="findlazy" data-titolo="{{a|s116|}}"></figure>
</section>

</main>
</body>
</html>
