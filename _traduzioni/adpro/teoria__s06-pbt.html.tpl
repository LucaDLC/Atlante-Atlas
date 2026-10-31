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

  SCENE.scenari = {
    w: 580, h: 220, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [T('q', 290, 26, 'legge (sbagliata): l.reverse == l', { bold: true }), R('a', 20, 50, 250, 44, '', { tono: 'spento' }), R('b', 310, 50, 250, 44, '', { tono: 'spento' }),
      T('ra', 145, 125, '', { size: 12 }), T('rb', 435, 125, '', { size: 12 }), T('c', 290, 175, '', { size: 12 }), T('c2', 290, 205, '', { size: 12 })],
    passi: [
      { nota: "Una legge <b>sbagliata</b>: \"girare una lista la lascia uguale\". Vale solo per i palindromi. Vediamo chi se ne accorge." },
      { nota: "<b>Test a scenario</b> (unit test): scelgo io un esempio. Scelgo List(1, 2, 1), girata è uguale: il test passa. Il test prova solo i casi che mi sono venuti in mente.", set: { a: { t: 'List(1, 2, 1).reverse == List(1, 2, 1)', tono: 'dato' }, ra: { t: 'true → passa', tono: 'ok' } } },
      { nota: "<b>Test di proprietà</b>: <code>forAll { (l: List[Int]) =&gt; l.reverse == l }</code>. ScalaCheck genera liste a caso e prova la legge su ognuna.", set: { b: { t: 'forAll { l => l.reverse == l }', tono: 'due' } } },
      { nota: "Dopo 6 liste che passano ne trova una che non va: <code>! Falsified after 6 passed tests.</code>, con controesempio List(0, −1) (verificato). Nessuno aveva pensato a quel caso: l'ha trovato il caso.", set: { rb: { t: 'Falsified: List(0, -1)', tono: 'no' }, c: { t: 'scenario: provi i casi che immagini' }, c2: { t: 'proprietà: provi la legge su input che non immagini' } } }
    ]
  };

  SCENE.forall = {
    w: 580, h: 220, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [T('q', 290, 26, 'forAll { (d: Dadi) => d.a + d.b < 12 }', { bold: true }), C('l', 20, 50, ['', '', '', '', '', '', '', '', '', ''], { cw: 54 }),
      T('n', 290, 130, '', { size: 12 }), T('c', 290, 165, '', { size: 12 }), T('c2', 290, 200, '', { size: 12 })],
    passi: [
      { nota: "Due dadi, <code>case class Dadi(a: Int, b: Int)</code>, generati a caso. Proprietà (sbagliata): \"la somma è sempre meno di 12\". <code>forAll</code> vuol dire \"per ogni coppia di dadi\"." },
      { nota: "ScalaCheck lancia: (4,1), (1,6), (1,3), (2,6), (5,1)… Ogni lancio è un test: la somma è &lt; 12, passa.", set: { l: { valori: ['4,1', '1,6', '1,3', '2,6', '5,1', '…', '', '', '', ''], toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok' } }, n: { t: 'lanci che passano: 1, 2, 3, …' } } },
      { nota: "Il doppio sei esce 1 volta su 36. Al lancio 54 esce: <code>! Falsified after 53 passed tests.</code>, <code>ARG_0: Dadi(6,6)</code> (verificato). Con 3 test a scenario scelti a mano quasi sicuramente non l'avresti provato.", set: { l: { valori: ['4,1', '1,6', '1,3', '2,6', '5,1', '…', '…', '…', '…', '6,6'], toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok', 4: 'ok', 9: 'no' } }, n: { t: 'Falsified after 53 passed tests · ARG_0: Dadi(6,6)', tono: 'no' } } },
      { nota: "La proprietà giusta <code>d.a + d.b &gt;= 2 &amp;&amp; d.a + d.b &lt;= 12</code>: <code>+ OK, passed 100 tests.</code> Di default forAll prova 100 input.", set: { n: { t: 'somma tra 2 e 12: OK, passed 100 tests', tono: 'ok' }, c: { t: 'forAll = "per ogni" (un quantificatore)' }, c2: { t: '100 input a caso invece di una tabella di casi' } } }
    ]
  };

  SCENE.shrink = {
    w: 580, h: 210, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [T('t1', 290, 30, 'ARG_0_ORIGINAL (il primo trovato)', { size: 12 }), R('o', 60, 44, 460, 40, '', { tono: 'spento' }), T('t2', 290, 118, 'ARG_0 (dopo lo shrinking)', { size: 12 }), R('s', 160, 132, 260, 40, '', { tono: 'spento' }), T('c', 290, 200, '', { size: 12 })],
    passi: [
      { nota: "Quando una proprietà fallisce, ScalaCheck stampa il controesempio. Spesso è enorme e illeggibile. Allora prova versioni <b>più piccole</b> (meno elementi, numeri più vicini a 0) e tiene l'ultima che fa ancora fallire la proprietà. Si chiama <b>shrinking</b>." },
      { nota: "Legge <code>l.reverse == l</code>. Il primo controesempio trovato: List(1931840743, 729948336, −1).", set: { o: { t: 'List(1931840743, 729948336, -1)', tono: 'no' } } },
      { nota: "Dopo lo shrinking: List(0, −1). Due elementi diversi bastano a rompere la legge: è il caso più piccolo, e si capisce al volo.", set: { s: { t: 'List(0, -1)', tono: 'ok' }, c: { t: 'leggi ARG_0; ARG_0_ORIGINAL è solo dove è partito' } } }
    ]
  };

  SCENE.implica = {
    w: 580, h: 220, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [R('a', 20, 40, 540, 44, '', { tono: 'spento' }), T('r', 290, 115, '', { size: 12, bold: true }), T('c', 290, 150, '', { size: 12 }), T('c2', 290, 185, '', { size: 12 })],
    passi: [
      { nota: "Il contratto di <code>get</code>: pre = l'Option non è vuoto; post = <code>Some(oa.get) == oa</code>. Provo la post su Option a caso." },
      { nota: "Senza pre-condizione: ScalaCheck genera anche None, e <code>None.get</code> lancia un'eccezione. <code>! Exception raised on property evaluation.</code>, <code>ARG_0: None</code>, <code>NoSuchElementException: None.get</code> (verificato).", set: { a: { t: 'forAll { (oa: Option[Int]) => Some(oa.get) == oa }', tono: 'no' }, r: { t: 'Exception: None.get', tono: 'no' } } },
      { nota: "Con <code>==&gt;</code> (si legge \"implica\"): a sinistra la pre, a destra la post. Se la pre è falsa, quell'input viene <b>scartato</b> e non conta. <code>+ OK, passed 100 tests.</code>", set: { a: { t: 'forAll { (oa: Option[Int]) => oa.nonEmpty ==> (Some(oa.get) == oa) }', tono: 'ok' }, r: { t: 'OK, passed 100 tests', tono: 'ok' }, c: { t: 'forAll = per ogni · ==> = pre · dopo = post' } } },
      { nota: "Il contratto adesso è <b>scritto dentro il test</b>, e vale per 100 input invece che per uno. Attenzione: se la pre scarta quasi tutto, ScalaCheck si arrende (\"Gave up\"). Una pre troppo forte va sostituita da un generatore che produce solo input buoni.", set: { c2: { t: 'pre troppo rara → "Gave up": meglio un generatore apposta' } } }
    ]
  };

  SCENE.gen = {
    w: 580, h: 230, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: [R('g', 20, 40, 250, 44, '', { tono: 'spento' }), F('f', 272, 62, 306, 62, ''), R('v', 310, 40, 250, 44, '', { tono: 'spento' }), T('c', 290, 130, '', { size: 12 }), T('c2', 290, 165, '', { size: 12 }), T('c3', 290, 200, '', { size: 12 })],
    passi: [
      { nota: "Un <b>generatore</b> <code>Gen[A]</code> produce valori a caso di tipo A. È l'idea di <code>Rand[A]</code> della settimana 5: uno stato (il seme) che produce un valore e uno stato nuovo." },
      { nota: "<code>Gen.choose(1, 6)</code>: un dado. Dieci lanci con <code>.sample</code>: 3, 4, 1, 3, 5, 2, 6, 3, 2, 6 (esempio vero; ogni esecuzione dà numeri diversi).", set: { g: { t: 'Gen.choose(1, 6)', tono: 'dato' }, v: { t: '3, 4, 1, 3, 5, 2, 6, 3, 2, 6', tono: 'ok' }, c: { t: 'come nonNegativeLessThan(6) + 1 della settimana 5', tono: 'due' } } },
      { nota: "<code>Gen.frequency(7 -&gt; true, 1 -&gt; false)</code>: true 7 volte su 8. Serve per decidere quando fermarsi (es. foglia o ramo in un albero).", set: { g: { t: 'Gen.frequency(7 -> true, 1 -> false)' }, v: { t: 'true, true, false, true, true, …' }, c: { t: '' } } },
      { nota: "I generatori si compongono con for/yield (Gen ha map e flatMap, come Rand): due dadi = un dado, poi un altro dado.", set: { g: { t: 'for a <- choose(1,6); b <- choose(1,6)' }, v: { t: 'Dadi(4,1), Dadi(1,6), Dadi(1,3), …' }, c: { t: 'Gen è una monade: map, flatMap, for/yield' } } },
      { nota: "<code>Arbitrary[A]</code> è il generatore <b>di default</b> per il tipo A. <code>forAll { (d: Dadi) =&gt; … }</code> lo cerca da solo tra i <code>given</code>. Per Int, List, Option ScalaCheck li ha già; per un tuo tipo lo scrivi tu: <code>given Arbitrary[Dadi] = Arbitrary(genDadi)</code>.", set: { g: { t: 'given Arbitrary[Dadi]', tono: 'dato' }, v: { t: 'forAll { (d: Dadi) => … } lo trova', tono: 'ok' }, c2: { t: 'Gen = come genero · Arbitrary = il Gen di default del tipo' } } }
    ]
  };

  SCENE.file = {
    w: 580, h: 230, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [R('p', 20, 40, 540, 44, '', { tono: 'spento' }), T('o', 290, 120, '', { size: 12, bold: true }), T('c', 290, 160, '', { size: 12 }), T('c2', 290, 195, '', { size: 12 })],
    passi: [
      { nota: "I file di test del corso sono tutti fatti così: un <code>object … extends org.scalacheck.Properties(\"nome\")</code>, e dentro tante righe <code>property(\"nome del test\") = …</code>." },
      { nota: "A destra dell'<code>=</code> può esserci un <b>Boolean</b>: è un test a scenario. ScalaCheck lo controlla una volta e, se è vero, scrive <code>OK, proved property.</code>", set: { p: { t: 'property("Ex01.01: …") = empty.headOption == None', tono: 'dato' }, o: { t: '+ testing.Ex01.01: …: OK, proved property.', tono: 'ok' } } },
      { nota: "Oppure un <b>forAll</b>: è un test di proprietà. Output: <code>OK, passed 100 tests.</code>", set: { p: { t: 'property("…") = forAll { (n: Int) => cons(n, empty).headOption == Some(n) }', tono: 'due' }, o: { t: '+ …: OK, passed 100 tests.' } } },
      { nota: "<code>&amp;&amp;</code> unisce due proprietà in una; <code>:| \"nome\"</code> dà un'etichetta a un pezzo. Se un pezzo fallisce, l'output dice quale: <code>Labels of failing property: uno sbagliato</code> (verificato).", set: { p: { t: 'forAll {…} :| "singleton" && forAll {…} :| "random"', tono: 'due' }, o: { t: 'Labels of failing property: …', tono: 'no' }, c: { t: 'proved property = Boolean (scenario)' }, c2: { t: 'passed 100 tests = forAll (proprietà)' } } }
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
  <p>{{s|s012|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th></th><th>{{s|s013|}}</th><th>{{s|s014|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s015|}}</td><td>{{s|s016|}}</td><td>{{s|s017|}}</td></tr>
      <tr><td>{{s|s018|}}</td><td>{{s|s019|}}</td><td>{{s|s020|}}</td></tr>
      <tr><td>{{s|s021|}}</td><td>{{s|s022|}}</td><td>{{s|s023|}}</td></tr>
      <tr><td>{{s|s024|}}</td><td>{{s|s025|}}</td><td>{{s|s026|}}</td></tr>
      <tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s030|}}</p>
  <figure class="scena" data-scena="scenari" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <p>{{s|s033|}}</p>
  <figure class="codice" data-titolo="{{a|s034|}}">
<pre data-lang="scala">property("Ex04.02: identity is a unit with map") =
  forAll { (t: Tree[Int]) =&gt; Tree.map(t)(identity[Int]) == t }

property("Ex04.03: map does not change size") =
  forAll { (t: Tree[Int], f: Int =&gt; Int) =&gt;
    Tree.size(Tree.map(t)(f)) == Tree.size(t) }

property("Ex04.04: map is 'associative'") =
  forAll { (t: Tree[Int], f: Int =&gt; Int, g: Int =&gt; Int) =&gt;
    Tree.map(Tree.map(t)(f))(g) == Tree.map(t)(g compose f) }</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="(t: Tree[Int])@dato|Tree.map(t)(identity[Int]) == t@ok"><p>{{s|s035|}}</p></li>
      <li data-righe="5-6" data-segna="f: Int =&gt; Int@dato"><p>{{s|s036|}}</p></li>
      <li data-righe="9-10" data-segna="g compose f@ok"><p>{{s|s037|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="forall" data-titolo="{{a|s038|}}"></figure>
</section>

<section>
  <h2>{{s|s039|}}</h2>
  <p>{{s|s040|}}</p>
  <figure class="passi" data-titolo="{{a|s041|}}" data-legenda="{{a|s042|}}">
    <div class="passo"><div class="espr">forAll { (n: Int) =&gt; abs(n) &gt;= 0 }
<mark class="no">! Falsified after 18 passed tests.</mark>
&gt; ARG_0: <mark class="dato">-2147483648</mark></div><p class="nota">{{s|s043|}}</p></div>
    <div class="passo"><div class="espr">forAll { (l: List[Int]) =&gt; l.reverse == l }
<mark class="no">! Falsified after 6 passed tests.</mark>
&gt; ARG_0: <mark class="dato">List("0", "-1")</mark>
&gt; ARG_0_ORIGINAL: List("1931840743", "729948336", "-1")</div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">forAll { (l: List[Int]) =&gt; l.reverse.reverse == l }
<mark class="ok">+ OK, passed 100 tests.</mark></div><p class="nota">{{s|s045|}}</p></div>
  </figure>
  <figure class="scena" data-scena="shrink" data-titolo="{{a|s046|}}"></figure>
</section>

<section>
  <h2>{{s|s047|}}</h2>
  <p>{{s|s048|}}</p>
  <figure class="codice" data-titolo="{{a|s049|}}">
<pre data-lang="scala">property("test get contract (PBT)") =
  forAll { (oa: Option[Int]) =&gt;      // per ogni oa
    !oa.isEmpty ==&gt;                    // pre-condizione
      Some(get(oa)) == oa }            // post-condizione</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="forAll@ora"><p>{{s|s050|}}</p></li>
      <li data-righe="3" data-segna="!oa.isEmpty@dato|==&gt;@dato"><p>{{s|s051|}}</p></li>
      <li data-righe="4" data-segna="Some(get(oa)) == oa@due"><p>{{s|s052|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="implica" data-titolo="{{a|s053|}}"></figure>
</section>

<section>
  <h2>{{s|s054|}}</h2>
  <p>{{s|s055|}}</p>
  <figure class="codice" data-titolo="{{a|s056|}}">
<pre data-lang="scala">def genTree[A](using arbA: Arbitrary[A]): Gen[Tree[A]] =
  for coin &lt;- Gen.frequency(7 -&gt; true, 1 -&gt; false)
      tree &lt;- if coin
        then arbA.arbitrary.map(Leaf.apply)
        else genTree.flatMap { l =&gt; genTree.map { Branch(l, _) } }
  yield tree

given arbitraryTree: [A: Arbitrary] =&gt; Arbitrary[Tree[A]] =
  Arbitrary[Tree[A]](genTree)</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="using arbA: Arbitrary[A]@dato"><p>{{s|s057|}}</p></li>
      <li data-righe="2" data-segna="Gen.frequency(7 -&gt; true, 1 -&gt; false)@ora"><p>{{s|s058|}}</p></li>
      <li data-righe="3-4" data-segna="arbA.arbitrary.map(Leaf.apply)@ok"><p>{{s|s059|}}</p></li>
      <li data-righe="5" data-segna="genTree.flatMap@due"><p>{{s|s060|}}</p></li>
      <li data-righe="8-9" data-segna="given arbitraryTree@dato"><p>{{s|s061|}}</p></li>
    </ol>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s062|}}</th><th>{{s|s063|}}</th><th>{{s|s064|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s065|}}</td><td>{{s|s066|}}</td><td>{{s|s067|}}</td></tr>
      <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td></tr>
      <tr><td>{{s|s071|}}</td><td>{{s|s072|}}</td><td>{{s|s073|}}</td></tr>
      <tr><td>{{s|s074|}}</td><td>{{s|s075|}}</td><td>{{s|s076|}}</td></tr>
      <tr><td>{{s|s077|}}</td><td>{{s|s078|}}</td><td>{{s|s079|}}</td></tr>
      <tr><td>{{s|s080|}}</td><td>{{s|s081|}}</td><td>{{s|s082|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="gen" data-titolo="{{a|s083|}}"></figure>
</section>

<section>
  <h2>{{s|s084|}}</h2>
  <p>{{s|s085|}}</p>
  <figure class="codice" data-titolo="{{a|s086|}}">
<pre data-lang="scala">object LazyListSpec
  extends org.scalacheck.Properties("testing"):

  property("Ex01.01: headOption returns None on an empty LazyList") =
    empty.headOption == None

  property("Ex01.02: headOption returns the head of the stream packaged in Some") =
    given Arbitrary[LazyList[Int]] = Arbitrary(genNonEmptyLazyList[Int])
    forAll { (n: Int) =&gt; cons(n, empty).headOption == Some(n) } :| "singleton" &amp;&amp;
    forAll { (s: LazyList[Int]) =&gt; s.headOption != None }      :| "random"</pre>
    <ol class="spiega">
      <li data-righe="1-2" data-segna="org.scalacheck.Properties@dato"><p>{{s|s087|}}</p></li>
      <li data-righe="4-5" data-segna="empty.headOption == None@dato"><p>{{s|s088|}}</p></li>
      <li data-righe="8" data-segna="given Arbitrary[LazyList[Int]]@ora"><p>{{s|s089|}}</p></li>
      <li data-righe="9-10" data-segna="&quot;singleton&quot;@due|&quot;random&quot;@due|&amp;&amp;@ora"><p>{{s|s090|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="file" data-titolo="{{a|s091|}}"></figure>
  <div class="box esame" data-tit="{{a|s092|}}">
    <p>{{s|s093|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s094|}}">
    <p>{{s|s095|}}</p>
  </div>
</section>

</main>
</body>
</html>
