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
SCENE.costruisci = {
  w: 520, h: 210, lato: true,
  codice: { lang: 'scala', testo: `List(1, 2, 3)
= Cons(1, apply(2, 3))
= Cons(1, Cons(2, apply(3)))
= Cons(1, Cons(2, Cons(3, apply())))
= Cons(1, Cons(2, Cons(3, Nil)))` },
  oggetti: [
    { id: 'coda', tipo: 'rett', x: 150, y: 78, w: 350, h: 64, tono: 'due', nascosto: true },
    { id: 'c1', tipo: 'nodo', x: 80, y: 110, t: '1', nascosto: true },
    { id: 'c2', tipo: 'nodo', x: 190, y: 110, t: '2', nascosto: true },
    { id: 'c3', tipo: 'nodo', x: 300, y: 110, t: '3', nascosto: true },
    { id: 'nil', tipo: 'nodo', forma: 'quadrato', r: 22, x: 420, y: 110, t: 'Nil', nascosto: true },
    { id: 'a12', tipo: 'arco', da: 'c1', a: 'c2', dir: true, nascosto: true },
    { id: 'a23', tipo: 'arco', da: 'c2', a: 'c3', dir: true, nascosto: true },
    { id: 'a3n', tipo: 'arco', da: 'c3', a: 'nil', dir: true, nascosto: true },
    { id: 'th', tipo: 'testo', x: 80, y: 60, t: 'head = 1', tono: 'dato', nascosto: true },
    { id: 'tt', tipo: 'testo', x: 325, y: 60, t: 'tail = List(2, 3)', tono: 'due', nascosto: true }
  ],
  passi: [
    { nota: '{{j|s002|'}}', righe: [1] },
    { nota: '{{j|s003|'}}', righe: [2, 3, 4] },
    { nota: '{{j|s004|'}}', righe: [5],
      set: { nil: { nascosto: false, tono: 'ok' } } },
    { nota: '{{j|s005|'}}', righe: [5],
      set: { nil: { tono: null }, c3: { nascosto: false, tono: 'ora' }, a3n: { nascosto: false } } },
    { nota: '{{j|s006|'}}', righe: [5],
      set: { c3: { tono: null }, c2: { nascosto: false, tono: 'ora' }, a23: { nascosto: false } } },
    { nota: '{{j|s007|'}}', righe: [5],
      set: { c2: { tono: null }, c1: { nascosto: false, tono: 'ora' }, a12: { nascosto: false } } },
    { nota: '{{j|s008|'}}',
      set: { c1: { tono: 'dato' }, th: { nascosto: false }, tt: { nascosto: false }, coda: { nascosto: false } } }
  ]
};
SCENE.condivisa = {
  w: 520, h: 230, lato: true,
  oggetti: [
    { id: 'va', tipo: 'nodo', forma: 'quadrato', r: 18, x: 230, y: 40, t: 'a', tono: 'dato' },
    { id: 'n2', tipo: 'nodo', x: 300, y: 120, t: '2' },
    { id: 'n3', tipo: 'nodo', x: 390, y: 120, t: '3' },
    { id: 'nil', tipo: 'nodo', forma: 'quadrato', r: 22, x: 480, y: 120, t: 'Nil' },
    { id: 'aa', tipo: 'arco', da: 'va', a: 'n2', dir: true },
    { id: 'a23', tipo: 'arco', da: 'n2', a: 'n3', dir: true },
    { id: 'a3n', tipo: 'arco', da: 'n3', a: 'nil', dir: true },
    { id: 'vb', tipo: 'nodo', forma: 'quadrato', r: 18, x: 40, y: 60, t: 'b', nascosto: true },
    { id: 'n1', tipo: 'nodo', x: 150, y: 90, t: '1', nascosto: true },
    { id: 'ab', tipo: 'arco', da: 'vb', a: 'n1', dir: true, nascosto: true },
    { id: 'a12', tipo: 'arco', da: 'n1', a: 'n2', dir: true, nascosto: true },
    { id: 'vc', tipo: 'nodo', forma: 'quadrato', r: 18, x: 40, y: 190, t: 'c', nascosto: true },
    { id: 'n9', tipo: 'nodo', x: 150, y: 175, t: '9', nascosto: true },
    { id: 'ac', tipo: 'arco', da: 'vc', a: 'n9', dir: true, nascosto: true },
    { id: 'a92', tipo: 'arco', da: 'n9', a: 'n2', dir: true, nascosto: true }
  ],
  passi: [
    { nota: '{{j|s009|'}}' },
    { nota: '{{j|s010|'}}',
      set: { vb: { nascosto: false, tono: 'ok' }, n1: { nascosto: false, tono: 'ok' }, ab: { nascosto: false, tono: 'ok' }, a12: { nascosto: false, tono: 'ok' } } },
    { nota: '{{j|s011|'}}',
      set: { vc: { nascosto: false, tono: 'ora' }, n9: { nascosto: false, tono: 'ora' }, ac: { nascosto: false, tono: 'ora' }, a92: { nascosto: false, tono: 'ora' } } },
    { nota: '{{j|s012|'}}',
      set: { n2: { tono: 'due' }, n3: { tono: 'due' }, a23: { tono: 'due' }, a3n: { tono: 'due' } } }
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

    SCENE.dueforme = {
      w: 540, h: 160,
      codice: { lang: 'scala', testo: `enum List[+A]:
  case Nil
  case Cons(head: A, tail: List[A])` },
      legenda: '{{j|s013|'}}',
      oggetti: [
        R('c1', 20, 50, 60, 40, '1', { tono: 'dato' }), R('t1', 80, 50, 40, 40, '•', { tono: 'dato' }), F('a1', 112, 70, 156, 70, ''),
        R('c2', 160, 50, 60, 40, '2', { tono: 'dato' }), R('t2', 220, 50, 40, 40, '•', { tono: 'dato' }), F('a2', 252, 70, 296, 70, ''),
        R('nil', 300, 50, 70, 40, 'Nil', { tono: 'spento' }),
        T('c', 270, 130, 'Cons(1, Cons(2, Nil))', { bold: true, size: 13 })
      ],
      passi: [
        { nota: "Un <code>enum</code> dichiara un tipo con un numero <b>fisso</b> di forme. List ne ha due. Il valore disegnato è Cons(1, Cons(2, Nil)).", righe: [1] },
        { nota: "Prima forma: <b>Nil</b>, la lista vuota. Non contiene dati. Ogni lista finisce qui.", righe: [2], set: { nil: { tono: 'ora' } } },
        { nota: "Seconda forma: <b>Cons</b>, una cella. Contiene un elemento, <code>head</code>…", righe: [3], set: { nil: { tono: 'spento' }, c1: { tono: 'ora' }, c2: { tono: 'ora' } } },
        { nota: "…e il resto, <code>tail</code>, che è <b>a sua volta una List</b>: il tipo è definito usando se stesso (ricorsivo). Per questo le funzioni sulle liste hanno due casi: uno per Nil, uno per Cons.", righe: [3], set: { c1: { tono: 'dato' }, c2: { tono: 'dato' }, t1: { tono: 'ora' }, t2: { tono: 'ora' }, c: { t: 'tail di Cons(1, …) = Cons(2, Nil)' } } }
      ]
    };

    const riga = (id, y, tipo, somma, prod) => [T(id + 't', 20, y, tipo, { anchor: 'start', bold: true, size: 12 }), R(id + 's', 150, y - 20, 170, 30, somma, { tono: 'spento', nascosto: true }), R(id + 'p', 340, y - 20, 230, 30, prod, { tono: 'spento', nascosto: true })];
    SCENE.algebra = {
      w: 590, h: 230, lato: true,
      legenda: '{{j|s014|'}}',
      oggetti: [T('hs', 235, 24, 'somma: le forme', { bold: true, size: 12 }), T('hp', 455, 24, 'prodotto: cosa contiene', { bold: true, size: 12 })]
        .concat(riga('l', 70, 'List[A]', 'Nil  |  Cons', 'Cons = A × List[A]'), riga('o', 120, 'Option[A]', 'None  |  Some', 'Some = A'), riga('t', 170, 'Tree[A]', 'Leaf  |  Branch', 'Branch = Tree × Tree'), [T('c', 295, 218, '', { size: 12 })]),
      passi: [
        { nota: "Tipo <b>algebrico</b>: generato da uno o più costruttori, ciascuno con zero o più argomenti. Due operazioni: somma e prodotto." },
        { nota: "<b>Somma</b>: un valore è <b>una</b> delle forme. Una List è Nil <b>oppure</b> Cons.", set: { ls: { nascosto: false, tono: 'ora' } } },
        { nota: "<b>Prodotto</b>: ogni forma contiene <b>tutti</b> i suoi argomenti insieme. Cons contiene un A <b>e</b> una List[A].", set: { lp: { nascosto: false, tono: 'dato' } } },
        { nota: "Option (settimana 3): None oppure Some, e Some contiene un A. Tree: Leaf oppure Branch, e Branch contiene due alberi.", set: { os: { nascosto: false, tono: 'ora' }, op: { nascosto: false, tono: 'dato' }, ts: { nascosto: false, tono: 'ora' }, tp: { nascosto: false, tono: 'dato' } } },
        { nota: "Conseguenza pratica: ogni funzione su questi tipi risponde a \"quale forma ho in mano?\", con un caso per ogni forma della somma.", set: { c: { t: 'un case per ogni forma: Nil / Cons, None / Some, Leaf / Branch' } } }
      ]
    };

    SCENE.companion = {
      w: 540, h: 170,
      codice: { lang: 'scala', testo: `object List:
  def sum(ints: List[Int]): Int = ints match
    case Nil => 0
    case Cons(x, xs) => x + sum(xs)
  def apply[A](as: A*): List[A] =
    if as.isEmpty then Nil
    else Cons(as.head, apply(as.tail*))` },
      legenda: '{{j|s015|'}}',
      oggetti: [T('e', 270, 60, 'List(1, 2, 3)', { bold: true, size: 14 }), T('c', 270, 120, '', { size: 12 })],
      passi: [
        { nota: "Il <b>companion object</b> ha lo stesso nome dell'enum e contiene le funzioni sulla lista. <code>List(1, 2, 3)</code> è una scorciatoia per <code>List.apply(1, 2, 3)</code>.", righe: [5] },
        { nota: "<code>A*</code>: quanti argomenti vuoi. as = (1, 2, 3) non è vuota: una cella con il primo, e come resto <code>apply(as.tail*)</code>. L'asterisco spacchetta la sequenza di nuovo in argomenti.", righe: [7], set: { e: { t: 'Cons(1, apply(2, 3))' } } },
        { nota: "Ripetendo: Cons(1, Cons(2, Cons(3, apply()))). Zero argomenti: Nil.", righe: [6], set: { e: { t: 'Cons(1, Cons(2, Cons(3, Nil)))' } } },
        { nota: "Ora <code>sum</code> di quella lista: è un Cons, quindi 1 + sum(resto).", righe: [4], set: { e: { t: '1 + sum(Cons(2, Cons(3, Nil)))' } } },
        { nota: "1 + (2 + (3 + sum(Nil))), e sum(Nil) = 0: il risultato è <b>6</b>.", righe: [3], set: { e: { t: '1 + (2 + (3 + 0)) = 6', tono: 'ok' }, c: { t: 'List.sum(List(1, 2, 3)) = 6' } } }
      ]
    };

    SCENE.nilunico = {
      w: 580, h: 240, lato: true,
      legenda: '{{j|s016|'}}',
      oggetti: [
        R('li', 40, 30, 150, 40, 'List[Int]', { tono: 'dato' }), R('ls', 215, 30, 150, 40, 'List[String]', { tono: 'dato' }), R('lp', 390, 30, 150, 40, 'List[Persona]', { tono: 'dato' }),
        R('ln', 215, 150, 150, 40, 'List[Nothing]', { tono: 'ora', nascosto: true }),
        F('f1', 250, 148, 130, 74, '', { nascosto: true }), F('f2', 290, 148, 290, 74, '', { nascosto: true }), F('f3', 330, 148, 460, 74, '', { nascosto: true }),
        T('c', 290, 222, '', { size: 12 })
      ],
      passi: [
        { nota: "Con le classi (slide 3): <code>case object Nil extends List[Nothing]</code>. Un solo oggetto Nil: come fa a essere la lista vuota di Int, di String, di tutto?" },
        { nota: "<b>Nothing</b> è il tipo \"in fondo a tutti\": sottotipo di ogni tipo, e senza valori. Nil è una List[Nothing].", set: { ln: { nascosto: false }, c: { t: 'Nothing <: Int, Nothing <: String, …' } } },
        { nota: "Grazie al <b>+</b> (covarianza) di List[+A]: se Nothing &lt;: Int allora List[Nothing] &lt;: List[Int]. Lo stesso per ogni tipo.", set: { f1: { nascosto: false }, f2: { nascosto: false }, f3: { nascosto: false }, c: { t: 'List[Nothing] <: List[Int], List[String], …' } } },
        { nota: "Quindi un solo Nil va bene come lista vuota di <b>qualsiasi</b> tipo. <code>sealed</code> garantisce che non esistano altre forme fuori dal file. La versione con enum del corso è equivalente.", set: { li: { tono: 'ok' }, ls: { tono: 'ok' }, lp: { tono: 'ok' }, c: { t: 'un solo Nil per tutti i tipi', tono: 'ok' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s017|}}</h1>
  <p class="lede">{{s|s018|}}</p>
</header>

<section>
  <h2>{{s|s019|}}</h2>
  <figure class="codice" data-titolo="{{a|s020|}}">
<pre data-lang="scala">enum List[+A]:
  case Nil
  case Cons(head: A, tail: List[A])</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="enum@ora"><p>{{s|s021|}}</p></li>
      <li data-righe="1" data-segna="[+A]@due"><p>{{s|s022|}}</p></li>
      <li data-righe="2" data-segna="Nil@dato"><p>{{s|s023|}}</p></li>
      <li data-righe="3" data-segna="Cons@ora|head: A@dato"><p>{{s|s024|}}</p></li>
      <li data-righe="3" data-segna="tail: List[A]@due"><p>{{s|s025|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s026|}}">
    <p>{{s|s027|}}</p>
  </div>
  <figure class="scena" data-scena="dueforme" data-titolo="{{a|s028|}}"></figure>
</section>

<section>
  <h2>{{s|s029|}}</h2>
  <figure class="scena" data-scena="costruisci" data-titolo="{{a|s030|}}"></figure>
  <div class="box domanda-tua" data-tit="{{a|s031|}}">
    <p>{{s|s032|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s033|}}</h2>
  <div class="box regola" data-tit="{{a|s034|}}">
    <p>{{s|s035|}}</p>
  </div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s036|}}</th><th>{{s|s037|}}</th><th>{{s|s038|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s039|}}</td><td>{{s|s040|}}</td><td>{{s|s041|}}</td></tr>
      <tr><td>{{s|s042|}}</td><td>{{s|s043|}}</td><td>{{s|s044|}}</td></tr>
      <tr><td>{{s|s045|}}</td><td>{{s|s046|}}</td><td>{{s|s047|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s048|}}</p>
  <figure class="scena" data-scena="algebra" data-titolo="{{a|s049|}}"></figure>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <p>{{s|s051|}}</p>
  <figure class="codice" data-titolo="{{a|s052|}}">
