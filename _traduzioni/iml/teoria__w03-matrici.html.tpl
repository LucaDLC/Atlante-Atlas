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
  const G = (id, x, y, vals, extra) => Object.assign({ id, tipo: 'griglia', x, y, cw: 50, ch: 40, valori: vals }, extra || {});
  const toni = (celle, tono) => Object.fromEntries(celle.map(c => [c, tono]));
  const riga = (r, n, tono) => toni([...Array(n).keys()].map(c => r + ',' + c), tono);
  const colonna = (c, m, tono) => toni([...Array(m).keys()].map(r => r + ',' + c), tono);

  // 1. che cos'è
  const M = [['1', '2', '3'], ['4', '5', '6']];
  SCENE.matrice = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s002|'}}',
    oggetti: [
      G('A', 40, 30, M, { intR: ['riga 1', 'riga 2'], intC: ['col 1', 'col 2', 'col 3'], cwR: 60, cw: 56 }),
      T('f', 460, 50, 'A: 2 × 3', { bold: true, size: 16 }), T('c1', 460, 90, ''), T('c2', 460, 120, ''), T('c3', 460, 170, '', { size: 13 })
    ],
    passi: [
      { nota: "Una <b>matrice</b> è una tabella rettangolare di numeri. Questa ha 2 righe e 3 colonne: si dice <b>2 × 3</b> (\"due per tre\"), prima le righe poi le colonne." },
      { nota: "Una <b>riga</b> è un vettore orizzontale: la riga 2 è [4, 5, 6].", set: { A: { toni: riga(1, 3, 'dato') }, c1: { t: 'riga 2 = [4, 5, 6]', tono: 'dato' } } },
      { nota: "Una <b>colonna</b> è un vettore verticale: la colonna 3 è [3, 6].", set: { A: { toni: colonna(2, 2, 'due') }, c2: { t: 'colonna 3 = [3, 6]', tono: 'due' } } },
      { nota: "<b>A<sub>ij</sub></b> è l'elemento in riga i e colonna j: A₂₃ = 6. Nelle slide si conta da 1; in NumPy da 0, quindi A₂₃ è <code>A[1, 2]</code>.", set: { A: { toni: { '1,2': 'ok' } }, c3: { t: 'A₂₃ = 6  (NumPy: A[1, 2])', tono: 'ok' } } }
    ]
  };

  // 2. tre usi
  SCENE.treusi = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s003|'}}',
    oggetti: [
      G('A', 40, 60, [['2', '1'], ['1', '3']], { cw: 56, ch: 44 }),
      T('t', 96, 40, 'A', { bold: true, size: 15 }),
      T('u', 400, 60, '', { bold: true, size: 15 }), T('c1', 400, 100, '', { size: 13 }), T('c2', 400, 130, '', { size: 13 }), T('c3', 400, 170, '', { size: 13 })
    ],
    passi: [
      { nota: "La stessa tabella di numeri può voler dire tre cose diverse, a seconda di come la si usa (slide 29: \"matrix uses in IML\")." },
      { nota: "<b>1. Contenitore di dati</b>: ogni <b>riga</b> è un esempio, ogni colonna una feature. Qui due esempi, [2, 1] e [1, 3]. Il file delle pose è una matrice 18 × 50.", set: { A: { toni: Object.assign(riga(0, 2, 'dato')) }, u: { t: 'dati' }, c1: { t: 'riga = un esempio' }, c2: { t: 'colonna = una feature' } } },
      { nota: "<b>2. Trasformazione</b>: moltiplicata per un vettore, lo trasforma in un altro vettore. Le <b>colonne</b> dicono dove finiscono i vettori [1, 0] e [0, 1] (settimana 4).", set: { A: { toni: colonna(0, 2, 'dato') }, u: { t: 'trasformazione' }, c1: { t: 'colonna 1 = dove va [1, 0]' }, c2: { t: 'Ax = vettore trasformato' } } },
      { nota: "<b>3. Sistema di equazioni</b>: ogni <b>riga</b> contiene i coefficienti di un'equazione. Ax = b scrive in una riga sola tutto il sistema 2x₁ + x₂ = b₁, x₁ + 3x₂ = b₂ (<a href=\"w03-sistemi-lineari.html\">sistemi lineari</a>).", set: { A: { toni: riga(1, 2, 'dato') }, u: { t: 'sistema' }, c1: { t: 'riga = un’equazione' }, c2: { t: 'Ax = b' } } }
    ]
  };

  // 3. elemento per elemento
  const P = [['1', '2'], ['3', '4']], R = [['5', '6'], ['7', '8']];
  const tutte = t => toni(['0,0', '0,1', '1,0', '1,1'], t);
  SCENE.elementi = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s004|'}}',
    oggetti: [
      T('ta', 85, 30, 'A', { bold: true }), G('A', 40, 40, P, { toni: tutte('dato') }),
      T('op', 180, 80, '', { bold: true, size: 20 }),
      T('tb', 265, 30, 'B', { bold: true, nascosto: true }), G('B', 220, 40, R, { toni: tutte('due'), nascosto: true }),
      T('eq', 360, 80, '=', { bold: true, size: 20 }),
      G('C', 390, 40, [['', ''], ['', '']], { toni: tutte('ok') }),
      T('n', 300, 180, '', { size: 13 }), T('n2', 300, 208, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "Le operazioni più semplici fra matrici (slide 31) lavorano <b>elemento per elemento</b>: ogni casella con la casella nella stessa posizione." },
      { nota: "<b>Somma</b>: A + B, casella per casella. 1 + 5 = 6, 2 + 6 = 8, … Serve la <b>stessa forma</b>.", set: { op: { t: '+' }, tb: { nascosto: false }, B: { nascosto: false }, C: { valori: [['6', '8'], ['10', '12']] }, n: { t: 'A + B: stessa forma, casella per casella' } } },
      { nota: "<b>Per uno scalare</b>: 2·A moltiplica ogni casella per 2.", set: { op: { t: '× 2' }, tb: { nascosto: true }, B: { nascosto: true }, C: { valori: [['2', '4'], ['6', '8']] }, n: { t: '2·A: ogni casella per 2' } } },
      { nota: "<b>Prodotto di Hadamard</b> A ⊙ B: si moltiplicano le caselle nella stessa posizione. 1·5 = 5, 2·6 = 12, 3·7 = 21, 4·8 = 32. In NumPy è <code>A * B</code>.", set: { op: { t: '⊙' }, tb: { nascosto: false }, B: { nascosto: false }, C: { valori: [['5', '12'], ['21', '32']] }, n: { t: 'A ⊙ B = A * B in NumPy' } } },
      { nota: "Attenzione: il <b>prodotto di matrici</b> vero, <code>A @ B</code>, è un'altra cosa e dà [[19, 22], [43, 50]]. Confondere <code>*</code> e <code>@</code> è l'errore più comune in NumPy (numeri controllati).", set: { n2: { t: 'A @ B = [[19, 22], [43, 50]]  ≠  A * B', tono: 'no' } } }
    ]
  };

  // 4. trasposta
  const D = [['1', '2', '3'], ['4', '5', '6']], Dt = [['1', '4'], ['2', '5'], ['3', '6']];
  SCENE.trasposta = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [
      T('ta', 110, 24, 'A: 2 × 3', { bold: true }), G('A', 40, 36, D, { cw: 46 }),
      T('tt', 420, 24, 'Aᵀ: 3 × 2', { bold: true, nascosto: true }), G('At', 370, 36, Dt, { cw: 46, nascosto: true }),
      T('c', 300, 190, '', { size: 13 }), T('c2', 300, 216, '', { size: 13 })
    ],
    passi: [
      { nota: "La <b>trasposta</b> Aᵀ (\"A trasposta\", in NumPy <code>A.T</code>) scambia righe e colonne." },
      { nota: "La riga 1 di A, [1, 2, 3]…", set: { A: { toni: riga(0, 3, 'dato') } } },
      { nota: "…diventa la <b>colonna</b> 1 di Aᵀ.", set: { tt: { nascosto: false }, At: { nascosto: false, toni: colonna(0, 3, 'ok') } } },
      { nota: "La riga 2, [4, 5, 6], diventa la colonna 2. La forma passa da 2 × 3 a 3 × 2.", set: { A: { toni: riga(1, 3, 'dato') }, At: { toni: colonna(1, 3, 'ok') }, c: { t: 'forma (2, 3) → (3, 2)' } } },
      { nota: "In formula: (Aᵀ)<sub>ij</sub> = A<sub>ji</sub>, gli indici si scambiano. Esempio: (Aᵀ)₃₁ = A₁₃ = 3. Trasporre due volte riporta A. Su un array 1D di NumPy <code>.T</code> non fa nulla (<a href=\"nozioni-numpy.html\">la trappola</a>).", set: { A: { toni: { '0,2': 'dato' } }, At: { toni: { '2,0': 'ok' } }, c2: { t: '(Aᵀ)₃₁ = A₁₃ = 3' } } }
    ]
  };

  // 5. matrice per vettore, per righe
  SCENE.mv = {
    w: 560, h: 250, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: [
      G('A', 40, 50, [['2', '1'], ['1', '3']], { cw: 50, ch: 44 }), T('tA', 90, 34, 'A', { bold: true, size: 15 }),
      G('x', 170, 50, [['1'], ['2']], { cw: 50, ch: 44 }), T('tx', 195, 34, 'x', { bold: true, size: 15 }),
      T('eq', 250, 98, '=', { bold: true, size: 22 }),
      G('y', 280, 50, [[''], ['']], { cw: 50, ch: 44 }), T('ty', 305, 34, 'Ax', { bold: true, size: 15 }),
      T('c1', 450, 72, ''), T('c2', 450, 116, ''), T('n', 280, 200, '', { bold: true })
    ],
    passi: [
      { nota: '{{j|s007|'}}' },
      { nota: '{{j|s008|'}}', set: { A: { toni: { '0,0': 'ora', '0,1': 'ora' } }, x: { toni: { '0,0': 'dato', '1,0': 'dato' } }, y: { valori: [['4'], ['']], toni: { '0,0': 'ok' } }, c1: { t: '[2, 1] · [1, 2] = 4' } } },
      { nota: '{{j|s009|'}}', set: { A: { toni: { '1,0': 'ora', '1,1': 'ora' } }, y: { valori: [['4'], ['7']], toni: { '0,0': 'ok', '1,0': 'ok' } }, c2: { t: '[1, 3] · [1, 2] = 7' } } },
      { nota: '{{j|s010|'}}', set: { n: { t: 'Ax = [4, 7]', tono: 'ok' } } }
    ]
  };

  // 6. matrice per vettore, per colonne (geometrico)
  SCENE.colonne = {
    w: 600, h: 280, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 260, 240], dom: [-0.5, 5, -0.5, 8], tacche: 1, etX: 'x₁', etY: 'x₂' },
      { id: 'a1', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 1, t: 'a₁ = [2, 1]', tono: 'due' },
      { id: 'a2', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 1, y2: 3, t: 'a₂ = [1, 3]', tx: -76, tono: 'due' },
      { id: 'p1', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 2, y2: 1, t: '1·a₁', tono: 'ora', nascosto: true },
      { id: 'p2', tipo: 'vett', in: 'ax', x1: 2, y1: 1, x2: 4, y2: 7, t: '2·a₂', tx: 10, tono: 'ora', nascosto: true },
      { id: 'r', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 4, y2: 7, t: 'Ax = [4, 7]', tx: -96, ty: -4, tono: 'ok', nascosto: true },
      T('c1', 470, 60, 'x = [1, 2]', { bold: true }), T('c2', 470, 100, '', { size: 13 }), T('c3', 470, 140, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "<b>Vista per colonne</b>: le colonne di A = [[2, 1], [1, 3]] sono due vettori, a₁ = [2, 1] e a₂ = [1, 3]." },
      { nota: "Le componenti di x = [1, 2] sono i <b>pesi</b> delle colonne: 1 volta a₁…", set: { a1: { tono: 'spento', t: '' }, p1: { nascosto: false }, c2: { t: '1·[2, 1]' } } },
      { nota: "…più 2 volte a₂, attaccato in coda.", set: { a2: { tono: 'spento' }, p2: { nascosto: false }, c2: { t: '1·[2, 1] + 2·[1, 3]' } } },
      { nota: "La somma è Ax = [4, 7], lo stesso risultato della vista per righe. <b>Ax è una combinazione lineare delle colonne di A</b> (slide 41 e 45: \"where does the input vector go?\"). Le uscite possibili sono tutte le combinazioni delle colonne: lo spazio delle colonne.", set: { r: { nascosto: false }, c3: { t: 'Ax = [4, 7]', tono: 'ok' } } }
    ]
  };

  // 7. matrice per matrice
  const AA = [['2', '1'], ['1', '3']], BB = [['0', '1'], ['1', '0']];
  const cella = (i, j, v, calc) => ({ A: { toni: riga(i, 2, 'ora') }, B: { toni: colonna(j, 2, 'due') }, C: { valori: v, toni: { [i + ',' + j]: 'ok' } }, c: { t: calc } });
  SCENE.mm = {
    w: 600, h: 240, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      T('ta', 85, 30, 'A', { bold: true }), G('A', 40, 40, AA),
      T('tb', 225, 30, 'B', { bold: true }), G('B', 180, 40, BB),
      T('eq', 310, 80, '=', { bold: true, size: 20 }),
      T('tc', 385, 30, 'AB', { bold: true }), G('C', 340, 40, [['', ''], ['', '']]),
      T('c', 300, 180, '', { bold: true }), T('c2', 300, 210, '', { size: 13 })
    ],
    passi: [
      { nota: "Il prodotto AB: <b>ogni elemento</b> (i, j) del risultato è il prodotto interno fra la <b>riga i di A</b> e la <b>colonna j di B</b>." },
      Object.assign({ nota: "Elemento (1, 1): riga 1 di A, [2, 1], con colonna 1 di B, [0, 1]: 2·0 + 1·1 = 1." }, { set: cella(0, 0, [['1', ''], ['', '']], '[2, 1] · [0, 1] = 1') }),
      Object.assign({ nota: "Elemento (1, 2): riga 1 con colonna 2: 2·1 + 1·0 = 2." }, { set: cella(0, 1, [['1', '2'], ['', '']], '[2, 1] · [1, 0] = 2') }),
      Object.assign({ nota: "Elemento (2, 1): riga 2, [1, 3], con colonna 1: 1·0 + 3·1 = 3." }, { set: cella(1, 0, [['1', '2'], ['3', '']], '[1, 3] · [0, 1] = 3') }),
      Object.assign({ nota: "Elemento (2, 2): riga 2 con colonna 2: 1·1 + 3·0 = 1. AB = [[1, 2], [3, 1]] (controllato con NumPy).", }, { set: Object.assign(cella(1, 1, [['1', '2'], ['3', '1']], '[1, 3] · [1, 0] = 1'), { c2: { t: 'AB = [[1, 2], [3, 1]]', tono: 'ok' } }) }),
      { nota: "Un'altra lettura: la colonna j di AB è <b>A per la colonna j di B</b>. Moltiplicare per una matrice è applicare A a ogni colonna di B, una alla volta.", set: { A: { toni: {} }, B: { toni: colonna(0, 2, 'due') }, C: { toni: colonna(0, 2, 'ok') }, c: { t: 'colonna 1 di AB = A · [0, 1] = [1, 3]' } } }
    ]
  };

  // 8. ordine e dimensioni
  const R8 = (id, x, y, w, h, t, tono, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t, tono }, extra || {});
  SCENE.dimensioni = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s013|'}}',
    oggetti: [
      R8('a', 30, 60, 90, 60, '2 × 3', 'dato'), T('x', 140, 90, '·', { size: 22, bold: true }),
      R8('b', 160, 40, 60, 90, '3 × 2', 'due'), T('e', 245, 90, '=', { size: 22, bold: true }),
      R8('c', 270, 60, 60, 60, '2 × 2', 'ok'),
      T('m1', 470, 60, '', { size: 13, bold: true }), T('m2', 470, 92, '', { size: 13 }), T('m3', 470, 130, '', { size: 13 }), T('m4', 300, 220, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "La regola delle forme: <b>(m × n) · (n × p) = m × p</b>. Le due dimensioni \"interne\" devono essere uguali e spariscono; quelle \"esterne\" danno la forma del risultato.", set: { m1: { t: 'D · Dᵀ: (2 × 3)(3 × 2)' }, m2: { t: 'interne: 3 = 3 ✓' }, m3: { t: 'risultato: 2 × 2' } } },
      { nota: "Nell'ordine opposto, Dᵀ · D: (3 × 2)(2 × 3). Interne 2 = 2, esterne 3 e 3: il risultato è <b>3 × 3</b>. Cambiando l'ordine cambia persino la forma.", set: { a: { w: 60, h: 90, y: 40, t: '3 × 2' }, b: { w: 90, h: 60, y: 60, t: '2 × 3' }, c: { w: 90, h: 90, y: 40, t: '3 × 3' }, m1: { t: 'Dᵀ · D: (3 × 2)(2 × 3)' }, m2: { t: 'interne: 2 = 2 ✓' }, m3: { t: 'risultato: 3 × 3' } } },
      { nota: "D · D: (2 × 3)(2 × 3). Interne 3 e 2: <b>non si può</b>. NumPy solleva <code>ValueError</code>.", set: { a: { w: 90, h: 60, y: 60, t: '2 × 3' }, b: { w: 90, h: 60, y: 60, t: '2 × 3', tono: 'no' }, c: { t: '?', tono: 'no' }, m1: { t: 'D · D: (2 × 3)(2 × 3)' }, m2: { t: 'interne: 3 ≠ 2 ✗', tono: 'no' }, m3: { t: 'errore' } } },
      { nota: "Anche con matrici quadrate l'ordine conta: con A = [[2, 1], [1, 3]] e B = [[0, 1], [1, 0]], AB = [[1, 2], [3, 1]] ma BA = [[1, 3], [2, 1]]. Il prodotto di matrici <b>non è commutativo</b>; è però associativo: (AB)C = A(BC).", set: { a: { t: '2 × 2', w: 60, h: 60 }, b: { t: '2 × 2', w: 60, h: 60, tono: 'due' }, c: { t: '2 × 2', tono: 'ok', w: 60, h: 60, y: 60 }, m1: { t: 'AB = [[1, 2], [3, 1]]' }, m2: { t: 'BA = [[1, 3], [2, 1]]', tono: null }, m3: { t: '' }, m4: { t: 'AB ≠ BA', tono: 'no' } } }
    ]
  };

  // 9. identità e diagonale
  SCENE.identita = {
    w: 600, h: 230, lato: true,
    legenda: '{{j|s014|'}}',
    oggetti: [
      T('tm', 85, 30, 'I', { bold: true }), G('M', 40, 40, [['1', '0'], ['0', '1']], { toni: { '0,0': 'ora', '1,1': 'ora' } }),
      G('x', 160, 40, [['1'], ['2']], { toni: { '0,0': 'dato', '1,0': 'dato' } }), T('tx', 185, 30, 'x', { bold: true }),
      T('e', 235, 80, '=', { size: 20, bold: true }),
      G('y', 260, 40, [['1'], ['2']], { toni: { '0,0': 'ok', '1,0': 'ok' } }),
      T('c', 450, 60, 'Ix = x', { bold: true }), T('c2', 450, 100, '', { size: 13 }), T('c3', 450, 140, '', { size: 13 })
    ],
    passi: [
      { nota: "La <b>matrice identità</b> I ha 1 sulla diagonale principale e 0 altrove. Moltiplicata per qualsiasi vettore lo lascia com'è: Ix = x. È l'\"uno\" delle matrici: AI = IA = A. In NumPy: <code>np.eye(2)</code>." },
      { nota: "Una matrice <b>diagonale</b> ha numeri qualsiasi sulla diagonale e 0 altrove. diag(2, 3) · [1, 2] = [2, 6]: ogni componente viene moltiplicata per il suo numero della diagonale, indipendentemente dalle altre.", set: { tm: { t: 'diag(2, 3)' }, M: { valori: [['2', '0'], ['0', '3']] }, y: { valori: [['2'], ['6']] }, c: { t: 'diag(2, 3) x = [2, 6]' }, c2: { t: 'ogni asse scalato per conto suo' } } },
      { nota: "Le matrici diagonali sono le trasformazioni più semplici: allungano o accorciano ogni asse. Tornano nella settimana 4 (scala) e nella PCA, dove la covarianza diventa diagonale nella base giusta.", set: { c3: { t: 'scala: settimana 4' } } }
    ]
  };

  // 10. matrici ortogonali
  SCENE.ortogonale = {
    w: 600, h: 272, lato: true,
    legenda: '{{j|s015|'}}',
    oggetti: [
      { id: 'ax', tipo: 'assi', box: [50, 20, 260, 230], dom: [-5, 5, -1, 5.5], tacche: 1, numeri: false, etX: 'x₁', etY: 'x₂' },
      { id: 'q1', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 0, y2: 1, t: 'q₁', tx: 8, tono: 'due' },
      { id: 'q2', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: -1, y2: 0, t: 'q₂', ty: 16, tono: 'due' },
      { id: 'v', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: 3, y2: 4, t: 'v = [3, 4]', tono: 'dato', nascosto: true },
      { id: 'qv', tipo: 'vett', in: 'ax', x1: 0, y1: 0, x2: -4, y2: 3, t: 'Qv = [−4, 3]', tx: -20, ty: -12, tono: 'ok', nascosto: true },
      T('m', 470, 50, 'Q = [[0, −1], [1, 0]]', { bold: true, size: 13 }),
      T('c1', 470, 90, '', { size: 13 }), T('c2', 470, 120, '', { size: 13 }), T('c3', 470, 160, '', { size: 13, bold: true })
    ],
    passi: [
      { nota: "Una matrice è <b>ortogonale</b> (slide 48) se le sue colonne sono vettori di <b>lunghezza 1</b> e <b>perpendicolari</b> fra loro. Q = [[0, −1], [1, 0]]: colonne q₁ = [0, 1] e q₂ = [−1, 0]." },
      { nota: "Controllo: ‖q₁‖ = ‖q₂‖ = 1 e q₁ · q₂ = 0·(−1) + 1·0 = 0. In forma compatta: <b>QᵀQ = I</b>, quindi l'inversa di Q è semplicemente la sua trasposta.", set: { c1: { t: '‖q₁‖ = ‖q₂‖ = 1, q₁ · q₂ = 0' }, c2: { t: 'QᵀQ = I  ⇒  Q⁻¹ = Qᵀ' } } },
      { nota: "Applicata a v = [3, 4] dà Qv = [−4, 3]: una <b>rotazione</b> di 90°.", set: { v: { nascosto: false }, qv: { nascosto: false } } },
      { nota: "Le lunghezze non cambiano: ‖v‖ = 5 e ‖Qv‖ = 5. Le matrici ortogonali sono <b>rotazioni</b> (o riflessioni): spostano senza deformare. Una scala come diag(2, 1) invece allunga: ‖[6, 4]‖ ≈ 7.21 (valori controllati).", set: { c3: { t: '‖v‖ = ‖Qv‖ = 5', tono: 'ok' } } }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s016|}}</h1>
  <p class="lede">{{s|s017|}}</p>
