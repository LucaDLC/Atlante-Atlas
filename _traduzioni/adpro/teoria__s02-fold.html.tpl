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
SCENE.foldleft = {
  w: 520, h: 200,
  codice: { lang: 'scala', testo: `def foldLeft[A, B](l: List[A], z: B, f: (B, A) => B): B =
  l match
    case Nil => z
    case Cons(a, as) => foldLeft(as, f(z, a), f)` },
  legenda: '{{j|s002|'}}',
  oggetti: [
    { id: 'lista', tipo: 'celle', x: 30, y: 40, cw: 56, ch: 44, valori: ['1', '2', '3', '4'], indici: false },
    { id: 'tl', tipo: 'testo', x: 142, y: 22, t: 'la lista', size: 12 },
    { id: 'acc', tipo: 'rett', x: 330, y: 40, w: 160, h: 44, t: 'acc = 0', tono: 'dato' },
    { id: 'ta', tipo: 'testo', x: 410, y: 22, t: 'accumulatore', size: 12 },
    { id: 'expr', tipo: 'testo', x: 260, y: 150, t: '0', size: 17, bold: true }
  ],
  passi: [
    { nota: '{{j|s003|'}}', righe: [1] },
    { nota: '{{j|s004|'}}', righe: [4],
      set: { lista: { toni: { 0: 'ora' } }, acc: { t: 'acc = 1' }, expr: { t: '(0 + 1)' } } },
    { nota: '{{j|s005|'}}', righe: [4],
      set: { lista: { toni: { 0: 'spento', 1: 'ora' } }, acc: { t: 'acc = 3' }, expr: { t: '((0 + 1) + 2)' } } },
    { nota: '{{j|s006|'}}', righe: [4],
      set: { lista: { toni: { 0: 'spento', 1: 'spento', 2: 'ora' } }, acc: { t: 'acc = 6' }, expr: { t: '(((0 + 1) + 2) + 3)' } } },
    { nota: '{{j|s007|'}}', righe: [4],
      set: { lista: { toni: { 0: 'spento', 1: 'spento', 2: 'spento', 3: 'ora' } }, acc: { t: 'acc = 10' }, expr: { t: '((((0 + 1) + 2) + 3) + 4)' } } },
    { nota: '{{j|s008|'}}', righe: [3],
      set: { lista: { toni: { 0: 'spento', 1: 'spento', 2: 'spento', 3: 'spento' } }, acc: { t: 'risultato 10', tono: 'ok' }, expr: { tono: 'ok' } } }
  ]
};
SCENE.foldright = {
  w: 520, h: 300,
  codice: { lang: 'scala', testo: `def foldRight[A, B](l: List[A], z: B, f: (A, B) => B): B =
  l match
    case Nil => z
    case Cons(a, as) => f(a, foldRight(as, z, f))` },
  legenda: '{{j|s009|'}}',
  oggetti: [
    { id: 'lista', tipo: 'celle', x: 30, y: 40, cw: 56, ch: 44, valori: ['1', '2', '3', '4'], indici: false },
    { id: 'tl', tipo: 'testo', x: 142, y: 22, t: 'la lista', size: 12 },
    { id: 'tp', tipo: 'testo', x: 410, y: 22, t: 'in sospeso (pila)', size: 12 },
    { id: 'p1', tipo: 'rett', x: 330, y: 230, w: 160, h: 38, t: '1 + ?', nascosto: true },
    { id: 'p2', tipo: 'rett', x: 330, y: 184, w: 160, h: 38, t: '2 + ?', nascosto: true },
    { id: 'p3', tipo: 'rett', x: 330, y: 138, w: 160, h: 38, t: '3 + ?', nascosto: true },
    { id: 'p4', tipo: 'rett', x: 330, y: 92, w: 160, h: 38, t: '4 + ?', nascosto: true },
    { id: 'z', tipo: 'rett', x: 330, y: 46, w: 160, h: 38, t: 'z = 0', nascosto: true },
    { id: 'expr', tipo: 'testo', x: 145, y: 170, t: '', size: 15, bold: true }
  ],
  passi: [
    { nota: '{{j|s010|'}}', righe: [1] },
    { nota: '{{j|s011|'}}', righe: [4],
      set: { lista: { toni: { 0: 'ora' } }, p1: { nascosto: false, tono: 'due' }, expr: { t: '1 + (…)' } } },
    { nota: '{{j|s012|'}}', righe: [4],
      set: { lista: { toni: { 0: 'spento', 1: 'ora' } }, p2: { nascosto: false, tono: 'due' }, expr: { t: '1 + (2 + (…))' } } },
    { nota: '{{j|s013|'}}', righe: [4],
      set: { lista: { toni: { 0: 'spento', 1: 'spento', 2: 'ora' } }, p3: { nascosto: false, tono: 'due' }, expr: { t: '1 + (2 + (3 + (…)))' } } },
    { nota: '{{j|s014|'}}', righe: [4],
      set: { lista: { toni: { 0: 'spento', 1: 'spento', 2: 'spento', 3: 'ora' } }, p4: { nascosto: false, tono: 'due' }, expr: { t: '1 + (2 + (3 + (4 + …)))' } } },
    { nota: '{{j|s015|'}}', righe: [3],
      set: { lista: { toni: { 0: 'spento', 1: 'spento', 2: 'spento', 3: 'spento' } }, z: { nascosto: false, tono: 'ok' }, expr: { t: '1 + (2 + (3 + (4 + 0)))' } } },
    { nota: '{{j|s016|'}}', righe: [4],
      set: { z: { nascosto: true }, p4: { t: '4 + 0 = 4', tono: 'ok' }, expr: { t: '1 + (2 + (3 + 4))' } } },
    { nota: '{{j|s017|'}}', righe: [4],
      set: { p4: { nascosto: true }, p3: { t: '3 + 4 = 7', tono: 'ok' }, expr: { t: '1 + (2 + 7)' } } },
    { nota: '{{j|s018|'}}', righe: [4],
      set: { p3: { nascosto: true }, p2: { t: '2 + 7 = 9', tono: 'ok' }, expr: { t: '1 + 9' } } },
    { nota: '{{j|s019|'}}', righe: [4],
      set: { p2: { nascosto: true }, p1: { t: '1 + 9 = 10', tono: 'ok' }, expr: { t: '10', tono: 'ok' } } }
  ]
};
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

    const K = [['la lista', 'l'], ['int acc = 0;', 'z (partenza)'], ['acc = acc + x;', 'f (come combinare)'], ['for (x : l)', 'il fold stesso']];
    const og = [T('hj', 150, 22, 'Java', { bold: true }), T('hf', 440, 22, 'fold', { bold: true })];
    K.forEach(([j, f], i) => og.push(R('j' + i, 40, 36 + i * 44, 220, 34, j, { tono: 'spento' }), R('f' + i, 330, 36 + i * 44, 220, 34, f, { tono: 'spento' }), F('a' + i, 262, 53 + i * 44, 326, 53 + i * 44, '', { nascosto: true })));
    og.push(T('c', 295, 228, '', { size: 12 }));
    const acc = i => ({ ['j' + i]: { tono: 'dato' }, ['f' + i]: { tono: 'ora' }, ['a' + i]: { nascosto: false } });
    SCENE.ingredienti = {
      w: 590, h: 240, lato: true,
      legenda: '{{j|s020|'}}',
      oggetti: og,
      passi: [
        { nota: "Sommare una lista in Java: una variabile che parte da 0, un ciclo, un +=. Un fold ha gli <b>stessi pezzi</b>, ma senza variabile." },
        { nota: "La lista da scorrere è l'argomento <code>l</code>.", set: acc(0) },
        { nota: "Il valore iniziale della variabile diventa <code>z</code>: per la somma, 0.", set: acc(1) },
        { nota: "L'aggiornamento dentro il ciclo diventa la funzione <code>f</code>: per la somma <code>_ + _</code>.", set: acc(2) },
        { nota: "Il ciclo stesso è il fold (foldLeft o foldRight). Come scegliere z: \"quanto vale il fold di una lista vuota?\" Somma 0, prodotto 1, lunghezza 0, lista costruita Nil.", set: Object.assign(acc(3), { c: { t: 'z = risultato sulla lista vuota: somma 0, prodotto 1, lista Nil' } }) }
      ]
    };

    SCENE.sottrazione = {
      w: 590, h: 250, lato: true,
      legenda: '{{j|s021|'}}',
      oggetti: [
        T('hr', 150, 24, 'foldRight(List(1,2,3,4), 0, _ - _)', { bold: true, size: 12 }), T('hl', 440, 24, 'foldLeft(List(1,2,3,4), 0, _ - _)', { bold: true, size: 12 }),
        T('r0', 150, 60, '1 - (2 - (3 - (4 - 0)))', { tono: 'ora' }), T('l0', 440, 60, '(((0 - 1) - 2) - 3) - 4', { tono: 'due' }),
        T('r1', 150, 100, '', { tono: 'ora' }), T('l1', 440, 100, '', { tono: 'due' }), T('r2', 150, 140, '', { tono: 'ora' }), T('l2', 440, 140, '', { tono: 'due' }),
        T('r3', 150, 180, '', { tono: 'ora' }), T('l3', 440, 180, '', { tono: 'due' }), T('c', 295, 230, '', { size: 12, bold: true })
      ],
      passi: [
        { nota: "Con + l'ordine delle parentesi non conta. Con − sì. Stessa lista, stessa z, stessa f: le parentesi sono messe in modo opposto." },
        { nota: "foldRight parte dalla parentesi più interna, a destra: 4 − 0 = 4. foldLeft parte da z, a sinistra: 0 − 1 = −1.", set: { r1: { t: '1 - (2 - (3 - 4))' }, l1: { t: '((-1 - 2) - 3) - 4' } } },
        { nota: "Poi 3 − 4 = −1 a destra; −1 − 2 = −3 a sinistra.", set: { r2: { t: '1 - (2 - (-1))  =  1 - 3' }, l2: { t: '(-3 - 3) - 4  =  -6 - 4' } } },
        { nota: "Risultati: foldRight <b>−2</b>, foldLeft <b>−10</b> (verificati). Per operazioni non associative i due fold danno risultati diversi.", set: { r3: { t: '-2', tono: 'ok' }, l3: { t: '-10', tono: 'ok' }, c: { t: '−2 ≠ −10: le parentesi contano' } } }
      ]
    };

    SCENE.firme = {
      w: 560, h: 120,
      codice: { lang: 'scala', testo: `def foldRight[A, B](l: List[A], z: B, f: (A, B) => B): B = l match
  case Nil => z
  case Cons(a, as) => f(a, foldRight(as, z, f))
@annotation.tailrec
def foldLeft[A, B](l: List[A], z: B, f: (B, A) => B): B = l match
  case Nil => z
  case Cons(a, as) => foldLeft(as, f(z, a), f)` },
      legenda: '{{j|s022|'}}',
      oggetti: [T('c', 280, 40, '', { size: 13, bold: true }), T('c2', 280, 80, '', { size: 12 })],
      passi: [
        { nota: "Due tipi: A per gli elementi, B per il risultato. Possono essere diversi: da una List[String] puoi ottenere un Int.", righe: [1, 5], set: { c: { t: 'A = elementi, B = risultato' } } },
        { nota: "L'ordine degli argomenti di f è <b>rovesciato</b>: foldRight vuole (elemento, risultato del resto), foldLeft (accumulatore, elemento). Attenzione quando scrivi la lambda.", righe: [1, 5], set: { c: { t: 'foldRight: (A, B) => B   ·   foldLeft: (B, A) => B' } } },
        { nota: "Sulla lista vuota entrambi danno z.", righe: [2, 6], set: { c: { t: 'case Nil => z, in tutti e due' } } },
        { nota: "foldRight chiama f <b>dopo</b> aver ottenuto il resto: la chiamata ricorsiva sta dentro f, non in coda. foldLeft calcola f(z, a) prima e lo passa come nuovo z: in coda, e @tailrec lo conferma.", righe: [3, 7], set: { c: { t: 'f(a, foldRight(…)): non in coda' }, c2: { t: 'foldLeft(as, f(z, a), f): in coda' } } }
      ]
    };

    SCENE.treesempi = {
      w: 580, h: 230, lato: true,
      legenda: '{{j|s023|'}}',
      oggetti: [T('h', 290, 24, 'length1: foldLeft(as, 0, (acc, _) => acc + 1)', { bold: true, size: 12 }), C('l', 40, 50, ['a', 'b', 'c']), R('acc', 260, 50, 280, 40, 'acc = 0', { tono: 'dato' }), T('c', 290, 150, '', { size: 12 }), T('c2', 290, 190, '', { size: 12 })],
      passi: [
        { nota: "Procedimento fisso: 1) cosa vale sulla lista vuota → z; 2) dato accumulatore ed elemento, come aggiorno → f. Lunghezza: z = 0; f conta 1 per elemento e <b>scarta</b> l'elemento con _." },
        { nota: "a: acc = 1. b: 2. c: 3. È in coda, al contrario della length ricorsiva.", set: { l: { toni: { 0: 'ok', 1: 'ok', 2: 'ok' } }, acc: { t: 'acc = 3', tono: 'ok' } } },
        { nota: "Invertire: z = Nil, f = <code>(acc, a) =&gt; Cons(a, acc)</code>. Ogni elemento va <b>davanti</b> all'accumulatore.", set: { h: { t: 'foldLeft(List(1, 2, 3), Nil, (acc, a) => Cons(a, acc))' }, l: { valori: ['1', '2', '3'], toni: {} }, acc: { t: 'acc = Nil', tono: 'dato' } } },
        { nota: "1 davanti a Nil, poi 2 davanti a 1, poi 3 davanti a tutti: List(3, 2, 1). Il primo visitato finisce in fondo.", set: { l: { toni: { 0: 'ok', 1: 'ok', 2: 'ok' } }, acc: { t: 'Cons(3, Cons(2, Cons(1, Nil)))', tono: 'ok' } } },
        { nota: "Prodotto: z = 1, <b>mai 0</b>, altrimenti ogni prodotto vale 0. map con foldRight: z = Nil, f = (a, z) =&gt; Cons(f(a), z), che mantiene l'ordine.", set: { c: { t: 'product: foldLeft(as, 1, _ * _)' }, c2: { t: 'map: foldRight(l, Nil, (a, z) => Cons(f(a), z))' } } }
      ]
    };

    SCENE.scegli = {
      w: 590, h: 250, lato: true,
      legenda: '{{j|s024|'}}',
      oggetti: [
        T('hr', 150, 24, 'foldRight', { bold: true, tono: 'ora' }), T('hl', 440, 24, 'foldLeft', { bold: true, tono: 'due' }),
        T('d', 295, 60, '', { size: 12, bold: true }),
        T('r', 150, 100, '', { size: 12 }), T('l', 440, 100, '', { size: 12 }), T('r2', 150, 130, '', { size: 12 }), T('l2', 440, 130, '', { size: 12 }),
        T('c', 295, 220, '', { size: 12 })
      ],
      passi: [
        { nota: "Cinque domande per scegliere. <b>Parentesi</b>: a destra o a sinistra?", set: { d: { t: 'parentesi' }, r: { t: 'f(a1, f(a2, f(a3, z)))' }, l: { t: 'f(f(f(z, a1), a2), a3)' } } },
        { nota: "<b>Pila</b>: foldRight tiene in sospeso un'operazione per elemento (può esaurirsi); foldLeft è in coda, spazio costante.", set: { d: { t: 'pila usata' }, r: { t: '∝ lunghezza' }, l: { t: 'costante (in coda)' } } },
        { nota: "<b>Costruire con Cons</b>: foldRight dà la stessa lista, foldLeft la lista invertita.", set: { d: { t: 'costruire con Cons' }, r: { t: 'stesso ordine' }, l: { t: 'lista invertita' } } },
        { nota: "<b>Argomenti di f</b>: (elemento, risultato) contro (accumulatore, elemento).", set: { d: { t: 'argomenti di f' }, r: { t: '(elemento, risultato)' }, l: { t: '(accumulatore, elemento)' } } },
        { nota: "<b>Liste pigre</b> (settimana 4): foldRight può fermarsi prima, foldLeft consuma sempre tutto. E la regola del foglio: prima una funzione dedicata (map, filter…), poi un fold, la ricorsione a mano solo se serve.", set: { d: { t: 'liste pigre' }, r: { t: 'può fermarsi prima' }, l: { t: 'consuma tutto' }, c: { t: 'funzione dedicata > fold > ricorsione a mano' } } }
      ]
    };

    SCENE.errorifold = {
      w: 580, h: 210, lato: true,
      legenda: '{{j|s025|'}}',
      oggetti: [R('s', 20, 30, 540, 40, 'foldLeft(as, 0, f(acc, _) => acc + 1)', { tono: 'no' }), T('m', 290, 94, 'not a legal formal parameter for a function literal', { size: 12 }), R('g', 20, 120, 540, 40, '', { tono: 'ok', nascosto: true }), T('c', 290, 190, '', { size: 12 })],
      passi: [
        { nota: "Primo errore: a sinistra della freccia di una lambda vanno <b>solo i nomi</b> dei parametri. <code>f(acc, _)</code> non è un nome." },
        { nota: "Corretto: <code>(acc, _) =&gt; acc + 1</code>.", set: { g: { nascosto: false, t: 'foldLeft(as, 0, (acc, _) => acc + 1)' } } },
        { nota: "Secondo errore: i <code>case</code> scritti senza <code>l match</code>. Scala legge dei case da soli come una funzione anonima (x$1 =&gt; x$1 match …) e protesta: \"Missing parameter type\".", set: { s: { t: 'def foldLeft(…): B =  case Nil => z' }, m: { t: 'Missing parameter type … x$1' }, g: { nascosto: true } } },
        { nota: "Corretto: <code>= l match</code> prima dei case. Messaggio strano, causa semplice.", set: { g: { nascosto: false, t: 'def foldLeft(…): B = l match  case Nil => z' }, c: { t: 'i case vanno sempre dopo un x match' } } }
      ]
    };
  
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});

    const S = [['var (variabili)', 'val (valori)'], ['assegnamenti', 'legami di valori'], ['return', 'valore dell’espressione'], ['Any / Object', 'polimorfismo parametrico'], ['cicli → ricorsione in coda → ricorsione', 'fold → funzioni dedicate'], ['if', 'pattern matching → API dedicata'], ['eccezioni', 'Option o Either']];
    const og = [T('h1', 150, 22, 'condannato (fail)', { bold: true, size: 12, tono: 'no' }), T('h2', 440, 22, 'illuminato (voto alto)', { bold: true, size: 12, tono: 'ok' })];
    S.forEach(([a, b], i) => og.push(R('a' + i, 20, 34 + i * 30, 260, 26, a, { tono: 'spento', nascosto: true }), R('b' + i, 310, 34 + i * 30, 260, 26, b, { tono: 'spento', nascosto: true }), F('f' + i, 282, 47 + i * 30, 306, 47 + i * 30, '', { nascosto: true })));
    const riga = i => ({ ['a' + i]: { nascosto: false, tono: 'no' }, ['b' + i]: { nascosto: false, tono: 'ok' }, ['f' + i]: { nascosto: false } });
    SCENE.stile = {
      w: 590, h: 250, lato: true,
      legenda: '{{j|s026|'}}',
      oggetti: og,
      passi: [
        { nota: "La slide 11 della settimana 2: per ogni esercizio scegli lo stile migliore che sai usare. A sinistra ciò che fa fallire, a destra ciò che dà il voto alto." },
        { nota: "<b>Dati</b>: valori (val) invece di variabili; legami di valori invece di assegnamenti; il valore dell'espressione invece di return.", set: Object.assign(riga(0), riga(1), riga(2)) },
        { nota: "<b>Tipi</b>: polimorfismo parametrico ([A]) invece di Any/Object.", set: riga(3) },
        { nota: "<b>Iterare</b>: cicli &lt; ricorsione in coda &lt; ricorsione semplice &lt; fold &lt; funzioni dedicate di ordine superiore (map, filter…). La ricorsione in coda e il fold vanno bene se richiesti o se conta la memoria.", set: riga(4) },
        { nota: "<b>Decidere</b>: if &lt; pattern matching &lt; API dedicata. <b>Errori</b>: eccezioni &lt; Option o Either.", set: Object.assign(riga(5), riga(6)) }
      ]
    };
  
})();
</script>
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s027|}}</h1>
  <p class="lede">{{s|s028|}}</p>
