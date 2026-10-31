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

  SCENE.map = {
    w: 540, h: 270, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      B('l1', 40, 30, 60, '1', { tono: null }), B('l2', 120, 30, 60, '2'), B('l3', 200, 30, 60, '3'),
      B('r1', 40, 110, 60, '2', { nascosto: true }), B('r2', 120, 110, 60, '4', { nascosto: true }), B('r3', 200, 110, 60, '6', { nascosto: true }),
      B('po', 40, 180, 120, 'Some(3)', { nascosto: false }),
      B('pr', 240, 180, 120, 'Some(6)', { nascosto: true }),
      B('pn', 400, 180, 110, 'None', { nascosto: false }),
      T('c', 40, 255, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s003|`}}`, set: { l1: { tono: 'dato' }, l2: { tono: 'dato' }, l3: { tono: 'dato' } } },
      { nota: `{{j|s004|`}}`, set: { l1: { tono: null }, l2: { tono: null }, l3: { tono: null }, r1: { nascosto: false, tono: 'ok' }, r2: { nascosto: false, tono: 'ok' }, r3: { nascosto: false, tono: 'ok' }, c: { t: 'List(1, 2, 3).map(f) = List(2, 4, 6)' } } },
      { nota: `{{j|s005|`}}`, set: { po: { tono: 'dato' }, pr: { nascosto: false, tono: 'ok' }, c: { t: 'Some(3).map(f) = Some(6)' } } },
      { nota: `{{j|s006|`}}`, set: { po: { tono: null }, pn: { tono: 'no' }, c: { t: 'None.map(f) = None' } } }
    ]
  };

  SCENE.legge = {
    w: 540, h: 250, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [
      B('fa', 40, 30, 240, 'fa = List(1, 2, 3)', { tono: 'dato' }),
      B('res', 40, 100, 240, 'fa.map(identity) = List(1, 2, 3)', { nascosto: true }),
      B('f1', 40, 170, 240, 'fa.map(x + 1).map(x * 2)', { nascosto: true }),
      B('f2', 290, 170, 230, 'fa.map(x => (x + 1) * 2)', { nascosto: true }),
      T('c', 40, 240, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s008|`}}`, set: { fa: { tono: 'dato' } } },
      { nota: `{{j|s009|`}}`, set: { res: { nascosto: false, tono: 'ok' }, c: { t: 'uguali: la legge vale', tono: 'ok' } } },
      { nota: `{{j|s010|`}}`, set: { f1: { nascosto: false, tono: 'ora' }, f2: { nascosto: false, tono: 'ok' }, c: { t: 'due map = un map con la composizione' } } }
    ]
  };

  SCENE.distr = {
    w: 540, h: 260, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      B('p1', 40, 30, 150, '(John, 35)', { tono: 'dato' }),
      B('p2', 200, 30, 150, '(Andrzej, 39)', { tono: 'dato' }),
      B('p3', 360, 30, 150, '(Stefan, 18)', { tono: 'dato' }),
      B('nomi', 40, 120, 240, 'List(John, Andrzej, Stefan)', { nascosto: true }),
      B('eta', 300, 120, 210, 'List(35, 39, 18)', { nascosto: true }),
      T('c', 40, 215, '', { size: 13 })
    ],
    passi: [
      { nota: `{{j|s012|`}}`, set: {} },
      { nota: `{{j|s013|`}}`, set: { p1: { tono: 'ora' }, p2: { tono: 'ora' }, p3: { tono: 'ora' }, nomi: { nascosto: false, tono: 'ok' } } },
      { nota: `{{j|s014|`}}`, set: { p1: { tono: 'dato' }, p2: { tono: 'dato' }, p3: { tono: 'dato' }, nomi: { tono: null }, eta: { nascosto: false, tono: 'ok' } } },
      { nota: `{{j|s015|`}}`, set: { eta: { tono: null }, c: { t: '(List(John, Andrzej, Stefan), List(35, 39, 18))', tono: 'ok' } } }
    ]
  };

  SCENE.map2 = {
    w: 540, h: 250, lato: true,
    legenda: '{{j|s016|'}}',
    oggetti: [
      B('fa', 40, 30, 200, 'fa = Some("John")', { tono: 'dato' }),
      B('fb', 300, 30, 200, 'fb = Some(35)', { tono: 'dato' }),
      B('comb', 120, 110, 300, 'f(a, b) = "John (35)"', { nascosto: true, tono: 'ora' }),
      B('res', 120, 180, 300, 'Some("John (35)")', { nascosto: true, tono: 'ok' }),
      T('c', 40, 240, '', { size: 12 })
    ],
    passi: [
      { nota: `{{j|s017|`}}`, set: {} },
      { nota: `{{j|s018|`}}`, set: { comb: { nascosto: false } } },
      { nota: `{{j|s019|`}}`, set: { comb: { tono: 'dato' }, res: { nascosto: false, tono: 'ok' }, c: { t: 'map2 restituisce un Option' } } },
      { nota: `{{j|s020|`}}`, set: { fb: { t: 'fb = None', tono: 'no' }, res: { t: 'None', tono: 'no' }, c: { t: 'con None: risultato None' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <div class="occhiello">{{s|s021|}}</div>
  <h1>{{s|s022|}}</h1>
  <p class="lede">{{s|s023|}}</p>
</header>

<section>
  <h2>{{s|s024|}}</h2>
  <p>{{s|s025|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s026|}}</th><th>{{s|s027|}}</th></tr></thead><tbody>
    <tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
    <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
    <tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td></tr>
  </tbody></table></div>
  <p>{{s|s034|}}</p>
  <figure class="scena" data-scena="map" data-titolo="{{a|s035|}}"></figure>
</section>

<section>
  <h2>{{s|s036|}}</h2>
  <p>{{s|s037|}}</p>
  <p>{{s|s038|}}</p>
  <p>{{s|s039|}}</p>
  <figure class="scena" data-scena="legge" data-titolo="{{a|s040|}}"></figure>
  <div class="box attenzione" data-tit="{{a|s041|}}">{{s|s042|}}</div>
</section>

<section>
  <h2>{{s|s043|}}</h2>
  <p>{{s|s044|}}</p>
  <p>{{s|s045|}}</p>
  <figure class="scena" data-scena="distr" data-titolo="{{a|s046|}}"></figure>
</section>

<section>
  <h2>{{s|s047|}}</h2>
  <p>{{s|s048|}}</p>
  <p>{{s|s049|}}</p>
  <p>{{s|s050|}}</p>
  <figure class="scena" data-scena="map2" data-titolo="{{a|s051|}}"></figure>
</section>

<section>
  <h2>{{s|s052|}}</h2>
  <p>{{s|s053|}}</p>
</section>

</main>
</body>
</html>
