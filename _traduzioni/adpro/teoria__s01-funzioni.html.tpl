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
SCENE.filtro = {
  w: 520, h: 230, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'L', tipo: 'celle', x: 60, y: 40, cw: 60, ch: 42, valori: ['1', '−2', '3'] },
    { id: 'p', tipo: 'nodo', forma: 'quadrato', r: 38, x: 380, y: 60, t: 'x < 0' },
    { id: 'v', tipo: 'testo', x: 380, y: 125, t: '', size: 14, bold: true },
    { id: 'R', tipo: 'celle', x: 60, y: 150, cw: 60, ch: 42, valori: ['', '', ''], indici: false },
    { id: 'tr', tipo: 'testo', x: 150, y: 140, t: 'risultato', size: 12 },
    { id: 'n', tipo: 'testo', x: 260, y: 215, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { L: { toni: { 0: 'no' } }, p: { tono: 'ora' }, v: { t: '1 < 0 → false', tono: 'no' } } },
    { nota: '{{j|s005|'}}', set: { L: { toni: { 0: 'no', 1: 'ok' } }, v: { t: '−2 < 0 → true', tono: 'ok' }, R: { valori: ['−2', '', ''], toni: { 0: 'ok' } } } },
    { nota: '{{j|s006|'}}', set: { L: { toni: { 0: 'no', 1: 'ok', 2: 'no' } }, v: { t: '3 < 0 → false', tono: 'no' } } },
    { nota: '{{j|s007|'}}', set: { p: { tono: null }, v: { t: '' }, n: { t: 'List(1, −2, 3).filter(x => x < 0) = List(−2)', tono: 'ok' } } }
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

    SCENE.lambda = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [
        C('l', 20, 40, ['1', '-2', '3'], { toni: { 0: 'dato', 1: 'dato', 2: 'dato' } }), T('lt', 98, 28, 'List(1, -2, 3)', { size: 12 }),
        R('z', 200, 40, 110, 40, '(42, false)', { tono: 'dato' }), T('zt', 255, 28, 'coppia', { size: 12 }),
        R('fn', 340, 40, 220, 40, '(x: Int) => x < 0', { tono: 'ora', nascosto: true }), T('fnt', 450, 28, 'funzione anonima', { size: 12, nascosto: true }),
        T('e1', 290, 130, '', { bold: true, size: 15 }), T('e2', 290, 170, '', { size: 13 })
      ],
      passi: [
        { nota: "Per i dati ci sono i <b>letterali</b>: scrivi il valore direttamente nel codice, una lista, una coppia." },
        { nota: "Anche una funzione ha il suo letterale: la <b>funzione anonima</b> (lambda). Parametro con tipo, freccia, corpo. Non ha nome: lo prende se la metti in una val.", set: { fn: { nascosto: false }, fnt: { nascosto: false }, e1: { t: 'val negative = (x: Int) => x < 0' } } },
        { nota: "La chiami come una funzione normale: <code>negative(-42)</code>.", set: { e1: { t: 'negative(-42)' } } },
        { nota: "x viene <b>sostituito</b> da −42 nel corpo.", set: { e1: { t: '-42 < 0' } } },
        { nota: "Risultato: true. Il tipo di negative è Int =&gt; Boolean.", set: { e1: { t: 'true', tono: 'ok' }, e2: { t: 'negative: Int => Boolean' } } }
      ]
    };

    SCENE.ph = {
      w: 560, h: 150,
      codice: { lang: 'scala', testo: `def dropWhile[A](l: List[A], p: A => Boolean): List[A] = l match
  case Nil => Nil
  case Cons(h, t) => if p(h) then dropWhile(t, p) else l` },
      legenda: '{{j|s009|'}}',
      oggetti: [
        C('l', 20, 40, ['-2', '-1', '3', '4']), R('p', 270, 40, 150, 40, 'p = _ < 0', { tono: 'dato' }),
        T('c', 290, 116, 'dropWhile(List(-2, -1, 3, 4), _ < 0)', { size: 12, bold: true })
      ],
      passi: [
        { nota: "<code>p</code> è la funzione intera (tipo A =&gt; Boolean). <code>p(h)</code> è il suo <b>risultato</b> su h (un Boolean). Seguiamo dropWhile su List(−2, −1, 3, 4) con p = _ &lt; 0.", righe: [1] },
        { nota: "h = −2. <code>p(h)</code> esegue la funzione: −2 &lt; 0 è true. Si richiama su t, passando <b>p</b> senza parentesi: non la eseguo, la consegno intera.", righe: [3], set: { l: { toni: { 0: 'ok' } }, c: { t: 'p(-2) = true → dropWhile(t, p)' } } },
        { nota: "h = −1: p(−1) = true. Scarto anche questo e passo avanti p, di nuovo intera.", righe: [3], set: { l: { toni: { 0: 'spento', 1: 'ok' } }, c: { t: 'p(-1) = true → dropWhile(t, p)' } } },
        { nota: "h = 3: p(3) = false. Restituisco <code>l</code> così com'è: inizia già dall'elemento giusto.", righe: [3], set: { l: { toni: { 0: 'spento', 1: 'spento', 2: 'no' } }, c: { t: 'p(3) = false → l = List(3, 4)', tono: 'ok' } } }
      ]
    };

    SCENE.tremodi = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [
        T('f', 290, 40, 'l.filter((x: Int) => x < 0)', { bold: true, size: 15 }), T('s', 290, 76, 'forma completa, con il tipo', { size: 12 }),
        C('acc', 150, 110, ['1', '2', '3'], { nascosto: true }), T('ft', 290, 180, '', { size: 13, bold: true }), T('ft2', 290, 208, '', { size: 12 })
      ],
      passi: [
        { nota: "La stessa funzione in tre forme. Prima quella completa, con il tipo del parametro." },
        { nota: "l è una List[Int]: Scala sa già che x è un Int. Il tipo si toglie.", set: { f: { t: 'l.filter(x => x < 0)' }, s: { t: 'il tipo lo deduce Scala' } } },
        { nota: "Il parametro compare una volta sola: al suo posto <code>_</code>. Niente nome, niente freccia.", set: { f: { t: 'l.filter(_ < 0)' }, s: { t: 'un _ = un parametro' } } },
        { nota: "Ogni <code>_</code> è un parametro <b>nuovo</b>, nell'ordine: <code>_ + _</code> è <code>(a, b) =&gt; a + b</code>. Perfetto per foldLeft, che vuole (accumulatore, elemento).", set: { f: { t: 'List(1, 2, 3).foldLeft(0)(_ + _)' }, s: { t: '_ + _  =  (a, b) => a + b' }, acc: { nascosto: false }, ft: { t: '0+1 = 1, 1+2 = 3, 3+3 = 6', tono: 'ok' } } },
        { nota: "Attenzione: <code>map(_ * _)</code> non compila (\"Wrong number of parameters, expected: 1\"): sono due parametri, map ne vuole uno. Per x · x serve il nome: <code>map(x =&gt; x * x)</code>. E <code>val negative = x =&gt; x &lt; 0</code> non compila: senza lista, il tipo di x non si deduce.", set: { f: { t: 'List(1, 2, 3).map(_ * _)', tono: 'no' }, s: { t: 'due _ = due parametri: map ne vuole uno' }, acc: { nascosto: true }, ft: { t: 'map(x => x * x)  →  List(1, 4, 9)', tono: 'ok' }, ft2: { t: 'senza contesto: (x: Int) => x < 0' } } }
      ]
    };

    SCENE.fabbrica = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s011|'}}',
      oggetti: [
        R('fa', 20, 40, 170, 50, 'piuDi(soglia)', { tono: 'ora' }), R('in', 20, 110, 80, 36, '100', { tono: 'dato', nascosto: true }),
        F('f1', 192, 65, 246, 65, '', { nascosto: true }), R('gr', 250, 40, 150, 50, 'x => x > 100', { tono: 'due', nascosto: true }), T('grt', 325, 110, 'grande', { size: 12, nascosto: true }),
        C('l', 420, 40, ['50', '150', '300'], { cw: 48, nascosto: true }), T('c', 290, 190, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "Una funzione può <b>produrre</b> una funzione. <code>piuDi(soglia: Int): Int =&gt; Boolean</code>: il tipo di ritorno ha una freccia." },
        { nota: "Chiamo la fabbrica con 100.", set: { in: { nascosto: false } } },
        { nota: "Esce una funzione con la soglia già fissata: <code>x =&gt; x &gt; 100</code>. La metto in <code>val grande</code>.", set: { f1: { nascosto: false }, gr: { nascosto: false }, grt: { nascosto: false } } },
        { nota: "La uso dove serve una funzione: <code>List(50, 150, 300).filter(grande)</code> = List(150, 300). È la base del currying.", set: { l: { nascosto: false, toni: { 0: 'no', 1: 'ok', 2: 'ok' } }, c: { t: 'filter(grande) → List(150, 300)', tono: 'ok' } } }
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
  <p>{{s|s015|}}</p>
  <pre class="cod" data-lang="scala">val l = List(1, -2, 3)        // una lista
val a = Array(-1, 2, -3)      // un array
val z = (42, false)           // una coppia</pre>
  <p>{{s|s016|}}</p>

  <figure class="passi" data-titolo="{{a|s017|}}">
    <div class="passo">
      <div class="espr">val negative = <mark class="dato">(x: Int)</mark> => x &lt; 0</div>
      <p class="nota">{{s|s018|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val negative = (x: Int) <mark class="ora">=></mark> x &lt; 0</div>
      <p class="nota">{{s|s019|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val negative = (x: Int) => <mark class="ok">x &lt; 0</mark></div>
      <p class="nota">{{s|s020|}}</p>
    </div>
    <div class="passo">
      <div class="espr">negative(<mark class="dato">-42</mark>)</div>
      <p class="nota">{{s|s021|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="dato">-42</mark> &lt; 0</div>
      <p class="nota">{{s|s022|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">true</mark></div>
      <p class="nota">{{s|s023|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="lambda" data-titolo="{{a|s024|}}"></figure>
</section>

<section>
  <h2>{{s|s025|}}</h2>
  <p>{{s|s026|}}</p>
  <figure class="passi" data-titolo="{{a|s027|}}">
    <div class="passo">
      <div class="espr">List(<mark class="dato">1</mark>, -2, 3).filter(<mark class="ora">x => x &lt; 0</mark>)</div>
      <p class="nota">{{s|s028|}}</p>
    </div>
    <div class="passo">
      <div class="espr">x = <mark class="dato">1</mark>   →   1 &lt; 0   →   <mark class="no">false</mark></div>
      <p class="nota">{{s|s029|}}</p>
    </div>
    <div class="passo">
      <div class="espr">x = <mark class="dato">-2</mark>   →   -2 &lt; 0   →   <mark class="ok">true</mark></div>
      <p class="nota">{{s|s030|}}</p>
    </div>
    <div class="passo">
      <div class="espr">x = <mark class="dato">3</mark>   →   3 &lt; 0   →   <mark class="no">false</mark></div>
      <p class="nota">{{s|s031|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">List(-2)</mark></div>
      <p class="nota">{{s|s032|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="filtro" data-titolo="{{a|s033|}}"></figure>
  <div class="box domanda-tua" data-tit="{{a|s034|}}">
    <p>{{s|s035|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s036|}}</h2>
  <p>{{s|s037|}}</p>
  <figure class="codice" data-titolo="{{a|s038|}}">
<pre data-lang="scala">def dropWhile[A](l: List[A], p: A => Boolean): List[A] = l match
  case Nil => Nil
  case Cons(h, t) => if p(h) then dropWhile(t, p) else l</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="p: A => Boolean"><p>{{s|s039|}}</p></li>
      <li data-righe="3" data-segna="Cons(h, t)@dato"><p>{{s|s040|}}</p></li>
      <li data-righe="3" data-segna="p(h)@ora"><p>{{s|s041|}}</p></li>
      <li data-righe="3" data-segna="dropWhile(t, @ok|p)@due"><p>{{s|s042|}}</p></li>
      <li data-righe="3" data-segna="else l@ok"><p>{{s|s043|}}</p></li>
    </ol>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s044|}}</th><th>{{s|s045|}}</th><th>{{s|s046|}}</th></tr></thead>
    <tbody>
      <tr><td><code>p</code></td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr>
      <tr><td><code>p(h)</code></td><td>{{s|s049|}}</td><td>{{s|s050|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="ph" data-titolo="{{a|s051|}}"></figure>
</section>

<section>
  <h2>{{s|s052|}}</h2>
  <p>{{s|s053|}}</p>
  <figure class="passi" data-titolo="{{a|s054|}}">
    <div class="passo">
      <div class="espr">l.filter((x: <mark class="dato">Int</mark>) => x &lt; 0)</div>
      <p class="nota">{{s|s055|}}</p>
    </div>
    <div class="passo">
      <div class="espr">l.filter(<mark class="ora">x</mark> => x &lt; 0)</div>
      <p class="nota">{{s|s056|}}</p>
    </div>
    <div class="passo">
      <div class="espr">l.filter(<mark class="ora">_</mark> &lt; 0)</div>
      <p class="nota">{{s|s057|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ora">_</mark> + <mark class="due">_</mark>    =    (<mark class="ora">a</mark>, <mark class="due">b</mark>) => <mark class="ora">a</mark> + <mark class="due">b</mark></div>
      <p class="nota">{{s|s058|}}</p>
    </div>
    <div class="passo">
      <div class="espr">List(1, 2, 3).foldLeft(0)(<mark class="ok">_ + _</mark>)   →   6</div>
      <p class="nota">{{s|s059|}}</p>
    </div>
  </figure>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">List(1, 2, 3).map(_ * _)</pre>
      <pre class="msg">Wrong number of parameters, expected: 1</pre>
      <div class="fix">{{s|s060|}}</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">val negative = x => x &lt; 0</pre>
      <pre class="msg">Missing parameter type

I could not infer the type of the parameter x</pre>
      <div class="fix">{{s|s061|}}</div>
    </div>
  </div>
  <figure class="scena" data-scena="tremodi" data-titolo="{{a|s062|}}"></figure>
</section>

<section>
  <h2>{{s|s063|}}</h2>
  <p>{{s|s064|}}</p>
  <figure class="passi" data-titolo="{{a|s065|}}">
    <div class="passo">
      <div class="espr">def piuDi(<mark class="dato">soglia</mark>: Int): Int => Boolean =
  x => x &gt; <mark class="dato">soglia</mark></div>
      <p class="nota">{{s|s066|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val grande = piuDi(<mark class="dato">100</mark>)</div>
      <p class="nota">{{s|s067|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val grande = <mark class="ora">x => x &gt; 100</mark></div>
      <p class="nota">{{s|s068|}}</p>
    </div>
    <div class="passo">
      <div class="espr">List(50, 150, 300).filter(<mark class="ora">grande</mark>)   →   <mark class="ok">List(150, 300)</mark></div>
      <p class="nota">{{s|s069|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="fabbrica" data-titolo="{{a|s070|}}"></figure>
</section>

</main>
</body>
</html>
