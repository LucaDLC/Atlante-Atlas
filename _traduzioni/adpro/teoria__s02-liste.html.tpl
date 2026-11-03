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
SCENE.append = {
  w: 540, h: 250, lato: true,
  oggetti: [
    { id: 'l1', tipo: 'nodo', forma: 'quadrato', r: 17, x: 30, y: 60, t: 'l1', tono: 'dato' },
    { id: 'a', tipo: 'nodo', x: 100, y: 60, t: '1' },
    { id: 'b', tipo: 'nodo', x: 170, y: 60, t: '2' },
    { id: 'n1', tipo: 'nodo', forma: 'quadrato', r: 20, x: 240, y: 60, t: 'Nil' },
    { id: 'e1', tipo: 'arco', da: 'l1', a: 'a', dir: true },
    { id: 'e2', tipo: 'arco', da: 'a', a: 'b', dir: true },
    { id: 'e3', tipo: 'arco', da: 'b', a: 'n1', dir: true },
    { id: 'l2', tipo: 'nodo', forma: 'quadrato', r: 17, x: 300, y: 60, t: 'l2', tono: 'due' },
    { id: 'c', tipo: 'nodo', x: 370, y: 60, t: '3' },
    { id: 'd', tipo: 'nodo', x: 440, y: 60, t: '4' },
    { id: 'n2', tipo: 'nodo', forma: 'quadrato', r: 20, x: 510, y: 60, t: 'Nil' },
    { id: 'f1', tipo: 'arco', da: 'l2', a: 'c', dir: true },
    { id: 'f2', tipo: 'arco', da: 'c', a: 'd', dir: true },
    { id: 'f3', tipo: 'arco', da: 'd', a: 'n2', dir: true },
    { id: 'r', tipo: 'nodo', forma: 'quadrato', r: 17, x: 30, y: 180, t: 'res', nascosto: true },
    { id: 'a2', tipo: 'nodo', x: 100, y: 180, t: '1', nascosto: true },
    { id: 'b2', tipo: 'nodo', x: 170, y: 180, t: '2', nascosto: true },
    { id: 'g1', tipo: 'arco', da: 'r', a: 'a2', dir: true, nascosto: true },
    { id: 'g2', tipo: 'arco', da: 'a2', a: 'b2', dir: true, nascosto: true },
    { id: 'g3', tipo: 'arco', da: 'b2', a: 'c', dir: true, curva: -30, nascosto: true }
  ],
  passi: [
    { nota: '{{j|s002|'}}' },
    { nota: '{{j|s003|'}}',
      set: { b: { tono: 'no' }, e3: { tono: 'no' } } },
    { nota: '{{j|s004|'}}',
      set: { b: { tono: null }, e3: { tono: null }, r: { nascosto: false, tono: 'ok' }, a2: { nascosto: false, tono: 'ora' }, b2: { nascosto: false, tono: 'ora' }, g1: { nascosto: false }, g2: { nascosto: false } } },
    { nota: '{{j|s005|'}}',
      set: { g3: { nascosto: false, tono: 'ok' }, c: { tono: 'due' }, d: { tono: 'due' }, a2: { tono: 'ok' }, b2: { tono: 'ok' } } }
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

    const cella = (id, x, t, extra) => R(id, x, 60, 60, 40, t, Object.assign({ tono: 'dato' }, extra || {}));
    const fr = (id, x) => F(id, x + 62, 80, x + 86, 80, '');
    const lista = (vals, x0) => { const o = []; vals.forEach((v, i) => { o.push(cella('c' + i, x0 + i * 90, v)); if (i < vals.length - 1) o.push(fr('f' + i, x0 + i * 90)); }); return o; };

    SCENE.tail = {
      w: 560, h: 200, lato: true,
      legenda: '{{j|s006|'}}',
      oggetti: lista(['1', '2', '3'], 60).concat([R('nil', 330, 60, 60, 40, 'Nil', { tono: 'spento' }), F('fn', 302, 80, 326, 80, ''), T('l', 60, 40, 'l', { bold: true }), T('t', 150, 140, '', { size: 12, bold: true }), T('c', 280, 184, '', { size: 12 })]),
      passi: [
        { nota: "<code>tail(l)</code> con l = List(1, 2, 3): tre celle collegate." },
        { nota: "Il caso <code>Cons(_, t)</code>: la testa non serve, t è la coda. Restituisco <b>t</b>: la stessa lista che stava dentro la cella, <b>non una copia</b>.", set: { c1: { tono: 'ok' }, c2: { tono: 'ok' }, nil: { tono: 'ok' }, t: { t: '↑ tail(l): nessuna cella nuova' } } },
        { nota: "Tempo costante, qualunque sia la lunghezza: nessuna cella da ricopiare.", set: { c: { t: 'tempo costante, 0 celle nuove' } } },
        { nota: "Sulla lista vuota: <code>throw NoSuchElementException()</code>. Restituire Nil confonderebbe \"la coda è vuota\" con \"non c'era una coda\"; i test controllano proprio l'eccezione.", set: { c0: { tono: 'spento' }, c1: { tono: 'spento' }, c2: { tono: 'spento' }, nil: { tono: 'no' }, t: { t: '' }, c: { t: 'tail(Nil) → NoSuchElementException', tono: 'no' } } }
      ]
    };

    SCENE.drop = {
      w: 560, h: 200, lato: true,
      legenda: '{{j|s007|'}}',
      oggetti: lista(['1', '2', '3', '4'], 40).concat([T('e', 280, 150, 'drop(List(1, 2, 3, 4), 2)', { bold: true }), T('c', 280, 184, '', { size: 12 })]),
      passi: [
        { nota: "A comandare è n: <code>drop(List(1, 2, 3, 4), 2)</code>." },
        { nota: "n = 2 &gt; 0 e c'è una cella: tolgo 1 e chiedo di toglierne una in meno dal resto. La chiamata è in coda.", set: { c0: { tono: 'spento' }, c1: { tono: 'ora' }, e: { t: 'drop(List(2, 3, 4), 1)' } } },
        { nota: "n = 1: tolgo 2.", set: { c1: { tono: 'spento' }, c2: { tono: 'ora' }, e: { t: 'drop(List(3, 4), 0)' } } },
        { nota: "n = 0: basta, restituisco la lista da qui, <b>condivisa</b>. Tempo proporzionale a n, zero celle nuove. Se la lista finisce prima: NoSuchElementException.", set: { c2: { tono: 'ok' }, c3: { tono: 'ok' }, e: { t: 'List(3, 4)', tono: 'ok' }, c: { t: 'tempo ∝ n, 0 celle nuove' } } }
      ]
    };

    SCENE.dropwhile = {
      w: 560, h: 200, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: lista(['1', '2', '3', '1'], 40).concat([T('e', 280, 150, 'dropWhile(List(1, 2, 3, 1), _ < 3)', { bold: true }), T('c', 280, 184, '', { size: 12 })]),
      passi: [
        { nota: "Qui decide la condizione p = _ &lt; 3. Niente eccezioni: sulla lista vuota la risposta è Nil." },
        { nota: "p(1) = true: tolgo 1, continuo sul resto con la stessa p.", set: { c0: { tono: 'spento' } } },
        { nota: "p(2) = true: tolgo anche 2.", set: { c1: { tono: 'spento' } } },
        { nota: "p(3) = false: mi fermo e restituisco <code>l</code>, che inizia proprio da qui. Non serve ricostruire Cons(h, t).", set: { c2: { tono: 'ora' }, c3: { tono: 'ok' }, e: { t: 'List(3, 1)', tono: 'ok' } } },
        { nota: "L'ultimo 1 resta anche se è &lt; 3: dropWhile toglie solo <b>all'inizio</b> (verificato).", set: { c: { t: 'toglie solo il prefisso: l’1 finale resta' } } }
      ]
    };

    SCENE.init = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: lista(['1', '2', '3'], 60).concat([T('l', 40, 80, 'l', { bold: true }),
        R('n0', 60, 150, 60, 40, '1', { tono: 'due', nascosto: true }), F('g0', 122, 170, 146, 170, '', { nascosto: true }), R('n1', 150, 150, 60, 40, '2', { tono: 'due', nascosto: true }), F('g1', 212, 170, 236, 170, '', { nascosto: true }), R('nn', 240, 150, 60, 40, 'Nil', { tono: 'spento', nascosto: true }),
        T('ll', 30, 170, 'init', { bold: true, size: 12, nascosto: true }), T('c', 290, 216, '', { size: 12 })]),
      passi: [
        { nota: "Togliere l'<b>ultimo</b> elemento è scomodo: bisogna arrivare in fondo, e ogni cella attraversata va <b>ricostruita</b> (quella vecchia punta ancora all'ultimo)." },
        { nota: "Più di un elemento: la testa resta. <code>Cons(1, init(resto))</code>: una cella <b>nuova</b> con 1.", set: { n0: { nascosto: false }, ll: { nascosto: false } } },
        { nota: "Stessa cosa per 2: <code>Cons(2, init(Cons(3, Nil)))</code>.", set: { g0: { nascosto: false }, n1: { nascosto: false } } },
        { nota: "Cons(3, Nil) combacia con <code>Cons(_, Nil)</code>: è l'ultimo, diventa Nil. Questo caso va scritto <b>prima</b> di Cons(h, t), altrimenti il caso generale lo ruberebbe.", set: { c2: { tono: 'spento' }, g1: { nascosto: false }, nn: { nascosto: false } } },
        { nota: "Risultato List(1, 2): 2 celle nuove, tempo e memoria ∝ lunghezza. La lista originale è intatta. Non è in coda: dopo la chiamata resta il Cons.", set: { c: { t: 'init: lunghezza − 1 celle nuove, l intatta' } } }
      ]
    };

    const O = [['tail', 0, 0, 7], ['drop(l, 3)', 3, 0, 5], ['init', 7, 7, 0], ['append(l1, l2), |l1| = 4', 4, 4, 4]];
    const ogc = [T('op', 290, 24, '', { bold: true, size: 13 }), C('l', 30, 50, ['1', '2', '3', '4', '5', '6', '7', '8'], { cw: 64 }), T('c', 290, 140, '', { size: 12 }), T('c2', 290, 170, '', { size: 12 })];
    const colora = (sc, co) => { const t = {}; for (let i = 0; i < 8; i++) t[i] = i < sc ? (i < co ? 'no' : 'ora') : 'ok'; return t; };
    SCENE.costi = {
      w: 580, h: 200, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: ogc,
      passi: [
        { nota: "Una lista di 8 celle. Per ogni funzione guardiamo quali celle vengono <b>attraversate</b>, quali <b>ricopiate</b> e quali <b>condivise</b>." },
        { nota: "<b>tail</b>: restituisce la coda che c'è già. Tempo costante, 0 celle nuove.", set: { op: { t: 'tail' }, l: { toni: Object.assign(colora(1, 0), { 0: 'spento' }) }, c: { t: 'tempo costante, 0 celle nuove' } } },
        { nota: "<b>drop(l, 3)</b>: scorre 3 celle, poi condivide il resto. Tempo ∝ n. <b>dropWhile</b> è uguale, con n = elementi tolti.", set: { op: { t: 'drop(l, 3)' }, l: { toni: Object.assign(colora(3, 0), { 0: 'spento', 1: 'spento', 2: 'spento' }) }, c: { t: 'tempo ∝ n, 0 celle nuove' } } },
        { nota: "<b>init</b>: ricostruisce tutto tranne l'ultima. Tempo ∝ lunghezza, 7 celle nuove.", set: { op: { t: 'init' }, l: { toni: Object.assign(colora(7, 7), { 7: 'spento' }) }, c: { t: 'tempo ∝ lunghezza, lunghezza − 1 celle nuove' } } },
        { nota: "<b>append(l1, l2)</b> con l1 = le prime 4: ricopia l1 (l'ultima cella deve puntare a l2), condivide l2. Tempo ∝ |l1|.", set: { op: { t: 'append(l1, l2), l1 = 1..4, l2 = 5..8' }, l: { toni: colora(4, 4) }, c: { t: 'ricopia l1, condivide l2' }, c2: { t: 'regola: si paga ogni cella che deve cambiare puntatore' } } }
      ]
    };

    SCENE.erroriliste = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s011|'}}',
      oggetti: [R('s', 20, 30, 540, 40, 'case Cons(h, t) => if t == Nil then h else init(h)', { tono: 'no' }), T('m', 290, 94, 'Found: (h : A)   Required: List[A]', { size: 12 }), R('g', 20, 120, 540, 40, '', { tono: 'ok', nascosto: true }), T('c', 290, 190, '', { size: 12 })],
      passi: [
        { nota: "Primo errore: <code>h</code> è un <b>elemento</b> (tipo A), ma init deve restituire una lista. E init(h) passa un elemento dove serve una lista." },
        { nota: "Corretto: ricostruire con <code>Cons(h, init(t))</code>, con il caso <code>Cons(_, Nil) =&gt; Nil</code> sopra.", set: { g: { nascosto: false, t: 'case Cons(_, Nil) => Nil;  case Cons(h, t) => Cons(h, init(t))' } } },
        { nota: "Secondo errore: in <code>length</code> il caso vuoto restituisce <code>Nil</code>. Ogni caso deve dare il <b>tipo di ritorno</b>: qui Int.", set: { s: { t: 'def length(l: List[A]): Int = … case Nil => Nil' }, m: { t: 'Found: (List.Nil : List[Nothing])   Required: Int' }, g: { nascosto: true } } },
        { nota: "La lunghezza della lista vuota è il numero 0, non la lista Nil.", set: { g: { nascosto: false, t: 'case Nil => 0' }, c: { t: 'ogni ramo del match ha lo stesso tipo: quello di ritorno' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s012|}}</h1>
  <p class="lede">{{s|s013|}}</p>
</header>

<section>
  <h2>{{s|s014|}}</h2>
  <figure class="codice" data-titolo="{{a|s015|}}">
<pre data-lang="scala">def tail[A](l: List[A]): List[A] = l match
  case Nil => throw NoSuchElementException()
  case Cons(_, t) => t</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="Nil@no|throw@no"><p>{{s|s016|}}</p></li>
      <li data-righe="3" data-segna="_@due|t@dato"><p>{{s|s017|}}</p></li>
      <li data-righe="3" data-segna="=> t@ok"><p>{{s|s018|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s019|}}">
    <p>{{s|s020|}}</p>
  </div>
  <figure class="scena" data-scena="tail" data-titolo="{{a|s021|}}"></figure>
</section>

<section>
  <h2>{{s|s022|}}</h2>
  <figure class="codice" data-titolo="{{a|s023|}}">
<pre data-lang="scala">def drop[A](l: List[A], n: Int): List[A] =
  if n &lt;= 0 then l
  else l match
    case Nil => throw NoSuchElementException()
    case Cons(_, t) => drop(t, n - 1)</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="n &lt;= 0@ora|l@ok"><p>{{s|s024|}}</p></li>
      <li data-righe="4" data-segna="Nil@no"><p>{{s|s025|}}</p></li>
      <li data-righe="5" data-segna="drop(t, n - 1)@ora"><p>{{s|s026|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s027|}}">
    <div class="passo"><div class="espr">drop(List(<mark class="no">1</mark>, 2, 3, 4), <mark class="dato">2</mark>)</div><p class="nota">{{s|s028|}}</p></div>
    <div class="passo"><div class="espr">drop(List(<mark class="no">2</mark>, 3, 4), <mark class="dato">1</mark>)</div><p class="nota">{{s|s029|}}</p></div>
    <div class="passo"><div class="espr">drop(List(3, 4), <mark class="dato">0</mark>)</div><p class="nota">{{s|s030|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">List(3, 4)</mark></div><p class="nota">{{s|s031|}}</p></div>
  </figure>
  <figure class="scena" data-scena="drop" data-titolo="{{a|s032|}}"></figure>
</section>

<section>
  <h2>{{s|s033|}}</h2>
  <figure class="codice" data-titolo="{{a|s034|}}">
<pre data-lang="scala">def dropWhile[A](l: List[A], p: A => Boolean): List[A] = l match
  case Nil => Nil
  case Cons(h, t) => if p(h) then dropWhile(t, p) else l</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="Nil@ok"><p>{{s|s035|}}</p></li>
      <li data-righe="3" data-segna="p(h)@ora"><p>{{s|s036|}}</p></li>
      <li data-righe="3" data-segna="dropWhile(t, p)@due"><p>{{s|s037|}}</p></li>
      <li data-righe="3" data-segna="else l@ok"><p>{{s|s038|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s039|}}">
    <div class="passo"><div class="espr">p(<mark class="dato">1</mark>) = 1 &lt; 3 = <mark class="no">true</mark>   →   dropWhile(List(2, 3, 1), p)</div><p class="nota">{{s|s040|}}</p></div>
    <div class="passo"><div class="espr">p(<mark class="dato">2</mark>) = 2 &lt; 3 = <mark class="no">true</mark>   →   dropWhile(List(3, 1), p)</div><p class="nota">{{s|s041|}}</p></div>
    <div class="passo"><div class="espr">p(<mark class="dato">3</mark>) = 3 &lt; 3 = <mark class="ok">false</mark>   →   l</div><p class="nota">{{s|s042|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">List(3, 1)</mark></div><p class="nota">{{s|s043|}}</p></div>
  </figure>
  <figure class="scena" data-scena="dropwhile" data-titolo="{{a|s044|}}"></figure>
</section>

<section>
  <h2>{{s|s045|}}</h2>
  <p>{{s|s046|}}</p>
  <figure class="codice" data-titolo="{{a|s047|}}">
<pre data-lang="scala">def init[A](l: List[A]): List[A] = l match
  case Nil => throw NoSuchElementException()
  case Cons(_, Nil) => Nil
  case Cons(h, t) => Cons(h, init(t))</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="Nil@no"><p>{{s|s048|}}</p></li>
      <li data-righe="3" data-segna="Cons(_, Nil)@ora|=> Nil@ok"><p>{{s|s049|}}</p></li>
      <li data-righe="4" data-segna="Cons(h, init(t))@ok"><p>{{s|s050|}}</p></li>
      <li data-righe="3-4"><p>{{s|s051|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s052|}}">
    <div class="passo"><div class="espr">init(Cons(<mark class="dato">1</mark>, Cons(2, Cons(3, Nil))))</div><p class="nota">{{s|s053|}}</p></div>
    <div class="passo"><div class="espr">Cons(<mark class="dato">1</mark>, <mark class="ora">init(Cons(2, Cons(3, Nil)))</mark>)</div><p class="nota">{{s|s054|}}</p></div>
    <div class="passo"><div class="espr">Cons(1, Cons(<mark class="dato">2</mark>, <mark class="ora">init(Cons(3, Nil))</mark>))</div><p class="nota">{{s|s055|}}</p></div>
    <div class="passo"><div class="espr">Cons(1, Cons(2, <mark class="ok">Nil</mark>))</div><p class="nota">{{s|s056|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">List(1, 2)</mark></div><p class="nota">{{s|s057|}}</p></div>
  </figure>
  <figure class="scena" data-scena="init" data-titolo="{{a|s058|}}"></figure>
</section>

<section>
  <h2>{{s|s059|}}</h2>
  <pre class="cod" data-lang="scala">def append[A](l1: List[A], l2: List[A]): List[A] = l1 match
  case Nil => l2
  case Cons(h, t) => Cons(h, append(t, l2))</pre>
  <figure class="scena" data-scena="append" data-titolo="{{a|s060|}}"></figure>
</section>

<section>
  <h2>{{s|s061|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s062|}}</th><th>{{s|s063|}}</th><th>{{s|s064|}}</th><th>{{s|s065|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td><td>0</td><td>{{s|s068|}}</td></tr>
      <tr><td>{{s|s069|}}</td><td>∝ n</td><td>0</td><td>{{s|s070|}}</td></tr>
      <tr><td>{{s|s071|}}</td><td>{{s|s072|}}</td><td>0</td><td>{{s|s073|}}</td></tr>
      <tr><td>{{s|s074|}}</td><td>{{s|s075|}}</td><td>{{s|s076|}}</td><td>{{s|s077|}}</td></tr>
      <tr><td>{{s|s078|}}</td><td>{{s|s079|}}</td><td>{{s|s080|}}</td><td>{{s|s081|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="costi" data-titolo="{{a|s082|}}"></figure>
</section>

<section>
  <h2>{{s|s083|}}</h2>
  <p>{{s|s084|}}</p>
</section>

<section>
  <h2>{{s|s085|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def init[A](l: List[A]): List[A] = l match
  case Nil => Nil
  case Cons(h, t) => if t == Nil then h else init(h)</pre>
      <pre class="msg">Found:    (h : A)
Required: List[A]</pre>
      <div class="fix">{{s|s086|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def length[A](l: List[A]): Int = l match
  case Nil => Nil
  case Cons(_, t) => 1 + length(t)</pre>
      <pre class="msg">Found:    (List.Nil : List[Nothing])
Required: Int</pre>
      <div class="fix">{{s|s087|}}</div>
    </div>
  </div>
  <figure class="scena" data-scena="erroriliste" data-titolo="{{a|s088|}}"></figure>
</section>

</main>
</body>
</html>
