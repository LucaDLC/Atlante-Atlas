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
SCENE.accumula = {
  w: 560, h: 240, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'g0', tipo: 'nodo', forma: 'quadrato', r: 36, x: 90, y: 70, t: 'g0: id' },
    { id: 'g1', tipo: 'nodo', forma: 'quadrato', r: 36, x: 270, y: 70, t: 'g1: +1', nascosto: true },
    { id: 'g2', tipo: 'nodo', forma: 'quadrato', r: 36, x: 450, y: 70, t: 'g2: ×10', nascosto: true },
    { id: 'e1', tipo: 'arco', da: 'g1', a: 'g0', dir: true, t: 'poi', nascosto: true },
    { id: 'e2', tipo: 'arco', da: 'g2', a: 'g1', dir: true, t: 'poi', nascosto: true },
    { id: 'n', tipo: 'testo', x: 280, y: 190, t: '', size: 15, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}', set: { g0: { tono: 'dato' } } },
    { nota: '{{j|s004|'}}', set: { g1: { nascosto: false, tono: 'dato' }, e1: { nascosto: false } } },
    { nota: '{{j|s005|'}}', set: { g2: { nascosto: false, tono: 'dato' }, e2: { nascosto: false } } },
    { nota: '{{j|s006|'}}', set: { g2: { tono: 'ora', sotto: '2 → 20' }, n: { t: 'g2(2) = g1(20)', tono: 'ora' } } },
    { nota: '{{j|s007|'}}', set: { g2: { tono: 'dato' }, g1: { tono: 'ora', sotto: '20 → 21' }, e2: { tono: 'ora' }, n: { t: 'g1(20) = g0(21)' } } },
    { nota: '{{j|s008|'}}', set: { g1: { tono: 'dato' }, g0: { tono: 'ok', sotto: '21 → 21' }, e1: { tono: 'ora' }, n: { t: 'g2(2) = 21', tono: 'ok' } } }
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

    SCENE.foldr1 = {
      w: 560, h: 150,
      codice: { lang: 'scala', testo: `def foldRight1[A, B](l: List[A], z: B, f: (A, B) => B): B =
  foldLeft(reverse(l), z, (b, a) => f(a, b))` },
      legenda: '{{j|s009|'}}',
      oggetti: [C('l', 20, 40, ['1', '2', '3']), R('acc', 280, 40, 200, 40, 'acc = 0', { tono: 'dato' }), T('c', 280, 116, 'foldRight1(List(1, 2, 3), 0, _ - _)', { size: 12, bold: true })],
      passi: [
        { nota: "foldRight parte dall'ultimo, foldLeft dal primo. Se <b>inverto</b> la lista, il primo della lista invertita è l'ultimo dell'originale. f = (a, b) =&gt; a − b.", righe: [2] },
        { nota: "reverse(List(1, 2, 3)) = List(3, 2, 1).", righe: [2], set: { l: { valori: ['3', '2', '1'] } } },
        { nota: "foldLeft chiama la sua funzione con (accumulatore, elemento); f vuole (elemento, risultato). La lambda <code>(b, a) =&gt; f(a, b)</code> scambia. Primo: f(3, 0) = 3 − 0 = 3.", righe: [2], set: { l: { toni: { 0: 'ora' } }, acc: { t: 'acc = f(3, 0) = 3' } } },
        { nota: "f(2, 3) = 2 − 3 = −1.", righe: [2], set: { l: { toni: { 0: 'spento', 1: 'ora' } }, acc: { t: 'acc = f(2, 3) = -1' } } },
        { nota: "f(1, −1) = 1 − (−1) = 2. Uguale a foldRight: 1 − (2 − (3 − 0)) = 2. Vantaggio: è in coda. Svantaggio: attraversa la lista due volte.", righe: [2], set: { l: { toni: { 0: 'spento', 1: 'spento', 2: 'ora' } }, acc: { t: 'f(1, -1) = 2', tono: 'ok' } } }
      ]
    };

    const g = (id, y, t) => R(id, 60, y, 460, 34, t, { tono: 'due', nascosto: true });
    SCENE.costruisciesegui = {
      w: 580, h: 240, lato: true,
      legenda: '{{j|s010|'}}',
      oggetti: [T('h', 290, 22, 'foldLeft1(List(1, 2, 3), 0, _ - _)', { bold: true, size: 13 }), g('g3', 40, 'g3 = b => b - 3'), g('g2', 84, 'g2 = b => g3(b - 2)'), g('g1', 128, 'g1 = b => g2(b - 1)'), T('e', 290, 200, '', { bold: true, size: 14 })],
      passi: [
        { nota: "foldRight con risultato di tipo <b>B =&gt; B</b>: invece di un numero costruisce una funzione. Si parte dall'identità (per la lista vuota foldLeft deve dare z). step = (a, g) =&gt; b =&gt; g(f(b, a))." },
        { nota: "foldRight parte dall'ultimo: 3. step(3, id) = <code>b =&gt; id(b − 3)</code> = \"togli 3\". Nessun numero calcolato.", set: { g3: { nascosto: false } } },
        { nota: "Elemento 2: \"togli 2, poi fai g3\".", set: { g2: { nascosto: false, t: 'g2 = b => (b - 2) - 3' } } },
        { nota: "Elemento 1: \"togli 1, poi fai g2\". foldRight restituisce questa funzione.", set: { g1: { nascosto: false, t: 'g1 = b => ((b - 1) - 2) - 3' } } },
        { nota: "Il <code>(z)</code> finale la esegue con z = 0: ((0 − 1) − 2) − 3 = <b>−6</b>. Parentesi a sinistra, come foldLeft: costruita da destra, eseguita da sinistra.", set: { g1: { tono: 'ok' }, e: { t: 'g1(0) = ((0 - 1) - 2) - 3 = -6', tono: 'ok' } } }
      ]
    };

    SCENE.bloccofinale = {
      w: 560, h: 150,
      codice: { lang: 'scala', testo: `def foldLeft1[A, B](l: List[A], z: B, f: (B, A) => B): B =
  def aiuto(x: B): B = f(x, ???)
  // manca l'espressione finale` },
      legenda: '{{j|s011|'}}',
      oggetti: [T('m', 280, 40, '', { size: 12, bold: true }), T('m2', 280, 70, '', { size: 12 }), T('c', 280, 116, '', { size: 12 })],
      passi: [
        { nota: "Il corpo di foldLeft1 è un <b>blocco</b>. Il valore di un blocco è quello della sua <b>ultima espressione</b>.", righe: [1] },
        { nota: "Qui il blocco finisce con un <code>def</code>: una definizione non ha valore, quindi il blocco vale Unit.", righe: [2], set: { m: { t: 'Found: Unit   Required: B', tono: 'no' }, m2: { t: 'Maybe the enclosing block is missing a final expression…' } } },
        { nota: "Soluzione: dopo le definizioni interne serve un'espressione finale che le usi, allineata con il def (non dentro). Spesso è solo un problema di indentazione.", righe: [3], set: { c: { t: 'ultima riga del blocco = il risultato: foldRight(…)(z)', tono: 'ok' } } }
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
  <figure class="codice" data-titolo="{{a|s016|}}">
<pre data-lang="scala">def foldRight1[A, B](l: List[A], z: B, f: (A, B) => B): B =
  foldLeft(reverse(l), z, (b, a) => f(a, b))</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="f: (A, B) => B@ora"><p>{{s|s017|}}</p></li>
      <li data-righe="2" data-segna="reverse(l)@dato"><p>{{s|s018|}}</p></li>
      <li data-righe="2" data-segna="(b, a) =>@due"><p>{{s|s019|}}</p></li>
      <li data-righe="2" data-segna="f(a, b)@ok"><p>{{s|s020|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s021|}}">
    <div class="passo"><div class="espr">reverse(List(1, 2, 3)) = List(<mark class="dato">3</mark>, 2, 1)</div><p class="nota">{{s|s022|}}</p></div>
    <div class="passo"><div class="espr">acc = f(<mark class="dato">3</mark>, <mark class="due">0</mark>) = 3 - 0 = <mark class="ora">3</mark></div><p class="nota">{{s|s023|}}</p></div>
    <div class="passo"><div class="espr">acc = f(<mark class="dato">2</mark>, <mark class="due">3</mark>) = 2 - 3 = <mark class="ora">-1</mark></div><p class="nota">{{s|s024|}}</p></div>
    <div class="passo"><div class="espr">acc = f(<mark class="dato">1</mark>, <mark class="due">-1</mark>) = 1 - (-1) = <mark class="ok">2</mark></div><p class="nota">{{s|s025|}}</p></div>
  </figure>
  <p>{{s|s026|}}</p>
  <figure class="scena" data-scena="foldr1" data-titolo="{{a|s027|}}"></figure>
</section>

<section>
  <h2>{{s|s028|}}</h2>
  <p>{{s|s029|}}</p>
  <figure class="passi" data-titolo="{{a|s030|}}">
    <div class="passo">
      <div class="espr">val g0 = <mark class="dato">(b: Int) => b</mark></div>
      <p class="nota">{{s|s031|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val g1 = (b: Int) => g0(<mark class="ora">b + 1</mark>)</div>
      <p class="nota">{{s|s032|}}</p>
    </div>
    <div class="passo">
      <div class="espr">val g2 = (b: Int) => g1(<mark class="due">b * 10</mark>)</div>
      <p class="nota">{{s|s033|}}</p>
    </div>
    <div class="passo">
      <div class="espr">g2(<mark class="dato">2</mark>)  =  g1(<mark class="due">2 * 10</mark>)  =  g0(<mark class="ora">20 + 1</mark>)  =  <mark class="ok">21</mark></div>
      <p class="nota">{{s|s034|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="accumula" data-titolo="{{a|s035|}}"></figure>
  <div class="box idea" data-tit="{{a|s036|}}">
    <p>{{s|s037|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s038|}}</h2>
  <figure class="codice" data-titolo="{{a|s039|}}">
<pre data-lang="scala">def foldLeft1[A, B](l: List[A], z: B, f: (B, A) => B): B =
  foldRight[A, B => B](l, (b: B) => b, (a, g) => (b: B) => g(f(b, a)))(z)</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="[A, B => B]@due"><p>{{s|s040|}}</p></li>
      <li data-righe="2" data-segna="(b: B) => b@dato"><p>{{s|s041|}}</p></li>
      <li data-righe="2" data-segna="(a, g) =>@ora"><p>{{s|s042|}}</p></li>
      <li data-righe="2" data-segna="(b: B) => g(f(b, a))@ok"><p>{{s|s043|}}</p></li>
      <li data-righe="2" data-segna="(z)@dato"><p>{{s|s044|}}</p></li>
    </ol>
  </figure>

  <figure class="passi" data-titolo="{{a|s045|}}" data-legenda="{{a|s046|}}">
    <div class="passo">
      <div class="espr">step(1, step(2, step(3, <mark class="dato">id</mark>)))</div>
      <p class="nota">{{s|s047|}}</p>
    </div>
    <div class="passo">
      <div class="espr">step(<mark class="ora">3</mark>, <mark class="dato">id</mark>)  =  b => <mark class="dato">id</mark>(b - <mark class="ora">3</mark>)  =  <mark class="due">b => b - 3</mark></div>
      <p class="nota">{{s|s048|}}</p>
    </div>
    <div class="passo">
      <div class="espr">step(<mark class="ora">2</mark>, <mark class="due">g3</mark>)  =  b => <mark class="due">g3</mark>(b - <mark class="ora">2</mark>)  =  <mark class="due">b => (b - 2) - 3</mark></div>
      <p class="nota">{{s|s049|}}</p>
    </div>
    <div class="passo">
      <div class="espr">step(<mark class="ora">1</mark>, <mark class="due">g2</mark>)  =  b => <mark class="due">g2</mark>(b - <mark class="ora">1</mark>)  =  <mark class="due">b => ((b - 1) - 2) - 3</mark></div>
      <p class="nota">{{s|s050|}}</p>
    </div>
    <div class="passo">
      <div class="espr">(b => ((b - 1) - 2) - 3)(<mark class="dato">0</mark>)</div>
      <p class="nota">{{s|s051|}}</p>
    </div>
    <div class="passo">
      <div class="espr">((<mark class="ora">0 - 1</mark>) - 2) - 3  =  (-1 - 2) - 3  =  -3 - 3  =  <mark class="ok">-6</mark></div>
      <p class="nota">{{s|s052|}}</p>
    </div>
  </figure>

  <div class="box attenzione" data-tit="{{a|s053|}}">
    <p>{{s|s054|}}</p>
  </div>
  <figure class="scena" data-scena="costruisciesegui" data-titolo="{{a|s055|}}"></figure>
</section>

<section>
  <h2>{{s|s056|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">def foldLeft1[A, B](l: List[A], z: B, f: (B, A) => B): B =
  def aiuto(x: B): B = f(x, ???)</pre>
      <pre class="msg">Found:    Unit
Required: B

Maybe the enclosing block is missing a final expression after the definition of `aiuto`?</pre>
      <div class="fix">{{s|s057|}}</div>
    </div>
  </div>
  <figure class="scena" data-scena="bloccofinale" data-titolo="{{a|s058|}}"></figure>
</section>

</main>
</body>
</html>
