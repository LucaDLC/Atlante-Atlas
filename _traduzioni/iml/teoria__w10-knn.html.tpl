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
  const A = [[3, 4], [4, 4], [0, 3], [3, 7], [1, 1], [0, 1], [1, 6], [2, 7], [0, 6], [4, 7]];
  const B = [[5, 3], [5, 4], [6, 3], [6, 5], [7, 2], [7, 4], [5, 6], [6, 1], [7, 6], [6, 7]];
  const Q = [[3, 3], [2, 4], [5, 2], [4, 5], [4, 2]];
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const tutti = A.map((p, i) => ({ p, n: 'A' + (i + 1), tono: 'due' })).concat(B.map((p, i) => ({ p, n: 'B' + (i + 1), tono: 'dato' })));
  const d2 = (p, q) => (p[0] - q[0]) ** 2 + (p[1] - q[1]) ** 2;
  /* i punti entro la distanza del quinto più vicino, pari merito compresi */
  const vicini = q => { const ds = tutti.map(t => d2(t.p, q)).sort((a, b) => a - b); return tutti.map((t, i) => i).filter(i => d2(tutti[i].p, q) <= ds[4]); };

  const ogg = [{ id: 'ax', tipo: 'assi', box: [40, 15, 330, 330], dom: [0, 8, 0, 8], tacche: 1, etX: 'x₁', etY: 'x₂' }];
  tutti.forEach((t, i) => ogg.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x: t.p[0], y: t.p[1], r: 6, t: t.n, tono: t.tono }));
  Q.forEach((q, j) => ogg.push({ id: 'q' + j, tipo: 'punto', in: 'ax', x: q[0], y: q[1], r: 7, t: 'Q' + (j + 1), tono: 'ora' }));
  const linee = [];
  Q.forEach((q, j) => vicini(q).forEach(i => {
    const id = 'l' + j + '_' + i;
    linee.push([id, j]);
    ogg.push({ id, tipo: 'linea', in: 'ax', x1: q[0], y1: q[1], x2: tutti[i].p[0], y2: tutti[i].p[1], tono: 'ora', tratt: true, nascosto: true });
  }));
  ['c', 'c2', 'c3', 'c4'].forEach((id, m) => ogg.push(T(id, 505, 60 + m * 45, '', { size: 14, bold: m === 0 })));
  const solo = (j, testi) => {
    const s = {};
    linee.forEach(([id, jj]) => { s[id] = { nascosto: jj !== j }; });
    return Object.assign(s, testi);
  };
  SCENE.knn20 = {
    w: 640, h: 360, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: ogg,
    passi: [
      { nota: `{{j|s003|`}}` },
      { nota: `{{j|s004|`}}`, set: solo(0, { c: { t: 'Q1 = (3, 3)' }, c2: { t: 'k = 2 → A' }, c3: { t: 'k = 3 → A' }, c4: { t: 'k = 5 → A' } }) },
      { nota: `{{j|s005|`}}`, set: solo(1, { c: { t: 'Q2 = (2, 4)' }, c2: { t: 'k = 2 → A' }, c3: { t: 'k = 3 → A' }, c4: { t: 'k = 5 → A' } }) },
      { nota: `{{j|s006|`}}`, set: solo(2, { c: { t: 'Q3 = (5, 2)' }, c2: { t: 'k = 2 → B' }, c3: { t: 'k = 3 → B' }, c4: { t: 'k = 5 → B' } }) },
      { nota: `{{j|s007|`}}`, set: solo(3, { c: { t: 'Q4 = (4, 5)' }, c2: { t: 'k = 2 → A / 1–1' }, c3: { t: 'k = 3 → A / B' }, c4: { t: 'k = 5 → A / B' } }) },
      { nota: `{{j|s008|`}}`, set: solo(4, { c: { t: 'Q5 = (4, 2)' }, c2: { t: 'k = 2 → 1–1' }, c3: { t: 'k = 3 → A / B' }, c4: { t: 'k = 5 → B' } }) },
      { nota: `{{j|s009|`}}`, set: solo(-1, { c: { t: '' }, c2: { t: '' }, c3: { t: '' }, c4: { t: '' } }) }
    ]
  };

  /* quattro dimensioni */
  const nomi = ['A1', 'A2', 'B1', 'B2', 'B3', 'A3', 'A4', 'B4'];
  const dq = ['1', '2', '4', '5', '8', '9', '17', '18'];
  const toni = { 0: 'due', 1: 'due', 2: 'dato', 3: 'dato', 4: 'dato', 5: 'due', 6: 'due', 7: 'dato' };
  const sot = k => ({ sot: { x2: 60 + k * 66 } });
  SCENE.knn4d = {
    w: 620, h: 220, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      { id: 'nomi', tipo: 'celle', x: 60, y: 24, cw: 66, ch: 40, valori: nomi, toni, indici: false },
      { id: 'dist', tipo: 'celle', x: 60, y: 84, cw: 66, ch: 40, valori: dq, toni, indici: false },
      T('ld', 30, 104, 'd²', { size: 14 }),
      { id: 'sot', tipo: 'linea', x1: 60, y1: 146, x2: 60, y2: 146, tono: 'ok', nascosto: true },
      T('esito', 310, 186, '', { size: 15, bold: true, tono: 'ok' })
    ],
    passi: [
      { nota: `{{j|s011|`}}` },
      { nota: `{{j|s012|`}}`, set: Object.assign(sot(2), { sot: { nascosto: false, x2: 60 + 2 * 66 }, esito: { t: 'k = 2 → A' } }) },
      { nota: `{{j|s013|`}}`, set: { sot: { x2: 60 + 3 * 66 }, esito: { t: 'k = 3 → A' } } },
      { nota: `{{j|s014|`}}`, set: { sot: { x2: 60 + 5 * 66 }, esito: { t: 'k = 5 → B' } } },
      { nota: `{{j|s015|`}}`, set: { nomi: { toni: { 0: 'due', 1: 'due', 2: 'dato', 3: 'dato', 4: 'ora', 5: 'ora', 6: 'due', 7: 'dato' } }, dist: { toni: { 0: 'due', 1: 'due', 2: 'dato', 3: 'dato', 4: 'ora', 5: 'ora', 6: 'due', 7: 'dato' } } } }
    ]
  };

  /* confini: retta dei minimi quadrati, k = 1 e k = 5 */
  const MAPPA = { k1: 'AAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBAAAAAAAAAAAAAAAAAAAABBBBBBBBBBBB', k5: 'AAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAABBBBBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAABBBBBBBBBBBBB' };
  const scala = (s, id, tono) => {
    const n = 32, h = 8 / n, out = [];
    for (let r = 0; r < n; r++) for (let c = 0; c < n; c++) {
      const v = s[r * n + c];
      if (c < n - 1 && v !== s[r * n + c + 1]) out.push([(c + 1) * h, r * h, (c + 1) * h, (r + 1) * h]);
      if (r < n - 1 && v !== s[(r + 1) * n + c]) out.push([c * h, (r + 1) * h, (c + 1) * h, (r + 1) * h]);
    }
    return out.map((g, k) => ({ id: id + k, tipo: 'linea', in: 'ax', x1: g[0], y1: g[1], x2: g[2], y2: g[3], tono, nascosto: true }));
  };
  const og3 = [{ id: 'ax', tipo: 'assi', box: [40, 15, 330, 330], dom: [0, 8, 0, 8], tacche: 1, etX: 'x₁', etY: 'x₂' }];
  tutti.forEach((t, i) => og3.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x: t.p[0], y: t.p[1], r: 6, tono: t.tono }));
  /* w = [−1.074, 0.359, −0.075]: x₁ = 2.993 + 0.2085·x₂ */
  og3.push({ id: 'lin', tipo: 'linea', in: 'ax', x1: 2.993, y1: 0, x2: 2.993 + 0.2085 * 8, y2: 8, tono: 'spento', nascosto: true });
  const s1 = scala(MAPPA.k1, 'u', 'ora'), s5 = scala(MAPPA.k5, 'v', 'ok');
  s1.concat(s5).forEach(o => og3.push(o));
  ['c', 'c2', 'c3'].forEach((id, m) => og3.push(T(id, 505, 80 + m * 45, '', { size: 14, bold: true })));
  const mostra = (lista, v) => Object.fromEntries(lista.map(o => [o.id, { nascosto: !v }]));
  SCENE.confini = {
    w: 640, h: 360, lato: true,
    legenda: '{{j|s016|'}}',
    oggetti: og3,
    passi: [
      { nota: `{{j|s017|`}}` },
      { nota: `{{j|s018|`}}`, set: { lin: { nascosto: false }, p1: { tono: 'no' }, c: { t: 'retta: 19/20', tono: 'spento' } } },
      { nota: `{{j|s019|`}}`, set: Object.assign(mostra(s1, true), { p1: { tono: 'due' }, c2: { t: 'k = 1: 20/20', tono: 'ora' } }) },
      { nota: `{{j|s020|`}}`, set: Object.assign(mostra(s5, true), { p1: { tono: 'no' }, c3: { t: 'k = 5: 19/20', tono: 'ok' } }) }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s021|}}</h1>
  <p class="lede">{{s|s022|}}</p>
