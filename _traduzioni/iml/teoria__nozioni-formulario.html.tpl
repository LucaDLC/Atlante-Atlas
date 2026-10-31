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
  const tutte = (r, c, t) => { const o = {}; for (let i = 0; i < r; i++) for (let j = 0; j < c; j++) o[i + ',' + j] = t; return o; };
  const et = (id, x, y, t) => ({ id, tipo: 'testo', x, y, t, size: 12, bold: true, nascosto: true });
  SCENE.normale = {
    w: 600, h: 300, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      { id: 'f', tipo: 'testo', x: 300, y: 22, t: 'w = (XᵀX)⁻¹ Xᵀy', size: 18, bold: true },
      et('tX', 54, 58, 'X  3 × 2'), { id: 'X', tipo: 'griglia', x: 20, y: 70, cw: 34, ch: 28, valori: [[1, 0], [1, 1], [1, 2]], nascosto: true },
      et('ty', 117, 58, 'y  3'), { id: 'y', tipo: 'griglia', x: 100, y: 70, cw: 34, ch: 28, valori: [[1], [1], [3]], nascosto: true },
      et('tXt', 221, 58, 'Xᵀ  2 × 3'), { id: 'Xt', tipo: 'griglia', x: 170, y: 70, cw: 34, ch: 28, valori: [[1, 1, 1], [0, 1, 2]], nascosto: true },
      et('tA', 344, 58, 'XᵀX  2 × 2'), { id: 'A', tipo: 'griglia', x: 310, y: 70, cw: 34, ch: 28, valori: [[3, 3], [3, 5]], nascosto: true },
      et('tI', 464, 58, '(XᵀX)⁻¹  2 × 2'), { id: 'I', tipo: 'griglia', x: 420, y: 70, cw: 44, ch: 28, valori: [['5/6', '−1/2'], ['−1/2', '1/2']], nascosto: true },
      et('tb', 327, 178, 'Xᵀy  2'), { id: 'b', tipo: 'griglia', x: 310, y: 190, cw: 34, ch: 28, valori: [[5], [7]], nascosto: true },
      et('tw', 488, 178, 'w  2'), { id: 'w', tipo: 'griglia', x: 460, y: 190, cw: 56, ch: 28, valori: [['2/3'], ['1']], nascosto: true },
      { id: 'dim', tipo: 'testo', x: 300, y: 282, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: "La formula dei minimi quadrati, con i dati dell'esercizio 14 del test: i punti (0, 1), (1, 1), (2, 3). La leggiamo un pezzo alla volta, con le <b>dimensioni</b> di ogni pezzo." },
      { nota: "<b>X</b>: una riga per punto (3 righe), colonne <b>1</b> e <b>x</b> (2 colonne): 3 × 2. La colonna di 1 moltiplica w₀, l'intercetta.", set: { tX: { nascosto: false }, X: { nascosto: false, toni: tutte(3, 2, 'dato') } } },
      { nota: "<b>y</b>: i valori veri, uno per punto: 3 numeri.", set: { ty: { nascosto: false }, y: { nascosto: false, toni: tutte(3, 1, 'dato') } } },
      { nota: "<b>Xᵀ</b>, la trasposta: le righe diventano colonne. Da 3 × 2 a 2 × 3.", set: { tXt: { nascosto: false }, Xt: { nascosto: false, toni: tutte(2, 3, 'ora') }, dim: { t: 'Xᵀ: 3 × 2 diventa 2 × 3' } } },
      { nota: "<b>XᵀX</b>: (2 × 3)(3 × 2). I due 3 in mezzo coincidono e spariscono: il risultato è 2 × 2. Dentro: il numero di punti (3), Σx = 3 e Σx² = 5.", set: { Xt: { toni: {} }, tA: { nascosto: false }, A: { nascosto: false, toni: tutte(2, 2, 'ora') }, dim: { t: '(2 × 3)(3 × 2) → 2 × 2' } } },
      { nota: "<b>(XᵀX)⁻¹</b>: det = 3·5 − 3·3 = 6, e per una 2 × 2 l'inversa è (1/det)·[[d, −b], [−c, a]] = (1/6)·[[5, −3], [−3, 3]].", set: { A: { toni: {} }, tI: { nascosto: false }, I: { nascosto: false, toni: tutte(2, 2, 'ora') }, dim: { t: 'det = 6: la 2 × 2 si può invertire' } } },
      { nota: "<b>Xᵀy</b>: (2 × 3)(3) → 2 numeri: Σy = 5 e Σxy = 7.", set: { I: { toni: {} }, tb: { nascosto: false }, b: { nascosto: false, toni: tutte(2, 1, 'ora') }, dim: { t: '(2 × 3)(3) → 2' } } },
      { nota: "<b>w</b> = (XᵀX)⁻¹ · Xᵀy: (2 × 2)(2) → 2 numeri. w₀ = (5·5 − 3·7)/6 = 4/6 ≈ 0.667 e w₁ = (−3·5 + 3·7)/6 = 1. La retta è y = 0.667 + x.", set: { b: { toni: {} }, tw: { nascosto: false }, w: { nascosto: false, toni: tutte(2, 1, 'ok') }, dim: { t: '(2 × 2)(2) → 2' } } },
      { nota: "Il controllo che salva punti: in ogni prodotto i numeri <b>interni</b> devono coincidere, e quelli esterni danno la forma del risultato. Stesso w di <code>np.linalg.lstsq</code> (verificato).", set: { dim: { t: 'w = (0.667, 1)   ⇒   y = 0.667 + x', tono: 'ok' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s003|}}</h1>
  <p class="lede">{{s|s004|}}</p>
</header>

<section>
  <h2>{{s|s005|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s006|}}</th><th>{{s|s007|}}</th><th>{{s|s008|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s009|}}</td><td>{{s|s010|}}</td><td>{{s|s011|}}</td></tr>
      <tr><td>{{s|s012|}}</td><td>d(a, b) = ‖a − b‖</td><td>{{s|s013|}}</td></tr>
      <tr><td>{{s|s014|}}</td><td>{{s|s015|}}</td><td>{{s|s016|}}</td></tr>
      <tr><td>{{s|s017|}}</td><td>(u · w / u · u) u</td><td>{{s|s018|}}</td></tr>
      <tr><td>{{s|s019|}}</td><td>{{s|s020|}}</td><td>{{s|s021|}}</td></tr>
      <tr><td>{{s|s022|}}</td><td>{{s|s023|}}</td><td>{{s|s024|}}</td></tr>
      <tr><td>{{s|s025|}}</td><td>x<sub>E</sub> = A x<sub>A</sub>;  x<sub>B</sub> = B⁻¹A x<sub>A</sub></td><td>{{s|s026|}}</td></tr>
      <tr><td>{{s|s027|}}</td><td>[x', y', 1] = [[a, b, c], [d, e, f], [0, 0, 1]] · [x, y, 1]</td><td>{{s|s028|}}</td></tr>
      <tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s032|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s033|}}</th><th>{{s|s034|}}</th><th>{{s|s035|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s036|}}</td><td>L = (1/N) Σ (yᵢ − f(xᵢ))²</td><td>{{s|s037|}}</td></tr>
      <tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr>
      <tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td><td>{{s|s043|}}</td></tr>
      <tr><td>{{s|s044|}}</td><td>J = ‖y − Φw‖² + λ‖w‖²;  w = (ΦᵀΦ + λI)⁻¹Φᵀy</td><td>{{s|s045|}}</td></tr>
      <tr><td>{{s|s046|}}</td><td>{{s|s047|}}</td><td>{{s|s048|}}</td></tr>
      <tr><td>{{s|s049|}}</td><td>{{s|s050|}}</td><td>{{s|s051|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="normale" data-titolo="{{a|s052|}}"></figure>
</section>

<section>
  <h2>{{s|s053|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s054|}}</th><th>{{s|s055|}}</th><th>{{s|s056|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s057|}}</td><td>yₙ = Σ hₘ fₙ₊ₘ  /  yₙ = Σ hₘ fₙ₋ₘ</td><td>{{s|s058|}}</td></tr>
      <tr><td>{{s|s059|}}</td><td>{{s|s060|}}</td><td>{{s|s061|}}</td></tr>
      <tr><td>{{s|s062|}}</td><td>{{s|s063|}}</td><td>{{s|s064|}}</td></tr>
      <tr><td>{{s|s065|}}</td><td>{{s|s066|}}</td><td>{{s|s067|}}</td></tr>
      <tr><td>{{s|s068|}}</td><td>[[−1, 0, 1], [−2, 0, 2], [−1, 0, 1]]</td><td>{{s|s069|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s070|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s071|}}</th><th>{{s|s072|}}</th><th>{{s|s073|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s074|}}</td><td>{{s|s075|}}</td><td>{{s|s076|}}</td></tr>
      <tr><td>{{s|s077|}}</td><td>{{s|s078|}}</td><td>{{s|s079|}}</td></tr>
      <tr><td>{{s|s080|}}</td><td>{{s|s081|}}</td><td>{{s|s082|}}</td></tr>
      <tr><td>{{s|s083|}}</td><td>z = (x − μ)/σ;  d = √((x − μ)ᵀC⁻¹(x − μ))</td><td>{{s|s084|}}</td></tr>
      <tr><td>{{s|s085|}}</td><td>{{s|s086|}}</td><td>{{s|s087|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s088|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s089|}}</th><th>{{s|s090|}}</th><th>{{s|s091|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s092|}}</td><td>{{s|s093|}}</td><td>{{s|s094|}}</td></tr>
      <tr><td>{{s|s095|}}</td><td>σ(z) = 1/(1 + e⁻ᶻ);  σ′ = σ(1 − σ)</td><td>{{s|s096|}}</td></tr>
      <tr><td>{{s|s097|}}</td><td>{{s|s098|}}</td><td>{{s|s099|}}</td></tr>
      <tr><td>{{s|s100|}}</td><td>{{s|s101|}}</td><td>{{s|s102|}}</td></tr>
      <tr><td>{{s|s103|}}</td><td>{{s|s104|}}</td><td>{{s|s105|}}</td></tr>
      <tr><td>{{s|s106|}}</td><td>{{s|s107|}}</td><td>{{s|s108|}}</td></tr>
      <tr><td>{{s|s109|}}</td><td>{{s|s110|}}</td><td>{{s|s111|}}</td></tr>
    </tbody>
  </table></div>
</section>

<section>
  <h2>{{s|s112|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s113|}}</th><th>{{s|s114|}}</th><th>{{s|s115|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s116|}}</td><td>{{s|s117|}}</td><td>{{s|s118|}}</td></tr>
      <tr><td>{{s|s119|}}</td><td>{{s|s120|}}</td><td>{{s|s121|}}</td></tr>
      <tr><td>{{s|s122|}}</td><td>w ← w − η ∇L(w)</td><td>{{s|s123|}}</td></tr>
      <tr><td>{{s|s124|}}</td><td>{{s|s125|}}</td><td>{{s|s126|}}</td></tr>
    </tbody>
  </table></div>
</section>

</main>
</body>
</html>