</header>

<section>
  <h2>{{s|s018|}}</h2>
  <p>{{s|s019|}}</p>
  <p>{{s|s020|}}</p>
  <p>{{s|s021|}}</p>
  <figure class="scena" data-scena="matrice" data-titolo="{{a|s022|}}"></figure>
</section>

<section>
  <h2>{{s|s023|}}</h2>
  <p>{{s|s024|}}</p>
  <p>{{s|s025|}}</p>
  <p>{{s|s026|}}</p>
  <p>{{s|s027|}}</p>
  <figure class="scena" data-scena="treusi" data-titolo="{{a|s028|}}"></figure>
</section>

<section>
  <h2>{{s|s029|}}</h2>
  <p>{{s|s030|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s031|}}</th><th>{{s|s032|}}</th><th>{{s|s033|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s034|}}</td><td>{{s|s035|}}</td><td><code>A + B</code></td></tr>
      <tr><td>{{s|s036|}}</td><td>{{s|s037|}}</td><td><code>3 * A</code></td></tr>
      <tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td><code>A * B</code></td></tr>
      <tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td><code>A @ B</code></td></tr>
    </tbody>
  </table></div>
  <p>{{s|s042|}}</p>
  <figure class="scena" data-scena="elementi" data-titolo="{{a|s043|}}"></figure>