</header>

<section>
  <h2>{{s|s029|}}</h2>
  <p>{{s|s030|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s031|}}</th><th>{{s|s032|}}</th><th>{{s|s033|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s034|}}</td><td><code>l</code></td><td>{{s|s035|}}</td></tr>
      <tr><td>{{s|s036|}}</td><td>{{s|s037|}}</td><td><code>0</code></td></tr>
      <tr><td>{{s|s038|}}</td><td>{{s|s039|}}</td><td><code>_ + _</code></td></tr>
      <tr><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s043|}}">
    <p>{{s|s044|}}</p>
  </div>
  <figure class="scena" data-scena="ingredienti" data-titolo="{{a|s045|}}"></figure>
</section>

<section>
  <h2>{{s|s046|}}</h2>
  <figure class="scena" data-scena="foldleft" data-titolo="{{a|s047|}}"></figure>
</section>

<section>
  <h2>{{s|s048|}}</h2>
  <figure class="scena" data-scena="foldright" data-titolo="{{a|s049|}}"></figure>
</section>

<section>
  <h2>{{s|s050|}}</h2>
  <p>{{s|s051|}}</p>
  <figure class="passi" data-titolo="{{a|s052|}}">
    <div class="passo"><div class="espr">1 - (2 - (3 - (<mark class="ora">4 - 0</mark>)))</div><p class="nota">{{s|s053|}}</p></div>
    <div class="passo"><div class="espr">1 - (2 - (<mark class="ora">3 - 4</mark>))</div><p class="nota">4 − 0 = 4.</p></div>
    <div class="passo"><div class="espr">1 - (<mark class="ora">2 - (-1)</mark>)</div><p class="nota">3 − 4 = −1.</p></div>
    <div class="passo"><div class="espr"><mark class="ora">1 - 3</mark></div><p class="nota">2 − (−1) = 3.</p></div>
    <div class="passo"><div class="espr"><mark class="ok">-2</mark></div><p class="nota">{{s|s054|}}</p></div>
  </figure>
  <figure class="passi" data-titolo="{{a|s055|}}">
    <div class="passo"><div class="espr">(((<mark class="ora">0 - 1</mark>) - 2) - 3) - 4</div><p class="nota">{{s|s056|}}</p></div>
    <div class="passo"><div class="espr">((<mark class="ora">-1 - 2</mark>) - 3) - 4</div><p class="nota">0 − 1 = −1.</p></div>
    <div class="passo"><div class="espr">(<mark class="ora">-3 - 3</mark>) - 4</div><p class="nota">…</p></div>
    <div class="passo"><div class="espr"><mark class="ora">-6 - 4</mark></div><p class="nota">…</p></div>
    <div class="passo"><div class="espr"><mark class="ok">-10</mark></div><p class="nota">{{s|s057|}}</p></div>
  </figure>
  <figure class="scena" data-scena="sottrazione" data-titolo="{{a|s058|}}"></figure>