</header>

<section>
  <h2>{{s|s023|}}</h2>
  <figure class="passi" data-titolo="{{a|s024|}}">
    <div class="passo"><div class="espr"><mark class="dato">memorizza</mark> i dati: (x₁, y₁), …, (x<sub>N</sub>, y<sub>N</sub>)</div><p class="nota">{{s|s025|}}</p></div>
    <div class="passo"><div class="espr">d(<mark class="ora">q</mark>, <mark class="dato">xᵢ</mark>) = √( (q₁ − xᵢ₁)² + (q₂ − xᵢ₂)² + … )</div><p class="nota">{{s|s026|}}</p></div>
    <div class="passo"><div class="espr">si ordinano le distanze e si tengono i <mark class="ora">k</mark> punti più vicini</div><p class="nota">{{s|s027|}}</p></div>
    <div class="passo"><div class="espr">classe di q = la più frequente fra i k vicini: <mark class="ok">voto di maggioranza</mark></div><p class="nota">{{s|s028|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s029|}}</h2>
  <p>{{s|s030|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s031|}}</th><th>A1</th><th>A2</th><th>A3</th><th>A4</th><th>A5</th><th>A6</th><th>A7</th><th>A8</th><th>A9</th><th>A10</th></tr></thead>
    <tbody>
      <tr><td>(x₁, x₂)</td><td>(3, 4)</td><td>(4, 4)</td><td>(0, 3)</td><td>(3, 7)</td><td>(1, 1)</td><td>(0, 1)</td><td>(1, 6)</td><td>(2, 7)</td><td>(0, 6)</td><td>(4, 7)</td></tr>
    </tbody>
  </table></div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s032|}}</th><th>B1</th><th>B2</th><th>B3</th><th>B4</th><th>B5</th><th>B6</th><th>B7</th><th>B8</th><th>B9</th><th>B10</th></tr></thead>
    <tbody>
      <tr><td>(x₁, x₂)</td><td>(5, 3)</td><td>(5, 4)</td><td>(6, 3)</td><td>(6, 5)</td><td>(7, 2)</td><td>(7, 4)</td><td>(5, 6)</td><td>(6, 1)</td><td>(7, 6)</td><td>(6, 7)</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s033|}}</p>
  <figure class="scena" data-scena="knn20" data-titolo="{{a|s034|}}"></figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s035|}}</th><th>k = 2</th><th>k = 3</th><th>k = 5</th></tr></thead>
    <tbody>
      <tr><td>Q1 = (3, 3)</td><td><b>A</b> (2–0)</td><td><b>A</b> (2–1)</td><td><b>A</b> (3–2)</td></tr>
      <tr><td>Q2 = (2, 4)</td><td><b>A</b> (2–0)</td><td><b>A</b> (3–0)</td><td><b>A</b> (5–0)</td></tr>
      <tr><td>Q3 = (5, 2)</td><td><b>B</b> (0–2)</td><td><b>B</b> (0–3)</td><td><b>B</b> (0–5)</td></tr>
      <tr><td>Q4 = (4, 5)</td><td>{{s|s036|}}</td><td>A / B</td><td>A / B</td></tr>
      <tr><td>Q5 = (4, 2)</td><td>{{s|s037|}}</td><td>A / B</td><td><b>B</b> (2–3)</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s038|}}</p>
  <div class="box attenzione" data-tit="{{a|s039|}}">
    <p>{{s|s040|}}</p>
  </div>
  <p class="piccolo">{{s|s041|}}</p>
  <div class="box idea" data-tit="{{a|s042|}}">
    <p>{{s|s043|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s044|}}</h2>
  <p>{{s|s045|}}</p>
  <ul>
    <li>{{s|s046|}}</li>
    <li>{{s|s047|}}</li>
    <li>{{s|s048|}}</li>
  </ul>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>k</th><th>{{s|s049|}}</th><th>{{s|s050|}}</th></tr></thead>
    <tbody>
      <tr><td>1</td><td>{{s|s051|}}</td><td>1.0</td></tr>
      <tr><td>3</td><td>{{s|s052|}}</td><td>1.0</td></tr>
      <tr><td>5</td><td>A2 = (4, 4)</td><td>0.95</td></tr>
      <tr><td>20</td><td>{{s|s053|}}</td><td>0.5</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s054|}}</p>
  <figure class="codice" data-titolo="{{a|s055|}}">
