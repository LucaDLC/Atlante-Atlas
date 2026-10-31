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
SCENE.casi = {
  w: 600, h: 270, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'L', tipo: 'celle', x: 150, y: 20, cw: 54, ch: 40, valori: ['1', '2', '3', '4', '5'] },
    { id: 'c1', tipo: 'testo', x: 30, y: 110, t: 'case Cons(x, Cons(2, Cons(4, _))) => x', size: 14, anchor: 'start' },
    { id: 'c2', tipo: 'testo', x: 30, y: 140, t: 'case Nil => 42', size: 14, anchor: 'start' },
    { id: 'c3', tipo: 'testo', x: 30, y: 170, t: 'case Cons(x, Cons(y, Cons(3, Cons(4, _)))) => x + y', size: 14, anchor: 'start' },
    { id: 'c4', tipo: 'testo', x: 30, y: 200, t: 'case Cons(h, t) => h + sum(t)', size: 14, anchor: 'start' },
    { id: 'n', tipo: 'testo', x: 300, y: 248, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { c1: { tono: 'no' }, L: { toni: { 0: 'ok', 1: 'ok', 2: 'no' } } } },
    { nota: '{{j|s005|'}}', set: { c2: { tono: 'no' }, L: { toni: {} } } },
    { nota: '{{j|s006|'}}', set: { c3: { tono: 'ok' }, L: { toni: { 0: 'ok', 1: 'ok', 2: 'ok', 3: 'ok' } } } },
    { nota: '{{j|s007|'}}', set: { c4: { tono: 'spento' }, n: { t: 'risultato: x + y = 3', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

    SCENE.leggimatch = {
      w: 540, h: 170,
      codice: { lang: 'scala', testo: `def head[A](l: List[A]): A = l match
  case Nil => throw NoSuchElementException()
  case Cons(h, _) => h` },
      legenda: '{{j|s008|'}}',
      oggetti: [
        R('c1', 30, 40, 60, 40, '7', { tono: 'spento' }), R('t1', 90, 40, 40, 40, '•', { tono: 'spento' }), F('a1', 122, 60, 156, 60, ''),
        R('c2', 160, 40, 60, 40, '8', { tono: 'spento' }), F('a2', 222, 60, 256, 60, ''), R('nil', 260, 40, 60, 40, 'Nil', { tono: 'spento' }),
        T('h', 60, 110, '', { bold: true, tono: 'dato' }), T('u', 190, 130, '', { size: 12 }), T('c', 420, 60, '', { bold: true, size: 14 })
      ],
      passi: [
        { nota: "<code>head(List(7, 8))</code>. <code>l match</code>: l è il <b>soggetto</b>, la cosa di cui chiedo la forma. I casi si provano dall'alto." },
        { nota: "Primo caso: <code>Nil</code>? No, l è una cella.", righe: [2], set: { c1: { tono: 'no' }, t1: { tono: 'no' } } },
        { nota: "Secondo caso: <code>Cons(h, _)</code>? Sì. Il pattern mette in fila i due campi della cella, head e tail: il primo si chiama <b>h</b> (un nome nuovo, che si riempie con 7)…", righe: [3], set: { c1: { tono: 'dato' }, t1: { tono: 'ok' }, h: { t: 'h = 7' } } },
        { nota: "…il secondo, la coda, c'è ma non mi serve: <b>_</b> vuol dire \"lo scarto\".", righe: [3], set: { c2: { tono: 'spento' }, u: { t: '_ = il resto, scartato' } } },
        { nota: "A destra della freccia il risultato: <b>h = 7</b>. Potevi scrivere Cons(primo, resto): i nomi li scegli tu, conta la posizione.", righe: [3], set: { c: { t: 'head = 7', tono: 'ok' } } }
      ]
    };

    const P = [['Nil', false, ''], ['Cons(h, t)', true, 'h = 2, t = List(5)'], ['Cons(_, Nil)', false, 'ha due elementi, non uno'], ['Cons(2, t)', true, 't = List(5)'], ['Cons(x, Cons(y, _))', true, 'x = 2, y = 5'], ['_', true, 'tutto: nessun nome']];
    const og = [T('v', 300, 24, 'valore: List(2, 5)', { bold: true })];
    P.forEach(([p], i) => og.push(R('p' + i, 20, 40 + i * 33, 200, 28, p, { tono: 'spento' }), T('r' + i, 240, 59 + i * 33, '', { size: 12, anchor: 'start' })));
    SCENE.pattern = {
      w: 600, h: 250, lato: true,
      legenda: '{{j|s009|'}}',
      oggetti: og,
      passi: [{ nota: "Lo stesso valore, <code>List(2, 5)</code>, provato contro vari pattern. Un pattern descrive una <b>forma</b>; i nomi minuscoli si riempiono, i Maiuscoli (Nil, Cons, costanti) devono combaciare." }].concat(P.map(([p, ok, w], i) => ({
        nota: ['<code>Nil</code>: solo la lista vuota. No.', '<code>Cons(h, t)</code>: qualsiasi cella. Sì: h = 2, t = List(5).', '<code>Cons(_, Nil)</code>: un solo elemento (la coda è Nil). Qui la coda è List(5): no.', '<code>Cons(2, t)</code>: una lista che inizia con 2. Il 2 è una costante: deve essere uguale. Sì, t = List(5).', '<code>Cons(x, Cons(y, _))</code>: almeno due elementi, pattern annidato. Sì: x = 2, y = 5.', '<code>_</code>: combacia con tutto, non crea nomi. (Anche un nome minuscolo da solo, come x, combacia con tutto.)'][i],
        set: { ['p' + i]: { tono: ok ? 'ok' : 'no' }, ['r' + i]: { t: ok ? '✓ ' + w : '✗ ' + w, tono: ok ? 'ok' : 'no' } }
      })))
    };

    SCENE.guardie = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [
        R('g1', 20, 30, 260, 32, 'case Some(a) if p(a) => this', { tono: 'spento' }), R('g2', 20, 70, 260, 32, 'case Some(a) if !p(a) => None', { tono: 'spento' }), R('g3', 20, 110, 260, 32, 'case None => None', { tono: 'spento' }),
        T('v1', 300, 51, '', { size: 12, anchor: 'start' }), T('v2', 300, 91, '', { size: 12, anchor: 'start' }), T('v3', 300, 131, '', { size: 12, anchor: 'start' }),
        T('c', 290, 180, '', { size: 12, bold: true }), T('c2', 290, 210, '', { size: 12 })
      ],
      passi: [
        { nota: "Una <b>guardia</b>: <code>case … if condizione</code>. Il caso vale solo se il pattern combacia <b>e</b> la condizione è vera. Questi tre casi sembrano coprire tutto: p(a) o è vero o è falso." },
        { nota: "Ma per il compilatore una guardia vale \"<b>forse</b>\": non ragiona su cosa fa p. I due Some sono solo \"forse\".", set: { g1: { tono: 'due' }, g2: { tono: 'due' }, v1: { t: 'forse' }, v2: { t: 'forse' } } },
        { nota: "None è coperto di sicuro. Un Some invece potrebbe \"sfuggire\" ai due forse: avviso <i>match may not be exhaustive</i>, e con -Werror non compila.", set: { g3: { tono: 'ok' }, v3: { t: 'sì' }, c: { t: 'match may not be exhaustive', tono: 'no' } } },
        { nota: "Soluzione 1: l'ultimo caso senza guardia, <code>case _ =&gt; None</code>. Soluzione 2: niente guardie, la decisione nel corpo: <code>case Some(a) =&gt; if p(a) then this else None</code>.", set: { g2: { t: 'case _ => None', tono: 'ok' }, v2: { t: 'sì, senza guardia' }, g3: { tono: 'spento', t: '' }, v3: { t: '' }, c: { t: 'ultimo caso senza guardia: esaustivo', tono: 'ok' }, c2: { t: 'oppure: case Some(a) => if p(a) then this else None' } } }
      ]
    };

    SCENE.duelist = {
      w: 560, h: 170,
      codice: { lang: 'scala', testo: `def addPairwise(l: List[Int], r: List[Int]): List[Int] = (l, r) match
  case (Nil, _) => Nil
  case (_, Nil) => Nil
  case (Cons(h1, t1), Cons(h2, t2)) => Cons(h1 + h2, addPairwise(t1, t2))` },
      legenda: '{{j|s011|'}}',
      oggetti: [C('l', 60, 20, ['1', '2']), C('r', 60, 70, ['10', '20', '30']), C('o', 60, 120, ['', ''], { toni: { 0: 'spento', 1: 'spento' } }), T('ll', 30, 45, 'l', { bold: true }), T('lr', 30, 95, 'r', { bold: true }), T('c', 400, 90, '', { size: 12 })],
      passi: [
        { nota: "Per scorrere due liste insieme: metto le due liste in una <b>coppia</b> <code>(l, r)</code> e faccio il match sulla coppia. Ogni pattern ha due pezzi.", righe: [1] },
        { nota: "Entrambe hanno una cella: h1 = 1, h2 = 10, nomi diversi per le due teste. Cella del risultato: 11, poi le code.", righe: [4], set: { l: { toni: { 0: 'ora' } }, r: { toni: { 0: 'ora' } }, o: { valori: ['11', ''], toni: { 0: 'ok', 1: 'spento' } } } },
        { nota: "2 + 20 = 22.", righe: [4], set: { l: { toni: { 1: 'ora' } }, r: { toni: { 1: 'ora' } }, o: { valori: ['11', '22'], toni: { 0: 'ok', 1: 'ok' } } } },
        { nota: "l è finita: <code>(Nil, _)</code>, il _ dice \"l'altra non mi interessa\". Mi fermo: List(11, 22). I due casi con Nil coprono insieme anche (Nil, Nil).", righe: [2], set: { l: { toni: {} }, r: { toni: { 2: 'no' } }, c: { t: 'List(11, 22)', tono: 'ok' } } }
      ]
    };

    const E = [['= match', 'expression expected but match found', '= t match'], ['case Const(h, t)', 'no pattern match extractor named Const', 'case Cons(h, t)'], ['case n < 0 => l', 'no pattern match extractor named <', 'case _ if n <= 0 => l'], ['case Some(X) => X', 'Not found: X', 'case Some(x) => x'], ['solo case Cons(h, _)', 'match may not be exhaustive: Nil', '+ case Nil => …'], ['Cons(h, t) prima di Cons(1, t)', 'Unreachable case', 'casi specifici prima']];
    SCENE.errorimatch = {
      w: 600, h: 220, lato: true,
      legenda: '{{j|s012|'}}',
      oggetti: [T('n', 300, 24, '', { bold: true }), R('s', 20, 40, 270, 40, '', { tono: 'no' }), R('g', 310, 40, 270, 40, '', { tono: 'ok' }), T('m', 300, 120, '', { size: 12, bold: true }), T('p', 300, 170, '', { size: 12 })],
      passi: [{ nota: "Sei errori veri degli esercizi, con il messaggio di Scala 3.8. Per ognuno: codice, messaggio, correzione." }].concat(E.map(([s, m, g], i) => ({
        nota: ['Manca il <b>soggetto</b> prima di match.', 'Il costruttore si chiama <b>Cons</b>, senza t. Gli altri errori a cascata (value * is not a member of Any) spariscono correggendo il nome.', 'Un pattern descrive una <b>forma</b>, non una condizione: per n serve un if prima del match o una guardia.', '<b>Maiuscolo</b> = Scala cerca una X che esiste già. Per un nome nuovo, minuscolo.', 'Manca una forma. Con <b>-Werror</b> è un errore: la consegna non passa.', 'Il primo caso prende già tutte le celle: il secondo non scatta mai. Casi <b>specifici prima</b>.'][i],
        set: { n: { t: 'errore ' + (i + 1) + ' di 6' }, s: { t: s }, g: { t: g }, m: { t: m, tono: 'no' } }
      })))
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s013|}}</h1>
  <p class="lede">{{s|s014|}}</p>
