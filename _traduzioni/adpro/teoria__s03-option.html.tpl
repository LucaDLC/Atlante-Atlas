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
SCENE.catena = {
  w: 630, h: 200, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 's0', tipo: 'rett', x: 10, y: 40, w: 100, h: 40, t: 'List(2,3,4)' },
    { id: 's1', tipo: 'rett', x: 120, y: 40, w: 100, h: 40, t: '.headOption' },
    { id: 's2', tipo: 'rett', x: 230, y: 40, w: 160, h: 40, t: '.filter(_ % 2 == 0)' },
    { id: 's3', tipo: 'rett', x: 400, y: 40, w: 100, h: 40, t: '.map(_ / 2)' },
    { id: 's4', tipo: 'rett', x: 510, y: 40, w: 115, h: 40, t: '.getOrElse(-1)' },
    { id: 'tk', tipo: 'rett', x: 10, y: 120, w: 100, h: 40, t: 'List(2,3,4)', tono: 'dato' },
    { id: 'giro', tipo: 'testo', x: 315, y: 185, t: 'primo giro', size: 12.5 }
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: { s0: { tono: 'ora' } } },
    { nota: '{{j|s004|'}}', set: { s0: { tono: null }, s1: { tono: 'ora' }, tk: { x: 120, t: 'Some(2)' } } },
    { nota: '{{j|s005|'}}', set: { s1: { tono: null }, s2: { tono: 'ora' }, tk: { x: 260 } } },
    { nota: '{{j|s006|'}}', set: { s2: { tono: null }, s3: { tono: 'ora' }, tk: { x: 400, t: 'Some(1)' } } },
    { nota: '{{j|s007|'}}', set: { s3: { tono: null }, s4: { tono: 'ora' }, tk: { x: 518, t: '1', tono: 'ok' } } },
    { nota: '{{j|s008|'}}', set: { s4: { tono: null }, s0: { t: 'List(3,4)', tono: 'ora' }, tk: { x: 10, t: 'List(3,4)', tono: 'dato' }, giro: { t: 'secondo giro' } } },
    { nota: '{{j|s009|'}}', set: { s0: { tono: null }, s1: { tono: 'ora' }, tk: { x: 120, t: 'Some(3)' } } },
    { nota: '{{j|s010|'}}', set: { s1: { tono: null }, s2: { tono: 'no' }, tk: { x: 260, t: 'None', tono: 'no' } } },
    { nota: '{{j|s011|'}}', set: { s2: { tono: null }, s3: { tono: 'spento' }, tk: { x: 400 } } },
    { nota: '{{j|s012|'}}', set: { s4: { tono: 'ora' }, tk: { x: 518, t: '-1', tono: 'ok' } } }
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

    SCENE.parziale = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s013|'}}',
      oggetti: [
        T('ha', 120, 24, 'List[Double]', { bold: true }), T('hb', 440, 24, 'Double', { bold: true }),
        R('i1', 40, 50, 160, 36, 'List(1, 2, 3)', { tono: 'dato' }), R('i2', 40, 110, 160, 36, 'List(4)', { tono: 'dato' }), R('i3', 40, 170, 160, 36, 'Nil', { tono: 'dato' }),
        R('o1', 380, 50, 160, 36, '2.0', { tono: 'ok' }), R('o2', 380, 110, 160, 36, '4.0', { tono: 'ok' }), R('o3', 380, 170, 160, 36, '', { tono: 'spento', nascosto: true }),
        F('f1', 202, 68, 376, 68, ''), F('f2', 202, 128, 376, 128, ''), F('f3', 202, 188, 376, 188, '', { nascosto: true }),
        T('x', 290, 180, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "Una funzione f : A → B è <b>totale</b> se ogni input ha un risultato. <code>mean</code> sulle liste: List(1, 2, 3) → 2.0, List(4) → 4.0…" },
        { nota: "…ma Nil non ha media: la vecchia versione lancia un'eccezione. È <b>parziale</b>, e il tipo Double non lo dice.", set: { i3: { tono: 'no' }, x: { t: 'Nil → eccezione', tono: 'no' } } },
        { nota: "Idea: invece di restringere cosa entra, <b>allargo cosa esce</b>. Option[Double] = tutti i Some(d) più un valore in più, None.", set: { hb: { t: 'Option[Double]' }, o1: { t: 'Some(2.0)' }, o2: { t: 'Some(4.0)' }, o3: { nascosto: false, t: 'None', tono: 'due' }, f3: { nascosto: false }, i3: { tono: 'dato' }, x: { t: '' } } },
        { nota: "Ora mean è <b>totale</b>: ogni lista ha una risposta. Il possibile fallimento è scritto nel tipo e il compilatore obbliga chi chiama a gestirlo. Un'eccezione invece non è un valore: rompe la trasparenza referenziale e non compare nel tipo." }
      ]
    };

    SCENE.optionadt = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s014|'}}',
      oggetti: [T('e1', 290, 40, '', { size: 13 }), T('e2', 290, 80, '', { size: 13 }), T('e3', 290, 120, '', { size: 13 }), T('c', 290, 180, '', { size: 12 })],
      passi: [
        { nota: "<code>enum Option[+A]</code>: due forme, come la lista. <b>Some(get)</b> contiene un valore, <b>None</b> niente. None ha tipo Option[Nothing] e grazie a +A va bene per ogni tipo." },
        { nota: "La libreria lo usa ovunque. <code>Map.get</code>: la chiave può non esserci.", set: { e1: { t: 'Map("a" -> 1).get("a") = Some(1)', tono: 'ok' }, e2: { t: 'Map("a" -> 1).get("z") = None', tono: 'no' } } },
        { nota: "<code>headOption</code>: la lista può essere vuota. <code>find(p)</code>: nessun elemento può soddisfare p.", set: { e1: { t: 'List(5, 6).headOption = Some(5)', tono: 'ok' }, e2: { t: 'List().headOption = None', tono: 'no' }, e3: { t: 'List(1, 3).find(_ % 2 == 0) = None', tono: 'no' } } },
        { nota: "Ogni volta che una risposta può mancare, il tipo lo dice: Option.", set: { c: { t: '“può mancare” scritto nel tipo, non in un null' } } }
      ]
    };

    const K = [['Some(3).map(_ + 1)', 'Some(4)', 'ok'], ['None.map(_ + 1)', 'None', 'no'], ['Some(3).flatMap(x => if x > 0 then Some(x) else None)', 'Some(3)', 'ok'], ['Some(3).filter(_ > 5)', 'None', 'no'], ['None.getOrElse { println("valutato!"); 42 }', 'stampa, poi 42', 'ok'], ['Some(7).getOrElse { println("valutato!"); 42 }', '7, niente stampa', 'ok']];
    SCENE.api = {
      w: 600, h: 210, lato: true,
      legenda: '{{j|s015|'}}',
      oggetti: [T('e', 300, 50, '', { bold: true, size: 13 }), T('r', 300, 100, '', { bold: true, size: 16 }), T('c', 300, 160, '', { size: 12 })],
      passi: [{ nota: "L'API dell'esercizio 6, una chiamata alla volta. Sono metodi: il valore su cui lavorano è <code>this</code>." }].concat(K.map(([e, r, t], i) => ({
        nota: ['<b>map</b>: c\'è un valore, applico f, e rimetto il risultato in un Some (f dà un B nudo).', 'Su None non c\'è niente a cui applicare f: None resta None.', '<b>flatMap</b>: f restituisce già un Option, quindi lo restituisco così com\'è. Serve quando anche il passo dopo può fallire. Scrivere Some(f(a)) darebbe Option[Option[B]].', '<b>filter</b>: tengo il valore solo se soddisfa p. 3 &gt; 5 è falso: None.', '<b>getOrElse</b>: esce dall\'Option. Con None serve il default, che viene eseguito: stampa \"valutato!\" e vale 42.', 'Con Some il default <b>non viene mai eseguito</b>, grazie a <code>=&gt; B</code> (by-name): 7, e niente stampa (verificato).'][i],
        set: { e: { t: e }, r: { t: r, tono: t }, c: { t: ['map: Some(f(a))', 'None.map(f) = None', 'flatMap: f(a), senza riavvolgere', 'filter: if p(a) then this else None', 'default calcolato perché serve', 'default mai calcolato'][i] } }
      })))
    };

    SCENE.either = {
      w: 580, h: 220, lato: true,
      legenda: '{{j|s016|'}}',
      oggetti: [R('a', 20, 40, 170, 40, 'mean(Nil)', { tono: 'dato' }), R('ao', 250, 40, 150, 40, 'None', { tono: 'spento' }), T('aq', 490, 60, 'cosa è andato storto?', { size: 12 }),
        R('b', 20, 120, 170, 40, 'mean(List(1, 2, 3))', { tono: 'dato' }), R('bo', 250, 120, 150, 40, 'Some(2.0)', { tono: 'ok' }), T('c', 290, 200, '', { size: 12 }), F('f1', 192, 60, 246, 60, ''), F('f2', 192, 140, 246, 140, '')],
      passi: [
        { nota: "Con Option, <b>None</b> dice che qualcosa è andato storto, ma non <b>cosa</b>." },
        { nota: "<code>Either[E, A]</code>: <b>Left(value: E)</b> porta l'errore, con l'informazione; <b>Right(value: A)</b> il risultato corretto (\"right\" = giusto). Come un'eccezione, ma è un valore.", set: { ao: { t: 'Left("lista vuota")', tono: 'no' }, aq: { t: 'il messaggio c’è' }, bo: { t: 'Right(2.0)' } } },
        { nota: "Si usa come Option: map e flatMap lavorano sul Right e lasciano passare il Left così com'è. La catena si ferma al primo errore, e l'errore arriva in fondo con il suo messaggio.", set: { c: { t: 'Left = fallimento con diagnosi · Right = successo' } } }
      ]
    };

    SCENE.erroriopt = {
      w: 580, h: 200, lato: true,
      legenda: '{{j|s017|'}}',
      oggetti: [R('g1', 20, 30, 280, 32, 'case Some(a) if p(a) => this', { tono: 'due' }), R('g2', 20, 70, 280, 32, 'case Some(a) if !p(a) => None', { tono: 'due' }), R('g3', 20, 110, 280, 32, 'case None => None', { tono: 'ok' }), T('m', 440, 70, '', { size: 12, bold: true }), T('c', 290, 180, '', { size: 12 })],
      passi: [
        { nota: "filter con due guardie: per noi p(a) e !p(a) coprono tutto." },
        { nota: "Per il compilatore le guardie sono \"forse\": <i>match may not be exhaustive. It would fail on pattern case: Option.Some(_)</i>. Con -Werror non compila.", set: { m: { t: 'not exhaustive', tono: 'no' } } },
        { nota: "Correzione: l'ultimo caso <b>senza guardia</b>, <code>case _ =&gt; None</code>.", set: { g2: { t: 'case _ => None', tono: 'ok' }, g3: { t: '', tono: 'spento' }, m: { t: 'esaustivo', tono: 'ok' }, c: { t: 'guardie = forse: chiudi sempre con un caso senza guardia' } } }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s018|}}</h1>
  <p class="lede">{{s|s019|}}</p>
