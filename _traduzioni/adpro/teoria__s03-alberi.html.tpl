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
  const nodi = [
    { id: 'R', tipo: 'nodo', forma: 'quadrato', r: 20, x: 250, y: 45, t: 'B' },
    { id: 'L', tipo: 'nodo', forma: 'quadrato', r: 20, x: 150, y: 130, t: 'B' },
    { id: 'f3', tipo: 'nodo', x: 350, y: 130, t: '3' },
    { id: 'f1', tipo: 'nodo', x: 90, y: 215, t: '1' },
    { id: 'f5', tipo: 'nodo', x: 210, y: 215, t: '5' },
    { id: 'eRL', tipo: 'arco', da: 'R', a: 'L' },
    { id: 'eR3', tipo: 'arco', da: 'R', a: 'f3' },
    { id: 'eL1', tipo: 'arco', da: 'L', a: 'f1' },
    { id: 'eL5', tipo: 'arco', da: 'L', a: 'f5' }
  ];
  SCENE.size = {
    w: 440, h: 260,
    codice: { lang: 'scala', testo: `def size[A](t: Tree[A]): Int = t match
  case Leaf(_) => 1
  case Branch(left, right) =>
    1 + size(left) + size(right)` },
    oggetti: nodi,
    passi: [
      { nota: '{{j|s002|'}}', righe: [1] },
      { nota: '{{j|s003|'}}', righe: [3, 4], set: { R: { tono: 'due', sopra: 'aspetta' } } },
      { nota: '{{j|s004|'}}', righe: [3, 4], set: { L: { tono: 'due', sotto: 'aspetta' } } },
      { nota: '{{j|s005|'}}', righe: [2], set: { f1: { tono: 'ok', sotto: 'size 1' } } },
      { nota: '{{j|s006|'}}', righe: [2], set: { f5: { tono: 'ok', sotto: 'size 1' } } },
      { nota: '{{j|s007|'}}', righe: [4], set: { L: { tono: 'ok', sotto: 'size 3' } } },
      { nota: '{{j|s008|'}}', righe: [2], set: { f3: { tono: 'ok', sotto: 'size 1' } } },
      { nota: '{{j|s009|'}}', righe: [4], set: { R: { tono: 'ok', sopra: 'size 5' } } }
    ]
  };
  SCENE.maximum = {
    w: 440, h: 260,
    codice: { lang: 'scala', testo: `def maximum(t: Tree[Int]): Int = t match
  case Leaf(value) => value
  case Branch(left, right) =>
    maximum(left).max(maximum(right))` },
    oggetti: nodi,
    passi: [
      { nota: '{{j|s010|'}}', righe: [1] },
      { nota: '{{j|s011|'}}', righe: [2], set: { f1: { tono: 'dato', sotto: 'max 1' } } },
      { nota: '{{j|s012|'}}', righe: [2], set: { f5: { tono: 'dato', sotto: 'max 5' } } },
      { nota: '{{j|s013|'}}', righe: [4], set: { L: { tono: 'ora', sotto: 'max 5' }, f1: { tono: 'spento' } } },
      { nota: '{{j|s014|'}}', righe: [2], set: { f3: { tono: 'dato', sotto: 'max 3' } } },
      { nota: '{{j|s015|'}}', righe: [4], set: { R: { tono: 'ok', sopra: 'max 5' }, f3: { tono: 'spento' } } }
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
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});
  const A = (id, da, a, extra) => Object.assign({ id, tipo: 'arco', da, a }, extra || {});

    SCENE.tipoalbero = {
      w: 560, h: 240, lato: true,
      legenda: '{{j|s016|'}}',
      oggetti: [
        N('b1', 200, 40, 'Br', 'due', { forma: 'quadrato', r: 18, nascosto: true }), N('l1', 120, 120, '1', 'dato', { nascosto: true }), N('b2', 280, 120, 'Br', 'due', { forma: 'quadrato', r: 18, nascosto: true }),
        N('l2', 220, 200, '2', 'dato', { nascosto: true }), N('l3', 340, 200, '3', 'dato', { nascosto: true }),
        A('e1', 'b1', 'l1', { nascosto: true }), A('e2', 'b1', 'b2', { nascosto: true }), A('e3', 'b2', 'l2', { nascosto: true }), A('e4', 'b2', 'l3', { nascosto: true }),
        T('c', 440, 100, '', { size: 12 }), T('c2', 440, 130, '', { size: 12 })
      ],
      passi: [
        { nota: "<code>enum Tree[+A]</code>: due forme. <b>Leaf(value)</b>, una foglia, contiene un valore.", set: { l2: { nascosto: false }, c: { t: 'Leaf(2)' } } },
        { nota: "<b>Branch(left, right)</b>, un ramo, contiene due alberi e <b>nessun valore</b>.", set: { l3: { nascosto: false }, b2: { nascosto: false }, e3: { nascosto: false }, e4: { nascosto: false }, c: { t: 'Branch(Leaf(2), Leaf(3))' } } },
        { nota: "Anche un ramo può essere figlio di un ramo: il tipo è ricorsivo. Questo è <code>Branch(Leaf(1), Branch(Leaf(2), Leaf(3)))</code>.", set: { b1: { nascosto: false }, l1: { nascosto: false }, e1: { nascosto: false }, e2: { nascosto: false }, c: { t: 'Branch(Leaf(1),' }, c2: { t: '  Branch(Leaf(2), Leaf(3)))' } } },
        { nota: "Non esiste un albero vuoto e non esiste null: un ramo ha <b>sempre</b> due figli. Non si scrive t.left != null: si chiede la forma con match. Per questo maximum ha sempre una risposta, senza Option.", set: { c: { t: 'niente vuoto, niente null', tono: 'no' }, c2: { t: 'Leaf: valore · Branch: 2 figli' } } }
      ]
    };

    SCENE.maptree = {
      w: 560, h: 150,
      codice: { lang: 'scala', testo: `def map[A, B](t: Tree[A])(f: A => B): Tree[B] = t match
  case Leaf(value) => Leaf(f(value))
  case Branch(left, right) => Branch(map(left)(f), map(right)(f))` },
      legenda: '{{j|s017|'}}',
      oggetti: [N('b', 140, 30, 'Br', 'due', { forma: 'quadrato', r: 16 }), N('l1', 80, 100, '1', 'dato'), N('l2', 200, 100, '2', 'dato'), A('e1', 'b', 'l1'), A('e2', 'b', 'l2'), T('c', 400, 60, 'map(t)(_ * 10)', { bold: true }), T('c2', 400, 100, '', { size: 12 })],
      passi: [
        { nota: "<code>map(Branch(Leaf(1), Leaf(2)))(_ * 10)</code>: stessa forma, valori trasformati.", righe: [1] },
        { nota: "È un Branch: il ramo <b>resta un ramo</b>, e la map scende nei due figli con la stessa f.", righe: [3], set: { b: { tono: 'ora' } } },
        { nota: "Nelle foglie si applica f e si rimette il risultato <b>in una Leaf</b>: Leaf(10), Leaf(20).", righe: [2], set: { b: { tono: 'due' }, l1: { t: '10', tono: 'ok' }, l2: { t: '20', tono: 'ok' }, c: { t: 'Branch(Leaf(10), Leaf(20))', tono: 'ok' } } },
        { nota: "Errore tipico: <code>case Leaf(value) =&gt; value.toString()</code> → Found: String, Required: Tree[B]. Due problemi: non sai che f è toString (scrivi f(value)), e il risultato va rimesso in una foglia: <code>Leaf(f(value))</code>.", righe: [2], set: { c2: { t: 'Found String, Required Tree[B]', tono: 'no' } } }
      ]
    };

    const og = [N('b', 140, 40, 'Br', 'due', { forma: 'quadrato', r: 16 }), N('l1', 80, 120, '7', 'dato'), N('l2', 200, 120, '9', 'dato'), A('e1', 'b', 'l1'), A('e2', 'b', 'l2'),
      T('fn', 420, 30, '', { bold: true, size: 12 }), T('g', 420, 70, '', { size: 12 }), T('f', 420, 100, '', { size: 12 }),
      T('r1', 80, 170, '', { size: 12, tono: 'ok' }), T('r2', 200, 170, '', { size: 12, tono: 'ok' }), T('rb', 140, 210, '', { bold: true, tono: 'ok' })];
    const caso = (nome, g, f, v1, v2, vb) => ({ fn: { t: nome }, g: { t: 'g (foglia): ' + g }, f: { t: 'f (ramo): ' + f }, r1: { t: v1 }, r2: { t: v2 }, rb: { t: vb } });
    SCENE.foldtree = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s018|'}}',
      oggetti: og,
      passi: [
        { nota: "size, maximum e map fanno tutte due cose: qualcosa con le <b>foglie</b> (g: A =&gt; B) e qualcosa per <b>combinare</b> i due risultati di un ramo (f: (B, B) =&gt; B). <code>fold</code> prende proprio quelle due funzioni. Albero: Branch(Leaf(7), Leaf(9))." },
        { nota: "<b>size</b>: g = _ =&gt; 1 (conta 1, ignora il valore); f = (l, r) =&gt; 1 + l + r. Foglie: 1 e 1. Ramo: 1 + 1 + 1 = 3.", set: caso('size', '_ => 1', '(l, r) => 1 + l + r', '1', '1', '3') },
        { nota: "<b>maximum</b>: g = identity (il valore stesso); f = _ max _. Foglie: 7 e 9. Ramo: 7 max 9 = 9.", set: caso('maximum', 'identity', '_ max _', '7', '9', '9') },
        { nota: "<b>map</b> (con f' = _ * 10): g = a =&gt; Leaf(f'(a)); f = Branch(_, _), che rimette i due alberi in un ramo. Risultato: Branch(Leaf(70), Leaf(90)).", set: caso('map(_ * 10)', 'a => Leaf(a * 10)', 'Branch(_, _)', 'Leaf(70)', 'Leaf(90)', 'Branch(Leaf(70), Leaf(90))') },
        { nota: "Una definizione, tre funzioni: cambiano solo g e f. Foglia → g, ramo → f dei due fold dei figli.", set: { fn: { t: 'fold(t)(f)(g)' }, g: { t: 'Leaf(v) => g(v)' }, f: { t: 'Branch(l, r) => f(fold(l), fold(r))' } } }
      ]
    };

    SCENE.trattini = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s019|'}}',
      oggetti: [T('e', 290, 40, '', { bold: true, size: 15 }), T('s', 290, 80, '', { size: 12 }), T('p', 290, 130, '', { size: 13 }), T('c', 290, 190, '', { size: 12 })],
      passi: [
        { nota: "Tre pezzi di sintassi di questa pagina. Primo: <code>identity</code>, la funzione che restituisce il suo argomento. identity(42) = 42. In maximum il valore della foglia è già il risultato.", set: { e: { t: 'identity  =  v => v' }, s: { t: 'identity(42) = 42' } } },
        { nota: "Il trattino basso ha tre usi. Dopo <code>case</code>: il valore c'è, ma lo <b>butto</b>.", set: { e: { t: 'case Leaf(_) => 1', tono: 'spento' }, s: { t: 'scarto: il valore non serve' } } },
        { nota: "Prima di una freccia: un parametro che arriva e che <b>ignoro</b>.", set: { e: { t: '_ => 1', tono: 'spento' }, s: { t: 'parametro ignorato' } } },
        { nota: "Dentro un'espressione, senza freccia: <b>segnaposto</b>. Ogni _ diventa un parametro, in ordine: Scala costruisce una funzione.", set: { e: { t: 'Branch(_, _)', tono: 'ora' }, s: { t: 'segnaposto' }, p: { t: '= (x, y) => Branch(x, y)', tono: 'ok' } } },
        { nota: "Test: sostituisci _ con x. Se ha senso così, era uno scarto; se devi aggiungere x =&gt; davanti, era un segnaposto. Terzo pezzo: <code>fold[A, Tree[B]]</code>, tipi scritti a mano, perché senza Scala deduce Tree[Any].", set: { e: { t: 'fold[A, Tree[B]](t)(Branch(_, _))(a => Leaf(f(a)))', tono: null }, s: { t: 'senza [A, Tree[B]]: Found Tree[Any], Required Tree[B]' }, p: { t: '' }, c: { t: 'tipi a mano quando Scala deduce troppo generico' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s020|}}</h1>
  <p class="lede">{{s|s021|}}</p>
</header>

<section>
  <h2>{{s|s022|}}</h2>
  <figure class="codice" data-titolo="{{a|s023|}}">
<pre data-lang="scala">enum Tree[+A]:
  case Leaf(value: A)
  case Branch(left: Tree[A], right: Tree[A])</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="Leaf(value: A)@dato"><p>{{s|s024|}}</p></li>
      <li data-righe="3" data-segna="Branch(left: Tree[A], right: Tree[A])@due"><p>{{s|s025|}}</p></li>
      <li data-righe="1-3"><p>{{s|s026|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s027|}}">
    <p>{{s|s028|}}</p>
  </div>
  <figure class="scena" data-scena="tipoalbero" data-titolo="{{a|s029|}}"></figure>
</section>

<section>
  <h2>{{s|s030|}}</h2>
  <figure class="scena" data-scena="size" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <figure class="scena" data-scena="maximum" data-titolo="{{a|s033|}}"></figure>
  <div class="box attenzione" data-tit="{{a|s034|}}">
    <p>{{s|s035|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s036|}}</h2>
  <pre class="cod" data-lang="scala">def map[A, B](t: Tree[A])(f: A => B): Tree[B] = t match
  case Leaf(value) => Leaf(f(value))
  case Branch(left, right) => Branch(map(left)(f), map(right)(f))</pre>
  <figure class="passi" data-titolo="{{a|s037|}}">
    <div class="passo"><div class="espr">map(<mark class="dato">Branch(Leaf(1), Leaf(2))</mark>)(<mark class="ora">_ * 10</mark>)</div><p class="nota">{{s|s038|}}</p></div>
    <div class="passo"><div class="espr">Branch(map(<mark class="dato">Leaf(1)</mark>)(<mark class="ora">_ * 10</mark>), map(<mark class="dato">Leaf(2)</mark>)(<mark class="ora">_ * 10</mark>))</div><p class="nota">{{s|s039|}}</p></div>
    <div class="passo"><div class="espr">Branch(Leaf(<mark class="ora">1 * 10</mark>), Leaf(<mark class="ora">2 * 10</mark>))</div><p class="nota">{{s|s040|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">Branch(Leaf(10), Leaf(20))</mark></div><p class="nota">{{s|s041|}}</p></div>
  </figure>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">case Leaf(value) => value.toString()</pre>
      <pre class="msg">Found:    String
Required: Tree[B]</pre>
      <div class="fix">Due problemi. 1) Non sai che <code>f</code> è <code>toString</code>: lo decide chi chiama, tu scrivi <code>f(value)</code>. 2) Il risultato va rimesso in una foglia: <code>Leaf(f(value))</code>.</div>
    </div>
  </div>
  <figure class="scena" data-scena="maptree" data-titolo="{{a|s042|}}"></figure>
</section>

<section>
  <h2>{{s|s043|}}</h2>
  <p>{{s|s044|}}</p>
  <figure class="codice" data-titolo="{{a|s045|}}">
<pre data-lang="scala">def fold[A, B](t: Tree[A])(f: (B, B) => B)(g: A => B): B = t match
  case Leaf(value) => g(value)
  case Branch(left, right) => f(fold(left)(f)(g), fold(right)(f)(g))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="[A, B]@due"><p>{{s|s046|}}</p></li>
      <li data-righe="1" data-segna="(g: A => B)@dato"><p>{{s|s047|}}</p></li>
      <li data-righe="1" data-segna="(f: (B, B) => B)@ora"><p>{{s|s048|}}</p></li>
      <li data-righe="2" data-segna="g(value)@dato"><p>{{s|s049|}}</p></li>
      <li data-righe="3" data-segna="f(@ora"><p>{{s|s050|}}</p></li>
    </ol>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s051|}}</th><th>{{s|s052|}}</th><th>{{s|s053|}}</th><th>{{s|s054|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s055|}}</td><td>{{s|s056|}}</td><td>{{s|s057|}}</td><td>{{s|s058|}}</td></tr>
      <tr><td>{{s|s059|}}</td><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>{{s|s062|}}</td></tr>
      <tr><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>{{s|s066|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="passi" data-titolo="{{a|s067|}}">
    <div class="passo"><div class="espr">fold(<mark class="dato">Branch(Leaf(7), Leaf(9))</mark>)(<mark class="ora">(l, r) => 1 + l + r</mark>)(<mark class="due">_ => 1</mark>)</div><p class="nota">{{s|s068|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">f</mark>(fold(Leaf(7))(f)(g), fold(Leaf(9))(f)(g))</div><p class="nota">{{s|s069|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">f</mark>(<mark class="due">g(7)</mark>, <mark class="due">g(9)</mark>)  =  f(<mark class="due">1</mark>, <mark class="due">1</mark>)</div><p class="nota">{{s|s070|}}</p></div>
    <div class="passo"><div class="espr">1 + 1 + 1  =  <mark class="ok">3</mark></div><p class="nota">{{s|s071|}}</p></div>
  </figure>
  <figure class="scena" data-scena="foldtree" data-titolo="{{a|s072|}}"></figure>
</section>

<section>
  <h2>{{s|s073|}}</h2>
  <h3>{{s|s074|}}</h3>
  <p>{{s|s075|}}</p>
  <h3>{{s|s076|}}</h3>
  <figure class="passi" data-titolo="{{a|s077|}}">
    <div class="passo"><div class="espr">case Leaf(<mark class="no">_</mark>) => 1</div><p class="nota">{{s|s078|}}</p></div>
    <div class="passo"><div class="espr">(<mark class="no">_</mark>) => 1   <span class="mano">// cioè  _ => 1</span></div><p class="nota">{{s|s079|}}</p></div>
    <div class="passo"><div class="espr">Branch(<mark class="ora">_</mark>, <mark class="due">_</mark>)</div><p class="nota">{{s|s080|}}</p></div>
    <div class="passo"><div class="espr">Branch(<mark class="ora">_</mark>, <mark class="due">_</mark>)   =   (<mark class="ora">x</mark>, <mark class="due">y</mark>) => Branch(<mark class="ora">x</mark>, <mark class="due">y</mark>)</div><p class="nota">{{s|s081|}}</p></div>
  </figure>
  <div class="box regola" data-tit="{{a|s082|}}">
    <p>{{s|s083|}}</p>
  </div>
  <h3>{{s|s084|}}</h3>
  <p>{{s|s085|}}</p>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def map1[A, B](t: Tree[A])(f: A => B): Tree[B] =
  fold(t)(Branch(_, _))(a => Leaf(f(a)))</pre>
      <pre class="msg">Found:    Tree[Any]
Required: Tree[B]</pre>
      <div class="fix">Senza tipi, Scala deduce un <code>B</code> troppo generico (<code>Tree[Any]</code>). Scrivi <code>fold[A, Tree[B]](t)(…)(…)</code> (verificato: così compila).</div>
    </div>
  </div>
  <figure class="scena" data-scena="trattini" data-titolo="{{a|s086|}}"></figure>
</section>

</main>
</body>
</html>