</header>

<section>
  <h2>{{s|s015|}}</h2>
  <figure class="codice" data-titolo="{{a|s016|}}">
<pre data-lang="scala">def head[A](l: List[A]): A = l match
  case Nil => throw NoSuchElementException()
  case Cons(h, _) => h</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="l@dato|match@ora"><p>{{s|s017|}}</p></li>
      <li data-righe="2" data-segna="Nil@ora"><p>{{s|s018|}}</p></li>
      <li data-righe="3" data-segna="Cons@ora"><p>{{s|s019|}}</p></li>
      <li data-righe="3" data-segna="h@dato"><p>{{s|s020|}}</p></li>
      <li data-righe="3" data-segna="_@due"><p>{{s|s021|}}</p></li>
      <li data-righe="3" data-segna="=> h@ok"><p>{{s|s022|}}</p></li>
    </ol>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s023|}}">
    <p>{{s|s024|}}</p>
  </div>
  <figure class="scena" data-scena="leggimatch" data-titolo="{{a|s025|}}"></figure>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <p>{{s|s027|}}</p>
  <pre class="cod" data-lang="scala">List(1, 2, 3, 4, 5) match
  case Cons(x, Cons(2, Cons(4, _))) => x
  case Nil => 42
  case Cons(x, Cons(y, Cons(3, Cons(4, _)))) => x + y
  case Cons(h, t) => h
  case _ => 101</pre>
  <figure class="passi" data-titolo="{{a|s028|}}">
    <div class="passo">
      <div class="espr">Cons(<mark class="dato">1</mark>, Cons(<mark class="dato">2</mark>, Cons(<mark class="dato">3</mark>, Cons(<mark class="dato">4</mark>, Cons(<mark class="dato">5</mark>, Nil)))))</div>
      <p class="nota">{{s|s029|}}</p>
    </div>
    <div class="passo">
      <div class="espr">case Cons(<mark class="ok">x</mark>, Cons(<mark class="ok">2</mark>, Cons(<mark class="no">4</mark>, _)))
     Cons(1,   Cons(2,   Cons(3, …</div>
      <p class="nota">{{s|s030|}}</p>
    </div>
    <div class="passo">
      <div class="espr">case <mark class="no">Nil</mark></div>
      <p class="nota">{{s|s031|}}</p>
    </div>
    <div class="passo">
      <div class="espr">case Cons(<mark class="ok">x</mark>, Cons(<mark class="ok">y</mark>, Cons(<mark class="ok">3</mark>, Cons(<mark class="ok">4</mark>, _))))
     Cons(1,   Cons(2,   Cons(3,   Cons(4, …</div>
      <p class="nota">{{s|s032|}}</p>
    </div>
    <div class="passo">
      <div class="espr">x + y   =   1 + 2   =   <mark class="ok">3</mark></div>
      <p class="nota">{{s|s033|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="casi" data-titolo="{{a|s034|}}"></figure>
  <div class="box attenzione" data-tit="{{a|s035|}}">
    <p>{{s|s036|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s037|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s038|}}</th><th>{{s|s039|}}</th><th>{{s|s040|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr>
      <tr><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr>
      <tr><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td></tr>
      <tr><td>{{s|s050|}}</td><td>{{s|s051|}}</td><td><code>t</code></td></tr>
      <tr><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td><code>x</code>, <code>y</code></td></tr>
      <tr><td>{{s|s054|}}</td><td>{{s|s055|}}</td><td>{{s|s056|}}</td></tr>
      <tr><td><code>_</code></td><td>{{s|s057|}}</td><td>{{s|s058|}}</td></tr>
      <tr><td>{{s|s059|}}</td><td>{{s|s060|}}</td><td><code>x</code></td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s061|}}">
    <p>{{s|s062|}}</p>
  </div>
  <figure class="scena" data-scena="pattern" data-titolo="{{a|s063|}}"></figure>
</section>

<section>
  <h2>{{s|s064|}}</h2>
  <p>{{s|s065|}}</p>
  <figure class="passi" data-titolo="{{a|s066|}}">
    <div class="passo">
      <div class="espr">case Some(a) <mark class="ora">if p(a)</mark> => this</div>
      <p class="nota">{{s|s067|}}</p>
    </div>
    <div class="passo">
      <div class="espr">case Some(a) if p(a)  => this
case Some(a) if !p(a) => None
case None             => None</div>
      <p class="nota">{{s|s068|}}</p>
    </div>
    <div class="passo">
      <div class="espr">case Some(a) <mark class="no">if ???</mark>  => this      <span class="mano">// forse</span>
case Some(a) <mark class="no">if ???</mark>  => None      <span class="mano">// forse</span>
case None               => None      <span class="mano">// sì</span></div>
      <p class="nota">{{s|s069|}}</p>
    </div>
    <div class="passo">
      <div class="espr">case Some(a) if p(a) => this
case <mark class="ok">_</mark>              => None</div>
      <p class="nota">{{s|s070|}}</p>
    </div>
    <div class="passo">
      <div class="espr">case Some(a) => <mark class="ok">if p(a) then this else None</mark>
case None    => None</div>
      <p class="nota">{{s|s071|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="guardie" data-titolo="{{a|s072|}}"></figure>
</section>

<section>
  <h2>{{s|s073|}}</h2>
  <p>{{s|s074|}}</p>
  <figure class="codice" data-titolo="{{a|s075|}}">
<pre data-lang="scala">def addPairwise(l: List[Int], r: List[Int]): List[Int] = (l, r) match
  case (Nil, _) => Nil
  case (_, Nil) => Nil
  case (Cons(h1, t1), Cons(h2, t2)) => Cons(h1 + h2, addPairwise(t1, t2))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="(l, r) match@ora"><p>{{s|s076|}}</p></li>
      <li data-righe="2-3" data-segna="(Nil, _)@no|(_, Nil)@no"><p>{{s|s077|}}</p></li>
      <li data-righe="4" data-segna="Cons(h1, t1)@dato|Cons(h2, t2)@due"><p>{{s|s078|}}</p></li>
      <li data-righe="4" data-segna="h1 + h2@ok|addPairwise(t1, t2)@ora"><p>{{s|s079|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="duelist" data-titolo="{{a|s080|}}"></figure>
</section>

<section>
  <h2>{{s|s081|}}</h2>
  <p>{{s|s082|}}</p>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def size[A](t: Tree[A]): Int = match
  case Leaf(_) => 1</pre>
      <pre class="msg">expression expected but match found</pre>
      <div class="fix">Manca il soggetto prima di <code>match</code>: scrivi <code>= t match</code>.</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Const(h, t) => h * product(t)</pre>
      <pre class="msg">no pattern match extractor named Const was found</pre>
      <div class="fix">Il costruttore si chiama <code>Cons</code>, senza la t. (Seguono altri errori a cascata come <i>value * is not a member of Any</i>: sparisce tutto correggendo il nome.)</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def drop[A](l: List[A], n: Int): List[A] = l match
  case n &lt; 0 => l</pre>
      <pre class="msg">no pattern match extractor named &lt; was found</pre>
      <div class="fix">Un pattern descrive una <b>forma</b>, non una condizione. Per controllare <code>n</code> usa un <code>if</code> prima del match, o una guardia: <code>case _ if n &lt;= 0 => l</code>.</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Some(X) => X</pre>
      <pre class="msg">Not found: X</pre>
      <div class="fix">Maiuscolo = Scala cerca una <code>X</code> che esiste già. Per un nome nuovo usa il minuscolo: <code>case Some(x) => x</code>.</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def head[A](l: List[A]): A = l match
  case Cons(h, _) => h</pre>
      <pre class="msg">match may not be exhaustive.

It would fail on pattern case: Nil</pre>
      <div class="fix">Hai dimenticato una forma. Con <code>-Werror</code> è un errore: il file non compila e la consegna non passa. Aggiungi <code>case Nil => …</code>.</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">case Cons(h, t) => h
case Cons(1, t) => 1</pre>
      <pre class="msg">Unreachable case</pre>
      <div class="fix">Il primo caso prende già tutte le celle: il secondo non scatta mai. Metti i casi <b>più specifici prima</b>.</div>
    </div>
  </div>
  <figure class="scena" data-scena="errorimatch" data-titolo="{{a|s083|}}"></figure>
</section>

</main>
</body>
</html>
