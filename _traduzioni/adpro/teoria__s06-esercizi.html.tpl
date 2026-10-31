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
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

  SCENE.es1 = {
    w: 580, h: 220, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [R('imp', 20, 40, 180, 44, '', { tono: 'spento' }), R('t1', 220, 40, 160, 44, 'Ex01.01', { tono: 'spento' }), R('t2', 400, 40, 160, 44, 'Ex01.02', { tono: 'spento' }),
      T('c', 290, 130, '', { size: 12 }), T('c2', 290, 165, '', { size: 12 }), T('c3', 290, 200, '', { size: 12 })],
    passi: [
      { nota: "Il file dei test importa <b>una</b> implementazione della LazyList in cima: <code>import lazyList00.*</code>. Cambiando l'import si provano gli stessi test su un'altra implementazione. Output veri." },
      { nota: "<b>lazyList00</b>: la versione del libro, quella giusta. Passa tutti e due i test. Deve passare <b>tutti</b> i tuoi test, altrimenti perdi il 35%.", set: { imp: { t: 'import lazyList00.*', tono: 'dato' }, t1: { tono: 'ok' }, t2: { tono: 'ok' }, c: { t: 'OK, proved property · OK, passed 100 tests' } } },
      { nota: "<b>lazyList01</b>: <code>headOption</code> su Empty fa <code>???</code>. Ex01.01 salta con <code>NotImplementedError: an implementation is missing</code>. Ex01.02 passa, perché prova solo liste non vuote.", set: { imp: { t: 'import lazyList01.*' }, t1: { tono: 'no' }, t2: { tono: 'ok' }, c: { t: 'Ex01.01: NotImplementedError' }, c2: { t: 'headOption su Empty = ???' } } },
      { nota: "<b>lazyList02</b>: <code>cons</code> restituisce sempre <code>Empty</code>, quindi ogni lista è vuota. Ex01.01 passa (la lista vuota è vuota lo stesso); Ex01.02 fallisce sul pezzo con l'etichetta <code>singleton</code>: <code>cons(0, empty).headOption</code> dà None invece di Some(0).", set: { imp: { t: 'import lazyList02.*' }, t1: { tono: 'ok' }, t2: { tono: 'no' }, c: { t: 'Ex01.02: Falsified · Labels: singleton · ARG_0: 0' }, c2: { t: 'cons(…) = Empty: ogni lista è vuota' }, c3: { t: 'ogni test uccide un mutante diverso' } } }
    ]
  };

  SCENE.bomba = {
    w: 580, h: 210, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [C('l', 20, 40, ['1', 'coda'], { cw: 90, toni: { 0: 'dato', 1: 'spento' } }), T('e', 380, 60, '', { size: 12, bold: true }), T('c', 290, 130, '', { size: 12 }), T('c2', 290, 165, '', { size: 12 }), T('c3', 290, 200, '', { size: 12 })],
    passi: [
      { nota: "La <b>bomba</b>: <code>def bomba[A]: A = throw RuntimeException(\"forzato!\")</code>. Ha qualsiasi tipo e, appena qualcuno la calcola, lancia un'eccezione. Il PDF dice esplicitamente che è permesso." },
      { nota: "<code>cons(1, bomba)</code>: non esplode. <code>cons</code> riceve la coda <b>per nome</b> (<code>tl: =&gt; LazyList[A]</code>) e la tiene in sospeso.", set: { l: { valori: ['1', 'bomba'], toni: { 0: 'dato', 1: 'no' } }, e: { t: 'cons(1, bomba) → nessuna esplosione', tono: 'ok' } } },
      { nota: "<code>cons(1, bomba).headOption</code> con la LazyList giusta: Some(1), la coda non viene mai toccata.", set: { l: { toni: { 0: 'ok', 1: 'no' } }, e: { t: '.headOption = Some(1)', tono: 'ok' }, c: { t: 'la bomba è rimasta intatta: headOption è pigro' } } },
      { nota: "Una headOption che guarda la coda (un mutante) fa esplodere la bomba: eccezione → il test fallisce → mutante ucciso. Un'eccezione non catturata conta come test fallito (lo dice il PDF).", set: { e: { t: 'mutante: RuntimeException: forzato!', tono: 'no' }, c2: { t: 'la bomba è un sensore: "qualcuno mi ha calcolato"' }, c3: { t: 'nella testa = "hai forzato la testa" · nella coda = "hai forzato la coda"' } } }
    ]
  };

  SCENE.pigrizia = {
    w: 580, h: 220, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [T('q', 290, 26, '', { bold: true, size: 13 }), C('l', 20, 44, ['', '', '', '', '', ''], { cw: 70 }), T('c', 290, 140, '', { size: 12 }), T('c2', 290, 175, '', { size: 12 })],
    passi: [
      { nota: "Tre forme di lista con le bombe, una per esercizio. Ognuna mette le bombe proprio dove la funzione <b>non</b> deve guardare." },
      { nota: "<b>Es. 3</b>, <code>take</code> non forza niente: una lista infinita di teste-bomba. <code>bombe.take(n)</code> non deve esplodere, basta chiamarlo.", set: { q: { t: 'Es. 3: bombe.take(n)' }, l: { valori: ['bomba', 'bomba', 'bomba', 'bomba', 'bomba', '…'], toni: { 0: 'no', 1: 'no', 2: 'no', 3: 'no', 4: 'no' } }, c: { t: 'take(n) da solo non calcola nessuna testa' } } },
      { nota: "<b>Es. 4</b>, con n = 3: tre elementi buoni e poi una bomba. <code>take(3).toList</code> calcola i primi 3, ma la quarta testa non deve essere toccata. Risultato List(1, 2, 3).", set: { q: { t: 'Es. 4: buoniPoiBomba(3).take(3).toList' }, l: { valori: ['1', '2', '3', 'bomba', '', ''], toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'no' } }, c: { t: '= List(1, 2, 3): la (n+1)-esima testa è intatta' } } },
      { nota: "<b>Es. 7</b>, con n = 3: tre bombe e poi 1, 2, 3. <code>drop(3).toList</code> salta le bombe senza calcolarle e calcola il resto: List(1, 2, 3).", set: { q: { t: 'Es. 7: bombePoi(3, LazyList(1, 2, 3)).drop(3).toList' }, l: { valori: ['bomba', 'bomba', 'bomba', '1', '2', '3'], toni: { 0: 'no', 1: 'no', 2: 'no', 3: 'ok', 4: 'ok', 5: 'ok' } }, c: { t: 'drop tocca le code, mai le teste scartate' }, c2: { t: 'Es. 2 (headOption): cons(n, bomba), la bomba nella coda' } } }
    ]
  };

  SCENE.leggi = {
    w: 580, h: 220, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [R('a', 20, 40, 260, 44, '', { tono: 'spento' }), R('b', 300, 40, 260, 44, '', { tono: 'spento' }), T('r', 290, 120, '', { size: 12, bold: true }), T('c', 290, 160, '', { size: 12 }), T('c2', 290, 195, '', { size: 12 })],
    passi: [
      { nota: "Le leggi (es. 5, 6, 8) si confrontano sempre con <code>.toList</code>. Prima la trappola." },
      { nota: "<code>LazyList(1, 2) == LazyList(1, 2)</code> è <b>false</b> (verificato), anche sulla LazyList giusta. Dentro una Cons ci sono funzioni <code>() =&gt; A</code>, e due funzioni diverse non sono mai ==. Un test scritto con == fallisce su lazyList00: −35%.", set: { a: { t: 'LazyList(1, 2)', tono: 'dato' }, b: { t: 'LazyList(1, 2)', tono: 'dato' }, r: { t: '== → false', tono: 'no' } } },
      { nota: "Con <code>.toList</code> si confrontano i valori: <code>l.take(n).take(n).toList == l.take(n).toList</code> passa 100 test.", set: { a: { t: 'l.take(n).take(n).toList' }, b: { t: 'l.take(n).toList' }, r: { t: 'OK, passed 100 tests', tono: 'ok' } } },
      { nota: "Un trucco in più: la <b>List di Scala come oracolo</b>. È già corretta, quindi la LazyList deve darle ragione: <code>list2lazyList(la).take(n).toList == la.take(n)</code>. Scopre anche un take che prende un elemento in più.", set: { a: { t: 'list2lazyList(la).take(n).toList', tono: 'dato' }, b: { t: 'la.take(n)', tono: 'due' }, r: { t: 'la List fa da arbitro', tono: 'ok' }, c: { t: 'es. 5 e 6: la legge + l\'oracolo' }, c2: { t: 'es. 8: l.map(identity).toList == l.toList' } } }
    ]
  };

  SCENE.infinita = {
    w: 580, h: 210, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: [C('l', 20, 40, ['1', '2', '3', '4', '5', '…'], { cw: 60, toni: { 0: 'dato', 1: 'dato', 2: 'dato', 3: 'dato', 4: 'dato' } }), T('r', 290, 120, '', { size: 12, bold: true }), T('c', 290, 160, '', { size: 12 }), T('c2', 290, 195, '', { size: 12 })],
    passi: [
      { nota: "<b>Es. 9</b>: map deve terminare anche su una lista infinita. L'idea: fai map su una lista infinita, poi prendi un pezzo finito e controllalo." },
      { nota: "map pigro (quello giusto): <code>l.map(_ + 1).take(3).toList</code> calcola solo 3 elementi: List(2, 3, 4).", set: { l: { valori: ['2', '3', '4', '…', '', ''], toni: { 0: 'ok', 1: 'ok', 2: 'ok' } }, r: { t: 'map pigro: termina', tono: 'ok' } } },
      { nota: "map stretto (un mutante): prima calcola <b>tutta</b> la coda, poi mette la testa. Su una lista infinita non finisce mai: la ricorsione riempie lo stack. Il test muore con un'eccezione → mutante ucciso (verificato).", set: { l: { valori: ['…', '…', '…', '…', '…', '…'], toni: { 0: 'no', 1: 'no', 2: 'no', 3: 'no', 4: 'no', 5: 'no' } }, r: { t: 'map stretto: StackOverflowError', tono: 'no' }, c: { t: 'liste infinite: infiniteLazyList[Int] (già nel file)' }, c2: { t: 'o LazyList.from(1), preso tramite l\'import in cima' } } }
    ]
  };

  SCENE.append = {
    w: 580, h: 220, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [C('a', 20, 40, ['1', '2'], { toni: { 0: 'dato', 1: 'dato' } }), C('b', 140, 40, ['bomba'], { cw: 70, toni: { 0: 'no' } }), T('r', 400, 60, '', { size: 12, bold: true }), T('c', 290, 140, '', { size: 12 }), T('c2', 290, 175, '', { size: 12 }), T('c3', 290, 205, '', { size: 12 })],
    passi: [
      { nota: "<b>Es. 10</b>: le proprietà di <code>append</code> le scegli tu. <code>append(that: =&gt; LazyList)</code> riceve that per nome: dovrebbe calcolarlo solo quando serve." },
      { nota: "Con this non vuota: <code>LazyList(1, 2).append(bomba)</code> non esplode. that serve solo dopo il 2.", set: { r: { t: 'nessuna esplosione', tono: 'ok' } } },
      { nota: "Con this <b>vuota</b>: il risultato <b>è</b> that, quindi anche la versione giusta lo calcola. <code>Empty.append(bomba)</code> esplode su lazyList00 (verificato). Un test \"append non forza that\" su liste anche vuote fallisce sulla versione giusta: −35%.", set: { a: { valori: ['', ''], toni: {} }, r: { t: 'Empty.append(bomba) → esplode anche su lazyList00', tono: 'no' }, c: { t: 'usa genNonEmptyLazyList per questo test' } } },
      { nota: "Altre proprietà: l'oracolo <code>l1.append(l2).toList == l1.toList ++ l2.toList</code>; una lista infinita con qualsiasi cosa attaccata dietro dà gli stessi primi n elementi.", set: { a: { valori: ['1', '2'], toni: { 0: 'dato', 1: 'dato' } }, r: { t: '' }, c: { t: 'oracolo: append = ++ delle List' }, c2: { t: 'infinita.append(x).take(n) = infinita.take(n)' }, c3: { t: 'pigrizia: solo con this non vuota' } } }
    ]
  };

  SCENE.mutanti = {
    w: 580, h: 210, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [R('g', 20, 40, 160, 44, 'lazyList00', { tono: 'dato' }), R('m', 210, 40, 170, 44, '', { tono: 'spento' }), R('e', 410, 40, 150, 44, '', { tono: 'spento' }), T('c', 290, 130, '', { size: 12 }), T('c2', 290, 165, '', { size: 12 })],
    passi: [
      { nota: "Un <b>mutante</b> è la LazyList giusta con <b>una</b> funzione rotta. Il correttore ne ha tanti; i tuoi test devono accorgersi di ognuno." },
      { nota: "Esempio: <code>drop</code> che calcola le teste che scarta. Il risultato è giusto, cambia solo la pigrizia.", set: { m: { t: 'drop forza le teste', tono: 'no' } } },
      { nota: "Lancio i test: Ex07 (la lista con n bombe davanti) esplode. Almeno un test fallisce → mutante <b>ucciso</b> (verificato).", set: { e: { t: 'Ex07 fallisce', tono: 'ok' }, c: { t: 'ucciso = almeno un test fallisce' } } },
      { nota: "Se nessun test fallisse, il mutante <b>sopravvive</b>: manca un test. Lo si scrive guardando cosa ha rotto il mutante: il risultato (una legge, l'oracolo) o la pigrizia (una bomba).", set: { e: { t: 'nessuno fallisce?', tono: 'due' }, c2: { t: 'sopravvissuto → manca un test su risultato o pigrizia' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s009|}}</h1>
  <p class="lede">{{s|s010|}}</p>
</header>

<section>
  <h2>{{s|s011|}}</h2>
  <p>{{s|s012|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s013|}}</th><th>{{s|s014|}}</th><th>{{s|s015|}}</th><th>{{s|s016|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s017|}}</td><td>{{s|s018|}}</td><td>{{s|s019|}}</td><td>{{s|s020|}}</td></tr>
      <tr><td>{{s|s021|}}</td><td>{{s|s022|}}</td><td>{{s|s023|}}</td><td>{{s|s024|}}</td></tr>
      <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s029|}}</p>
  <figure class="scena" data-scena="es1" data-titolo="{{a|s030|}}"></figure>
  <figure class="codice" data-titolo="{{a|s031|}}">
<pre data-lang="scala">import lazyList00.* // uncomment to test the book laziness solution implementation
// import lazyList01.* // uncomment to test the broken headOption implementation
// import lazyList02.* // uncomment to test another version

import LazyList.*

object LazyListSpec
  extends org.scalacheck.Properties("testing"):

  def list2lazyList[A](la: List[A]): LazyList[A] =
    LazyList(la*)

  def genNonEmptyLazyList[A](using Arbitrary[A]): Gen[LazyList[A]] =
    for la &lt;- arbitrary[List[A]].suchThat { _.nonEmpty }
    yield list2lazyList(la)

  property("Ex01.01: headOption returns None on an empty LazyList") =
    empty.headOption == None

  property("Ex01.02: headOption returns the head of the stream packaged in Some") =
    given Arbitrary[LazyList[Int]] = Arbitrary(genNonEmptyLazyList[Int])
    forAll { (n: Int) =&gt; cons(n,empty).headOption == Some(n) } :| "singleton" &amp;&amp;
    forAll { (s: LazyList[Int]) =&gt; s.headOption != None }      :| "random"</pre>
    <ol class="spiega">
      <li data-righe="1-3" data-segna="import lazyList00.*@ora"><p>{{s|s032|}}</p></li>
      <li data-righe="5" data-segna="import LazyList.*@due"><p>{{s|s033|}}</p></li>
      <li data-righe="7-8" data-segna="Properties(&quot;testing&quot;)@dato"><p>{{s|s034|}}</p></li>
      <li data-righe="10-11" data-segna="la*@due"><p>{{s|s035|}}</p></li>
      <li data-righe="13-15" data-segna="using Arbitrary[A]@dato|suchThat { _.nonEmpty }@ora"><p>{{s|s036|}}</p></li>
      <li data-righe="17-18" data-segna="empty.headOption == None@dato"><p>{{s|s037|}}</p></li>
      <li data-righe="20-23" data-segna="given Arbitrary[LazyList[Int]]@ora|&quot;singleton&quot;@due|&quot;random&quot;@due"><p>{{s|s038|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s039|}}">
    <p>{{s|s040|}}</p>
    <div class="tab-wrap"><table class="tab">
      <thead><tr><th></th><th>{{s|s041|}}</th><th>{{s|s042|}}</th><th>{{s|s043|}}</th></tr></thead>
      <tbody>
        <tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td><td>{{s|s047|}}</td></tr>
        <tr><td>{{s|s048|}}</td><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td>✓</td></tr>
        <tr><td>{{s|s051|}}</td><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr>
      </tbody>
    </table></div>
    <p>{{s|s055|}}</p>
  </div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s056|}}</th><th>{{s|s057|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s058|}}</td><td>{{s|s059|}}</td></tr>
      <tr><td>{{s|s060|}}</td><td>{{s|s061|}}</td></tr>
      <tr><td>{{s|s062|}}</td><td>{{s|s063|}}</td></tr>
      <tr><td>{{s|s064|}}</td><td>{{s|s065|}}</td></tr>
      <tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td></tr>
      <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td></tr>
      <tr><td>{{s|s070|}}</td><td>{{s|s071|}}</td></tr>
      <tr><td>{{s|s072|}}</td><td>{{s|s073|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="passi" data-titolo="{{a|s074|}}" data-legenda="{{a|s075|}}">
    <div class="passo"><div class="espr">lazyList01:  def headOption = this match { case Empty =&gt; <mark class="ora">???</mark> … }</div><p class="nota">{{s|s076|}}</p></div>
    <div class="passo"><div class="espr">Ex01.01:  <mark class="dato">empty</mark>.headOption  →  ???  →  <mark class="no">NotImplementedError: an implementation is missing</mark></div><p class="nota">{{s|s077|}}</p></div>
    <div class="passo"><div class="espr">lazyList02:  def cons(hd, tl) = <mark class="ora">Empty</mark></div><p class="nota">{{s|s078|}}</p></div>
    <div class="passo"><div class="espr">Ex01.02 singleton:  cons(<mark class="dato">0</mark>, empty) = Empty  →  .headOption = None  ≠  Some(0)  →  <mark class="no">Falsified</mark></div><p class="nota">{{s|s079|}}</p></div>
    <div class="passo"><div class="espr">Ex01.01:  empty.headOption = None  →  <mark class="ok">passa</mark></div><p class="nota">{{s|s080|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s081|}}</h2>
  <p>{{s|s082|}}</p>
  <figure class="codice" data-titolo="{{a|s083|}}">
<pre data-lang="scala">def bomba[A]: A = throw RuntimeException("forzato!")

val genN: Gen[Int] = Gen.choose(0, 50)

given Arbitrary[LazyList[Int]] =
  Arbitrary(arbitrary[List[Int]].map(list2lazyList))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="throw@no"><p>{{s|s084|}}</p></li>
      <li data-righe="3" data-segna="Gen.choose(0, 50)@dato"><p>{{s|s085|}}</p></li>
      <li data-righe="5-6" data-segna="arbitrary[List[Int]].map(list2lazyList)@ok"><p>{{s|s086|}}</p></li>
    </ol>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s087|}}</th><th>{{s|s088|}}</th><th>{{s|s089|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s090|}}</td><td>{{s|s091|}}</td><td>2, 3, 4, 7, 10</td></tr>
      <tr><td>{{s|s092|}}</td><td>{{s|s093|}}</td><td>{{s|s094|}}</td></tr>
      <tr><td>{{s|s095|}}</td><td>{{s|s096|}}</td><td>{{s|s097|}}</td></tr>
      <tr><td>{{s|s098|}}</td><td>{{s|s099|}}</td><td>5, 6, 10</td></tr>
    </tbody>
  </table></div>
  <div class="box domanda-tua" data-tit="{{a|s100|}}">
    <p>{{s|s101|}}</p>
    <pre class="cod" data-lang="scala" data-segna="genLazyList*@due">// senza Arbitrary: un Gen, passato a mano a forAll
