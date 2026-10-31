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
(window.SCENE = window.SCENE || {}).aggiungi = {
  w: 560, h: 250,
  oggetti: [
    { id: 'tJ', tipo: 'testo', x: 150, y: 24, t: 'Java: a.add(5)', size: 14, bold: true },
    { id: 'tS', tipo: 'testo', x: 420, y: 24, t: 'Scala: val b = Cons(5, a)', size: 14, bold: true },
    { id: 'ja', tipo: 'nodo', forma: 'quadrato', x: 40, y: 90, r: 18, t: 'a', tono: 'dato' },
    { id: 'j1', tipo: 'nodo', x: 115, y: 90, t: '1' },
    { id: 'j2', tipo: 'nodo', x: 185, y: 90, t: '2' },
    { id: 'j5', tipo: 'nodo', x: 255, y: 90, t: '5', nascosto: true },
    { id: 'aja', tipo: 'arco', da: 'ja', a: 'j1', dir: true },
    { id: 'aj12', tipo: 'arco', da: 'j1', a: 'j2', dir: true },
    { id: 'aj25', tipo: 'arco', da: 'j2', a: 'j5', dir: true, nascosto: true },
    { id: 'sa', tipo: 'nodo', forma: 'quadrato', x: 330, y: 90, r: 18, t: 'a', tono: 'dato' },
    { id: 's1', tipo: 'nodo', x: 405, y: 90, t: '1' },
    { id: 's2', tipo: 'nodo', x: 475, y: 90, t: '2' },
    { id: 'asa', tipo: 'arco', da: 'sa', a: 's1', dir: true },
    { id: 'as12', tipo: 'arco', da: 's1', a: 's2', dir: true },
    { id: 'sb', tipo: 'nodo', forma: 'quadrato', x: 330, y: 190, r: 18, t: 'b', nascosto: true },
    { id: 's5', tipo: 'nodo', x: 405, y: 190, t: '5', nascosto: true },
    { id: 'asb', tipo: 'arco', da: 'sb', a: 's5', dir: true, nascosto: true },
    { id: 'as51', tipo: 'arco', da: 's5', a: 's1', dir: true, nascosto: true },
    { id: 'div', tipo: 'linea', x1: 290, y1: 45, x2: 290, y2: 235, tratt: true }
  ],
  passi: [
    { nota: '{{j|s002|'}}' },
    { nota: '{{j|s003|'}}',
      set: { j5: { nascosto: false, tono: 'ora' }, aj25: { nascosto: false, tono: 'ora' }, ja: { tono: 'no' } } },
    { nota: '{{j|s004|'}}',
      set: { sb: { nascosto: false, tono: 'ok' }, s5: { nascosto: false, tono: 'ok' }, asb: { nascosto: false, tono: 'ok' }, as51: { nascosto: false, tono: 'ok' } } },
    { nota: '{{j|s005|'}}',
      set: { s1: { tono: 'due' }, s2: { tono: 'due' }, as12: { tono: 'due' } } }
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

    SCENE.sostituzione = {
      w: 580, h: 240, lato: true,
      legenda: '{{j|s006|'}}',
      oggetti: [
        T('ta', 145, 26, 'A: val x = e; x + x', { bold: true, size: 12 }), T('tb', 435, 26, 'B: e + e', { bold: true, size: 12 }),
        R('a', 30, 40, 230, 44, 'val x = square(3); x + x', { tono: 'dato' }), R('b', 320, 40, 230, 44, 'square(3) + square(3)', { tono: 'due' }),
        T('ra', 145, 120, '', { bold: true }), T('rb', 435, 120, '', { bold: true }),
        R('cnt', 200, 160, 180, 36, '', { tono: 'spento', nascosto: true }), T('c', 290, 222, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "<b>Referenzialmente trasparente</b>: puoi sostituire un'espressione con il suo valore senza cambiare il programma. Prova: A calcola una volta e usa due volte, B scrive la chiamata due volte." },
        { nota: "square(3) vale 9 sempre: A = 9 + 9, B = 9 + 9. Stesso risultato, 18. square è pura.", set: { ra: { t: '9 + 9 = 18', tono: 'ok' }, rb: { t: '9 + 9 = 18', tono: 'ok' }, c: { t: 'square(3) è RT', tono: 'ok' } } },
        { nota: "Ora <code>next()</code>: incrementa un contatore esterno e lo restituisce. Partendo da counter = 0, A fa <code>val x = next()</code>: x = 1, e x + x = 2.", set: { a: { t: 'val x = next(); x + x' }, b: { t: 'next() + next()' }, cnt: { nascosto: false, t: 'counter = 1' }, ra: { t: '1 + 1 = 2', tono: 'dato' }, rb: { t: '' }, c: { t: '' } } },
        { nota: "B, sempre da counter = 0: la prima chiamata dà 1, la seconda trova counter a 1 e dà 2. Risultato 3.", set: { cnt: { t: 'counter = 2' }, rb: { t: '1 + 2 = 3', tono: 'no' } } },
        { nota: "Ho solo sostituito x con la sua definizione e il risultato è cambiato (2 ≠ 3): <b>next() non è referenzialmente trasparente</b>. Colpa dell'effetto collaterale sul contatore.", set: { c: { t: '2 ≠ 3: next() non è RT', tono: 'no' } } }
      ]
    };

    const E = [['var', 'leggere/scrivere variabili', 190, 30], ['arr', 'modificare sul posto', 190, 80], ['exc', 'lanciare un’eccezione', 190, 130], ['out', 'stampare', 190, 180], ['rnd', 'numero casuale', 190, 230]];
    const og = [R('fn', 20, 90, 150, 70, 'f', { tono: 'ora' }), F('in', 0, 125, 18, 125, ''), T('it', 95, 180, 'argomenti → risultato', { size: 12 })];
    E.forEach(([id, t, x, y]) => { og.push(F('f' + id, 172, 125, 260, y, '', { nascosto: true, tono: 'no' }), T('t' + id, 268, y + 4, t, { size: 12, anchor: 'start', nascosto: true })); });
    og.push(T('c', 390, 125, '', { size: 12, bold: true }));
    SCENE.effetti = {
      w: 580, h: 250, lato: true,
      legenda: '{{j|s007|'}}',
      oggetti: og,
      passi: [
        { nota: "Una funzione è <b>pura</b> se f(e) è referenzialmente trasparente per ogni e RT. In pratica: fa <b>solo</b> una cosa, calcolare il risultato dagli argomenti." },
        { nota: "Un <b>effetto collaterale</b> è tutto quello che fa <b>oltre</b>: leggere o scrivere variabili, file, stream…", set: { fvar: { nascosto: false }, tvar: { nascosto: false } } },
        { nota: "…modificare una struttura dati sul posto o un campo di un oggetto…", set: { farr: { nascosto: false }, tarr: { nascosto: false } } },
        { nota: "…lanciare un'eccezione, stampare, tirare un numero casuale.", set: { fexc: { nascosto: false }, texc: { nascosto: false }, fout: { nascosto: false }, tout: { nascosto: false }, frnd: { nascosto: false }, trnd: { nascosto: false } } },
        { nota: "Tolti tutti gli effetti resta la funzione pura: tutto quello che le serve entra dai parametri, tutto quello che produce esce dal risultato. Per questo è facile da testare e da sostituire con dei finti (mock).", set: Object.assign(Object.fromEntries(E.map(([id]) => ['f' + id, { nascosto: true }])), Object.fromEntries(E.map(([id]) => ['t' + id, { nascosto: true }])), { fn: { tono: 'ok' }, c: { t: 'pura = solo argomenti → risultato', tono: 'ok' } }) }
      ]
    };

    const Q = [['a = a + 42', 'non RT', 'assegnamento: cambia a'], ['a[x] == 42', 'non RT', 'l’array può cambiare fra due letture'], ['println("42")', 'non RT', 'togliere la chiamata toglie la stampa'], ['throw new DivideByZero()', 'non RT', 'non produce un valore'], ['f(f(x)), f pura', 'RT', 'composizione di funzioni pure'], ['z = z + f(f(x))', 'non RT', 'la destra è pura, l’assegnamento no']];
    const og3 = [];
    Q.forEach(([e], i) => og3.push(R('q' + i, 20, 16 + i * 38, 230, 32, e, { tono: 'spento' }), T('v' + i, 270, 37 + i * 38, '', { size: 12, anchor: 'start', bold: true }), T('w' + i, 340, 37 + i * 38, '', { size: 11, anchor: 'start' })));
    SCENE.sondaggio = {
      w: 600, h: 250, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: og3,
      passi: [{ nota: "Il sondaggio della slide 10: quali espressioni <b>Java</b> sono referenzialmente trasparenti? Il test è sempre lo stesso: posso sostituirle con il loro valore senza cambiare il programma?" }].concat(Q.map(([e, v, w], i) => ({
        nota: ['<code>a = a + 42</code> è un <b>assegnamento</b>: cambia a. Eseguirlo due volte non equivale a eseguirlo una volta.',
          '<code>a[x] == 42</code> legge un array <b>mutabile</b>: lo stesso a[x] può valere cose diverse in momenti diversi. In generale non si può sostituire con un valore fisso.',
          '<code>println("42")</code> vale void. Sostituirlo con \"niente\" toglie la stampa: il programma cambia.',
          '<code>throw</code> non produce un valore, interrompe il flusso: non c\'è niente con cui sostituirlo.',
          '<code>f(f(x))</code> con f pura: composizione di funzioni pure su un valore. Si può sostituire con il risultato: <b>RT</b>.',
          '<code>z = z + f(f(x))</code>: la parte destra è pura, ma l\'<b>assegnamento</b> a z è un effetto. Non RT.'][i],
        set: { ['q' + i]: { tono: v === 'RT' ? 'ok' : 'no' }, ['v' + i]: { t: v, tono: v === 'RT' ? 'ok' : 'no' }, ['w' + i]: { t: w } }
      })))
    };

    const nodo = (id, x, t) => R(id, x, 150, 150, 44, t, { tono: 'due' });
    SCENE.spark = {
      w: 580, h: 250, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: [
        R('drv', 190, 20, 200, 44, 'driver: counter = 0', { tono: 'dato' }),
        nodo('n1', 20, 'nodo 1'), nodo('n2', 215, 'nodo 2'), nodo('n3', 410, 'nodo 3'),
        F('s1', 250, 66, 95, 146, '', { nascosto: true }), F('s2', 290, 66, 290, 146, '', { nascosto: true }), F('s3', 330, 66, 485, 146, '', { nascosto: true }),
        T('c', 290, 230, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "Apache Spark distribuisce il calcolo su più computer. Voglio sommare i dati con <code>rdd.foreach(x =&gt; counter += x)</code>: sembra innocuo." },
        { nota: "La funzione <code>x =&gt; counter += x</code> viene spedita a ogni nodo <b>insieme a una copia</b> di counter.", set: { s1: { nascosto: false }, s2: { nascosto: false }, s3: { nascosto: false }, n1: { t: 'copia: counter = 0' }, n2: { t: 'copia: counter = 0' }, n3: { t: 'copia: counter = 0' } } },
        { nota: "Ogni nodo incrementa <b>la sua</b> copia: 17, 9, 30. Quella del driver resta 0. Il risultato è sbagliato, e nessun errore lo segnala.", set: { n1: { t: 'copia: 17' }, n2: { t: 'copia: 9' }, n3: { t: 'copia: 30' }, drv: { tono: 'no' }, c: { t: 'driver: counter = 0', tono: 'no' } } },
        { nota: "Versione pura: <code>rdd.reduce(_ + _)</code>. Nessuna variabile: ogni nodo calcola una somma parziale e i risultati vengono combinati, 17 + 9 + 30 = 56. Spark può dividere il lavoro come vuole perché ogni pezzo è un calcolo senza effetti.", set: { n1: { t: 'somma parziale 17', tono: 'ok' }, n2: { t: 'somma parziale 9', tono: 'ok' }, n3: { t: 'somma parziale 30', tono: 'ok' }, drv: { t: 'totale = 56', tono: 'ok' }, s1: { x1: 95, y1: 146, x2: 250, y2: 66 }, s2: { x1: 290, y1: 146, x2: 290, y2: 66 }, s3: { x1: 485, y1: 146, x2: 330, y2: 66 }, c: { t: 'reduce(_ + _): 56, senza effetti', tono: 'ok' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s010|}}</h1>
  <p class="lede">{{s|s011|}}</p>
</header>

<section>
  <h2>{{s|s012|}}</h2>
  <p>{{s|s013|}}</p>

  <figure class="passi" data-titolo="{{a|s014|}}">
    <div class="passo">
      <div class="espr">val x = <mark class="dato">square(3)</mark>
x + x</div>
      <p class="nota">{{s|s015|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="dato">square(3)</mark> + <mark class="dato">square(3)</mark></div>
      <p class="nota">{{s|s016|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ora">9</mark> + <mark class="ora">9</mark></div>
      <p class="nota">{{s|s017|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">18</mark>   in entrambi i programmi</div>
      <p class="nota">{{s|s018|}}</p>
    </div>
  </figure>

  <figure class="passi" data-titolo="{{a|s019|}}">
    <div class="passo">
      <div class="espr">var counter = 0
def next(): Int =
  counter = counter + 1
  counter</div>
      <p class="nota">{{s|s020|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val x = <mark class="dato">next()</mark>     <span class="mano">// x = 1</span>
x + x              <span class="mano">// 1 + 1</span></div>
      <p class="nota">{{s|s021|}}</p>
    </div>
    <div class="passo">
      <div class="espr">x + x   =   <mark class="ok">2</mark></div>
      <p class="nota">{{s|s022|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ora">next()</mark> + <mark class="due">next()</mark>   =   <mark class="ora">1</mark> + <mark class="due">2</mark></div>
      <p class="nota">{{s|s023|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="no">3</mark>   ≠   2</div>
      <p class="nota">{{s|s024|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="sostituzione" data-titolo="{{a|s025|}}"></figure>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <div class="box regola" data-tit="{{a|s027|}}">
    <p>{{s|s028|}}</p>
  </div>
  <div class="box regola" data-tit="{{a|s029|}}">
    <p>{{s|s030|}}</p>
  </div>
  <p>{{s|s031|}}</p>
  <ul>
    <li>{{s|s032|}}</li>
    <li>{{s|s033|}}</li>
    <li>{{s|s034|}}</li>
    <li>{{s|s035|}}</li>
    <li>{{s|s036|}}</li>
  </ul>
  <p>{{s|s037|}}</p>
  <figure class="scena" data-scena="effetti" data-titolo="{{a|s038|}}"></figure>
</section>

<section>
  <h2>{{s|s039|}}</h2>
  <p>{{s|s040|}}</p>
  <figure class="scena" data-scena="aggiungi" data-titolo="{{a|s041|}}"></figure>
</section>

<section>
  <h2>{{s|s042|}}</h2>
  <p>{{s|s043|}}</p>
  <figure class="scena" data-scena="sondaggio" data-titolo="{{a|s044|}}"></figure>
</section>

<section>
  <h2>{{s|s045|}}</h2>
  <p>{{s|s046|}}</p>
  <figure class="passi" data-titolo="{{a|s047|}}">
    <div class="passo">
      <div class="espr">var counter = 0
val rdd = sc.parallelize(data)
rdd.foreach(x => <mark class="no">counter += x</mark>)</div>
      <p class="nota">{{s|s048|}}</p>
    </div>
    <div class="passo">
      <div class="espr">nodo 1: <mark class="due">counter</mark>  (copia)
nodo 2: <mark class="due">counter</mark>  (copia)
nodo 3: <mark class="due">counter</mark>  (copia)</div>
      <p class="nota">{{s|s049|}}</p>
    </div>
    <div class="passo">
      <div class="espr">nodo 1: 17   nodo 2: 9   nodo 3: 30
driver: counter = <mark class="no">0</mark></div>
      <p class="nota">{{s|s050|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val totale = rdd.<mark class="ok">reduce(_ + _)</mark></div>
      <p class="nota">{{s|s051|}}</p>
    </div>
  </figure>
  <div class="box esame" data-tit="{{a|s052|}}">
    <p>{{s|s053|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s054|}}">
    <p>{{s|s055|}}</p>
  </div>
  <figure class="scena" data-scena="spark" data-titolo="{{a|s056|}}"></figure>
</section>

</main>
</body>
</html>