<pre data-lang="python">X = np.vstack([class_A, class_B])                    # 20 × 2: prima gli A, poi i B
y = np.r_[np.zeros(10), np.ones(10)].astype(int)    # 0 = A, 1 = B
def knn(q, k):
    d = np.linalg.norm(X - q, axis=1)               # distanza di q da ogni punto
    vicini = np.argsort(d, kind="stable")[:k]       # indici dei k più vicini
    return np.bincount(y[vicini], minlength=2)      # voti: [quanti A, quanti B]</pre>
    <ol class="spiega">
      <li data-righe="1-2" data-segna="np.vstack@dato|np.r_@due"><p>{{s|s056|}}</p></li>
      <li data-righe="4" data-segna="X - q@ora|axis=1@ok"><p>{{s|s057|}}</p></li>
      <li data-righe="5" data-segna="argsort@ora|stable@due|[:k]@ok"><p>{{s|s058|}}</p></li>
      <li data-righe="6" data-segna="y[vicini]@dato|np.bincount@ok"><p>{{s|s059|}}</p></li>
    </ol>
  </figure>
  <p class="piccolo">{{s|s060|}}</p>
</section>

<section>
  <h2>{{s|s061|}}</h2>
  <p>{{s|s062|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s063|}}</th><th>A1</th><th>A2</th><th>A3</th><th>A4</th></tr></thead>
    <tbody><tr><td>(x₁, x₂, x₃, x₄)</td><td>(1, 0, 0, 0)</td><td>(1, 1, 0, 0)</td><td>(2, 2, 1, 0)</td><td>(3, 2, 2, 0)</td></tr></tbody>
  </table></div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s064|}}</th><th>B1</th><th>B2</th><th>B3</th><th>B4</th></tr></thead>
    <tbody><tr><td>(x₁, x₂, x₃, x₄)</td><td>(2, 0, 0, 0)</td><td>(2, 1, 0, 0)</td><td>(2, 2, 0, 0)</td><td>(3, 3, 0, 0)</td></tr></tbody>
  </table></div>
  <figure class="scena" data-scena="knn4d" data-titolo="{{a|s065|}}"></figure>
  <ul>
    <li><b>k = 2</b>: A1, A2 → <b>A</b>. <b>k = 3</b>: A1, A2, B1 → <b>A</b> (2–1). <b>k = 5</b>: A1, A2, B1, B2, B3 → <b>B</b> (2–3).</li>
    <li>{{s|s066|}}</li>
    <li>{{s|s067|}}</li>
  </ul>
  <div class="box idea" data-tit="{{a|s068|}}">
    <p>{{s|s069|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s070|}}</h2>
  <p>{{s|s071|}}</p>
  <figure class="scena" data-scena="confini" data-titolo="{{a|s072|}}"></figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th></th><th>{{s|s073|}}</th><th>{{s|s074|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s075|}}</td><td>{{s|s076|}}</td><td>{{s|s077|}}</td></tr>
      <tr><td>{{s|s078|}}</td><td>{{s|s079|}}</td><td>{{s|s080|}}</td></tr>
      <tr><td>{{s|s081|}}</td><td>{{s|s082|}}</td><td>{{s|s083|}}</td></tr>
      <tr><td>{{s|s084|}}</td><td>{{s|s085|}}</td><td>{{s|s086|}}</td></tr>
      <tr><td>{{s|s087|}}</td><td>{{s|s088|}}</td><td>{{s|s089|}}</td></tr>
      <tr><td>{{s|s090|}}</td><td>{{s|s091|}}</td><td>{{s|s092|}}</td></tr>
      <tr><td>{{s|s093|}}</td><td>{{s|s094|}}</td><td>{{s|s095|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s096|}}</p>
  <div class="box inglese" data-tit="{{a|s097|}}">
    <p>{{s|s098|}}</p>
  </div>
</section>

</main>
</body>
</html>