val genLazyList: Gen[LazyList[Int]] =
  arbitrary[List[Int]].map(list2lazyList)

forAll(genLazyList, genNonNegativeInt) { (l, n) =&gt; … }</pre>
    <p>{{s|s102|}}</p>
  </div>
  <figure class="scena" data-scena="bomba" data-titolo="{{a|s103|}}"></figure>
</section>

<section>
  <h2>{{s|s104|}}</h2>
  <p>{{s|s105|}}</p>
  <ul>
    <li>{{s|s106|}}</li>
    <li>{{s|s107|}}</li>
    <li>{{s|s108|}}</li>
    <li>{{s|s109|}}</li>
  </ul>
  <figure class="passi" data-titolo="{{a|s110|}}" data-legenda="{{a|s111|}}">
    <div class="passo"><div class="espr">case Cons(h: () =&gt; A, t: () =&gt; LazyList[A])</div><p class="nota">{{s|s112|}}</p></div>
    <div class="passo"><div class="espr">cons(7, bomba)  =  Cons(<mark class="dato">[7]</mark>, <mark class="no">[bomba]</mark>)</div><p class="nota">{{s|s113|}}</p></div>
    <div class="passo"><div class="espr">headOption  =  foldRight(None)((h, _) =&gt; Some(h))
foldRight su Cons(h, t)  =  f(<mark class="ora">h()</mark>, ⟨t().foldRight(z)(f)⟩)</div><p class="nota">{{s|s114|}}</p></div>
    <div class="passo"><div class="espr">f(7, ⟨…⟩)  con  f = (h, <mark class="ora">_</mark>) =&gt; Some(h)   →   <mark class="ok">Some(7)</mark></div><p class="nota">{{s|s115|}}</p></div>
    <div class="passo"><div class="espr">mutante:  case Cons(h, t) =&gt; <mark class="no">t()</mark>; Some(h())   →   RuntimeException: forzato!</div><p class="nota">{{s|s116|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s117|}}">
    <p>{{s|s118|}}</p>
    <pre class="cod" data-lang="pseudo">··def infiniteLazyList…        2 spazi: membro dell'object
