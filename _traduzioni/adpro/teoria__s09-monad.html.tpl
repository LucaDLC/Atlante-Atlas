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
  const B = (id, x, y, w, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h: 44, t }, extra || {});
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13, bold: true, anchor: 'start' }, extra || {});

  SCENE.bind = {
    w: 540, h: 250, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      B('v0', 40, 40, 110, 'Some(3)', { tono: 'ora' }),
      B('v1', 200, 40, 110, 'Some(6)', { nascosto: true }),
      B('v2', 360, 40, 110, 'Some(3)', { nascosto: true }),
      T('a1', 160, 70, '→', { size: 16 }),
      T('a2', 320, 70, '→', { size: 16 }),
      B('w0', 40, 150, 110, 'Some(-3)', { nascosto: true }),
      B('w1', 200, 150, 110, 'None', { nascosto: true, tono: 'no' }),
      B('w2', 360, 150, 110, 'None', { nascosto: true, tono: 'spento' }),
      T('c', 40, 230, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s003|`}}`, set: {} },
      { nota: `{{j|s004|`}}`, set: { v0: { tono: null }, v1: { nascosto: false, tono: 'ok' } } },
      { nota: `{{j|s005|`}}`, set: { v1: { tono: null }, v2: { nascosto: false, tono: 'ok' }, c: { t: 'Some(3).flatMap(raddoppia).flatMap(dimezza) = Some(3)' } } },
      { nota: `{{j|s006|`}}`, set: { v0: { t: 'Some(-3)', tono: 'spento' }, v1: { nascosto: true }, v2: { nascosto: true }, w0: { nascosto: false, tono: 'dato' }, w1: { nascosto: false, tono: 'no' }, c: { t: 'il passo dimezza viene saltato' } } },
      { nota: `{{j|s007|`}}`, set: { w2: { nascosto: false, tono: 'spento' }, c: { t: 'il fallimento si propaga da solo', tono: 'ok' } } }
    ]
  };

  SCENE.leggi = {
    w: 540, h: 270, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [
      B('l1', 40, 30, 230, 'unit(7).flatMap(f)', { tono: 'dato' }),
      B('l2', 290, 30, 200, 'f(7)', { tono: 'dato' }),
      B('r1', 40, 110, 230, 'List(1, 2, 3).flatMap(unit)', { nascosto: true }),
      B('r2', 290, 110, 200, 'List(1, 2, 3)', { nascosto: true }),
      B('a1', 40, 190, 230, 'x.flatMap(f).flatMap(g)', { nascosto: true }),
      B('a2', 290, 190, 200, 'x.flatMap(a => f(a).flatMap(g))', { nascosto: true }),
      T('c', 40, 255, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s009|`}}`, set: { l1: { tono: 'ora' }, l2: { tono: 'ok' }, c: { t: 'unit(y).flatMap(f) = f(y)' } } },
      { nota: `{{j|s010|`}}`, set: { l1: { tono: 'dato' }, l2: { tono: 'dato' }, r1: { nascosto: false, tono: 'ora' }, r2: { nascosto: false, tono: 'ok' }, c: { t: 'x.flatMap(unit) = x' } } },
      { nota: `{{j|s011|`}}`, set: { r1: { tono: 'dato' }, r2: { tono: 'dato' }, a1: { nascosto: false, tono: 'ora' }, a2: { nascosto: false, tono: 'ok' }, c: { t: 'due modi di concatenare: stesso risultato', tono: 'ok' } } }
    ]
  };

  SCENE.seq = {
    w: 540, h: 270, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      B('L1', 40, 30, 200, 'List(1, 2)', { tono: 'dato' }),
      B('L2', 290, 30, 200, 'List(3, 4)', { tono: 'dato' }),
      B('o1', 40, 130, 110, 'List(1, 3)', { nascosto: true, tono: 'ok' }),
      B('o2', 170, 130, 110, 'List(1, 4)', { nascosto: true, tono: 'ok' }),
      B('o3', 300, 130, 110, 'List(2, 3)', { nascosto: true, tono: 'ok' }),
      B('o4', 430, 130, 80, 'List(2, 4)', { nascosto: true, tono: 'ok' }),
      T('c', 40, 215, '', { size: 12 }),
      T('d', 40, 245, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s013|`}}`, set: {} },
      { nota: `{{j|s014|`}}`, set: { L1: { tono: 'ora' }, L2: { tono: 'ora' }, o1: { nascosto: false, tono: 'ok' } } },
      { nota: `{{j|s015|`}}`, set: { L1: { tono: 'dato' }, L2: { tono: 'dato' }, o2: { nascosto: false }, o3: { nascosto: false }, o4: { nascosto: false }, c: { t: 'sequence(List(List(1, 2), List(3, 4))) =' }, d: { t: 'List(List(1,3), List(1,4), List(2,3), List(2,4))' } } },
      { nota: `{{j|s016|`}}`, set: { c: { t: 'con Option: un None fa perdere tutto' }, d: { t: 'il tipo passa da List[F[A]] a F[List[A]]', tono: 'ok' } } }
    ]
  };

  SCENE.repl = {
    w: 540, h: 270, lato: true,
    legenda: '{{j|s017|'}}',
    oggetti: [
      B('in', 40, 25, 200, 'List(0, 1), n = 2', { tono: 'dato' }),
      B('p0', 40, 110, 100, 'primo: 0', { nascosto: true, tono: 'ora' }),
      B('p1', 180, 110, 100, 'primo: 1', { nascosto: true, tono: 'ora' }),
      B('r00', 40, 190, 100, 'List(0, 0)', { nascosto: true, tono: 'ok' }),
      B('r01', 150, 190, 100, 'List(0, 1)', { nascosto: true, tono: 'ok' }),
      B('r10', 270, 190, 100, 'List(1, 0)', { nascosto: true, tono: 'ok' }),
      B('r11', 380, 190, 100, 'List(1, 1)', { nascosto: true, tono: 'ok' }),
      T('c', 40, 255, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s018|`}}`, set: {} },
      { nota: `{{j|s019|`}}`, set: { p0: { nascosto: false }, p1: { nascosto: false }, c: { t: 'ogni passo: due scelte' } } },
      { nota: `{{j|s020|`}}`, set: { p0: { tono: 'dato' }, p1: { tono: 'dato' }, r00: { nascosto: false }, r01: { nascosto: false }, r10: { nascosto: false }, r11: { nascosto: false }, c: { t: 'replicateM(2, List(0, 1)) = 4 liste' } } },
      { nota: `{{j|s021|`}}`, set: { c: { t: 'replicateM si comporta in modo diverso per ogni monad', tono: 'ok' } } }
    ]
  };

  SCENE.kl = {
    w: 540, h: 230, lato: true,
    legenda: '{{j|s022|'}}',
    oggetti: [
      B('a', 40, 60, 100, 'a: A', { tono: 'dato' }),
      B('fa', 190, 60, 150, 'f(a): F[B]', { tono: 'ora', nascosto: true }),
      B('gb', 390, 60, 120, 'g(b): F[C]', { tono: 'dato', nascosto: true }),
      B('res', 190, 150, 200, 'compose(f, g)(a): F[C]', { tono: 'ok', nascosto: true }),
      T('c', 40, 215, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s023|`}}`, set: {} },
      { nota: `{{j|s024|`}}`, set: { fa: { nascosto: false } } },
      { nota: `{{j|s025|`}}`, set: { gb: { nascosto: false }, res: { nascosto: false }, c: { t: 'compose(f, g)(a) = f(a).flatMap(g)' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <div class="occhiello">{{s|s026|}}</div>
  <h1>{{s|s027|}}</h1>
  <p class="lede">{{s|s028|}}</p>
</header>

<section>
  <h2>{{s|s029|}}</h2>
  <p>{{s|s030|}}</p>
  <p>{{s|s031|}}</p>
  <ul>
    <li>{{s|s032|}}</li>
    <li>{{s|s033|}}</li>
  </ul>
  <p>{{s|s034|}}</p>
  <figure class="scena" data-scena="bind" data-titolo="{{a|s035|}}"></figure>
  <div class="box idea" data-tit="{{a|s036|}}">{{s|s037|}}</div>
</section>

<section>
  <h2>{{s|s038|}}</h2>
  <p>{{s|s039|}}</p>
  <ul>
    <li>{{s|s040|}}</li>
    <li>{{s|s041|}}</li>
    <li>{{s|s042|}}</li>
  </ul>
  <p>{{s|s043|}}</p>
  <figure class="scena" data-scena="leggi" data-titolo="{{a|s044|}}"></figure>
</section>

<section>
  <h2>{{s|s045|}}</h2>
  <p>{{s|s046|}}</p>
  <p>{{s|s047|}}</p>
  <figure class="scena" data-scena="seq" data-titolo="{{a|s048|}}"></figure>
</section>

<section>
  <h2>{{s|s049|}}</h2>
  <p>{{s|s050|}}</p>
  <figure class="scena" data-scena="repl" data-titolo="{{a|s051|}}"></figure>
  <p>{{s|s052|}}</p>
  <figure class="scena" data-scena="kl" data-titolo="{{a|s053|}}"></figure>
</section>

<section>
  <h2>{{s|s054|}}</h2>
  <p>{{s|s055|}}</p>
  <div class="box esame" data-tit="{{a|s056|}}">{{s|s057|}}</div>
</section>

</main>
</body>
</html>
