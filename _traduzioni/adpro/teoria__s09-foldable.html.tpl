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
  const N = (id, x, y, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w: 90, h: 50, t }, extra || {});
  const B = (id, x, y, w, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h: 50, t }, extra || {});
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13, bold: true, anchor: 'start' }, extra || {});

  SCENE.fold = {
    w: 540, h: 200, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      N('e1', 40, 30, '1', { tono: 'dato' }), N('e2', 150, 30, '2', { tono: 'dato' }),
      N('e3', 260, 30, '3', { tono: 'dato' }), N('e4', 370, 30, '4', { tono: 'dato' }),
      B('acc', 40, 120, 300, '0 (neutro)', { tono: 'ora' }),
      T('c', 40, 190, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s003|`}}`, set: {} },
      { nota: `{{j|s004|`}}`, set: { e1: { tono: 'ora' }, acc: { t: '0 + 1 = 1', tono: 'ok' } } },
      { nota: `{{j|s005|`}}`, set: { e1: { tono: 'dato' }, e2: { tono: 'ora' }, acc: { t: '1 + 2 = 3', tono: 'ok' } } },
      { nota: `{{j|s006|`}}`, set: { e2: { tono: 'dato' }, e3: { tono: 'ora' }, acc: { t: '3 + 3 = 6', tono: 'ok' } } },
      { nota: `{{j|s007|`}}`, set: { e3: { tono: 'dato' }, e4: { tono: 'ora' }, acc: { t: '6 + 4 = 10', tono: 'ok' }, c: { t: 'risultato: 10' } } }
    ]
  };

  SCENE.mr = {
    w: 540, h: 290, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [
      N('e1', 40, 20, '1', { tono: 'dato' }), N('e2', 150, 20, '2', { tono: 'dato' }),
      N('e3', 260, 20, '3', { tono: 'dato' }), N('e4', 370, 20, '4', { tono: 'dato' }),
      B('c1', 60, 130, 180, '1 ⊕ 4 = 5', { nascosto: true, tono: 'ok' }),
      B('c2', 300, 130, 180, '9 ⊕ 16 = 25', { nascosto: true, tono: 'ok' }),
      B('fin', 180, 220, 180, '5 ⊕ 25 = 30', { nascosto: true, tono: 'ok' })
    ],
    passi: [
      { nota: `{{j|s009|`}}`, set: {} },
      { nota: `{{j|s010|`}}`, set: { e1: { t: '1', tono: 'ora' }, e2: { t: '4', tono: 'ora' }, e3: { t: '9', tono: 'ora' }, e4: { t: '16', tono: 'ora' } } },
      { nota: `{{j|s011|`}}`, set: { e1: { tono: 'dato' }, e2: { tono: 'dato' }, e3: { tono: 'dato' }, e4: { tono: 'dato' }, c1: { nascosto: false }, c2: { nascosto: false } } },
      { nota: `{{j|s012|`}}`, set: { c1: { tono: 'ok' }, c2: { tono: 'ok' }, fin: { nascosto: false, tono: 'ok' } } }
    ]
  };

  SCENE.par = {
    w: 540, h: 300, lato: true,
    legenda: '{{j|s013|'}}',
    oggetti: [
      B('L1', 40, 30, 240, '1 2 3', { tono: 'dato' }),
      B('L2', 300, 30, 200, '4 5 6', { tono: 'dato' }),
      B('wA', 40, 120, 240, 'worker A: 1 ⊕ 2 ⊕ 3 = 6', { nascosto: true, tono: 'ora' }),
      B('wB', 300, 120, 200, 'worker B: 4 ⊕ 5 ⊕ 6 = 15', { nascosto: true, tono: 'ora' }),
      B('fin', 170, 210, 200, '6 ⊕ 15 = 21', { nascosto: true, tono: 'ok' }),
      T('c', 40, 268, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s014|`}}`, set: {} },
      { nota: `{{j|s015|`}}`, set: { wA: { nascosto: false }, wB: { nascosto: false } } },
      { nota: `{{j|s016|`}}`, set: { wA: { tono: 'ok' }, wB: { tono: 'ok' } } },
      { nota: `{{j|s017|`}}`, set: { fin: { nascosto: false, tono: 'ok' }, c: { t: 'sequenziale o in parallelo: 21' } } }
    ]
  };

  SCENE.hk = {
    w: 540, h: 260, lato: true,
    legenda: '{{j|s018|'}}',
    oggetti: [
      B('lst', 40, 20, 380, 'List[A]: a, a, a', { tono: null }),
      B('opt', 40, 80, 380, 'Option[A]: Some(a) o None', { tono: null }),
      B('tre', 40, 140, 380, 'Tree[A]: foglie e rami', { tono: null }),
      T('c', 40, 215, '', { size: 14 }),
      T('d', 40, 245, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s019|`}}`, set: {} },
      { nota: `{{j|s020|`}}`, set: { lst: { tono: 'ora' }, c: { t: 'F = List: tanti valori di tipo A' } } },
      { nota: `{{j|s021|`}}`, set: { lst: { tono: null }, opt: { tono: 'ora' }, c: { t: 'F = Option: al più un valore di tipo A' } } },
      { nota: `{{j|s022|`}}`, set: { opt: { tono: null }, tre: { tono: 'ora' }, c: { t: 'F = Tree: il fold visita tutte le foglie' } } },
      { nota: `{{j|s023|`}}`, set: { lst: { tono: 'ok' }, opt: { tono: 'ok' }, tre: { tono: 'ok' }, c: { t: 'un’unica interfaccia per List, Option, Tree…', tono: 'ok' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <div class="occhiello">{{s|s024|}}</div>
  <h1>{{s|s025|}}</h1>
  <p class="lede">{{s|s026|}}</p>
</header>

<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
  <ul>
    <li>{{s|s029|}}</li>
    <li>{{s|s030|}}</li>
  </ul>
  <p>{{s|s031|}}</p>
  <figure class="scena" data-scena="fold" data-titolo="{{a|s032|}}"></figure>
</section>

<section>
  <h2>{{s|s033|}}</h2>
  <p>{{s|s034|}}</p>
  <ul>
    <li>{{s|s035|}}</li>
    <li>{{s|s036|}}</li>
    <li>{{s|s037|}}</li>
  </ul>
  <p>{{s|s038|}}</p>
  <figure class="scena" data-scena="mr" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <p>{{s|s041|}}</p>
  <p>{{s|s042|}}</p>
  <figure class="scena" data-scena="hk" data-titolo="{{a|s043|}}"></figure>
</section>

<section>
  <h2>{{s|s044|}}</h2>
  <p>{{s|s045|}}</p>
  <p>{{s|s046|}}</p>
  <figure class="scena" data-scena="par" data-titolo="{{a|s047|}}"></figure>
  <div class="box attenzione" data-tit="{{a|s048|}}">{{s|s049|}}</div>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <p>{{s|s051|}}</p>
</section>

</main>
</body>
</html>