····Gen.const(loop)             4 spazi: dentro infiniteLazyList
··/* The test suite */          commento: non conta
····def tailDevelopFinder…      4 spazi: finisce DENTRO infiniteLazyList   ✗
··def tailDevelopFinder…        2 spazi: membro dell'object, lo vedono i test   ✓</pre>
    <p>{{s|s119|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s120|}}">
    <p>{{s|s121|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s122|}}" data-legenda="{{a|s123|}}">
    <div class="passo"><div class="espr">bombe.take(n)          bombe = Cons(⟨bomba⟩, ⟨bombe⟩)
cons(1, bomba).take(n) = Cons(⟨1⟩, ⟨bomba⟩)
true</div><p class="nota">{{s|s124|}}</p></div>
    <div class="passo"><div class="espr">take giusta:  cons(⟨h()⟩, ⟨t().take(n - 1)⟩)   →  nessuna busta aperta  →  <mark class="ok">OK, passed 100 tests</mark></div><p class="nota">{{s|s125|}}</p></div>
    <div class="passo"><div class="espr">take rotta A:  <mark class="ora">val x = h()</mark>; cons(x, …)
  bombe.take(3)           → h() = <mark class="no">bomba</mark>  →  Exception, ARG_0: 3
  cons(1, bomba).take(3)  → h() = 1, la coda resta chiusa  →  non se ne accorgerebbe</div><p class="nota">{{s|s126|}}</p></div>
    <div class="passo"><div class="espr">take rotta B:  <mark class="ora">val r = t().take(n - 1)</mark>; cons(h(), r)
  bombe.take(3)           → t() = bombe, che non è una bomba  →  non se ne accorgerebbe
  cons(1, bomba).take(3)  → t() = <mark class="no">bomba</mark>  →  Exception, ARG_0: 2</div><p class="nota">{{s|s127|}}</p></div>
  </figure>
  <div class="errori">
    <div class="errore">
