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
SCENE.lock31 = {
  w: 600, h: 270, lato: false,
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'a1', tipo: 'nodo', r: 22, x: 110, y: 70, t: 'R', sopra: 't1: legge count' },
    { id: 'a2', tipo: 'nodo', r: 22, x: 250, y: 70, t: 'W', sopra: 't1: scrive count' },
    { id: 'b1', tipo: 'nodo', r: 22, x: 350, y: 190, t: 'R', sotto: 't2: legge count' },
    { id: 'b2', tipo: 'nodo', r: 22, x: 490, y: 190, t: 'W', sotto: 't2: scrive count' },
    { id: 'p1', tipo: 'arco', da: 'a1', a: 'a2', dir: true }, { id: 'p2', tipo: 'arco', da: 'b1', a: 'b2', dir: true },
    { id: 'race', tipo: 'linea', x1: 272, y1: 78, x2: 468, y2: 182, tratt: true, tono: 'no', nascosto: true },
    { id: 'hb', tipo: 'arco', da: 'a2', a: 'b1', dir: true, t: 'unlock → lock', nascosto: true },
    { id: 'n', tipo: 'testo', x: 300, y: 255, t: '', size: 13, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}' },
    { nota: '{{j|s004|'}}', set: { a2: { tono: 'no' }, b2: { tono: 'no' }, race: { nascosto: false }, n: { t: 'senza lock: data race', tono: 'no' } } },
    { nota: '{{j|s005|'}}', set: { race: { nascosto: true }, a2: { tono: null }, b2: { tono: null }, hb: { nascosto: false, tono: 'ora' }, n: { t: 'HB1 = HB ∪ { t1 unlock → t2 lock }', tono: 'ora' } } },
    { nota: '{{j|s006|'}}', set: { a1: { tono: 'ok' }, a2: { tono: 'ok' }, b1: { tono: 'ok' }, b2: { tono: 'ok' }, n: { t: 'con lock: ogni conflitto è ordinato', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});
  const A = (id, da, a, extra) => Object.assign({ id, tipo: 'arco', da, a, dir: true, nascosto: true }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const vedi = (ids, v) => Object.fromEntries(ids.map(k => [k, Object.assign({ nascosto: false }, v || {})]));
  const toni = (ids, tono) => Object.fromEntries(ids.map(k => [k, { tono }]));

  // struttura comune del programma di CountingThread
  const ML = ['init', 'new1', 'new2', 'st1', 'st2', 'j1', 'j2', 'p'];
  const MM = ML.map((_, i) => 'm' + i), TT = ['a1', 'a2', 'b1', 'b2'];
  const PM = [0, 1, 2, 3, 4, 5, 6].map(i => 'pm' + i);
  const base = nasc => {
    const og = [T('lm', 18, 50, 'm', { bold: true }), T('l1', 18, 140, 't1', { bold: true }), T('l2', 18, 220, 't2', { bold: true })];
    ML.forEach((t, i) => og.push(N('m' + i, 60 + i * 70, 50, t, 'dato', { nascosto: nasc })));
    og.push(N('a1', 230, 140, '1', 'ora', { nascosto: nasc }), N('a2', 300, 140, '2', 'ora', { nascosto: nasc }));
    og.push(N('b1', 380, 220, '1', 'due', { nascosto: nasc }), N('b2', 450, 220, '2', 'due', { nascosto: nasc }));
    PM.forEach((id, i) => og.push(A(id, 'm' + i, 'm' + (i + 1))));
    og.push(A('pa', 'a1', 'a2'), A('pb', 'b1', 'b2'), A('s1', 'm3', 'a1', { tono: 'ok' }), A('s2', 'm4', 'b1', { tono: 'ok' }), A('e1', 'a2', 'm5', { tono: 'ok' }), A('e2', 'b2', 'm6', { tono: 'ok' }));
    return og;
  };

  // 1. il programma numerato
  const og1 = base(true); og1.push(T('c', 560, 150, '', { size: 12 }), T('c2', 560, 172, '', { size: 12 }));
  SCENE.numera = {
    w: 640, h: 250, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: og1,
    passi: [
      { nota: "Il primo passo di ogni esercizio sul memory model: dare un <b>nome</b> a ogni operazione, per poterne parlare. Una riga per thread: il main (m), t1, t2." },
      { nota: "Le azioni del <b>main</b>, nell'ordine del codice: init (count = 0), new1 e new2 (creazione dei due oggetti thread), st1 e st2 (i due start), j1 e j2 (i due join), p (la println di count).", set: vedi(MM) },
      { nota: "Le azioni di <b>t1</b>: il corpo di run() ha due operazioni su count: (1) <code>int temp = count</code>, una lettura; (2) <code>count = temp + 1</code>, una scrittura.", set: vedi(['a1', 'a2'], { tono: 'ora' }) },
      { nota: "<b>t2</b> esegue lo stesso run(), quindi ha le stesse due operazioni. Stesso codice, thread diverso: azioni diverse.", set: Object.assign(vedi(['b1', 'b2'], { tono: 'due' }), { c: { t: 't1(1): lettura di t1' }, c2: { t: 't2(2): scrittura di t2' } }) },
      { nota: "La notazione <b>t(o)</b> dice chi fa cosa: t1(1) è la lettura fatta da t1, t2(2) la scrittura fatta da t2, m(start(t1)) lo start fatto dal main. La numerazione è libera, basta <b>dichiararla</b>." }
    ]
  };

  // 2. tipi di azione
  const og2 = base(false); og2.push(T('c', 320, 264, '', { size: 12, bold: true }));
  SCENE.tipi31 = {
    w: 640, h: 276, lato: true,
    legenda: '{{j|s008|'}}',
    oggetti: og2,
    passi: [
      { nota: "3.1.1 chiede di classificare ogni azione in uno dei tre tipi: <b>variable access</b>, <b>synchronization</b>, <b>other</b>. Partiamo da tutto grigio.", set: toni(MM.concat(TT), 'spento') },
      { nota: "<b>Variable access</b>: tutto ciò che legge o scrive count. Nel main init (scrittura) e p (lettura); in ogni thread (1) lettura e (2) scrittura.", set: Object.assign(toni(['m0', 'm7', 'a1', 'a2', 'b1', 'b2'], 'dato'), { c: { t: 'init, p, t1(1), t1(2), t2(1), t2(2): accessi a count' } }) },
      { nota: "<b>Synchronization</b>: start e join. Sono le azioni che possono creare ordine <b>fra</b> thread (start rule, termination rule).", set: Object.assign(toni(['m3', 'm4', 'm5', 'm6'], 'ora'), { c: { t: 'st1, st2, j1, j2: sincronizzazione' } }) },
      { nota: "<b>Other</b>: new1 e new2 creano gli oggetti thread. Scrivono anche le variabili locali t1 e t2 del main: chiamarle variable access è accettabile se lo dici, tanto non sono condivise e non cambiano l'analisi.", set: Object.assign(toni(['m1', 'm2'], 'due'), { c: { t: 'new1, new2: other' } }) }
    ]
  };

  // 3. gli insiemi
  const og3 = base(false); og3.push(T('c', 320, 264, '', { size: 12, bold: true }));
  SCENE.insiemi31 = {
    w: 640, h: 276, lato: true,
    legenda: '{{j|s009|'}}',
    oggetti: og3,
    passi: [
      { nota: "3.1.2–3.1.4: scrivere gli insiemi di coppie. Ognuno viene da una regola." },
      { nota: "<b>POm</b>: il program order del main, una catena di 8 azioni.", set: Object.assign(vedi(PM), { c: { t: 'POm = { init → new1 → … → j2 → p }' } }) },
      { nota: "<b>PO1</b> e <b>PO2</b>: una coppia per thread. Sono uguali in tutte le esecuzioni: il program order dipende solo dal codice.", set: Object.assign(vedi(['pa', 'pb']), { c: { t: 'PO1 = { t1(1) → t1(2) }   PO2 = { t2(1) → t2(2) }' } }) },
      { nota: "<b>S</b> (3.1.3, start rule): ogni start va verso la <b>prima</b> azione del thread.", set: Object.assign(vedi(['s1', 's2']), { c: { t: 'S = { st1 → t1(1), st2 → t2(1) }', tono: 'ok' } }) },
      { nota: "<b>T</b> (termination rule): l'<b>ultima</b> azione di ogni thread va verso il suo join.", set: Object.assign(vedi(['e1', 'e2']), { c: { t: 'T = { t1(2) → j1, t2(2) → j2 }', tono: 'ok' } }) },
      { nota: "3.1.4: le azioni di sincronizzazione (st1, st2, j1, j2) sono tutte del main, e il program order le mette già in fila: <b>un solo</b> synchronization order. Si scrive come sequenza, tra parentesi e con le virgole, non come catena di frecce.", set: Object.assign(toni(['m3', 'm4', 'm5', 'm6'], 'ok'), { c: { t: 'synchronization order: (st1, st2, j1, j2)', tono: null } }) }
    ]
  };

  // 4. la data race
  const og4 = base(false);
  og4.forEach(o => { if (o.tipo === 'arco') o.nascosto = false; });
  og4.push({ id: 'k1', tipo: 'arco', da: 'a2', a: 'b2', t: '?', tono: 'no', nascosto: true, curva: 30 });
  og4.push(T('c', 320, 264, '', { size: 12, bold: true }));
  SCENE.race31 = {
    w: 640, h: 276, lato: true,
    legenda: '{{j|s010|'}}',
    oggetti: og4,
    passi: [
      { nota: "3.1.5: dimostrare che c'è una data race. Il grafo è l'unico happens-before (un solo synchronization order)." },
      { nota: "Le coppie <b>in conflitto</b>: stessa variabile count, almeno una scrittura, thread diversi. Sono (t1(1), t2(2)), (t1(2), t2(1)) e (t1(2), t2(2)). Guardiamo le due scritture.", set: Object.assign(toni(['a2', 'b2'], 'no'), vedi(['k1']), { c: { t: 'in conflitto: t1(2) e t2(2), due scritture di count', tono: 'no' } }) },
      { nota: "Da t1(2), seguendo le frecce, si arriva solo a j1, poi j2, poi p. Nessuna di queste azioni è t2(2).", set: Object.assign(toni(['m5', 'm6', 'm7'], 'ok'), { c: { t: 'da t1(2): j1 → j2 → p, mai t2(2)', tono: null } }) },
      { nota: "Da t2(2) si arriva solo a j2 e p. Nessuna freccia porta a t1(2).", set: Object.assign(toni(['m5'], 'dato'), { c: { t: 'da t2(2): j2 → p, mai t1(2)' } }) },
      { nota: "Né (t1(2), t2(2)) né (t2(2), t1(2)) stanno in HB: le due scritture <b>non sono ordinate</b>. Azioni in conflitto non ordinate = <b>data race</b>, in tutte le esecuzioni. La prova è l'assenza del percorso, non il fatto che count possa valere 1.", set: Object.assign(toni(['m5', 'm6', 'm7'], 'dato'), { c: { t: '(t1(2), t2(2)) ∉ HB e (t2(2), t1(2)) ∉ HB ⇒ data race', tono: 'no' } }) }
    ]
  };

  // 5. volatile count: niente data race, ma race condition
  SCENE.vol31 = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s011|'}}',
    oggetti: [
      R('mem', 210, 16, 180, 36, 'volatile count = 0', { tono: 'spento' }),
      T('l1', 50, 90, 't1', { bold: true }), T('l2', 50, 150, 't2', { bold: true }),
      T('x1', 110, 90, '', { size: 12, anchor: 'start' }), T('x2', 110, 150, '', { size: 12, anchor: 'start' }),
      T('y1', 360, 90, '', { size: 12, anchor: 'start' }), T('y2', 360, 150, '', { size: 12, anchor: 'start' }),
      T('c', 300, 200, '', { size: 12, bold: true }), T('c2', 300, 228, '', { size: 12 })
    ],
    passi: [
      { nota: "3.1.8: con <code>volatile int count</code> il programma è data race free? Sì: gli accessi a variabili volatile, per definizione, <b>non sono mai in conflitto</b>. E count era l'unica variabile condivisa.", set: { mem: { tono: 'ok' }, c: { t: 'nessuna coppia in conflitto ⇒ correttamente sincronizzato', tono: 'ok' } } },
      { nota: "3.1.9: ma i valori stampati? t1 legge count: 0.", set: { x1: { t: 't1(1): temp = count → 0', tono: 'ora' }, c: { t: '' } } },
      { nota: "Prima che t1 scriva, t2 legge count: ancora 0. Nessuna regola lo vieta: la regola volatile ordina una scrittura con le letture <b>successive</b>, e qui non c'è ancora nessuna scrittura.", set: { x2: { t: 't2(1): temp = count → 0', tono: 'due' } } },
      { nota: "Tutti e due scrivono temp + 1 = 1. Il main stampa <b>1</b>: un incremento perso.", set: { y1: { t: 't1(2): count = 1', tono: 'ora' }, y2: { t: 't2(2): count = 1', tono: 'no' }, mem: { t: 'volatile count = 1', tono: 'no' }, c: { t: 'volatile: stampa 1 oppure 2', tono: 'no' } } },
      { nota: "Con il lock (3.1.6) lettura e scrittura stanno nella stessa sezione critica: stampa <b>sempre 2</b>. Morale: <b>data race free non vuol dire race condition free</b>. volatile dà visibilità, non mutua esclusione.", set: { c2: { t: 'lock: stampa sempre 2', tono: 'ok' } } }
    ]
  };

  // 6. mutua esclusione con happens-before
  const cs = (id, x, y, t, tono, extra) => R(id, x, y, 120, 34, t, Object.assign({ tono }, extra || {}));
  SCENE.mutex31 = {
    w: 620, h: 250, lato: true,
    legenda: '{{j|s012|'}}',
    oggetti: [
      T('l1', 30, 77, 't1', { bold: true }), T('l2', 30, 167, 't2', { bold: true }),
      cs('A', 60, 60, 't1(0) … t1(3)', 'ora'), cs('B', 260, 150, 't2(0) … t2(3)', 'due'),
      F('f', 180, 77, 260, 160, '', { tono: 'ok' }),
      cs('A2', 460, 60, 'it. 2 di t1', 'ora', { nascosto: true }), cs('B2', 320, 150, 'it. 2 di t2', 'due', { nascosto: true }),
      F('g1', 300, 77, 320, 160, '', { tono: 'ok', nascosto: true }), F('g2', 440, 167, 460, 70, '', { tono: 'ok', nascosto: true }),
      T('c', 310, 225, '', { size: 12, bold: true })
    ],
    passi: [
      { nota: "3.1.10: che cosa vuol dire <b>mutua esclusione</b>, detto con happens-before? Ogni thread ha la sua sezione critica: lock (0), lettura (1), scrittura (2), unlock (3)." },
      { nota: "Caso t1 prima: l'unlock di t1 happens-before il lock di t2, cioè <b>t1(3) → t2(0)</b> (regola del monitor). Tutta la sezione critica di t1 viene prima di quella di t2.", set: { c: { t: 't1(3) → t2(0)', tono: 'ok' } } },
      { nota: "Caso t2 prima: <b>t2(3) → t1(0)</b>. La mutua esclusione è proprio questo: in <b>ogni</b> esecuzione vale una delle due coppie. Le sezioni critiche non si sovrappongono mai.", set: { A: { x: 260 }, B: { x: 60 }, f: { x1: 180, y1: 167, x2: 260, y2: 70 }, c: { t: 'oppure t2(3) → t1(0)' } } },
      { nota: "3.1.11: con il corpo in un <code>while (true)</code> ogni iterazione i di t1 ha le sue azioni t1(0ᵢ)…t1(3ᵢ). Le sezioni critiche si alternano in un ordine qualsiasi.", set: { B: { x: 40, t: 'it. 1 di t2' }, A: { x: 180, t: 'it. 1 di t1' }, f: { x1: 160, y1: 167, x2: 180, y2: 70 }, A2: { nascosto: false }, B2: { nascosto: false }, g1: { nascosto: false }, g2: { nascosto: false }, c: { t: 'iterazioni: un unlock prima di ogni lock dell’altro' } } },
      { nota: "Per <b>ogni</b> coppia di iterazioni i di t1 e j di t2, il synchronization order mette un lock dopo l'unlock dell'altro: vale t1(3ᵢ) → t2(0ⱼ) oppure t2(3ⱼ) → t1(0ᵢ). Con il program order, tutte le coppie in conflitto sono ordinate: nessuna data race, anche in un'esecuzione infinita.", set: { c: { t: 'per ogni i, j: t1(3ᵢ) → t2(0ⱼ) oppure t2(3ⱼ) → t1(0ᵢ)', tono: 'ok' } } }
    ]
  };

  // 7. StringSet
  SCENE.stringset = {
    w: 640, h: 250, lato: true,
    legenda: '{{j|s013|'}}',
    oggetti: [
      T('l1', 22, 70, 't1', { bold: true }), T('l2', 22, 180, 't2', { bold: true }),
      N('p0', 80, 70, 'lk', 'ora', { sopra: 'lock(s)' }), N('p1', 160, 70, 'a', 'ora', { sopra: 'indexOf' }), N('p2', 240, 70, 'b', 'ora', { sopra: 'add' }), N('p3', 320, 70, 'ul', 'ora', { sopra: 'unlock(s)' }),
      N('q0', 400, 180, 'lk', 'due', { sotto: 'lock(s)', nascosto: true }), N('q1', 480, 180, 'c', 'due', { sotto: 'indexOf' }), N('q2', 560, 180, 'ul', 'due', { sotto: 'unlock(s)', nascosto: true }),
      A('pp0', 'p0', 'p1', { nascosto: false }), A('pp1', 'p1', 'p2', { nascosto: false }), A('pp2', 'p2', 'p3', { nascosto: false }),
      A('qq0', 'q0', 'q1'), A('qq1', 'q1', 'q2'),
      { id: 'k', tipo: 'arco', da: 'p2', a: 'q1', t: '?', tono: 'no', nascosto: true },
      A('mon', 'p3', 'q0', { tono: 'ok' }), A('mon2', 'q2', 'p0', { tono: 'ok' }),
      T('c', 320, 240, '', { size: 12, bold: true })
    ],
    passi: [
      { nota: "3.2: t1 chiama <code>findOrAdd(s)</code>, che è synchronized: lock, indexOf (a), add (b), unlock. t2 chiama <code>find(s)</code>, <b>senza</b> lock: solo indexOf (c)." },
      { nota: "3.2.1: t1(b) scrive la lista, t2(c) la legge: sono <b>in conflitto</b>. t2 non fa nessuna azione sul monitor di s, quindi nessuna regola le collega: <b>data race</b>, in tutte le esecuzioni (la lista parte vuota, add avviene sempre).", set: { k: { nascosto: false }, p2: { tono: 'no' }, q1: { tono: 'no' }, c: { t: 'find senza lock: data race', tono: 'no' } } },
      { nota: "3.2.2: rendiamo find synchronized. Ora t2 fa lock e unlock sullo <b>stesso</b> monitor. Se t1 entra per primo, la regola del monitor dà t1(unlock) → t2(lock): b e c sono ordinate.", set: { k: { nascosto: true }, q0: { nascosto: false }, q2: { nascosto: false }, qq0: { nascosto: false }, qq1: { nascosto: false }, mon: { nascosto: false }, p2: { tono: 'ok' }, q1: { tono: 'ok' }, c: { t: 't1 prima: find restituisce 0', tono: 'ok' } } },
      { nota: "Se entra prima t2, vale t2(unlock) → t1(lock): ordinate lo stesso, al contrario. Nessuna data race: correttamente sincronizzato.", set: { mon: { nascosto: true }, mon2: { nascosto: false }, q0: { x: 80 }, q1: { x: 160 }, q2: { x: 240 }, p0: { x: 320 }, p1: { x: 400 }, p2: { x: 480 }, p3: { x: 560 }, c: { t: 't2 prima: find restituisce -1' } } },
      { nota: "Il risultato di find però cambia (0 o -1) a seconda di chi entra prima: è una <b>race condition</b>, non una data race. Il memory model garantisce la visibilità, non l'ordine degli arrivi.", set: { c: { t: 'nessuna data race, ma race condition sul risultato', tono: null } } }
    ]
  };

  // 8. il ciclo che può non finire
  const rx = [140, 220, 300, 380, 460, 540];
  const og8 = [T('lm', 22, 60, 'm', { bold: true }), T('l1', 22, 170, 't1', { bold: true }),
    N('st', 80, 60, 'st1', 'dato'), N('w', 340, 60, 'w', 'dato', { sopra: 'x = 42' })];
  rx.forEach((x, i) => og8.push(N('r' + i, x, 170, 'r', 'ora', { sotto: 'x == 0 ?' })));
  og8.push(A('ms', 'st', 'w', { nascosto: false }), A('s', 'st', 'r0', { tono: 'ok' }));
  for (let i = 0; i < 5; i++) og8.push(A('rr' + i, 'r' + i, 'r' + (i + 1), { nascosto: false }));
  og8.push(A('v4', 'w', 'r4', { tono: 'ok' }), T('c', 320, 235, '', { size: 12, bold: true }));
  SCENE.ciclo33 = {
    w: 640, h: 250, lato: true,
    legenda: '{{j|s014|'}}',
    oggetti: og8,
    passi: [
      { nota: "3.3: t1 ripete <code>while (x == 0)</code>: una catena di letture r. Il main fa start(t1) e poi scrive <code>x = 42</code> (w)." },
      { nota: "La start rule dà st1 → prima lettura. Ma w viene <b>dopo</b> start nel program order del main: la start rule non dice niente su w.", set: { s: { nascosto: false }, c: { t: 'st1 → r: sì    w → r: nessuna regola' } } },
      { nota: "3.3.2: senza lock, volatile o join, <b>nessuna</b> coppia w → r. Le letture non sono obbligate a vedere 42: t1 può leggere 0 per sempre (e il JIT può trasformare il ciclo in while(true)).", set: Object.assign(toni(['r1', 'r2', 'r3', 'r4', 'r5'], 'no'), { c: { t: 'nessuna esecuzione ha w → r: può non terminare', tono: 'no' } }) },
      { nota: "3.3.1 + 3.3.3: serve <b>w → r</b> per una lettura che avviene dopo la scrittura. Con <code>volatile int x</code>, ogni lettura successiva a w ha w → r (regola volatile): quella lettura vede 42 e il ciclo esce.", set: Object.assign(toni(['r1', 'r2', 'r3'], 'ora'), toni(['r4'], 'ok'), { v4: { nascosto: false }, r5: { nascosto: true }, rr4: { nascosto: true }, c: { t: 'volatile: w → r successiva, il ciclo termina', tono: 'ok' } }) }
    ]
  };
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s015|}}</h1>
  <p class="lede">{{s|s016|}}</p>
