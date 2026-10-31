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
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 14 }, extra || {});
  const G = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'griglia', x, y, cw: 46, ch: 32, valori: vals }, extra || {});
  const campiona = (f, a, b, passo) => { const p = []; for (let x = a; x <= b + 1e-9; x += passo) p.push([x, f(x)]); return p; };
  const pl = p => p.concat(p.slice().reverse());

  // 1. curvo in x, lineare in w
  const og1 = [
    { id: 'ax', tipo: 'assi', box: [40, 40, 220, 200], dom: [-0.5, 3, 0, 10], tacche: 1, etX: 'x', etY: 'y' },
    { id: 'aw', tipo: 'assi', box: [340, 40, 220, 200], dom: [-0.5, 2.5, 0, 10], tacche: 1, etX: 'w₂', etY: 'y' },
    T('t1', 150, 18, 'y in funzione di x', { size: 12, bold: true }), T('t2', 450, 18, 'y in funzione di w₂ (x = 2)', { size: 12, bold: true, nascosto: true }),
    { id: 'cu', tipo: 'poli', in: 'ax', punti: pl(campiona(x => 1 + x * x, -0.5, 3, 0.1)), tono: 'no' },
    { id: 'px', tipo: 'punto', in: 'ax', x: 2, y: 5, t: 'x = 2', tono: 'dato', nascosto: true },
    { id: 'lw', tipo: 'linea', in: 'aw', x1: -0.5, y1: -1, x2: 2.25, y2: 10, tono: 'ok', nascosto: true },
    { id: 'q0', tipo: 'punto', in: 'aw', x: 0, y: 1, t: 'w₂ = 0 → 1', tono: 'ok', nascosto: true },
    { id: 'q1', tipo: 'punto', in: 'aw', x: 1, y: 5, t: 'w₂ = 1 → 5', tono: 'ok', nascosto: true },
    { id: 'q2', tipo: 'punto', in: 'aw', x: 2, y: 9, t: 'w₂ = 2 → 9', tono: 'ok', nascosto: true, tx: -80 },
    T('c', 300, 266, 'y = w₀ + w₁x + w₂x²,   con w₀ = 1, w₁ = 0', { size: 13 })
  ];
  SCENE.curvoinx = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: og1,
    passi: [
      { nota: "Il polinomio y = 1 + w₂·x² con w₂ = 1: come funzione di <b>x</b> è una parabola. <b>Non lineare in x</b>: raddoppiando x, y non raddoppia." },
      { nota: "Adesso si fissa x = 2 e si guarda y come funzione del <b>peso</b> w₂: y = 1 + w₂·4.", set: { px: { nascosto: false }, t2: { nascosto: false } } },
      { nota: "w₂ = 0 dà 1, w₂ = 1 dà 5, w₂ = 2 dà 9: ogni +1 di w₂ aggiunge sempre 4. I punti stanno su una <b>retta</b>: il modello è <b>lineare in w</b>.", set: { q0: { nascosto: false }, q1: { nascosto: false }, q2: { nascosto: false }, lw: { nascosto: false } } },
      { nota: "È la risposta alla domanda della slide 19 della lezione 2: \"why is a polynomial a non-linear function but can be written as an inner product?\" Il training cerca w, non x: e rispetto a w il problema è lineare, quindi si risolve con l'algebra lineare.", set: { c: { t: 'curvo in x, lineare in w', tono: 'ok' } } }
    ]
  };

  // 2. la design matrix
  const riga = (r, vals) => ({ X: { valori: vals, toni: { [r + ',0']: 'ora', [r + ',1']: 'ora', [r + ',2']: 'ora' } } });
  SCENE.design = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      T('td', 80, 30, 'dati', { bold: true, size: 13 }),
      G('D', 34, 42, [['0', '1'], ['1', '2'], ['2', '5']], { intC: ['x', 'y'], toni: { '0,0': 'dato', '1,0': 'dato', '2,0': 'dato' } }),
      T('tx', 330, 30, 'design matrix X', { bold: true, size: 13 }),
      G('X', 260, 42, [['', '', ''], ['', '', ''], ['', '', '']], { intC: ['1', 'x', 'x²'] }),
      T('c1', 300, 200, '', { size: 13 }), T('c2', 300, 228, '', { size: 14, bold: true })
    ],
    passi: [
      { nota: "Tre punti e il modello y = w₀ + w₁x + w₂x². La <b>design matrix</b> X ha <b>una riga per punto</b> e <b>una colonna per parametro</b>: le colonne sono ciò che moltiplica w₀, w₁, w₂, cioè 1, x, x²." },
      Object.assign({ nota: "Punto (0, 1): riga [1, 0, 0²] = [1, 0, 0]." }, { set: riga(0, [['1', '0', '0'], ['', '', ''], ['', '', '']]) }),
      Object.assign({ nota: "Punto (1, 2): riga [1, 1, 1²] = [1, 1, 1]." }, { set: riga(1, [['1', '0', '0'], ['1', '1', '1'], ['', '', '']]) }),
      Object.assign({ nota: "Punto (2, 5): riga [1, 2, 2²] = [1, 2, 4]. La colonna di 1 è sempre uguale: moltiplica l'intercetta w₀." }, { set: riga(2, [['1', '0', '0'], ['1', '1', '1'], ['1', '2', '4']]) }),
      { nota: "Tutte le equazioni insieme: <b>X w = y</b>. Forme: (3 × 3)·(3) = 3. Riga i di X per w dà la previsione del punto i. In NumPy: <code>np.vander(x, 3, increasing=True)</code> (matrice di Vandermonde).", set: { X: { toni: {} }, c1: { t: '(N × parametri) · (parametri) = N' }, c2: { t: 'X w = y', tono: 'ok' } } }
    ]
  };

  // 3. tre punti: esatto
  const og3 = [{ id: 'ax', tipo: 'assi', box: [50, 20, 280, 230], dom: [-0.5, 3.5, 0, 11], tacche: 1, etX: 'x', etY: 'y' }];
  [[0, 1], [1, 2], [2, 5]].forEach(([x, y], i) => og3.push({ id: 'd' + i, tipo: 'punto', in: 'ax', x, y, t: '(' + x + ', ' + y + ')', tono: 'dato' }));
  og3.push({ id: 'cu', tipo: 'poli', in: 'ax', punti: pl(campiona(x => 1 + x * x, -0.4, 3.1, 0.1)), tono: 'ok', nascosto: true });
  og3.push(T('e1', 470, 50, '', { size: 13 }), T('e2', 470, 76, '', { size: 13 }), T('e3', 470, 102, '', { size: 13 }), T('w', 470, 150, '', { bold: true }), T('y', 470, 180, '', { bold: true }));
  SCENE.esatto = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s004|'}}',
    codice: { lang: 'python', testo: `x = np.array([0, 1, 2]); y = np.array([1, 2, 5])
X = np.vander(x, 3, increasing=True)   # colonne 1, x, x²
w = np.linalg.solve(X, y)              # [1., 0., 1.]` },
    oggetti: og3,
    passi: [
      { nota: "Tre punti, tre parametri: il sistema è <b>quadrato</b>.", righe: [1] },
      { nota: "Le tre equazioni nei pesi, una per riga della design matrix.", righe: [2], set: { e1: { t: 'w₀ = 1' }, e2: { t: 'w₀ + w₁ + w₂ = 2' }, e3: { t: 'w₀ + 2w₁ + 4w₂ = 5' } } },
      { nota: "<code>np.linalg.solve</code> le risolve: <b>w = [1, 0, 1]</b>.", righe: [3], set: { w: { t: 'w = [1, 0, 1]', tono: 'ok' } } },
      { nota: "Il modello è y = 1 + x², e passa <b>esattamente</b> per i tre punti. Con tanti punti quanti parametri (e punti con x diverse) c'è sempre una e una sola soluzione esatta.", set: { cu: { nascosto: false }, y: { t: 'y = 1 + x²', tono: 'ok' } } }
    ]
  };

  // 4. quattro punti: sovradeterminato
  const og4 = [{ id: 'ax', tipo: 'assi', box: [50, 20, 280, 230], dom: [-0.5, 3.5, 0, 11], tacche: 1, etX: 'x', etY: 'y' }];
  [[0, 1], [1, 2], [2, 5], [3, 8]].forEach(([x, y], i) => og4.push({ id: 'd' + i, tipo: 'punto', in: 'ax', x, y, t: '(' + x + ', ' + y + ')', tono: i === 3 ? 'no' : 'dato', nascosto: i === 3 }));
  og4.push({ id: 'cu', tipo: 'poli', in: 'ax', punti: pl(campiona(x => 1 + x * x, -0.4, 3.1, 0.1)), tono: 'ok' });
  og4.push({ id: 'ls', tipo: 'poli', in: 'ax', punti: pl(campiona(x => 0.9 + 0.9 * x + 0.5 * x * x, -0.4, 3.2, 0.1)), tono: 'due', nascosto: true });
  [0, 1, 2, 3].forEach(i => og4.push({ id: 'r' + i, tipo: 'linea', in: 'ax', x1: i, y1: [1, 2, 5, 8][i], x2: i, y2: [0.9, 2.3, 4.7, 8.1][i], tono: 'no', nascosto: true }));
  og4.push(T('c1', 470, 30, '', { size: 13 }), T('c2', 470, 80, '', { size: 13 }), T('c3', 470, 120, '', { bold: true, size: 13 }), T('c4', 470, 150, '', { size: 13 }));
  SCENE.sovradet = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s005|'}}',
    codice: { lang: 'python', testo: `x4 = np.array([0, 1, 2, 3]); y4 = np.array([1, 2, 5, 8])
X4 = np.vander(x4, 3, increasing=True)          # forma (4, 3)
w4 = np.linalg.lstsq(X4, y4, rcond=None)[0]     # [0.9, 0.9, 0.5]` },
    oggetti: og4,
    passi: [
      { nota: "Arriva un quarto punto, (3, 8). La parabola di prima in x = 3 darebbe 10: non passa più per tutti.", righe: [1], set: { d3: { nascosto: false }, c1: { t: 'y = 1 + x² in x = 3: 10 ≠ 8', tono: 'no' } } },
      { nota: "4 equazioni e 3 incognite: il sistema è <b>sovradeterminato</b> (<i>overdetermined</i>). La design matrix è 4 × 3, alta e stretta, e in generale <b>non esiste</b> un w che rispetti tutte le equazioni.", righe: [2], set: { c2: { t: 'X4 è 4 × 3: niente esatto' } } },
      { nota: "Si cerca allora il w che <b>sbaglia il meno possibile</b> nel senso dei minimi quadrati: <code>lstsq</code> dà w = [0.9, 0.9, 0.5].", righe: [3], set: { cu: { nascosto: true }, ls: { nascosto: false }, c3: { t: 'y = 0.9 + 0.9x + 0.5x²', tono: 'due' } } },
      { nota: "Non passa per nessun punto, ma sta vicino a tutti: previsioni 0.9, 2.3, 4.7, 8.1, residui 0.1, −0.3, 0.3, −0.1, somma dei quadrati 0.2. Nessun polinomio di grado 2 fa meglio. È il caso normale con dati veri: spiegato in <a href=\"w05-minimi-quadrati.html\">minimi quadrati</a>.", set: { r0: { nascosto: false }, r1: { nascosto: false }, r2: { nascosto: false }, r3: { nascosto: false }, c4: { t: 'somma dei quadrati = 0.2' } } }
    ]
  };

  // 5. meno punti che parametri: infinite cubiche
  const og5 = [{ id: 'ax', tipo: 'assi', box: [50, 20, 280, 230], dom: [-0.5, 3.2, -1, 14], tacche: 1, etX: 'x', etY: 'y', numeri: false }];
  [[0, 1], [1, 2], [2, 5]].forEach(([x, y], i) => og5.push({ id: 'd' + i, tipo: 'punto', in: 'ax', x, y, t: '', tono: 'dato' }));
  const cub = c => x => 1 + x * x + c * x * (x - 1) * (x - 2);
  og5.push({ id: 'k0', tipo: 'poli', in: 'ax', punti: pl(campiona(cub(0), -0.3, 3.1, 0.1)), tono: 'ok', nascosto: true });
  og5.push({ id: 'k1', tipo: 'poli', in: 'ax', punti: pl(campiona(cub(0.5), -0.3, 3.1, 0.1)), tono: 'ora', nascosto: true });
  og5.push({ id: 'k2', tipo: 'poli', in: 'ax', punti: pl(campiona(cub(-0.5), -0.3, 3.1, 0.1)), tono: 'due', nascosto: true });
  og5.push(T('c1', 470, 50, 'grado 3: 4 parametri', { size: 13, bold: true }), T('c2', 470, 90, '', { size: 13 }), T('c3', 470, 120, '', { size: 13 }), T('c4', 470, 150, '', { size: 13 }), T('c5', 470, 200, '', { size: 13, bold: true }));
  SCENE.sottodet = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: og5,
    passi: [
      { nota: "Il caso opposto: gli stessi 3 punti, ma un polinomio di grado 3, con <b>4</b> parametri. Meno equazioni che incognite: sistema <b>sottodeterminato</b>." },
      { nota: "y = 1 + x² passa per i tre punti (è un grado 3 con w₃ = 0).", set: { k0: { nascosto: false }, c2: { t: 'c = 0: in x = 3 vale 10', tono: 'ok' } } },
      { nota: "Ma anche y = 1 + x² + 0.5·x(x − 1)(x − 2) ci passa: il termine aggiunto vale 0 proprio in x = 0, 1, 2.", set: { k1: { nascosto: false }, c3: { t: 'c = 0.5: in x = 3 vale 13', tono: 'ora' } } },
      { nota: "E con −0.5 lo stesso. Qualunque numero c va bene: <b>infinite soluzioni</b>, tutte perfette sui dati.", set: { k2: { nascosto: false }, c4: { t: 'c = −0.5: in x = 3 vale 7', tono: 'due' } } },
      { nota: "Sui dati sono identiche; su un punto nuovo, x = 3, danno 10, 13 o 7. <b>I dati non bastano a decidere il modello</b>: servono almeno tanti punti quanti parametri, e di solito molti di più (valori controllati).", set: { c5: { t: 'dati insufficienti', tono: 'no' } } }
    ]
  };

  // 6. più feature
  SCENE.multidesign = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [
      T('td', 110, 30, 'dati (x₁, x₂, y)', { bold: true, size: 13 }),
      G('D', 34, 42, [['0', '0', '1'], ['1', '0', '3'], ['0', '1', '2']], { intC: ['x₁', 'x₂', 'y'] }),
      T('tx', 380, 30, 'X', { bold: true, size: 13 }),
      G('X', 310, 42, [['', '', ''], ['', '', ''], ['', '', '']], { intC: ['1', 'x₁', 'x₂'] }),
      T('c1', 300, 200, '', { size: 13 }), T('c2', 300, 228, '', { size: 14, bold: true })
    ],
    passi: [
      { nota: "Con <b>due</b> feature il modello è un piano: y = w₀ + w₁x₁ + w₂x₂. La design matrix funziona uguale: una riga per punto, una colonna per parametro, cioè [1, x₁, x₂]." },
      Object.assign({ nota: "Ogni punto dà la riga [1, x₁, x₂]: le feature così come sono, più la colonna di 1." }, { set: riga(0, [['1', '0', '0'], ['1', '1', '0'], ['1', '0', '1']]) }),
      { nota: "Si risolve X w = y: w = [1, 2, 1], cioè y = 1 + 2x₁ + x₂ (controllato con NumPy). Un quarto punto (1, 1) darebbe 1 + 2 + 1 = 4.", set: { X: { toni: {} }, c1: { t: 'X w = y  →  w = [1, 2, 1]' }, c2: { t: 'y = 1 + 2x₁ + x₂', tono: 'ok' } } },
      { nota: "Polinomi e più feature si combinano: le colonne della design matrix possono essere qualunque funzione nota delle feature (x₁², x₁x₂, …). Finché il modello è una somma di pesi per colonne note, resta <b>lineare nei parametri</b> e si risolve così. È l'idea del <a href=\"w05-kernel.html\">kernel</a>." }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s008|}}</h1>
  <p class="lede">{{s|s009|}}</p>