<pre data-lang="scala">forAll(Gen.choose(0, 50)) { n =&gt;
  bombe.take(n).toList
  true }</pre>
<pre class="msg">! testing.Ex03.X: con toList (sbagliato): Exception raised on property evaluation.
&gt; ARG_0: 1
&gt; Exception: java.lang.RuntimeException: forzato!</pre>
      <div class="fix">Fallisce sulla LazyList <b>giusta</b>: <code>toList</code> legge il risultato e quindi apre le teste, che sono bombe. Nell'es. 3 il risultato di take non va guardato; aprire le teste del risultato è permesso, ed è l'es. 4 a controllare quali.</div>
    </div>
  </div>
  <figure class="passi" data-titolo="{{a|s128|}}" data-legenda="{{a|s129|}}">
    <div class="passo"><div class="espr testo">{{s|s130|}}</div><p class="nota">{{s|s131|}}</p></div>
    <div class="passo"><div class="espr testo">{{s|s132|}}</div><p class="nota">{{s|s133|}}</p></div>
    <div class="passo"><div class="espr">property("Ex02: headOption does not force the tail") =
  forAll { (n: Int) =&gt; cons(<mark class="dato">n</mark>, <mark class="no">bomba</mark>).headOption == <mark class="ok">Some(n)</mark> }</div><p class="nota">{{s|s134|}}</p></div>
    <div class="passo"><div class="espr">lazyList00:  foldRight(None)((h, <mark class="ora">_</mark>) =&gt; Some(h))   →   <mark class="ok">OK, passed 100 tests.</mark></div><p class="nota">{{s|s135|}}</p></div>
    <div class="passo"><div class="espr">mutante:  case Cons(h, t) =&gt; <mark class="ora">t()</mark>; Some(h())   →   <mark class="no">Exception raised … RuntimeException: forzato!</mark></div><p class="nota">{{s|s136|}}</p></div>
  </figure>
  <figure class="passi" data-titolo="{{a|s137|}}" data-legenda="{{a|s138|}}">
    <div class="passo"><div class="espr">headForceFinderAfter(3)  =  <mark class="dato">1</mark>, <mark class="dato">2</mark>, <mark class="dato">3</mark>, <mark class="no">bomba</mark></div><p class="nota">{{s|s139|}}</p></div>
    <div class="passo"><div class="espr">take(3) su 1:  <mark class="ora">case Cons(h, t) if n &gt; 1</mark> =&gt; cons(h(), t().take(2))</div><p class="nota">{{s|s140|}}</p></div>
    <div class="passo"><div class="espr">toList apre: 1 · poi take(2) su 2: <mark class="ora">n &gt; 1</mark> · 2 · poi take(1) su 3: <mark class="ora">case Cons(h, _) if n == 1</mark> =&gt; cons(h(), empty)</div><p class="nota">{{s|s141|}}</p></div>
    <div class="passo"><div class="espr">toList = <mark class="ok">List(1, 2, 3)</mark>  ==  List.range(1, 4) = List(1, 2, 3)</div><p class="nota">{{s|s142|}}</p></div>
    <div class="passo"><div class="espr">mutante: case Cons(h, _) if n == 0 =&gt; <mark class="no">h()</mark>; empty   →   ARG_0: 0, Head Forced!</div><p class="nota">{{s|s143|}}</p></div>
  </figure>
  <details class="soluzione"><summary>{{s|s144|}}</summary><div>
