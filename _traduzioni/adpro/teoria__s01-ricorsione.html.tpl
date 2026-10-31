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
(function () {
  const Y = k => 262 - k * 44;
  const L = k => ({ id: 'L' + k, tipo: 'rett', x: 20, y: Y(k), w: 240, h: 36, t: '', nascosto: k > 0 });
  (window.SCENE = window.SCENE || {}).pila = {
    w: 560, h: 340, lato: false,
    oggetti: [
      { id: 'tl', tipo: 'testo', x: 140, y: 22, t: 'normale: n * factorial(n - 1)', size: 13, bold: true },
      { id: 'tr', tipo: 'testo', x: 420, y: 22, t: 'in coda: f(n - 1, n * acc)', size: 13, bold: true },
      L(0), L(1), L(2), L(3), L(4),
      { id: 'R', tipo: 'rett', x: 300, y: Y(0), w: 240, h: 36, t: 'f(5, 1)', tono: 'ora' },
      { id: 'lc', tipo: 'testo', x: 140, y: 322, t: 'chiamate aperte: 1', size: 12.5 },
      { id: 'rc', tipo: 'testo', x: 420, y: 322, t: 'chiamate aperte: 1', size: 12.5 },
      { id: 'sep', tipo: 'linea', x1: 280, y1: 40, x2: 280, y2: 305, tratt: true }
    ],
    passi: [
      { nota: '{{j|s002|'}}',
        set: { L0: { t: 'factorial(5)', tono: 'ora' } } },
      { nota: '{{j|s003|'}}',
        set: { L0: { t: '5 * factorial(4)', tono: 'due' }, L1: { nascosto: false, t: 'factorial(4)', tono: 'ora' }, R: { t: 'f(4, 5)' }, lc: { t: 'chiamate aperte: 2' } } },
      { nota: '{{j|s004|'}}',
        set: { L1: { t: '4 * factorial(3)', tono: 'due' }, L2: { nascosto: false, t: 'factorial(3)', tono: 'ora' }, R: { t: 'f(3, 20)' }, lc: { t: 'chiamate aperte: 3' } } },
      { nota: '{{j|s005|'}}',
        set: { L2: { t: '3 * factorial(2)', tono: 'due' }, L3: { nascosto: false, t: 'factorial(2)', tono: 'ora' }, R: { t: 'f(2, 60)' }, lc: { t: 'chiamate aperte: 4' } } },
      { nota: '{{j|s006|'}}',
        set: { L3: { t: '2 * factorial(1)', tono: 'due' }, L4: { nascosto: false, t: 'factorial(1)', tono: 'ora' }, R: { t: 'f(1, 120)' }, lc: { t: 'chiamate aperte: 5' } } },
      { nota: '{{j|s007|'}}',
        set: { L4: { t: '1', tono: 'ok' }, R: { t: '120', tono: 'ok' }, rc: { t: 'finito', tono: 'ok' } } },
      { nota: '{{j|s008|'}}',
        set: { L4: { nascosto: true }, L3: { t: '2 * 1 = 2', tono: 'ok' }, lc: { t: 'chiamate aperte: 4' } } },
      { nota: '{{j|s009|'}}',
        set: { L3: { nascosto: true }, L2: { t: '3 * 2 = 6', tono: 'ok' }, lc: { t: 'chiamate aperte: 3' } } },
      { nota: '{{j|s010|'}}',
        set: { L2: { nascosto: true }, L1: { t: '4 * 6 = 24', tono: 'ok' }, lc: { t: 'chiamate aperte: 2' } } },
      { nota: '{{j|s011|'}}',
        set: { L1: { nascosto: true }, L0: { t: '5 * 24 = 120', tono: 'ok' }, lc: { t: 'finito', tono: 'ok' } } }
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
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

    // 1. while contro parametri
    const riga = (id, y) => [R(id + 'a', 60, y, 200, 30, '', { tono: 'spento', nascosto: true }), R(id + 'b', 320, y, 240, 30, '', { tono: 'spento', nascosto: true })];
    const og = [T('ha', 160, 24, 'while: variabili che cambiano', { bold: true, size: 12 }), T('hb', 440, 24, 'ricorsione: parametri nuovi', { bold: true, size: 12 })];
    [0, 1, 2, 3].forEach(i => og.push(...riga('r' + i, 40 + i * 40)));
    og.push(T('c', 310, 222, '', { size: 12, bold: true }));
    const g = (i, a, b) => ({ ['r' + i + 'a']: { nascosto: false, t: a, tono: 'dato' }, ['r' + i + 'b']: { nascosto: false, t: b, tono: 'ora' } });
    SCENE.purifica = {
      w: 600, h: 240, lato: true,
      legenda: '{{j|s012|'}}',
      oggetti: og,
      passi: [
        { nota: "La ricetta di Purification.scala: <b>ogni variabile che cambia diventa un parametro</b>. Confrontiamo i due fattoriali su n = 4, giro per giro." },
        { nota: "Partenza: nel while <code>result = 1, x = 4</code>. Nella ricorsione la prima chiamata è <code>doWork(1)(4)</code>: gli stessi valori, come argomenti.", set: g(0, 'result = 1, x = 4', 'doWork(1)(4)') },
        { nota: "Un giro del ciclo <b>assegna</b> i nuovi valori: result = 1 · 4, x = 3. La ricorsione invece li <b>passa</b> alla chiamata successiva: doWork(4)(3).", set: g(1, 'result = 4, x = 3', 'doWork(4)(3)') },
        { nota: "Stessa cosa: 4 · 3 = 12, x = 2.", set: g(2, 'result = 12, x = 2', 'doWork(12)(2)') },
        { nota: "24, x = 1. Ora la condizione <code>x &gt; 1</code> è falsa: il while esce e fa return result; la ricorsione va nel ramo else e dà result. Nessuna variabile modificata: 24.", set: Object.assign(g(3, 'result = 24, x = 1', 'doWork(24)(1) → 24'), { r3b: { nascosto: false, t: 'doWork(24)(1) → 24', tono: 'ok' }, c: { t: 'condizione del while = if, corpo = argomenti nuovi, dopo = else', tono: 'ok' } }) }
      ]
    };

    // 2. la ricorsione diretta si srotola
    const liv = (id, i, t) => R(id, 170, 190 - i * 38, 240, 32, t, { tono: 'due', nascosto: true });
    SCENE.srotola = {
      w: 580, h: 240, lato: true,
      legenda: '{{j|s013|'}}',
      oggetti: [liv('s0', 0, '4 * factorial(3)'), liv('s1', 1, '3 * factorial(2)'), liv('s2', 2, '2 * factorial(1)'), liv('s3', 3, 'factorial(1) = 1'), T('e', 290, 22, 'factorial(4)', { bold: true, size: 14 }), T('p', 500, 120, '', { size: 12 })],
      passi: [
        { nota: "<code>factorial(n) = if n &lt;= 1 then 1 else n * factorial(n - 1)</code>, copiata da n! = n · (n − 1)!. Calcoliamo factorial(4)." },
        { nota: "4 non è ≤ 1: <code>4 * factorial(3)</code>. La moltiplicazione per 4 resta <b>in sospeso</b>: prima serve factorial(3).", set: { s0: { nascosto: false }, e: { t: '4 * factorial(3)' } } },
        { nota: "Un'altra moltiplicazione in sospeso, sopra la prima.", set: { s1: { nascosto: false }, e: { t: '4 * (3 * factorial(2))' } } },
        { nota: "E un'altra. La pila cresce: una riga per ogni chiamata aperta.", set: { s2: { nascosto: false }, e: { t: '4 * (3 * (2 * factorial(1)))' }, p: { t: 'pila: 3 in sospeso' } } },
        { nota: "Caso base: factorial(1) = 1. Ora si chiude da dentro verso fuori: 2 · 1 = 2, 3 · 2 = 6, 4 · 6 = 24.", set: { s3: { nascosto: false, tono: 'ok' }, e: { t: '4 * (3 * (2 * 1))' } } },
        { nota: "Risultato 24. Le cose in sospeso erano proporzionali a n: la pila usa spazio O(n), e con n grande va in <b>StackOverflowError</b>. Per questo la versione con accumulatore (in coda) è migliore.", set: { s3: { nascosto: true }, s2: { t: '2 * 1 = 2', tono: 'ok' }, s1: { t: '3 * 2 = 6', tono: 'ok' }, s0: { t: '4 * 6 = 24', tono: 'ok' }, e: { t: '24', tono: 'ok' }, p: { t: 'spazio O(n)' } } }
      ]
    };

    // 3. fibonacci: albero contro finestra
    const og3 = [N('a', 290, 40, 'f5', 'dato', { r: 17 }), N('b', 170, 100, 'f4', 'dato', { r: 17 }), N('c', 410, 100, 'f3', 'no', { r: 17 }),
      N('d', 110, 160, 'f3', 'no', { r: 17 }), N('e', 230, 160, 'f2', 'dato', { r: 17 }), N('f', 370, 160, 'f2', 'dato', { r: 17 }), N('g', 450, 160, 'f1', 'dato', { r: 17 })];
    [['a', 'b'], ['a', 'c'], ['b', 'd'], ['b', 'e'], ['c', 'f'], ['c', 'g']].forEach(([x, y], i) => og3.push({ id: 'k' + i, tipo: 'arco', da: x, a: y }));
    og3.push(C('w', 110, 80, ['0', '1', '1', '2', '3', '5'], { nascosto: true }), T('wc', 290, 150, '', { size: 12, bold: true }), T('c', 290, 216, '', { size: 12 }));
    const fin = (i, t) => ({ w: { nascosto: false, toni: { [i]: 'dato', [i + 1]: 'ora' } }, wc: { t } });
    const albero = ['a', 'b', 'c', 'd', 'e', 'f', 'g'].concat([0, 1, 2, 3, 4, 5].map(i => 'k' + i));
    SCENE.finestra = {
      w: 580, h: 240, lato: true,
      legenda: '{{j|s014|'}}',
      oggetti: og3,
      passi: [
        { nota: "La prima versione faceva <code>bonacci(n-1) + bonacci(n-2)</code>. Dopo le due chiamate resta da fare il +: nessuna è in coda (\"Cannot rewrite recursive call: it is not in tail position\"). E l'albero delle chiamate ricalcola gli stessi numeri: f3 compare due volte già per f5.", set: { c: { t: 'due chiamate + somma: non in coda, e lavoro ripetuto', tono: 'no' } } },
        { nota: "Idea: per il prossimo numero servono solo gli <b>ultimi due</b>. Li porto con me come parametri: curr e next, una finestra che scorre. <code>bonacci(6, 0, 1)</code>.", set: Object.assign(Object.fromEntries(albero.map(k => [k, { nascosto: true }])), fin(0, 'bonacci(6, curr = 0, next = 1)'), { c: { t: '' } }) },
        { nota: "Un passo: il nuovo curr è il vecchio next, il nuovo next è la somma: <code>bonacci(5, 1, 1)</code>.", set: fin(1, 'bonacci(5, 1, 1)') },
        { nota: "<code>bonacci(4, 1, 2)</code>, poi <code>bonacci(3, 2, 3)</code>…", set: fin(3, 'bonacci(3, 2, 3)') },
        { nota: "…<code>bonacci(2, 3, 5)</code>, <code>bonacci(1, 5, 8)</code>: n ≤ 1, restituisco curr = 5, il sesto numero. Ogni chiamata è l'ultima cosa fatta: in coda, e @tailrec accetta.", set: { w: { toni: { 5: 'ok' } }, wc: { t: 'bonacci(1, 5, 8) → 5', tono: 'ok' }, c: { t: 'una chiamata in coda per passo: n passi, spazio costante' } } }
      ]
    };

    // 4. isSorted sugli indici
    SCENE.indici = {
      w: 560, h: 150,
      codice: { lang: 'scala', testo: `def isSorted[A](as: Array[A], ordered: (A, A) => Boolean): Boolean =
  @annotation.tailrec
  def go(i: Int): Boolean =
    if i >= as.length - 1 then true
    else if !ordered(as(i), as(i + 1)) then false
    else go(i + 1)
  go(0)` },
      legenda: '{{j|s015|'}}',
      oggetti: [C('a', 60, 40, ['1', '3', '5', '4'], { indici: true }), T('c', 280, 120, '', { size: 12, bold: true })],
      passi: [
        { nota: "Il for sugli indici diventa una funzione di lavoro <code>go(i)</code>: il parametro i è la variabile del ciclo. Partenza <code>go(0)</code>, con Array(1, 3, 5, 4) e ordered = _ &lt;= _.", righe: [7] },
        { nota: "i = 0: confronto as(0) e as(1): 1 &lt;= 3, in ordine. <code>go(1)</code>, in coda.", righe: [5, 6], set: { a: { toni: { 0: 'ok', 1: 'ok' } }, c: { t: 'go(0): 1 <= 3 → go(1)' } } },
        { nota: "i = 1: 3 &lt;= 5, in ordine. <code>go(2)</code>.", righe: [5, 6], set: { a: { toni: { 0: 'spento', 1: 'ok', 2: 'ok' } }, c: { t: 'go(1): 3 <= 5 → go(2)' } } },
        { nota: "i = 2: 5 &lt;= 4 è falso: rispondo subito <b>false</b>, senza guardare oltre.", righe: [5], set: { a: { toni: { 0: 'spento', 1: 'spento', 2: 'no', 3: 'no' } }, c: { t: 'go(2): 5 <= 4 falso → false', tono: 'no' } } },
        { nota: "Perché bastano le coppie vicine? Se ogni elemento è ≤ del successivo, l'ordine si propaga a tutti. E se i ≥ length − 1 non c'è più una coppia: true (vale anche per array vuoti o da un elemento).", righe: [4], set: { c: { t: 'nessuna coppia da controllare → true' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s016|}}</h1>
  <p class="lede">{{s|s017|}}</p>
</header>

<section>
  <h2>{{s|s018|}}</h2>
  <p>{{s|s019|}}</p>
  <figure class="passi" data-titolo="{{a|s020|}}" data-legenda="{{a|s021|}}">
    <div class="passo">
      <div class="espr">def factorial(n: Int): Int =
  var <mark class="dato">result</mark> = 1
  var <mark class="dato">x</mark> = n
  while x &gt; 1 do
    result = result * x
    x = x - 1
  return result</div>
      <p class="nota">{{s|s022|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def doWork(<mark class="ora">result: Int</mark>)(<mark class="ora">x: Int</mark>): Int = ???</div>
      <p class="nota">{{s|s023|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def doWork(result: Int)(x: Int): Int =
  <mark class="ora">if x &gt; 1</mark>
  then ???   <span class="mano">// il corpo del ciclo</span>
  else ???   <span class="mano">// quello che veniva dopo il ciclo</span></div>
      <p class="nota">{{s|s024|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def doWork(result: Int)(x: Int): Int =
  if x &gt; 1
  then <mark class="ora">doWork(result * x)(x - 1)</mark>
  else ???</div>
      <p class="nota">{{s|s025|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def doWork(result: Int)(x: Int): Int =
  if x &gt; 1
  then doWork(result * x)(x - 1)
  else <mark class="ora">result</mark></div>
      <p class="nota">{{s|s026|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">def factorial(n: Int): Int =
  def doWork(result: Int)(x: Int): Int =
    if x &gt; 1
    then doWork(result * x)(x - 1)
    else result
  doWork(1)(n)</mark></div>
      <p class="nota">{{s|s027|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="purifica" data-titolo="{{a|s028|}}"></figure>
</section>

<section>
  <h2>{{s|s029|}}</h2>
  <p>{{s|s030|}}</p>
  <pre class="cod" data-lang="scala">def factorial(n: Int): Int =
  if n &lt;= 1 then 1
  else n * factorial(n - 1)</pre>
  <figure class="passi" data-titolo="{{a|s031|}}">
    <div class="passo"><div class="espr"><mark class="dato">factorial(4)</mark></div><p class="nota">{{s|s032|}}</p></div>
    <div class="passo"><div class="espr">4 * <mark class="ora">factorial(3)</mark></div><p class="nota">{{s|s033|}}</p></div>
    <div class="passo"><div class="espr">4 * (3 * <mark class="ora">factorial(2)</mark>)</div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">4 * (3 * (2 * <mark class="ora">factorial(1)</mark>))</div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">4 * (3 * (2 * <mark class="ok">1</mark>))</div><p class="nota">{{s|s036|}}</p></div>
    <div class="passo"><div class="espr">4 * (3 * <mark class="ora">2</mark>)</div><p class="nota">{{s|s037|}}</p></div>
    <div class="passo"><div class="espr">4 * <mark class="ora">6</mark></div><p class="nota">…</p></div>
    <div class="passo"><div class="espr"><mark class="ok">24</mark></div><p class="nota">{{s|s038|}}</p></div>
  </figure>
  <figure class="scena" data-scena="srotola" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <div class="box regola" data-tit="{{a|s041|}}">
    <p>{{s|s042|}}</p>
  </div>
  <div class="colonne">
    <div class="carta cattiva">
      <h4>{{s|s043|}}</h4>
      <pre class="cod" data-lang="scala" data-segna="n * @no">else n * factorial(n - 1)</pre>
      <p>{{s|s044|}}</p>
    </div>
    <div class="carta buona">
      <h4>{{s|s045|}}</h4>
      <pre class="cod" data-lang="scala" data-segna="f(n - 1, n * acc)@ok">else f(n - 1, n * acc)</pre>
      <p>{{s|s046|}}</p>
    </div>
  </div>
  <p>{{s|s047|}}</p>
  <figure class="scena" data-scena="pila" data-titolo="{{a|s048|}}"></figure>
  <p>{{s|s049|}}</p>
  <div class="box attenzione" data-tit="{{a|s050|}}">
    <p>{{s|s051|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s052|}}</h2>
  <p>{{s|s053|}}</p>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala" data-segna="bonacci(n-1, acc)@no|bonacci(n-2, acc)@no">def fib(n: Int): Int =
  @annotation.tailrec
  def bonacci(n: Int, acc: Int): Int =
    if n == 1 then acc
    else if n == 2 then 1
    else bonacci(n-1, acc) + bonacci(n-2, acc)
  bonacci(n, 0)</pre>
      <pre class="msg">Cannot rewrite recursive call: it is not in tail position</pre>
      <div class="fix">Dopo le due chiamate resta da fare il <code>+</code>: nessuna delle due è in coda. E anche senza <code>@tailrec</code> sarebbe lentissima, perché ricalcola gli stessi numeri moltissime volte.</div>
    </div>
  </div>
  <p>{{s|s054|}}</p>
  <figure class="codice" data-titolo="{{a|s055|}}">
<pre data-lang="scala">def fib(n: Int): Int =
  @annotation.tailrec
  def bonacci(n: Int, curr: Int, next: Int): Int =
    if n &lt;= 1 then curr
    else bonacci(n - 1, next, next + curr)
  bonacci(n, 0, 1)</pre>
    <ol class="spiega">
      <li data-righe="3" data-segna="curr@dato|next@due"><p>{{s|s056|}}</p></li>
      <li data-righe="6" data-segna="0@dato|1@due"><p>{{s|s057|}}</p></li>
      <li data-righe="5" data-segna="next@ok|next + curr@ok"><p>{{s|s058|}}</p></li>
      <li data-righe="4" data-segna="curr@ok"><p>{{s|s059|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s060|}}">
    <div class="passo"><div class="espr">bonacci(6, <mark class="dato">0</mark>, <mark class="due">1</mark>)</div><p class="nota">{{s|s061|}}</p></div>
    <div class="passo"><div class="espr">bonacci(5, <mark class="dato">1</mark>, <mark class="due">1</mark>)</div><p class="nota">{{s|s062|}}</p></div>
    <div class="passo"><div class="espr">bonacci(4, <mark class="dato">1</mark>, <mark class="due">2</mark>)</div><p class="nota">{{s|s063|}}</p></div>
    <div class="passo"><div class="espr">bonacci(3, <mark class="dato">2</mark>, <mark class="due">3</mark>)</div><p class="nota">{{s|s064|}}</p></div>
    <div class="passo"><div class="espr">bonacci(2, <mark class="dato">3</mark>, <mark class="due">5</mark>)</div><p class="nota">{{s|s065|}}</p></div>
    <div class="passo"><div class="espr">bonacci(1, <mark class="ok">5</mark>, 8)</div><p class="nota">{{s|s066|}}</p></div>
  </figure>
  <figure class="scena" data-scena="finestra" data-titolo="{{a|s067|}}"></figure>
</section>

<section>
  <h2>{{s|s068|}}</h2>
  <p>{{s|s069|}}</p>
  <figure class="codice" data-titolo="{{a|s070|}}">
<pre data-lang="scala">def isSorted[A](as: Array[A], ordered: (A, A) => Boolean): Boolean =
  @annotation.tailrec
  def go(i: Int): Boolean =
    if i &gt;= as.length - 1 then true
    else if !ordered(as(i), as(i + 1)) then false
    else go(i + 1)
  go(0)</pre>
    <ol class="spiega">
      <li data-righe="3" data-segna="i@dato"><p>{{s|s071|}}</p></li>
      <li data-righe="4" data-segna="i &gt;= as.length - 1@ora|true@ok"><p>{{s|s072|}}</p></li>
      <li data-righe="5" data-segna="ordered(as(i), as(i + 1))@ora|false@no"><p>{{s|s073|}}</p></li>
      <li data-righe="6" data-segna="go(i + 1)@ok"><p>{{s|s074|}}</p></li>
      <li data-righe="7" data-segna="go(0)@dato"><p>{{s|s075|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s076|}}">
    <p>{{s|s077|}}</p>
  </div>
  <figure class="scena" data-scena="indici" data-titolo="{{a|s078|}}"></figure>
</section>

</main>
</body>
</html>
