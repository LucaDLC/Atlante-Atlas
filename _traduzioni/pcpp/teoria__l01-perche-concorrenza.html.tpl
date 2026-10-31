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
  const X0 = 150, U = 38;
  const bar = (id, riga, da, a, t, tono) => ({ id, tipo: 'rett', x: X0 + da * U, y: 36 + riga * 62, w: (a - da) * U, h: 30, t, tono, nascosto: true });
  SCENE.tempo = {
    w: 620, h: 300, lato: false,
    oggetti: [
      { id: 'l0', tipo: 'testo', x: 10, y: 51, t: 'sequenziale · core 1', size: 12, anchor: 'start' },
      { id: 'l1', tipo: 'testo', x: 10, y: 113, t: 'parallelo · core 1', size: 12, anchor: 'start', nascosto: true },
      { id: 'l2', tipo: 'testo', x: 10, y: 175, t: 'parallelo · core 2', size: 12, anchor: 'start', nascosto: true },
      { id: 'l3', tipo: 'testo', x: 10, y: 237, t: 'concorrente · 1 core', size: 12, anchor: 'start', nascosto: true },
      bar('s1', 0, 0, 5, 'task 1', 'dato'), bar('s2', 0, 5, 10, 'task 2', 'due'),
      bar('p1', 1, 0, 5, 'task 1', 'dato'), bar('p2', 2, 0, 5, 'task 2', 'due'),
      bar('c1', 3, 0, 2, 't1', 'dato'), bar('c2', 3, 2, 3, 't2', 'due'), bar('c3', 3, 3, 5, 't1', 'dato'),
      bar('c4', 3, 5, 7, 't2', 'due'), bar('c5', 3, 7, 8, 't1', 'dato'), bar('c6', 3, 8, 10, 't2', 'due'),
      { id: 'asse', tipo: 'linea', x1: X0, y1: 285, x2: X0 + 10 * U, y2: 285 },
      { id: 'tt', tipo: 'testo', x: X0 + 10 * U, y: 275, t: 'tempo →', size: 12, anchor: 'end' }
    ],
    passi: [
      { nota: '{{j|s002|'}}', set: { s1: { nascosto: false }, s2: { nascosto: false } } },
      { nota: '{{j|s003|'}}', set: { l1: { nascosto: false }, l2: { nascosto: false }, p1: { nascosto: false }, p2: { nascosto: false } } },
      { nota: '{{j|s004|'}}', set: { l3: { nascosto: false }, c1: { nascosto: false }, c2: { nascosto: false }, c3: { nascosto: false }, c4: { nascosto: false }, c5: { nascosto: false }, c6: { nascosto: false } } }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const X0 = 190, U = 90; // 90 px = 1 ora
  SCENE.fosso = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s005|'}}',
    oggetti: [
      { id: 'asse', tipo: 'linea', x1: X0, y1: 228, x2: X0 + 4 * U, y2: 228, tono: 'spento' },
      T('h0', X0, 244, '0 h', { size: 11 }), T('h1', X0 + U, 244, '1 h', { size: 11 }), T('h2', X0 + 2 * U, 244, '2 h', { size: 11 }), T('h3', X0 + 3 * U, 244, '3 h', { size: 11 }),
      T('l1', 90, 40, 'una persona', { size: 12 }), R('a1', X0, 28, 2 * U, 24, '4 m di fosso', { tono: 'dato' }),
      T('l2', 90, 90, 'due, due pale', { size: 12, nascosto: true }), R('b1', X0, 72, U, 20, '2 m', { tono: 'dato', nascosto: true }), R('b2', X0, 96, U, 20, '2 m', { tono: 'due', nascosto: true }),
      T('l3', 90, 150, 'due, una pala', { size: 12, nascosto: true }),
      R('c1', X0, 140, 45, 20, '', { tono: 'dato', nascosto: true }), R('c2', X0 + 50, 140, 45, 20, '', { tono: 'due', nascosto: true }), R('c3', X0 + 100, 140, 45, 20, '', { tono: 'dato', nascosto: true }), R('c4', X0 + 150, 140, 45, 20, '', { tono: 'due', nascosto: true }),
      T('l4', 90, 196, 'una buca', { size: 12, nascosto: true }), R('d1', X0, 186, 2 * U + 30, 20, 'si intralciano', { tono: 'no', nascosto: true }),
      T('c', 520, 110, '', { size: 12 })
    ],
    passi: [
      { nota: "Una persona scava 4 metri di fosso in 2 ore (slide 15)." },
      { nota: "Due persone con <b>due pale</b>: ognuna scava metà fosso, 2 metri, nello stesso tempo. Finiscono in 1 ora. Il lavoro si <b>divide</b> e i flussi vanno davvero in parallelo.", set: { l2: { nascosto: false }, b1: { nascosto: false }, b2: { nascosto: false } } },
      { nota: "Due persone con <b>una sola pala</b>: la pala è una <b>risorsa condivisa</b>. Devono alternarsi, e ogni passaggio costa un po' di tempo. Si arriva oltre le 2 ore: nessun guadagno.", set: { l3: { nascosto: false }, c1: { nascosto: false }, c2: { nascosto: false }, c3: { nascosto: false }, c4: { nascosto: false } } },
      { nota: "Una <b>buca</b> invece di un fosso: il lavoro non si divide, se scavano nello stesso punto si intralciano. Le stesse due domande valgono per i computer: <b>quali risorse sono condivise</b> e <b>quanto il problema si divide</b>. Di questo parla il corso.", set: { l4: { nascosto: false }, d1: { nascosto: false }, c: { t: 'condiviso? divisibile?' } } }
    ]
  };

  const box = (id, x, t, tono) => R(id, x, 40, 170, 50, t, { tono });
  SCENE.nygaard = {
    w: 600, h: 250, lato: true,
    legenda: '{{j|s006|'}}',
    oggetti: [
      box('in', 15, 'inherent', null), box('hi', 215, 'hidden', null), box('ex', 415, 'exploitation', null),
      T('d1', 100, 110, '', { size: 11 }), T('d2', 300, 110, '', { size: 11 }), T('d3', 500, 110, '', { size: 11 }),
      R('web', 180, 170, 240, 44, 'richiedere una pagina web', { nascosto: true }),
      { id: 'f1', tipo: 'vett', x1: 240, y1: 168, x2: 110, y2: 94, t: '', nascosto: true },
      { id: 'f2', tipo: 'vett', x1: 300, y1: 168, x2: 300, y2: 94, t: '', nascosto: true },
      { id: 'f3', tipo: 'vett', x1: 360, y1: 168, x2: 490, y2: 94, t: '', nascosto: true }
    ],
    passi: [
      { nota: "<b>Inherent</b> (intrinseca): il problema è già fatto di flussi indipendenti. Un'interfaccia deve rispondere all'utente mentre aspetta la rete.", set: { in: { tono: 'dato' }, d1: { t: 'il problema ha più flussi' } } },
      { nota: "<b>Hidden</b> (nascosta): più programmi condividono le stesse risorse, e ognuno si comporta come se le avesse tutte. Il sistema operativo fa girare molti programmi su pochi core.", set: { hi: { tono: 'due' }, d2: { t: 'risorse condivise' } } },
      { nota: "<b>Exploitation</b> (sfruttamento): l'hardware può eseguire più flussi insieme e lo si vuole usare (più core, GPU, più computer).", set: { ex: { tono: 'ora' }, d3: { t: 'più hardware da usare' } } },
      { nota: "Richiedere una pagina web (slide 28): il browser resta usabile mentre aspetta (inherent), il server serve migliaia di utenti sugli stessi core (hidden), e usa tutti i core per servirne di più (exploitation). <b>Tutte e tre</b>: le categorie non si escludono, conta il motivo.", set: { web: { nascosto: false, tono: 'ok' }, f1: { nascosto: false }, f2: { nascosto: false }, f3: { nascosto: false } } }
    ]
  };

  const cer = (cx, cy, r) => { const p = []; for (let a = 0; a <= 2 * Math.PI + 0.01; a += 0.1) p.push([cx + r * Math.cos(a), cy + r * Math.sin(a)]); return p; };
  SCENE.goetz = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s007|'}}',
    oggetti: [
      { id: 'g', tipo: 'poli', punti: cer(210, 135, 110), tono: 'dato', vuoto: true },
      { id: 'n', tipo: 'poli', punti: cer(390, 135, 110), tono: 'due', vuoto: true },
      T('tg', 150, 18, 'Goetz', { bold: true, tono: 'dato' }), T('tn', 450, 18, 'Nygaard', { bold: true, tono: 'due' }),
      T('e1', 300, 120, '', { size: 11 }), T('e1b', 300, 138, '', { size: 11 }),
      T('e2', 160, 120, '', { size: 11 }), T('e2b', 160, 138, '', { size: 11 }),
      T('e3', 445, 120, '', { size: 11 }), T('e3b', 445, 138, '', { size: 11 })
    ],
    passi: [
      { nota: "Due classificazioni dei motivi della concorrenza: Goetz (resource utilization, fairness, convenience) e Nygaard (inherent, exploitation, hidden). L'esercizio 1.4 chiede esempi che stanno in una e non nell'altra." },
      { nota: "Nell'intersezione: un server che non lascia la CPU ferma mentre aspetta il disco è <i>resource utilization</i> per Goetz ed <i>exploitation/hidden</i> per Nygaard.", set: { e1: { t: 'CPU sfruttata', tono: 'ok' }, e1b: { t: 'durante l’I/O' } } },
      { nota: "Solo Goetz: una simulazione chiusa, su un solo core e senza I/O, divisa in thread <b>solo perché è più comoda da scrivere</b> (<i>convenience</i>). Nessuna delle categorie di Nygaard.", set: { e2: { t: 'simulazione chiusa', tono: 'ok' }, e2b: { t: 'per comodità' } } },
      { nota: "Solo Nygaard: un calcolo coordinato fra tanti computer indipendenti via internet (<i>exploitation</i>): i motivi di Goetz sono pensati per programmi che condividono una macchina. Il testo accetta molte risposte: conta <b>argomentare con il motivo</b>.", set: { e3: { t: 'computer via rete', tono: 'ok' }, e3b: { t: 'coordinati' } } }
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
  <figure class="passi" data-titolo="{{a|s012|}}">
    <div class="passo"><div class="espr testo">{{s|s013|}}</div><p class="nota">{{s|s014|}}</p></div>
    <div class="passo"><div class="espr testo">{{s|s015|}}</div><p class="nota">{{s|s016|}}</p></div>
    <div class="passo"><div class="espr testo">{{s|s017|}}</div><p class="nota">{{s|s018|}}</p></div>
    <div class="passo"><div class="espr testo">{{s|s019|}}</div><p class="nota">{{s|s020|}}</p></div>
  </figure>
  <figure class="scena" data-scena="fosso" data-titolo="{{a|s021|}}"></figure>
</section>

<section>
  <h2>{{s|s022|}}</h2>
  <figure class="scena" data-scena="tempo" data-titolo="{{a|s023|}}"></figure>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th></th><th>{{s|s024|}}</th><th>{{s|s025|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s026|}}</td><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr>
      <tr><td>{{s|s029|}}</td><td>{{s|s030|}}</td><td>{{s|s031|}}</td></tr>
      <tr><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box idea" data-tit="{{a|s035|}}">
    <p>{{s|s036|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s037|}}</h2>
  <p>{{s|s038|}}</p>
  <div class="colonne">
    <div class="carta">
      <h4>{{s|s039|}}</h4>
      <p>{{s|s040|}}</p>
    </div>
    <div class="carta">
      <h4>{{s|s041|}}</h4>
      <p>{{s|s042|}}</p>
    </div>
    <div class="carta">
      <h4>{{s|s043|}}</h4>
      <p>{{s|s044|}}</p>
    </div>
  </div>
  <figure class="passi" data-titolo="{{a|s045|}}">
    <div class="passo"><div class="espr testo">{{s|s046|}}</div><p class="nota">{{s|s047|}}</p></div>
    <div class="passo"><div class="espr testo">{{s|s048|}}</div><p class="nota">{{s|s049|}}</p></div>
    <div class="passo"><div class="espr testo">{{s|s050|}}</div><p class="nota">{{s|s051|}}</p></div>
    <div class="passo"><div class="espr testo">{{s|s052|}}</div><p class="nota">{{s|s053|}}</p></div>
  </figure>
  <figure class="scena" data-scena="nygaard" data-titolo="{{a|s054|}}"></figure>
</section>

<section>
  <h2>{{s|s055|}}</h2>
  <p>{{s|s056|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s057|}}</th><th>{{s|s058|}}</th><th>{{s|s059|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s060|}}</td><td>{{s|s061|}}</td><td>{{s|s062|}}</td></tr>
      <tr><td>{{s|s063|}}</td><td>{{s|s064|}}</td><td>{{s|s065|}}</td></tr>
      <tr><td>{{s|s066|}}</td><td>{{s|s067|}}</td><td>{{s|s068|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box domanda-tua" data-tit="{{a|s069|}}">
    <p>{{s|s070|}}</p>
    <ul>
      <li>{{s|s071|}}</li>
      <li>{{s|s072|}}</li>
    </ul>
    <p>{{s|s073|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s074|}}">
    <p>{{s|s075|}}</p>
  </div>
  <figure class="scena" data-scena="goetz" data-titolo="{{a|s076|}}"></figure>
</section>

</main>
</body>
</html>
