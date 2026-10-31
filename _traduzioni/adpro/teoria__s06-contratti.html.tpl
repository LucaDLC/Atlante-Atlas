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
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

  SCENE.asserzione = {
    w: 580, h: 200, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [R('c', 20, 40, 300, 44, '', { tono: 'dato' }), F('f', 322, 62, 360, 62, ''), R('e', 364, 40, 200, 44, '', { tono: 'spento' }),
      T('m', 290, 130, '', { size: 12 }), T('m2', 290, 165, '', { size: 12 })],
    passi: [
      { nota: "Un'<b>asserzione</b> è una condizione (un Boolean) che nelle esecuzioni corrette deve essere vera. In Scala <code>assert</code> è sempre a disposizione: sta in <code>Predef</code>, importato da solo." },
      { nota: "Condizione vera: <code>assert</code> non fa niente e restituisce <code>()</code>. Il programma va avanti.", set: { c: { t: 'assert(List().size == 0)' }, e: { t: '()  → avanti', tono: 'ok' } } },
      { nota: "Condizione falsa: il programma si ferma subito con un'eccezione. È il <b>fail-fast</b>: l'errore salta fuori dove nasce, non dieci funzioni dopo.", set: { c: { t: 'assert(List(1).size == 0)' }, e: { t: 'AssertionError', tono: 'no' }, m: { t: 'java.lang.AssertionError: assertion failed' } } },
      { nota: "Con un secondo argomento scegli il messaggio: aiuta a capire <b>quale</b> asserzione è saltata. Tutti i messaggi sono stampati da Scala 3.8.4.", set: { c: { t: 'assert(1 + 1 == 3, "1+1 non fa 3")' }, m: { t: 'assertion failed: 1+1 non fa 3' }, m2: { t: 'a cosa servono: leggere il codice · fail-fast · test e verifica' } } }
    ]
  };

  SCENE.sapori = {
    w: 580, h: 230, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [R('rq', 20, 40, 125, 44, 'require', { tono: 'spento' }), R('en', 155, 40, 125, 44, 'ensuring', { tono: 'spento' }), R('as', 290, 40, 125, 44, 'assert', { tono: 'spento' }), R('au', 425, 40, 135, 44, 'assume', { tono: 'spento' }),
      T('q', 290, 120, '', { size: 12, bold: true }), T('c', 290, 150, '', { size: 12 }), T('x', 290, 180, '', { size: 12 })],
    passi: [
      { nota: "Quattro modi di scrivere un'asserzione. A runtime fanno tutti la stessa cosa (se la condizione è falsa, eccezione); cambia <b>come si legge</b> l'errore, cioè di chi è la colpa. Immagine: un distributore di caffè." },
      { nota: "<b>require</b>: si controlla <b>prima</b>, è una pre-condizione. Se salta, la colpa è di <b>chi chiama</b>: \"non hai messo le monete\".", set: { rq: { tono: 'dato' }, q: { t: 'require(n >= 0)' }, c: { t: 'prima · colpa di chi chiama' }, x: { t: 'IllegalArgumentException: requirement failed' } } },
      { nota: "<b>ensuring</b>: si controlla <b>dopo</b>, è una post-condizione. Se salta, la colpa è della <b>funzione</b>: \"hai pagato e il caffè non è uscito\". In Scala è un'espressione: <code>(e) ensuring { r =&gt; P(r) }</code> restituisce il valore di e.", set: { rq: { tono: 'spento' }, en: { tono: 'due' }, q: { t: '(if n < 0 then -n else n) ensuring { r => r >= 0 }' }, c: { t: 'dopo · colpa della funzione' }, x: { t: 'AssertionError: assertion failed' } } },
      { nota: "<b>assert</b>: deve valere e basta, in qualsiasi punto. È quello che si usa nei test.", set: { en: { tono: 'spento' }, as: { tono: 'ora' }, q: { t: 'assert(List().size == 0)' }, c: { t: 'ovunque · è un test' }, x: { t: 'AssertionError: assertion failed' } } },
      { nota: "<b>assume</b>: \"considera solo i casi in cui questo è vero\". Per chi verifica il codice è un assioma, non una cosa da dimostrare.", set: { as: { tono: 'spento' }, au: { tono: 'ora' }, q: { t: 'assume(x > 0)' }, c: { t: 'un\'ipotesi · un assioma per il verificatore' }, x: { t: 'AssertionError: assumption failed' } } }
    ]
  };

  const nn = ['-2', '-1', '0', '1', '2', '3', '4', '5'];
  const toni = (da) => Object.fromEntries(nn.map((v, i) => [i, +v >= da ? 'ok' : 'no']));
  SCENE.precondizione = {
    w: 580, h: 200, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [T('t', 250, 26, 'valori di n', { size: 12 }), C('n', 42, 40, nn, { toni: {} }), T('p', 250, 120, '', { size: 13, bold: true }), T('c', 250, 155, '', { size: 12 }), T('c2', 250, 185, '', { size: 12 })],
    passi: [
      { nota: "<code>def factorial(n: Int): Int</code>. Una <b>pre-condizione</b> è una condizione che, se è vera prima della chiamata, garantisce che la funzione si comporta bene." },
      { nota: "<code>n &gt;= 0</code>: con 0, 1, 2, … factorial funziona (factorial(0) = 1, factorial(1) = 1, factorial(5) = 120). Con −1 non finirebbe mai.", set: { n: { toni: toni(0) }, p: { t: 'require(n >= 0)' }, c: { t: 'factorial(-1) → requirement failed' } } },
      { nota: "<code>n &gt;= 2</code> è <b>anche</b> una pre-condizione: se vale, factorial funziona. Ma esclude 0 e 1, che funzionerebbero benissimo. Esclude più casi, quindi è <b>più forte</b>.", set: { n: { toni: toni(2) }, p: { t: 'n >= 2: più forte' }, c: { t: 'esclude 0 e 1 senza motivo' } } },
      { nota: "La <b>più debole</b> è quella che chiede il minimo indispensabile: qui <code>n &gt;= 0</code>. Nelle specifiche si scrive quella; nei test a volte se ne usa una più forte per provare un solo aspetto.", set: { n: { toni: toni(0) }, p: { t: 'n >= 0: la più debole' }, c: { t: 'true = nessuna richiesta, funziona sempre' }, c2: { t: 'false = non funziona mai (es. una funzione che lancia sempre)' } } }
    ]
  };

  SCENE.postcondizione = {
    w: 580, h: 210, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [T('ti', 150, 26, 'n', { size: 12 }), C('in', 20, 36, ['-5', '0', '7', 'MinValue'], { cw: 64, toni: { 0: 'dato', 1: 'dato', 2: 'dato', 3: 'dato' } }), T('to', 150, 106, 'abs(n)', { size: 12 }), C('out', 20, 116, ['', '', '', ''], { cw: 64 }),
      T('p', 440, 60, '', { size: 12, bold: true }), T('c', 440, 100, '', { size: 12 }), T('c2', 440, 130, '', { size: 12 })],
    passi: [
      { nota: "Una <b>post-condizione</b> descrive il risultato corretto. Per <code>abs</code> (valore assoluto) una post-condizione è \"il risultato è ≥ 0\". La controllo con <code>ensuring</code>.", set: { p: { t: 'ensuring { r => r >= 0 }' } } },
      { nota: "−5 → 5, 0 → 0, 7 → 7: la post-condizione regge.", set: { out: { valori: ['5', '0', '7', ''], toni: { 0: 'ok', 1: 'ok', 2: 'ok' } } } },
      { nota: "Int.MinValue = −2147483648 non ha un opposto tra gli Int: <code>-n</code> va in overflow e resta −2147483648. La post-condizione salta: <code>AssertionError: assertion failed</code> (verificato). La colpa è della funzione, non di chi chiama.", set: { out: { valori: ['5', '0', '7', 'MinValue'], toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'no' } }, c: { t: 'abs(Int.MinValue) → AssertionError' } } },
      { nota: "<b>Più forte</b> = garantisce di più. <code>r &gt;= 0</code> è debole; <code>r == n || r == -n</code> dice anche <b>quale</b> numero esce. La più forte di tutte descrive tutto il comportamento, ma spesso è lunga come il codice: allora la si spezza in più condizioni deboli. <code>true</code> = non garantisce niente.", set: { c: { t: 'debole: r >= 0' }, c2: { t: 'più forte: r == n || r == -n' } } }
    ]
  };

  SCENE.contratto = {
    w: 580, h: 220, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: [R('ch', 20, 50, 150, 50, 'chi chiama', { tono: 'spento' }), R('fn', 400, 50, 160, 50, 'get(oa)', { tono: 'spento' }), F('a1', 172, 64, 396, 64, 'pre: oa non vuoto', { nascosto: true }), F('a2', 396, 90, 172, 90, 'post: Some(get(oa)) == oa', { nascosto: true }),
      T('e', 290, 150, '', { size: 12, bold: true }), T('r', 290, 185, '', { size: 12 })],
    passi: [
      { nota: "Un <b>contratto</b> è una coppia: pre-condizione + post-condizione. Esempio delle slide: <code>get</code> su un Option." },
      { nota: "<b>Chi chiama</b> deve garantire la pre: l'Option non è vuoto.", set: { ch: { tono: 'dato' }, a1: { nascosto: false } } },
      { nota: "<b>La funzione</b>, se la pre era vera, deve garantire la post: rimettendo il risultato in un Some si riottiene lo stesso Option.", set: { fn: { tono: 'due' }, a2: { nascosto: false }, e: { t: 'get(Some(1)) = 1', tono: 'ok' }, r: { t: 'Some(1) == Some(1) ✓' } } },
      { nota: "Se chi chiama viola la pre, la funzione non promette niente: con <code>require</code> salta <code>IllegalArgumentException: requirement failed</code>, e la colpa è di chi chiama.", set: { ch: { tono: 'no' }, e: { t: 'get(None)', tono: 'no' }, r: { t: 'IllegalArgumentException: requirement failed' } } },
      { nota: "Contratto ideale: pre <b>più debole</b> possibile (chiedo poco) e post <b>più forte</b> possibile (prometto tanto). Nei test lo si spezza in pezzi: pre più forti + post più deboli. Il contratto più debole di tutti è <code>false =&gt; true</code>: lo rispetta qualsiasi funzione che termina.", set: { ch: { tono: 'dato' }, e: { t: 'ideale: pre debole, post forte', tono: 'ok' }, r: { t: 'nei test: tanti pezzi più piccoli' } } }
    ]
  };

  SCENE.invariante = {
    w: 580, h: 210, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [C('l', 20, 40, ['1', '3', '5', '8', ''], { toni: { 0: 'dato', 1: 'dato', 2: 'dato', 3: 'dato' } }), T('op', 420, 60, '', { size: 12, bold: true }), T('c', 290, 140, '', { size: 12 }), T('c2', 290, 175, '', { size: 12 })],
    passi: [
      { nota: "Un <b>invariante</b> è una proprietà che vale <b>sempre</b>. Invariante di una struttura dati: \"questa lista è ordinata\". Ogni operazione deve riceverla ordinata e lasciarla ordinata." },
      { nota: "<code>insert(4, List(1, 3, 5, 8))</code> mette il 4 al posto giusto: List(1, 3, 4, 5, 8). L'invariante regge (con ScalaCheck: 100 liste a caso, tutte ok).", set: { l: { valori: ['1', '3', '4', '5', '8'], toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok' } }, op: { t: 'insert(4, …)' } } },
      { nota: "Un insert sbagliato, <code>x :: l</code>, mette sempre in testa. ScalaCheck lo trova con la lista List(0) e x = 1: List(1, 0), non ordinata (verificato).", set: { l: { valori: ['1', '0', '', '', ''], toni: { 0: 'no', 1: 'no' } }, op: { t: 'insertRotto(1, List(0))' }, c: { t: 'List(1, 0): invariante rotto' } } },
      { nota: "In un ciclo imperativo c'è l'<b>invariante di ciclo</b> (vale a ogni giro). In FP non ci sono cicli: il suo posto lo prende il <b>contratto della funzione ricorsiva</b>. Altro esempio dalle slide: in un albero AVL le altezze dei due figli differiscono al massimo di 1, in ogni nodo.", set: { c: { t: 'ciclo → invariante di ciclo' }, c2: { t: 'ricorsione (FP) → contratto della funzione' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s008|}}</h1>
  <p class="lede">{{s|s009|}}</p>
</header>

<section>
  <h2>{{s|s010|}}</h2>
  <p>{{s|s011|}}</p>
  <figure class="codice" data-titolo="{{a|s012|}}">
<pre data-lang="scala">assert(List().size == 0)

def f(l: List[Int]): Unit =
  assert((42 :: l).size &gt; 0)
  assert(l.size + 1 == (42 :: l).size)
  assert((42 :: l).headOption == Some(42))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="assert@ora|List().size == 0@dato"><p>{{s|s013|}}</p></li>
      <li data-righe="3-6" data-segna="42 :: l*@due"><p>{{s|s014|}}</p></li>
    </ol>
  </figure>
  <p>{{s|s015|}}</p>
  <figure class="scena" data-scena="asserzione" data-titolo="{{a|s016|}}"></figure>
  <div class="box inglese" data-tit="{{a|s017|}}">
    <p>{{s|s018|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s021|}}</th><th>{{s|s022|}}</th><th>{{s|s023|}}</th><th>{{s|s024|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr>
      <tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td><td>{{s|s032|}}</td></tr>
      <tr><td>{{s|s033|}}</td><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td>{{s|s036|}}</td></tr>
      <tr><td>{{s|s037|}}</td><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="codice" data-titolo="{{a|s041|}}">
<pre data-lang="scala">def factorial(n: Int): Int =
  require(n &gt;= 0, "n deve essere &gt;= 0")
  if n == 0 then 1 else n * factorial(n - 1)

def abs(n: Int): Int =
  (if n &lt; 0 then -n else n) ensuring { r =&gt; r &gt;= 0 }</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="require@dato"><p>{{s|s042|}}</p></li>
      <li data-righe="6" data-segna="ensuring { r =&gt; r &gt;= 0 }@due"><p>{{s|s043|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="sapori" data-titolo="{{a|s044|}}"></figure>
  <div class="box regola" data-tit="{{a|s045|}}">
    <p>{{s|s046|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s047|}}</h2>
  <p>{{s|s048|}}</p>
  <figure class="passi" data-titolo="{{a|s049|}}" data-legenda="{{a|s050|}}">
    <div class="passo"><div class="espr"><mark class="dato">n &gt;= 0</mark>:  ammessi 0, 1, 2, 3, …      factorial(0) = 1, factorial(1) = 1, factorial(5) = 120</div><p class="nota">{{s|s051|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">n &gt;= 2</mark>:  ammessi 2, 3, …   <mark class="no">esclusi 0 e 1</mark></div><p class="nota">{{s|s052|}}</p></div>
    <div class="passo"><div class="espr">n &gt;= 2  ⇒  n &gt;= 0      <mark class="ora">n &gt;= 2 è più forte, n &gt;= 0 è più debole</mark></div><p class="nota">{{s|s053|}}</p></div>
    <div class="passo"><div class="espr">la <mark class="ok">più debole</mark> (weakest pre-condition) = il minimo indispensabile = n &gt;= 0</div><p class="nota">{{s|s054|}}</p></div>
    <div class="passo"><div class="espr">pre = <mark class="ok">true</mark>  → nessuna richiesta, funziona sempre
pre = <mark class="no">false</mark> → non funziona mai</div><p class="nota">{{s|s055|}}</p></div>
  </figure>
  <figure class="scena" data-scena="precondizione" data-titolo="{{a|s056|}}"></figure>
</section>

<section>
  <h2>{{s|s057|}}</h2>
  <p>{{s|s058|}}</p>
  <p>{{s|s059|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s060|}}</th><th>{{s|s061|}}</th><th>{{s|s062|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td></tr>
      <tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td><td>{{s|s068|}}</td></tr>
      <tr><td>{{s|s069|}}</td><td>{{s|s070|}}</td><td>{{s|s071|}}</td></tr>
      <tr><td>{{s|s072|}}</td><td>{{s|s073|}}</td><td>{{s|s074|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="postcondizione" data-titolo="{{a|s075|}}"></figure>
</section>

<section>
  <h2>{{s|s076|}}</h2>
  <p>{{s|s077|}}</p>
  <figure class="codice" data-titolo="{{a|s078|}}">
<pre data-lang="pseudo">def orElse[B &gt;: A](alternative: =&gt; Option[B]): Option[B]
  pre:  true
  post: (!this.isEmpty =&gt; orElse(alternative) == this) &amp;&amp;
        ( this.isEmpty =&gt; orElse(alternative) == alternative)

def maximum(t: Tree[Int]): Int
  pre:  true
  post: (per ogni a in t: a &lt;= maximum(t)) &amp;&amp; (esiste a in t: a == maximum(t))

def get[A](oa: Option[A]): A
  pre:  !oa.isEmpty
  post: Some(get(oa)) == oa</pre>
    <ol class="spiega">
      <li data-righe="1-4" data-segna="=&gt; orElse*@due"><p>{{s|s079|}}</p></li>
      <li data-righe="6-8" data-segna="a &lt;= maximum(t)@due|a == maximum(t)@due"><p>{{s|s080|}}</p></li>
      <li data-righe="10-12" data-segna="!oa.isEmpty@dato|Some(get(oa)) == oa@due"><p>{{s|s081|}}</p></li>
    </ol>
  </figure>
  <div class="colonne">
    <div class="carta buona"><h4>{{s|s082|}}</h4><p>{{s|s083|}}</p></div>
    <div class="carta media"><h4>{{s|s084|}}</h4><p>{{s|s085|}}</p></div>
    <div class="carta cattiva"><h4>{{s|s086|}}</h4><p>{{s|s087|}}</p></div>
  </div>
  <figure class="scena" data-scena="contratto" data-titolo="{{a|s088|}}"></figure>
</section>

<section>
  <h2>{{s|s089|}}</h2>
  <p>{{s|s090|}}</p>
  <ul>
    <li>{{s|s091|}}</li>
    <li>{{s|s092|}}</li>
  </ul>
  <figure class="codice" data-titolo="{{a|s093|}}">
<pre data-lang="scala">def isSorted(l: List[Int]): Boolean =
  l.zip(l.drop(1)).forall((a, b) =&gt; a &lt;= b)

def insert(x: Int, l: List[Int]): List[Int] = l match
  case Nil =&gt; List(x)
  case h :: t =&gt; if x &lt;= h then x :: l else h :: insert(x, t)

forAll { (l: List[Int], x: Int) =&gt; isSorted(insert(x, l.sorted)) }</pre>
    <ol class="spiega">
      <li data-righe="1-2" data-segna="l.zip(l.drop(1))@dato"><p>{{s|s094|}}</p></li>
      <li data-righe="4-6"><p>{{s|s095|}}</p></li>
      <li data-righe="8" data-segna="isSorted@ok|l.sorted@dato"><p>{{s|s096|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="invariante" data-titolo="{{a|s097|}}"></figure>
</section>

</main>
</body>
</html>
