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
SCENE.strategie = {
  w: 580, h: 250, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 't1', tipo: 'testo', x: 140, y: 22, t: 'if1(true, id(23), id(42))', size: 13, bold: true },
    { id: 't2', tipo: 'testo', x: 430, y: 22, t: 'if3(true, id(23), id(42))', size: 13, bold: true },
    { id: 'st', tipo: 'testo', x: 140, y: 42, t: 'strict', size: 12 },
    { id: 'bn', tipo: 'testo', x: 430, y: 42, t: 'by-name', size: 12 },
    { id: 'a1', tipo: 'nodo', forma: 'quadrato', r: 26, x: 90, y: 100, t: 'id(23)' },
    { id: 'b1', tipo: 'nodo', forma: 'quadrato', r: 26, x: 190, y: 100, t: 'id(42)' },
    { id: 'a2', tipo: 'nodo', forma: 'quadrato', r: 26, x: 380, y: 100, t: 'id(23)' },
    { id: 'b2', tipo: 'nodo', forma: 'quadrato', r: 26, x: 480, y: 100, t: 'id(42)' },
    { id: 'o1', tipo: 'testo', x: 140, y: 170, t: 'console:', size: 13 },
    { id: 'o2', tipo: 'testo', x: 430, y: 170, t: 'console:', size: 13 },
    { id: 'r1', tipo: 'testo', x: 140, y: 205, t: '', size: 14, bold: true },
    { id: 'r2', tipo: 'testo', x: 430, y: 205, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { a1: { tono: 'ora' }, o1: { t: 'console: 23' } } },
    { nota: '{{j|s005|'}}', set: { a1: { tono: 'ok' }, b1: { tono: 'ora' }, o1: { t: 'console: 23 42' } } },
    { nota: '{{j|s006|'}}', set: { b1: { tono: 'spento' }, r1: { t: 'risultato 23', tono: 'ok' } } },
    { nota: '{{j|s007|'}}', set: { a2: { tono: 'ora' }, o2: { t: 'console: 23' } } },
    { nota: '{{j|s008|'}}', set: { a2: { tono: 'ok' }, b2: { tono: 'spento' }, r2: { t: 'risultato 23', tono: 'ok' } } }
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

    SCENE.trabocchetto = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [T('e', 290, 28, 'val res = if2(a < 22, () => println("a"), () => println("b"))', { bold: true, size: 12 }),
        R('c', 20, 60, 160, 40, '42 < 22', { tono: 'spento' }), R('t', 210, 60, 160, 40, '() => println("a")', { tono: 'spento' }), R('f', 400, 60, 160, 40, '() => println("b")', { tono: 'spento' }),
        T('out', 290, 140, '', { size: 12 }), T('r', 290, 185, '', { bold: true, size: 15 })],
      passi: [
        { nota: "Il sondaggio: <code>if2</code> riceve la condizione e due <b>ricette</b>, una per ramo. a = 42." },
        { nota: "42 &lt; 22 è <b>falso</b>.", set: { c: { t: 'false', tono: 'ora' } } },
        { nota: "Quindi si esegue solo la ricetta del ramo falso: stampa \"b\". Quella del ramo vero non viene mai eseguita.", set: { f: { tono: 'due' }, t: { tono: 'no' }, out: { t: 'stampa: b' } } },
        { nota: "Ma quanto vale <b>res</b>? println restituisce <b>Unit</b>: res = <code>()</code> (verificato). La stampa è un effetto, non il valore: \"b\" non è il risultato.", set: { r: { t: 'res = ()', tono: 'ok' } } }
      ]
    };

    SCENE.lazyval = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [T('e', 290, 28, '', { bold: true }), T('s1', 290, 70, '', { size: 12 }), T('s2', 290, 100, '', { size: 12 }), T('s3', 290, 130, '', { size: 12 }), T('r', 290, 180, '', { bold: true }), T('c', 290, 212, '', { size: 12 })],
      passi: [
        { nota: "Un parametro by-name si ricalcola a ogni uso. Per calcolarlo una volta sola: <b>lazy val</b>. <code>lazy val pesante = { println(\"&gt;&gt; calcolato!\"); 42 }</code>: definito, nessuna stampa.", set: { e: { t: 'lazy val pesante = { println(">> calcolato!"); 42 }' } } },
        { nota: "<code>println(\"prima\")</code>: il programma va avanti, pesante non è ancora calcolato.", set: { s1: { t: 'prima' } } },
        { nota: "Primo uso: <code>println(pesante)</code> calcola: stampa \"&gt;&gt; calcolato!\" e poi 42.", set: { s2: { t: '>> calcolato!   42', tono: 'ora' } } },
        { nota: "Secondo uso: ricorda, stampa solo 42 (verificato).", set: { s3: { t: '42', tono: 'ok' } } },
        { nota: "<code>convoluted(a, b)</code> con <code>lazy val cacheB = b; lazy val cacheA = a</code>, poi cacheA; cacheB; cacheA; cacheB: stampa <b>\"AB\"</b>. Conta l'ordine d'<b>uso</b>, non di definizione; senza lazy val stamperebbe \"ABAB\".", set: { r: { t: 'convoluted(print("A"), print("B")) → AB', tono: 'ok' }, c: { t: 'val: subito, 1 volta · lazy val: al primo uso, 1 volta · def: ogni volta' } } }
      ]
    };

    SCENE.strategie3 = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s011|'}}',
      oggetti: [T('e', 290, 26, 'f(x) = x + x,   x = { print("!"); 5 }', { bold: true }),
        R('v', 20, 50, 170, 44, 'call-by-value', { tono: 'spento' }), R('n', 205, 50, 170, 44, 'call-by-name', { tono: 'spento' }), R('l', 390, 50, 170, 44, 'lazy', { tono: 'spento' }),
        T('tv', 105, 120, '', { size: 12 }), T('tn', 290, 120, '', { size: 12 }), T('tl', 475, 120, '', { size: 12 }), T('c', 290, 175, '', { size: 12 }), T('c2', 290, 205, '', { size: 12 })],
      passi: [
        { nota: "Tre strategie per gli argomenti. Esempio: f usa x due volte, e calcolare x stampa \"!\"." },
        { nota: "<b>Call-by-value</b>: gli argomenti si calcolano <b>prima</b> della chiamata, una volta. Stampa \"!\" una volta, prima di entrare.", set: { v: { tono: 'ora' }, tv: { t: '! una volta, prima' } } },
        { nota: "<b>Call-by-name</b> (<code>x: =&gt; Int</code>): si sostituisce l'espressione, calcolata a <b>ogni uso</b>. Stampa \"!\" due volte.", set: { n: { tono: 'ora' }, tn: { t: '! ! a ogni uso' } } },
        { nota: "<b>Lazy</b> = call-by-name + memoria: calcolata al primo uso, poi ricordata. Una stampa, ma solo se x serve. Il risultato è 10 in tutti e tre: in un programma <b>puro</b> cambiano solo tempo e memoria.", set: { l: { tono: 'ora' }, tl: { t: '! una volta, al 1° uso' }, c: { t: 'risultato 10 in tutti e tre', tono: 'ok' } } },
        { nota: "<b>Strict</b>: f(x) non termina (o fallisce) quando x non termina. if, &amp;&amp;, || non lo sono: <code>false &amp;&amp; crash()</code> vale false. Con by-name si scrivono nuovi costrutti: <code>whenByName(false) { println(\"By name\") }</code> non stampa niente, la versione by-value sì (verificato). È il trucco di withScope in Apache Spark.", set: { c2: { t: 'whenByValue(false){…} stampa · whenByName(false){…} no' } } }
      ]
    };

    SCENE.acosaserve = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s012|'}}',
      oggetti: [R('u1', 20, 40, 260, 44, '', { tono: 'spento' }), R('u2', 300, 40, 260, 44, '', { tono: 'spento' }), T('c', 290, 130, '', { size: 12 }), T('c2', 290, 170, '', { size: 12 })],
      passi: [
        { nota: "Quattro usi della valutazione non strict." },
        { nota: "<b>Funzioni non strict</b>: <code>getOrElse(default: =&gt; B)</code>. Il default si calcola solo con None.", set: { u1: { t: 'Some(7).getOrElse(costoso)', tono: 'ok' }, u2: { t: 'costoso: mai calcolato', tono: 'spento' } } },
        { nota: "<b>Dati grandi</b>: descrivi tutto, calcoli solo le parti che servono davvero.", set: { u1: { t: 'take(10) di un miliardo' }, u2: { t: '≈ 50 celle calcolate', tono: 'ok' } } },
        { nota: "<b>Generatori</b>: liste infinite di naturali, primi, numeri casuali.", set: { u1: { t: 'naturals, fibs, random2' }, u2: { t: 'infinite, ma prendi quanto vuoi', tono: 'ok' } } },
        { nota: "<b>Separare il cosa dal come</b>: la descrizione del calcolo è un valore; l'esecuzione avviene dopo, e solo del pezzo che ti serve.", set: { u1: { t: 'descrizione (cosa)' }, u2: { t: 'esecuzione, a richiesta (come)', tono: 'ok' }, c: { t: 'laziness: calcolare solo quello che serve, quando serve' } } }
      ]
    };

    const E = [['h :: t().toList', 'Found: (h : () => A)  Required: A', 'h() :: t().toList'], ['t.takeWhile(p)', 'value takeWhile is not a member of () => LazyList[A]', 't().takeWhile(p)'], ['case Cons(h: => A, …)', 'val parameters may not be call-by-name', 'case Cons(h: () => A, …)']];
    SCENE.hcontroh = {
      w: 600, h: 210, lato: true,
      legenda: '{{j|s013|'}}',
      oggetti: [T('n', 300, 24, '', { bold: true }), R('s', 20, 40, 270, 40, '', { tono: 'no' }), R('g', 310, 40, 270, 40, '', { tono: 'ok' }), T('m', 300, 120, '', { size: 12, bold: true }), T('c', 300, 180, '', { size: 12 })],
      passi: [{ nota: "La confusione più frequente della settimana: <b>h</b> è la ricetta, <b>h()</b> è il valore." }].concat(E.map(([s, m, g], i) => ({
        nota: ['<code>::</code> vuole il <b>valore</b>: h(), non h.', 't è una funzione, e le funzioni non hanno takeWhile. Prima esegui la ricetta: <code>t()</code>.', 'I campi di un case non possono essere by-name: per questo Cons usa <code>() =&gt; A</code>, e cons risolve il problema. Regola: <code>=&gt; A</code> si usa scrivendo il nome, <code>() =&gt; A</code> scrivendo nome().'][i],
        set: { n: { t: 'errore ' + (i + 1) + ' di 3' }, s: { t: s }, g: { t: g }, m: { t: m, tono: 'no' }, c: { t: i === 2 ? '=> A: scrivi x · () => A: scrivi x()' : '' } }
      })))
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s014|}}</h1>
  <p class="lede">{{s|s015|}}</p>
