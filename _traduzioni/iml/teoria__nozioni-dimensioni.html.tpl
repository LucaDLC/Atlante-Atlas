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
SCENE.destra = {
  w: 560, h: 270, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'A', tipo: 'griglia', x: 40, y: 70, cw: 44, ch: 40, valori: [['1', '2', '3'], ['4', '5', '6']] },
    { id: 'tA', tipo: 'testo', x: 106, y: 52, t: 'A   (2 × 3)', size: 14, bold: true },
    { id: 'per', tipo: 'testo', x: 196, y: 110, t: '·', size: 26, bold: true },
    { id: 'v', tipo: 'griglia', x: 220, y: 50, cw: 50, ch: 40, valori: [['−1'], ['−2'], ['−3']] },
    { id: 'tv', tipo: 'testo', x: 245, y: 32, t: 'v   (3)', size: 14, bold: true },
    { id: 'eq', tipo: 'testo', x: 305, y: 110, t: '=', size: 22, bold: true },
    { id: 'r', tipo: 'griglia', x: 330, y: 70, cw: 60, ch: 40, valori: [[''], ['']] },
    { id: 'tr', tipo: 'testo', x: 360, y: 52, t: 'Av   (2)', size: 14, bold: true },
    { id: 'c1', tipo: 'testo', x: 280, y: 200, t: '', size: 14 },
    { id: 'c2', tipo: 'testo', x: 280, y: 226, t: '', size: 14 },
    { id: 'n', tipo: 'testo', x: 280, y: 256, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { A: { toni: { '0,2': 'ora', '1,2': 'ora' } }, v: { toni: { '2,0': 'dato' } }, n: { t: '(2 × 3) · (3 × 1): 3 = 3 ✓  →  risultato 2 × 1', tono: 'ok' } } },
    { nota: '{{j|s005|'}}', set: { A: { toni: { '0,0': 'ora', '0,1': 'ora', '0,2': 'ora' } }, v: { toni: { '0,0': 'dato', '1,0': 'dato', '2,0': 'dato' } }, r: { valori: [['−14'], ['']], toni: { '0,0': 'ok' } }, c1: { t: 'riga 1:  1·(−1) + 2·(−2) + 3·(−3) = −14', tono: 'ok' }, n: { t: '' } } },
    { nota: '{{j|s006|'}}', set: { A: { toni: { '1,0': 'ora', '1,1': 'ora', '1,2': 'ora' } }, r: { valori: [['−14'], ['−32']], toni: { '0,0': 'ok', '1,0': 'ok' } }, c1: { tono: null }, c2: { t: 'riga 2:  4·(−1) + 5·(−2) + 6·(−3) = −32', tono: 'ok' } } },
    { nota: '{{j|s007|'}}', set: { A: { toni: {} }, v: { toni: {} }, c2: { tono: null }, n: { t: 'Av = (−14, −32)', tono: 'ok' } } }
  ]
};
SCENE.sinistra = {
  w: 560, h: 250, lato: false,
  legenda: '{{j|s008|'}}',
  oggetti: [
    { id: 'u', tipo: 'griglia', x: 30, y: 80, cw: 44, ch: 40, valori: [['1', '2']] },
    { id: 'tu', tipo: 'testo', x: 74, y: 62, t: 'r   (1 × 2)', size: 14, bold: true },
    { id: 'per', tipo: 'testo', x: 142, y: 100, t: '·', size: 26, bold: true },
    { id: 'M', tipo: 'griglia', x: 164, y: 60, cw: 44, ch: 40, valori: [['1', '0', '2'], ['0', '1', '3']] },
    { id: 'tM', tipo: 'testo', x: 230, y: 42, t: 'M   (2 × 3)', size: 14, bold: true },
    { id: 'eq', tipo: 'testo', x: 322, y: 104, t: '=', size: 22, bold: true },
    { id: 'r', tipo: 'griglia', x: 344, y: 80, cw: 52, ch: 40, valori: [['', '', '']] },
    { id: 'tr', tipo: 'testo', x: 422, y: 62, t: 'rM   (1 × 3)', size: 14, bold: true },
    { id: 'c', tipo: 'testo', x: 280, y: 180, t: '', size: 14 },
    { id: 'n', tipo: 'testo', x: 280, y: 222, t: '', size: 14, bold: true }
  ],
  passi: [
    { nota: '{{j|s009|'}}' },
    { nota: '{{j|s010|'}}', set: { n: { t: '(1 × 2) · (2 × 3): 2 = 2 ✓  →  risultato 1 × 3', tono: 'ok' } } },
    { nota: '{{j|s011|'}}', set: { u: { toni: { '0,0': 'dato', '0,1': 'dato' } }, M: { toni: { '0,0': 'ora', '1,0': 'ora' } }, r: { valori: [['1', '', '']], toni: { '0,0': 'ok' } }, c: { t: 'colonna 1:  1·1 + 2·0 = 1', tono: 'ok' }, n: { t: '' } } },
    { nota: '{{j|s012|'}}', set: { M: { toni: { '0,1': 'ora', '1,1': 'ora' } }, r: { valori: [['1', '2', '']], toni: { '0,0': 'ok', '0,1': 'ok' } }, c: { t: 'colonna 2:  1·0 + 2·1 = 2' } } },
    { nota: '{{j|s013|'}}', set: { M: { toni: { '0,2': 'ora', '1,2': 'ora' } }, r: { valori: [['1', '2', '8']], toni: { '0,0': 'ok', '0,1': 'ok', '0,2': 'ok' } }, c: { t: 'colonna 3:  1·2 + 2·3 = 8' } } },
    { nota: '{{j|s014|'}}', set: { u: { toni: {} }, M: { toni: {} }, c: { t: '', tono: null }, n: { t: 'rM = [1, 2, 8]', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 14 }, extra || {});
  const B = (id, x, y, w, h, t, tono, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t, tono }, extra || {});

  // 1. la regola base, con i blocchi
  SCENE.regola = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s015|'}}',
    oggetti: [
      T('f1', 110, 40, '(2 × 3)', { bold: true, size: 18, tono: 'dato' }), T('dot', 180, 40, '·', { size: 20, bold: true }),
      T('f2', 250, 40, '(3 × 1)', { bold: true, size: 18, tono: 'due' }),
      T('m', 180, 90, '', { size: 14, bold: true }), T('r', 180, 130, '', { size: 16, bold: true }),
      T('ch', 300, 196, '', { size: 16, bold: true }), T('ch2', 300, 226, '', { size: 13 }),
      T('x1', 440, 40, '', { size: 13 }), T('x2', 440, 70, '', { size: 13 })
    ],
    passi: [
      { nota: "Due fattori: una matrice 2 × 3 e una 3 × 1. Si scrivono le dimensioni una accanto all'altra, sempre <b>righe × colonne</b>." },
      { nota: "Si guardano i due numeri <b>in mezzo</b>: le colonne del primo (3) e le righe del secondo (3). Sono uguali: il prodotto <b>esiste</b>.", set: { m: { t: 'in mezzo: 3 = 3 ✓', tono: 'ora' } } },
      { nota: "Si guardano i due numeri <b>fuori</b>: 2 e 1. Il risultato è <b>2 × 1</b>. I numeri in mezzo \"si cancellano\".", set: { r: { t: 'fuori: 2 × 1', tono: 'ok' } } },
      { nota: "Con (2 × 3)·(2 × 1): in mezzo 3 e 2, diversi. Una riga ha 3 numeri, una colonna 2: non si possono accoppiare. <b>Non definito</b>, e ci si ferma.", set: { f2: { t: '(2 × 1)', tono: 'no' }, m: { t: 'in mezzo: 3 ≠ 2 ✗', tono: 'no' }, r: { t: 'non definito', tono: 'no' } } },
      { nota: "Con più fattori si cancellano le coppie in mezzo una alla volta: (2 × 3)(3 × 4)(4 × 1) → 2 × 1.", set: { f2: { t: '(3 × 1)', tono: 'due' }, m: { t: '' }, r: { t: '' }, ch: { t: '(2 × 3)(3 × 4)(4 × 1)' }, ch2: { t: '3 = 3 ✓   4 = 4 ✓   →   2 × 1', tono: 'ok' } } }
    ]
  };

  // 2. cosa si può fare
  const riga = (id, y) => T(id, 300, y, '', { size: 14 });
  const prova = (i, testo, tono) => ({ ['o' + i]: { t: testo, tono } });
  SCENE.tabella = {
    w: 600, h: 260, lato: true,
    legenda: '{{j|s016|'}}',
    oggetti: [
      T('d', 300, 26, 'A: 2 × 3    B: 2 × 3    C: 3 × 2    v: 3', { bold: true, size: 14 }),
      riga('o0', 70), riga('o1', 100), riga('o2', 130), riga('o3', 160), riga('o4', 190), riga('o5', 220)
    ],
    passi: [
      { nota: "Quattro oggetti con forme diverse. Per ogni operazione si applica la regola della sua riga nella tabella della pagina." },
      { nota: "<b>A + B</b>: somma casella per casella, servono forme <b>identiche</b>. 2 × 3 e 2 × 3: sì, risultato 2 × 3.", set: prova(0, 'A + B: 2 × 3 ✓', 'ok') },
      { nota: "<b>A + C</b>: 2 × 3 e 3 × 2 hanno le stesse caselle in totale, ma forme diverse: <b>no</b>. Non si traspone niente di nascosto.", set: prova(1, 'A + C: forme diverse ✗', 'no') },
      { nota: "<b>A · C</b>: (2 × 3)(3 × 2), in mezzo 3 = 3: sì, risultato 2 × 2.", set: prova(2, 'A · C: (2 × 3)(3 × 2) → 2 × 2 ✓', 'ok') },
      { nota: "<b>C · A</b>: (3 × 2)(2 × 3), in mezzo 2 = 2: sì, ma il risultato è <b>3 × 3</b>. Stessi fattori, ordine diverso, forma diversa.", set: prova(3, 'C · A: (3 × 2)(2 × 3) → 3 × 3 ✓', 'ok') },
      { nota: "<b>A · v</b>: v a destra è una colonna, (2 × 3)(3): sì, un vettore di 2.", set: prova(4, 'A · v: (2 × 3)(3) → 2 ✓', 'ok') },
      { nota: "<b>v · A</b>: v a sinistra è una riga, (1 × 3)(2 × 3): in mezzo 3 ≠ 2, <b>no</b>. Invece v · C = (1 × 3)(3 × 2) → 2 funziona.", set: prova(5, 'v · A: (1 × 3)(2 × 3) ✗', 'no') }
    ]
  };

  // 3. l'errore tipico
  const G = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'griglia', x, y, cw: 46, ch: 36, valori: vals }, extra || {});
  SCENE.errore8 = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s017|'}}',
    oggetti: [
      G('A', 40, 40, [['4', '−4'], ['4', '−1']]), G('v', 150, 40, [['4'], ['2']], { toni: { '0,0': 'dato', '1,0': 'dato' } }),
      T('e', 215, 76, '=', { size: 20, bold: true }), G('r', 235, 40, [[''], ['']]),
      T('c1', 440, 50, '', { size: 13 }), T('c2', 440, 80, '', { size: 13 }), T('c3', 440, 130, '', { bold: true }), T('c4', 440, 180, '', { size: 13 }), T('c5', 440, 210, '', { size: 13 })
    ],
    passi: [
      { nota: "[[4, −4], [4, −1]] · (4, 2): matrice 2 × 2 per vettore di 2. Il risultato deve essere un <b>vettore di 2</b>." },
      { nota: "Riga 1 per il vettore: 4·4 + (−4)·2 = 16 − 8 = 8. La somma sta <b>dentro</b> la riga: è un prodotto interno.", set: { A: { toni: { '0,0': 'ora', '0,1': 'ora' } }, r: { valori: [['8'], ['']], toni: { '0,0': 'ok' } }, c1: { t: 'riga 1: 16 − 8 = 8' } } },
      { nota: "Riga 2: 4·4 + (−1)·2 = 16 − 2 = 14. Una casella separata.", set: { A: { toni: { '1,0': 'ora', '1,1': 'ora' } }, r: { valori: [['8'], ['14']], toni: { '0,0': 'ok', '1,0': 'ok' } }, c2: { t: 'riga 2: 16 − 2 = 14' } } },
      { nota: "Risultato: <b>(8, 14)</b>.", set: { A: { toni: {} }, c3: { t: 'risultato: (8, 14)', tono: 'ok' } } },
      { nota: "L'errore tipico: sommare anche i risultati delle due righe, 8 + 14 = 22. <b>Mai sommare fra righe diverse</b>: ogni riga produce la sua casella. Un numero solo esce solo dal prodotto interno di due vettori.", set: { c4: { t: '8 + 14 = 22 ✗', tono: 'no' }, c5: { t: 'mai sommare tra righe diverse' } } }
    ]
  };

  // 4. forme in NumPy
  SCENE.numpyforme = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s018|'}}',
    codice: { lang: 'python', testo: `A = np.array([[1, 2, 3], [4, 5, 6]])   # (2, 3)
v = np.array([-1, -2, -3])             # (3,)
A @ v                                  # array([-14, -32])
v @ A                                  # ValueError
np.array([1, 2]) @ A                   # array([ 9, 12, 15])` },
    oggetti: [T('c1', 300, 50, '', { size: 14 }), T('c2', 300, 100, '', { size: 14 }), T('c3', 300, 150, '', { size: 13 }), T('c4', 300, 200, '', { size: 14 })],
    passi: [
      { nota: "In NumPy la prima cosa da guardare è sempre <code>.shape</code>. A ha forma (2, 3); v, un array 1D, ha forma (3,).", righe: [1, 2], set: { c1: { t: 'A: (2, 3)    v: (3,)', tono: 'dato' } } },
      { nota: "<code>A @ v</code>: v a destra fa da colonna, (2 × 3)(3) → 2 numeri: [−14, −32].", righe: [3], set: { c2: { t: 'A @ v → [−14, −32]', tono: 'ok' } } },
      { nota: "<code>v @ A</code>: v a sinistra fa da riga, (3)(2 × 3): in mezzo 3 ≠ 2. NumPy si ferma con <code>ValueError: matmul: … (size 2 is different from 3)</code>: è proprio il controllo dei numeri in mezzo (errore vero, riprodotto).", righe: [4], set: { c3: { t: 'v @ A → ValueError (2 ≠ 3)', tono: 'no' } } },
      { nota: "Un vettore di 2 a sinistra invece funziona: (2)(2 × 3) → 3 numeri, [9, 12, 15].", righe: [5], set: { c4: { t: '[1, 2] @ A → [9, 12, 15]', tono: 'ok' } } }
    ]
  };

  // 5. la catena della formula dei minimi quadrati
  SCENE.catenaforme = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s019|'}}',
    oggetti: [
      B('xt', 20, 70, 110, 36, 'Xᵀ: 3 × 4', 'dato'), B('x', 140, 50, 50, 76, 'X: 4 × 3', 'dato'),
      B('y', 200, 50, 40, 76, 'y: 4', 'dato', { nascosto: true }),
      T('c1', 420, 50, '', { size: 13 }), T('c2', 420, 80, '', { size: 13 }), T('c3', 420, 110, '', { size: 13 }), T('c4', 420, 150, '', { size: 14, bold: true }),
      T('s', 300, 210, 'w = (XᵀX)⁻¹ Xᵀ y', { bold: true, size: 15 })
    ],
    passi: [
      { nota: "La formula dei minimi quadrati con 4 punti e 3 parametri (un polinomio di grado 2): X è 4 × 3, y ha 4 numeri." },
      { nota: "XᵀX: (3 × 4)(4 × 3) → <b>3 × 3</b>. Quadrata: si può provare a invertire.", set: { c1: { t: 'XᵀX: (3×4)(4×3) → 3 × 3', tono: 'ora' } } },
      { nota: "Xᵀy: (3 × 4)(4) → <b>3</b>. Un numero per parametro.", set: { y: { nascosto: false }, c2: { t: 'Xᵀy: (3×4)(4) → 3', tono: 'ora' } } },
      { nota: "(XᵀX)⁻¹ ha la stessa forma di XᵀX, 3 × 3; per Xᵀy: (3 × 3)(3) → 3.", set: { c3: { t: '(XᵀX)⁻¹ Xᵀy: (3×3)(3) → 3' } } },
      { nota: "Escono <b>3 pesi</b>, uno per colonna di X: le forme tornano. Controllare le forme passo passo è il modo più rapido per ricordare (e verificare) una formula lunga.", set: { c4: { t: 'w: 3 pesi ✓', tono: 'ok' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s020|}}</h1>
  <p class="lede">{{s|s021|}}</p>
</header>

<section>
  <h2>{{s|s022|}}</h2>
  <div class="box domanda-tua" data-tit="{{a|s023|}}">
    <p>{{s|s024|}}</p>
    <p>{{s|s025|}}</p>
    <p>{{s|s026|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s027|}}">
    <div class="passo"><div class="espr">(2 × <mark class="ora">3</mark>) · (<mark class="ora">3</mark> × 1)</div><p class="nota">{{s|s028|}}</p></div>
    <div class="passo"><div class="espr">in mezzo:  <mark class="ora">3</mark> = <mark class="ora">3</mark>   <mark class="ok">✓ il prodotto esiste</mark></div><p class="nota">{{s|s029|}}</p></div>
    <div class="passo"><div class="espr">fuori:  <mark class="dato">2</mark> × <mark class="dato">1</mark>   ⇒  risultato <mark class="ok">2 × 1</mark></div><p class="nota">{{s|s030|}}</p></div>
    <div class="passo"><div class="espr">(2 × <mark class="no">3</mark>) · (<mark class="no">2</mark> × 1):  3 ≠ 2  ⇒  <mark class="no">non definito</mark></div><p class="nota">{{s|s031|}}</p></div>
  </figure>
  <div class="box idea" data-tit="{{a|s032|}}">
    <p>{{s|s033|}}</p>
  </div>
  <figure class="scena" data-scena="regola" data-titolo="{{a|s034|}}"></figure>
</section>

<section>
  <h2>{{s|s035|}}</h2>
  <p>{{s|s036|}}</p>
  <figure class="scena" data-scena="destra" data-titolo="{{a|s037|}}"></figure>
</section>

<section>
  <h2>{{s|s038|}}</h2>
  <p>{{s|s039|}}</p>
  <figure class="scena" data-scena="sinistra" data-titolo="{{a|s040|}}"></figure>
</section>

<section>
  <h2>{{s|s041|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s042|}}</th><th>{{s|s043|}}</th><th>{{s|s044|}}</th></tr></thead>
    <tbody>
      <tr><td><b>A + B</b>, <b>A − B</b></td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr>
      <tr><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td></tr>
      <tr><td><b>A · B</b></td><td>{{s|s050|}}</td><td>{{s|s051|}}</td></tr>
      <tr><td>{{s|s052|}}</td><td>{{s|s053|}}</td><td>{{s|s054|}}</td></tr>
      <tr><td>{{s|s055|}}</td><td>{{s|s056|}}</td><td>{{s|s057|}}</td></tr>
      <tr><td>{{s|s058|}}</td><td>{{s|s059|}}</td><td>{{s|s060|}}</td></tr>
      <tr><td>{{s|s061|}}</td><td>{{s|s062|}}</td><td>{{s|s063|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s064|}}</p>
  <div class="box attenzione" data-tit="{{a|s065|}}">
    <p>{{s|s066|}}</p>
    <div class="tab-wrap"><table class="tab">
      <thead><tr><th>{{s|s067|}}</th><th>A + B</th><th>A · B</th></tr></thead>
      <tbody>
        <tr><td>(2 × 3) e (2 × 3)</td><td>{{s|s068|}}</td><td>{{s|s069|}}</td></tr>
        <tr><td>(2 × 3) e (3 × 2)</td><td>{{s|s070|}}</td><td>{{s|s071|}}</td></tr>
      </tbody>
    </table></div>
    <p>{{s|s072|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s073|}}">
    <p>{{s|s074|}}</p>
  </div>
  <p class="piccolo">{{s|s075|}}</p>
  <div class="box attenzione" data-tit="{{a|s076|}}">
    <p>{{s|s077|}}</p>
    <p>{{s|s078|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s079|}}">
    <p>{{s|s080|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s081|}}">
    <p>{{s|s082|}}</p>
  </div>
  <figure class="scena" data-scena="tabella" data-titolo="{{a|s083|}}"></figure>
</section>

<section>
  <h2>{{s|s084|}}</h2>
  <p>{{s|s085|}}</p>
  <div class="colonne">
    <div class="carta buona">
      <h4>{{s|s086|}}</h4>
      <p><span class="m">[[4, −4], [4, −1]] · (4, 2)</span></p>
      <p>{{s|s087|}}</p>
      <p>{{s|s088|}}</p>
    </div>
    <div class="carta cattiva">
      <h4>{{s|s089|}}</h4>
      <p>{{s|s090|}}</p>
      <p>{{s|s091|}}</p>
    </div>
  </div>
  <figure class="scena" data-scena="errore8" data-titolo="{{a|s092|}}"></figure>
</section>

<section>
  <h2>{{s|s093|}}</h2>
  <p>{{s|s094|}}</p>
  <figure class="codice" data-titolo="{{a|s095|}}">
<pre data-lang="python">import numpy as np
A = np.array([[1, 2, 3], [4, 5, 6]])
v = np.array([-1, -2, -3])
A.shape, v.shape             # ((2, 3), (3,))
A @ v                        # array([-14, -32])
v @ A                        # ValueError: matmul: ... (size 2 is different from 3)
A + np.array([[1, 2], [3, 4]])
# ValueError: operands could not be broadcast together with shapes (2,3) (2,2)
np.array([1, 2]) @ A         # array([ 9, 12, 15])</pre>
    <ol class="spiega">
      <li data-righe="2-4" data-segna="(2, 3)@ora|(3,)@dato"><p>{{s|s096|}}</p></li>
      <li data-righe="5" data-segna="A @ v@ok|array([-14, -32])@ok"><p>{{s|s097|}}</p></li>
      <li data-righe="6" data-segna="v @ A@no|(size 2 is different from 3)@no"><p>{{s|s098|}}</p></li>
      <li data-righe="7-8" data-segna="shapes (2,3) (2,2)@no"><p>{{s|s099|}}</p></li>
      <li data-righe="9" data-segna="np.array([1, 2]) @ A@ok"><p>{{s|s100|}}</p></li>
    </ol>
  </figure>
  <p class="piccolo">{{s|s101|}}</p>
  <figure class="scena" data-scena="numpyforme" data-titolo="{{a|s102|}}"></figure>
</section>

<section>
  <h2>{{s|s103|}}</h2>
  <p>{{s|s104|}}</p>
  <figure class="passi" data-titolo="{{a|s105|}}">
    <div class="passo"><div class="espr"><mark class="dato">X</mark>: N × d     <mark class="ora">w</mark>: d     <mark class="ok">y</mark>: N</div><p class="nota">{{s|s106|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">X</mark><mark class="ora">w</mark>: (N × <s>d</s>)(<s>d</s>) → <mark class="ok">N</mark></div><p class="nota">{{s|s107|}}</p></div>
    <div class="passo"><div class="espr">XᵀX: (d × <s>N</s>)(<s>N</s> × d) → <mark class="ora">d × d</mark></div><p class="nota">{{s|s108|}}</p></div>
    <div class="passo"><div class="espr">Xᵀy: (d × <s>N</s>)(<s>N</s>) → <mark class="ora">d</mark></div><p class="nota">{{s|s109|}}</p></div>
    <div class="passo"><div class="espr">(XᵀX)⁻¹ Xᵀy: (d × <s>d</s>)(<s>d</s>) → <mark class="ok">d</mark>  ✓</div><p class="nota">{{s|s110|}}</p></div>
  </figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s111|}}</th><th>{{s|s112|}}</th><th>{{s|s113|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s114|}}</td><td>{{s|s115|}}</td><td>(N × d)(d) → N</td></tr>
      <tr><td>{{s|s116|}}</td><td>T · [x, y, 1]</td><td>(3 × 3)(3) → 3</td></tr>
      <tr><td>{{s|s117|}}</td><td>XᵀX / N</td><td>(d × N)(N × d) → d × d</td></tr>
      <tr><td>{{s|s118|}}</td><td>Φᵀ(x − μ)</td><td>(k × d)(d) → k</td></tr>
      <tr><td>{{s|s119|}}</td><td>{{s|s120|}}</td><td>{{s|s121|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="catenaforme" data-titolo="{{a|s122|}}"></figure>
</section>

</main>
</body>
</html>