</section>

<section>
  <h2>{{s|s059|}}</h2>
  <figure class="codice" data-titolo="{{a|s060|}}">
<pre data-lang="scala">def foldRight[A, B](l: List[A], z: B, f: (A, B) => B): B = l match
  case Nil => z
  case Cons(a, as) => f(a, foldRight(as, z, f))

@annotation.tailrec
def foldLeft[A, B](l: List[A], z: B, f: (B, A) => B): B = l match
  case Nil => z
  case Cons(a, as) => foldLeft(as, f(z, a), f)</pre>
    <ol class="spiega">
      <li data-righe="1,6" data-segna="[A, B]*@due"><p>{{s|s061|}}</p></li>
      <li data-righe="1" data-segna="(A, B) => B@ora"><p>{{s|s062|}}</p></li>
      <li data-righe="6" data-segna="(B, A) => B@ora"><p>{{s|s063|}}</p></li>
      <li data-righe="2,7" data-segna="=> z*@ok"><p>{{s|s064|}}</p></li>
      <li data-righe="3" data-segna="f(a, foldRight(as, z, f))@due"><p>{{s|s065|}}</p></li>
      <li data-righe="8" data-segna="f(z, a)@ora|foldLeft(as, @ok"><p>{{s|s066|}}</p></li>
    </ol>
  </figure>
  <figure class="scena" data-scena="firme" data-titolo="{{a|s067|}}"></figure>