</header>

<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
  <pre class="cod" data-lang="scala">def id[A](a: A): A =
  println(a)
  a</pre>

  <figure class="passi" data-titolo="{{a|s018|}}">
    <div class="passo">
      <div class="espr">def if1[A](cond: Boolean, onTrue: <mark class="dato">A</mark>, onFalse: <mark class="dato">A</mark>): A =
  if cond then onTrue else onFalse</div>
      <p class="nota">{{s|s019|}}</p>
    </div>
    <div class="passo">
      <div class="espr">if1(true, <mark class="ora">id(23)</mark>, id(42))      <span class="mano">stampa: 23</span></div>
      <p class="nota">{{s|s020|}}</p>
    </div>
    <div class="passo">
      <div class="espr">if1(true, 23, <mark class="no">id(42)</mark>)          <span class="mano">stampa: 42</span></div>
      <p class="nota">{{s|s021|}}</p>
    </div>
    <div class="passo">
      <div class="espr">if true then 23 else 42   =   <mark class="ok">23</mark>        <span class="mano">output: 23 42</span></div>
      <p class="nota">{{s|s022|}}</p>
    </div>
  </figure>

  <figure class="passi" data-titolo="{{a|s023|}}">
    <div class="passo">
      <div class="espr">def if2[A](cond: Boolean, onTrue: <mark class="due">() => A</mark>, onFalse: <mark class="due">() => A</mark>): A =
  if cond then onTrue<mark class="ora">()</mark> else onFalse<mark class="ora">()</mark></div>
      <p class="nota">{{s|s024|}}</p>
    </div>
    <div class="passo">
      <div class="espr">if2(true, <mark class="due">() => id(23)</mark>, <mark class="due">() => id(42)</mark>)</div>
      <p class="nota">{{s|s025|}}</p>
    </div>
    <div class="passo">
      <div class="espr">if true then (() => id(23))<mark class="ora">()</mark> else …   <span class="mano">stampa: 23</span></div>
      <p class="nota">{{s|s026|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">23</mark>        <span class="mano">output: 23</span></div>
      <p class="nota">{{s|s027|}}</p>
    </div>
  </figure>

  <figure class="passi" data-titolo="{{a|s028|}}">
    <div class="passo">
      <div class="espr">def if3[A](cond: Boolean, onTrue: <mark class="ora">=> A</mark>, onFalse: <mark class="ora">=> A</mark>): A =
  if cond then onTrue else onFalse</div>
      <p class="nota">{{s|s029|}}</p>
    </div>
    <div class="passo">
      <div class="espr">if3(true, <mark class="ora">id(23)</mark>, <mark class="ora">id(42)</mark>)</div>
      <p class="nota">{{s|s030|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">23</mark>        <span class="mano">output: 23</span></div>
      <p class="nota">{{s|s031|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="strategie" data-titolo="{{a|s032|}}"></figure>

  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s033|}}</th><th>{{s|s034|}}</th><th>{{s|s035|}}</th><th>{{s|s036|}}</th></tr></thead>
    <tbody>
      <tr><td><code>x: A</code></td><td>{{s|s037|}}</td><td><code>x</code></td><td>{{s|s038|}}</td></tr>
      <tr><td><code>x: () => A</code></td><td>{{s|s039|}}</td><td><code>x()</code></td><td>{{s|s040|}}</td></tr>
      <tr><td><code>x: => A</code></td><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s044|}}</h2>
  <pre class="cod" data-lang="scala">val a = 42
val res = if2(a &lt; 22, () => println("a"), () => println("b"))</pre>
  <p>{{s|s045|}}</p>
  <figure class="scena" data-scena="trabocchetto" data-titolo="{{a|s046|}}"></figure>
</section>

<section>
  <h2>{{s|s047|}}</h2>
  <p>{{s|s048|}}</p>
  <figure class="passi" data-titolo="{{a|s049|}}">
    <div class="passo">
      <div class="espr">lazy val pesante = { println("&gt;&gt; calcolato!"); 42 }</div>
      <p class="nota">{{s|s050|}}</p>
    </div>
    <div class="passo">
      <div class="espr">println("prima")        <span class="mano">stampa: prima</span></div>
      <p class="nota">{{s|s051|}}</p>
    </div>
    <div class="passo">
      <div class="espr">println(<mark class="ora">pesante</mark>)       <span class="mano">stampa: &gt;&gt; calcolato!  42</span></div>
      <p class="nota">{{s|s052|}}</p>
    </div>
    <div class="passo">
      <div class="espr">println(<mark class="ok">pesante</mark>)       <span class="mano">stampa: 42</span></div>
      <p class="nota">{{s|s053|}}</p>
    </div>
  </figure>
  <figure class="passi" data-titolo="{{a|s054|}}">
    <div class="passo">
      <div class="espr">def convoluted(a: => Unit, b: => Unit): Unit =
  lazy val cacheB = b
  lazy val cacheA = a
  cacheA; cacheB; cacheA; cacheB</div>
      <p class="nota">{{s|s055|}}</p>
    </div>
    <div class="passo"><div class="espr"><mark class="ora">cacheA</mark>; cacheB; cacheA; cacheB        <span class="mano">stampa: A</span></div><p class="nota">{{s|s056|}}</p></div>
    <div class="passo"><div class="espr">cacheA; <mark class="ora">cacheB</mark>; cacheA; cacheB        <span class="mano">stampa: B</span></div><p class="nota">{{s|s057|}}</p></div>
    <div class="passo"><div class="espr">cacheA; cacheB; <mark class="ok">cacheA</mark>; <mark class="ok">cacheB</mark>        <span class="mano">niente</span></div><p class="nota">{{s|s058|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">AB</mark></div><p class="nota">{{s|s059|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s060|}}</th><th>{{s|s061|}}</th><th>{{s|s062|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>1</td></tr>
      <tr><td>{{s|s065|}}</td><td>{{s|s066|}}</td><td>1</td></tr>
      <tr><td>{{s|s067|}}</td><td>{{s|s068|}}</td><td>{{s|s069|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="lazyval" data-titolo="{{a|s070|}}"></figure>
</section>

<section>
  <h2>{{s|s071|}}</h2>
  <div class="box regola" data-tit="{{a|s072|}}">
    <p>{{s|s073|}}</p>
  </div>
  <div class="box regola" data-tit="{{a|s074|}}">
    <p>{{s|s075|}}</p>
  </div>
  <div class="box regola" data-tit="{{a|s076|}}">
    <p>{{s|s077|}}</p>
  </div>
  <div class="box regola" data-tit="{{a|s078|}}">
    <p>{{s|s079|}}</p>
  </div>
  <p>{{s|s080|}}</p>
  <figure class="passi" data-titolo="{{a|s081|}}">
    <div class="passo">
      <div class="espr">def whenByValue(cond: Boolean)(body: <mark class="dato">Unit</mark>): Unit = if cond then body
whenByValue(false) { println("By value") }</div>
      <p class="nota">{{s|s082|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="no">By value</mark>          <span class="mano">stampato anche se cond è false!</span></div>
      <p class="nota">{{s|s083|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def whenByName(cond: Boolean)(body: <mark class="ora">=> Unit</mark>): Unit = if cond then body
whenByName(false) { println("By name") }          <span class="mano">niente</span></div>
      <p class="nota">{{s|s084|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="strategie3" data-titolo="{{a|s085|}}"></figure>
</section>

<section>
  <h2>{{s|s086|}}</h2>
  <ul>
    <li>{{s|s087|}}</li>
    <li>{{s|s088|}}</li>
    <li>{{s|s089|}}</li>
    <li>{{s|s090|}}</li>
  </ul>
  <figure class="scena" data-scena="acosaserve" data-titolo="{{a|s091|}}"></figure>
</section>

<section>
  <h2>{{s|s092|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => h :: t().toList</pre>
      <pre class="msg">Found:    (h : () => A)
Required: A</pre>
      <div class="fix"><code>h</code> è la ricetta, <code>h()</code> è il valore. <code>::</code> vuole il valore: <code>h()</code>.</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => if p(h()) then cons(h(), t.takeWhile(p)) else empty</pre>
      <pre class="msg">value takeWhile is not a member of () => LazyList[A]</pre>
      <div class="fix"><code>t</code> è una funzione, e le funzioni non hanno il metodo <code>takeWhile</code>. Prima esegui la ricetta: <code>t().takeWhile(p)</code>.</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">enum LazyList[+A]:
  case Cons(h: => A, t: => LazyList[A])</pre>
      <pre class="msg">val parameters may not be call-by-name</pre>
      <div class="fix">Ecco perché il <code>Cons</code> del corso usa <code>() => A</code>: i campi di un <code>case</code> non possono essere by-name. Il costruttore comodo <code>cons</code> (<a href="s04-lazylist.html">pagina successiva</a>) risolve il problema.</div>
    </div>
  </div>
  <div class="box regola" data-tit="{{a|s093|}}">
    <p>{{s|s094|}}</p>
  </div>
  <figure class="scena" data-scena="hcontroh" data-titolo="{{a|s095|}}"></figure>
</section>

</main>
</body>
</html>
