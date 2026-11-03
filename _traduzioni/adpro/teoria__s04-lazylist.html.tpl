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
SCENE.forzare = {
  w: 560, h: 240,
  legenda: '{{j|s002|'}}',
  codice: { lang: 'scala', testo: `def take(n: Int): LazyList[A] = this match
  case Cons(h, t) if n > 0 => cons(h(), t().take(n - 1))
  case _ => empty

def toList: List[A] = this match
  case Empty => Nil
  case Cons(h, t) => h() :: t().toList` },
  oggetti: [
    { id: 'l1', tipo: 'testo', x: 8, y: 30, t: 'naturals', size: 12, anchor: 'start' },
    { id: 'l2', tipo: 'testo', x: 8, y: 140, t: 'take(3)', size: 12, anchor: 'start' },
    { id: 'n0', tipo: 'nodo', x: 60, y: 75, t: '?', tono: 'no' },
    { id: 'n1', tipo: 'nodo', x: 170, y: 75, t: '?', tono: 'no', nascosto: true },
    { id: 'n2', tipo: 'nodo', x: 280, y: 75, t: '?', tono: 'no', nascosto: true },
    { id: 'n3', tipo: 'nodo', x: 390, y: 75, t: '?', tono: 'no', nascosto: true },
    { id: 'e01', tipo: 'arco', da: 'n0', a: 'n1', dir: true, nascosto: true },
    { id: 'e12', tipo: 'arco', da: 'n1', a: 'n2', dir: true, nascosto: true },
    { id: 'e23', tipo: 'arco', da: 'n2', a: 'n3', dir: true, nascosto: true },
    { id: 'm0', tipo: 'nodo', x: 60, y: 185, t: '?', tono: 'no', nascosto: true },
    { id: 'm1', tipo: 'nodo', x: 170, y: 185, t: '?', tono: 'no', nascosto: true },
    { id: 'm2', tipo: 'nodo', x: 280, y: 185, t: '?', tono: 'no', nascosto: true },
    { id: 'm3', tipo: 'nodo', forma: 'quadrato', r: 26, x: 390, y: 185, t: 'Empty', nascosto: true },
    { id: 'f01', tipo: 'arco', da: 'm0', a: 'm1', dir: true, nascosto: true },
    { id: 'f12', tipo: 'arco', da: 'm1', a: 'm2', dir: true, nascosto: true },
    { id: 'f23', tipo: 'arco', da: 'm2', a: 'm3', dir: true, nascosto: true },
    { id: 'out', tipo: 'testo', x: 470, y: 140, t: '', size: 13, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', righe: [2],
      set: { m0: { nascosto: false } } },
    { nota: '{{j|s005|'}}', righe: [7],
      set: { n0: { t: '1', tono: 'ok' }, m0: { t: '1', tono: 'ok' } } },
    { nota: '{{j|s006|'}}', righe: [7, 2],
      set: { n1: { nascosto: false }, e01: { nascosto: false }, m1: { nascosto: false }, f01: { nascosto: false } } },
    { nota: '{{j|s007|'}}', righe: [7],
      set: { n1: { t: '2', tono: 'ok' }, m1: { t: '2', tono: 'ok' } } },
    { nota: '{{j|s008|'}}', righe: [7, 2],
      set: { n2: { nascosto: false }, e12: { nascosto: false }, m2: { nascosto: false }, f12: { nascosto: false } } },
    { nota: '{{j|s009|'}}', righe: [7],
      set: { n2: { t: '3', tono: 'ok' }, m2: { t: '3', tono: 'ok' } } },
    { nota: '{{j|s010|'}}', righe: [2, 3],
      set: { n3: { nascosto: false }, e23: { nascosto: false }, m3: { nascosto: false, tono: 'ok' }, f23: { nascosto: false } } },
    { nota: '{{j|s011|'}}', righe: [6],
      set: { out: { t: 'List(1, 2, 3)', tono: 'ok' } } }
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
  const toni = (n, tono) => Object.fromEntries(Array.from({ length: n }, (_, i) => [i, tono]));

    SCENE.tipolazy = {
      w: 560, h: 170,
      codice: { lang: 'scala', testo: `enum LazyList[+A]:
  case Empty
  case Cons(h: () => A, t: () => LazyList[A])
  def headOption: Option[A] = this match
    case Empty => None
    case Cons(h, t) => Some(h())` },
      legenda: '{{j|s012|'}}',
      oggetti: [R('h', 30, 40, 120, 44, 'h: () => A', { tono: 'due' }), R('t', 150, 40, 170, 44, 't: () => LazyList[A]', { tono: 'due' }), T('v', 90, 120, '', { bold: true }), T('w', 250, 148, '', { size: 12 }), T('c', 440, 62, '', { size: 12 })],
      passi: [
        { nota: "Due forme, come List: <b>Empty</b> o una cella <b>Cons</b>. La differenza sta nei campi.", righe: [1, 2, 3] },
        { nota: "La testa non è un A: è <code>() =&gt; A</code>, una <b>ricetta</b>: una funzione senza argomenti che, chiamata, dà un A. Anche la coda è una ricetta: finché nessuno la chiama, il resto della lista <b>non esiste</b>.", righe: [3], set: { c: { t: 'niente è ancora calcolato' } } },
        { nota: "Per avere il valore si <b>chiama</b> la ricetta: <code>h()</code>. headOption fa proprio questo: Some vuole il valore, non la ricetta.", righe: [6], set: { h: { tono: 'ok' }, v: { t: 'h() = 1', tono: 'ok' }, c: { t: 'headOption = Some(h())' } } },
        { nota: "Allo stesso modo <code>t()</code> produce la cella successiva, con le sue due ricette. Una lista pigra si costruisce una cella alla volta, solo quando serve.", set: { t: { tono: 'ok' }, w: { t: 't() = la cella dopo (ricette dentro)' } } }
      ]
    };

    SCENE.consmemo = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s013|'}}',
      oggetti: [T('ha', 150, 24, 'cons(hd, tl): lazy val', { bold: true }), T('hb', 430, 24, 'Cons(() => hd, …) diretto', { bold: true }),
        T('a1', 150, 70, '', { size: 12 }), T('a2', 150, 100, '', { size: 12 }), T('b1', 430, 70, '', { size: 12 }), T('b2', 430, 100, '', { size: 12 }), T('ca', 150, 150, '', { bold: true }), T('cb', 430, 150, '', { bold: true }), T('c', 290, 200, '', { size: 12 })],
      passi: [
        { nota: "I campi di un case non possono essere by-name, quindi Cons usa le ricette. Il costruttore comodo <code>cons(hd: =&gt; A, tl: =&gt; LazyList[A])</code> prende parametri by-name e li mette in <b>lazy val</b>. La testa qui è un calcolo costoso." },
        { nota: "Prima lettura della testa: con cons la lazy val si calcola; con Cons diretto la ricetta si esegue. Una volta ciascuno.", set: { a1: { t: '1ª lettura: calcola', tono: 'ora' }, b1: { t: '1ª lettura: calcola', tono: 'ora' } } },
        { nota: "Seconda lettura: la lazy val <b>ricorda</b> il risultato; la ricetta diretta <b>ricalcola</b>.", set: { a2: { t: '2ª lettura: ricordato', tono: 'ok' }, b2: { t: '2ª lettura: ricalcola', tono: 'no' }, ca: { t: 'calcoli: 1', tono: 'ok' }, cb: { t: 'calcoli: 2', tono: 'no' } } },
        { nota: "Dentro la ricetta si scrive <code>() =&gt; head</code> senza parentesi dopo head: è una lazy val, non una funzione. <code>empty</code> è Empty con il tipo già giusto (LazyList[A]), e <code>apply</code> costruisce LazyList(1, 2, 3) con cons.", set: { c: { t: 'cons = by-name + lazy val: calcola al primo uso, poi ricorda' } } }
      ]
    };

    SCENE.tolistlazy = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s014|'}}',
      oggetti: [T('e', 290, 30, 'cons(1, cons(2, empty)).toList', { bold: true }), T('e1', 290, 70, '', { size: 13 }), T('e2', 290, 105, '', { size: 13 }),
        R('n1', 30, 150, 160, 36, 'Option[A] → None', { tono: 'spento' }), R('n2', 210, 150, 160, 36, 'LazyList[A] → empty', { tono: 'spento' }), R('n3', 390, 150, 160, 36, 'List[A] → Nil', { tono: 'spento' }), T('c', 290, 214, '', { size: 12 })],
      passi: [
        { nota: "toList restituisce una <b>List normale</b>: quindi si costruisce con Nil e <code>::</code>. Testa: h(); resto: la coda forzata, t(), trasformata in lista." },
        { nota: "Prima cella: <code>h() :: t().toList</code> = 1 :: (resto).toList.", set: { e1: { t: '1 :: cons(2, empty).toList' } } },
        { nota: "Seconda: 2 :: empty.toList, e Empty dà Nil. Risultato List(1, 2).", set: { e2: { t: '1 :: 2 :: Nil = List(1, 2)', tono: 'ok' } } },
        { nota: "La regola per il \"niente\": guarda il tipo dopo i due punti nella firma. <b>Option[A] → None</b>, <b>LazyList[A] → empty</b>, <b>List[A] → Nil</b>. Sbagliarlo dà sempre un Found/Required: per esempio None in toList (Found None.type, Required List[A]) o Nil in take.", set: { n1: { tono: 'ora' }, n2: { tono: 'ora' }, n3: { tono: 'ora' }, c: { t: 'e toList si chiama senza (): t().toList, non t().toList()' } } }
      ]
    };

    SCENE.takedrop = {
      w: 580, h: 200, lato: true,
      legenda: '{{j|s015|'}}',
      oggetti: [T('e', 290, 30, '', { bold: true }), C('l', 20, 60, ['1', '…', '41', '42', '…', '51', '52', '…'], { cw: 66, toni: toni(8, 'spento') }), T('c', 290, 140, '', { size: 12 }), T('c2', 290, 175, '', { size: 12 })],
      passi: [
        { nota: "<code>naturals.take(1000000000).drop(41).take(10).toList</code>: un miliardo di elementi descritti. Quanti vengono calcolati davvero?" },
        { nota: "<code>take(1000000000)</code> crea <b>solo la prima cella</b>, con ricette dentro: <code>cons(h(), t().take(n − 1))</code> non calcola niente ora.", set: { e: { t: 'take(1000000000): 1 cella' } } },
        { nota: "<code>drop(41)</code> forza 41 <b>code</b>, una alla volta. Le teste di quelle celle non vengono mai calcolate: drop non le guarda.", set: { e: { t: 'drop(41): 41 code forzate' }, l: { toni: Object.assign(toni(8, 'spento'), { 0: 'due', 1: 'due', 2: 'due' }) } } },
        { nota: "<code>take(10)</code>: di nuovo una cella con ricette. Poi <code>toList</code> forza 10 teste e le code che servono.", set: { e: { t: 'take(10).toList: 10 teste' }, l: { toni: Object.assign(toni(8, 'spento'), { 0: 'due', 1: 'due', 2: 'due', 3: 'ok', 4: 'ok', 5: 'ok' }) } } },
        { nota: "Risultato List(42, 43, …, 51) (verificato): una cinquantina di celle toccate su un miliardo descritto. Da 52 in poi niente. Attenzione a drop: su n ≤ 0 deve restituire <b>this</b>, non empty (5 test falliscono altrimenti).", set: { c: { t: 'List(42, …, 51)', tono: 'ok' }, c2: { t: 'termina perché cons è non strict nella coda' } } }
      ]
    };

    SCENE.forallexists = {
      w: 580, h: 200, lato: true,
      legenda: '{{j|s016|'}}',
      oggetti: [T('e', 290, 30, '', { bold: true }), C('l', 30, 50, ['1', '2', '3', '4', '5', '…'], { cw: 66, toni: {} }), T('r', 290, 140, '', { bold: true, size: 14 }), T('c', 290, 180, '', { size: 12 })],
      passi: [
        { nota: "<code>&amp;&amp;</code> e <code>||</code> non sono strict: se la parte sinistra decide già, la destra non viene calcolata. forAll usa &amp;&amp;, exists usa ||." },
        { nota: "<code>naturals.forAll(_ &lt; 0)</code>: 1 &lt; 0 è falso al primo elemento, &amp;&amp; non guarda il resto. <b>false, subito</b> (verificato).", set: { e: { t: 'naturals.forAll(_ < 0)' }, l: { toni: { 0: 'no' } }, r: { t: 'false', tono: 'no' }, c: { t: 'un controesempio basta' } } },
        { nota: "<code>naturals.exists(_ &gt; 3)</code>: 1, 2, 3 no; 4 sì, || si ferma. <b>true</b>.", set: { e: { t: 'naturals.exists(_ > 3)' }, l: { toni: { 0: 'no', 1: 'no', 2: 'no', 3: 'ok' } }, r: { t: 'true', tono: 'ok' }, c: { t: 'il primo che va basta' } } },
        { nota: "<code>naturals.forAll(_ &gt;= 0)</code>: ogni naturale è ≥ 0, non trova mai un controesempio: continua all'infinito e finisce la pila. Su liste infinite forAll può terminare solo con false, exists solo con true.", set: { e: { t: 'naturals.forAll(_ >= 0)' }, l: { toni: toni(6, 'ora') }, r: { t: 'non termina (StackOverflow)', tono: 'no' }, c: { t: 'usali su liste infinite solo se sai già la risposta' } } }
      ]
    };

    SCENE.random12 = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s017|'}}',
      oggetti: [T('ha', 150, 24, 'random1: Cons diretto', { bold: true }), T('hb', 430, 24, 'random2: con cons', { bold: true }),
        T('a1', 150, 70, '', { size: 12 }), T('a2', 150, 100, '', { size: 12 }), T('b1', 430, 70, '', { size: 12 }), T('b2', 430, 100, '', { size: 12 }), T('c', 290, 160, '', { size: 12, bold: true }), T('c2', 290, 190, '', { size: 12 })],
      passi: [
        { nota: "Slide 14: <code>random1 = Cons(() =&gt; Math.random, () =&gt; random1)</code> e <code>random2 = cons(Math.random, random2)</code>. Leggiamo due volte <code>take(2).toList</code> (i numeri sono un esempio)." },
        { nota: "<b>random1</b>: la ricetta <code>() =&gt; Math.random</code> viene <b>rieseguita a ogni lettura</b>: due liste diverse.", set: { a1: { t: '1ª: List(0.42, 0.87)', tono: 'no' }, a2: { t: '2ª: List(0.13, 0.66)', tono: 'no' } } },
        { nota: "<b>random2</b>: cons mette la testa in una lazy val: calcolata una volta, poi sempre uguale.", set: { b1: { t: '1ª: List(0.51, 0.51)', tono: 'ok' }, b2: { t: '2ª: List(0.51, 0.51)', tono: 'ok' } } },
        { nota: "Verificato: con random1 le due letture danno liste diverse, con random2 uguali. random1 non è referenzialmente trasparente, perché Math.random è un <b>effetto</b>. (random2 è infinita e ripete sempre la stessa testa, perché la coda è random2 stessa.)", set: { c: { t: 'random1: non RT · random2: stessa lista a ogni lettura' }, c2: { t: 'laziness + effetti = risultati che dipendono da quando leggi' } } }
      ]
    };

    SCENE.perchelazy = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s018|'}}',
      oggetti: [T('ha', 150, 24, 'List', { bold: true }), T('hb', 430, 24, 'LazyList', { bold: true }),
        T('a1', 150, 70, '', { size: 12 }), T('a2', 150, 100, '', { size: 12 }), T('b1', 430, 70, '', { size: 12 }), T('b2', 430, 100, '', { size: 12 }), T('c', 290, 170, '', { size: 12 }), T('c2', 290, 200, '', { size: 12 })],
      passi: [
        { nota: "Le liste pigre separano la <b>descrizione</b> di un calcolo dalla sua <b>esecuzione</b>. Esempio: <code>lista.map(f).map(g)</code>." },
        { nota: "Su una <b>List</b>: map(f) scorre tutta la lista e ne crea una nuova; map(g) la scorre di nuovo. Due passate, subito.", set: { a1: { t: 'map(f): passata 1, lista intera', tono: 'ora' }, a2: { t: 'map(g): passata 2, lista intera', tono: 'ora' } } },
        { nota: "Su una <b>LazyList</b>: zero passate. Esiste solo la descrizione.", set: { b1: { t: 'map(f).map(g): nessun calcolo', tono: 'spento' } } },
        { nota: "Quando qualcuno chiede i valori, per esempio <code>take(2).toList</code>, ogni elemento richiesto passa per f e poi per g, uno alla volta. Solo quelli richiesti. Come un Iterator Java, ma funzionale: next() è la forzatura.", set: { b2: { t: 'take(2).toList: 2 elementi, f poi g', tono: 'ok' }, c: { t: 'si calcola solo quello che serve' }, c2: { t: 'lo stesso generatore serve per 42 numeri o per 1000' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s019|}}</h1>
  <p class="lede">{{s|s020|}}</p>
</header>

<section>
  <div class="box esame" data-tit="{{a|s021|}}">
    <p>{{s|s022|}}</p>
  </div>
  <h2>{{s|s023|}}</h2>
  <figure class="codice" data-titolo="{{a|s024|}}">
<pre data-lang="scala">enum LazyList[+A]:
  case Empty
  case Cons(h: () => A, t: () => LazyList[A])

  def headOption: Option[A] = this match
    case Empty => None
    case Cons(h, t) => Some(h())</pre>
    <ol class="spiega">
      <li data-righe="2-3" data-segna="Empty@dato|Cons@ora"><p>{{s|s025|}}</p></li>
      <li data-righe="3" data-segna="h: () => A@due"><p>{{s|s026|}}</p></li>
      <li data-righe="3" data-segna="t: () => LazyList[A]@due"><p>{{s|s027|}}</p></li>
      <li data-righe="7" data-segna="h()@ok"><p>{{s|s028|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="tipolazy" data-titolo="{{a|s029|}}"></figure>
</section>

<section>
  <h2>{{s|s030|}}</h2>
  <p>{{s|s031|}}</p>
  <figure class="codice" data-titolo="{{a|s032|}}">
<pre data-lang="scala">object LazyList:
  def empty[A]: LazyList[A] = Empty

  def cons[A](hd: => A, tl: => LazyList[A]): LazyList[A] =
    lazy val head = hd
    lazy val tail = tl
    Cons(() => head, () => tail)

  def apply[A](as: A*): LazyList[A] =
    if as.isEmpty then empty
    else cons(as.head, apply(as.tail*))</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="empty@dato"><p>{{s|s033|}}</p></li>
      <li data-righe="4" data-segna="hd: => A@ora|tl: => LazyList[A]@ora"><p>{{s|s034|}}</p></li>
      <li data-righe="5-6" data-segna="lazy val head = hd@due|lazy val tail = tl@due"><p>{{s|s035|}}</p></li>
      <li data-righe="7" data-segna="() => head@ok|() => tail@ok"><p>{{s|s036|}}</p></li>
      <li data-righe="9-11" data-segna="cons(as.head, apply(as.tail*))@ok"><p>{{s|s037|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="consmemo" data-titolo="{{a|s038|}}"></figure>
</section>

<section>
  <h2>{{s|s039|}}</h2>
  <figure class="scena" data-scena="forzare" data-titolo="{{a|s040|}}"></figure>
</section>

<section>
  <h2>{{s|s041|}}</h2>
  <figure class="passi" data-titolo="{{a|s042|}}">
    <div class="passo">
      <div class="espr">def toList: <mark class="ora">List[A]</mark> = this match</div>
      <p class="nota">{{s|s043|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def toList: List[A] = this match
  case Empty      => <mark class="ok">Nil</mark>
  case Cons(h, t) => <mark class="dato">h()</mark> <mark class="ora">::</mark> <mark class="due">t().toList</mark></div>
      <p class="nota">{{s|s044|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val l: <mark class="due">LazyList[Int]</mark> = <mark class="due">cons</mark>(1, cons(2, empty))</div>
      <p class="nota">{{s|s045|}}</p>
    </div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s046|}}</th><th>{{s|s047|}}</th><th>{{s|s048|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td>{{s|s051|}}</td></tr>
      <tr><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr>
      <tr><td>{{s|s055|}}</td><td>{{s|s056|}}</td><td>{{s|s057|}}</td></tr>
    </tbody>
  </table></div>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">case Empty => None</pre>
      <pre class="msg">Found:    None.type
Required: List[A]</pre>
      <div class="fix">{{s|s058|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => h() :: t().toList()</pre>
      <pre class="msg">missing argument for parameter n of method apply in trait LinearSeqOps: (n: Int): A</pre>
      <div class="fix">{{s|s059|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => cons(h(), t().toList)</pre>
      <pre class="msg">Found:    List[A]
Required: LazyList[A]</pre>
      <div class="fix">{{s|s060|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def take(n: Int): LazyList[A] =
  if n &lt;= 0 then Nil else …</pre>
      <pre class="msg">Found:    (Nil : scala.collection.immutable.Nil.type)
Required: LazyList[A]</pre>
      <div class="fix">{{s|s061|}}</div>
    </div>
  </div>
  <div class="box regola" data-tit="{{a|s062|}}">
    <div class="tab-wrap"><table class="tab">
      <thead><tr><th>{{s|s063|}}</th><th>{{s|s064|}}</th><th>{{s|s065|}}</th><th>{{s|s066|}}</th></tr></thead>
      <tbody>
        <tr><td>{{s|s067|}}</td><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td></tr>
        <tr><td>{{s|s071|}}</td><td>{{s|s072|}}</td><td>{{s|s073|}}</td><td>{{s|s074|}}</td></tr>
        <tr><td>{{s|s075|}}</td><td>{{s|s076|}}</td><td>{{s|s077|}}</td><td>{{s|s078|}}</td></tr>
      </tbody>
    </table></div>
    <p>{{s|s079|}}</p>
  </div>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def headOption: Option[A] = this match
  case Empty => empty</pre>
      <pre class="msg">Found:    adpro.lazyList.LazyList[Nothing]
Required: Option[A]</pre>
      <div class="fix">{{s|s080|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def tail: LazyList[A] = this match
  case Empty => None</pre>
      <pre class="msg">Found:    None.type
Required: adpro.lazyList.LazyList[A]</pre>
      <div class="fix">{{s|s081|}}</div>
    </div>
  </div>
  <figure class="scena" data-scena="tolistlazy" data-titolo="{{a|s082|}}"></figure>
</section>

<section>
  <h2>{{s|s083|}}</h2>
  <figure class="codice" data-titolo="{{a|s084|}}">
<pre data-lang="scala">def take(n: Int): LazyList[A] = this match
  case Cons(h, t) if n &gt; 0 => cons(h(), t().take(n - 1))
  case _ => empty

def drop(n: Int): LazyList[A] = this match
  case Cons(_, t) if n &gt; 0 => t().drop(n - 1)
  case _ => this</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="if n &gt; 0@ora"><p>{{s|s085|}}</p></li>
      <li data-righe="2" data-segna="cons(h(), t().take(n - 1))@ok"><p>{{s|s086|}}</p></li>
      <li data-righe="3" data-segna="case _ => empty@dato"><p>{{s|s087|}}</p></li>
      <li data-righe="6" data-segna="t().drop(n - 1)@ora"><p>{{s|s088|}}</p></li>
      <li data-righe="7" data-segna="case _ => this@ok"><p>{{s|s089|}}</p></li>
    </ol>
  </figure>
  <div class="box attenzione" data-tit="{{a|s090|}}">
    <p>{{s|s091|}}</p>
  </div>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def drop(n: Int): LazyList[A] =
  if n &lt;= 0 then LazyList[A] else …</pre>
      <pre class="msg">missing argument list for method apply in object LazyList

  def apply[A](as: A*): adpro.lazyList.LazyList[A]

where:    A is a type variable</pre>
      <div class="fix">{{s|s092|}}</div>
    </div>
  </div>
  <figure class="passi" data-titolo="{{a|s093|}}">
    <div class="passo"><div class="espr">naturals.<mark class="dato">take(1000000000)</mark></div><p class="nota">{{s|s094|}}</p></div>
    <div class="passo"><div class="espr">….<mark class="ora">drop(41)</mark></div><p class="nota">{{s|s095|}}</p></div>
    <div class="passo"><div class="espr">….<mark class="dato">take(10)</mark></div><p class="nota">{{s|s096|}}</p></div>
    <div class="passo"><div class="espr">….<mark class="ora">toList</mark>   →   <mark class="ok">List(42, 43, …, 51)</mark></div><p class="nota">{{s|s097|}}</p></div>
  </figure>
  <div class="box inglese" data-tit="{{a|s098|}}">
    <p>{{s|s099|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s100|}}">
    <p>{{s|s101|}}</p>
  </div>
  <figure class="scena" data-scena="takedrop" data-titolo="{{a|s102|}}"></figure>
</section>

<section>
  <h2>{{s|s103|}}</h2>
  <pre class="cod" data-lang="scala">def takeWhile(p: A => Boolean): LazyList[A] = this match
  case Cons(h, t) if p(h()) => cons(h(), t().takeWhile(p))
  case _ => empty

def forAll(p: A => Boolean): Boolean = this match
  case Empty => true
  case Cons(h, t) => p(h()) &amp;&amp; t().forAll(p)

def exists(p: A => Boolean): Boolean = this match
  case Empty => false
  case Cons(h, t) => p(h()) || t().exists(p)</pre>
  <p>{{s|s104|}}</p>
  <p>{{s|s105|}}</p>
  <p>{{s|s106|}}</p>
  <div class="box inglese" data-tit="{{a|s107|}}">
    <p>{{s|s108|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s109|}}">
    <p>{{s|s110|}}</p>
    <p>{{s|s111|}}</p>
  </div>
  <figure class="scena" data-scena="forallexists" data-titolo="{{a|s112|}}"></figure>
</section>

<section>
  <h2>{{s|s113|}}</h2>
  <pre class="cod" data-lang="scala">lazy val random1: LazyList[Double] = Cons(() => Math.random, () => random1)
lazy val random2: LazyList[Double] = cons(Math.random, random2)</pre>
  <div class="colonne">
    <div class="carta"><h4>{{s|s114|}}</h4><p>{{s|s115|}}</p></div>
    <div class="carta"><h4>{{s|s116|}}</h4><p>{{s|s117|}}</p></div>
  </div>
  <p>{{s|s118|}}</p>
  <figure class="scena" data-scena="random12" data-titolo="{{a|s119|}}"></figure>
</section>

<section>
  <h2>{{s|s120|}}</h2>
  <ul>
    <li>{{s|s121|}}</li>
    <li>{{s|s122|}}</li>
    <li>{{s|s123|}}</li>
    <li>{{s|s124|}}</li>
  </ul>
  <figure class="scena" data-scena="perchelazy" data-titolo="{{a|s125|}}"></figure>
</section>

</main>
</body>
</html>
