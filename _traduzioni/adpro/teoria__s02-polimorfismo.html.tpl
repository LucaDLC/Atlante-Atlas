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
SCENE.mappa = {
  w: 540, h: 230, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'L', tipo: 'celle', x: 40, y: 50, cw: 60, ch: 42, valori: ['1', '−2', '3'] },
    { id: 'f', tipo: 'nodo', forma: 'quadrato', r: 32, x: 290, y: 70, t: 'abs' },
    { id: 'R', tipo: 'celle', x: 360, y: 50, cw: 60, ch: 42, valori: ['', '', ''] },
    { id: 'tipi', tipo: 'testo', x: 270, y: 160, t: 'A = Int,  B = Int', size: 14, bold: true },
    { id: 'n', tipo: 'testo', x: 270, y: 205, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { L: { toni: { 0: 'dato' } }, f: { tono: 'ora' }, R: { valori: ['1', '', ''], toni: { 0: 'ok' } } } },
    { nota: '{{j|s005|'}}', set: { L: { toni: { 1: 'dato' } }, R: { valori: ['1', '2', ''], toni: { 1: 'ok' } } } },
    { nota: '{{j|s006|'}}', set: { L: { toni: { 2: 'dato' } }, R: { valori: ['1', '2', '3'], toni: { 2: 'ok' } }, n: { t: 'map(List(1, −2, 3))(abs) = List(1, 2, 3)', tono: 'ok' } } },
    { nota: '{{j|s007|'}}', set: { f: { t: '_.toString' }, R: { valori: ['"1"', '"-2"', '"3"'], toni: { 0: 'ok', 1: 'ok', 2: 'ok' } }, tipi: { t: 'A = Int,  B = String', tono: 'ora' }, n: { t: 'List("1", "-2", "3")', tono: 'ok' } } }
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

    SCENE.generalizza = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [
        T('s', 290, 30, 'def map(a: List[Int])(f: Int => Int): List[Int]', { bold: true, size: 13, tono: 'no' }),
        T('b', 290, 70, 'corpo: case Cons(h, tail) => Cons(f(h), map(tail)(f))', { size: 12 }),
        T('u1', 290, 140, '', { size: 12 }), T('u2', 290, 170, '', { size: 12 }), T('c', 290, 214, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "Una map <b>monomorfica</b>: funziona solo con liste di interi." },
        { nota: "Ma il corpo non fa niente di specifico con gli interi: non somma, non confronta. Chiama solo f.", set: { b: { tono: 'ok' } } },
        { nota: "Allora sostituisco i tipi con <b>segnaposto</b>: A per gli elementi di partenza, B per quelli di arrivo. Il corpo resta identico.", set: { s: { t: 'def map[A, B](a: List[A])(f: A => B): List[B]', tono: 'dato' } } },
        { nota: "Stessa funzione, tipi diversi: Int → String, String → Int. A e B possono anche essere uguali.", set: { u1: { t: 'map[Int, String](List(1, 2))(_.toString) → List("1", "2")', tono: 'ok' }, u2: { t: 'map[String, Int](List("ciao", "a"))(_.length) → List(4, 1)', tono: 'ok' } } },
        { nota: "È il <b>polimorfismo parametrico</b> (generics). Il polimorfismo delle classi, con il metodo scelto a runtime, è un'altra cosa: il dispatch dinamico della settimana 3.", set: { c: { t: 'polimorfismo parametrico = segnaposto di tipo' } } }
      ]
    };

    const og = [N('b', 150, 50, 'Br', 'spento', { r: 18 }), N('l1', 90, 130, '1', 'dato'), N('l2', 210, 130, '2', 'dato'), { id: 'e1', tipo: 'arco', da: 'b', a: 'l1' }, { id: 'e2', tipo: 'arco', da: 'b', a: 'l2' },
      R('f', 320, 30, 230, 40, 'f = ?', { tono: 'ora' }), T('c', 435, 110, '', { size: 12 }), T('c2', 290, 200, '', { size: 12, bold: true })];
    SCENE.buco = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: og,
      passi: [
        { nota: "Dentro la definizione di map sugli alberi, <code>f</code> è solo un <b>nome</b>: un buco. Non sappiamo cosa farà." },
        { nota: "La chiamata <code>map(Branch(Leaf(1), Leaf(2)))(_.toString)</code> riempie il buco: f = x =&gt; x.toString, quindi A = Int e B = String.", set: { f: { t: 'f = _.toString' }, c: { t: 'A = Int, B = String' } } },
        { nota: "È un Branch: la <b>stessa</b> f viene passata ai due rami.", set: { b: { tono: 'ora' } } },
        { nota: "Nelle foglie f(value) diventa value.toString: Branch(Leaf(\"1\"), Leaf(\"2\")).", set: { b: { tono: 'spento' }, l1: { t: '"1"', tono: 'ok' }, l2: { t: '"2"', tono: 'ok' }, c2: { t: 'Branch(Leaf("1"), Leaf("2"))', tono: 'ok' } } },
        { nota: "Un'altra chiamata, <code>map(albero)(_ * 10)</code>: la stessa definizione fa tutt'altro. <b>Cosa fa f lo decide chi chiama.</b>", set: { f: { t: 'f = _ * 10' }, c: { t: 'A = Int, B = Int' }, l1: { t: '10' }, l2: { t: '20' }, c2: { t: 'Branch(Leaf(10), Leaf(20))' } } }
      ]
    };

    const M = [['map(_ * 2)', ['1', '2', '3'], ['2', '4', '6']], ['filter(_ > 1)', ['1', '2', '3'], ['2', '3']], ['flatMap(x => List(x, x))', ['1', '2'], ['1', '1', '2', '2']], ['take(2)', ['1', '2', '3'], ['1', '2']], ['takeWhile(_ < 3)', ['1', '2', '5', '1'], ['1', '2']], ['forall(_ % 2 == 0)', ['2', '4'], ['true']], ['exists(_ % 2 == 0)', ['1', '3'], ['false']]];
    SCENE.libreria = {
      w: 580, h: 200, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [T('m', 290, 24, '', { bold: true }), C('a', 40, 50, ['', '', '', ''], { toni: {} }), T('fr', 290, 120, '↓', { size: 18 }), C('r', 40, 140, ['', '', '', ''], { toni: {} })],
      passi: [{ nota: "Dalla settimana 3 si usano le liste della <b>libreria</b>, dove queste funzioni sono metodi: si chiamano con il punto. (Nella settimana 2 invece solo la lista del corso.)" }].concat(M.map(([m, a, r], i) => ({
        nota: '{{j|s011|'}}' + m + '</code>: ' + ['<b>trasforma</b> ogni elemento con f; stessa lunghezza.', 'tiene gli elementi per cui p è <b>vero</b>.', 'f dà una <b>lista</b> per ogni elemento, poi le unisce in una sola.', 'i primi <b>n</b> elementi.', 'il <b>prefisso</b> finché p vale: al 5 si ferma, e l’1 finale non conta.', 'p vale per <b>tutti</b>? Un Boolean.', 'p vale per <b>almeno uno</b>? Nessun pari: false.'][i],
        set: { m: { t: 'List(' + a.join(', ') + ').' + m }, a: { valori: a.concat(['', '', '', '']).slice(0, 4), toni: Object.fromEntries(a.map((_, i) => [i, 'dato'])) }, r: { valori: r.concat(['', '', '', '']).slice(0, 4), toni: Object.fromEntries(r.map((_, i) => [i, 'ok'])) } }
      })))
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
      <div class="espr">def map(a: List[<mark class="dato">Int</mark>])(f: <mark class="dato">Int</mark> => <mark class="dato">Int</mark>): List[<mark class="dato">Int</mark>] = a match
  case Nil => Nil
  case Cons(h, tail) => Cons(f(h), map(tail)(f))</div>
      <p class="nota">{{s|s016|}}</p>
    </div>
    <div class="passo">
      <div class="espr">  case Cons(h, tail) => Cons(<mark class="ora">f(h)</mark>, map(tail)(f))</div>
      <p class="nota">{{s|s017|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def map<mark class="due">[A, B]</mark>(a: List[<mark class="dato">A</mark>])(f: <mark class="dato">A</mark> => <mark class="ok">B</mark>): List[<mark class="ok">B</mark>] = a match
  case Nil => Nil
  case Cons(h, tail) => Cons(f(h), map(tail)(f))</div>
      <p class="nota">{{s|s018|}}</p>
    </div>
    <div class="passo">
      <div class="espr">map[Int, String](List(1, 2))(_.toString)      →   List("1", "2")
map[String, Int](List("ciao", "a"))(_.length) →   List(4, 1)</div>
      <p class="nota">{{s|s019|}}</p>
    </div>
  </figure>
  <div class="box attenzione" data-tit="{{a|s020|}}">
    <p>{{s|s021|}}</p>
  </div>
  <figure class="scena" data-scena="generalizza" data-titolo="{{a|s022|}}"></figure>
</section>

<section>
  <h2>{{s|s023|}}</h2>
  <figure class="passi" data-titolo="{{a|s024|}}">
    <div class="passo"><div class="espr">map(Cons(<mark class="dato">1</mark>, Cons(-2, Cons(3, Nil))))(<mark class="ora">abs</mark>)</div><p class="nota">{{s|s025|}}</p></div>
    <div class="passo"><div class="espr">Cons(<mark class="ora">abs(1)</mark>, map(Cons(<mark class="dato">-2</mark>, Cons(3, Nil)))(abs))</div><p class="nota">{{s|s026|}}</p></div>
    <div class="passo"><div class="espr">Cons(1, Cons(<mark class="ora">abs(-2)</mark>, map(Cons(<mark class="dato">3</mark>, Nil))(abs)))</div><p class="nota">{{s|s027|}}</p></div>
    <div class="passo"><div class="espr">Cons(1, Cons(2, Cons(<mark class="ora">abs(3)</mark>, map(<mark class="dato">Nil</mark>)(abs))))</div><p class="nota">{{s|s028|}}</p></div>
    <div class="passo"><div class="espr">Cons(1, Cons(2, Cons(3, <mark class="ok">Nil</mark>)))</div><p class="nota">{{s|s029|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">List(1, 2, 3)</mark></div><p class="nota">{{s|s030|}}</p></div>
  </figure>
  <figure class="scena" data-scena="mappa" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <p>{{s|s033|}}</p>
  <figure class="passi" data-titolo="{{a|s034|}}">
    <div class="passo">
      <div class="espr">def map[A, B](t: Tree[A])(<mark class="ora">f</mark>: A => B): Tree[B] = t match
  case Leaf(value)         => Leaf(<mark class="ora">f</mark>(value))
  case Branch(left, right) => Branch(map(left)(<mark class="ora">f</mark>), map(right)(<mark class="ora">f</mark>))</div>
      <p class="nota">{{s|s035|}}</p>
    </div>
    <div class="passo">
      <div class="espr">map(<mark class="dato">Branch(Leaf(1), Leaf(2))</mark>)(<mark class="ora">_.toString</mark>)</div>
      <p class="nota">{{s|s036|}}</p>
    </div>
    <div class="passo">
      <div class="espr">Branch(map(Leaf(1))(<mark class="ora">_.toString</mark>), map(Leaf(2))(<mark class="ora">_.toString</mark>))</div>
      <p class="nota">{{s|s037|}}</p>
    </div>
    <div class="passo">
      <div class="espr">Branch(Leaf(<mark class="ora">1.toString</mark>), Leaf(<mark class="ora">2.toString</mark>))</div>
      <p class="nota">{{s|s038|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">Branch(Leaf("1"), Leaf("2"))</mark></div>
      <p class="nota">{{s|s039|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="buco" data-titolo="{{a|s040|}}"></figure>
</section>

<section>
  <h2>{{s|s041|}}</h2>
  <p>{{s|s042|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s043|}}</th><th>{{s|s044|}}</th><th>{{s|s045|}}</th><th>{{s|s046|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td><td>{{s|s050|}}</td></tr>
      <tr><td>{{s|s051|}}</td><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr>
      <tr><td>{{s|s055|}}</td><td>{{s|s056|}}</td><td>{{s|s057|}}</td><td>{{s|s058|}}</td></tr>
      <tr><td>{{s|s059|}}</td><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>{{s|s062|}}</td></tr>
      <tr><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>{{s|s066|}}</td></tr>
      <tr><td>{{s|s067|}}</td><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td></tr>
      <tr><td>{{s|s071|}}</td><td>{{s|s072|}}</td><td>{{s|s073|}}</td><td>{{s|s074|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box attenzione" data-tit="{{a|s075|}}">
    <p>{{s|s076|}}</p>
  </div>
  <figure class="scena" data-scena="libreria" data-titolo="{{a|s077|}}"></figure>
</section>

</main>
</body>
</html>
