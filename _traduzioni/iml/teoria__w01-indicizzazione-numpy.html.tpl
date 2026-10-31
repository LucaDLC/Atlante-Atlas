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
  const V = [['1', '2', '3'], ['3', '4', '9'], ['5', '7', '3']];
  const T = (celle, tono) => Object.fromEntries(celle.map(c => [c, tono]));
  const griglia = (extra) => Object.assign({ id: 'A', tipo: 'griglia', x: 40, y: 20, cw: 56, ch: 44, valori: V, intR: ['riga 0', 'riga 1', 'riga 2'], intC: ['col 0', 'col 1', 'col 2'], cwR: 64 }, extra || {});
  const passo = (codice, celle, ris, nota, tono) => ({ nota, set: { A: { toni: T(celle, tono || 'ok') }, c: { t: codice, tono: 'ora' }, r: { t: '→ ' + ris, tono: 'ok' } } });
  const testi = [{ id: 'c', tipo: 'testo', x: 400, y: 80, t: '', size: 16, bold: true }, { id: 'r', tipo: 'testo', x: 400, y: 120, t: '', size: 15, bold: true }, { id: 's', tipo: 'testo', x: 400, y: 160, t: '', size: 13 }];

  // 1. forma e indici da 0
  SCENE.forma = {
    w: 540, h: 230, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [griglia()].concat(testi),
    passi: [
      { nota: "<code>A = np.array([[1, 2, 3], [3, 4, 9], [5, 7, 3]])</code>: una lista di righe diventa una <b>matrice</b> NumPy. Ogni lista interna è una riga.", set: { c: { t: 'A.shape = (3, 3)', tono: 'ora' }, s: { t: '(righe, colonne)' } } },
      { nota: "<code>A.shape</code> dà la <b>forma</b>: prima il numero di righe, poi il numero di colonne. <code>A.ndim</code> = 2 dice che servono due indici per arrivare a un elemento.", set: { A: { toni: T(['0,0', '1,0', '2,0'], 'due') }, s: { t: 'ndim = 2: due indici' } } },
      { nota: "Le righe si contano <b>da 0</b>: la prima riga è la riga 0, la \"seconda riga\" è l'indice 1.", set: { A: { toni: T(['1,0', '1,1', '1,2'], 'dato') }, c: { t: 'seconda riga = indice 1' }, s: { t: '' } } },
      { nota: "Lo stesso per le colonne: la \"prima colonna\" è l'indice 0.", set: { A: { toni: T(['0,0', '1,0', '2,0'], 'due') }, c: { t: 'prima colonna = indice 0' } } },
      { nota: "Gli indici <b>negativi</b> contano dalla fine: −1 è l'ultimo, −2 il penultimo. In una riga di 3 elementi, −1 equivale a 3 − 1 = 2.", set: { A: { toni: T(['2,0'], 'ok') }, c: { t: 'A[−1, 0] = A[2, 0]' }, r: { t: '→ 5', tono: 'ok' } } }
    ]
  };

  // 2. la virgola
  SCENE.virgola = {
    w: 540, h: 230, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [griglia()].concat(testi),
    passi: [
      { nota: "<code>A[riga, colonna]</code>: dentro le quadre, <b>prima della virgola la riga</b>, dopo la colonna." },
      { nota: "<code>A[1, 2]</code>: prima scelgo la riga 1…", set: { A: { toni: T(['1,0', '1,1', '1,2'], 'dato') }, c: { t: 'A[1, 2]', tono: 'ora' } } },
      { nota: "…poi la colonna 2. L'elemento all'incrocio è 9.", set: { A: { toni: Object.assign(T(['1,0', '1,1'], 'dato'), T(['0,2'], 'due'), T(['2,2'], 'due'), T(['1,2'], 'ok')) }, r: { t: '→ 9', tono: 'ok' } } },
      passo('A[2, 0]', ['2,0'], '5', "Riga 2, colonna 0: l'angolo in basso a sinistra, 5."),
      passo('A[0]', ['0,0', '0,1', '0,2'], '[1 2 3]', "Con un <b>solo</b> indice NumPy prende la <b>riga intera</b>: <code>A[0]</code> è la riga 0, un vettore di 3 elementi. Il nome <code>single</code> del Task 4 inganna: non è un elemento.", 'dato')
    ]
  };

  // 3. slice su un vettore
  const vv = ['10', '20', '30', '40', '50', '60'];
  const sl = (cod, idx, ris, nota) => ({ nota, set: { v: { toni: T(idx.map(String), 'ok') }, c: { t: cod, tono: 'ora' }, r: { t: '→ ' + ris, tono: 'ok' } } });
  SCENE.slice = {
    w: 560, h: 200, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [
      { id: 'v', tipo: 'celle', x: 40, y: 40, cw: 56, valori: vv },
      { id: 'n', tipo: 'testo', x: 208, y: 112, t: 'indici 0 … 5', size: 12 },
      { id: 'c', tipo: 'testo', x: 460, y: 50, t: '', size: 16, bold: true },
      { id: 'r', tipo: 'testo', x: 460, y: 90, t: '', size: 15, bold: true },
      { id: 's', tipo: 'testo', x: 208, y: 160, t: 'inizio : fine  (fine esclusa)', size: 14, bold: true }
    ],
    passi: [
      { nota: "Un vettore <code>v</code> di 6 elementi, indici da 0 a 5. Uno <b>slice</b> (\"fetta\") si scrive <code>inizio:fine</code>." },
      sl('v[1:4]', [1, 2, 3], '[20 30 40]', "Dall'indice 1 fino al 4 <b>escluso</b>: gli indici 1, 2, 3. Tre elementi: 4 − 1 = 3. Il vantaggio dell'estremo escluso è proprio questo conto."),
      sl('v[:3]', [0, 1, 2], '[10 20 30]', "Senza inizio si parte da 0: i primi 3 elementi."),
      sl('v[3:]', [3, 4, 5], '[40 50 60]', "Senza fine si arriva in fondo. Nota: <code>v[:3]</code> e <code>v[3:]</code> insieme danno tutto il vettore, senza buchi né doppioni."),
      sl('v[-2:]', [4, 5], '[50 60]', "Con un indice negativo: dagli ultimi due fino in fondo."),
      sl('v[::2]', [0, 2, 4], '[10 30 50]', "Un terzo numero è il <b>passo</b>: <code>::2</code> prende un elemento sì e uno no.")
    ]
  };

  // 4. task 4 (scena originale)
  SCENE.indici = {
    w: 540, h: 230, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [griglia(), { id: 'c', tipo: 'testo', x: 400, y: 80, t: '', size: 16, bold: true }, { id: 'r', tipo: 'testo', x: 400, y: 120, t: '', size: 15, bold: true }],
    passi: [
      { nota: '{{j|s006|'}}' },
      passo('A[0]', ['0,0', '0,1', '0,2'], '[1 2 3]', 'Un solo indice: la <b>riga</b> 0 intera.'),
      passo('A[:2, 1]', ['0,1', '1,1'], '[2 4]', 'Righe <code>:2</code> = 0 e 1 (il 2 è escluso), colonna 1: gli incroci sono 2 e 4.'),
      passo('A[:, :2]', ['0,0', '0,1', '1,0', '1,1', '2,0', '2,1'], '3 × 2', 'Tutte le righe, colonne 0 e 1: le prime due colonne, una matrice 3 × 2.'),
      passo('A[-1, -1]', ['2,2'], '3', 'Gli indici negativi contano dalla fine: ultima riga, ultima colonna.'),
      passo('A[0:-2, 0:-1]', ['0,0', '0,1'], '[[1 2]]', 'Righe da 0 fino al penultimo <b>escluso</b>: resta solo la riga 0. Colonne da 0 all\'ultima esclusa: 0 e 1. Con gli slice la dimensione resta: forma (1, 2).')
    ]
  };

  // 5. numero secco o slice: la forma
  SCENE.formarisultato = {
    w: 540, h: 230, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [griglia()].concat(testi),
    passi: [
      passo('A[0, :]', ['0,0', '0,1', '0,2'], 'forma (3,)', "Riga 0 scelta con un <b>numero secco</b>: la dimensione delle righe <b>sparisce</b>. Resta un vettore 1D di 3 elementi, forma <code>(3,)</code>."),
      passo('A[0:1, :]', ['0,0', '0,1', '0,2'], 'forma (1, 3)', "Stessi elementi, ma presi con uno <b>slice</b> <code>0:1</code>: la dimensione resta. È una matrice di 1 riga e 3 colonne, forma <code>(1, 3)</code>."),
      passo('A[:, 0]', ['0,0', '1,0', '2,0'], 'forma (3,)', "Una colonna con un numero secco: di nuovo un vettore 1D <code>(3,)</code>. NumPy non lo \"disegna\" verticale: un array 1D non è né riga né colonna."),
      passo('A[:, 0:1]', ['0,0', '1,0', '2,0'], 'forma (3, 1)', "Con lo slice <code>0:1</code> resta una matrice colonna <code>(3, 1)</code>. La differenza conta nei prodotti tra matrici (<a href=\"nozioni-dimensioni.html\">dimensioni</a>)."),
      { nota: "Regola: <b>ogni numero secco toglie una dimensione, ogni slice la conserva</b>. Si controlla sempre con <code>.shape</code>.", set: { A: { toni: {} }, c: { t: 'numero: dim. tolta', tono: 'ora' }, r: { t: 'slice: dim. tenuta', tono: 'ok' } } }
    ]
  };

  // 6. tradurre una richiesta in indici
  SCENE.richiesta = {
    w: 540, h: 230, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: [griglia()].concat(testi),
    passi: [
      { nota: "Per ogni richiesta a parole ci si fanno due domande: <b>quali righe?</b> <b>quali colonne?</b> Esempio: \"il blocco 2 × 2 in basso a sinistra\"." },
      { nota: "Quali righe? Le ultime due: 1 e 2, cioè <code>1:</code> (dalla 1 fino in fondo).", set: { A: { toni: T(['1,0', '1,1', '1,2', '2,0', '2,1', '2,2'], 'dato') }, c: { t: 'righe: 1:', tono: 'ora' } } },
      { nota: "Quali colonne? Le prime due: 0 e 1, cioè <code>:2</code>.", set: { A: { toni: Object.assign(T(['1,2', '2,2'], 'dato'), T(['0,0', '0,1'], 'due'), T(['1,0', '1,1', '2,0', '2,1'], 'ok')) }, c: { t: 'colonne: :2', tono: 'ora' } } },
      { nota: "Si uniscono con la virgola: <code>A[1:, :2]</code> = [[3, 4], [5, 7]] (controllato in NumPy).", set: { A: { toni: T(['1,0', '1,1', '2,0', '2,1'], 'ok') }, c: { t: 'A[1:, :2]' }, r: { t: '→ [[3 4] [5 7]]', tono: 'ok' } } },
      passo('A[:, -1]', ['0,2', '1,2', '2,2'], '[3 9 3]', "Altra richiesta: \"l'ultima colonna\". Tutte le righe (<code>:</code>), colonna −1."),
      passo('A[2]', ['2,0', '2,1', '2,2'], '[5 7 3]', "\"La terza riga\": si conta da 0, quindi indice 2.", 'dato')
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s009|}}</h1>
  <p class="lede">{{s|s010|}}</p>
