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
  const G = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'griglia', x, y, cw: 44, ch: 32, valori: vals }, extra || {});
  const Q = [[0, 0], [1, 0], [1, 1], [0, 1]];

  // 1. affine = lineare + traslazione
  SCENE.affine1 = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 300, 220], dom: [-0.5, 4, -0.5, 2.5], tacche: 1 },
      { id: 'q0', tipo: 'poli', in: 'ax', punti: Q, tono: 'spento' },
      { id: 'q1', tipo: 'poli', in: 'ax', punti: Q, tono: 'ora', nascosto: true },
      { id: 'tt', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 1, t: 't = [2, 1]', tx: -30, ty: 18, tono: 'ok', nascosto: true },
      T('c1', 470, 60, 'p′ = A p + t', { bold: true }), T('c2', 470, 100, '', { size: 13 }), T('c3', 470, 130, '', { size: 13 }), T('c4', 470, 180, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "Una trasformazione <b>affine</b> è una trasformazione lineare seguita da una traslazione: <b>p′ = Ap + t</b>. A è una matrice 2 × 2, t un vettore di 2 numeri." },
      { nota: "Prima la parte lineare, A = [[1, 0.5], [0, 1]] (un taglio): il quadrato diventa un parallelogramma, ma l'origine resta ferma.", set: { q1: { nascosto: false, punti: [[0, 0], [1, 0], [1.5, 1], [0.5, 1]] }, c2: { t: 'A = [[1, 0.5], [0, 1]]' } } },
      { nota: "Poi la traslazione t = [2, 1]: tutto si sposta, origine compresa. Ora (0, 0) va in (2, 1).", set: { tt: { nascosto: false }, q1: { punti: [[2, 1], [3, 1], [3.5, 2], [2.5, 2]], tono: 'ok' }, c3: { t: 't = [2, 1]' } } },
      { nota: "Parametri: 4 in A più 2 in t, <b>6</b> in tutto. Le rette restano rette e le parallele restano parallele, come nelle lineari; cambia solo che l'origine si muove. È il modello dell'esercizio della settimana 5 (telecamera → mappa) e dell'Assignment 1.", set: { c4: { t: '4 + 2 = 6 parametri', tono: 'ok' } } }
    ]
  };

  // 2. coordinate omogenee: esercizio 12
  SCENE.omogenee = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      T('tm', 110, 26, 'T', { bold: true }), G('M', 44, 36, [['1', '0', '3'], ['0', '1', '−1'], ['0', '0', '1']]),
      G('p', 200, 36, [['1'], ['2'], ['1']]), T('tp', 222, 26, 'p', { bold: true }),
      T('e', 270, 88, '=', { size: 20, bold: true }),
      G('r', 290, 36, [[''], [''], ['']]),
      T('c1', 460, 60, '', { size: 13 }), T('c2', 460, 100, '', { size: 13 }), T('c3', 460, 140, '', { size: 13 }), T('c4', 300, 210, '', { bold: true })
    ],
    passi: [
      { nota: "Il problema: la traslazione non è un prodotto di matrici 2 × 2. Il trucco: al punto (1, 2) si <b>aggiunge una terza componente uguale a 1</b>: [1, 2, 1]. Sono le <b>coordinate omogenee</b>.", set: { p: { toni: { '2,0': 'due' } } } },
      { nota: "La matrice diventa 3 × 3: in alto a sinistra la parte lineare (qui l'identità), nella <b>terza colonna</b> la traslazione [3, −1], e l'ultima riga [0, 0, 1].", set: { M: { toni: { '0,2': 'ora', '1,2': 'ora' } }, c1: { t: 'terza colonna = traslazione' } } },
      { nota: "Riga 1 per p: 1·1 + 0·2 + 3·<b>1</b> = 4. La traslazione 3 è moltiplicata proprio dall'1 aggiunto: così entra nel prodotto.", set: { M: { toni: { '0,0': 'ora', '0,1': 'ora', '0,2': 'ora' } }, r: { valori: [['4'], [''], ['']], toni: { '0,0': 'ok' } }, c2: { t: '1 + 0 + 3·1 = 4' } } },
      { nota: "Riga 2: 0·1 + 1·2 + (−1)·1 = 1. Riga 3: 0 + 0 + 1 = 1: l'ultima componente resta sempre 1.", set: { M: { toni: { '1,0': 'ora', '1,1': 'ora', '1,2': 'ora' } }, r: { valori: [['4'], ['1'], ['1']], toni: { '0,0': 'ok', '1,0': 'ok', '2,0': 'due' } }, c3: { t: '0 + 2 − 1 = 1' } } },
      { nota: "Si leggono le prime due componenti: il punto è diventato <b>(4, 1)</b> = (1 + 3, 2 − 1). È l'esercizio 12 del test (controllato con NumPy).", set: { M: { toni: {} }, c4: { t: '(1, 2) traslato di (3, −1) = (4, 1)', tono: 'ok' } } }
    ]
  };

  // 3. comporre
  SCENE.componiaff = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 280, 230], dom: [-1, 4, -1, 4], tacche: 1 },
      { id: 'p', tipo: 'punto', in: 'ax', x: 1, y: 0, t: 'p = (1, 0)', tono: 'dato', ty: -12 },
      { id: 'm', tipo: 'punto', in: 'ax', x: 0, y: 1, t: '', tono: 'ora', nascosto: true },
      { id: 'f', tipo: 'punto', in: 'ax', x: 2, y: 1, t: '', tono: 'ok', nascosto: true },
      T('c1', 470, 50, '', { bold: true, size: 13 }), T('c2', 470, 90, '', { size: 13 }), T('c3', 470, 120, '', { size: 13 }), T('c4', 470, 170, '', { bold: true, size: 13 })
    ],
    passi: [
      { nota: "Con le coordinate omogenee ogni trasformazione affine è una matrice 3 × 3, e <b>comporre</b> è un prodotto: \"prima R, poi T\" = TR. Due trasformazioni: R = rotazione di 90°, T = traslazione di [2, 0]." },
      { nota: "<b>Prima R, poi T</b> (matrice TR): R porta (1, 0) in (0, 1)…", set: { m: { nascosto: false, t: 'R p = (0, 1)' }, c1: { t: 'TR: prima R, poi T' }, c2: { t: 'R p = (0, 1)' } } },
      { nota: "…poi T sposta di 2 a destra: (2, 1).", set: { f: { nascosto: false, t: 'T R p = (2, 1)' }, c3: { t: 'T(0, 1) = (2, 1)' } } },
      { nota: "<b>Prima T, poi R</b> (matrice RT): T porta (1, 0) in (3, 0)…", set: { m: { x: 3, y: 0, t: 'T p = (3, 0)', ty: -12, tx: -30 }, f: { nascosto: true }, c1: { t: 'RT: prima T, poi R' }, c2: { t: 'T p = (3, 0)' }, c3: { t: '' } } },
      { nota: "…poi R ruota attorno all'origine: (0, 3). Risultato diverso: TR ≠ RT. Con le omogenee una catena \"ruota, trasla, scala\" diventa un'unica matrice T₃T₂T₁, calcolata una volta (valori controllati).", set: { f: { nascosto: false, x: 0, y: 3, t: 'R T p = (0, 3)' }, c3: { t: 'R(3, 0) = (0, 3)' }, c4: { t: 'TR p = (2, 1) ≠ RT p = (0, 3)', tono: 'no' } } }
    ]
  };

  // 4. quante corrispondenze
  SCENE.quante = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [40, 20, 260, 230], dom: [-0.5, 3, -0.5, 3], tacche: 1 },
      { id: 'a', tipo: 'punto', in: 'ax', x: 0, y: 0, t: '(0, 0)', tono: 'dato' },
      { id: 'b', tipo: 'punto', in: 'ax', x: 1, y: 0, t: '(1, 0)', tono: 'dato', nascosto: true },
      { id: 'c', tipo: 'punto', in: 'ax', x: 0, y: 1, t: '(0, 1)', tono: 'dato', nascosto: true },
      T('c1', 450, 50, '6 incognite: w₁ … w₆', { bold: true, size: 13 }),
      T('c2', 450, 90, '1 punto → 2 equazioni', { size: 13 }), T('c3', 450, 120, '', { size: 13 }), T('c4', 450, 160, '', { size: 13, bold: true }), T('c5', 450, 200, '', { size: 13 })
    ],
    passi: [
      { nota: "Una trasformazione affine del piano ha 6 parametri. Una corrispondenza (x, y) → (x′, y′) dà <b>2</b> equazioni, una per x′ e una per y′." },
      { nota: "Con 2 punti: 4 equazioni per 6 incognite. Non basta: infinite trasformazioni rispettano le due corrispondenze.", set: { b: { nascosto: false }, c3: { t: '2 punti → 4 equazioni: poche', tono: 'no' } } },
      { nota: "Con <b>3</b> punti <b>non allineati</b>: 6 equazioni per 6 incognite, e la design matrix 6 × 6 ha rango 6. Soluzione unica.", set: { c: { nascosto: false }, c3: { t: '3 punti → 6 equazioni' }, c4: { t: 'rango 6: soluzione unica', tono: 'ok' } } },
      { nota: "Attenzione ai punti <b>allineati</b>, per esempio (0, 0), (1, 1), (2, 2): anche se sono 3, la design matrix ha rango 4, non 6. Non dicono niente su cosa succede \"di lato\" alla retta, e la trasformazione non è determinata (rango calcolato con NumPy).", set: { b: { x: 1, y: 1, t: '(1, 1)' }, c: { x: 2, y: 2, t: '(2, 2)', tono: 'no' }, c4: { t: 'allineati: rango 4', tono: 'no' }, c5: { t: 'servono punti "sparsi"' } } }
    ]
  };

  // 5. imparare w (scena originale)
  const S = [[0, 0], [1, 0], [0, 1]], D = [[1, -1], [3, -1], [1.5, 0]];
  const ogg = [{ id: 'ax', tipo: 'assi', box: [40, 15, 330, 220], dom: [-0.5, 6.5, -1.5, 3], tacche: 1 }];
  ogg.push({ id: 'src', tipo: 'poli', in: 'ax', punti: S, tono: 'dato' });
  ogg.push({ id: 'dst', tipo: 'poli', in: 'ax', punti: D, tono: 'ok', nascosto: true });
  S.forEach((p, i) => ogg.push({ id: 's' + i, tipo: 'punto', in: 'ax', x: p[0], y: p[1], t: `(${p[0]}, ${p[1]})`, tono: 'dato' }));
  D.forEach((p, i) => ogg.push({ id: 'd' + i, tipo: 'punto', in: 'ax', x: p[0], y: p[1], t: `(${p[0]}, ${p[1]})`, tono: 'ok', tx: i === 2 ? 14 : 9, ty: i === 2 ? -26 : 16, nascosto: true }));
  S.forEach((p, i) => ogg.push({ id: 'f' + i, tipo: 'linea', in: 'ax', x1: p[0], y1: p[1], x2: D[i][0], y2: D[i][1], tratt: true, tono: 'spento', nascosto: true }));
  ogg.push({ id: 'nuovo', tipo: 'punto', in: 'ax', x: 2, y: 2, t: '(2, 2)', tono: 'due', nascosto: true });
  ogg.push({ id: 'imm', tipo: 'punto', in: 'ax', x: 6, y: 1, t: '(6, 1)', tono: 'due', nascosto: true });
  ogg.push({ id: 'fn', tipo: 'linea', in: 'ax', x1: 2, y1: 2, x2: 6, y2: 1, tratt: true, tono: 'due', nascosto: true });
  ogg.push({ id: 'n', tipo: 'testo', x: 200, y: 262, t: '', size: 13, bold: true });
  SCENE.aff = {
    w: 400, h: 275, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: ogg,
    passi: [
      { nota: '{{j|s007|'}}' },
      { nota: '{{j|s008|'}}', set: { dst: { nascosto: false }, d0: { nascosto: false }, d1: { nascosto: false }, d2: { nascosto: false }, f0: { nascosto: false }, f1: { nascosto: false }, f2: { nascosto: false } } },
      { nota: '{{j|s009|'}}', set: { n: { t: 'x\' = 2x + 0.5y + 1     y\' = y − 1', tono: 'ok' } } },
      { nota: '{{j|s010|'}}', set: { nuovo: { nascosto: false }, imm: { nascosto: false }, fn: { nascosto: false } } }
    ]
  };

  // 6. più corrispondenze rumorose
  const src5 = [[0, 0], [1, 0], [0, 1], [2, 1], [1, 2]];
  const dst5 = [[1.0, -0.98], [2.98, -1.07], [1.46, -0.08], [5.5, 0.11], [3.96, 0.95]];
  const og6 = [{ id: 'ax', tipo: 'assi', box: [40, 20, 300, 220], dom: [-0.5, 6.5, -1.5, 2.5], tacche: 1 }];
  src5.forEach((p, i) => og6.push({ id: 's' + i, tipo: 'punto', in: 'ax', x: p[0], y: p[1], t: '', tono: 'dato' }));
  dst5.forEach((p, i) => og6.push({ id: 'd' + i, tipo: 'punto', in: 'ax', x: p[0], y: p[1], t: '', tono: 'no', nascosto: true }));
  src5.forEach((p, i) => og6.push({ id: 'f' + i, tipo: 'linea', in: 'ax', x1: p[0], y1: p[1], x2: dst5[i][0], y2: dst5[i][1], tratt: true, tono: 'spento', nascosto: true }));
  og6.push(T('c1', 470, 50, '', { size: 13, bold: true }), T('c2', 470, 90, '', { size: 12 }), T('c3', 470, 116, '', { size: 12 }), T('c4', 470, 160, '', { size: 13 }), T('c5', 470, 200, '', { size: 13, bold: true }));
  SCENE.rumorose = {
    w: 620, h: 262, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: og6,
    passi: [
      { nota: "Nell'esercizio vero le corrispondenze si <b>cliccano a mano</b>: ogni punto ha un piccolo errore. Qui 5 punti di partenza…" },
      { nota: "…e le loro posizioni misurate, un po' spostate rispetto alla trasformazione vera (x′ = 2x + 0.5y + 1, y′ = y − 1).", set: Object.assign({ c1: { t: '5 corrispondenze → 10 equazioni' } }, Object.fromEntries(dst5.map((_, i) => ['d' + i, { nascosto: false }])), Object.fromEntries(src5.map((_, i) => ['f' + i, { nascosto: false }]))) },
      { nota: "10 equazioni, 6 incognite, e per il rumore nessun w le rispetta tutte: sistema <b>sovradeterminato</b>. Si usa lo stesso codice di prima: <code>lstsq</code> dà il w dei minimi quadrati.", set: { c2: { t: 'stimato: [2.01, 0.48, 0.98,' }, c3: { t: '0.06, 0.98, −1.05]' } } },
      { nota: "La stima è vicina ai valori veri [2, 0.5, 1, 0, 1, −1], e (2, 2) finisce in (5.97, 1.03) invece di (6, 1). Più corrispondenze = errori che si compensano = stima più affidabile (numeri calcolati con NumPy su dati simulati).", set: { c4: { t: 'vero: [2, 0.5, 1, 0, 1, −1]' }, c5: { t: '(2, 2) → (5.97, 1.03)', tono: 'ok' } } }
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
  <p>{{s|s016|}}</p>
  <p>{{s|s017|}}</p>
  <figure class="scena" data-scena="affine1" data-titolo="{{a|s018|}}"></figure>
</section>

<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <figure class="passi" data-titolo="{{a|s021|}}">
    <div class="passo"><div class="espr">p' = <mark class="dato">A</mark> p + <mark class="ora">t</mark>     A 2 × 2, t = [t₁, t₂]</div><p class="nota">{{s|s022|}}</p></div>
    <div class="passo"><div class="espr">p = [x, y]  →  <mark class="due">[x, y, 1]</mark></div><p class="nota">{{s|s023|}}</p></div>
    <div class="passo"><div class="espr">[x', y', 1] = [[<mark class="dato">w₁, w₂</mark>, <mark class="ora">w₃</mark>], [<mark class="dato">w₄, w₅</mark>, <mark class="ora">w₆</mark>], [0, 0, 1]] · [x, y, <mark class="due">1</mark>]</div><p class="nota">{{s|s024|}}</p></div>
    <div class="passo"><div class="espr">x' = w₁x + w₂y + w₃     y' = w₄x + w₅y + w₆</div><p class="nota">{{s|s025|}}</p></div>
  </figure>
  <p>{{s|s026|}}</p>
  <figure class="scena" data-scena="omogenee" data-titolo="{{a|s027|}}"></figure>
</section>

<section>
  <h2>{{s|s028|}}</h2>
  <p>{{s|s029|}}</p>
  <div class="box regola" data-tit="{{a|s030|}}">
    <p>{{s|s031|}}</p>
  </div>
  <p>{{s|s032|}}</p>
  <figure class="scena" data-scena="componiaff" data-titolo="{{a|s033|}}"></figure>
</section>

<section>
  <h2>{{s|s034|}}</h2>
  <p>{{s|s035|}}</p>
  <p>{{s|s036|}}</p>
  <figure class="scena" data-scena="quante" data-titolo="{{a|s037|}}"></figure>
</section>

<section>
  <h2>{{s|s038|}}</h2>
  <p>{{s|s039|}}</p>
  <figure class="passi" data-titolo="{{a|s040|}}">
    <div class="passo"><div class="espr">{{s|s041|}}</div><p class="nota">{{s|s042|}}</p></div>
    <div class="passo"><div class="espr">n corrispondenze ⇒ <mark class="ora">A</mark> (2n × 6) · <mark class="ora">w</mark> = <mark class="ok">b</mark> (2n)</div><p class="nota">{{s|s043|}}</p></div>
    <div class="passo"><div class="espr">{{s|s044|}}</div><p class="nota">{{s|s045|}}</p></div>
  </figure>
  <figure class="codice" data-titolo="{{a|s046|}}">
<pre data-lang="python">rows, b = [], []
for (x, y), (xp, yp) in zip(src, dst):
    rows.append([x, y, 1, 0, 0, 0]); b.append(xp)
    rows.append([0, 0, 0, x, y, 1]); b.append(yp)
A = np.array(rows, dtype=float)
w = np.linalg.lstsq(A, np.array(b), rcond=None)[0]
T = np.array([[w[0], w[1], w[2]],
              [w[3], w[4], w[5]],
              [0,    0,    1   ]])
T @ np.array([2, 2, 1])        # array([6., 1., 1.])</pre>
    <ol class="spiega">
      <li data-righe="1-4" data-segna="[x, y, 1, 0, 0, 0]@dato|[0, 0, 0, x, y, 1]@dato|zip(src, dst)@ora"><p>{{s|s047|}}</p></li>
      <li data-righe="5-6" data-segna="np.linalg.lstsq@ok"><p>{{s|s048|}}</p></li>
      <li data-righe="7-9" data-segna="[0,    0,    1   ]@due"><p>{{s|s049|}}</p></li>
      <li data-righe="10" data-segna="[2, 2, 1]@due"><p>{{s|s050|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="aff" data-titolo="{{a|s051|}}"></figure>
</section>

<section>
  <h2>{{s|s052|}}</h2>
  <p>{{s|s053|}}</p>
  <div class="box esame" data-tit="{{a|s054|}}">
    <p>{{s|s055|}}</p>
  </div>
  <figure class="scena" data-scena="rumorose" data-titolo="{{a|s056|}}"></figure>
</section>

</main>
</body>
</html>