</header>

<section>
  <h2>{{s|s020|}}</h2>
  <div class="box regola" data-tit="{{a|s021|}}">
    <p>{{s|s022|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s023|}}">
    <div class="passo">
      <div class="espr">def mean(xs: List[Double]): <mark class="dato">Double</mark> = xs match
  case Nil => <mark class="no">throw new ArithmeticException("empty list")</mark>
  case _   => xs.sum / xs.length</div>
      <p class="nota">{{s|s024|}}</p>
    </div>
    <div class="passo">
      <div class="espr">{{s|s025|}}</div>
      <p class="nota">{{s|s026|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def mean(xs: List[Double]): <mark class="ora">Option[Double]</mark> = xs match
  case Nil => <mark class="ok">None</mark>
  case _   => <mark class="ok">Some(xs.sum / xs.length)</mark></div>
      <p class="nota">{{s|s027|}}</p>
    </div>
  </figure>
  <p>{{s|s028|}}</p>
  <figure class="scena" data-scena="parziale" data-titolo="{{a|s029|}}"></figure>
</section>

<section>
  <h2>{{s|s030|}}</h2>
  <pre class="cod" data-lang="scala">enum Option[+A]:
  case Some(get: A)
  case None</pre>
  <p>{{s|s031|}}</p>
  <p>{{s|s032|}}</p>
  <figure class="scena" data-scena="optionadt" data-titolo="{{a|s033|}}"></figure>
</section>

<section>
  <h2>{{s|s034|}}</h2>
  <p>{{s|s035|}}</p>
  <figure class="codice" data-titolo="{{a|s036|}}">
<pre data-lang="scala">enum Option[+A]:
  case Some(get: A)
  case None

  def map[B](f: A => B): Option[B] = this match
    case None => None
    case Some(a) => Some(f(a))

  def flatMap[B](f: A => Option[B]): Option[B] = this match
    case None => None
    case Some(a) => f(a)

  def filter(p: A => Boolean): Option[A] = this match
    case Some(a) => if p(a) then this else None
    case _ => None

  def getOrElse[B >: A](default: => B): B = this match
    case None => default
    case Some(a) => a</pre>
    <ol class="spiega">
      <li data-righe="5" data-segna="this match@dato"><p>{{s|s037|}}</p></li>
      <li data-righe="5-7" data-segna="f: A => B@ora|Some(f(a))@ok"><p>{{s|s038|}}</p></li>
      <li data-righe="6,10" data-segna="None => None*@no"><p>{{s|s039|}}</p></li>
      <li data-righe="9-11" data-segna="f: A => Option[B]@ora|=> f(a)@ok"><p>{{s|s040|}}</p></li>
      <li data-righe="13-15" data-segna="if p(a) then this else None@ok|case _ => None@no"><p>{{s|s041|}}</p></li>
      <li data-righe="17" data-segna="[B &gt;: A]@due|default: => B@dato"><p>{{s|s042|}}</p></li>
      <li data-righe="18-19" data-segna="default@dato|=> a@ok"><p>{{s|s043|}}</p></li>
    </ol>
  </figure>

  <figure class="passi" data-titolo="{{a|s044|}}">
    <div class="passo">
      <div class="espr">def map[B](f: A => <mark class="dato">B</mark>): Option[B]
  case Some(a) => ???</div>
      <p class="nota">{{s|s045|}}</p>
    </div>
    <div class="passo">
      <div class="espr">  case Some(a) => <mark class="ok">Some(</mark>f(a)<mark class="ok">)</mark></div>
      <p class="nota">{{s|s046|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def flatMap[B](f: A => <mark class="due">Option[B]</mark>): Option[B]
  case Some(a) => f(a)</div>
      <p class="nota">{{s|s047|}}</p>
    </div>
    <div class="passo">
      <div class="espr">  case Some(a) => <mark class="no">Some(f(a))</mark>     <span class="mano">// Option[Option[B]]</span>
Found:    Option[B]
Required: B</div>
      <p class="nota">{{s|s048|}}</p>
    </div>
  </figure>

  <figure class="passi" data-titolo="{{a|s049|}}">
    <div class="passo">
      <div class="espr">val o: Option[Int] = None
o.getOrElse { println("valutato!"); 42 }</div>
      <p class="nota">{{s|s050|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ora">valutato!</mark>
<mark class="ok">42</mark></div>
      <p class="nota">{{s|s051|}}</p>
    </div>
    <div class="passo">
      <div class="espr">Some(7).getOrElse { println("valutato!"); 42 }
<mark class="ok">7</mark>          <span class="mano">// niente stampa</span></div>
      <p class="nota">{{s|s052|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="api" data-titolo="{{a|s053|}}"></figure>
</section>

<section>
  <h2>{{s|s054|}}</h2>
  <p>{{s|s055|}}</p>
  <figure class="scena" data-scena="catena" data-titolo="{{a|s056|}}"></figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s057|}}</th><th>{{s|s058|}}</th><th>{{s|s059|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>{{s|s062|}}</td></tr>
      <tr><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td></tr>
      <tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td><td>{{s|s068|}}</td></tr>
      <tr><td>{{s|s069|}}</td><td>—</td><td>{{s|s070|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box idea" data-tit="{{a|s071|}}">
    <p>{{s|s072|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s073|}}</h2>
  <p>{{s|s074|}}</p>
  <pre class="cod" data-lang="scala">enum Either[+E, +A]:
  case Left(value: E)    // errore
  case Right(value: A)   // risultato corretto ("right" = giusto)

def mean(xs: List[Double]): Either[String, Double] =
  if xs.isEmpty then Left("lista vuota")
  else Right(xs.sum / xs.length)</pre>
  <figure class="scena" data-scena="either" data-titolo="{{a|s075|}}"></figure>
</section>

<section>
  <h2>{{s|s076|}}</h2>
  <p>{{s|s077|}}</p>
</section>

<section>
  <h2>{{s|s078|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def filter(p: A => Boolean): Option[A] = this match
  case Some(a) if p(a)  => this
  case Some(a) if !p(a) => None
  case None             => None</pre>
      <pre class="msg">match may not be exhaustive.

It would fail on pattern case: Option.Some(_)</pre>
      <div class="fix">{{s|s079|}}</div>
    </div>
  </div>
  <figure class="scena" data-scena="erroriopt" data-titolo="{{a|s080|}}"></figure>
</section>

</main>
</body>
</html>