</header>

<section>
  <h2>{{s|s017|}}</h2>
  <pre class="cod" data-lang="java">// main (thread m)
count = 0;                              // (init)
CountingThread t1 = new CountingThread();   // (new1)
CountingThread t2 = new CountingThread();   // (new2)
t1.start();                             // (start(t1))
t2.start();                             // (start(t2))
t1.join();                              // (join(t1))
t2.join();                              // (join(t2))
System.out.println("count=" + count);   // (p)

// run() di CountingThread (t1 e t2)
int temp = count;      // (1)
count = temp + 1;      // (2)</pre>
  <div class="box attenzione" data-tit="{{a|s018|}}">
    <p>{{s|s019|}}</p>
  </div>
  <figure class="scena" data-scena="numera" data-titolo="{{a|s020|}}"></figure>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s022|}}</th><th>{{s|s023|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s024|}}</td><td>{{s|s025|}}</td></tr>
      <tr><td>{{s|s026|}}</td><td>{{s|s027|}}</td></tr>
      <tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td></tr>
      <tr><td><code>m(p)</code></td><td>{{s|s030|}}</td></tr>
      <tr><td><code>t1(1)</code>, <code>t2(1)</code></td><td>{{s|s031|}}</td></tr>
      <tr><td><code>t1(2)</code>, <code>t2(2)</code></td><td>{{s|s032|}}</td></tr>
    </tbody>
  </table></div>
  <p class="piccolo">{{s|s033|}}</p>
  <figure class="scena" data-scena="tipi31" data-titolo="{{a|s034|}}"></figure>