</header>

<section>
  <h2>{{s|s010|}}</h2>
  <p>{{s|s011|}}</p>
  <p>{{s|s012|}}</p>
  <figure class="passi" data-titolo="{{a|s013|}}">
    <div class="passo"><div class="espr">y = <mark class="ora">w₀</mark>·1 + <mark class="ora">w₁</mark>·<mark class="dato">x</mark> + <mark class="ora">w₂</mark>·<mark class="dato">x²</mark></div><p class="nota">{{s|s014|}}</p></div>
    <div class="passo"><div class="espr">y = [<mark class="ora">w₀, w₁, w₂</mark>] · [<mark class="dato">1, x, x²</mark>]</div><p class="nota">{{s|s015|}}</p></div>
    <div class="passo"><div class="espr">in x: <mark class="no">non lineare</mark> (x² è una curva)    in w: <mark class="ok">lineare</mark></div><p class="nota">{{s|s016|}}</p></div>
    <div class="passo"><div class="espr">⇒ trovare w = risolvere un <mark class="ok">sistema lineare</mark></div><p class="nota">{{s|s017|}}</p></div>
  </figure>
  <figure class="scena" data-scena="curvoinx" data-titolo="{{a|s018|}}"></figure>
</section>

<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <figure class="passi" data-titolo="{{a|s021|}}">
    <div class="passo"><div class="espr">riga i = [ 1, xᵢ, xᵢ², …, xᵢᵈ ]</div><p class="nota">{{s|s022|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">X</mark> <mark class="ora">w</mark> = <mark class="ok">y</mark>    (N × (d+1)) · (d+1) = N</div><p class="nota">{{s|s023|}}</p></div>
  </figure>
  <div class="box attenzione" data-tit="{{a|s024|}}">
    <p>{{s|s025|}}</p>
  </div>
  <figure class="scena" data-scena="design" data-titolo="{{a|s026|}}"></figure>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
  <p>{{s|s029|}}</p>
  <figure class="scena" data-scena="esatto" data-titolo="{{a|s030|}}"></figure>
</section>

<section>
  <h2>{{s|s031|}}</h2>
  <p>{{s|s032|}}</p>
  <p>{{s|s033|}}</p>
  <figure class="scena" data-scena="sovradet" data-titolo="{{a|s034|}}"></figure>
</section>

<section>
  <h2>{{s|s035|}}</h2>
  <p>{{s|s036|}}</p>
  <p>{{s|s037|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s038|}}</th><th>{{s|s039|}}</th><th>{{s|s040|}}</th><th>{{s|s041|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s042|}}</td><td>2</td><td>[1, x]</td><td>2</td></tr>
      <tr><td>{{s|s043|}}</td><td>3</td><td>[1, x, x²]</td><td>3</td></tr>
      <tr><td>{{s|s044|}}</td><td>d + 1</td><td>[1, x, …, xᵈ]</td><td>d + 1</td></tr>
      <tr><td>{{s|s045|}}</td><td>3</td><td>[1, x₁, x₂]</td><td>3</td></tr>
      <tr><td>{{s|s046|}}</td><td>n + 1</td><td>[1, x₁, …, xₙ]</td><td>n + 1</td></tr>
    </tbody>
  </table></div>
  <div class="box esame" data-tit="{{a|s047|}}">
    <p>{{s|s048|}}</p>
  </div>
  <figure class="scena" data-scena="sottodet" data-titolo="{{a|s049|}}"></figure>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <p>{{s|s051|}}</p>
  <p>{{s|s052|}}</p>
  <figure class="scena" data-scena="multidesign" data-titolo="{{a|s053|}}"></figure>
</section>

</main>
</body>
</html>