<pre data-lang="scala">object List:

  def sum(ints: List[Int]): Int = ints match
    case Nil => 0
    case Cons(x, xs) => x + sum(xs)

  def apply[A](as: A*): List[A] =
    if as.isEmpty then Nil
    else Cons(as.head, apply(as.tail*))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="object List@ora"><p>{{s|s053|}}</p></li>
      <li data-righe="3-5" data-segna="ints match@ora"><p>{{s|s054|}}</p></li>
      <li data-righe="4" data-segna="0@ok"><p>{{s|s055|}}</p></li>
      <li data-righe="5" data-segna="x@dato|sum(xs)@ora"><p>{{s|s056|}}</p></li>
      <li data-righe="7" data-segna="apply@ora"><p>{{s|s057|}}</p></li>
      <li data-righe="7" data-segna="A*@due"><p>{{s|s058|}}</p></li>
      <li data-righe="8" data-segna="as.isEmpty@dato|Nil@ok"><p>{{s|s059|}}</p></li>
      <li data-righe="9" data-segna="as.head@dato|as.tail*@due"><p>{{s|s060|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="companion" data-titolo="{{a|s061|}}"></figure>
</section>

<section>
  <h2>{{s|s062|}}</h2>
  <p>{{s|s063|}}</p>
  <figure class="scena" data-scena="condivisa" data-titolo="{{a|s064|}}"></figure>
</section>

<section>
  <h2>{{s|s065|}}</h2>
  <p>{{s|s066|}}</p>
  <pre class="cod" data-lang="scala">sealed trait List[+A]
case object Nil extends List[Nothing]
case class Cons[+A](head: A, tail: List[A]) extends List[A]</pre>
  <ul>
    <li>{{s|s067|}}</li>
    <li>{{s|s068|}}</li>
  </ul>
  <p class="piccolo">{{s|s069|}}</p>
  <figure class="scena" data-scena="nilunico" data-titolo="{{a|s070|}}"></figure>
</section>

</main>
</body>
</html>
