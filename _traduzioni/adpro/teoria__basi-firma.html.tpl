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
SCENE.sostituisci = {
  w: 600, h: 250, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'f1', tipo: 'testo', x: 20, y: 40, t: 'def isSorted[A](as: Array[A], ordered: (A, A) => Boolean): Boolean', size: 13, anchor: 'start', tono: 'dato' },
    { id: 'c', tipo: 'testo', x: 20, y: 90, t: '', size: 13, anchor: 'start' },
    { id: 'f2', tipo: 'testo', x: 20, y: 130, t: '', size: 13, anchor: 'start' },
    { id: 'p', tipo: 'testo', x: 20, y: 170, t: '', size: 13, anchor: 'start' },
    { id: 'e', tipo: 'testo', x: 20, y: 210, t: '', size: 13, anchor: 'start' }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { c: { t: 'isSorted[Int](Array(1, 2, 3), (x, y) => x <= y)', tono: 'ora' } } },
    { nota: '{{j|s005|'}}', set: { f2: { t: 'def isSorted(as: Array[Int], ordered: (Int, Int) => Boolean): Boolean', tono: 'ok' } } },
    { nota: '{{j|s006|'}}', set: { p: { t: 'as = Array(1, 2, 3)     ordered = (x, y) => x <= y', tono: 'ora' } } },
    { nota: '{{j|s007|'}}', set: { e: { t: 'ordered(as(0), as(1)) = 1 <= 2 = true', tono: 'ok' } } }
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

  // 1. la firma, pezzo per pezzo
  const P = [['def', 40], ['isSorted', 80], ['[A]', 40], ['as: Array[A]', 105], ['ordered: (A, A) => Boolean', 190], [': Boolean =', 90]];
  const og1 = []; let x = 10;
  P.forEach(([t, w], i) => { og1.push(R('p' + i, x, 40, w, 34, t, { tono: 'spento' })); x += w + 6; });
  og1.push(T('sp', 300, 120, '', { size: 13, bold: true }), T('sp2', 300, 148, '', { size: 12 }), T('ch', 300, 200, '', { size: 12 }));
  const acc = (i, a, b) => Object.assign(Object.fromEntries(P.map((_, k) => ['p' + k, { tono: k === i ? 'ora' : (k < i ? 'dato' : 'spento') }])), { sp: { t: a }, sp2: { t: b || '' } });
  SCENE.firma = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: og1,
    passi: [
      { nota: "La firma di <code>isSorted</code> (esercizio 4, settimana 1), divisa nei suoi sei pezzi. Si legge da sinistra a destra, un pezzo alla volta." },
      { nota: "<code>def</code>: sto definendo una funzione. È la parola chiave, come un metodo in Java.", set: acc(0, 'def', 'sto definendo una funzione') },
      { nota: "Il <b>nome</b>: con questo la chiamerai, <code>isSorted(…)</code>.", set: acc(1, 'il nome', 'isSorted(…) per chiamarla') },
      { nota: "<code>[A]</code>: un <b>segnaposto per un tipo</b>. Non è un valore. Chi chiama sceglie cosa diventa A, e ogni A della firma diventa lo stesso tipo.", set: acc(2, 'parametro di tipo', 'lo sceglie chi chiama: Int, String…') },
      { nota: "Primo parametro, scritto <b>nome: tipo</b> (al contrario di Java). as è un array di elementi di tipo A.", set: acc(3, 'primo parametro', 'nome: tipo') },
      { nota: "Secondo parametro: <code>ordered</code>. Il suo tipo ha una freccia: è una <b>funzione</b> che prende due A e dà un Boolean.", set: acc(4, 'secondo parametro: una funzione', 'prende due A, dà un Boolean') },
      { nota: "Dopo la parentesi chiusa, il <b>tipo del risultato</b>: Boolean. Poi <code>=</code> e il corpo, un'espressione. Niente return.", set: acc(5, 'tipo del risultato', 'dopo = viene il corpo') },
      { nota: "Nella chiamata <code>isSorted(Array(1, 3, 2), _ &lt;= _)</code> tutto si riempie: A = Int, as = Array(1, 3, 2), ordered = (x, y) =&gt; x &lt;= y. Risultato: false, perché 3 &lt;= 2 è falso.", set: Object.assign(Object.fromEntries(P.map((_, k) => ['p' + k, { tono: 'ok' }])), { p2: { t: '[Int]', tono: 'ok' }, p3: { t: 'Array(1, 3, 2)', tono: 'ok' }, p4: { t: '_ <= _', tono: 'ok' }, sp: { t: 'chiamata: A = Int' }, sp2: { t: '' }, ch: { t: 'isSorted(Array(1, 3, 2), _ <= _)  →  false', tono: 'ok' } }) }
    ]
  };

  // 2. il tipo di una funzione
  SCENE.freccia = {
    w: 560, h: 220, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      T('tipo', 280, 26, 'Int => Boolean', { bold: true, size: 15 }),
      R('in', 30, 80, 110, 44, '', { tono: 'dato' }), R('fn', 200, 70, 160, 64, 'x => x < 0', { tono: 'ora' }), R('out', 420, 80, 110, 44, '', { tono: 'due' }),
      F('a1', 142, 102, 196, 102, ''), F('a2', 362, 102, 416, 102, ''),
      T('l1', 85, 150, 'entra', { size: 12 }), T('l2', 475, 150, 'esce', { size: 12 }),
      T('c', 280, 196, '', { size: 12 })
    ],
    passi: [
      { nota: "Il tipo di una funzione si scrive con la freccia: <b>a sinistra cosa entra, a destra cosa esce</b>. <code>Int =&gt; Boolean</code>: entra un Int, esce un Boolean." },
      { nota: "Un valore di quel tipo: <code>x =&gt; x &lt; 0</code>. Entra 5…", set: { in: { t: '5' }, out: { t: 'false' } } },
      { nota: "…entra −3: esce true. Il tipo dice solo la <b>forma</b>; cosa fa la funzione lo decide chi la scrive.", set: { in: { t: '-3' }, out: { t: 'true' } } },
      { nota: "Con due argomenti: <code>(Int, Int) =&gt; Int</code>, per esempio <code>(x, y) =&gt; x + y</code>. Le parentesi a sinistra raccolgono gli argomenti.", set: { tipo: { t: '(Int, Int) => Int' }, fn: { t: '(x, y) => x + y' }, in: { t: '2, 3' }, out: { t: '5' } } },
      { nota: "Senza argomenti: <code>() =&gt; A</code>. Non entra niente, esce un A quando la chiami con <code>()</code>. È la \"ricetta\" (thunk) della settimana 4.", set: { tipo: { t: '() => Int' }, fn: { t: '() => 42' }, in: { t: '( )' }, out: { t: '42' }, c: { t: 'f: A => B dice la forma, non cosa fa f' } } }
    ]
  };

  // 3. frecce annidate
  SCENE.matrioska = {
    w: 580, h: 230, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      R('est', 20, 30, 540, 120, '', { tono: 'spento' }), T('et', 110, 50, 'Array[A] =>', { bold: true }),
      R('int', 190, 60, 350, 76, '', { tono: 'spento' }), T('it', 365, 80, '((A, A) => Boolean) => Boolean', { bold: true, size: 12 }),
      T('call', 290, 180, 'isSortedCurried', { size: 13, bold: true }), T('ris', 290, 210, '', { size: 12 })
    ],
    passi: [
      { nota: "<code>Array[A] =&gt; ((A, A) =&gt; Boolean) =&gt; Boolean</code>. Più frecce di fila si leggono <b>da destra</b>: X =&gt; Y =&gt; Z vuol dire X =&gt; (Y =&gt; Z). Scatola esterna: entra un array." },
      { nota: "Dato l'array, esce la scatola interna: <b>un'altra funzione</b>, non ancora un Boolean.", set: { est: { tono: 'dato' }, call: { t: 'isSortedCurried(Array(1, 2, 3))' }, ris: { t: 'risultato: una funzione ((A, A) => Boolean) => Boolean' } } },
      { nota: "La funzione interna aspetta il criterio, una funzione (A, A) =&gt; Boolean. Le parentesi tonde intorno servono: il criterio è <b>un argomento</b>, non il risultato.", set: { int: { tono: 'ora' }, call: { t: 'isSortedCurried(Array(1, 2, 3))(_ <= _)' }, ris: { t: '' } } },
      { nota: "Dato anche il criterio, finalmente esce il Boolean: true. Nella chiamata c'è <b>una coppia di parentesi per ogni freccia esterna</b>.", set: { ris: { t: 'risultato: true', tono: 'ok' } } }
    ]
  };

  // 4. più liste di parametri
  SCENE.liste = {
    w: 580, h: 240, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      T('sig', 290, 24, 'def map[A, B](t: Tree[A])(f: A => B): Tree[B]', { bold: true, size: 12 }),
      R('s1', 150, 50, 130, 34, '( t = ? )', { tono: 'spento' }), R('s2', 300, 50, 130, 34, '( f = ? )', { tono: 'spento' }),
      N('r', 120, 140, '•', 'spento', { r: 12 }), N('l1', 70, 200, '1', 'dato', { r: 16 }), N('l2', 170, 200, '2', 'dato', { r: 16 }),
      { id: 'e1', tipo: 'arco', da: 'r', a: 'l1' }, { id: 'e2', tipo: 'arco', da: 'r', a: 'l2' },
      N('r2', 460, 140, '•', 'spento', { r: 12, nascosto: true }), N('m1', 410, 200, '"1"', 'ok', { r: 18, nascosto: true }), N('m2', 510, 200, '"2"', 'ok', { r: 18, nascosto: true }),
      { id: 'e3', tipo: 'arco', da: 'r2', a: 'm1', nascosto: true }, { id: 'e4', tipo: 'arco', da: 'r2', a: 'm2', nascosto: true },
      T('c', 290, 120, '', { size: 12 })
    ],
    passi: [
      { nota: "<code>map</code> sugli alberi ha <b>due liste di parametri</b>: due coppie di parentesi. Nella chiamata ne scrivi lo stesso numero, nello stesso ordine." },
      { nota: "Prima lista: l'albero, qui con foglie Int. Allora A = Int.", set: { s1: { t: '( albero )', tono: 'dato' }, c: { t: 'A = Int' } } },
      { nota: "Seconda lista: la funzione, <code>_.toString</code>. Allora B = String. Da sola, la firma A =&gt; B non diceva quale trasformazione: la decide questa chiamata.", set: { s2: { t: '( _.toString )', tono: 'ora' }, c: { t: 'A = Int, B = String' } } },
      { nota: "Risultato: un albero con la <b>stessa forma</b> e le foglie trasformate, un Tree[String]. Scrivere <code>map(albero, f)</code>, con una sola coppia di parentesi, non compila.", set: { r2: { nascosto: false }, m1: { nascosto: false }, m2: { nascosto: false }, e3: { nascosto: false }, e4: { nascosto: false }, c: { t: 'map(albero)(_.toString): Tree[String]', tono: 'ok' } } }
    ]
  };

  // 5. metodi dentro un enum
  SCENE.metodoenum = {
    w: 540, h: 170,
    codice: { lang: 'scala', testo: `enum Option[+A]:
  case Some(get: A)
  case None
  def map[B](f: A => B): Option[B] = this match
    case None    => None
    case Some(a) => Some(f(a))` },
    legenda: '{{j|s012|'}}',
    oggetti: [
      T('call', 270, 30, 'Some(3).map(_ + 1)', { bold: true, size: 15 }),
      R('th', 40, 70, 140, 40, 'this = ?', { tono: 'spento' }), R('fa', 200, 70, 140, 40, 'f = _ + 1', { tono: 'spento' }), R('ri', 360, 70, 140, 40, '?', { tono: 'spento' }),
      T('c', 270, 145, '', { size: 12 })
    ],
    passi: [
      { nota: "Dalla settimana 3 le funzioni su Option sono <b>metodi</b> dentro l'enum. L'A nasce sull'enum: <code>Option[+A]</code>.", righe: [1], set: { c: { t: 'A è il tipo dentro l’Option' } } },
      { nota: "Il metodo aggiunge solo il suo segnaposto nuovo, <code>[B]</code>: A lo conosce già, perché vive dentro Option[A].", righe: [4], set: { c: { t: 'map[B]: B nuovo, A dall’enum' } } },
      { nota: "Manca il parametro \"option su cui lavoro\": è <code>this</code>, l'oggetto prima del punto. In <code>Some(3).map(_ + 1)</code>, this = Some(3) e A = Int.", righe: [4], set: { th: { t: 'this = Some(3)', tono: 'ora' }, fa: { tono: 'dato' }, c: { t: 'A = Int, B = Int' } } },
      { nota: "<code>this match</code>: this è un Some, quindi il secondo caso, con a = 3.", righe: [6], set: { ri: { t: 'Some(f(3))' } } },
      { nota: "f(3) = 3 + 1 = 4. Risultato: <b>Some(4)</b>. Con None il primo caso restituirebbe None senza mai chiamare f.", righe: [6], set: { ri: { t: 'Some(4)', tono: 'ok' }, c: { t: 'None.map(_ + 1) = None: f non viene chiamata' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s013|}}</h1>
  <p class="lede">{{s|s014|}}</p>
</header>

<section>
  <h2>{{s|s015|}}</h2>
  <p>{{s|s016|}}</p>
  <pre class="cod" data-lang="scala">def isSorted[A](as: Array[A], ordered: (A, A) => Boolean): Boolean =</pre>

  <figure class="passi" data-titolo="{{a|s017|}}">
    <div class="passo">
      <div class="espr"><mark class="ora">def</mark> isSorted[A](as: Array[A], ordered: (A, A) => Boolean): Boolean =</div>
      <p class="nota">{{s|s018|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def <mark class="ora">isSorted</mark>[A](as: Array[A], ordered: (A, A) => Boolean): Boolean =</div>
      <p class="nota">{{s|s019|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def isSorted<mark class="due">[A]</mark>(as: Array[<mark class="due">A</mark>], ordered: (<mark class="due">A</mark>, <mark class="due">A</mark>) => Boolean): Boolean =</div>
      <p class="nota">{{s|s020|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def isSorted[A](<mark class="dato">as: Array[A]</mark>, ordered: (A, A) => Boolean): Boolean =</div>
      <p class="nota">{{s|s021|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def isSorted[A](as: Array[A], <mark class="dato">ordered</mark>: <mark class="ora">(A, A) => Boolean</mark>): Boolean =</div>
      <p class="nota">{{s|s022|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def isSorted[A](as: Array[A], ordered: (A, A) => Boolean)<mark class="ok">: Boolean</mark> =</div>
      <p class="nota">{{s|s023|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def isSorted[A](as: Array[A], ordered: (A, A) => Boolean): Boolean <mark class="ora">=</mark>
  …il corpo…</div>
      <p class="nota">{{s|s024|}}</p>
    </div>
  </figure>

  <div class="box basi" data-tit="{{a|s025|}}">
    <p>{{s|s026|}}</p>
  </div>
  <figure class="scena" data-scena="firma" data-titolo="{{a|s027|}}"></figure>
</section>

<section>
  <h2>{{s|s028|}}</h2>
  <p>{{s|s029|}}</p>
  <div class="colonne">
    <div class="carta">
      <h4>{{s|s030|}}</h4>
      <pre class="cod" data-lang="scala">def abs(n: Int): Int =
  if n &lt; 0 then -n else n</pre>
      <p>{{s|s031|}}</p>
    </div>
    <div class="carta">
      <h4>{{s|s032|}}</h4>
      <pre class="cod" data-lang="scala">def isSorted[A](as: Array[A],
    ordered: (A, A) => Boolean): Boolean</pre>
      <p>{{s|s033|}}</p>
    </div>
  </div>
  <p>{{s|s034|}}</p>

  <figure class="passi" data-titolo="{{a|s035|}}">
    <div class="passo">
      <div class="espr">isSorted[<mark class="dato">Int</mark>](Array(1, 2, 3), (x, y) => x &lt;= y)</div>
      <p class="nota">{{s|s036|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def isSorted(as: Array[<mark class="dato">Int</mark>], ordered: (<mark class="dato">Int</mark>, <mark class="dato">Int</mark>) => Boolean): Boolean</div>
      <p class="nota">{{s|s037|}}</p>
    </div>
    <div class="passo">
      <div class="espr">as      = <mark class="due">Array(1, 2, 3)</mark>
ordered = <mark class="ora">(x, y) => x &lt;= y</mark></div>
      <p class="nota">{{s|s038|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ora">ordered</mark>(<mark class="due">as(0)</mark>, <mark class="due">as(1)</mark>)
= <mark class="ora">(x, y) => x &lt;= y</mark> applicata a (1, 2)
= 1 &lt;= 2
= <mark class="ok">true</mark></div>
      <p class="nota">{{s|s039|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="sostituisci" data-titolo="{{a|s040|}}"></figure>
</section>

<section>
  <h2>{{s|s041|}}</h2>
  <p>{{s|s042|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s043|}}</th><th>{{s|s044|}}</th><th>{{s|s045|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr>
      <tr><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td><code>(x, y) => x + y</code></td></tr>
      <tr><td>{{s|s051|}}</td><td>{{s|s052|}}</td><td>{{s|s053|}}</td></tr>
      <tr><td><code>A => B</code></td><td>{{s|s054|}}</td><td>{{s|s055|}}</td></tr>
      <tr><td><code>() => A</code></td><td>{{s|s056|}}</td><td>{{s|s057|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s058|}}">
    <p>{{s|s059|}}</p>
  </div>
  <figure class="scena" data-scena="freccia" data-titolo="{{a|s060|}}"></figure>
</section>

<section>
  <h2>{{s|s061|}}</h2>
  <p>{{s|s062|}}</p>
  <pre class="cod" data-lang="scala">def isSortedCurried[A]: Array[A] => ((A, A) => Boolean) => Boolean</pre>

  <figure class="passi" data-titolo="{{a|s063|}}">
    <div class="passo">
      <div class="espr"><mark class="dato">Array[A]</mark> => ((A, A) => Boolean) => Boolean</div>
      <p class="nota">{{s|s064|}}</p>
    </div>
    <div class="passo">
      <div class="espr">Array[A] => <mark class="due">( ((A, A) => Boolean) => Boolean )</mark></div>
      <p class="nota">{{s|s065|}}</p>
    </div>
    <div class="passo">
      <div class="espr">Array[A] => ( <mark class="ora">((A, A) => Boolean)</mark> => Boolean )</div>
      <p class="nota">{{s|s066|}}</p>
    </div>
    <div class="passo">
      <div class="espr">Array[A] => ( ((A, A) => Boolean) => <mark class="ok">Boolean</mark> )</div>
      <p class="nota">{{s|s067|}}</p>
    </div>
    <div class="passo">
      <div class="espr">isSortedCurried(<mark class="dato">Array(1, 2, 3)</mark>)(<mark class="ora">_ &lt;= _</mark>)   →   <mark class="ok">true</mark></div>
      <p class="nota">{{s|s068|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="matrioska" data-titolo="{{a|s069|}}"></figure>
</section>

<section>
  <h2>{{s|s070|}}</h2>
  <p>{{s|s071|}}</p>
  <figure class="codice" data-titolo="{{a|s072|}}">
<pre data-lang="scala">def map[A, B](t: Tree[A])(f: A => B): Tree[B]

map(albero)(_.toString)</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="[A, B]@due">{{s|s073|}}</li>
      <li data-righe="1" data-segna="(t: Tree[A])@dato">{{s|s074|}}</li>
      <li data-righe="1" data-segna="(f: A => B)">{{s|s075|}}</li>
      <li data-righe="3" data-segna="(_.toString)|(albero)@dato">{{s|s076|}}</li>
      <li data-righe="1" data-segna="Tree[B]@ok">{{s|s077|}}</li>
    </ol>
  </figure>
  <div class="box attenzione" data-tit="{{a|s078|}}">
    <p>{{s|s079|}}</p>
  </div>
  <figure class="scena" data-scena="liste" data-titolo="{{a|s080|}}"></figure>
</section>

<section>
  <h2>{{s|s081|}}</h2>
  <p>{{s|s082|}}</p>
  <figure class="codice" data-titolo="{{a|s083|}}">
<pre data-lang="scala">enum Option[+A]:
  case Some(get: A)
  case None

  def map[B](f: A => B): Option[B] = this match
    case None    => None
    case Some(a) => Some(f(a))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="[+A]@due">{{s|s084|}}</li>
      <li data-righe="5" data-segna="A@due|[B]">{{s|s085|}}</li>
      <li data-righe="5" data-segna="this">{{s|s086|}}</li>
    </ol>
  </figure>
  <figure class="scena" data-scena="metodoenum" data-titolo="{{a|s087|}}"></figure>
</section>

</main>
</body>
</html>
