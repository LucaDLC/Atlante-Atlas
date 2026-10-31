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
  const pl = p => p.concat(p.slice().reverse());

  // 1. la macchina
  const giro = (x, y) => ({ in: { t: 'x = ' + x, nascosto: false }, out: { t: 'f(' + x + ') = ' + y, nascosto: false }, cal: { t: '2·' + (x < 0 ? '(' + x + ')' : x) + ' + 1 = ' + y } });
  SCENE.macchina = {
    w: 600, h: 220, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      R('in', 20, 80, 130, 44, 'x = 3', { tono: 'dato', nascosto: true }),
      F('a1', 152, 102, 218, 102, ''),
      R('f', 220, 70, 160, 64, 'f(x) = 2x + 1', { tono: 'ora' }),
      F('a2', 382, 102, 448, 102, ''),
      R('out', 450, 80, 130, 44, 'f(3) = 7', { tono: 'ok', nascosto: true }),
      { id: 'cal', tipo: 'testo', x: 300, y: 170, t: '', size: 14, bold: true },
      { id: 'reg', tipo: 'testo', x: 300, y: 200, t: '', size: 13 }
    ],
    passi: [
      { nota: "Una <b>funzione</b> è una regola: riceve un ingresso e restituisce <b>un solo</b> risultato. Qui la regola è f(x) = 2x + 1: \"raddoppia e aggiungi 1\"." },
      { nota: "<b>Valutare</b> la funzione in x = 3 vuol dire mettere 3 al posto di x ovunque compaia.", set: { in: { nascosto: false }, cal: { t: '2·3 + 1' } } },
      { nota: "Esce f(3) = 7. La scrittura f(3) si legge \"f di 3\": il valore della funzione quando l'ingresso è 3.", set: giro(3, 7) },
      { nota: "Con un altro ingresso, x = −1: 2·(−1) + 1 = −1. Le parentesi intorno a −1 evitano l'errore di segno.", set: giro(-1, -1) },
      { nota: "Stesso ingresso, stessa uscita, sempre: f(3) vale 7 oggi e domani. Una regola che per lo stesso x desse due risultati diversi <b>non</b> sarebbe una funzione.", set: Object.assign(giro(3, 7), { reg: { t: 'un ingresso → una sola uscita' } }) }
    ]
  };

  // 2. il grafico e la prova della retta verticale
  const par = [], cs = [], ci = [];
  for (let x = -2.3; x <= 2.301; x += 0.1) par.push([x, x * x - 1]);
  for (let a = 0; a <= Math.PI + 0.001; a += 0.1) { cs.push([2 * Math.cos(a), 2 * Math.sin(a)]); ci.push([2 * Math.cos(a), -2 * Math.sin(a)]); }
  SCENE.grafico = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 300, 230], dom: [-3, 3, -3, 4], tacche: 1, etX: 'x', etY: 'y' },
      { id: 'pa', tipo: 'poli', in: 'ax', punti: pl(par), tono: 'ok' },
      { id: 'p1', tipo: 'punto', in: 'ax', x: 2, y: 3, t: '(2, 3)', tono: 'dato', nascosto: true },
      { id: 'vl', tipo: 'linea', in: 'ax', x1: 1.5, y1: -3, x2: 1.5, y2: 4, tono: 'ora', tratt: true, nascosto: true },
      { id: 'q1', tipo: 'punto', in: 'ax', x: 1.5, y: 1.25, t: '', tono: 'ok', nascosto: true },
      { id: 'c1', tipo: 'poli', in: 'ax', punti: pl(cs), tono: 'no', nascosto: true },
      { id: 'c2', tipo: 'poli', in: 'ax', punti: pl(ci), tono: 'no', nascosto: true },
      { id: 'k1', tipo: 'punto', in: 'ax', x: 1, y: 1.73, t: '', tono: 'no', nascosto: true },
      { id: 'k2', tipo: 'punto', in: 'ax', x: 1, y: -1.73, t: '', tono: 'no', nascosto: true },
      { id: 'tt', tipo: 'testo', x: 475, y: 60, t: 'f(x) = x² − 1', size: 14, bold: true },
      { id: 'ts', tipo: 'testo', x: 475, y: 90, t: '', size: 13 }
    ],
    passi: [
      { nota: "Il <b>grafico</b> di f(x) = x² − 1 è l'insieme dei punti (x, f(x)). Ogni punto della curva unisce un ingresso al suo risultato." },
      { nota: "Per esempio x = 2 dà f(2) = 4 − 1 = 3: il punto (2, 3) sta sulla curva.", set: { p1: { nascosto: false }, ts: { t: 'f(2) = 3 → punto (2, 3)' } } },
      { nota: "<b>Prova della retta verticale</b>: una retta verticale (x fisso) tocca il grafico di una funzione <b>al massimo una volta</b>, perché ogni x ha un solo risultato. In x = 1.5: un punto solo, y = 1.25.", set: { p1: { nascosto: true }, vl: { nascosto: false }, q1: { nascosto: false }, ts: { t: 'x = 1.5 → un solo y' } } },
      { nota: "Un cerchio x² + y² = 4 <b>non</b> è il grafico di una funzione di x.", set: { pa: { nascosto: true }, q1: { nascosto: true }, c1: { nascosto: false }, c2: { nascosto: false }, vl: { x1: 1, x2: 1 }, tt: { t: 'x² + y² = 4' }, ts: { t: '' } } },
      { nota: "In x = 1 la retta verticale lo taglia <b>due volte</b>, in y ≈ 1.73 e y ≈ −1.73: a un ingresso corrisponderebbero due uscite.", set: { k1: { nascosto: false }, k2: { nascosto: false }, ts: { t: 'x = 1 → due y: no', tono: 'no' } } }
    ]
  };

  // 3. tre tipi di funzione (slide 25)
  const r = (id, y, t) => R(id, 230, y, 150, 48, t, { nascosto: true });
  SCENE.tipifunz = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [
      { id: 'h1', tipo: 'testo', x: 300, y: 16, t: 'ℝ → ℝ', size: 13, bold: true },
      R('a_in', 60, 28, 110, 36, 'x = 3', { tono: 'dato' }), F('a1', 172, 46, 228, 50, ''), r('fa', 26, 'f(x) = 2x + 1'), F('a2', 382, 50, 438, 46, ''), R('a_out', 440, 28, 110, 36, '7', { tono: 'ok' }),
      { id: 'h2', tipo: 'testo', x: 300, y: 98, t: 'ℝ² → ℝ', size: 13, bold: true, nascosto: true },
      R('b_in', 30, 110, 140, 36, 'x = (1, 2)', { tono: 'dato', nascosto: true }), F('b1', 172, 128, 228, 132, '', { nascosto: true }), r('fb', 108, 'f(x) = 2x₁ + 3x₂'), F('b2', 382, 132, 438, 128, '', { nascosto: true }), R('b_out', 440, 110, 110, 36, '8', { tono: 'ok', nascosto: true }),
      { id: 'h3', tipo: 'testo', x: 300, y: 180, t: 'ℝ² → ℝ²', size: 13, bold: true, nascosto: true },
      R('c_in', 30, 192, 140, 36, 'x = (1, 2)', { tono: 'dato', nascosto: true }), F('c1', 172, 210, 228, 214, '', { nascosto: true }), r('fc', 190, '(x₁ + x₂, x₁ − x₂)'), F('c2', 382, 214, 438, 210, '', { nascosto: true }), R('c_out', 440, 192, 110, 36, '(3, −1)', { tono: 'ok', nascosto: true })
    ],
    passi: [
      { nota: "<b>Funzione a una variabile, a valore singolo</b> (<i>single valued function</i>): un numero entra, un numero esce. Si scrive f: ℝ → ℝ (ℝ = i numeri reali).", set: { fa: { nascosto: false } } },
      { nota: "<b>Funzione di più variabili</b> (<i>multivariate function</i>): entra un <b>vettore</b>, esce un numero. f(x₁, x₂) = 2x₁ + 3x₂ in (1, 2) vale 2 + 6 = 8. Si scrive f: ℝ² → ℝ. È la forma di quasi tutti i modelli di regressione del corso.", set: { h2: { nascosto: false }, b_in: { nascosto: false }, b1: { nascosto: false }, fb: { nascosto: false }, b2: { nascosto: false }, b_out: { nascosto: false } } },
      { nota: "<b>Funzione a valori vettoriali</b> (<i>multivariate vector function</i>): entra un vettore, esce un vettore. f(1, 2) = (1 + 2, 1 − 2) = (3, −1). Si scrive f: ℝ² → ℝ². Sono di questo tipo le trasformazioni della settimana 4 e i modelli che prevedono due coordinate (lo sguardo: x e y sullo schermo).", set: { h3: { nascosto: false }, c_in: { nascosto: false }, c1: { nascosto: false }, fc: { nascosto: false }, c2: { nascosto: false }, c_out: { nascosto: false } } }
    ]
  };

  // 4. composizione
  SCENE.composta = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [
      { id: 'tt', tipo: 'testo', x: 300, y: 18, t: 'f(g(x)) con g(x) = x + 1,  f(x) = x²', size: 13, bold: true },
      R('x1', 10, 50, 80, 40, 'x = 2', { tono: 'dato' }), F('u1', 92, 70, 128, 70, ''),
      R('g1', 130, 46, 110, 48, 'g: +1'), F('u2', 242, 70, 288, 70, ''),
      R('m1', 290, 50, 80, 40, '3', { tono: 'ora', nascosto: true }), F('u3', 372, 70, 408, 70, '', { nascosto: true }),
      R('f1', 410, 46, 90, 48, 'f: ( )²', { nascosto: true }), F('u4', 502, 70, 518, 70, '', { nascosto: true }),
      R('o1', 520, 50, 70, 40, '9', { tono: 'ok', nascosto: true }),
      { id: 'tb', tipo: 'testo', x: 300, y: 138, t: 'g(f(x)): prima f, poi g', size: 13, bold: true, nascosto: true },
      R('x2', 10, 170, 80, 40, 'x = 2', { tono: 'dato', nascosto: true }), F('v1', 92, 190, 128, 190, '', { nascosto: true }),
      R('f2', 130, 166, 110, 48, 'f: ( )²', { nascosto: true }), F('v2', 242, 190, 288, 190, '', { nascosto: true }),
      R('m2', 290, 170, 80, 40, '4', { tono: 'ora', nascosto: true }), F('v3', 372, 190, 408, 190, '', { nascosto: true }),
      R('g2', 410, 166, 90, 48, 'g: +1', { nascosto: true }), F('v4', 502, 190, 518, 190, '', { nascosto: true }),
      R('o2', 520, 170, 70, 40, '5', { tono: 'ok', nascosto: true }),
      { id: 'fi', tipo: 'testo', x: 300, y: 244, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: "<b>Comporre</b> vuol dire usare l'uscita di una funzione come ingresso di un'altra. In f(g(x)) si calcola <b>prima g</b>, quella più interna." },
      { nota: "g(2) = 2 + 1 = 3. Il 3 è un risultato intermedio.", set: { m1: { nascosto: false } } },
      { nota: "Il 3 entra in f: f(3) = 3² = 9. Quindi f(g(2)) = 9. Si scrive anche (f ∘ g)(2): il simbolo ∘ si legge \"dopo\", f dopo g.", set: { u3: { nascosto: false }, f1: { nascosto: false }, u4: { nascosto: false }, o1: { nascosto: false } } },
      { nota: "Nell'ordine opposto, g(f(x)): prima f(2) = 4, poi g(4) = 5.", set: { tb: { nascosto: false }, x2: { nascosto: false }, v1: { nascosto: false }, f2: { nascosto: false }, v2: { nascosto: false }, m2: { nascosto: false }, v3: { nascosto: false }, g2: { nascosto: false }, v4: { nascosto: false }, o2: { nascosto: false } } },
      { nota: "9 ≠ 5: <b>l'ordine conta</b>. Comporre non è commutativo. Lo stesso fatto torna con le matrici: SR ≠ RS (settimana 4).", set: { fi: { t: 'f(g(2)) = 9   ≠   g(f(2)) = 5', tono: 'no' } } }
    ]
  };

  // 5. scomporre
  SCENE.scomposta = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: [
      { id: 'hh', tipo: 'testo', x: 300, y: 26, t: 'h(x) = (3x − 1)²', size: 18, bold: true },
      R('x', 20, 90, 80, 40, 'x = 2', { tono: 'dato' }), F('a1', 102, 110, 158, 110, ''),
      R('h', 160, 80, 280, 60, 'h', { nascosto: false }),
      R('g', 160, 80, 130, 60, 'g(x) = 3x − 1', { tono: 'due', nascosto: true }), F('mid', 292, 110, 308, 110, '', { nascosto: true }),
      R('f', 310, 80, 130, 60, 'f(u) = u²', { tono: 'ora', nascosto: true }),
      F('a2', 442, 110, 498, 110, ''), R('y', 500, 90, 80, 40, '25', { tono: 'ok', nascosto: true }),
      { id: 'c1', tipo: 'testo', x: 300, y: 180, t: '', size: 14 },
      { id: 'c2', tipo: 'testo', x: 300, y: 208, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: "A volte si fa il contrario: si prende una funzione complicata e la si vede come <b>composizione</b> di funzioni semplici. h(x) = (3x − 1)²." },
      { nota: "Dentro la parentesi c'è una funzione: <b>g(x) = 3x − 1</b>. È quella <b>interna</b>, si calcola per prima.", set: { h: { nascosto: true }, g: { nascosto: false }, c1: { t: 'interna: g(x) = 3x − 1' } } },
      { nota: "Fuori c'è \"eleva al quadrato\": <b>f(u) = u²</b>. È quella <b>esterna</b>. Uso la lettera u per ricordare che il suo ingresso non è x, ma il risultato di g.", set: { mid: { nascosto: false }, f: { nascosto: false }, c1: { t: 'interna: g(x) = 3x − 1,   esterna: f(u) = u²' } } },
      { nota: "Quindi h = f ∘ g. Controllo con x = 2: g(2) = 5, f(5) = 25, e direttamente (3·2 − 1)² = 25 ✓. Scomporre così serve per la <b>regola della catena</b> delle derivate (<a href=\"nozioni-derivate.html\">derivate</a>).", set: { y: { nascosto: false }, c2: { t: 'h(2) = f(g(2)) = f(5) = 25', tono: 'ok' } } }
    ]
  };

  // 6. il ML è fatto di composizioni
  SCENE.pipefunz = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [
      R('x', 10, 80, 70, 44, 'x = 4', { tono: 'dato' }), F('a1', 82, 102, 104, 102, ''),
      R('n', 106, 70, 130, 64, 'n(x) = (x − 2)/2'), F('a2', 238, 102, 260, 102, ''),
      R('p', 262, 70, 130, 64, 'Φ(u) = [1, u, u²]'), F('a3', 394, 102, 416, 102, ''),
      R('m', 418, 70, 100, 64, 'f(z) = w·z'), F('a4', 520, 102, 532, 102, ''),
      R('y', 534, 80, 60, 44, '1.5', { tono: 'ok', nascosto: true }),
      { id: 'c', tipo: 'testo', x: 300, y: 172, t: '', size: 14, bold: true },
      { id: 'c2', tipo: 'testo', x: 300, y: 204, t: '', size: 13 }
    ],
    passi: [
      { nota: "Un modello reale è una <b>catena di funzioni</b>: normalizzare, calcolare le feature, applicare i pesi. Qui un dato x = 4 attraversa tre funzioni." },
      { nota: "<b>Normalizzazione</b> n(x) = (x − 2)/2: sposta e riscala il dato. n(4) = 1.", set: { n: { tono: 'ora' }, c: { t: 'n(4) = (4 − 2)/2 = 1' } } },
      { nota: "<b>Feature</b> Φ(u) = [1, u, u²]: trasforma un numero in un vettore (settimana 5). Φ(1) = [1, 1, 1].", set: { n: { tono: null }, p: { tono: 'ora' }, c: { t: 'Φ(1) = [1, 1, 1]' } } },
      { nota: "<b>Modello</b> f(z) = w · z con w = [0.5, 2, −1]: 0.5 + 2 − 1 = 1.5.", set: { p: { tono: null }, m: { tono: 'ora' }, c: { t: 'w · z = 0.5·1 + 2·1 − 1·1 = 1.5' } } },
      { nota: "La previsione è ŷ = f(Φ(n(x))): tre funzioni composte, lette da dentro a fuori. Una rete neurale (settimana 14) è la stessa idea con molti più strati.", set: { m: { tono: null }, y: { nascosto: false }, c: { t: 'ŷ = f(Φ(n(4))) = 1.5', tono: 'ok' }, c2: { t: 'modello = composizione di funzioni' } } }
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
  <p>{{s|s013|}}</p>
  <p>{{s|s014|}}</p>
  <figure class="scena" data-scena="macchina" data-titolo="{{a|s015|}}"></figure>
</section>

<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
  <p>{{s|s018|}}</p>
  <p>{{s|s019|}}</p>
  <figure class="scena" data-scena="grafico" data-titolo="{{a|s020|}}"></figure>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
  <p>{{s|s023|}}</p>
  <p>{{s|s024|}}</p>
  <p>{{s|s025|}}</p>
  <figure class="scena" data-scena="tipifunz" data-titolo="{{a|s026|}}"></figure>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
  <p>{{s|s029|}}</p>
  <p>{{s|s030|}}</p>
  <figure class="scena" data-scena="composta" data-titolo="{{a|s031|}}"></figure>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <p>{{s|s033|}}</p>
  <p>{{s|s034|}}</p>
  <p>{{s|s035|}}</p>
  <figure class="scena" data-scena="scomposta" data-titolo="{{a|s036|}}"></figure>
</section>

<section>
  <h2>{{s|s037|}}</h2>
  <p>{{s|s038|}}</p>
  <p>{{s|s039|}}</p>
  <figure class="scena" data-scena="pipefunz" data-titolo="{{a|s040|}}"></figure>
</section>

</main>
</body>
</html>
