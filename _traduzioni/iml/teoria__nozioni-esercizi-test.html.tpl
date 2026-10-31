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
  const V = (id, x2, y2, t, tono, extra) => Object.assign({ id, tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2, y2, t, tono, nascosto: true }, extra || {});
  SCENE.ordine = {
    w: 420, h: 300, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [60, 20, 300, 240], dom: [-2, 3, -1, 3], tacche: 1 },
      V('v', 2, 1, 'v = (2, 1)', 'dato', { nascosto: false }),
      V('Rv', -1, 2, 'Rv = (−1, 2)', 'ora', { tx: -100, ty: -6 }),
      V('e', 1, 0, 'e₁', 'dato'),
      V('Re', 0, 1, 'R e₁ = (0, 1)', 'ora'),
      V('Se', 2, 0, 'S e₁ = (2, 0)', 'ora'),
      V('RSe', 0, 2, 'RS e₁ = (0, 2)', 'due'),
      { id: 'm', tipo: 'testo', x: 210, y: 286, t: 'R = [[0, −1], [1, 0]]    S = [[2, 0], [0, 1]]', size: 13 }
    ],
    passi: [
      { nota: "R ruota di 90° in senso antiorario; S raddoppia la x e lascia la y. Il primo vettore è v = (2, 1)." },
      { nota: "R · (2, 1) = 2 · (prima colonna) + 1 · (seconda colonna) = 2·(0, 1) + 1·(−1, 0) = <b>(−1, 2)</b>: v ruotato di 90°.", set: { Rv: { nascosto: false } } },
      { nota: "Ora SR · (1, 0). Si legge <b>da destra</b>: la matrice attaccata al vettore agisce per prima, quindi prima R.", set: { v: { nascosto: true }, Rv: { nascosto: true }, e: { nascosto: false }, m: { t: 'SR · (1, 0) = S · (R · (1, 0))' } } },
      { nota: "R · (1, 0) = (0, 1): la prima colonna di R.", set: { Re: { nascosto: false } } },
      { nota: "Poi S raddoppia la x, ma la x è 0: (0, 1) resta (0, 1). <b>SR · (1, 0) = (0, 1)</b>.", set: { Re: { t: 'SR e₁ = (0, 1)', tono: 'ok' }, m: { t: 'SR · (1, 0) = (0, 1)', tono: 'ok' } } },
      { nota: "Ora RS · (1, 0): questa volta <b>prima S</b>. S · (1, 0) = (2, 0).", set: { Re: { nascosto: true }, Se: { nascosto: false }, m: { t: 'RS · (1, 0) = R · (S · (1, 0))', tono: null } } },
      { nota: "Poi R ruota (2, 0) di 90°: <b>RS · (1, 0) = (0, 2)</b>.", set: { RSe: { nascosto: false }, m: { t: 'RS · (1, 0) = (0, 2)', tono: 'due' } } },
      { nota: "Stesse due matrici, ordine diverso, risultati diversi: <b>SR ≠ RS</b>. Infatti SR = [[0, −2], [1, 0]] e RS = [[0, −1], [2, 0]] (verificato con NumPy).", set: { Se: { nascosto: true }, Re: { nascosto: false }, m: { t: 'SR e₁ = (0, 1)    RS e₁ = (0, 2)', tono: null } } }
    ]
  };
})();

