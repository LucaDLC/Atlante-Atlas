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
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});

  // 1. due direzioni
  SCENE.direzioni = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      R('mo', 220, 90, 160, 50, 'y = w · x'),
      { id: 'ta', tipo: 'testo', x: 300, y: 20, t: '', size: 13, bold: true },
      R('iw', 20, 60, 120, 36, 'w = 3', { tono: 'dato', nascosto: true }), R('ix', 20, 134, 120, 36, 'x = 4', { tono: 'dato', nascosto: true }),
      F('a1', 142, 78, 218, 105, '', { nascosto: true }), F('a2', 142, 152, 218, 125, '', { nascosto: true }),
      F('a3', 382, 115, 458, 115, '', { nascosto: true }), R('oy', 460, 97, 120, 36, 'y = 12', { tono: 'ok', nascosto: true }),
      R('by', 460, 60, 120, 36, 'y = 12', { tono: 'dato', nascosto: true }), R('bx', 460, 134, 120, 36, 'x = 4', { tono: 'dato', nascosto: true }),
      F('b1', 458, 78, 382, 105, '', { nascosto: true }), F('b2', 458, 152, 382, 125, '', { nascosto: true }),
      F('b3', 218, 115, 142, 115, '', { nascosto: true }), R('ow', 20, 97, 120, 36, 'w = 12 / 4 = 3', { tono: 'ok', nascosto: true }),
      { id: 'tb', tipo: 'testo', x: 300, y: 222, t: '', size: 13 }
    ],
    passi: [
      { nota: "Un solo modello, y = w·x. Due lettere possono essere note o incognite: dipende da cosa stai facendo." },
      { nota: "<b>Direzione A, predire</b> (<i>predict</i>): conosci il peso w = 3 e l'ingresso x = 4.", set: { ta: { t: 'A · predire: da w e x a y' }, iw: { nascosto: false }, ix: { nascosto: false }, a1: { nascosto: false }, a2: { nascosto: false } } },
      { nota: "Sostituisci e calcoli: y = 3·4 = 12. <b>Non sposti niente.</b> È quello che fa un modello già addestrato.", set: { a3: { nascosto: false }, oy: { nascosto: false }, tb: { t: 'si sostituisce e basta' } } },
      { nota: "<b>Direzione B, imparare</b> (<i>learn</i> o <i>fit</i>): conosci un dato misurato, x = 4 e y = 12, e cerchi il peso.", set: { ta: { t: 'B · imparare: da x e y a w' }, iw: { nascosto: true }, ix: { nascosto: true }, a1: { nascosto: true }, a2: { nascosto: true }, a3: { nascosto: true }, oy: { nascosto: true }, by: { nascosto: false }, bx: { nascosto: false }, b1: { nascosto: false }, b2: { nascosto: false }, tb: { t: '' } } },
      { nota: "Qui sì, bisogna <b>isolare w</b>: w = 12 / 4 = 3. Il modello si usa \"al contrario\", dai dati ai parametri. Questa è la definizione di apprendimento.", set: { b3: { nascosto: false }, ow: { nascosto: false }, mo: { tono: 'ora' }, tb: { t: 'si isola w: imparare' } } }
    ]
  };

  // 2. bilancia (originale)
  SCENE.bilancia = {
    w: 520, h: 220, lato: false,
    legenda: '{{j|s003|'}}',
    oggetti: [
      { id: 'asta', tipo: 'linea', x1: 90, y1: 100, x2: 430, y2: 100, tono: 'spento' },
      { id: 'perno', tipo: 'linea', x1: 260, y1: 100, x2: 260, y2: 190, tono: 'spento' },
      { id: 'base', tipo: 'linea', x1: 220, y1: 190, x2: 300, y2: 190, tono: 'spento' },
      { id: 'S', tipo: 'nodo', forma: 'quadrato', r: 40, x: 130, y: 60, t: '12', tono: 'dato' },
      { id: 'D', tipo: 'nodo', forma: 'quadrato', r: 40, x: 390, y: 60, t: 'w · 4', tono: 'dato' },
      { id: 'n', tipo: 'testo', x: 260, y: 212, t: '12 = w · 4', size: 14, bold: true }
    ],
    passi: [
      { nota: '{{j|s004|'}}' },
      { nota: '{{j|s005|'}}', set: { S: { t: '12 ÷ 4', tono: 'ora' }, D: { t: 'w · 4 ÷ 4', tono: 'ora' }, n: { t: '12 ÷ 4 = w · 4 ÷ 4' } } },
      { nota: '{{j|s006|'}}', set: { S: { t: '3', tono: 'ok' }, D: { t: 'w', tono: 'ok' }, n: { t: 'w = 3', tono: 'ok' } } },
      { nota: '{{j|s007|'}}', set: { S: { t: '12' }, D: { t: '3 · 4' }, n: { t: '3 · 4 = 12  ✓', tono: 'ok' } } }
    ]
  };

  // 3. operazioni inverse, in ordine inverso
  const lati = (s, d, tono, op) => ({ S: { t: s, tono }, D: { t: d, tono }, op: { t: op || '' } });
  SCENE.inverse = {
    w: 560, h: 230, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [
      R('D', 30, 60, 220, 60, 'w / 4 + 2', { tono: 'dato' }), { id: 'eq', tipo: 'testo', x: 280, y: 90, t: '=', size: 22, bold: true },
      R('S', 310, 60, 220, 60, '5', { tono: 'dato' }),
      { id: 'op', tipo: 'testo', x: 280, y: 160, t: '', size: 15, bold: true, tono: 'ora' },
      { id: 'or', tipo: 'testo', x: 280, y: 200, t: 'su w: prima ÷ 4, poi + 2', size: 13 }
    ],
    passi: [
      { nota: "w / 4 + 2 = 5. Su w sono state fatte due operazioni, in quest'ordine: prima <b>diviso 4</b>, poi <b>più 2</b>." },
      { nota: "Si disfano <b>in ordine inverso</b>, come si toglie prima il cappotto e poi il maglione. L'ultima fatta è + 2: si annulla con − 2, <b>su entrambi i lati</b>.", set: lati('w / 4 + 2 − 2', '5 − 2', 'ora', '− 2 a sinistra e a destra') },
      { nota: "Resta w / 4 = 3.", set: lati('w / 4', '3', null, '') },
      { nota: "La prima fatta è ÷ 4: si annulla con × 4, sempre sui due lati.", set: lati('w / 4 · 4', '3 · 4', 'ora', '× 4 a sinistra e a destra') },
      { nota: "w = 12. Verifica: 12 / 4 + 2 = 3 + 2 = 5 ✓. Nessun termine \"è passato dall'altra parte\": si è sempre fatta la stessa cosa ai due piatti.", set: lati('w', '12', 'ok', 'w = 12') }
    ]
  };

  // 4. pedice = colonna, riga = punto
  const g0 = [['2', '3', '20'], ['1', '5', '18'], ['4', '0', '15']];
  SCENE.duefeature = {
    w: 600, h: 260, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: [
      { id: 'tt', tipo: 'testo', x: 170, y: 18, t: 'dataset: una riga per punto', size: 12, bold: true },
      { id: 'tb', tipo: 'griglia', x: 30, y: 30, cw: 70, ch: 34, cwR: 70, intR: ['punto (1)', 'punto (2)', 'punto (3)'], intC: ['x₁', 'x₂', 'y'], valori: g0 },
      { id: 'e1', tipo: 'testo', x: 440, y: 90, t: '', size: 13, bold: true },
      { id: 'e2', tipo: 'testo', x: 440, y: 130, t: '', size: 13 },
      { id: 'e3', tipo: 'testo', x: 440, y: 170, t: '', size: 13 },
      { id: 'mo', tipo: 'testo', x: 300, y: 236, t: 'modello: y = w₁·x₁ + w₂·x₂ + w₃', size: 14, bold: true }
    ],
    passi: [
      { nota: "Un dataset con due feature. Le <b>colonne</b> sono le grandezze misurate (x₁, x₂) e la risposta y. Le <b>righe</b> sono i punti." },
      { nota: "Il <b>pedice</b> numera le colonne: x₁ è la prima feature, x₂ la seconda. Non sono due punti: sono <b>due ingressi dello stesso punto</b>.", set: { tb: { toni: { '0,0': 'dato', '1,0': 'dato', '2,0': 'dato' } }, e1: { t: 'pedice = colonna (feature)' } } },
      { nota: "L'<b>apice fra parentesi</b> numera le righe: il punto (1) ha x₁⁽¹⁾ = 2, x₂⁽¹⁾ = 3, y⁽¹⁾ = 20.", set: { tb: { toni: { '0,0': 'due', '0,1': 'due', '0,2': 'due' } }, e1: { t: 'apice (1) = riga (punto)' } } },
      { nota: "Un punto dà <b>una sola equazione</b>, qualunque sia il numero delle sue feature: 20 = w₁·2 + w₂·3 + w₃.", set: { e2: { t: '20 = w₁·2 + w₂·3 + w₃', tono: 'ok' } } },
      { nota: "Tre punti danno tre equazioni. Si conta sempre così: <b>equazioni = righe</b>, <b>incognite = w non date</b>. Le x non sono mai incognite: sono dati.", set: { tb: { toni: {} }, e2: { t: '3 righe → 3 equazioni', tono: 'ok' }, e3: { t: 'incognite: w₁, w₂, w₃' } } }
    ]
  };

  // 5. isolare un peso con due feature
  SCENE.bilancia2 = {
    w: 560, h: 230, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: [
      R('D', 20, 60, 250, 60, 'w₁·2 + 4·3 + 1', { tono: 'dato' }), { id: 'eq', tipo: 'testo', x: 290, y: 90, t: '=', size: 22, bold: true },
      R('S', 310, 60, 230, 60, '20', { tono: 'dato' }),
      { id: 'op', tipo: 'testo', x: 280, y: 160, t: '', size: 15, bold: true, tono: 'ora' },
      { id: 'da', tipo: 'testo', x: 280, y: 200, t: 'noti: x₁ = 2, x₂ = 3, w₂ = 4, w₃ = 1, y = 20', size: 13 }
    ],
    passi: [
      { nota: "Tutti i numeri noti sono già sostituiti. Resta <b>una sola</b> lettera, w₁: il caso a due feature è tornato un caso a una incognita." },
      { nota: "Tutto ciò che non contiene w₁ si riduce a un numero: 4·3 + 1 = 13.", set: lati('2·w₁ + 13', '20', 'ora', '4·3 + 1 = 13') },
      { nota: "Si toglie 13 da entrambi i lati.", set: lati('2·w₁ + 13 − 13', '20 − 13', 'ora', '− 13 a sinistra e a destra') },
      { nota: "Resta 2·w₁ = 7.", set: lati('2·w₁', '7', null, '') },
      { nota: "Si divide per 2 entrambi i lati.", set: lati('2·w₁ / 2', '7 / 2', 'ora', '÷ 2 a sinistra e a destra') },
      { nota: "w₁ = 3.5. Verifica: 3.5·2 + 4·3 + 1 = 7 + 12 + 1 = 20 ✓.", set: lati('w₁', '3.5', 'ok', 'w₁ = 3.5') }
    ]
  };

  // 6. tante equazioni quante incognite
  SCENE.contare = {
    w: 600, h: 260, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      { id: 'ti', tipo: 'testo', x: 110, y: 20, t: 'incognite', size: 12, bold: true },
      R('u1', 30, 34, 50, 34, 'w₁', { tono: 'ora' }), R('u2', 85, 34, 50, 34, 'w₂', { tono: 'ora' }), R('u3', 140, 34, 50, 34, 'w₃', { tono: 'ora' }),
      { id: 'te', tipo: 'testo', x: 400, y: 20, t: 'equazioni (una per punto)', size: 12, bold: true },
      { id: 'q1', tipo: 'testo', x: 400, y: 52, t: '(1, 0) → 4:  w₁ + w₃ = 4', size: 13, tono: 'dato', nascosto: true },
      { id: 'q2', tipo: 'testo', x: 400, y: 80, t: '(0, 1) → 5:  w₂ + w₃ = 5', size: 13, tono: 'dato', nascosto: true },
      { id: 'q3', tipo: 'testo', x: 400, y: 108, t: '(1, 1) → 8:  w₁ + w₂ + w₃ = 8', size: 13, tono: 'dato', nascosto: true },
      { id: 'st', tipo: 'testo', x: 300, y: 160, t: '3 incognite, 0 equazioni: infinite soluzioni', size: 14, bold: true },
      { id: 's1', tipo: 'testo', x: 300, y: 196, t: '', size: 13 },
      { id: 's2', tipo: 'testo', x: 300, y: 224, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: "Modello y = w₁·x₁ + w₂·x₂ + w₃ con <b>tutti</b> i pesi da trovare: tre incognite." },
      { nota: "Il primo punto (x₁, x₂) = (1, 0) con y = 4 dà un'equazione: w₁ + w₃ = 4. Una equazione, tre incognite: ancora infinite soluzioni.", set: { q1: { nascosto: false }, st: { t: '3 incognite, 1 equazione: infinite' } } },
      { nota: "Il secondo punto (0, 1) → 5 dà w₂ + w₃ = 5. Due equazioni: ancora non basta.", set: { q2: { nascosto: false }, st: { t: '3 incognite, 2 equazioni: infinite' } } },
      { nota: "Il terzo punto (1, 1) → 8 dà w₁ + w₂ + w₃ = 8. Ora le equazioni sono tante quante le incognite.", set: { q3: { nascosto: false }, st: { t: '3 incognite, 3 equazioni: si può risolvere', tono: 'ok' } } },
      { nota: "Si risolve il sistema: terza meno prima dà w₂ = 4, poi w₃ = 5 − 4 = 1, poi w₁ = 4 − 1 = 3 (controllato con <code>np.linalg.solve</code>). Con le matrici si fa in un colpo solo: <a href=\"w03-sistemi-lineari.html\">sistemi lineari</a>.", set: { s1: { t: 'terza − prima: w₂ = 4' }, s2: { t: 'w₁ = 3,  w₂ = 4,  w₃ = 1', tono: 'ok' } } }
    ]
  };

  // 7. prodotto interno
  SCENE.pintmod = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      { id: 'tx', tipo: 'testo', x: 40, y: 58, t: 'x', size: 15, bold: true },
      { id: 'cx', tipo: 'celle', x: 70, y: 40, cw: 60, valori: ['2', '3'], toni: { 0: 'dato', 1: 'dato' }, etichette: ['x₁', 'x₂'] },
      { id: 'tw', tipo: 'testo', x: 40, y: 128, t: 'w', size: 15, bold: true },
      { id: 'cw', tipo: 'celle', x: 70, y: 110, cw: 60, valori: ['3.5', '4'], toni: { 0: 'due', 1: 'due' }, etichette: ['w₁', 'w₂'] },
      { id: 'cp', tipo: 'celle', x: 70, y: 180, cw: 60, valori: ['', ''], indici: false, nascosto: true },
      { id: 'pr', tipo: 'testo', x: 390, y: 60, t: '', size: 14 },
      { id: 'sm', tipo: 'testo', x: 390, y: 100, t: '', size: 14 },
      { id: 'in', tipo: 'testo', x: 390, y: 140, t: '', size: 14 },
      { id: 'yy', tipo: 'testo', x: 390, y: 196, t: '', size: 16, bold: true }
    ],
    passi: [
      { nota: "Le due feature in un vettore <b>x</b> = [2, 3], i due pesi in un vettore <b>w</b> = [3.5, 4]." },
      { nota: "Si moltiplicano <b>a coppie</b>, posizione per posizione: 3.5·2 = 7 e 4·3 = 12.", set: { cp: { nascosto: false, valori: ['7', '12'], toni: { 0: 'ora', 1: 'ora' } }, pr: { t: 'w₁x₁ = 7,   w₂x₂ = 12' } } },
      { nota: "Si sommano i prodotti: 7 + 12 = 19. Questa somma di prodotti a coppie è il <b>prodotto interno</b> w · x (<i>inner product</i>, o <i>dot product</i>).", set: { sm: { t: 'w · x = 7 + 12 = 19', tono: 'ora' } } },
      { nota: "Si aggiunge l'intercetta w₃ = 1.", set: { in: { t: '+ w₃ = 1' } } },
      { nota: "y = w · x + w₃ = 20: lo stesso valore della sezione sopra. Il modello a più feature <b>è</b> un prodotto interno più l'intercetta, e resta scritto così con 2, 50 o 784 feature.", set: { yy: { t: 'y = w · x + w₃ = 20', tono: 'ok' } } }
    ]
  };

  // 8. modello affine: un punto, infinite rette
  const fam = [[0, 'y = 3'], [1, 'y = 2 + x'], [-1, 'y = 4 − x'], [2, 'y = 1 + 2x']];
  const og = [{ id: 'ax', tipo: 'assi', box: [50, 20, 300, 220], dom: [-1, 5, -2, 10], tacche: 1, numeri: false, etX: 'x', etY: 'y' },
    { id: 'p1', tipo: 'punto', in: 'ax', x: 1, y: 3, t: '(1, 3)', tono: 'dato' },
    { id: 'p2', tipo: 'punto', in: 'ax', x: 3, y: 7, t: '(3, 7)', tono: 'dato', tx: -48, nascosto: true },
    { id: 'eq', tipo: 'testo', x: 480, y: 60, t: '', size: 14, bold: true },
    { id: 'nt', tipo: 'testo', x: 480, y: 90, t: '', size: 13 }];
  fam.forEach(([w1], i) => og.push({ id: 'l' + i, tipo: 'linea', in: 'ax', x1: -1, y1: 3 - w1 * 2, x2: 5, y2: 3 + w1 * 4, tono: 'spento', nascosto: true }));
  SCENE.infinite = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s013|'}}',
    oggetti: og,
    passi: [
      { nota: "Modello affine y = w₀ + w₁·x: <b>due</b> incognite. Un solo punto misurato, (1, 3), dà una sola equazione: 3 = w₀ + w₁." },
      { nota: "w₁ = 0, w₀ = 3: la retta orizzontale y = 3 passa per il punto.", set: { l0: { nascosto: false, tono: 'ora' }, eq: { t: 'y = 3' }, nt: { t: '3 = 3 + 0 ✓' } } },
      { nota: "Ma anche w₁ = 1, w₀ = 2 passa per il punto.", set: { l0: { tono: 'spento' }, l1: { nascosto: false, tono: 'ora' }, eq: { t: 'y = 2 + x' }, nt: { t: '3 = 2 + 1 ✓' } } },
      { nota: "E w₁ = −1, w₀ = 4. Qualunque w₁ va bene, basta prendere w₀ = 3 − w₁: le rette per un punto sono <b>infinite</b>. Un'equazione non basta per due incognite.", set: { l1: { tono: 'spento' }, l2: { nascosto: false, tono: 'ora' }, eq: { t: 'y = 4 − x' }, nt: { t: 'infinite soluzioni' } } },
      { nota: "Un secondo punto, (3, 7), dà la seconda equazione: 7 = w₀ + 3·w₁. Di tutte le rette per (1, 3), <b>una sola</b> passa anche per (3, 7): y = 1 + 2x. Due incognite, due punti.", set: { l2: { tono: 'spento' }, p2: { nascosto: false }, l3: { nascosto: false, tono: 'ok' }, eq: { t: 'y = 1 + 2x', tono: 'ok' }, nt: { t: 'una sola soluzione' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s014|}}</h1>
  <p class="lede">{{s|s015|}}</p>
</header>

<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
  <div class="colonne">
    <div class="carta media">
      <h4>{{s|s018|}}</h4>
      <p>{{s|s019|}}</p>
      <p>{{s|s020|}}</p>
      <p class="piccolo">{{s|s021|}}</p>
    </div>
    <div class="carta buona">
      <h4>{{s|s022|}}</h4>
      <p>{{s|s023|}}</p>
      <p>{{s|s024|}}</p>
      <p class="piccolo">{{s|s025|}}</p>
    </div>
  </div>
  <p>{{s|s026|}}</p>
  <div class="box idea" data-tit="{{a|s027|}}">
    <p>{{s|s028|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s029|}}">
    <p>{{s|s030|}}</p>
  </div>
  <figure class="scena" data-scena="direzioni" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <p>{{s|s033|}}</p>
  <figure class="passi" data-titolo="{{a|s034|}}" data-legenda="{{a|s035|}}">
    <div class="passo">
      <div class="espr">y = w &middot; x</div>
      <p class="nota">{{s|s036|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="dato">12</mark> = w &middot; <mark class="dato">4</mark></div>
      <p class="nota">{{s|s037|}}</p>
    </div>
    <div class="passo">
      <div class="espr">12 <mark class="ora">&divide; 4</mark> = w &middot; 4 <mark class="ora">&divide; 4</mark></div>
      <p class="nota">{{s|s038|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">w = 3</mark></div>
      <p class="nota">{{s|s039|}}</p>
    </div>
  </figure>
  <p>{{s|s040|}}</p>
  <figure class="scena" data-scena="bilancia" data-titolo="{{a|s041|}}"></figure>
</section>

<section>
  <h2>{{s|s042|}}</h2>
  <p>{{s|s043|}}</p>
  <div class="box regola" data-tit="{{a|s044|}}">
    <p>{{s|s045|}}</p>
  </div>
  <p>{{s|s046|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s047|}}</th><th>{{s|s048|}}</th><th>{{s|s049|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s050|}}</td><td>{{s|s051|}}</td><td>{{s|s052|}}</td></tr>
      <tr><td>{{s|s053|}}</td><td>{{s|s054|}}</td><td>{{s|s055|}}</td></tr>
      <tr><td>{{s|s056|}}</td><td>{{s|s057|}}</td><td>{{s|s058|}}</td></tr>
      <tr><td>{{s|s059|}}</td><td>{{s|s060|}}</td><td>{{s|s061|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box inglese" data-tit="{{a|s062|}}">
    <p>{{s|s063|}}</p>
  </div>
  <figure class="scena" data-scena="inverse" data-titolo="{{a|s064|}}"></figure>
</section>

<section>
  <h2>{{s|s065|}}</h2>
  <p>{{s|s066|}}</p>
  <div class="box attenzione" data-tit="{{a|s067|}}">
    <p>{{s|s068|}}</p>
  </div>
  <p>{{s|s069|}}</p>
  <div class="box regola" data-tit="{{a|s070|}}">
    <p>{{s|s071|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s072|}}">
    <p>{{s|s073|}}</p>
  </div>
  <figure class="scena" data-scena="duefeature" data-titolo="{{a|s074|}}"></figure>
</section>

<section>
  <h2>{{s|s075|}}</h2>
  <p>{{s|s076|}}</p>
  <figure class="passi" data-titolo="{{a|s077|}}" data-legenda="{{a|s078|}}">
    <div class="passo">
      <div class="espr">y = w1&middot;x1 + w2&middot;x2 + w3</div>
      <p class="nota">{{s|s079|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="dato">20</mark> = w1&middot;<mark class="dato">2</mark> + <mark class="dato">4</mark>&middot;<mark class="dato">3</mark> + <mark class="dato">1</mark></div>
      <p class="nota">{{s|s080|}}</p>
    </div>
    <div class="passo">
      <div class="espr">20 = 2&middot;w1 + <mark class="ora">13</mark></div>
      <p class="nota">{{s|s081|}}</p>
    </div>
    <div class="passo">
      <div class="espr">20 <mark class="ora">&minus; 13</mark> = 2&middot;w1 <mark class="ora">&minus; 13</mark></div>
      <p class="nota">{{s|s082|}}</p>
    </div>
    <div class="passo">
      <div class="espr">7 <mark class="ora">&divide; 2</mark> = 2&middot;w1 <mark class="ora">&divide; 2</mark></div>
      <p class="nota">{{s|s083|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">w1 = 3,5</mark></div>
      <p class="nota">{{s|s084|}}</p>
    </div>
  </figure>
  <div class="box idea" data-tit="{{a|s085|}}">
    <p>{{s|s086|}}</p>
  </div>
  <figure class="scena" data-scena="bilancia2" data-titolo="{{a|s087|}}"></figure>
</section>

<section>
  <h2>{{s|s088|}}</h2>
  <p>{{s|s089|}}</p>
  <div class="mblock">
    <span class="m">y<sup>(1)</sup> = w<sub>1</sub>x<sub>1</sub><sup>(1)</sup> + w<sub>2</sub>x<sub>2</sub><sup>(1)</sup> + w<sub>3</sub></span><br>
    <span class="m">y<sup>(2)</sup> = w<sub>1</sub>x<sub>1</sub><sup>(2)</sup> + w<sub>2</sub>x<sub>2</sub><sup>(2)</sup> + w<sub>3</sub></span><br>
    <span class="m">y<sup>(3)</sup> = w<sub>1</sub>x<sub>1</sub><sup>(3)</sup> + w<sub>2</sub>x<sub>2</sub><sup>(3)</sup> + w<sub>3</sub></span>
  </div>
  <div class="box regola" data-tit="{{a|s090|}}">
    <p>{{s|s091|}}</p>
  </div>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s092|}}</th><th>{{s|s093|}}</th><th>{{s|s094|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s095|}}</td><td>0</td><td>{{s|s096|}}</td></tr>
      <tr><td>{{s|s097|}}</td><td>1</td><td>{{s|s098|}}</td></tr>
      <tr><td>{{s|s099|}}</td><td>2 o 3</td><td>{{s|s100|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="contare" data-titolo="{{a|s101|}}"></figure>
</section>

<section>
  <h2>{{s|s102|}}</h2>
  <p>{{s|s103|}}</p>
  <div class="mblock"><span class="m">x = [x<sub>1</sub>, x<sub>2</sub>]</span> &nbsp;&nbsp; <span class="m">w = [w<sub>1</sub>, w<sub>2</sub>]</span> &nbsp;&nbsp;&rarr;&nbsp;&nbsp; <span class="m">y = w &middot; x + w<sub>3</sub></span></div>
  <p>{{s|s104|}}</p>
  <div class="box idea" data-tit="{{a|s105|}}">
    <p>{{s|s106|}}</p>
  </div>
  <figure class="scena" data-scena="pintmod" data-titolo="{{a|s107|}}"></figure>
</section>

<section>
  <h2>{{s|s108|}}</h2>
  <p>{{s|s109|}}</p>
  <div class="box regola" data-tit="{{a|s110|}}">
    <p>{{s|s111|}}</p>
  </div>
  <p>{{s|s112|}}</p>
  <div class="box attenzione" data-tit="{{a|s113|}}">
    <p>{{s|s114|}}</p>
  </div>
  <p class="piccolo">{{s|s115|}}</p>
  <figure class="scena" data-scena="infinite" data-titolo="{{a|s116|}}"></figure>
</section>

</main>
</body>
</html>