</section>

<section>
  <h2>{{s|s044|}}</h2>
  <p>{{s|s045|}}</p>
  <p>{{s|s046|}}</p>
  <p>{{s|s047|}}</p>
  <figure class="scena" data-scena="trasposta" data-titolo="{{a|s048|}}"></figure>
</section>

<section>
  <h2>{{s|s049|}}</h2>
  <p>{{s|s050|}}</p>
  <p>{{s|s051|}}</p>
  <div class="box regola" data-tit="{{a|s052|}}">
    <p>{{s|s053|}}</p>
  </div>
  <figure class="scena" data-scena="mv" data-titolo="{{a|s054|}}"></figure>
</section>

<section>
  <h2>{{s|s055|}}</h2>
  <p>{{s|s056|}}</p>
  <p>{{s|s057|}}</p>
  <p>{{s|s058|}}</p>
  <figure class="scena" data-scena="colonne" data-titolo="{{a|s059|}}"></figure>
</section>

<section>
  <h2>{{s|s060|}}</h2>
  <p>{{s|s061|}}</p>
  <p>{{s|s062|}}</p>
  <figure class="passi" data-titolo="{{a|s063|}}">
    <div class="passo"><div class="espr">(AB)<sub>ij</sub> = <mark class="ora">riga i di A</mark> · <mark class="due">colonna j di B</mark></div><p class="nota">{{s|s064|}}</p></div>
    <div class="passo"><div class="espr">A = [[2, 1], [1, 3]],  B = [[0, 1], [1, 0]]  ⇒  AB = [[1, 2], [3, 1]]</div><p class="nota">{{s|s065|}}</p></div>
    <div class="passo"><div class="espr">colonna j di AB = <mark class="ok">A · (colonna j di B)</mark></div><p class="nota">{{s|s066|}}</p></div>
  </figure>
  <figure class="scena" data-scena="mm" data-titolo="{{a|s067|}}"></figure>
