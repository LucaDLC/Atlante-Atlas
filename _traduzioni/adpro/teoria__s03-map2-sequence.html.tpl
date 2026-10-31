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
SCENE.sequenza = {
  w: 600, h: 230, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'L', tipo: 'celle', x: 20, y: 40, cw: 100, ch: 42, valori: ['Some(1)', 'None', 'Some(3)'] },
    { id: 'acc', tipo: 'testo', x: 475, y: 60, t: 'acc = Some(Nil)', size: 15, bold: true, tono: 'ok' },
    { id: 'op', tipo: 'testo', x: 280, y: 150, t: '', size: 14 },
    { id: 'n', tipo: 'testo', x: 280, y: 200, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { L: { toni: { 2: 'ora' } }, op: { t: 'map2(Some(3), Some(Nil))(_ :: _)' }, acc: { t: 'acc = Some(List(3))', tono: 'ok' } } },
    { nota: '{{j|s005|'}}', set: { L: { toni: { 1: 'no' } }, op: { t: 'map2(None, Some(List(3)))(_ :: _)' }, acc: { t: 'acc = None', tono: 'no' } } },
    { nota: '{{j|s006|'}}', set: { L: { toni: { 0: 'ora', 1: 'no' } }, op: { t: 'map2(Some(1), None)(_ :: _)' } } },
    { nota: '{{j|s007|'}}', set: { op: { t: '' }, n: { t: 'sequence(...) = None', tono: 'no' } } }
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

    SCENE.map2 = {
      w: 560, h: 150,
      codice: { lang: 'scala', testo: `def map2[A, B, C](ao: Option[A], bo: Option[B])(f: (A, B) => C): Option[C] =
  ao.flatMap(a => bo.map(b => f(a, b)))` },
      legenda: '{{j|s008|'}}',
      oggetti: [R('ao', 30, 40, 110, 40, 'Some(2)', { tono: 'dato' }), R('bo', 170, 40, 110, 40, 'Some(3)', { tono: 'due' }), R('r', 400, 40, 120, 40, '?', { tono: 'spento' }), T('f', 340, 60, 'f = _ + _', { size: 12 }), T('c', 280, 120, '', { size: 12 })],
      passi: [
        { nota: "<code>map2</code>: due valori che forse ci sono, e una funzione <b>normale</b> che li combina. map2(Some(2), Some(3))(_ + _).", righe: [1] },
        { nota: "Apro il primo con <b>flatMap</b>: a = 2. flatMap perché quello che faccio dopo restituisce ancora un Option.", righe: [2], set: { ao: { tono: 'ok' }, c: { t: 'a = 2' } } },
        { nota: "Apro il secondo con <b>map</b>: b = 3. Basta map, perché f dà un valore normale. f(2, 3) = 5: <b>Some(5)</b>.", righe: [2], set: { bo: { tono: 'ok' }, r: { t: 'Some(5)', tono: 'ok' }, c: { t: 'a = 2, b = 3, f(a, b) = 5' } } },
        { nota: "Se uno dei due è None: map su None dà None, e f <b>non viene mai chiamata</b>. map2 \"solleva\" una funzione a due argomenti nel mondo degli Option, ed esegue due calcoli che possono fallire.", righe: [2], set: { bo: { t: 'None', tono: 'no' }, r: { t: 'None', tono: 'no' }, c: { t: 'map2(Some(2), None)(_ + _) = None' } } }
      ]
    };

    SCENE.cons = {
      w: 560, h: 200, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [T('e', 280, 30, '', { bold: true, size: 15 }), C('l', 130, 70, ['', '', ''], { toni: {} }), R('nil', 300, 70, 60, 40, 'Nil', { tono: 'spento' }), T('c', 280, 170, '', { size: 12 })],
      passi: [
        { nota: "Dalla settimana 3, <code>::</code> è il Cons della libreria, scritto <b>in mezzo</b>: x :: resto è la lista con x davanti a resto. Si parte da Nil." },
        { nota: "<code>3 :: Nil</code> = List(3).", set: { e: { t: '3 :: Nil' }, l: { valori: ['', '', '3'], toni: { 2: 'ora' } } } },
        { nota: "<code>2 :: List(3)</code> = List(2, 3).", set: { e: { t: '2 :: List(3)' }, l: { valori: ['', '2', '3'], toni: { 1: 'ora', 2: 'dato' } } } },
        { nota: "<code>1 :: List(2, 3)</code> = List(1, 2, 3). Scritto tutto insieme: 1 :: 2 :: 3 :: Nil. Nel match: <code>case h :: t =&gt;</code> al posto di case Cons(h, t).", set: { e: { t: '1 :: 2 :: 3 :: Nil = List(1, 2, 3)' }, l: { valori: ['1', '2', '3'], toni: { 0: 'ora', 1: 'dato', 2: 'dato' } } } },
        { nota: "Con i segnaposto <code>_ :: _</code> è una funzione a due argomenti, (x, xs) =&gt; x :: xs: un elemento e una lista. È quella che sequence e traverse passano a map2.", set: { c: { t: '_ :: _   =   (x, xs) => x :: xs' } } }
      ]
    };

    SCENE.traverse = {
      w: 580, h: 170,
      codice: { lang: 'scala', testo: `def traverse[A, B](as: List[A])(f: A => Option[B]): Option[List[B]] =
  as.foldRight[Option[List[B]]](Some(Nil))((a, acc) => map2(f(a), acc)(_ :: _))` },
      legenda: '{{j|s010|'}}',
      oggetti: [C('l', 20, 30, ['1', '2', '3']), R('acc', 220, 30, 330, 40, 'acc = Some(Nil)', { tono: 'ok' }), T('f', 290, 100, 'f = x => if x > 0 then Some(x * 10) else None', { size: 12 }), T('c', 290, 140, '', { size: 12, bold: true })],
      passi: [
        { nota: "<code>traverse</code>: come map, ma f può fallire. Stessa struttura di sequence, con f(a) applicata mentre scorro. foldRight parte dall'ultimo.", righe: [2] },
        { nota: "a = 3: f(3) = Some(30); map2 con acc: Some(List(30)).", righe: [2], set: { l: { toni: { 2: 'ora' } }, acc: { t: 'acc = Some(List(30))' } } },
        { nota: "a = 2: Some(20) :: … = Some(List(20, 30)). a = 1: <b>Some(List(10, 20, 30))</b>.", righe: [2], set: { l: { toni: { 0: 'ora', 1: 'ora', 2: 'ora' } }, acc: { t: 'Some(List(10, 20, 30))' }, c: { t: 'tutti positivi: Some(List(10, 20, 30))', tono: 'ok' } } },
        { nota: "Con List(1, −2, 3): f(−2) = None, map2 dà None, e da lì ogni map2 dà None. Risultato <b>None</b>.", righe: [2], set: { l: { valori: ['1', '-2', '3'], toni: { 1: 'no' } }, acc: { t: 'None', tono: 'no' }, c: { t: 'uno fallisce: None', tono: 'no' } } },
        { nota: "Perché non <code>sequence(as.map(f))</code>? Stesso risultato, ma map applica f a tutta la lista e costruisce una lista intermedia. traverse fa tutto in <b>una passata</b>.", set: { c: { t: 'una passata invece di due', tono: null } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s011|}}</h1>
  <p class="lede">{{s|s012|}}</p>
</header>

<section>
  <h2>{{s|s013|}}</h2>
  <figure class="codice" data-titolo="{{a|s014|}}">
<pre data-lang="scala">def map2[A, B, C](ao: Option[A], bo: Option[B])(f: (A, B) => C): Option[C] =
  ao.flatMap(a => bo.map(b => f(a, b)))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="ao: Option[A]@dato|bo: Option[B]@due|f: (A, B) => C@ora"><p>{{s|s015|}}</p></li>
      <li data-righe="2" data-segna="ao.flatMap(a =>@dato"><p>{{s|s016|}}</p></li>
      <li data-righe="2" data-segna="bo.map(b =>@due"><p>{{s|s017|}}</p></li>
      <li data-righe="2" data-segna="f(a, b)@ok"><p>{{s|s018|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s019|}}">
    <div class="passo"><div class="espr">map2(<mark class="dato">Some(2)</mark>, <mark class="due">Some(3)</mark>)(_ + _)</div><p class="nota">{{s|s020|}}</p></div>
    <div class="passo"><div class="espr">Some(2).flatMap(a => Some(3).map(b => a + b))   con a = <mark class="dato">2</mark>, b = <mark class="due">3</mark></div><p class="nota">{{s|s021|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">Some(5)</mark></div><p class="nota">{{s|s022|}}</p></div>
    <div class="passo"><div class="espr">map2(Some(2), <mark class="no">None</mark>)(_ + _)   →   Some(2).flatMap(a => <mark class="no">None</mark>.map(…))   →   <mark class="no">None</mark></div><p class="nota">{{s|s023|}}</p></div>
  </figure>
  <div class="box idea" data-tit="{{a|s024|}}">
    <p>{{s|s025|}}</p>
  </div>
  <figure class="scena" data-scena="map2" data-titolo="{{a|s026|}}"></figure>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
  <figure class="passi" data-titolo="{{a|s029|}}">
    <div class="passo"><div class="espr">3 :: <mark class="dato">Nil</mark>             →   <mark class="ok">List(3)</mark></div><p class="nota">{{s|s030|}}</p></div>
    <div class="passo"><div class="espr">2 :: <mark class="dato">List(3)</mark>         →   <mark class="ok">List(2, 3)</mark></div><p class="nota">{{s|s031|}}</p></div>
    <div class="passo"><div class="espr">1 :: <mark class="dato">List(2, 3)</mark>      →   <mark class="ok">List(1, 2, 3)</mark></div><p class="nota">E 1.</p></div>
    <div class="passo"><div class="espr">_ :: _   =   (<mark class="ora">x</mark>, <mark class="due">xs</mark>) => <mark class="ora">x</mark> :: <mark class="due">xs</mark></div><p class="nota">{{s|s032|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s033|}}</th><th>{{s|s034|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr>
      <tr><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="cons" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <p>{{s|s041|}}</p>
  <figure class="codice" data-titolo="{{a|s042|}}">
<pre data-lang="scala">def sequence[A](aos: List[Option[A]]): Option[List[A]] =
  aos.foldRight[Option[List[A]]](Some(Nil))((ao, acc) => map2(ao, acc)(_ :: _))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="List[Option[A]]@dato|Option[List[A]]@ok"><p>{{s|s043|}}</p></li>
      <li data-righe="2" data-segna="foldRight[Option[List[A]]]@due"><p>{{s|s044|}}</p></li>
      <li data-righe="2" data-segna="Some(Nil)@ok"><p>{{s|s045|}}</p></li>
      <li data-righe="2" data-segna="map2(ao, acc)@ora|(_ :: _)@due"><p>{{s|s046|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s047|}}">
    <div class="passo"><div class="espr">acc = <mark class="ok">Some(Nil)</mark></div><p class="nota">{{s|s048|}}</p></div>
    <div class="passo"><div class="espr">map2(<mark class="dato">Some(3)</mark>, Some(Nil))(_ :: _) = <mark class="ok">Some(List(3))</mark></div><p class="nota">{{s|s049|}}</p></div>
    <div class="passo"><div class="espr">map2(<mark class="no">None</mark>, Some(List(3)))(_ :: _) = <mark class="no">None</mark></div><p class="nota">{{s|s050|}}</p></div>
    <div class="passo"><div class="espr">map2(<mark class="dato">Some(1)</mark>, <mark class="no">None</mark>)(_ :: _) = <mark class="no">None</mark></div><p class="nota">{{s|s051|}}</p></div>
    <div class="passo"><div class="espr"><mark class="no">None</mark>        e con List(Some(1), Some(2), Some(3)):   <mark class="ok">Some(List(1, 2, 3))</mark></div><p class="nota">{{s|s052|}}</p></div>
  </figure>
  <figure class="scena" data-scena="sequenza" data-titolo="{{a|s053|}}"></figure>
  <div class="box attenzione" data-tit="{{a|s054|}}">
    <p>{{s|s055|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s056|}}</h2>
  <figure class="codice" data-titolo="{{a|s057|}}">
<pre data-lang="scala">def traverse[A, B](as: List[A])(f: A => Option[B]): Option[List[B]] =
  as.foldRight[Option[List[B]]](Some(Nil))((a, acc) => map2(f(a), acc)(_ :: _))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="f: A => Option[B]@ora"><p>{{s|s058|}}</p></li>
      <li data-righe="2" data-segna="map2(f(a), acc)@ok"><p>{{s|s059|}}</p></li>
    </ol>
  </figure>
  <pre class="cod" data-lang="scala">traverse(List(1, 2, 3))(x => if x &gt; 0 then Some(x * 10) else None)    // Some(List(10, 20, 30))
traverse(List(1, -2, 3))(x => if x &gt; 0 then Some(x * 10) else None)   // None</pre>
  <p>{{s|s060|}}</p>
  <figure class="scena" data-scena="traverse" data-titolo="{{a|s061|}}"></figure>
</section>

</main>
</body>
</html>