(function () {
  const P = [[0, 1], [1, 1], [2, 3]], w0 = 2 / 3, w1 = 1;
  const ogg = [{ id: 'ax', tipo: 'assi', box: [50, 20, 300, 220], dom: [-0.5, 2.5, 0, 3.5], tacche: 1 }];
  ogg.push({ id: 'retta', tipo: 'linea', in: 'ax', x1: -0.5, y1: w0 - 0.5, x2: 2.5, y2: w0 + 2.5, tono: 'ok', nascosto: true });
  ogg.push({ id: 'altra', tipo: 'linea', in: 'ax', x1: -0.5, y1: 0.5, x2: 2.5, y2: 3.5, tono: 'due', tratt: true, nascosto: true });
  P.forEach(([x, y], i) => ogg.push({ id: 's' + i, tipo: 'linea', in: 'ax', x1: x, y1: y, x2: x, y2: w0 + w1 * x, tono: 'no', nascosto: true }));
  P.forEach(([x, y], i) => ogg.push({ id: 'p' + i, tipo: 'punto', in: 'ax', x, y, t: '(' + x + ', ' + y + ')', tono: 'dato' }));
  ogg.push({ id: 'r0', tipo: 'testo', x: 108, y: 188, t: '+0.333', anchor: 'start', size: 12, tono: 'no', nascosto: true });
  ogg.push({ id: 'r1', tipo: 'testo', x: 192, y: 156, t: '−0.667', anchor: 'end', size: 12, tono: 'no', nascosto: true });
  ogg.push({ id: 'r2', tipo: 'testo', x: 308, y: 62, t: '+0.333', anchor: 'start', size: 12, tono: 'no', nascosto: true });
  ogg.push({ id: 'c1', tipo: 'testo', x: 210, y: 274, t: '' });
  ogg.push({ id: 'c2', tipo: 'testo', x: 210, y: 296, t: '' });
  SCENE.es14 = {
    w: 420, h: 312, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: ogg,
    passi: [
      { nota: "I tre punti (0, 1), (1, 1), (2, 3). Nessuna retta passa per tutti e tre: cerchiamo quella con la somma dei quadrati degli errori più piccola." },
      { nota: "Una riga di A per punto: [1, x]. y contiene i valori veri.", set: { c1: { t: 'A = [[1, 0], [1, 1], [1, 2]]' }, c2: { t: 'y = (1, 1, 3)' } } },
      { nota: "AᵀA contiene il numero di punti, Σx e Σx²; Aᵀy contiene Σy e Σxy.", set: { c1: { t: 'AᵀA = [[3, 3], [3, 5]]' }, c2: { t: 'Aᵀy = (5, 7)' } } },
      { nota: "Determinante e inversa della 2 × 2, con la regola (1/det)·[[d, −b], [−c, a]].", set: { c1: { t: 'det = 3·5 − 3·3 = 6' }, c2: { t: '(AᵀA)⁻¹ = (1/6) [[5, −3], [−3, 3]]' } } },
      { nota: "w = (AᵀA)⁻¹ Aᵀy: w₀ ≈ 0.667 e w₁ = 1. Ecco la retta <b>y = 0.667 + x</b>.", set: { retta: { nascosto: false }, c1: { t: 'w = (1/6)(5·5 − 3·7, −3·5 + 3·7)' }, c2: { t: '= (4/6, 6/6) = (0.667, 1)', tono: 'ok' } } },
      { nota: "I residui y − ŷ: 1 − 0.667, 1 − 1.667, 3 − 2.667. La loro somma è 0 (succede sempre quando c'è l'intercetta).", set: { s0: { nascosto: false }, s1: { nascosto: false }, s2: { nascosto: false }, r0: { nascosto: false }, r1: { nascosto: false }, r2: { nascosto: false }, c1: { t: 'residui: +0.333, −0.667, +0.333 (somma 0)' }, c2: { t: 'somma dei quadrati = 0.667', tono: 'no' } } },
      { nota: "Confronto: la retta per il primo e l'ultimo punto, y = 1 + x, ha residui 0, −1, 0: somma dei quadrati <b>1</b>, peggio di 0.667. Nessuna retta scende sotto 0.667 (verificato con <code>np.linalg.lstsq</code>).", set: { altra: { nascosto: false }, c1: { t: 'y = 1 + x: residui 0, −1, 0' }, c2: { t: 'somma dei quadrati = 1 > 0.667', tono: 'due' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s004|}}</h1>
  <p class="lede">{{s|s005|}}</p>
</header>

<section>
  <h2>{{s|s006|}}</h2>

  <p>{{s|s007|}}</p>
  <details class="soluzione"><summary>{{s|s008|}}</summary><div>
    <p>‖u‖ = √(1 + 4 + 4) = √9 = <b>3</b>.  ‖w‖ = √(9 + 0 + 16) = √25 = <b>5</b>.</p>
    <p>{{s|s009|}}</p>
  </div></details>

  <p>{{s|s010|}}</p>
  <details class="soluzione"><summary>{{s|s011|}}</summary><div>
    <p>{{s|s012|}}</p>
  </div></details>

  <p>{{s|s013|}}</p>
  <details class="soluzione"><summary>{{s|s014|}}</summary><div>
    <p>{{s|s015|}}</p>
  </div></details>

  <p>{{s|s016|}}</p>
  <details class="soluzione"><summary>{{s|s017|}}</summary><div>
    <p>{{s|s018|}}</p>
  </div></details>
</section>

<section>
  <h2>{{s|s019|}}</h2>

  <p>{{s|s020|}}</p>
  <details class="soluzione"><summary>{{s|s021|}}</summary><div>
    <p>{{s|s022|}}</p>
  </div></details>

  <p>{{s|s023|}}</p>
  <details class="soluzione"><summary>{{s|s024|}}</summary><div>
    <p>{{s|s025|}}</p>
    <p>{{s|s026|}}</p>
  </div></details>

  <p>{{s|s027|}}</p>
  <details class="soluzione"><summary>{{s|s028|}}</summary><div>
    <p>{{s|s029|}}</p>
    <p>{{s|s030|}}</p>
  </div></details>

  <p>{{s|s031|}}</p>
  <details class="soluzione"><summary>{{s|s032|}}</summary><div>
    <p>{{s|s033|}}</p>
    <p>{{s|s034|}}</p>
  </div></details>

  <p>{{s|s035|}}</p>
  <details class="soluzione"><summary>{{s|s036|}}</summary><div>
    <p>{{s|s037|}}</p>
  </div></details>

  <p>{{s|s038|}}</p>
  <details class="soluzione"><summary>{{s|s039|}}</summary><div>
    <p>{{s|s040|}}</p>
  </div></details>
</section>

<section>
  <h2>{{s|s041|}}</h2>

  <p>{{s|s042|}}</p>
  <details class="soluzione"><summary>{{s|s043|}}</summary><div>
    <p>R · (2, 1) = (0·2 − 1·1, 1·2 + 0·1) = <b>(−1, 2)</b>.</p>
    <p>{{s|s044|}}</p>
  <figure class="scena" data-scena="ordine" data-titolo="{{a|s045|}}"></figure>
  </div></details>

  <p>{{s|s046|}}</p>
  <details class="soluzione"><summary>{{s|s047|}}</summary><div>
    <p>{{s|s048|}}</p>
  </div></details>

  <p>{{s|s049|}}</p>
  <details class="soluzione"><summary>{{s|s050|}}</summary><div>
    <p>{{s|s051|}}</p>
  </div></details>

  <p>{{s|s052|}}</p>
  <details class="soluzione"><summary>{{s|s053|}}</summary><div>
    <p>{{s|s054|}}</p>
    <p>{{s|s055|}}</p>
    <p>{{s|s056|}}</p>
  <figure class="scena" data-scena="es14" data-titolo="{{a|s057|}}"></figure>
  </div></details>
</section>

<section>
  <h2>{{s|s058|}}</h2>
  <p>{{s|s059|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s060|}}</th><th>{{s|s061|}}</th><th>{{s|s062|}}</th><th>{{s|s063|}}</th></tr></thead>
    <tbody>
      <tr><td>W01</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>{{s|s066|}}</td></tr>
      <tr><td>W02</td><td>{{s|s067|}}</td><td>{{s|s068|}}</td><td>{{s|s069|}}</td></tr>
      <tr><td>W03</td><td>{{s|s070|}}</td><td>{{s|s071|}}</td><td>{{s|s072|}}</td></tr>
      <tr><td>W04</td><td>{{s|s073|}}</td><td>{{s|s074|}}</td><td>{{s|s075|}}</td></tr>
      <tr><td>W05</td><td>{{s|s076|}}</td><td>{{s|s077|}}</td><td>{{s|s078|}}</td></tr>
      <tr><td>W06</td><td>{{s|s079|}}</td><td>{{s|s080|}}</td><td>{{s|s081|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s082|}}">
    <p>{{s|s083|}}</p>
  </div>
  <div class="box idea" data-tit="{{a|s084|}}">
    <p>{{s|s085|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s086|}}">
    <p>{{s|s087|}}</p>
  </div>
  <div class="box domanda-tua" data-tit="{{a|s088|}}">
    <p>{{s|s089|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s090|}}</h2>
  <div class="box idea" data-tit="{{a|s091|}}">
    <p>{{s|s092|}}</p>
  </div>
</section>

</main>
</body>
</html>