</section>

<section>
  <h2>{{s|s035|}}</h2>
  <figure class="passi" data-titolo="{{a|s036|}}">
    <div class="passo"><div class="espr"><mark class="dato">PO<sub>m</sub></mark> = { m(init) → m(new1) → m(new2) → m(start(t1)) → m(start(t2)) → m(join(t1)) → m(join(t2)) → m(p) }</div><p class="nota">{{s|s037|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">PO<sub>1</sub> = { t1(1) → t1(2) }</mark>     <mark class="due">PO<sub>2</sub> = { t2(1) → t2(2) }</mark></div><p class="nota">{{s|s038|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">S</mark> = { m(start(t1)) → t1(1),  m(start(t2)) → t2(1) }</div><p class="nota">{{s|s039|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">T</mark> = { t1(2) → m(join(t1)),  t2(2) → m(join(t2)) }</div><p class="nota">{{s|s040|}}</p></div>
    <div class="passo"><div class="espr">m(start(t1)), m(start(t2)), m(join(t1)), m(join(t2))</div><p class="nota">{{s|s041|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s042|}}">
    <p>{{s|s043|}}</p>
  </div>
  <figure class="scena" data-scena="insiemi31" data-titolo="{{a|s044|}}"></figure>
</section>

<section>
  <h2>{{s|s045|}}</h2>
  <figure class="passi" data-titolo="{{a|s046|}}">
    <div class="passo"><div class="espr">in conflitto:  (t1(1), t2(2)) · (t1(2), t2(1)) · <mark class="no">(t1(2), t2(2))</mark></div><p class="nota">{{s|s047|}}</p></div>
    <div class="passo"><div class="espr">HB = chiusura transitiva di ( PO<sub>m</sub> ∪ PO<sub>1</sub> ∪ PO<sub>2</sub> ∪ S ∪ T )</div><p class="nota">{{s|s048|}}</p></div>
    <div class="passo"><div class="espr">da <mark class="ora">t1(2)</mark> si arriva solo a: m(join(t1)) → m(join(t2)) → m(p)</div><p class="nota">{{s|s049|}}</p></div>
    <div class="passo"><div class="espr">da <mark class="due">t2(2)</mark> si arriva solo a: m(join(t2)) → m(p)</div><p class="nota">{{s|s050|}}</p></div>
    <div class="passo"><div class="espr">t1(2) → t2(2) ∉ HB   e   t2(2) → t1(2) ∉ HB   ⇒   <mark class="no">data race</mark></div><p class="nota">{{s|s051|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s052|}}">
    <p>{{s|s053|}}</p>
  </div>
  <figure class="scena" data-scena="race31" data-titolo="{{a|s054|}}"></figure>
</section>

<section>
  <h2>{{s|s055|}}</h2>
  <pre class="cod" data-lang="java">// run()
l.lock();              // (0)
int temp = count;      // (1)
count = temp + 1;      // (2)
l.unlock();            // (3)   (con try/finally)</pre>
  <figure class="passi" data-titolo="{{a|s056|}}">
    <div class="passo"><div class="espr">PO<sub>m</sub> + <mark class="dato">m(init(l))</mark>     PO<sub>1</sub> = { t1(0) → t1(1) → t1(2) → t1(3) }     PO<sub>2</sub> = { t2(0) → … → t2(3) }</div><p class="nota">{{s|s057|}}</p></div>
    <div class="passo"><div class="espr">S = { m(start(t1)) → <mark class="ora">t1(0)</mark>, m(start(t2)) → <mark class="due">t2(0)</mark> }     T = { <mark class="ora">t1(3)</mark> → m(join(t1)), <mark class="due">t2(3)</mark> → m(join(t2)) }</div><p class="nota">{{s|s058|}}</p></div>
    <div class="passo"><div class="espr">HB<sub>1</sub> = HB ∪ { <mark class="ora">t1(3)</mark> → <mark class="due">t2(0)</mark> }      HB<sub>2</sub> = HB ∪ { <mark class="due">t2(3)</mark> → <mark class="ora">t1(0)</mark> }</div><p class="nota">{{s|s059|}}</p></div>
    <div class="passo"><div class="espr">HB<sub>1</sub>: t1(2) <sub>po</sub>→ t1(3) <sub>monitor</sub>→ t2(0) <sub>po</sub>→ t2(1) <sub>po</sub>→ <mark class="ok">t2(2)</mark></div><p class="nota">{{s|s060|}}</p></div>
    <div class="passo"><div class="espr">HB<sub>2</sub>: t2(2) <sub>po</sub>→ t2(3) <sub>monitor</sub>→ t1(0) <sub>po</sub>→ t1(1) <sub>po</sub>→ <mark class="ok">t1(2)</mark></div><p class="nota">{{s|s061|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">tutte le coppie in conflitto sono ordinate in HB₁ e in HB₂  ⇒  nessuna data race</mark></div><p class="nota">{{s|s062|}}</p></div>
  </figure>
  <figure class="scena" data-scena="lock31" data-titolo="{{a|s063|}}"></figure>
  <div class="box domanda-tua" data-tit="{{a|s064|}}">
    <p>{{s|s065|}}</p>
    <p>{{s|s066|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s067|}}</h2>
  <figure class="passi" data-titolo="{{a|s068|}}">
    <div class="passo"><div class="espr">count è <mark class="dato">volatile</mark></div><p class="nota">{{s|s069|}}</p></div>
    <div class="passo"><div class="espr">accessi a variabili volatile  ⇒  <mark class="ok">mai in conflitto</mark></div><p class="nota">{{s|s070|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">nessuna coppia in conflitto ⇒ nessuna data race ⇒ correttamente sincronizzato</mark></div><p class="nota">{{s|s071|}}</p></div>
    <div class="passo"><div class="espr">t1(1) legge 0 → t2(1) legge 0 → t1(2) scrive 1 → t2(2) scrive <mark class="no">1</mark></div><p class="nota">{{s|s072|}}</p></div>
    <div class="passo"><div class="espr">lock: <mark class="ok">count = 2</mark> sempre      volatile: count = 1 <mark class="no">oppure</mark> 2</div><p class="nota">{{s|s073|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s074|}}">
    <p>{{s|s075|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s076|}}">
    <p>{{s|s077|}}</p>
  </div>
  <figure class="scena" data-scena="vol31" data-titolo="{{a|s078|}}"></figure>
</section>

<section>
  <h2>{{s|s079|}}</h2>
  <p>{{s|s080|}}</p>
  <p>{{s|s081|}}</p>
  <figure class="scena" data-scena="mutex31" data-titolo="{{a|s082|}}"></figure>
</section>

<section>
  <h2>{{s|s083|}}</h2>
  <pre class="cod" data-lang="java">public synchronized int findOrAdd(String s) {   // lock(s) · (a) indexOf · (b) add · unlock(s)
    int ret = list.indexOf(s);
    if (ret == -1) list.add(s);
    return ret;
}
public int find(String s) { return list.indexOf(s); }   // (c) indexOf, SENZA lock</pre>
  <ul>
    <li>{{s|s084|}}</li>
    <li>{{s|s085|}}</li>
    <li>{{s|s086|}}</li>
  </ul>
  <figure class="scena" data-scena="stringset" data-titolo="{{a|s087|}}"></figure>
</section>

<section>
  <h2>{{s|s088|}}</h2>
  <pre class="cod" data-lang="java">int x = 0;
Thread t1 = new Thread(() -> {
    while (x == 0) { }                 // (r) lettura di x, ripetuta
    System.out.println("t1: x=" + x);
});
t1.start();                            // (start(t1))
x = 42;                                // (w) scrittura
System.out.println("Main: x=" + x);</pre>
  <ul>
    <li>{{s|s089|}}</li>
    <li>{{s|s090|}}</li>
    <li>{{s|s091|}}</li>
  </ul>
  <div class="box domanda-tua" data-tit="{{a|s092|}}">
    <p>{{s|s093|}}</p>
  </div>
  <figure class="scena" data-scena="ciclo33" data-titolo="{{a|s094|}}"></figure>
</section>

</main>
</body>
</html>
