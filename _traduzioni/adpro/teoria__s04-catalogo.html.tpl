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
  SCENE.tirare = {
    w: 600, h: 262, lato: true,
    legenda: '{{j|s002|'}}',
    codice: { lang: 'scala', testo: `val l = LazyList(1, 2, 3, 4, 5)
val m = l.map { x => println(s"map $x"); x * 10 }
val f = m.filter { y => println(s"filter $y"); y > 15 }
f.headOption` },
    oggetti: [
      { id: 'nl', tipo: 'testo', x: 44, y: 47, t: 'l', size: 15, bold: true },
      { id: 'cl', tipo: 'celle', x: 80, y: 30, cw: 44, valori: [1, 2, 3, 4, 5], indici: false },
      { id: 'nm', tipo: 'testo', x: 44, y: 117, t: 'm', size: 15, bold: true, nascosto: true },
      { id: 'cm', tipo: 'celle', x: 80, y: 100, cw: 44, valori: ['?'], indici: false, nascosto: true },
      { id: 'dm', tipo: 'testo', x: 182, y: 117, t: '…', size: 15, nascosto: true },
      { id: 'nf', tipo: 'testo', x: 44, y: 187, t: 'f', size: 15, bold: true, nascosto: true },
      { id: 'cf', tipo: 'celle', x: 80, y: 170, cw: 44, valori: ['20'], indici: false, nascosto: true },
      { id: 'df', tipo: 'testo', x: 138, y: 187, t: '…', size: 15, nascosto: true },
      { id: 'v0', tipo: 'vett', x1: 102, y1: 66, x2: 102, y2: 98, t: '×10', nascosto: true },
      { id: 'v1', tipo: 'vett', x1: 146, y1: 66, x2: 146, y2: 98, t: '×10', nascosto: true },
      { id: 'vf', tipo: 'vett', x1: 146, y1: 136, x2: 106, y2: 168, nascosto: true },
      { id: 'ts', tipo: 'testo', x: 400, y: 36, t: 'stampe', size: 12, bold: true, anchor: 'start' },
      { id: 's1', tipo: 'testo', x: 400, y: 62, t: 'map 1', anchor: 'start', nascosto: true },
      { id: 's2', tipo: 'testo', x: 400, y: 86, t: 'filter 10', anchor: 'start', nascosto: true },
      { id: 's3', tipo: 'testo', x: 400, y: 110, t: 'map 2', anchor: 'start', nascosto: true },
      { id: 's4', tipo: 'testo', x: 400, y: 134, t: 'filter 20', anchor: 'start', nascosto: true },
      { id: 'ris', tipo: 'testo', x: 300, y: 240, t: '', size: 14, bold: true }
    ],
    passi: [
      { nota: "<code>l</code> ha 5 elementi. Le funzioni date a <code>map</code> e <code>filter</code> stampano quando lavorano: così si vede <b>quando</b> avviene ogni calcolo.", righe: [1] },
      { nota: "<code>map</code> chiama <code>foldRight</code>, che restituisce subito <code>cons(f(1), acc)</code>: una cella con due <b>ricette</b>, testa e coda. Nessuna stampa: nessun calcolo.", righe: [2], set: { nm: { nascosto: false }, cm: { nascosto: false }, dm: { nascosto: false } } },
      { nota: "<code>filter</code> chiama <code>foldRight</code> su m, e foldRight deve guardare subito la <b>testa</b> di m: la ricetta scatta e map lavora su 1.", righe: [3], set: { cl: { toni: { 0: 'ora' } }, cm: { valori: ['10'], toni: { 0: 'ora' } }, v0: { nascosto: false }, s1: { nascosto: false, tono: 'ora' } } },
      { nota: "p(10): 10 &gt; 15 è falso. filter scarta 10 e valuta <code>acc</code>, cioè il resto della lista.", righe: [3], set: { cl: { toni: {} }, cm: { toni: { 0: 'no' } }, s1: { tono: null }, s2: { nascosto: false, tono: 'ora' } } },
      { nota: "Il resto di m è ancora una ricetta: scatta, e map lavora su 2.", righe: [3], set: { cl: { toni: { 1: 'ora' } }, cm: { valori: ['10', '20'], toni: { 0: 'no', 1: 'ora' } }, v1: { nascosto: false }, s2: { tono: null }, s3: { nascosto: false, tono: 'ora' } } },
      { nota: "p(20): vero. filter restituisce <code>cons(20, acc)</code> e <b>si ferma</b>: il resto resta una ricetta.", righe: [3], set: { cl: { toni: {} }, cm: { toni: { 0: 'no', 1: 'ok' } }, nf: { nascosto: false }, cf: { nascosto: false, toni: { 0: 'ok' } }, df: { nascosto: false }, vf: { nascosto: false }, s3: { tono: null }, s4: { nascosto: false, tono: 'ora' } } },
      { nota: "<code>headOption</code> legge una testa già calcolata: <b>nessuna</b> nuova stampa.", righe: [4], set: { s4: { tono: null }, ris: { t: 'f.headOption = Some(20)', tono: 'ok' } } },
      { nota: "3, 4 e 5 non sono mai stati toccati. E il lavoro l'ha fatto <code>filter</code> nel momento in cui l'hai chiamata, non <code>headOption</code>: con <code>foldRight</code>, filter cerca subito il primo elemento che passa. Ordine delle stampe verificato eseguendo il tuo <code>map</code> e il tuo <code>filter</code> in Scala 3.8.", set: { cl: { toni: { 2: 'spento', 3: 'spento', 4: 'spento' } } } }
    ]
  };
})();
</script>
<script>
window.SCENE = window.SCENE || {};
(function () {
  const T = (id, x, y, t, extra) => Object.assign({ id, tipo: 'testo', x, y, t, size: 13 }, extra || {});
  const R = (id, x, y, w, h, t, extra) => Object.assign({ id, tipo: 'rett', x, y, w, h, t }, extra || {});
  const N = (id, x, y, t, tono, extra) => Object.assign({ id, tipo: 'nodo', x, y, t, tono, r: 20 }, extra || {});
  const F = (id, x1, y1, x2, y2, t, extra) => Object.assign({ id, tipo: 'vett', x1, y1, x2, y2, t }, extra || {});
  const C = (id, x, y, valori, extra) => Object.assign({ id, tipo: 'celle', x, y, cw: 52, ch: 40, valori, indici: false }, extra || {});
  const vuote = n => Array(n).fill('');
  const toni = (n, tono) => Object.fromEntries(Array.from({ length: n }, (_, i) => [i, tono]));

    SCENE.chiscrive = {
      w: 600, h: 240, lato: true,
      legenda: '{{j|s003|'}}',
      oggetti: [
        R('d1', 20, 30, 270, 64, '', { tono: 'dato' }), T('d1t', 155, 48, 'enum LazyList (docente)', { bold: true, size: 12 }), T('d1v', 155, 68, 'Empty, Cons, headOption, tail', { size: 11 }), T('d1w', 155, 86, 'foldRight, foldLeft, find', { size: 11 }),
        R('d2', 20, 100, 270, 50, '', { tono: 'dato', nascosto: true }), T('d2t', 155, 130, 'companion: empty, cons, apply', { size: 12, nascosto: true }),
        R('t1', 310, 30, 270, 120, '', { tono: 'ora', nascosto: true }), T('t1t', 445, 52, 'scritte da te', { bold: true, size: 12, nascosto: true }),
        T('t1a', 445, 78, 'toList, take, drop, takeWhile, forAll, exists', { size: 10, nascosto: true }), T('t1b', 445, 100, 'map, filter, append, flatMap, from, to, naturals', { size: 10, nascosto: true }), T('t1c', 445, 122, 'fibs, unfold, …Unfold, zipWith', { size: 10, nascosto: true }),
        T('c', 300, 190, '', { size: 12 }), T('c2', 300, 220, '', { size: 12 })
      ],
      passi: [
        { nota: "Il file della settimana 4 mescola codice del docente e tuo. Nell'<b>enum</b> il docente ha già scritto le due forme e alcuni metodi." },
        { nota: "Nel <b>companion object</b>: empty, cons (il costruttore comodo) e apply, che usi scrivendo LazyList(1, 2, 3).", set: { d2: { nascosto: false }, d2t: { nascosto: false } } },
        { nota: "Tutto il resto l'hai scritto tu, esercizio per esercizio.", set: { t1: { nascosto: false }, t1t: { nascosto: false }, t1a: { nascosto: false }, t1b: { nascosto: false }, t1c: { nascosto: false } } },
        { nota: "In cima al file: \"we are using our own lazy lists, not the standard library\". Option, List, Nil vengono dalla libreria; la LazyList è quella del corso. La LazyList della libreria esiste, ma ha metodi diversi.", set: { c: { t: 'Option, List: libreria · LazyList: quella del corso' }, c2: { t: 'non cercare la documentazione della LazyList standard', tono: 'no' } } }
      ]
    };

    const K = [['ones = cons(1, ones)', ['1', '1', '1', '1'], 'infinita, punta a se stessa'], ['from(3)', ['3', '4', '5', '6'], 'sale di 1'], ['to(3)', ['3', '2', '1', '0'], 'scende di 1'], ['naturals = from(1)', ['1', '2', '3', '4'], 'i naturali, da 1'], ['fibs', ['0', '1', '1', '2', '3', '5', '8', '13'], 'Fibonacci'], ['unfold(1)(n => if n > 4 then None else Some((n, n * 2)))', ['1', '2', '4'], 'da uno stato: None = fine']];
    SCENE.costruire = {
      w: 600, h: 180, lato: true,
      legenda: '{{j|s004|'}}',
      oggetti: [T('e', 300, 30, '', { bold: true, size: 13 }), C('l', 30, 60, vuote(8), { cw: 66, toni: {} }), T('c', 300, 150, '', { size: 12 })],
      passi: [{ nota: "I modi di costruire una LazyList, ognuno con i primi elementi (verificati con <code>.take(…).toList</code>)." }].concat(K.map(([e, v, c]) => ({
        nota: '{{j|s005|'}}' + e + '</code>: ' + c + '.',
        set: { e: { t: e }, l: { valori: v.concat(vuote(8)).slice(0, 8), toni: toni(v.length, 'ok') }, c: { t: c } }
      })))
    };

    const L = [['headOption', 1, 'Some(1)'], ['toList', 5, 'List(1, 2, 3, 4, 5)'], ['take(2)', 2, 'List(1, 2)'], ['drop(2)', 5, 'List(3, 4, 5)'], ['takeWhile(_ < 3)', 3, 'List(1, 2)'], ['forAll(_ > 0)', 5, 'true'], ['exists(_ > 4)', 5, 'true'], ['find(_ > 2)', 3, 'Some(3)']];
    SCENE.leggere = {
      w: 580, h: 180, lato: true,
      legenda: '{{j|s006|'}}',
      oggetti: [T('e', 290, 30, '', { bold: true }), C('l', 60, 50, ['1', '2', '3', '4', '5'], { cw: 70 }), T('r', 290, 130, '', { bold: true, size: 15 }), T('c', 290, 165, '', { size: 12 })],
      passi: [{ nota: "Su l = LazyList(1, 2, 3, 4, 5): quanti elementi guarda ogni funzione, e cosa restituisce (verificato)." }].concat(L.map(([e, k, r], i) => ({
        nota: '{{j|s007|'}}' + e + '</code>: ' + ['solo la testa, dentro un Option.', 'forza tutto: su una lista infinita <b>non termina</b>. Si usa dopo un take.', 'i primi n.', 'salta i primi n, tiene il resto.', 'guarda fino al primo che non va (il 3), poi si ferma.', 'deve controllarli tutti: nessuno è falso.', 'si ferma al primo vero: qui il 5, l\'ultimo.', 'il primo che soddisfa p: si ferma al 3.'][i],
        set: { e: { t: 'l.' + e }, l: { toni: toni(k, 'ora') }, r: { t: r, tono: 'ok' }, c: { t: 'elementi guardati: ' + k } }
      })))
    };

    SCENE.versioni = {
      w: 580, h: 200, lato: true,
      legenda: '{{j|s008|'}}',
      oggetti: [R('o', 20, 40, 170, 40, 'takeWhile', { tono: 'dato' }), R('f', 205, 40, 170, 40, 'takeWhile1', { tono: 'ora', nascosto: true }), R('u', 390, 40, 170, 40, 'takeWhileUnfold', { tono: 'due', nascosto: true }), T('r', 290, 120, '', { bold: true }), T('c', 290, 170, '', { size: 12 })],
      passi: [
        { nota: "Alcune funzioni esistono in più versioni: stesso risultato, scritte in modo diverso. Per esempio takeWhile, scritta con la ricorsione a mano (esercizio 4)." },
        { nota: "<b>…1</b>: la stessa, con <b>foldRight</b> (esercizi 6–7: takeWhile1, headOption1).", set: { f: { nascosto: false } } },
        { nota: "<b>…Unfold</b>: la stessa, con <b>unfold</b> (esercizi 12–13: mapUnfold, takeUnfold, takeWhileUnfold, fibsUnfold).", set: { u: { nascosto: false } } },
        { nota: "Tutte e tre su naturals con _ &lt; 4: List(1, 2, 3). Gli esercizi servono a mostrare che foldRight e unfold bastano a scrivere quasi tutto senza ricorsione esplicita.", set: { o: { tono: 'ok' }, f: { tono: 'ok' }, u: { tono: 'ok' }, r: { t: 'naturals.takeWhile…(_ < 4).toList = List(1, 2, 3)', tono: 'ok' }, c: { t: 'ricorsione a mano → foldRight / unfold: stesso risultato' } } }
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
  <div class="colonne">
    <div class="carta buona"><h4>{{s|s012|}}</h4>
      <p>{{s|s013|}}</p>
      <p>{{s|s014|}}</p></div>
    <div class="carta media"><h4>{{s|s015|}}</h4>
      <p>{{s|s016|}}</p></div>
  </div>
  <div class="box attenzione" data-tit="{{a|s017|}}">
    <p>{{s|s018|}}</p>
  </div>
  <figure class="scena" data-scena="chiscrive" data-titolo="{{a|s019|}}"></figure>
</section>

<section>
  <h2>{{s|s020|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s021|}}</th><th>{{s|s022|}}</th><th>{{s|s023|}}</th><th>{{s|s024|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td><td>—</td><td>{{s|s027|}}</td></tr>
      <tr><td>{{s|s028|}}</td><td>{{s|s029|}}</td><td>—</td><td>{{s|s030|}}</td></tr>
      <tr><td>{{s|s031|}}</td><td>{{s|s032|}}</td><td>{{s|s033|}}</td><td>{{s|s034|}}</td></tr>
      <tr><td>{{s|s035|}}</td><td>{{s|s036|}}</td><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr>
      <tr><td>{{s|s039|}}</td><td>{{s|s040|}}</td><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr>
      <tr><td>{{s|s043|}}</td><td>{{s|s044|}}</td><td>{{s|s045|}}</td><td>{{s|s046|}}</td></tr>
      <tr><td>{{s|s047|}}</td><td>{{s|s048|}}</td><td>{{s|s049|}}</td><td>{{s|s050|}}</td></tr>
      <tr><td>{{s|s051|}}</td><td>0, 1, 1, 2, 3, 5, …</td><td>{{s|s052|}}</td><td>{{s|s053|}}</td></tr>
      <tr><td>{{s|s054|}}</td><td>{{s|s055|}}</td><td>{{s|s056|}}</td><td>{{s|s057|}}</td></tr>
    </tbody>
  </table></div>
  <figure class="scena" data-scena="costruire" data-titolo="{{a|s058|}}"></figure>
</section>

<section>
  <h2>{{s|s059|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s060|}}</th><th>{{s|s061|}}</th><th>{{s|s062|}}</th><th>{{s|s063|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s064|}}</td><td>{{s|s065|}}</td><td>{{s|s066|}}</td><td>{{s|s067|}}</td></tr>
      <tr><td>{{s|s068|}}</td><td>{{s|s069|}}</td><td>{{s|s070|}}</td><td>{{s|s071|}}</td></tr>
      <tr><td>{{s|s072|}}</td><td>{{s|s073|}}</td><td>{{s|s074|}}</td><td>{{s|s075|}}</td></tr>
      <tr><td>{{s|s076|}}</td><td>{{s|s077|}}</td><td>{{s|s078|}}</td><td>{{s|s079|}}</td></tr>
      <tr><td>{{s|s080|}}</td><td>{{s|s081|}}</td><td>{{s|s082|}}</td><td>{{s|s083|}}</td></tr>
      <tr><td>{{s|s084|}}</td><td>{{s|s085|}}</td><td>{{s|s086|}}</td><td>{{s|s087|}}</td></tr>
      <tr><td>{{s|s088|}}</td><td>{{s|s089|}}</td><td>{{s|s090|}}</td><td>{{s|s091|}}</td></tr>
      <tr><td>{{s|s092|}}</td><td>{{s|s093|}}</td><td>{{s|s094|}}</td><td>{{s|s095|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box attenzione" data-tit="{{a|s096|}}">
    <p>{{s|s097|}}</p>
  </div>
  <figure class="scena" data-scena="leggere" data-titolo="{{a|s098|}}"></figure>
</section>

<section>
  <h2>{{s|s099|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s100|}}</th><th>{{s|s101|}}</th><th>{{s|s102|}}</th><th>{{s|s103|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s104|}}</td><td>{{s|s105|}}</td><td>{{s|s106|}}</td><td>{{s|s107|}}</td></tr>
      <tr><td>{{s|s108|}}</td><td>{{s|s109|}}</td><td>{{s|s110|}}</td><td>{{s|s111|}}</td></tr>
      <tr><td>{{s|s112|}}</td><td>{{s|s113|}}</td><td>{{s|s114|}}</td><td>{{s|s115|}}</td></tr>
      <tr><td>{{s|s116|}}</td><td>{{s|s117|}}</td><td>{{s|s118|}}</td><td>{{s|s119|}}</td></tr>
      <tr><td>{{s|s120|}}</td><td>{{s|s121|}}</td><td>{{s|s122|}}</td><td>{{s|s123|}}</td></tr>
      <tr><td>{{s|s124|}}</td><td>{{s|s125|}}</td><td><code>15</code></td><td>{{s|s126|}}</td></tr>
      <tr><td>{{s|s127|}}</td><td>{{s|s128|}}</td><td>—</td><td>{{s|s129|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box regola" data-tit="{{a|s130|}}">
    <p>{{s|s131|}}</p>
  </div>
  <div class="box regola" data-tit="{{a|s132|}}">
    <p>{{s|s133|}}</p>
  </div>
  <figure class="scena" data-scena="tirare" data-titolo="{{a|s134|}}"></figure>
</section>

<section>
  <h2>{{s|s135|}}</h2>
  <p>{{s|s136|}}</p>
  <figure class="scena" data-scena="versioni" data-titolo="{{a|s137|}}"></figure>
</section>

</main>
</body>
</html>