</section>

<section>
  <h2>{{s|s068|}}</h2>
  <p>{{s|s069|}}</p>
  <p>{{s|s070|}}</p>
  <figure class="codice" data-titolo="{{a|s071|}}">
<pre data-lang="python">D = np.array([[1, 2, 3],
              [4, 5, 6]])     # forma (2, 3)
D.T.shape                     # (3, 2)
D @ D.T                       # (2, 3)(3, 2) → forma (2, 2): [[14, 32], [32, 77]]
(D.T @ D).shape               # (3, 2)(2, 3) → (3, 3)
D @ D                         # errore: (2, 3)(2, 3), 3 ≠ 2</pre>
    <ol class="spiega">
      <li data-righe="1-3" data-segna="(2, 3)@dato|(3, 2)@due"><p>{{s|s072|}}</p></li>
      <li data-righe="4-5" data-segna="D @ D.T@ok|D.T @ D@ok"><p>{{s|s073|}}</p></li>
      <li data-righe="6" data-segna="errore@no"><p>{{s|s074|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="dimensioni" data-titolo="{{a|s075|}}"></figure>
</section>

<section>
  <h2>{{s|s076|}}</h2>
  <p>{{s|s077|}}</p>
  <p>{{s|s078|}}</p>
  <figure class="scena" data-scena="identita" data-titolo="{{a|s079|}}"></figure>
</section>

<section>
  <h2>{{s|s080|}}</h2>
  <p>{{s|s081|}}</p>
  <p>{{s|s082|}}</p>
  <p>{{s|s083|}}</p>
  <figure class="scena" data-scena="ortogonale" data-titolo="{{a|s084|}}"></figure>
</section>

</main>
</body>
</html>