</header>

<section>
  <h2>{{s|s011|}}</h2>
  <p>{{s|s012|}}</p>
  <pre class="cod" data-lang="python">A = np.array([
    [1, 2, 3],    # riga 0
    [3, 4, 9],    # riga 1
    [5, 7, 3]     # riga 2
])
#  col: 0  1  2</pre>
  <p>{{s|s013|}}</p>
  <div class="box regola" data-tit="{{a|s014|}}">
    <p>{{s|s015|}}</p>
  </div>
  <figure class="scena" data-scena="forma" data-titolo="{{a|s016|}}"></figure>
</section>

<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s019|}}</th><th>{{s|s020|}}</th></tr></thead>
    <tbody>
      <tr><td><code>A[ ]</code></td><td>{{s|s021|}}</td></tr>
      <tr><td><code>,</code></td><td>{{s|s022|}}</td></tr>
      <tr><td><code>-1</code>, <code>-2</code></td><td>{{s|s023|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s024|}}</p>
  <figure class="scena" data-scena="virgola" data-titolo="{{a|s025|}}"></figure>
</section>

<section>
  <h2>{{s|s026|}}</h2>
  <p>{{s|s027|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s028|}}</th><th>{{s|s029|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
      <tr><td><code>:2</code></td><td>{{s|s032|}}</td></tr>
      <tr><td><code>3:</code></td><td>{{s|s033|}}</td></tr>
      <tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td></tr>
      <tr><td><code>::2</code></td><td>{{s|s036|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s037|}}</p>
  <figure class="scena" data-scena="slice" data-titolo="{{a|s038|}}"></figure>
</section>

<section>
  <h2>{{s|s039|}}</h2>
  <p>{{s|s040|}}</p>
  <figure class="codice" data-titolo="{{a|s041|}}">
<pre data-lang="python">single = A[0]
vector = A[:2, 1]
matrix = A[:, :2]
single = A[-1, -1]
arange = A[0:-2, 0:-1]</pre>
    <ol class="spiega">
      <li data-righe="1" data-segna="A[0]@ora"><p>{{s|s042|}}</p></li>
      <li data-righe="2" data-segna=":2@dato|1]@due"><p>{{s|s043|}}</p></li>
      <li data-righe="3" data-segna="A[:, :2]@ora"><p>{{s|s044|}}</p></li>
      <li data-righe="4" data-segna="-1, -1@ora"><p>{{s|s045|}}</p></li>
      <li data-righe="5" data-segna="0:-2@dato|0:-1@due"><p>{{s|s046|}}</p></li>
    </ol>
  </figure>
  <figure class="passi" data-titolo="{{a|s047|}}" data-legenda="{{a|s048|}}">
    <div class="passo">
      <div class="espr testo">A[ <mark class="dato">:2</mark> , 1 ]</div>
      <p class="nota">{{s|s049|}}</p>
    </div>
    <div class="passo">
      <div class="espr testo">A[ :2 , <mark class="due">1</mark> ]</div>
      <p class="nota">{{s|s050|}}</p>
    </div>
    <div class="passo">
      <div class="espr testo">{{s|s051|}}</div>
      <p class="nota">{{s|s052|}}</p>
    </div>
    <div class="passo">
      <div class="espr"><mark class="ok">[2 4]</mark></div>
      <p class="nota">{{s|s053|}}</p>
    </div>
  </figure>
  <figure class="scena" data-scena="indici" data-titolo="{{a|s054|}}"></figure>
</section>

<section>
  <h2>{{s|s055|}}</h2>
  <p>{{s|s056|}}</p>
  <div class="box attenzione" data-tit="{{a|s057|}}">
    <p>{{s|s058|}}</p>
  </div>
  <p>{{s|s059|}}</p>
  <div class="box domanda-tua" data-tit="{{a|s060|}}">
    <p>{{s|s061|}}</p>
  </div>
  <figure class="scena" data-scena="formarisultato" data-titolo="{{a|s062|}}"></figure>
</section>

<section>
  <h2>{{s|s063|}}</h2>
  <p>{{s|s064|}}</p>
  <p>{{s|s065|}}</p>
  <details class="soluzione"><summary>{{s|s066|}}</summary><div>
    <p>{{s|s067|}}</p>
  </div></details>
  <figure class="scena" data-scena="richiesta" data-titolo="{{a|s068|}}"></figure>
</section>

</main>
</body>
</html>