<pre class="cod" data-lang="scala">// liste con le bombe
def bombe: LazyList[Int] = cons(bomba, bombe)

def buoniPoiBomba(n: Int, i: Int = 1): LazyList[Int] =
  if n == 0 then cons(bomba, empty) else cons(i, buoniPoiBomba(n - 1, i + 1))

def bombePoi(n: Int, rest: LazyList[Int]): LazyList[Int] =
  if n == 0 then rest else cons(bomba, bombePoi(n - 1, rest))

property("Ex02: headOption does not force the tail") =
  forAll { (n: Int) =&gt; cons(n, bomba).headOption == Some(n) }

property("Ex03: take does not force heads nor tails") =
  forAll(genN) { n =&gt;
    bombe.take(n)
    cons(1, bomba).take(n)
    true }

property("Ex04: take(n) does not force the (n+1)st head") =
  forAll(genN) { n =&gt; buoniPoiBomba(n).take(n).toList == List.range(1, n + 1) }

property("Ex07: drop(n) does not force dropped heads") =
  forAll(genN) { n =&gt; bombePoi(n, LazyList(1, 2, 3)).drop(n).toList == List(1, 2, 3) }</pre>
  </div></details>
  <figure class="scena" data-scena="pigrizia" data-titolo="{{a|s145|}}"></figure>
