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
SCENE.macchine = {
  w: 600, h: 250, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'i2', tipo: 'nodo', r: 20, x: 50, y: 60, t: '2', tono: 'dato' },
    { id: 'add', tipo: 'nodo', forma: 'quadrato', r: 34, x: 170, y: 60, t: 'add' },
    { id: 'f2', tipo: 'nodo', forma: 'quadrato', r: 44, x: 330, y: 60, t: 'y => 2 + y', nascosto: true },
    { id: 'i3', tipo: 'nodo', r: 20, x: 330, y: 150, t: '3', tono: 'dato', nascosto: true },
    { id: 'r5', tipo: 'nodo', r: 22, x: 490, y: 60, t: '5', tono: 'ok', nascosto: true },
    { id: 'a1', tipo: 'arco', da: 'i2', a: 'add', dir: true },
    { id: 'a2', tipo: 'arco', da: 'add', a: 'f2', dir: true, nascosto: true },
    { id: 'a3', tipo: 'arco', da: 'i3', a: 'f2', dir: true, nascosto: true },
    { id: 'a4', tipo: 'arco', da: 'f2', a: 'r5', dir: true, nascosto: true },
    { id: 'n', tipo: 'testo', x: 300, y: 230, t: 'add = (x: Int) => (y: Int) => x + y', size: 13, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { add: { tono: 'ora' }, a2: { nascosto: false }, f2: { nascosto: false, tono: 'ok' }, n: { t: 'add(2) = y => 2 + y' } } },
    { nota: '{{j|s005|'}}', set: { add: { tono: null }, f2: { tono: 'ora' }, i3: { nascosto: false }, a3: { nascosto: false } } },
    { nota: '{{j|s006|'}}', set: { f2: { tono: null }, a4: { nascosto: false }, r5: { nascosto: false }, n: { t: 'add(2)(3) = 5', tono: 'ok' } } },
    { nota: '{{j|s007|'}}', set: { i2: { t: '−3' }, add: { t: 'abs', tono: 'ora' }, f2: { t: 'square', tono: 'ora' }, i3: { nascosto: true }, a3: { nascosto: true }, r5: { t: '9' }, n: { t: 'compose(square, abs)(−3) = square(abs(−3)) = 9', tono: 'ok' } } }
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

    SCENE.curried = {
      w: 580, h: 250, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [
        T('h1', 20, 30, 'add2 = (x, y) => x + y', { anchor: 'start', bold: true, size: 12 }),
        R('a2in', 20, 45, 80, 36, '2, 3', { tono: 'dato' }), R('a2', 150, 40, 150, 46, 'add2', { tono: 'ora' }), R('a2out', 350, 45, 80, 36, '', { tono: 'ok' }),
        F('f1', 102, 63, 146, 63, ''), F('f2', 302, 63, 346, 63, ''),
        T('h2', 20, 130, 'add = x => y => x + y', { anchor: 'start', bold: true, size: 12 }),
        R('bin', 20, 145, 60, 36, '', { tono: 'dato' }), R('b', 110, 140, 90, 46, 'add', { tono: 'ora' }), R('bmid', 240, 140, 150, 46, '', { tono: 'due', nascosto: true }),
        R('bin2', 420, 145, 50, 36, '', { tono: 'dato', nascosto: true }), R('bout', 500, 145, 60, 36, '', { tono: 'ok', nascosto: true }),
        T('c', 290, 226, '', { size: 12 })
      ],
      passi: [
        { nota: "<b>Insieme</b>: <code>add2</code> ha tipo <code>(Int, Int) =&gt; Int</code>. Vuole tutti e due gli argomenti <b>subito</b>: add2(2, 3) = 5.", set: { a2out: { t: '5' } } },
        { nota: "<b>Uno alla volta</b> (curried): <code>add</code> ha tipo <code>Int =&gt; (Int =&gt; Int)</code>. Gli do solo il 2.", set: { bin: { t: '2' } } },
        { nota: "Esce una <b>funzione nuova</b>, con il 2 già dentro: <code>y =&gt; 2 + y</code>. Si chiama <b>applicazione parziale</b>.", set: { bmid: { nascosto: false, t: 'y => 2 + y' }, c: { t: 'add(2) = y => 2 + y' } } },
        { nota: "Il secondo argomento, 3, chiama quella funzione: 2 + 3 = 5. Stesso risultato di add2(2, 3), ma in due chiamate: <code>add(2)(3)</code>.", set: { bin2: { nascosto: false, t: '3' }, bout: { nascosto: false, t: '5' }, c: { t: 'add(2)(3) = 5' } } },
        { nota: "Il vantaggio: fissare il primo argomento una volta e riusare la funzione. <code>val incr = add(1)</code> è una Int =&gt; Int, e incr(7) = 8.", set: { bin: { t: '1' }, bmid: { t: 'incr = y => 1 + y' }, bin2: { t: '7' }, bout: { t: '8' }, c: { t: 'val incr = add(1); incr(7) = 8', tono: 'ok' } } }
      ]
    };

    SCENE.scrivicurry = {
      w: 560, h: 170,
      codice: { lang: 'scala', testo: `def curry[A, B, C](f: (A, B) => C): A => (B => C) =
  a => b => f(a, b)` },
      legenda: '{{j|s009|'}}',
      oggetti: [
        T('l1', 140, 26, 'devo produrre', { size: 12 }), R('dev', 40, 40, 200, 40, 'A => (B => C)', { tono: 'ora' }),
        T('l2', 420, 26, 'ho in mano', { size: 12 }), R('ho', 320, 40, 200, 40, 'f: (A, B) => C', { tono: 'dato' }),
        T('sc', 280, 120, 'curry(f) = ???', { bold: true, size: 14 })
      ],
      passi: [
        { nota: "Esercizio 5: i tipi dicono ogni pezzo. Si confronta cosa devo <b>produrre</b> con cosa ho <b>in mano</b>.", righe: [1] },
        { nota: "Devo produrre una funzione che prende un A: si scrive con la freccia, <code>a =&gt;</code>. Ora ho in mano anche a, e resta da produrre B =&gt; C.", righe: [2], set: { dev: { t: 'B => C' }, ho: { t: 'f, a: A' }, sc: { t: 'a => ???' } } },
        { nota: "B =&gt; C è un'altra funzione: <code>b =&gt;</code>. Ora ho anche b, resta da produrre un C.", righe: [2], set: { dev: { t: 'C' }, ho: { t: 'f, a: A, b: B' }, sc: { t: 'a => b => ???' } } },
        { nota: "L'unico modo di ottenere un C è chiamare f con un A e un B: <code>f(a, b)</code>. Non c'erano altre scelte: il codice era scritto nel tipo.", righe: [2], set: { dev: { t: 'fatto', tono: 'ok' }, sc: { t: 'a => b => f(a, b)', tono: 'ok' } } },
        { nota: "uncurry fa il viaggio inverso: <code>(a, b) =&gt; f(a)(b)</code>. uncurry(curry(f)) si comporta come f: è quello che controllano i test dell'esercizio 6.", set: { sc: { t: 'uncurry(curry(f)) ≡ f' } } }
      ]
    };

    SCENE.riuso = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [
        R('is', 20, 40, 160, 50, 'isSorted[A]', { tono: 'dato' }), T('ist', 100, 110, '(array, criterio) => Boolean', { size: 11 }),
        R('cu', 220, 40, 110, 50, 'curry', { tono: 'ora', nascosto: true }), F('f1', 182, 65, 216, 65, '', { nascosto: true }), F('f2', 332, 65, 376, 65, '', { nascosto: true }),
        R('isc', 380, 40, 180, 50, 'isSortedCurried[A]', { tono: 'ok', nascosto: true }), T('isct', 470, 110, 'array => criterio => Boolean', { size: 11, nascosto: true }),
        T('call', 290, 160, '', { bold: true, size: 12 }), T('ris', 290, 196, '', { size: 12 })
      ],
      passi: [
        { nota: "isSorted prende array e criterio <b>insieme</b>. Serve la versione che li prende <b>uno alla volta</b>." },
        { nota: "Non si riscrive niente: si passa isSorted a <code>curry</code>. Le quadre <code>[A]</code> dicono per quale tipo.", set: { cu: { nascosto: false }, f1: { nascosto: false }, f2: { nascosto: false }, isc: { nascosto: false }, isct: { nascosto: false } } },
        { nota: "Si chiama con due coppie di parentesi: prima l'array…", set: { call: { t: 'isSortedCurried(Array(1, 2, 3))' }, ris: { t: '→ una funzione che aspetta il criterio' } } },
        { nota: "…poi il criterio: true. Il primo argomento può \"configurare\" la funzione una volta, il secondo arrivare dopo. E <code>uncurry(isSortedCurried[A])</code> riporta alla forma a due argomenti.", set: { call: { t: 'isSortedCurried(Array(1, 2, 3))(_ <= _)' }, ris: { t: '→ true', tono: 'ok' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s011|}}</h1>
  <p class="lede">{{s|s012|}}</p>
</header>

<section>
  <h2>{{s|s013|}}</h2>
  <div class="colonne">
    <div class="carta">
      <h4>{{s|s014|}}</h4>
      <pre class="cod" data-lang="scala">val add2 = (x: Int, y: Int) => x + y
add2(2, 3)   // 5</pre>
      <p>{{s|s015|}}</p>
    </div>
    <div class="carta">
      <h4>{{s|s016|}}</h4>
      <pre class="cod" data-lang="scala">val add = (x: Int) => (y: Int) => x + y
add(2)(3)    // 5</pre>
      <p>{{s|s017|}}</p>
    </div>
  </div>

  <figure class="passi" data-titolo="{{a|s018|}}">
    <div class="passo">
      <div class="espr">add = (<mark class="dato">x</mark>: Int) => (y: Int) => <mark class="dato">x</mark> + y</div>
      <p class="nota">{{s|s019|}}</p>
    </div>
    <div class="passo">
      <div class="espr">add(<mark class="dato">2</mark>)   =   (y: Int) => <mark class="dato">2</mark> + y</div>
      <p class="nota">{{s|s020|}}</p>
    </div>
    <div class="passo">
      <div class="espr">((y: Int) => 2 + y)(<mark class="due">3</mark>)</div>
      <p class="nota">{{s|s021|}}</p>
    </div>
    <div class="passo">
      <div class="espr">2 + <mark class="due">3</mark>   =   <mark class="ok">5</mark></div>
      <p class="nota">{{s|s022|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val <mark class="ora">incr</mark> = add(1)        <span class="mano">// incr: Int => Int</span>
incr(7)                   <span class="mano">// 8</span></div>
      <p class="nota">{{s|s023|}}</p>
    </div>
  </figure>
  <p>{{s|s024|}}</p>
  <figure class="scena" data-scena="curried" data-titolo="{{a|s025|}}"></figure>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <p>{{s|s027|}}</p>
  <pre class="cod" data-lang="scala">def curry[A, B, C](f: (A, B) => C): A => (B => C) = ???</pre>

  <figure class="passi" data-titolo="{{a|s028|}}" data-legenda="{{a|s029|}}">
    <div class="passo">
      <div class="espr">devo produrre:  <mark class="dato">A</mark> => (<mark class="due">B</mark> => <mark class="ok">C</mark>)
ho in mano:     f: (<mark class="dato">A</mark>, <mark class="due">B</mark>) => <mark class="ok">C</mark></div>
      <p class="nota">{{s|s030|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def curry[A, B, C](f: (A, B) => C): A => (B => C) =
  <mark class="dato">a</mark> => ???</div>
      <p class="nota">{{s|s031|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def curry[A, B, C](f: (A, B) => C): A => (B => C) =
  a => <mark class="due">b</mark> => ???</div>
      <p class="nota">{{s|s032|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def curry[A, B, C](f: (A, B) => C): A => (B => C) =
  a => b => <mark class="ok">???: C</mark></div>
      <p class="nota">{{s|s033|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def curry[A, B, C](f: (A, B) => C): A => (B => C) =
  a => b => <mark class="ok">f(a, b)</mark></div>
      <p class="nota">{{s|s034|}}</p>
    </div>
  </figure>

  <p>{{s|s035|}}</p>
  <figure class="codice" data-titolo="{{a|s036|}}">
<pre data-lang="scala">def uncurry[A, B, C](f: A => B => C): (A, B) => C =
  (a, b) => f(a)(b)</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="(A, B) => C@ok"><p>{{s|s037|}}</p></li>
      <li data-righe="2" data-segna="(a, b) =>@dato"><p>{{s|s038|}}</p></li>
      <li data-righe="2" data-segna="f(a)@ora"><p>{{s|s039|}}</p></li>
      <li data-righe="2" data-segna="(b)@ok"><p>{{s|s040|}}</p></li>
    </ol>
  </figure>
  <p>{{s|s041|}}</p>
  <figure class="scena" data-scena="scrivicurry" data-titolo="{{a|s042|}}"></figure>
</section>

<section>
  <h2>{{s|s043|}}</h2>
  <figure class="codice" data-titolo="{{a|s044|}}">
<pre data-lang="scala">def isSortedCurried[A]: Array[A] => ((A, A) => Boolean) => Boolean =
  curry(isSorted[A])

def isSortedCurriedUncurried[A]: (Array[A], (A, A) => Boolean) => Boolean =
  uncurry(isSortedCurried[A])</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="Array[A]@dato|((A, A) => Boolean)@due|Boolean#2@ok"><p>{{s|s045|}}</p></li>
      <li data-righe="2" data-segna="isSorted[A]@dato|curry@ora"><p>{{s|s046|}}</p></li>
      <li data-righe="5" data-segna="uncurry@ora"><p>{{s|s047|}}</p></li>
    </ol>
  </figure>
  <pre class="cod" data-lang="scala">isSortedCurried(Array(1, 2, 3))(_ &lt;= _)   // true</pre>
  <div class="box idea" data-tit="{{a|s048|}}">
    <p>{{s|s049|}}</p>
  </div>
  <figure class="scena" data-scena="riuso" data-titolo="{{a|s050|}}"></figure>
</section>

<section>
  <h2>{{s|s051|}}</h2>
  <p>{{s|s052|}}</p>
  <pre class="cod" data-lang="scala">def compose[A, B, C](f: B => C, g: A => B): A => C =
  a => f(g(a))</pre>
  <figure class="passi" data-titolo="{{a|s053|}}">
    <div class="passo">
      <div class="espr">compose(<mark class="ok">square</mark>, <mark class="due">abs</mark>)(<mark class="dato">-3</mark>)</div>
      <p class="nota">{{s|s054|}}</p>
    </div>
    <div class="passo">
      <div class="espr">(a => <mark class="ok">square</mark>(<mark class="due">abs</mark>(a)))(<mark class="dato">-3</mark>)</div>
      <p class="nota">{{s|s055|}}</p>
    </div>
    <div class="passo">
      <div class="espr">square(<mark class="ora">abs(-3)</mark>)</div>
      <p class="nota">{{s|s056|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ora">square(3)</mark></div>
      <p class="nota">{{s|s057|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">9</mark></div>
      <p class="nota">{{s|s058|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="macchine" data-titolo="{{a|s059|}}"></figure>
</section>

</main>
</body>
</html>
