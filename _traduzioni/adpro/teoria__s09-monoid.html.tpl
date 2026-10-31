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
  const N = (id, x, y, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w: 150, h: 56, t }, extra || {});
  const P = (id, x, y, t, extra) => Object.assign({ id, tipo: 'nodo', x, y, r: 21, t }, extra || {});
  const A = (id, da, a, extra) => Object.assign({ id, tipo: 'arco', da, a, dir: true, t: '' }, extra || {});
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13, bold: true, anchor: 'start' }, extra || {});

  SCENE.def = {
    w: 540, h: 180, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      N('A', 40, 40, 'A = Int'),
      N('op', 195, 40, '⊕ = +'),
      N('zero', 350, 40, '0 = zero'),
      T('ex', 40, 150, '', { size: 14 })
    ],
    passi: [
      { nota: `{{j|s003|`}}`, set: { A: { tono: 'ora' } } },
      { nota: `{{j|s004|`}}`, set: { A: { tono: null }, op: { tono: 'ora' } } },
      { nota: `{{j|s005|`}}`, set: { op: { tono: null }, zero: { tono: 'ora' } } },
      { nota: `{{j|s006|`}}`, set: { zero: { tono: null }, ex: { t: '2 ⊕ 3 = 5 · 5 ⊕ 0 = 5', tono: 'ok' } } },
      { nota: `{{j|s007|`}}`, set: { ex: { t: '2 ⊕ 3 = 6 · 6 ⊕ 1 = 6', tono: 'ok' }, op: { t: '⊕ = *', tono: 'ora' }, zero: { t: '1', tono: 'ora' } } }
    ]
  };

  SCENE.assoc = {
    w: 540, h: 290, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [
      P('l1', 60, 200, '1', { tono: null }), P('l2', 180, 200, '2'), P('l3', 300, 200, '3'), P('l4', 420, 200, '4'),
      P('p12', 120, 120, '3', { nascosto: true }), P('p34', 360, 120, '7', { nascosto: true }),
      P('root', 240, 40, '10', { nascosto: true }),
      A('a1', 'l1', 'p12', { nascosto: true }), A('a2', 'l2', 'p12', { nascosto: true }),
      A('a3', 'l3', 'p34', { nascosto: true }), A('a4', 'l4', 'p34', { nascosto: true }),
      A('a5', 'p12', 'root', { nascosto: true }), A('a6', 'p34', 'root', { nascosto: true }),
      T('alt', 40, 262, '', { size: 14 })
    ],
    passi: [
      { nota: `{{j|s009|`}}`, set: { l1: { tono: 'dato' }, l2: { tono: 'dato' }, l3: { tono: 'dato' }, l4: { tono: 'dato' } } },
      { nota: `{{j|s010|`}}`, set: { l1: { tono: 'ora' }, l2: { tono: 'ora' }, a1: { nascosto: false }, a2: { nascosto: false }, p12: { nascosto: false, tono: 'ok' } } },
      { nota: `{{j|s011|`}}`, set: { l1: { tono: 'dato' }, l2: { tono: 'dato' }, l3: { tono: 'ora' }, l4: { tono: 'ora' }, a3: { nascosto: false }, a4: { nascosto: false }, p34: { nascosto: false, tono: 'ok' } } },
      { nota: `{{j|s012|`}}`, set: { l3: { tono: 'dato' }, l4: { tono: 'dato' }, p12: { tono: 'spento' }, p34: { tono: 'spento' }, a5: { nascosto: false }, a6: { nascosto: false }, root: { nascosto: false, tono: 'ok' } } },
      { nota: `{{j|s013|`}}`, set: { root: { tono: 'spento' }, p12: { tono: null }, p34: { tono: null }, alt: { t: '((1 ⊕ 2) ⊕ 3) ⊕ 4 = 10', tono: 'ok' } } }
    ]
  };

  SCENE.tc = {
    w: 540, h: 260, lato: true,
    legenda: '{{j|s014|'}}',
    oggetti: [
      N('trait', 150, 20, 'trait Monoid[A]', { w: 240, h: 50 }),
      N('si', 40, 130, 'stringMonoid', { w: 200, h: 50, tono: 'dato', nascosto: true }),
      N('mi', 300, 130, 'maxMonoid', { w: 200, h: 50, tono: 'dato', nascosto: true }),
      A('ai', 'si', 'trait', { nascosto: true }), A('am', 'mi', 'trait', { nascosto: true }),
      N('cc', 120, 200, 'concatenate(lista, istanza)', { w: 300, h: 44, tono: 'ora', nascosto: true })
    ],
    passi: [
      { nota: `{{j|s015|`}}`, set: { trait: { tono: 'ora' } } },
      { nota: `{{j|s016|`}}`, set: { trait: { tono: null }, si: { nascosto: false }, ai: { nascosto: false } } },
      { nota: `{{j|s017|`}}`, set: { mi: { nascosto: false }, am: { nascosto: false } } },
      { nota: `{{j|s018|`}}`, set: { si: { tono: 'dato' }, mi: { tono: 'dato' }, cc: { nascosto: false } } }
    ]
  };

  SCENE.omo = {
    w: 540, h: 290, lato: true,
    legenda: '{{j|s019|'}}',
    oggetti: [
      T('ml', 40, 22, 'M: stringhe, con concatenazione e ""', { size: 12 }),
      N('x', 40, 50, '"foo"', { w: 120, h: 50, tono: 'dato' }),
      N('y', 190, 50, '"bar"', { w: 120, h: 50, tono: 'dato' }),
      N('xy', 340, 50, '"foobar"', { w: 150, h: 50, tono: 'spento', nascosto: true }),
      T('nl', 40, 150, 'N: interi, con + e 0', { size: 12 }),
      N('fx', 40, 180, '3', { w: 120, h: 50, tono: 'spento', nascosto: true }),
      N('fy', 190, 180, '3', { w: 120, h: 50, tono: 'spento', nascosto: true }),
      N('fxy', 340, 180, '6', { w: 150, h: 50, tono: 'spento', nascosto: true }),
      A('f1', 'x', 'fx', { nascosto: true, t: 'f' }), A('f2', 'y', 'fy', { nascosto: true, t: 'f' }),
      A('f3', 'xy', 'fxy', { nascosto: true, t: 'f' }),
      T('c', 40, 262, '', { size: 14 })
    ],
    passi: [
      { nota: `{{j|s020|`}}`, set: { x: { tono: 'dato' }, y: { tono: 'dato' } } },
      { nota: `{{j|s021|`}}`, set: { f1: { nascosto: false }, f2: { nascosto: false }, fx: { nascosto: false, tono: 'due' }, fy: { nascosto: false, tono: 'due' } } },
      { nota: `{{j|s022|`}}`, set: { xy: { nascosto: false, tono: 'ora' }, f3: { nascosto: false }, c: { t: '"foo" ⊕ "bar" = "foobar"' } } },
      { nota: `{{j|s023|`}}`, set: { fxy: { nascosto: false, tono: 'ok' }, xy: { tono: 'dato' }, fx: { tono: 'dato' }, fy: { tono: 'dato' }, c: { t: 'f(x ⊕ y) = f(x) + f(y): 6 = 3 + 3', tono: 'ok' } } },
      { nota: `{{j|s024|`}}`, set: { f1: { tono: 'spento' }, f2: { tono: 'spento' }, f3: { tono: 'spento' }, c: { t: 'isomorfismo: String ↔ List[Char]', tono: 'ok' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <div class="occhiello">{{s|s025|}}</div>
  <h1>{{s|s026|}}</h1>
  <p class="lede">{{s|s027|}}</p>
</header>

<section>
  <h2>{{s|s028|}}</h2>
  <p>{{s|s029|}}</p>
  <ul>
    <li>{{s|s030|}}</li>
    <li>{{s|s031|}}</li>
  </ul>
  <p>{{s|s032|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s033|}}</th><th>{{s|s034|}}</th><th>{{s|s035|}}</th></tr></thead><tbody>
    <tr><td>{{s|s036|}}</td><td>0</td><td>+</td></tr>
    <tr><td>{{s|s037|}}</td><td>1</td><td>*</td></tr>
    <tr><td>{{s|s038|}}</td><td>""</td><td>{{s|s039|}}</td></tr>
  </tbody></table></div>
  <figure class="scena" data-scena="def" data-titolo="{{a|s040|}}"></figure>
</section>

<section>
  <h2>{{s|s041|}}</h2>
  <p>{{s|s042|}}</p>
  <ul>
    <li>{{s|s043|}}</li>
    <li>{{s|s044|}}</li>
  </ul>
  <p>{{s|s045|}}</p>
  <figure class="scena" data-scena="assoc" data-titolo="{{a|s046|}}"></figure>
  <div class="box attenzione" data-tit="{{a|s047|}}">{{s|s048|}}</div>
</section>

<section>
  <h2>{{s|s049|}}</h2>
  <p>{{s|s050|}}</p>
  <figure class="codice" data-titolo="{{a|s051|}}">
<pre data-lang="scala">trait Monoid[A]:
  def combine(a1: A, a2: A): A
  def empty: A
  object laws:
    def associative(using Arbitrary[A], Equality[A]): Prop = ...</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="trait@due|Monoid[A]@ora"><p>{{s|s052|}}</p></li>
      <li data-righe="2" data-segna="combine@ora"><p>{{s|s053|}}</p></li>
      <li data-righe="3" data-segna="empty@ora"><p>{{s|s054|}}</p></li>
      <li data-righe="4-5" data-segna="object laws@due"><p>{{s|s055|}}</p></li>
      <li data-righe="5" data-segna="using Arbitrary[A]@due"><p>{{s|s056|}}</p></li>
    </ol>
  </figure>
  <h3>{{s|s057|}}</h3>
  <p>{{s|s058|}}</p>
  <figure class="scena" data-scena="tc" data-titolo="{{a|s059|}}"></figure>
  <div class="box regola" data-tit="{{a|s060|}}">{{s|s061|}}</div>
</section>

<section>
  <h2>{{s|s062|}}</h2>
  <p>{{s|s063|}}</p>
  <ul>
    <li>{{s|s064|}}</li>
    <li>{{s|s065|}}</li>
  </ul>
  <p>{{s|s066|}}</p>
  <figure class="scena" data-scena="omo" data-titolo="{{a|s067|}}"></figure>
  <p>{{s|s068|}}</p>
  <ul>
    <li>{{s|s069|}}</li>
    <li>{{s|s070|}}</li>
  </ul>
  <div class="box idea" data-tit="{{a|s071|}}">{{s|s072|}}</div>
</section>

<section>
  <h2>{{s|s073|}}</h2>
  <p>{{s|s074|}}</p>
</section>

</main>
</body>
</html>