</section>

<section>
  <h2>{{s|s068|}}</h2>
  <p>{{s|s069|}}</p>
  <figure class="passi" data-titolo="{{a|s070|}}">
    <div class="passo">
      <div class="espr">def length1[A](as: List[A]): Int =
  foldLeft(as, <mark class="ok">0</mark>, ???)</div>
      <p class="nota">{{s|s071|}}</p>
    </div>
    <div class="passo">
      <div class="espr">f: (<mark class="dato">B</mark>, <mark class="due">A</mark>) => B   con B = Int
f(<mark class="dato">acc</mark>, <mark class="due">elemento</mark>) = ?</div>
      <p class="nota">{{s|s072|}}</p>
    </div>
    <div class="passo">
      <div class="espr">(<mark class="dato">acc</mark>, <mark class="due">_</mark>) => <mark class="ora">acc + 1</mark></div>
      <p class="nota">{{s|s073|}}</p>
    </div>
    <div class="passo">
      <div class="espr">def length1[A](as: List[A]): Int =
  foldLeft(as, 0, <mark class="ok">(acc, _) => acc + 1</mark>)</div>
      <p class="nota">{{s|s074|}}</p>
    </div>
  </figure>
  <figure class="passi" data-titolo="{{a|s075|}}">
    <div class="passo">
      <div class="espr">foldLeft(List(1, 2, 3), <mark class="dato">Nil</mark>, (acc, a) => Cons(a, acc))</div>
      <p class="nota">{{s|s076|}}</p>
    </div>
    <div class="passo"><div class="espr">acc = Cons(<mark class="ora">1</mark>, Nil)</div><p class="nota">{{s|s077|}}</p></div>
    <div class="passo"><div class="espr">acc = Cons(<mark class="ora">2</mark>, Cons(1, Nil))</div><p class="nota">{{s|s078|}}</p></div>
    <div class="passo"><div class="espr">acc = Cons(<mark class="ora">3</mark>, Cons(2, Cons(1, Nil)))</div><p class="nota">{{s|s079|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">List(3, 2, 1)</mark></div><p class="nota">{{s|s080|}}</p></div>
  </figure>
  <pre class="cod" data-lang="scala">def product(as: List[Int]): Int = foldLeft(as, 1, _ * _)       // z = 1, mai 0
def map[A, B](l: List[A], f: A => B): List[B] =
  foldRight[A, List[B]](l, Nil, (a, z) => Cons(f(a), z))       // dalla testa del file</pre>
  <figure class="scena" data-scena="treesempi" data-titolo="{{a|s081|}}"></figure>
</section>

<section>
  <h2>{{s|s082|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s083|}}</th><th>{{s|s084|}}</th><th>{{s|s085|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s086|}}</td><td><code>f(a1, f(a2, f(a3, z)))</code></td><td><code>f(f(f(z, a1), a2), a3)</code></td></tr>
      <tr><td>{{s|s087|}}</td><td>{{s|s088|}}</td><td>{{s|s089|}}</td></tr>
      <tr><td>{{s|s090|}}</td><td>{{s|s091|}}</td><td>{{s|s092|}}</td></tr>
      <tr><td>{{s|s093|}}</td><td>{{s|s094|}}</td><td>{{s|s095|}}</td></tr>
      <tr><td>{{s|s096|}}</td><td>{{s|s097|}}</td><td>{{s|s098|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box esame" data-tit="{{a|s099|}}">
    <p>{{s|s100|}}</p>
  </div>
  <figure class="scena" data-scena="scegli" data-titolo="{{a|s101|}}"></figure>
</section>

<section>
  <h2>{{s|s102|}}</h2>
  <p>{{s|s103|}}</p>
  <p>{{s|s104|}}</p>
  <figure class="scena" data-scena="stile" data-titolo="{{a|s105|}}"></figure>
</section>

<section>
  <h2>{{s|s106|}}</h2>
  <div class="errori">
    <div class="errore">
      <pre data-lang="scala">foldLeft(as, 0, f(acc, _) => acc + 1)</pre>
      <pre class="msg">not a legal formal parameter for a function literal
Not found: acc</pre>
      <div class="fix">A sinistra della freccia vanno solo i nomi dei parametri tra parentesi, senza <code>f</code> davanti: <code>(acc, _) => acc + 1</code>.</div>
    </div>
    <div class="errore">
      <pre data-lang="scala">def foldLeft[A, B](l: List[A], z: B, f: (B, A) => B): B =
  case Nil => z</pre>
      <pre class="msg">Missing parameter type

I could not infer the type of the parameter x$1
in expanded function:
  x$1 => x$1 match { case Nil => z … }</pre>
      <div class="fix">Messaggio strano, causa semplice: manca <code>l match</code>. Dei <code>case</code> scritti da soli Scala li legge come una <b>funzione anonima</b> (<code>x$1 => x$1 match …</code>) e non capisce il tipo del suo parametro. Scrivi <code>= l match</code> prima dei <code>case</code>.</div>
    </div>
  </div>
  <figure class="scena" data-scena="errorifold" data-titolo="{{a|s107|}}"></figure>
</section>

</main>
</body>
</html>
