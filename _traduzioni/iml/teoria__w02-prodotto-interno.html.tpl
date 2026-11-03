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
  const C = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 60, valori: vals, indici: false }, extra || {});
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 14 }, extra || {});
  const assi = () => ({ id: 'ax', tipo: 'assi', box: [40, 20, 260, 230], dom: [-2.5, 4.5, -1, 4], tacche: 1, etX: 'x₁', etY: 'x₂' });

  // 1. definizione algebrica
  SCENE.defdot = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      T('tu', 40, 57, 'u', { bold: true, size: 15 }), C('u', 70, 40, ['4', '2'], { toni: { 0: 'dato', 1: 'dato' } }),
      T('tw', 40, 117, 'w', { bold: true, size: 15 }), C('w', 70, 100, ['1', '3'], { toni: { 0: 'due', 1: 'due' } }),
      T('tp', 40, 177, 'uᵢwᵢ', { bold: true, size: 13, nascosto: true }), C('p', 70, 160, ['4', '6'], { nascosto: true, toni: { 0: 'ora', 1: 'ora' } }),
      T('s1', 400, 90, '', { bold: true }), T('s2', 400, 130, '', { bold: true, size: 16 })
    ],
    passi: [
      { nota: "Due vettori della <b>stessa dimensione</b>: u = [4, 2] e w = [1, 3]." },
      { nota: "Si moltiplicano le componenti <b>nella stessa posizione</b>: 4·1 = 4 e 2·3 = 6.", set: { tp: { nascosto: false }, p: { nascosto: false }, s1: { t: 'u₁w₁ = 4,   u₂w₂ = 6' } } },
      { nota: "Si sommano i prodotti: 4 + 6 = <b>10</b>. Entrano due vettori, esce <b>un numero</b> (uno scalare): per questo in inglese si chiama anche <i>scalar product</i>.", set: { s2: { t: 'u · w = 4 + 6 = 10', tono: 'ok' } } }
    ]
  };

  // 2. formula geometrica
  SCENE.angolo = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      assi(),
      { id: 'u', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 4, y2: 2, t: 'u = [4, 2]', tono: 'dato' },
      { id: 'w', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 3, t: 'w = [1, 3]', tono: 'due' },
      { id: 'th', tipo: 'testo', in: 'ax', x: 1.1, y: 1.1, t: '', size: 14, bold: true, tono: 'ok' },
      T('a', 480, 60, ''), T('b', 480, 90, ''), T('c', 480, 130, '', { bold: true }), T('d', 480, 170, '', { bold: true })
    ],
    passi: [
      { nota: "Lo stesso numero si ottiene dalla geometria: <b>u · w = ‖u‖ ‖w‖ cos θ</b>, dove θ (theta) è l'angolo fra le due frecce e cos il suo coseno." },
      { nota: "Le lunghezze: ‖u‖ = √(16 + 4) = √20 ≈ 4.472 e ‖w‖ = √(1 + 9) = √10 ≈ 3.162.", set: { a: { t: '‖u‖ = √20 ≈ 4.472' }, b: { t: '‖w‖ = √10 ≈ 3.162' } } },
      { nota: "Si ricava il coseno: cos θ = (u · w) / (‖u‖ ‖w‖) = 10 / √200 ≈ 0.707.", set: { c: { t: 'cos θ = 10 / √200 ≈ 0.707', tono: 'ok' } } },
      { nota: "Il coseno 0.707 corrisponde a <b>θ = 45°</b> (calcolato con <code>np.arccos</code>). Le due formule dicono la stessa cosa: una si calcola con le componenti, l'altra si legge nel disegno.", set: { th: { t: 'θ = 45°' }, d: { t: 'θ = 45°', tono: 'ok' } } }
    ]
  };

  // 3. segno e ortogonalità
  const prova = (x, y, dot, ang, tono, nota) => ({ nota, set: { w: { x2: x, y2: y, t: 'w = [' + x + ', ' + y + ']', tono }, d: { t: 'u · w = ' + dot, tono }, a: { t: 'θ = ' + ang } } });
  SCENE.segno = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [
      assi(),
      { id: 'u', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 4, y2: 2, t: 'u = [4, 2]', tono: 'dato' },
      { id: 'w', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 3, t: 'w = [1, 3]', tono: 'ok' },
      T('d', 480, 70, 'u · w = 10', { bold: true, size: 16, tono: 'ok' }), T('a', 480, 104, 'θ = 45°'), T('r', 480, 150, '', { size: 13 })
    ],
    passi: [
      prova(1, 3, 10, '45°', 'ok', "Angolo <b>acuto</b> (meno di 90°): il coseno è positivo, e il prodotto interno è <b>positivo</b>. I due vettori \"vanno dalla stessa parte\"."),
      prova(-1, 2, 0, '90°', 'ora', "w = [−1, 2]: −4 + 4 = <b>0</b>. L'angolo è di 90°, cos 90° = 0. <b>Prodotto interno zero ⇔ vettori perpendicolari</b>, che in algebra lineare si dice <b>ortogonali</b> (slide 47)."),
      prova(-2, 1, -6, '≈ 126.9°', 'no', "w = [−2, 1]: −8 + 2 = <b>−6</b>. Angolo ottuso (più di 90°): il coseno è negativo, il prodotto interno anche. I vettori \"vanno in versi opposti\"."),
      { nota: "Riassunto: il segno di u · w dice da che parte sta w rispetto alla retta perpendicolare a u. Questo è il cuore del <b>classificatore lineare</b> (settimana 10): il segno di w · x decide la classe.", set: { r: { t: '>0 acuto, =0 retto, <0 ottuso', size: 12 } } }
    ]
  };

  // 4. similarità del coseno
  const cs = (x, y, c, tono, nota) => ({ nota, set: { z: { x2: x, y2: y, t: '[' + x + ', ' + y + ']', tono, nascosto: false }, c: { t: 'cos = ' + c, tono } } });
  SCENE.coseno = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [60, 20, 300, 230], dom: [-3, 4, -3.5, 6.5], tacche: 1, numeri: false, etX: 'x₁', etY: 'x₂' },
      { id: 'w', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 3, t: 'w', tx: -20, tono: 'dato' },
      { id: 'z', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 6, t: '', tono: 'ok', nascosto: true },
      T('f', 480, 50, 'cos θ = (a · b) / (‖a‖ ‖b‖)', { size: 13, bold: true }),
      T('c', 480, 100, '', { size: 16, bold: true }), T('n', 480, 140, '', { size: 13 })
    ],
    passi: [
      { nota: "La <b>similarità del coseno</b> (<i>cosine similarity</i>) è il coseno dell'angolo: il prodotto interno diviso per le due lunghezze. Misura quanto due vettori <b>puntano</b> nella stessa direzione, ignorando quanto sono lunghi." },
      cs(2, 6, 1, 'ok', "[2, 6] è lungo il doppio di w, ma punta uguale: cos = 20 / (√10 · √40) = <b>1</b>. Massima somiglianza."),
      cs(3, -1, 0, 'ora', "[3, −1] è perpendicolare a w: cos = 0. Nessuna somiglianza di direzione."),
      cs(-1, -3, -1, 'no', "[−1, −3] punta al contrario: cos = <b>−1</b>. Valori sempre fra −1 e 1 (controllati con NumPy)."),
      { nota: "Perché serve: due documenti, due immagini o due pose possono avere \"intensità\" diverse (più parole, più luce) ma lo stesso contenuto. Il coseno li confronta per direzione. La distanza euclidea invece conta anche la lunghezza.", set: { n: { t: 'conta solo la direzione' } } }
    ]
  };

  // 5. proiezione (scena originale adattata)
  SCENE.proiezione = {
    w: 520, h: 290, lato: true,
    legenda: '{{j|s006|'}}',
    codice: { lang: 'python', testo: `u = np.array([4, 2])
w = np.array([1, 3])
c = (u @ w) / (u @ u)   # 10 / 20 = 0.5
proj = c * u            # [2., 1.]
resto = w - proj        # [-1., 2.]
resto @ u               # 0.0` },
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [70, 20, 300, 250], dom: [-1.2, 4.8, 0, 5], tacche: 1 },
      { id: 'u', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 4, y2: 2, t: 'u = [4, 2]', tono: 'dato' },
      { id: 'w', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 3, t: 'w = [1, 3]', tono: 'due' },
      { id: 'pr', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 1, t: '[2, 1]', tono: 'ok', nascosto: true },
      { id: 'perp', tipo: 'linea', in: 'ax', x1: 1, y1: 3, x2: 2, y2: 1, tratt: true, nascosto: true },
      { id: 're', tipo: 'vett', in: 'ax', x1: 2, y1: 1, x2: 1, y2: 3, t: 'resto', tx: -48, ty: 4, tono: 'no', nascosto: true }
    ],
    passi: [
      { nota: "La <b>proiezione</b> di w sulla direzione di u è \"l'ombra\" di w su u, se la luce arriva perpendicolare a u (slide 46).", righe: [1, 2] },
      { nota: "Quanto è lunga l'ombra, in unità di u: c = (u · w) / (u · u) = 10 / 20 = 0.5. Il denominatore u · u = ‖u‖² serve a non dipendere dalla lunghezza di u.", righe: [3] },
      { nota: "La proiezione è c volte u: 0.5 · [4, 2] = <b>[2, 1]</b>. Il tratteggio da w è perpendicolare a u.", righe: [4], set: { pr: { nascosto: false }, perp: { nascosto: false } } },
      { nota: "Quello che resta, w − proiezione = [−1, 2], è <b>perpendicolare</b> a u: [−1, 2] · [4, 2] = 0. Ogni vettore si divide così in una parte lungo u e una parte ortogonale. È esattamente l'idea dei minimi quadrati: la previsione è una proiezione, il residuo è ortogonale (<a href=\"w05-minimi-quadrati.html\">settimana 5</a>).", righe: [5, 6], set: { perp: { nascosto: true }, re: { nascosto: false } } }
    ]
  };

  // 6. lunghezza e distanza dal prodotto interno
  SCENE.dadot = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [
      T('t0', 300, 30, 'a = [4, 2],  b = [1, 3]', { bold: true }),
      T('l1', 300, 70, ''), T('l2', 300, 100, ''), T('l3', 300, 130, ''),
      T('l4', 300, 175, '', { bold: true }), T('l5', 300, 210, '', { bold: true, size: 15 })
    ],
    passi: [
      { nota: "Lunghezza e distanza si possono calcolare usando <b>solo prodotti interni</b>. È il legame chiesto dagli obiettivi della settimana 1: \"explain the relation of the Euclidean distance to the inner product\"." },
      { nota: "<b>Lunghezza</b>: v · v = v₁² + v₂² + … è proprio la somma dei quadrati, quindi ‖v‖ = √(v · v). Per a: a · a = 16 + 4 = 20.", set: { l1: { t: 'a · a = 20  →  ‖a‖ = √20', tono: 'dato' } } },
      { nota: "Per b: b · b = 1 + 9 = 10. E il prodotto misto a · b = 10.", set: { l2: { t: 'b · b = 10', tono: 'dato' }, l3: { t: 'a · b = 10', tono: 'dato' } } },
      { nota: "<b>Distanza</b>: sviluppando (a − b) · (a − b) come un quadrato di binomio: ‖a − b‖² = a · a + b · b − 2 a · b.", set: { l4: { t: '‖a − b‖² = a·a + b·b − 2 a·b' } } },
      { nota: "Con i numeri: 20 + 10 − 2·10 = 10, quindi d = √10 ≈ 3.162. Controllo diretto: a − b = [3, −1], e 9 + 1 = 10 ✓. Se a · b è grande (vettori simili) la distanza è piccola.", set: { l5: { t: '20 + 10 − 20 = 10  →  d = √10 ≈ 3.162', tono: 'ok' } } }
    ]
  };

  // 7. il modello come prodotto interno (notazione grafica, slide 16 lezione 2)
  const nodo = (id, x, y, t, tono) => ({ id, tipo: 'nodo', x, y, t, tono });
  SCENE.neurone = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [
      nodo('x1', 90, 50, '2', 'dato'), nodo('x2', 90, 130, '1', 'dato'), nodo('x3', 90, 210, '3', 'dato'),
      { id: 'e1', tipo: 'testo', x: 50, y: 50, t: 'x₁', size: 13 }, { id: 'e2', tipo: 'testo', x: 50, y: 130, t: 'x₂', size: 13 }, { id: 'e3', tipo: 'testo', x: 50, y: 210, t: 'x₃', size: 13 },
      nodo('y', 330, 130, 'y'),
      { id: 'a1', tipo: 'arco', da: 'x1', a: 'y', dir: true, t: 'w₁' }, { id: 'a2', tipo: 'arco', da: 'x2', a: 'y', dir: true, t: 'w₂' }, { id: 'a3', tipo: 'arco', da: 'x3', a: 'y', dir: true, t: 'w₃' },
      T('c1', 480, 90, '', { size: 13 }), T('c2', 480, 130, '', { size: 13 }), T('c3', 480, 175, '', { bold: true, size: 15 })
    ],
    passi: [
      { nota: "La <b>notazione grafica</b> del prodotto interno (slide 16 della lezione 2): un nodo per ogni ingresso, un arco verso l'uscita y. \"Edges: multiply input by weight. Node y: weighted sum.\"" },
      { nota: "Su ogni arco c'è un <b>peso</b>: w = [0.5, 2, −1]. L'arco moltiplica il suo ingresso per il peso.", set: { a1: { t: 'w₁ = 0.5', tono: 'ora' }, a2: { t: 'w₂ = 2', tono: 'ora' }, a3: { t: 'w₃ = −1', tono: 'ora' }, c1: { t: '0.5·2 = 1,  2·1 = 2,  −1·3 = −3' } } },
      { nota: "Il nodo y <b>somma</b> tutto quello che arriva: 1 + 2 − 3 = 0. È esattamente w · x.", set: { y: { t: '0', tono: 'ok' }, c2: { t: 'y = 1 + 2 − 3' }, c3: { t: 'y = w · x = 0', tono: 'ok' } } },
      { nota: "Questo disegno è un <b>neurone</b> senza funzione di attivazione, e il modello lineare di regressione. Imparare il modello = trovare i pesi sugli archi (settimane 3–5), e una rete neurale è tanti di questi nodi in fila (settimana 14)." }
    ]
  };

  // 8. polinomio come prodotto interno
  SCENE.polidot = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      T('tx', 60, 57, 'φ(x)', { bold: true }), C('f', 100, 40, ['1', '2', '4', '8'], { etichette: ['x⁰', 'x¹', 'x²', 'x³'] }),
      T('tw', 60, 127, 'w', { bold: true }), C('w', 100, 110, ['1', '2', '−1', '0.5'], { toni: { 0: 'due', 1: 'due', 2: 'due', 3: 'due' } }),
      T('tp', 60, 197, 'prodotti', { size: 12, nascosto: true }), C('p', 100, 180, ['1', '4', '−4', '4'], { nascosto: true, toni: { 0: 'ora', 1: 'ora', 2: 'ora', 3: 'ora' } }),
      T('s1', 470, 80, '', { size: 13 }), T('s2', 470, 130, '', { bold: true, size: 15 })
    ],
    passi: [
      { nota: "Un polinomio di grado 3, y = w₀ + w₁x + w₂x² + w₃x³, sembra non lineare. Il trucco (slide 49 della lezione 1): si mettono le <b>potenze di x</b> in un vettore di feature φ(x) = [1, x, x², x³]." },
      { nota: "Con x = 2: φ(2) = [1, 2, 4, 8]. Le potenze si calcolano prima, dai dati: sono numeri noti.", set: { f: { toni: { 0: 'dato', 1: 'dato', 2: 'dato', 3: 'dato' } }, s1: { t: 'φ(2) = [1, 2, 4, 8]' } } },
      { nota: "Con i pesi w = [1, 2, −1, 0.5], i prodotti a coppie: 1, 4, −4, 4.", set: { tp: { nascosto: false }, p: { nascosto: false } } },
      { nota: "La somma è y = 5: un <b>prodotto interno</b> w · φ(x). Il polinomio non è lineare in x, ma è <b>lineare nei pesi</b> w: per questo si impara con gli stessi metodi della retta (<a href=\"w04-polinomi.html\">polinomi</a>).", set: { s2: { t: 'y = w · φ(2) = 5', tono: 'ok' } } }
    ]
  };

  // 9. NumPy: @ contro *
  SCENE.numpydot = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      T('ta', 40, 47, 'a', { bold: true }), C('a', 70, 30, ['1', '2', '3'], { toni: { 0: 'dato', 1: 'dato', 2: 'dato' } }),
      T('tb', 40, 107, 'b', { bold: true }), C('b', 70, 90, ['2', '0', '1'], { toni: { 0: 'due', 1: 'due', 2: 'due' } }),
      T('tm', 40, 167, 'a * b', { size: 12, nascosto: true }), C('m', 70, 150, ['2', '0', '3'], { nascosto: true, toni: { 0: 'no', 1: 'no', 2: 'no' } }),
      T('r1', 420, 60, '', { bold: true }), T('r2', 420, 110, '', { bold: true, size: 16 })
    ],
    passi: [
      { nota: "In NumPy due operatori sembrano simili e non lo sono." },
      { nota: "<code>a * b</code> moltiplica <b>elemento per elemento</b> e restituisce un <b>vettore</b>: [2, 0, 3]. Non è il prodotto interno.", set: { tm: { nascosto: false }, m: { nascosto: false }, r1: { t: 'a * b = [2 0 3]', tono: 'no' } } },
      { nota: "<code>a @ b</code> (o <code>np.dot(a, b)</code>) è il prodotto interno: i prodotti <b>e poi la somma</b>, 2 + 0 + 3 = 5. Un numero. Equivale a <code>np.sum(a * b)</code>.", set: { r2: { t: 'a @ b = 5', tono: 'ok' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s011|}}</h1>
  <p class="lede">{{s|s012|}}</p>
</header>

<section>
  <h2>{{s|s013|}}</h2>
  <p>{{s|s014|}}</p>
  <div class="box regola" data-tit="{{a|s015|}}">
    <p>{{s|s016|}}</p>
  </div>
  <p>{{s|s017|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s018|}}</th><th>{{s|s019|}}</th><th>{{s|s020|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s021|}}</td><td><span class="m">‖v‖ = √(v · v)</span></td><td>{{s|s022|}}</td></tr>
      <tr><td>{{s|s023|}}</td><td>{{s|s024|}}</td><td>{{s|s025|}}</td></tr>
      <tr><td>{{s|s026|}}</td><td><span class="m">u · w = 0</span></td><td>{{s|s027|}}</td></tr>
      <tr><td>{{s|s028|}}</td><td><span class="m">(u · w / u · u) u</span></td><td>{{s|s029|}}</td></tr>
      <tr><td>{{s|s030|}}</td><td><span class="m">y = w · x</span></td><td>{{s|s031|}}</td></tr>
      <tr><td>{{s|s032|}}</td><td><span class="m">w · x = b</span></td><td>{{s|s033|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="defdot" data-titolo="{{a|s034|}}"></figure>
</section>

<section>
  <h2>{{s|s035|}}</h2>
  <p>{{s|s036|}}</p>
  <div class="mblock"><span class="m">u · w = ‖u‖ ‖w‖ cos θ</span></div>
  <p>{{s|s037|}}</p>
  <p>{{s|s038|}}</p>
  <figure class="scena" data-scena="angolo" data-titolo="{{a|s039|}}"></figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <p>{{s|s041|}}</p>
  <p>{{s|s042|}}</p>
  <p>{{s|s043|}}</p>
  <figure class="scena" data-scena="segno" data-titolo="{{a|s044|}}"></figure>
</section>

<section>
  <h2>{{s|s045|}}</h2>
  <p>{{s|s046|}}</p>
  <p>{{s|s047|}}</p>
  <p>{{s|s048|}}</p>
  <figure class="scena" data-scena="coseno" data-titolo="{{a|s049|}}"></figure>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <p>{{s|s051|}}</p>
  <div class="mblock"><span class="m">proj<sub>u</sub>(w) = (u · w / u · u) · u</span></div>
  <p>{{s|s052|}}</p>
  <p>{{s|s053|}}</p>
  <figure class="scena" data-scena="proiezione" data-titolo="{{a|s054|}}"></figure>
</section>

<section>
  <h2>{{s|s055|}}</h2>
  <p>{{s|s056|}}</p>
  <p>{{s|s057|}}</p>
  <div class="mblock"><span class="m">‖a − b‖² = a · a + b · b − 2 a · b</span></div>
  <p>{{s|s058|}}</p>
  <figure class="scena" data-scena="dadot" data-titolo="{{a|s059|}}"></figure>
</section>

<section>
  <h2>{{s|s060|}}</h2>
  <p>{{s|s061|}}</p>
  <p>{{s|s062|}}</p>
  <figure class="passi" data-titolo="{{a|s063|}}">
    <div class="passo"><div class="espr">input x = [<mark class="dato">x₁</mark>, <mark class="dato">x₂</mark>, <mark class="dato">x₃</mark>]    pesi w = [<mark class="ora">w₁</mark>, <mark class="ora">w₂</mark>, <mark class="ora">w₃</mark>]</div><p class="nota">{{s|s064|}}</p></div>
    <div class="passo"><div class="espr">y = <mark class="ora">w₁</mark><mark class="dato">x₁</mark> + <mark class="ora">w₂</mark><mark class="dato">x₂</mark> + <mark class="ora">w₃</mark><mark class="dato">x₃</mark> = <mark class="ok">w · x</mark></div><p class="nota">{{s|s065|}}</p></div>
    <div class="passo"><div class="espr">{{s|s066|}}</div><p class="nota">{{s|s067|}}</p></div>
  </figure>
  <figure class="scena" data-scena="neurone" data-titolo="{{a|s068|}}"></figure>
</section>

<section>
  <h2>{{s|s069|}}</h2>
  <p>{{s|s070|}}</p>
  <div class="mblock"><span class="m">y = w₀ + w₁x + w₂x² + w₃x³ = [w₀, w₁, w₂, w₃] · [1, x, x², x³]</span></div>
  <p>{{s|s071|}}</p>
  <figure class="scena" data-scena="polidot" data-titolo="{{a|s072|}}"></figure>
</section>

<section>
  <h2>{{s|s073|}}</h2>
  <figure class="codice" data-titolo="{{a|s074|}}">
<pre data-lang="python">a = np.array([1, 2, 3])
b = np.array([2, 0, 1])
np.dot(a, b)      # 5
a @ b             # 5
np.sum(a * b)     # 5
a * b             # array([2, 0, 3])  (non è il prodotto interno)</pre>
    <ol class="spiega">
      <li data-righe="3-4" data-segna="np.dot(a, b)@ok|a @ b@ok"><p>{{s|s075|}}</p></li>
      <li data-righe="5" data-segna="a * b@due|np.sum@ok"><p>{{s|s076|}}</p></li>
      <li data-righe="6" data-segna="a * b@no"><p>{{s|s077|}}</p></li>
    </ol>
  </figure>
  <p class="piccolo">{{s|s078|}}</p>
  <figure class="scena" data-scena="numpydot" data-titolo="{{a|s079|}}"></figure>
</section>

</main>
</body>
</html>
