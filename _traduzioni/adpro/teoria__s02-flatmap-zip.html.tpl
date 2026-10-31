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
SCENE.flatmap = {
  w: 560, h: 260, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'L', tipo: 'celle', x: 40, y: 30, cw: 54, ch: 40, valori: ['1', '2', '3'] },
    { id: 'g0', tipo: 'celle', x: 40, y: 110, cw: 40, ch: 36, valori: ['1', '1'], indici: false, nascosto: true },
    { id: 'g1', tipo: 'celle', x: 150, y: 110, cw: 40, ch: 36, valori: ['2', '2'], indici: false, nascosto: true },
    { id: 'g2', tipo: 'celle', x: 260, y: 110, cw: 40, ch: 36, valori: ['3', '3'], indici: false, nascosto: true },
    { id: 'R', tipo: 'celle', x: 40, y: 190, cw: 40, ch: 36, valori: ['', '', '', '', '', ''], indici: false },
    { id: 'n', tipo: 'testo', x: 440, y: 50, t: 'f = i => List(i, i)', size: 13, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { L: { toni: { 0: 'ora' } }, g0: { nascosto: false, toni: { 0: 'ora', 1: 'ora' } } } },
    { nota: '{{j|s005|'}}', set: { L: { toni: { 1: 'ora', 2: 'ora' } }, g0: { toni: {} }, g1: { nascosto: false }, g2: { nascosto: false } } },
    { nota: '{{j|s006|'}}', set: { L: { toni: {} }, R: { valori: ['1', '1', '2', '2', '3', '3'], toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok', 5: 'ok' } }, n: { t: 'List(1, 1, 2, 2, 3, 3)', tono: 'ok' } } }
  ]
};
SCENE.zipwith = {
  w: 520, h: 230, lato: false,
  legenda: '{{j|s007|'}}',
  oggetti: [
    { id: 'A', tipo: 'celle', x: 60, y: 30, cw: 60, ch: 40, valori: ['1', '2', '3'] },
    { id: 'B', tipo: 'celle', x: 60, y: 100, cw: 60, ch: 40, valori: ['10', '20'] },
    { id: 'R', tipo: 'celle', x: 60, y: 170, cw: 60, ch: 40, valori: ['', ''], indici: false },
    { id: 'n', tipo: 'testo', x: 380, y: 120, t: 'f = _ + _', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s008|'}}' },
    { nota: '{{j|s009|'}}', set: { A: { toni: { 0: 'dato' } }, B: { toni: { 0: 'due' } }, R: { valori: ['11', ''], toni: { 0: 'ok' } } } },
    { nota: '{{j|s010|'}}', set: { A: { toni: { 1: 'dato' } }, B: { toni: { 1: 'due' } }, R: { valori: ['11', '22'], toni: { 1: 'ok' } } } },
    { nota: '{{j|s011|'}}', set: { A: { toni: { 2: 'no' } }, n: { t: 'List(11, 22)', tono: 'ok' } } }
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

    const bar = (id, y, t) => [T(id + 't', 150, y + 18, t, { anchor: 'end', size: 12 }), R(id + 'r', 160, y, 0, 24, '', { tono: 'ok' }), R(id + 'l', 160, y + 26, 0, 24, '', { tono: 'no' }), T(id + 'v', 170, y + 18, '', { size: 11, anchor: 'start' }), T(id + 'w', 170, y + 44, '', { size: 11, anchor: 'start' })];
    SCENE.concatcosto = {
      w: 600, h: 250, lato: true,
      legenda: '{{j|s012|'}}',
      oggetti: [].concat(bar('a', 20, '4 liste da 2'), bar('b', 90, '10 liste da 2'), bar('c', 160, '20 liste da 2'), [T('n', 300, 240, '', { size: 12 })]),
      passi: [
        { nota: "<code>concat = foldRight(l, Nil, append)</code>. append(l1, l2) <b>ricopia l1</b>: costa |l1|. Contiamo quante celle vengono ricopiate con k liste da 2 elementi." },
        { nota: "<b>foldRight</b>: append(L1, append(L2, append(L3, …))). Ogni lista originale è il primo argomento <b>una volta sola</b>: 2k copie. Con 4 liste: 8.", set: { ar: { w: 8 * 4 }, av: { t: '8', x: 170 + 32 } } },
        { nota: "<b>foldLeft</b>: append(append(append(Nil, L1), L2), L3)… L'accumulatore, che cresce, sta a sinistra e viene ricopiato a ogni passo: 0 + 2 + 4 + 6 = 12.", set: { al: { w: 12 * 4 }, aw: { t: '12', x: 170 + 48 } } },
        { nota: "Con 10 liste: 20 contro 0 + 2 + … + 18 = 90.", set: { br: { w: 20 * 4 }, bv: { t: '20', x: 170 + 80 }, bl: { w: 90 * 4 }, bw: { t: '90', x: 170 + 360 } } },
        { nota: "Con 20 liste: 40 contro 380 (fuori scala: la barra è tagliata). foldRight è <b>lineare</b>, foldLeft <b>quadratico</b>: k(k − 1) copie.", set: { cr: { w: 40 * 4 }, cv: { t: '40', x: 170 + 160 }, cl: { w: 380 }, cw: { t: '380', x: 548 }, n: { t: 'foldRight: 2k · foldLeft: k(k − 1)' } } }
      ]
    };

    SCENE.filtro = {
      w: 560, h: 140,
      codice: { lang: 'scala', testo: `def filter[A](l: List[A], p: A => Boolean): List[A] =
  foldRight[A, List[A]](l, Nil, (a, z) => if p(a) then Cons(a, z) else z)` },
      legenda: '{{j|s013|'}}',
      oggetti: [C('l', 20, 40, ['1', '2', '3', '4']), R('z', 280, 40, 200, 40, 'z = Nil', { tono: 'dato' }), T('c', 280, 110, 'filter(List(1, 2, 3, 4), _ % 2 == 0)', { size: 12, bold: true })],
      passi: [
        { nota: "foldRight parte dall'<b>ultimo</b> elemento. z è il risultato già filtrato di tutto quello che viene dopo; all'inizio è Nil.", righe: [2] },
        { nota: "a = 4, pari: <b>tenuto</b>, Cons(4, Nil).", righe: [2], set: { l: { toni: { 3: 'ok' } }, z: { t: 'z = List(4)' } } },
        { nota: "a = 3, dispari: restituisco z così com'è. Scartare = non aggiungere niente.", righe: [2], set: { l: { toni: { 2: 'no', 3: 'ok' } } } },
        { nota: "a = 2: tenuto, davanti al resto: List(2, 4).", righe: [2], set: { l: { toni: { 1: 'ok', 2: 'no', 3: 'ok' } }, z: { t: 'z = List(2, 4)' } } },
        { nota: "a = 1: scartato. Risultato <b>List(2, 4)</b>, nell'ordine originale: è il vantaggio di foldRight.", righe: [2], set: { l: { toni: { 0: 'no', 1: 'ok', 2: 'no', 3: 'ok' } }, z: { t: 'List(2, 4)', tono: 'ok' } } }
      ]
    };

    SCENE.zip = {
      w: 560, h: 170,
      codice: { lang: 'scala', testo: `def zipWith[A, B, C](l: List[A], r: List[B], f: (A, B) => C): List[C] = (l, r) match
  case (Nil, _) => Nil
  case (_, Nil) => Nil
  case (Cons(h1, t1), Cons(h2, t2)) => Cons(f(h1, h2), zipWith(t1, t2, f))` },
      legenda: '{{j|s014|'}}',
      oggetti: [C('l', 60, 20, ['1', '2', '3']), C('r', 60, 70, ['4', '5', '6', '7']), C('o', 60, 120, ['', '', ''], { toni: { 0: 'spento', 1: 'spento', 2: 'spento' } }), T('ll', 30, 45, 'l', { bold: true }), T('lr', 30, 95, 'r', { bold: true }), T('lo', 30, 145, '=', { bold: true }), T('c', 420, 90, '', { size: 12 })],
      passi: [
        { nota: "<code>zipWith(List(1, 2, 3), List(4, 5, 6, 7), _ + _)</code>: due liste in parallelo, posizione per posizione.", righe: [1] },
        { nota: "Tutte e due non vuote: combino le due teste, 1 + 4 = 5, e continuo con le code.", righe: [4], set: { l: { toni: { 0: 'ora' } }, r: { toni: { 0: 'ora' } }, o: { valori: ['5', '', ''], toni: { 0: 'ok', 1: 'spento', 2: 'spento' } } } },
        { nota: "2 + 5 = 7.", righe: [4], set: { l: { toni: { 0: null, 1: 'ora' } }, r: { toni: { 0: null, 1: 'ora' } }, o: { valori: ['5', '7', ''], toni: { 0: 'ok', 1: 'ok', 2: 'spento' } } } },
        { nota: "3 + 6 = 9.", righe: [4], set: { l: { toni: { 1: null, 2: 'ora' } }, r: { toni: { 1: null, 2: 'ora' } }, o: { valori: ['5', '7', '9'], toni: { 0: 'ok', 1: 'ok', 2: 'ok' } } } },
        { nota: "l è finita: <code>case (Nil, _) =&gt; Nil</code>. Il 7 resta fuori: il risultato è lungo come la lista più corta, l'unica scelta che non inventa valori.", righe: [2], set: { l: { toni: { 2: null } }, r: { toni: { 2: null, 3: 'no' } }, c: { t: 'List(5, 7, 9)', tono: 'ok' } } }
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
  <pre class="cod" data-lang="scala">def concat[A](l: List[List[A]]): List[A] =
  foldRight[List[A], List[A]](l, Nil, append)</pre>
  <p>{{s|s018|}}</p>
  <ul>
    <li>{{s|s019|}}</li>
    <li>{{s|s020|}}</li>
  </ul>
  <figure class="passi" data-titolo="{{a|s021|}}">
    <div class="passo">
      <div class="espr">append(<mark class="ora">l1</mark>, l2)   costa   |<mark class="ora">l1</mark>|</div>
      <p class="nota">{{s|s022|}}</p>
    </div>
    <div class="passo">
      <div class="espr">foldRight:  append(<mark class="dato">L1</mark>, append(<mark class="dato">L2</mark>, append(<mark class="dato">L3</mark>, Nil)))</div>
      <p class="nota">{{s|s023|}}</p>
    </div>
    <div class="passo">
      <div class="espr">foldLeft:   append(append(append(Nil, L1), L2), L3)
                        <mark class="no">└ L1 ─┘</mark>
                 <mark class="no">└──── L1 + L2 ───┘</mark></div>
      <p class="nota">{{s|s024|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="concatcosto" data-titolo="{{a|s025|}}"></figure>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <figure class="codice" data-titolo="{{a|s027|}}">
<pre data-lang="scala">def filter[A](l: List[A], p: A => Boolean): List[A] =
  foldRight[A, List[A]](l, Nil, (a, z) => if p(a) then Cons(a, z) else z)</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="Nil@dato"><p>{{s|s028|}}</p></li>
      <li data-righe="2" data-segna="(a, z) =>@ora"><p>{{s|s029|}}</p></li>
      <li data-righe="2" data-segna="Cons(a, z)@ok"><p>{{s|s030|}}</p></li>
      <li data-righe="2" data-segna="else z@no"><p>{{s|s031|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s032|}}">
    <div class="passo"><div class="espr">f(1, f(2, f(3, f(4, <mark class="dato">Nil</mark>))))</div><p class="nota">{{s|s033|}}</p></div>
    <div class="passo"><div class="espr">f(<mark class="ora">4</mark>, Nil) = Cons(4, Nil)</div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">f(<mark class="no">3</mark>, List(4)) = List(4)</div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">f(<mark class="ora">2</mark>, List(4)) = Cons(2, List(4))</div><p class="nota">{{s|s036|}}</p></div>
    <div class="passo"><div class="espr">f(<mark class="no">1</mark>, List(2, 4)) = <mark class="ok">List(2, 4)</mark></div><p class="nota">{{s|s037|}}</p></div>
  </figure>
  <figure class="scena" data-scena="filtro" data-titolo="{{a|s038|}}"></figure>
</section>

<section>
  <h2>{{s|s039|}}</h2>
  <p>{{s|s040|}}</p>
  <pre class="cod" data-lang="scala">def flatMap[A, B](l: List[A], f: A => List[B]): List[B] =
  concat(map(l, f))</pre>
  <figure class="passi" data-titolo="{{a|s041|}}">
    <div class="passo"><div class="espr">List(<mark class="dato">1</mark>, <mark class="due">2</mark>, <mark class="ora">3</mark>)</div><p class="nota">{{s|s042|}}</p></div>
    <div class="passo"><div class="espr">map →  List(List(<mark class="dato">1</mark>, <mark class="dato">1</mark>), List(<mark class="due">2</mark>, <mark class="due">2</mark>), List(<mark class="ora">3</mark>, <mark class="ora">3</mark>))</div><p class="nota">{{s|s043|}}</p></div>
    <div class="passo"><div class="espr">concat → <mark class="ok">List(1, 1, 2, 2, 3, 3)</mark></div><p class="nota">{{s|s044|}}</p></div>
  </figure>
  <figure class="scena" data-scena="flatmap" data-titolo="{{a|s045|}}"></figure>
  <div class="colonne">
    <div class="carta"><h4>{{s|s046|}}</h4><p>{{s|s047|}}</p></div>
    <div class="carta"><h4>{{s|s048|}}</h4><p>{{s|s049|}}</p></div>
    <div class="carta"><h4>{{s|s050|}}</h4><p>{{s|s051|}}</p></div>
  </div>
  <div class="box idea" data-tit="{{a|s052|}}">
    <p>{{s|s053|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s054|}}</h2>
  <p>{{s|s055|}}</p>
  <figure class="codice" data-titolo="{{a|s056|}}">
<pre data-lang="scala">def zipWith[A, B, C](l: List[A], r: List[B], f: (A, B) => C): List[C] = (l, r) match
  case (Nil, _) => Nil
  case (_, Nil) => Nil
  case (Cons(h1, t1), Cons(h2, t2)) => Cons(f(h1, h2), zipWith(t1, t2, f))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="[A, B, C]@due|f: (A, B) => C@ora"><p>{{s|s057|}}</p></li>
      <li data-righe="2-3" data-segna="Nil@no|Nil#3@no"><p>{{s|s058|}}</p></li>
      <li data-righe="4" data-segna="f(h1, h2)@ok|zipWith(t1, t2, f)@ora"><p>{{s|s059|}}</p></li>
    </ol>
  </figure>
  <pre class="cod" data-lang="scala">zipWith(List(1, 2, 3), List(4, 5, 6, 7), _ + _)   // List(5, 7, 9) — il 7 resta fuori
addPairwise(l, r) == zipWith(l, r, _ + _)          // la vecchia funzione non serve più</pre>
  <figure class="scena" data-scena="zip" data-titolo="{{a|s060|}}"></figure>
</section>

<section>
  <h2>{{s|s061|}}</h2>
  <p>{{s|s062|}}</p>
  <figure class="scena" data-scena="zipwith" data-titolo="{{a|s063|}}"></figure>
  <figure class="codice" data-titolo="{{a|s064|}}">
<pre data-lang="scala">def hasSubsequence[A](sup: List[A], sub: List[A]): Boolean =
  @annotation.tailrec
  def startsWith(l: List[A], prefix: List[A]): Boolean = (l, prefix) match
    case (_, Nil) => true
    case (Cons(h1, t1), Cons(h2, t2)) => if h1 == h2 then startsWith(t1, t2) else false
    case _ => false
  sup match
    case Nil => sub == Nil
    case Cons(_, t) => startsWith(sup, sub) || hasSubsequence(t, sub)</pre>
    <ol class="spiega">
      <li data-righe="3" data-segna="startsWith@ora"><p>{{s|s065|}}</p></li>
      <li data-righe="4" data-segna="(_, Nil)@ok"><p>{{s|s066|}}</p></li>
      <li data-righe="5" data-segna="h1 == h2@ora"><p>{{s|s067|}}</p></li>
      <li data-righe="6" data-segna="case _ => false@no"><p>{{s|s068|}}</p></li>
      <li data-righe="9" data-segna="hasSubsequence(t, sub)@due"><p>{{s|s069|}}</p></li>
      <li data-righe="8" data-segna="sub == Nil@dato"><p>{{s|s070|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s071|}}">
    <div class="passo"><div class="espr"><mark class="ok">1</mark> <mark class="ok">2</mark> <mark class="no">1</mark> 2 3
<mark class="ok">1</mark> <mark class="ok">2</mark> <mark class="no">3</mark></div><p class="nota">{{s|s072|}}</p></div>
    <div class="passo"><div class="espr"><span class="barra">1</span> <mark class="no">2</mark> 1 2 3
  <mark class="no">1</mark> 2 3</div><p class="nota">{{s|s073|}}</p></div>
    <div class="passo"><div class="espr"><span class="barra">1 2</span> <mark class="ok">1</mark> <mark class="ok">2</mark> <mark class="ok">3</mark>
    <mark class="ok">1</mark> <mark class="ok">2</mark> <mark class="ok">3</mark></div><p class="nota">{{s|s074|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">true</mark></div><p class="nota">{{s|s075|}}</p></div>
  </figure>
</section>

</main>
</body>
</html>