</section>

<section>
  <h2>{{s|s146|}}</h2>
  <p>{{s|s147|}}</p>
  <div class="errori">
    <div class="errore">
<pre data-lang="scala">forAll(arbitrary[LazyList[Int]], genN) { (l, n) =&gt;
  l.take(n).take(n) == l.take(n) }</pre>
<pre class="msg">! testing.EQ: take(n).take(n) == take(n) con ==: Falsified after 2 passed tests.
&gt; ARG_0: Cons(adpro.lazyList.lazyList00.LazyList$$$Lambda/…
&gt; ARG_1: 1</pre>
      <div class="fix">Fallisce sulla LazyList <b>giusta</b>: dentro una Cons ci sono funzioni, e due funzioni diverse non sono mai uguali (<code>LazyList(1, 2) == LazyList(1, 2)</code> è false). I 2 test passati erano liste vuote (<code>Empty == Empty</code>). Si confronta con <code>.toList</code>.</div>
    </div>
  </div>
  <figure class="passi" data-titolo="{{a|s148|}}" data-legenda="{{a|s149|}}">
    <div class="passo"><div class="espr">l = 1, 2, 3, 4, 5   n = 1   m = 2
l.drop(1).drop(2) = 4, 5      l.drop(3) = 4, 5   <mark class="ok">uguali</mark></div><p class="nota">{{s|s150|}}</p></div>
    <div class="passo"><div class="espr">n = 4   m = 3:   l.drop(4).drop(3) = ()   l.drop(7) = ()   <mark class="ok">uguali</mark></div><p class="nota">{{s|s151|}}</p></div>
    <div class="passo"><div class="espr">mutante  case Cons(_, t) if <mark class="no">n &gt; 1</mark>  (scarta uno in meno)
oracolo:  list2lazyList(List(0)).drop(1).toList = List(0)   ≠   <mark class="due">List(0).drop(1)</mark> = List()</div><p class="nota">{{s|s152|}}</p></div>
  </figure>
  <div class="errori">
    <div class="errore">
<pre data-lang="scala">def headForceFinderAfter(n: Int, i: Int = 1): LazyList[Int] =
  if n == 0 then cons(headForceFinder, empty) …

forAll(genNonNegativeInt) { n =&gt; … }      // ma il generatore si chiama Genn</pre>
<pre class="msg">[error] .\Exercises.scala:50:25
[error] Not found: headForceFinder
[error] .\Exercises.scala:89:12
[error] Not found: genNonNegativeInt</pre>
      <div class="fix">Dal tuo file: si usa un nome che non è definito da nessuna parte. <code>headForceFinder</code> mancava (c'era solo <code>tailForceFinder</code>), e il generatore era definito come <code>Genn</code> ma usato come <code>genNonNegativeInt</code>. Un nome, una definizione: aggiungi <code>def headForceFinder[A]: A = throw RuntimeException("Head Forced!")</code> e usa lo stesso nome del generatore ovunque.</div>
    </div>
  </div>
  <details class="soluzione"><summary>{{s|s153|}}</summary><div>
<pre class="cod" data-lang="scala">property("Ex05: take(n).take(n) == take(n)") =
  forAll(arbitrary[LazyList[Int]], genN) { (l, n) =&gt;
    l.take(n).take(n).toList == l.take(n).toList } &amp;&amp;
  forAll(infiniteLazyList[Int], genN) { (l, n) =&gt;
    l.take(n).take(n).toList == l.take(n).toList } &amp;&amp;
  forAll { (la: List[Int]) =&gt; forAll(genN) { n =&gt;
    list2lazyList(la).take(n).toList == la.take(n) } }

property("Ex06: drop(n).drop(m) == drop(n + m)") =
  forAll(arbitrary[LazyList[Int]], genN, genN) { (l, n, m) =&gt;
    l.drop(n).drop(m).toList == l.drop(n + m).toList } &amp;&amp;
  forAll { (la: List[Int]) =&gt; forAll(genN) { n =&gt;
    list2lazyList(la).drop(n).toList == la.drop(n) } }

property("Ex08: map(identity) == l") =
  forAll { (l: LazyList[Int]) =&gt; l.map(identity).toList == l.toList }</pre>
  </div></details>
  <figure class="scena" data-scena="leggi" data-titolo="{{a|s154|}}"></figure>
</section>

<section>
  <h2>{{s|s155|}}</h2>
  <p>{{s|s156|}}</p>
  <details class="soluzione"><summary>{{s|s157|}}</summary><div>
<pre class="cod" data-lang="scala">property("Ex09: map terminates on infinite lists") =
  forAll(infiniteLazyList[Int], genN) { (l, n) =&gt;
    l.map(_ + 1).take(n).toList == l.take(n).toList.map(_ + 1) }</pre>
  </div></details>
  <figure class="scena" data-scena="infinita" data-titolo="{{a|s158|}}"></figure>
</section>

<section>
  <h2>{{s|s159|}}</h2>
  <p>{{s|s160|}}</p>
  <div class="errori">
    <div class="errore">
<pre data-lang="scala">property("append does not force its argument") =
  forAll { (l: LazyList[Int]) =&gt; l.append(bomba); true }</pre>
<pre class="msg">! testing.Ex10.02: append does not force its argument: Exception raised on property evaluation.
&gt; ARG_0: Empty
&gt; Exception: java.lang.RuntimeException: forzato!</pre>
      <div class="fix">Fallisce sulla LazyList <b>giusta</b>: se <code>l</code> è vuota, <code>l.append(that)</code> <b>è</b> <code>that</code>, e restituirlo vuol dire calcolarlo. La proprietà vale solo per <code>l</code> non vuota: <code>forAll(genNonEmptyLazyList[Int]) { l =&gt; … }</code>. Errore mio, trovato provando il file su lazyList00: prova sempre i tuoi test sulla versione giusta.</div>
    </div>
  </div>
  <details class="soluzione"><summary>{{s|s161|}}</summary><div>
<pre class="cod" data-lang="scala">property("Ex10.01: append = ++ on lists") =
  forAll { (l1: LazyList[Int], l2: LazyList[Int]) =&gt;
    l1.append(l2).toList == l1.toList ++ l2.toList }

property("Ex10.02: append does not force its argument (non-empty this)") =
  forAll(genNonEmptyLazyList[Int]) { l =&gt; l.append(bomba); true }

property("Ex10.03: infinite append anything = infinite") =
  forAll(infiniteLazyList[Int], genN) { (l, n) =&gt;
    l.append(bomba).take(n).toList == l.take(n).toList }</pre>
  </div></details>
  <figure class="scena" data-scena="append" data-titolo="{{a|s162|}}"></figure>
</section>

<section>
  <h2>{{s|s163|}}</h2>
  <p>{{s|s164|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s165|}}</th><th>{{s|s166|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s167|}}</td><td>{{s|s168|}}</td></tr>
      <tr><td>{{s|s169|}}</td><td>{{s|s170|}}</td></tr>
      <tr><td>{{s|s171|}}</td><td>{{s|s172|}}</td></tr>
      <tr><td>{{s|s173|}}</td><td>{{s|s174|}}</td></tr>
      <tr><td>{{s|s175|}}</td><td>{{s|s176|}}</td></tr>
      <tr><td>{{s|s177|}}</td><td>{{s|s178|}}</td></tr>
      <tr><td>{{s|s179|}}</td><td>{{s|s180|}}</td></tr>
      <tr><td>{{s|s181|}}</td><td>{{s|s182|}}</td></tr>
      <tr><td>{{s|s183|}}</td><td>{{s|s184|}}</td></tr>
      <tr><td>{{s|s185|}}</td><td>{{s|s186|}}</td></tr>
      <tr><td>{{s|s187|}}</td><td>{{s|s188|}}</td></tr>
      <tr><td>{{s|s189|}}</td><td>{{s|s190|}}</td></tr>
      <tr><td>{{s|s191|}}</td><td>{{s|s192|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s193|}}">
    <p>{{s|s194|}}</p>
  </div>
  <figure class="scena" data-scena="mutanti" data-titolo="{{a|s195|}}"></figure>
</section>

</main>
</body>
</html>
