/* ==========================================================================
   Motore degli atlanti — comportamento comune
   Una copia identica sta in ogni sito (assets/atlas.js).
   Modifica SOLO _motore/atlas.js e poi lancia _motore/sync.py
   Documentazione dei componenti: LEGGIMI.md di ogni sito.
   ========================================================================== */
(function () {
  'use strict';

  const SITO = window.SITO || { sigla: '?', nome: '', menu: [] };
  const SCRIPT = document.currentScript;
  const BASE = new URL('..', SCRIPT.src).href;          // radice del sito
  const $ = (s, el = document) => el.querySelector(s);
  const $$ = (s, el = document) => Array.from(el.querySelectorAll(s));
  const RUOLI = ['ora', 'dato', 'due', 'ok', 'no'];
  const RIDOTTO = matchMedia('(prefers-reduced-motion: reduce)').matches;

  const esc = s => String(s).replace(/[&<>"]/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]));
  const el = (tag, attrs = {}, html) => {
    const e = document.createElement(tag);
    for (const [k, v] of Object.entries(attrs)) {
      if (v === undefined || v === null || v === false) continue;
      if (k === 'class') e.className = v; else e.setAttribute(k, v === true ? '' : v);
    }
    if (html !== undefined) e.innerHTML = html;
    return e;
  };
  const norm = s => s.normalize('NFD').replace(/[\u0300-\u036f]/g, '').toLowerCase();

  /* ---------------------------------------------------------------------
     Lingua dell'interfaccia: EN (predefinita), DK, IT. Le chiavi sono le frasi
     italiane: in italiano il testo resta com'è. Il cambio lingua ricarica la
     pagina. Le traduzioni dei contenuti (menu, esami) stanno in SITO.traduzioni,
     indicizzate dalla frase italiana: se manca una voce resta l'italiano.
     --------------------------------------------------------------------- */
  const LINGUE_UI = { en: 'EN', da: 'DK', it: 'IT' };
  const LOCALE = { en: 'en-GB', da: 'da-DK', it: 'it-IT' };
  const LINGUA_UI = (() => { try { const l = localStorage.getItem('atlante:lingua'); return LINGUE_UI[l] ? l : 'en'; } catch (e) { return 'en'; } })();
  const DIZ = {
    en: {
      'Mostra gli altri atlanti': 'Show the other atlases',
      'atlante di': 'atlas of',
      'Atlante': 'Atlas',
      "Indice dell'atlante": 'Atlas index',
      'Cerca un argomento…': 'Search a topic…',
      'Cerca un argomento': 'Search a topic',
      '◐ Tema': '◐ Theme',
      '☰ Indice': '☰ Index',
      'capite': 'understood',
      'Segna questa pagina come capita': 'Mark this page as understood',
      '✓ Capita — la ripasserai dopo': '✓ Understood — you will review it later',
      'Segnata come capita': 'Marked as understood',
      'Materiale non ancora pubblicato': 'Material not published yet',
      'in arrivo': 'coming up',
      'In questa pagina': 'On this page',
      'Pagine vicine': 'Nearby pages',
      '← Prima': '← Previous',
      'Dopo →': 'Next →',
      'Passo precedente': 'Previous step',
      'Indietro': 'Back',
      'Avanti →': 'Next →',
      '▶ Riproduci': '▶ Play',
      '❚❚ Pausa': '❚❚ Pause',
      'Torna al primo passo': 'Back to the first step',
      'passo': 'step',
      'Tutti i passi': 'All steps',
      'Codice': 'Code',
      'Il blocco intero': 'The whole block',
      'Righe ': 'Lines ',
      'Riga ': 'Line ',
      'Scena non trovata:': 'Scene not found:',
      'passo per passo': 'step by step',
      'codice smontato': 'code, taken apart',
      'animazione': 'animation',
      'cambia adesso': 'changes now',
      'il dato di partenza': 'starting value',
      'secondo ruolo': 'second role',
      'il risultato': 'the result',
      'scartato / sbagliato': 'discarded / wrong',
      'Nessuna scadenza in programma.': 'No deadlines scheduled.',
      'Altre scadenze': 'More deadlines',
      'Già passate': 'Already past',
      'sett.': 'wk',
      'questa settimana': 'this week',
      'passata': 'past',
      'oggi': 'today',
      'domani': 'tomorrow',
      'fatta': 'done',
      'pausa': 'break',
      'passato': 'past',
      'esame': 'exam',
      'da confermare': 'to confirm',
      'facoltativo': 'optional',
      "giorni all'esame — ": 'days to the exam — ',
      'Oggi': 'Today',
      'In bocca al lupo.': 'Good luck!',
      "L'esame ordinario (": 'The ordinary exam (',
      ') è passato.': ') has passed.',
      'giorno': 'day',
      'quando e dove': 'when and where',
      'note': 'notes',
      'Lingua': 'Language'
    },
    da: {
      'Mostra gli altri atlanti': 'Vis de andre atlas',
      'atlante di': 'atlas for',
      'Atlante': 'Atlas',
      "Indice dell'atlante": 'Atlas-indeks',
      'Cerca un argomento…': 'Søg et emne…',
      'Cerca un argomento': 'Søg et emne',
      '◐ Tema': '◐ Tema',
      '☰ Indice': '☰ Indeks',
      'capite': 'forstået',
      'Segna questa pagina come capita': 'Markér denne side som forstået',
      '✓ Capita — la ripasserai dopo': '✓ Forstået — du gennemgår den senere',
      'Segnata come capita': 'Markeret som forstået',
      'Materiale non ancora pubblicato': 'Materiale endnu ikke udgivet',
      'in arrivo': 'kommer',
      'In questa pagina': 'På denne side',
      'Pagine vicine': 'Nærliggende sider',
      '← Prima': '← Forrige',
      'Dopo →': 'Næste →',
      'Passo precedente': 'Forrige trin',
      'Indietro': 'Tilbage',
      'Avanti →': 'Næste →',
      '▶ Riproduci': '▶ Afspil',
      '❚❚ Pausa': '❚❚ Pause',
      'Torna al primo passo': 'Tilbage til første trin',
      'passo': 'trin',
      'Tutti i passi': 'Alle trin',
      'Codice': 'Kode',
      'Il blocco intero': 'Hele blokken',
      'Righe ': 'Linjer ',
      'Riga ': 'Linje ',
      'Scena non trovata:': 'Scene ikke fundet:',
      'passo per passo': 'trin for trin',
      'codice smontato': 'kode, skilt ad',
      'animazione': 'animation',
      'cambia adesso': 'ændres nu',
      'il dato di partenza': 'startværdien',
      'secondo ruolo': 'anden rolle',
      'il risultato': 'resultatet',
      'scartato / sbagliato': 'kasseret / forkert',
      'Nessuna scadenza in programma.': 'Ingen frister planlagt.',
      'Altre scadenze': 'Flere frister',
      'Già passate': 'Allerede passeret',
      'sett.': 'uge',
      'questa settimana': 'denne uge',
      'passata': 'passeret',
      'oggi': 'i dag',
      'domani': 'i morgen',
      'fatta': 'afsluttet',
      'pausa': 'pause',
      'passato': 'passeret',
      'esame': 'eksamen',
      'da confermare': 'skal bekræftes',
      'facoltativo': 'valgfri',
      "giorni all'esame — ": 'dage til eksamen — ',
      'Oggi': 'I dag',
      'In bocca al lupo.': 'Held og lykke!',
      "L'esame ordinario (": 'Den ordinære eksamen (',
      ') è passato.': ') er overstået.',
      'giorno': 'dag',
      'quando e dove': 'hvornår og hvor',
      'note': 'noter',
      'Lingua': 'Sprog'
    }
  };
  const tr = s => (DIZ[LINGUA_UI] && DIZ[LINGUA_UI][s]) || s;
  const tv = s => (SITO.traduzioni && SITO.traduzioni[LINGUA_UI] && SITO.traduzioni[LINGUA_UI][s]) || s;
  const MESI = {
    it: ['gen', 'feb', 'mar', 'apr', 'mag', 'giu', 'lug', 'ago', 'set', 'ott', 'nov', 'dic'],
    en: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    da: ['jan', 'feb', 'mar', 'apr', 'maj', 'jun', 'jul', 'aug', 'sep', 'okt', 'nov', 'dec']
  };
  const tq = s => {
    if (!s || LINGUA_UI === 'it') return s;
    const m = /^(\d+) (\w+)$/.exec(s);
    const i = m ? MESI.it.indexOf(m[2]) : -1;
    if (i < 0) return tv(s);
    return LINGUA_UI === 'en' ? `${MESI.en[i]} ${m[1]}` : `${m[1]}. ${MESI.da[i]}`;
  };
  const tempo = g => LINGUA_UI === 'en' ? `in ${g} days` : LINGUA_UI === 'da' ? `om ${g} dage` : `tra ${g} giorni`;
  document.documentElement.lang = LINGUA_UI;

  const archivio = {
    chiave: k => 'atlante:' + SITO.sigla + ':' + k,
    leggi(k, d) { try { const v = localStorage.getItem(this.chiave(k)); return v === null ? d : JSON.parse(v); } catch (e) { return d; } },
    scrivi(k, v) { try { localStorage.setItem(this.chiave(k), JSON.stringify(v)); } catch (e) { } }
  };

  /* Spunte "Segna come capita": restano nel browser (localStorage) e, quando l'atlante è aperto
     con python _motore/server.py, vengono salvate anche nel file _stato/capiti.json, con lo storico
     di ogni spunta in _stato/storico-capiti.txt. Con il doppio clic il file non si può scrivere. */
  const FILE_CAPITI = new URL('../_stato/capiti', BASE).href;
  const SERVITO = location.protocol === 'http:' || location.protocol === 'https:';

  async function sincronizzaCapiti() {
    if (!SERVITO) return;
    try {
      const r = await fetch(FILE_CAPITI, { cache: 'no-store' });
      if (!r.ok) return;
      const stato = await r.json();
      if (Array.isArray(stato[SITO.sigla])) archivio.scrivi('capiti', stato[SITO.sigla]);
    } catch (e) { }
  }

  function salvaCapito(c, pagina, acceso) {
    if (!SERVITO) return;
    fetch(FILE_CAPITI, {
      method: 'POST', headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ sigla: SITO.sigla, capiti: c, pagina, acceso })
    }).catch(() => { });
  }

  /* ---------------------------------------------------------------------
     Pagina corrente e menu appiattito
     --------------------------------------------------------------------- */
  // Pagina italiana di questa pagina: le copie in en/ e da/ hanno lo stesso percorso senza il prefisso di lingua
  const qui = (() => {
    let h = location.href.split('#')[0].split('?')[0];
    if (h.endsWith('/')) h += 'index.html';
    return h.startsWith(BASE) ? decodeURIComponent(h.slice(BASE.length)).replace(/^(en|da)\//, '') : '';
  })();

  // Link alla stessa pagina nella lingua data: la copia tradotta se esiste (SITO.tradotte, creato da traduci.py), altrimenti l'italiana
  const verso = (h, lingua = LINGUA_UI) => {
    const tradotte = (SITO.tradotte && SITO.tradotte[lingua]) || [];
    return BASE + (lingua !== 'it' && tradotte.includes(h) ? lingua + '/' : '') + h;
  };

  const piatti = [];   // tutte le pagine linkabili in ordine
  (function appiattisci(voci, percorso) {
    for (const v of voci || []) {
      if (v.g) appiattisci(v.figli, percorso.concat(v.g));
      else if (v.h) piatti.push({ ...v, percorso });
    }
  })(SITO.menu, []);
  const indiceQui = piatti.findIndex(p => p.h === qui);
  const paginaQui = piatti[indiceQui];

  /* ---------------------------------------------------------------------
     Guscio: sidebar a tendine + barra mobile
     --------------------------------------------------------------------- */
  function marchio() {
    return `<a class="marchio" href="${BASE}index.html"><span class="sigla">${esc(SITO.sigla)}</span>` +
      `<span class="nome"><small>${tr('atlante di')}</small><span>${esc(tv(SITO.nome))}</span></span></a>`;
  }

  function costruisciNav(voci, contenitore, capiti) {
    for (const v of voci || []) {
      if (v.sez) { contenitore.appendChild(el('div', { class: 'sez' }, esc(tv(v.sez)))); continue; }
      if (v.g) {
        const d = el('details', { class: 'gruppo' });
        const contiene = JSON.stringify(v.figli || []).includes('"' + qui + '"');
        if (contiene || v.aperto) d.open = true;
        d.appendChild(el('summary', {}, esc(tv(v.g)) + (v.quando ? `<span class="quando">${esc(tq(v.quando))}</span>` : '')));
        const figli = el('div', { class: 'figli' });
        costruisciNav(v.figli, figli, capiti);
        d.appendChild(figli);
        contenitore.appendChild(d);
        continue;
      }
      if (v.arriva) {
        contenitore.appendChild(el('span', { class: 'arriva', title: tr('Materiale non ancora pubblicato') },
          esc(tv(v.t)) + `<em>${esc(tq(v.arriva))}</em>`));
        continue;
      }
      const a = el('a', { href: verso(v.h), 'aria-current': v.h === qui ? 'page' : null },
        esc(tv(v.t)) + (capiti.includes(v.h) ? `<span class="spunta" title="${tr('Segnata come capita')}">✓</span>` : ''));
      contenitore.appendChild(a);
    }
  }

  function guscio() {
    const capiti = archivio.leggi('capiti', []);
    const lato = el('aside', { class: 'lato', id: 'lato', 'aria-label': tr("Indice dell'atlante") });
    const testa = el('div', { class: 'lato-testa' }, marchio());
    const cerca = el('input', { class: 'cerca', type: 'search', placeholder: tr('Cerca un argomento…'), 'aria-label': tr('Cerca un argomento') });
    testa.appendChild(cerca);
    const nav = el('nav', { class: 'nav' });
    nav.appendChild(el('a', { href: BASE + '../index.html', class: 'altri-atlanti' }, tr('Mostra gli altri atlanti')));
    costruisciNav(SITO.menu, nav, capiti);
    const totali = piatti.filter(p => p.h !== 'index.html' && !p.noCapito).length;
    const fatti = capiti.filter(h => piatti.some(p => p.h === h)).length;
    const piede = el('div', { class: 'lato-piede' },
      `<button class="btn-tema" type="button">${tr('◐ Tema')}</button><span class="prog">${fatti} / ${totali} ${tr('capite')}</span>` +
      `<div class="lingue" role="group" aria-label="${tr('Lingua')}">${Object.entries(LINGUE_UI).map(([k, v]) => `<button type="button" data-lingua="${k}"${k === LINGUA_UI ? ' aria-pressed="true"' : ''}>${v}</button>`).join('')}</div>`);
    lato.append(testa, nav, piede);

    const colonna = el('div', { class: 'colonna' });
    const barra = el('div', { class: 'barra-mobile' }, `<button type="button" aria-controls="lato">${tr('☰ Indice')}</button>${marchio()}`);
    const contenuto = el('div', { class: 'contenuto' });
    while (document.body.firstChild) contenuto.appendChild(document.body.firstChild);
    colonna.append(barra, contenuto);
    const g = el('div', { class: 'guscio' });
    g.append(lato, colonna);
    document.body.appendChild(g);

    // spostare i nodi non riesegue gli script: ok
    $('button', barra).addEventListener('click', () => document.body.classList.toggle('menu-aperto'));
    document.addEventListener('click', e => {
      if (document.body.classList.contains('menu-aperto') && !lato.contains(e.target) && !barra.contains(e.target))
        document.body.classList.remove('menu-aperto');
    });
    document.addEventListener('keydown', e => { if (e.key === 'Escape') document.body.classList.remove('menu-aperto'); });

    $$('[data-lingua]', piede).forEach(b => b.addEventListener('click', () => {
      try { localStorage.setItem('atlante:lingua', b.dataset.lingua); } catch (e) { }
      location.replace(verso(qui, b.dataset.lingua) + location.hash);
    }));
    $('.btn-tema', piede).addEventListener('click', () => {
      const r = document.documentElement;
      const scuro = r.dataset.theme ? r.dataset.theme === 'dark' : matchMedia('(prefers-color-scheme: dark)').matches;
      r.dataset.theme = scuro ? 'light' : 'dark';
      try { localStorage.setItem('atlante:tema', r.dataset.theme); } catch (e) { }
    });

    cerca.addEventListener('input', () => {
      const q = norm(cerca.value.trim());
      $$('a, .arriva', nav).forEach(a => a.classList.toggle('nascosto', q !== '' && !norm(a.textContent).includes(q)));
      $$('details', nav).forEach(d => {
        if (q === '') { d.open = d.dataset.eraAperto ? d.dataset.eraAperto === '1' : d.open; delete d.dataset.eraAperto; d.classList.remove('nascosto'); return; }
        if (!d.dataset.eraAperto) d.dataset.eraAperto = d.open ? '1' : '0';
        const visibili = $$('a:not(.nascosto), .arriva:not(.nascosto)', d).length;
        d.open = visibili > 0; d.classList.toggle('nascosto', visibili === 0);
      });
      $$('.sez', nav).forEach(s => s.classList.toggle('nascosto', q !== ''));
    });

    const attuale = $('a[aria-current="page"]', nav);
    if (attuale) requestAnimationFrame(() => attuale.scrollIntoView({ block: 'center' }));
  }

  /* ---------------------------------------------------------------------
     Testata, indice della pagina, fondo con pagine vicine
     --------------------------------------------------------------------- */
  function slug(t) { return norm(t).replace(/[^a-z0-9]+/g, '-').replace(/^-|-$/g, '').slice(0, 60); }

  function testata() {
    const pagina = $('.pagina');
    if (!pagina) return;
    const testa = $('.testa', pagina);
    if (testa && !$('.occhiello', testa) && paginaQui && paginaQui.percorso.length) {
      testa.insertBefore(el('div', { class: 'occhiello' }, paginaQui.percorso.map(p => `<span>${esc(p)}</span>`).join('')), testa.firstChild);
    }
    if (paginaQui && !document.title.includes(SITO.sigla)) document.title += ' · ' + tr('Atlante') + ' ' + SITO.sigla;

    const h2 = $$(':scope > section > h2', pagina);
    h2.forEach(h => { if (!h.id) h.id = slug(h.textContent); });
    if (testa && h2.length >= 3 && !pagina.hasAttribute('data-senza-indice')) {
      const ul = el('ul', { class: 'indice-pagina', 'aria-label': tr('In questa pagina') });
      h2.forEach(h => ul.appendChild(el('li', {}, `<a href="#${h.id}">${esc(h.textContent)}</a>`)));
      testa.after(ul);
    }

    if (!paginaQui || qui === 'index.html') return;
    const fondo = el('div', { class: 'fondo' });
    if (!paginaQui.noCapito) {
      const capiti = archivio.leggi('capiti', []);
      const b = el('button', { class: 'btn capito', type: 'button', 'aria-pressed': capiti.includes(qui) ? 'true' : 'false' });
      const etichetta = () => b.textContent = b.getAttribute('aria-pressed') === 'true' ? tr('✓ Capita — la ripasserai dopo') : tr('Segna questa pagina come capita');
      etichetta();
      b.addEventListener('click', () => {
        let c = archivio.leggi('capiti', []);
        const on = !c.includes(qui);
        c = on ? c.concat(qui) : c.filter(x => x !== qui);
        archivio.scrivi('capiti', c);
        salvaCapito(c, qui, on);
        b.setAttribute('aria-pressed', on ? 'true' : 'false'); etichetta();
        const link = $(`.nav a[aria-current="page"]`);
        if (link) { const s = $('.spunta', link); if (on && !s) link.insertAdjacentHTML('beforeend', '<span class="spunta">✓</span>'); if (!on && s) s.remove(); }
        const prog = $('.lato-piede .prog');
        if (prog) { const tot = piatti.filter(p => p.h !== 'index.html' && !p.noCapito).length; prog.textContent = `${c.filter(h => piatti.some(p => p.h === h)).length} / ${tot} ${tr('capite')}`; }
      });
      fondo.appendChild(b);
    }
    const vicine = el('nav', { class: 'pagine-vicine', 'aria-label': tr('Pagine vicine') });
    const prima = piatti[indiceQui - 1], dopo = piatti[indiceQui + 1];
    if (prima) vicine.appendChild(el('a', { href: verso(prima.h), class: 'prima' }, `<small>${tr('← Prima')}</small>${esc(tv(prima.t))}`));
    if (dopo) vicine.appendChild(el('a', { href: verso(dopo.h), class: 'dopo' }, `<small>${tr('Dopo →')}</small>${esc(tv(dopo.t))}`));
    fondo.appendChild(vicine);
    pagina.appendChild(fondo);
  }

  /* ---------------------------------------------------------------------
     Evidenziazione della sintassi
     --------------------------------------------------------------------- */
  const parole = s => new Set(s.split(/\s+/));
  const LINGUE = {
    scala: { kw: parole('abstract case catch class def do else enum export extends extension false final finally for given if implicit import lazy match new null object override package private protected return sealed super then this throw trait true try type using val var while with yield end derives opaque inline transparent'), com: ['//', '/*'], maiuscole: true, apice: 'char' },
    java: { kw: parole('abstract assert boolean break byte case catch char class continue default do double else enum extends final finally float for if implements import instanceof int interface long native new null package private protected public return short static super switch synchronized this throw throws transient try void volatile while var record true false yield sealed permits'), com: ['//', '/*'], maiuscole: true, apice: 'char' },
    python: { kw: parole('and as assert break class continue def del elif else except False finally for from global if import in is lambda None nonlocal not or pass raise return True try while with yield self'), com: ['#'], maiuscole: false, apice: 'str' },
    erlang: { kw: parole('after and andalso band begin bnot bor bsl bsr bxor case catch cond div end fun if let not of or orelse receive rem try when xor'), com: ['%'], maiuscole: true, apice: 'str' },
    fsharp: { kw: parole('let rec in if then else match with fun function type of member val mutable return yield do for while true false new'), com: ['//', '(*'], maiuscole: true, apice: 'char' },
    pseudo: { kw: parole('for each to do while if then else return and or not in let repeat until function procedure end foreach break continue true false null nil set while output input'), com: ['//'], maiuscole: false, apice: 'str' }
  };
  const OPERATORI = ['=>', '<-', '->', ':::', '::', '>:', '<:', '==', '!=', '<=', '>=', '&&', '||', '++', ':=', '?'];

  function colora(src, lingua, st) {
    const L = LINGUE[lingua];
    if (!L) return esc(src);
    let out = '', i = 0;
    const n = src.length;
    const span = (c, t) => `<span class="sx-${c}">${esc(t)}</span>`;
    while (i < n) {
      if (st.blocco) {
        const fine = src.indexOf(st.blocco, i);
        if (fine < 0) { out += span('com', src.slice(i)); i = n; }
        else { out += span('com', src.slice(i, fine + st.blocco.length)); i = fine + st.blocco.length; st.blocco = null; }
        continue;
      }
      const resto = src.slice(i), c = src[i];
      if (L.com.includes('//') && resto.startsWith('//')) { out += span('com', resto); break; }
      if (L.com.includes('#') && c === '#') { out += span('com', resto); break; }
      if (L.com.includes('%') && c === '%') { out += span('com', resto); break; }
      if (L.com.includes('/*') && resto.startsWith('/*')) { st.blocco = '*/'; out += span('com', '/*'); i += 2; continue; }
      if (L.com.includes('(*') && resto.startsWith('(*')) { st.blocco = '*)'; out += span('com', '(*'); i += 2; continue; }
      if (c === '"' || (c === "'" && L.apice === 'str')) {
        if (resto.startsWith('"""')) {
          const f = src.indexOf('"""', i + 3); const j = f < 0 ? n : f + 3;
          out += span('str', src.slice(i, j)); i = j; continue;
        }
        let j = i + 1;
        while (j < n && src[j] !== c) j += src[j] === '\\' ? 2 : 1;
        out += span('str', src.slice(i, Math.min(j + 1, n))); i = j + 1; continue;
      }
      if (c === "'" && L.apice === 'char') {
        const m = /^'(\\.|[^'\\])'/.exec(resto);
        if (m) { out += span('str', m[0]); i += m[0].length; continue; }
      }
      let m = /^[A-Za-z_][A-Za-z0-9_]*/.exec(resto);
      if (m) {
        const w = m[0];
        out += L.kw.has(w) ? span('kw', w) : (L.maiuscole && /^[A-Z]/.test(w) ? span('ty', w) : esc(w));
        i += w.length; continue;
      }
      m = /^\d[\d_]*(\.\d+)?([eE][+-]?\d+)?[LlFfDd]?/.exec(resto);
      if (m) { out += span('num', m[0]); i += m[0].length; continue; }
      const op = OPERATORI.find(o => resto.startsWith(o));
      if (op) { out += span('op', op); i += op.length; continue; }
      out += esc(c); i++;
    }
    return out;
  }

  // "tok", "tok@ruolo", "tok*@ruolo" (tutte), "tok#2@ruolo" (la seconda)
  function leggiSegni(s) {
    if (!s) return [];
    return s.split('|').filter(Boolean).map(p => {
      let ruolo = 'ora';
      const at = p.lastIndexOf('@');
      if (at > 0 && RUOLI.includes(p.slice(at + 1))) { ruolo = p.slice(at + 1); p = p.slice(0, at); }
      let tutte = false, occ = 1;
      if (p.length > 1 && p.endsWith('*')) { tutte = true; p = p.slice(0, -1); }
      const h = /#(\d+)$/.exec(p);
      if (h && p.length > h[0].length) { occ = +h[1]; p = p.slice(0, -h[0].length); }
      return { tok: p, ruolo, tutte, occ };
    });
  }

  // restituisce, per ogni riga (indice), gli intervalli [da, a, ruolo] da evidenziare
  function trovaSegni(righe, indici, segni) {
    const mappa = {};
    for (const s of segni) {
      let conta = 0;
      for (const r of indici) {
        const t = righe[r] || '';
        let k = t.indexOf(s.tok);
        while (k >= 0) {
          conta++;
          if (s.tutte || conta === s.occ) (mappa[r] = mappa[r] || []).push([k, k + s.tok.length, s.ruolo]);
          if (!s.tutte && conta >= s.occ) break;
          k = t.indexOf(s.tok, k + s.tok.length);
        }
        if (!s.tutte && conta >= s.occ) break;
      }
      if (conta < s.occ) console.warn('atlante: evidenziazione non trovata →', JSON.stringify(s.tok) + (s.occ > 1 ? '#' + s.occ : ''), 'nelle righe', indici.map(i => i + 1).join(','));
    }
    for (const r in mappa) {
      mappa[r].sort((a, b) => a[0] - b[0]);
      const tenuti = [];
      for (const x of mappa[r]) {
        const prec = tenuti[tenuti.length - 1];
        if (prec && x[0] < prec[1]) console.warn('atlante: evidenziazione sovrapposta scartata nella riga', +r + 1, '→', JSON.stringify(righe[r].slice(x[0], x[1])));
        else tenuti.push(x);
      }
      mappa[r] = tenuti;
    }
    return mappa;
  }

  function coloraRiga(testo, lingua, st, intervalli) {
    if (!intervalli || !intervalli.length) return colora(testo, lingua, st);
    let out = '', pos = 0;
    for (const [a, b, ruolo] of intervalli) {
      out += colora(testo.slice(pos, a), lingua, st);
      out += `<mark class="${ruolo}">${colora(testo.slice(a, b), lingua, st)}</mark>`;
      pos = b;
    }
    return out + colora(testo.slice(pos), lingua, st);
  }

  function testoPre(pre) {
    return pre.textContent.replace(/^\n/, '').replace(/\s+$/, '').replace(/\t/g, '  ');
  }

  function preSemplici() {
    $$('pre.cod[data-lang], .errore pre[data-lang], .carta pre[data-lang]').forEach(pre => {
      if (pre.dataset.fatto) return;
      const st = {};
      const righe = testoPre(pre).split('\n');
      const segni = leggiSegni(pre.dataset.segna);
      const mappa = trovaSegni(righe, righe.map((_, i) => i), segni);
      pre.innerHTML = righe.map((r, i) => coloraRiga(r, pre.dataset.lang, st, mappa[i])).join('\n');
      pre.dataset.fatto = '1';
    });
  }

  /* ---------------------------------------------------------------------
     Comandi comuni: indietro / avanti / riproduci / contatore
     --------------------------------------------------------------------- */
  function comandi(figura, totale, vai, durata) {
    const barra = el('div', { class: 'comandi' },
      `<span class="avanz" aria-hidden="true"></span>` +
      `<button class="btn" type="button" data-az="prima" aria-label="${tr('Passo precedente')}">←<span class="etich"> ${tr('Indietro')}</span></button>` +
      `<button class="btn primario" type="button" data-az="dopo">${tr('Avanti →')}</button>` +
      `<button class="btn leggero" type="button" data-az="play">${tr('▶ Riproduci')}</button>` +
      `<button class="btn leggero" type="button" data-az="ricomincia" title="${tr('Torna al primo passo')}">↺</button>` +
      `<span class="contatore" aria-live="polite"></span>`);
    let i = 0, timer = null;
    const b = az => $(`[data-az="${az}"]`, barra);
    const ferma = () => { if (timer) { clearTimeout(timer); timer = null; } b('play').textContent = tr('▶ Riproduci'); };
    const aggiorna = (utente) => {
      b('prima').disabled = i <= 0;
      b('dopo').disabled = i >= totale - 1;
      $('.contatore', barra).textContent = `${tr('passo')} ${i + 1} / ${totale}`;
      $('.avanz', barra).style.width = (totale > 1 ? (i / (totale - 1)) * 100 : 100) + '%';
      vai(i, utente);
      if (utente) {
        const r = barra.getBoundingClientRect();
        if (r.bottom > innerHeight || r.top < 0) barra.scrollIntoView({ block: 'nearest', behavior: RIDOTTO ? 'auto' : 'smooth' });
      }
    };
    const gira = () => {
      if (i >= totale - 1) { ferma(); return; }
      i++; aggiorna(true);
      timer = setTimeout(gira, durata ? durata(i) : 2200);
    };
    barra.addEventListener('click', e => {
      const az = e.target.closest('button')?.dataset.az;
      if (!az) return;
      if (az === 'prima' && i > 0) { ferma(); i--; aggiorna(true); }
      if (az === 'dopo' && i < totale - 1) { ferma(); i++; aggiorna(true); }
      if (az === 'ricomincia') { ferma(); i = 0; aggiorna(true); }
      if (az === 'play') {
        if (timer) { ferma(); return; }
        if (i >= totale - 1) { i = 0; aggiorna(true); }
        b('play').textContent = tr('❚❚ Pausa');
        timer = setTimeout(gira, 900);
      }
    });
    figura.tabIndex = 0;
    figura.addEventListener('keydown', e => {
      if (e.target.closest('input, textarea, select')) return;
      if (e.key === 'ArrowRight' && i < totale - 1) { ferma(); i++; aggiorna(true); e.preventDefault(); }
      if (e.key === 'ArrowLeft' && i > 0) { ferma(); i--; aggiorna(true); e.preventDefault(); }
      if (e.key === 'Home') { ferma(); i = 0; aggiorna(true); e.preventDefault(); }
      if (e.key === 'End') { ferma(); i = totale - 1; aggiorna(true); e.preventDefault(); }
    });
    return {
      barra,
      vaiA(k) { ferma(); i = Math.max(0, Math.min(totale - 1, k)); aggiorna(true); },
      avvia() { aggiorna(false); },
      ferma
    };
  }

  function testataFoglio(figura, tipo, titolo, conTutti) {
    const t = el('div', { class: 'foglio-testa' },
      `<span class="tipo">${esc(tr(tipo))}</span><span class="tit">${titolo || ''}</span>` +
      (conTutti ? `<label class="interruttore tutti"><input type="checkbox"><span class="sw"></span>${tr('Tutti i passi')}</label>` : ''));
    return t;
  }

  function legendaHtml(lista) {
    const nomi = { ora: tr('cambia adesso'), dato: tr('il dato di partenza'), due: tr('secondo ruolo'), ok: tr('il risultato'), no: tr('scartato / sbagliato') };
    const etichette = {};
    lista.split(',').map(s => s.trim()).filter(Boolean).forEach(s => {
      const [r, ...testo] = s.split(':');
      etichette[r.trim()] = testo.join(':').trim() || nomi[r.trim()];
    });
    return `<div class="legenda" style="margin:0;padding:8px 20px 0">` +
      Object.entries(etichette).map(([r, t]) => `<span class="l-${r}"><i></i>${esc(t)}</span>`).join('') + '</div>';
  }

  /* ---------------------------------------------------------------------
     PASSI — il foglio Papyro
     <figure class="passi" data-titolo="…" [data-legenda="ora:…,ok:…"] [data-modo="sostituisci"]>
       <div class="passo"><div class="espr">…<mark class="ora">x</mark>…</div><p class="nota">…</p></div>
     </figure>
     --------------------------------------------------------------------- */
  function passi(figura) {
    const righe = $$(':scope > .passo', figura);
    if (!righe.length) return;
    figura.classList.add('foglio', 'passo-a-passo');
    if (figura.dataset.modo === 'sostituisci') figura.classList.add('sostituisci');
    const corpo = el('div', { class: 'passi-corpo puntinato' });
    righe.forEach((r, k) => {
      r.insertBefore(el('span', { class: 'num', 'aria-hidden': 'true' }, String(k + 1)), r.firstChild);
      $$('pre.cod[data-lang], .espr[data-lang]', r).forEach(p => {
        const st = {};
        const tx = testoPre(p).split('\n');
        const mappa = trovaSegni(tx, tx.map((_, i) => i), leggiSegni(p.dataset.segna));
        p.innerHTML = tx.map((x, i) => coloraRiga(x, p.dataset.lang, st, mappa[i])).join('\n');
      });
      corpo.appendChild(r);
    });
    const testa = testataFoglio(figura, 'passo per passo', figura.dataset.titolo, true);
    figura.appendChild(testa);
    if (figura.dataset.legenda) figura.appendChild(el('div', {}, legendaHtml(figura.dataset.legenda)).firstChild);
    figura.appendChild(corpo);

    const c = comandi(figura, righe.length, (i) => {
      righe.forEach((r, k) => {
        r.classList.toggle('passato', k < i);
        r.classList.toggle('attuale', k === i);
        r.classList.toggle('futuro', k > i);
        if (k === i) { r.style.animation = 'none'; void r.offsetWidth; r.style.animation = ''; $$('mark', r).forEach(m => { m.style.animation = 'none'; void m.offsetWidth; m.style.animation = ''; }); }
      });
    }, i => 1500 + Math.min(4200, (righe[i].textContent.length) * 28));
    figura.appendChild(c.barra);
    righe.forEach((r, k) => r.addEventListener('click', () => { if (figura.classList.contains('passo-a-passo') && r.classList.contains('passato')) c.vaiA(k); }));

    const sw = $('input', testa);
    sw.addEventListener('change', () => {
      c.ferma();
      figura.classList.toggle('passo-a-passo', !sw.checked);
      c.barra.hidden = sw.checked;
    });
    c.avvia();
    if (figura.dataset.inizio === 'tutti') { sw.checked = true; sw.dispatchEvent(new Event('change')); }
  }

  /* ---------------------------------------------------------------------
     CODICE — un blocco smontato riga per riga
     <figure class="codice" data-titolo="…">
       <pre data-lang="scala">…</pre>
       <div class="intro">(facoltativo: primo passo senza evidenziazione)</div>
       <ol class="spiega">
         <li data-righe="1,3-4" data-segna="map|f(a)@ok">spiegazione</li>
       </ol>
     </figure>
     --------------------------------------------------------------------- */
  function intervalloRighe(s, max) {
    if (!s) return [];
    const out = [];
    s.split(',').forEach(p => {
      const [a, b] = p.split('-').map(x => parseInt(x, 10));
      if (isNaN(a)) return;
      for (let k = a; k <= (isNaN(b) ? a : b); k++) if (k >= 1 && k <= max) out.push(k - 1);
    });
    return out;
  }

  function codice(figura) {
    const pre = $(':scope > pre', figura);
    const ol = $(':scope > ol.spiega', figura);
    if (!pre || !ol) return;
    const lingua = pre.dataset.lang || 'scala';
    const righe = testoPre(pre).split('\n');
    const intro = $(':scope > .intro', figura);
    const voci = $$(':scope > li', ol).map(li => ({
      righe: intervalloRighe(li.dataset.righe, righe.length),
      segni: leggiSegni(li.dataset.segna),
      html: li.innerHTML
    }));
    if (intro) voci.unshift({ righe: [], segni: [], html: intro.innerHTML, intro: true });
    pre.remove(); ol.remove(); if (intro) intro.remove();

    figura.classList.add('foglio');
    const testa = testataFoglio(figura, 'codice smontato', figura.dataset.titolo, true);
    const corpo = el('div', { class: 'cod-corpo' });
    const vista = el('pre', { class: 'cod-pre', 'aria-label': tr('Codice') });
    const lato = el('div', { class: 'cod-spiega' }, `<div class="qui"></div><div class="testo-passo"></div>`);
    corpo.append(vista, lato);

    const disegna = (voce) => {
      const st = {};
      const mappa = trovaSegni(righe, voce.righe, voce.segni);
      vista.innerHTML = righe.map((r, k) =>
        `<span class="cod-riga${voce.righe.includes(k) ? ' fuoco' : ''}">${coloraRiga(r, lingua, st, mappa[k]) || ' '}</span>`).join('');
    };

    const tutti = el('div', { class: 'cod-tutti' });
    tutti.innerHTML = voci.map(v => {
      if (v.intro || !v.righe.length) return `<div class="blocco"><div>${v.html}</div></div>`;
      const st = {};
      // lo stato dei commenti multiriga parte dall'inizio del file
      const prima = Math.min(...v.righe);
      for (let k = 0; k < prima; k++) colora(righe[k], lingua, st);
      const mappa = trovaSegni(righe, v.righe, v.segni);
      const ordinate = [...new Set(v.righe)].sort((a, b) => a - b);
      return `<div class="blocco"><pre>` + ordinate.map(k =>
        `<span class="cod-riga" data-n="${k + 1}">${coloraRiga(righe[k], lingua, st, mappa[k]) || ' '}</span>`).join('') +
        `</pre><div>${v.html}</div></div>`;
    }).join('');

    figura.append(testa, corpo, tutti);
    const descr = v => {
      if (!v.righe.length) return tr('Il blocco intero');
      const o = [...new Set(v.righe)].sort((a, b) => a - b).map(k => k + 1);
      const gruppi = [];
      o.forEach(n => { const g = gruppi[gruppi.length - 1]; if (g && n === g[1] + 1) g[1] = n; else gruppi.push([n, n]); });
      return (o.length > 1 ? tr('Righe ') : tr('Riga ')) + gruppi.map(([a, b]) => a === b ? a : `${a}–${b}`).join(', ');
    };
    const c = comandi(figura, voci.length, (i) => {
      const v = voci[i];
      figura.classList.toggle('con-fuoco', v.righe.length > 0);
      disegna(v);
      $('.qui', lato).textContent = descr(v);
      const tp = $('.testo-passo', lato);
      tp.innerHTML = v.html;
      tp.style.animation = 'none'; void tp.offsetWidth; tp.style.animation = '';
      preSempliciIn(tp);
    }, i => 2000 + Math.min(5000, voci[i].html.replace(/<[^>]+>/g, '').length * 30));
    figura.appendChild(c.barra);
    const sw = $('input', testa);
    sw.addEventListener('change', () => { c.ferma(); figura.classList.toggle('tutti', sw.checked); c.barra.hidden = sw.checked; });
    c.avvia();
    preSempliciIn(tutti);
  }

  function preSempliciIn(radice) {
    $$('pre.cod[data-lang]', radice).forEach(pre => {
      if (pre.dataset.fatto) return;
      const st = {}; pre.innerHTML = testoPre(pre).split('\n').map(r => colora(r, pre.dataset.lang, st)).join('\n'); pre.dataset.fatto = '1';
    });
  }

  /* ---------------------------------------------------------------------
     SCENA — disegni SVG animati passo per passo
     In pagina:  <figure class="scena" data-scena="nome" data-titolo="…"></figure>
     Definizione (script inline PRIMA di atlas.js o ovunque nella pagina):
       (window.SCENE = window.SCENE || {}).nome = {
         w: 520, h: 300, lato: true, codice: {lang:'pseudo', testo:`…`},
         oggetti: [ {id:'A', tipo:'nodo', x:60, y:80, t:'A'}, {id:'AB', tipo:'arco', da:'A', a:'B', dir:true} ],
         passi: [ {nota:'…', righe:[1], set:{ A:{tono:'ora'}, AB:{tono:'ok', t:'3/5'} }} ]
       }
     --------------------------------------------------------------------- */
  const GEOM = ['x', 'y', 'x1', 'y1', 'x2', 'y2', 'w', 'h', 'r', 'curva'];
  const NS = 'http://www.w3.org/2000/svg';
  const sv = (tag, attrs = {}) => { const e = document.createElementNS(NS, tag); for (const k in attrs) e.setAttribute(k, attrs[k]); return e; };

  function scena(figura) {
    const def = (window.SCENE || {})[figura.dataset.scena];
    if (!def) { figura.innerHTML = `<p class="piccolo">${tr('Scena non trovata:')} «${esc(figura.dataset.scena)}»</p>`; return; }
    const passiDef = def.passi && def.passi.length ? def.passi : [{ nota: '' }];
    figura.classList.add('foglio');
    if (def.lato === false) figura.classList.add('solo-svg');

    // stati cumulativi
    const base = {};
    def.oggetti.forEach(o => { base[o.id] = { ...o }; });
    const stati = [];
    let corrente = JSON.parse(JSON.stringify(base));
    passiDef.forEach(p => {
      const nuovo = JSON.parse(JSON.stringify(corrente));
      for (const id in (p.set || {})) {
        if (!nuovo[id]) { console.warn('scena: id sconosciuto', id); continue; }
        Object.assign(nuovo[id], JSON.parse(JSON.stringify(p.set[id])));
      }
      stati.push(nuovo); corrente = nuovo;
    });

    const svg = sv('svg', { viewBox: `0 0 ${def.w || 520} ${def.h || 300}`, role: 'img', 'aria-label': figura.dataset.titolo || 'scena' });
    const livelli = { fondo: sv('g'), archi: sv('g'), sopra: sv('g') };
    svg.append(livelli.fondo, livelli.archi, livelli.sopra);
    const nodiSvg = {};

    const assi = id => stati[0][id];
    const mappaXY = (o, x, y, stato) => {
      const a = o.in ? stato[o.in] : null;
      if (!a) return [x, y];
      const [bx, by, bw, bh] = a.box, [x0, x1, y0, y1] = a.dom;
      return [bx + (x - x0) / (x1 - x0) * bw, by + bh - (y - y0) / (y1 - y0) * bh];
    };

    function crea(o) {
      let g;
      const lv = o.tipo === 'arco' ? livelli.archi : (['assi', 'poli', 'rett', 'linea'].includes(o.tipo) ? livelli.fondo : livelli.sopra);
      switch (o.tipo) {
        case 'nodo': g = sv('g', { class: 'sv-nodo' }); g.append(o.forma === 'quadrato' ? sv('rect') : sv('circle'), sv('text'), sv('text', { class: 'sotto' })); break;
        case 'arco': g = sv('g', { class: 'sv-arco' }); g.append(sv('path'), sv('path', { class: 'punta' }), sv('text')); break;
        case 'linea': g = sv('line', { class: 'sv-linea' }); break;
        case 'vett': g = sv('g', { class: 'sv-vett' }); g.append(sv('line'), sv('path'), sv('text')); break;
        case 'punto': g = sv('g', { class: 'sv-punto' }); g.append(sv('circle'), sv('text')); break;
        case 'rett': g = sv('g', { class: 'sv-rett' }); g.append(sv('rect', { rx: 5 }), sv('text')); break;
        case 'testo': g = sv('text', { class: 'sv-testo' }); break;
        case 'poli': g = sv('polygon', { class: 'sv-poli' }); break;
        case 'celle': g = sv('g', { class: 'sv-celle' }); break;
        case 'griglia': g = sv('g', { class: 'sv-griglia' }); break;
        case 'assi': g = sv('g', { class: 'sv-assi' }); break;
        default: g = sv('g');
      }
      lv.appendChild(g);
      nodiSvg[o.id] = g;
    }
    def.oggetti.forEach(crea);

    const tono = (g, o, classeBase) => {
      g.setAttribute('class', classeBase + (o.tono ? ' tn-' + o.tono : '') + (o.nascosto ? ' sv-nascosto' : ''));
    };

    function bordoNodo(n, verso) {
      const r = n.r || 20;
      const dx = verso[0] - n.x, dy = verso[1] - n.y, d = Math.hypot(dx, dy) || 1;
      return [n.x + dx / d * (r + 2), n.y + dy / d * (r + 2)];
    }

    function disegna(stato) {
      for (const id in stato) {
        const o = stato[id], g = nodiSvg[id];
        if (!g) continue;
        switch (o.tipo) {
          case 'nodo': {
            tono(g, o, 'sv-nodo');
            const r = o.r || 20, [f, t, s] = g.children;
            if (f.tagName === 'circle') { f.setAttribute('cx', o.x); f.setAttribute('cy', o.y); f.setAttribute('r', r); }
            else { f.setAttribute('x', o.x - r); f.setAttribute('y', o.y - r); f.setAttribute('width', 2 * r); f.setAttribute('height', 2 * r); f.setAttribute('rx', 6); }
            t.setAttribute('x', o.x); t.setAttribute('y', o.y); t.textContent = o.t ?? id;
            s.setAttribute('x', o.x); s.setAttribute('y', o.sopra ? o.y - r - 12 : o.y + r + 13); s.textContent = o.sotto ?? o.sopra ?? '';
            break;
          }
          case 'arco': {
            const A = stato[o.da], B = stato[o.a];
            if (!A || !B) break;
            tono(g, o, 'sv-arco');
            const [path, punta, txt] = g.children;
            const cv = o.curva || 0;
            const mx = (A.x + B.x) / 2, my = (A.y + B.y) / 2;
            const dx = B.x - A.x, dy = B.y - A.y, L = Math.hypot(dx, dy) || 1;
            const cx = mx - dy / L * cv, cy = my + dx / L * cv;
            const p1 = bordoNodo(A, cv ? [cx, cy] : [B.x, B.y]);
            const p2 = bordoNodo(B, cv ? [cx, cy] : [A.x, A.y]);
            path.setAttribute('d', cv ? `M${p1[0]},${p1[1]} Q${cx},${cy} ${p2[0]},${p2[1]}` : `M${p1[0]},${p1[1]} L${p2[0]},${p2[1]}`);
            if (o.dir) {
              const ux = p2[0] - (cv ? cx : p1[0]), uy = p2[1] - (cv ? cy : p1[1]), ul = Math.hypot(ux, uy) || 1;
              const ax = ux / ul, ay = uy / ul, s = 9;
              punta.setAttribute('d', `M${p2[0]},${p2[1]} L${p2[0] - ax * s - ay * s * .55},${p2[1] - ay * s + ax * s * .55} L${p2[0] - ax * s + ay * s * .55},${p2[1] - ay * s - ax * s * .55} Z`);
            } else punta.setAttribute('d', '');
            const lx = cv ? (mx + cx) / 2 * 1 : mx, ly = cv ? (my + cy) / 2 : my;
            const off = cv ? 0 : 11;
            txt.setAttribute('x', lx - dy / L * off); txt.setAttribute('y', ly + dx / L * off);
            txt.textContent = o.t ?? '';
            break;
          }
          case 'linea': {
            tono(g, o, 'sv-linea');
            const [a, b] = mappaXY(o, o.x1, o.y1, stato), [c, d] = mappaXY(o, o.x2, o.y2, stato);
            g.setAttribute('x1', a); g.setAttribute('y1', b); g.setAttribute('x2', c); g.setAttribute('y2', d);
            if (o.tratt) g.setAttribute('stroke-dasharray', '6 5'); else g.removeAttribute('stroke-dasharray');
            break;
          }
          case 'vett': {
            tono(g, o, 'sv-vett');
            const [line, head, txt] = g.children;
            const [a, b] = mappaXY(o, o.x1, o.y1, stato), [c, d] = mappaXY(o, o.x2, o.y2, stato);
            const ux = c - a, uy = d - b, ul = Math.hypot(ux, uy) || 1, ax = ux / ul, ay = uy / ul, s = 11;
            line.setAttribute('x1', a); line.setAttribute('y1', b); line.setAttribute('x2', c - ax * s * .8); line.setAttribute('y2', d - ay * s * .8);
            head.setAttribute('d', ul < 2 ? '' : `M${c},${d} L${c - ax * s - ay * s * .5},${d - ay * s + ax * s * .5} L${c - ax * s + ay * s * .5},${d - ay * s - ax * s * .5} Z`);
            txt.setAttribute('x', c + (o.tx || 8)); txt.setAttribute('y', d + (o.ty || -8)); txt.textContent = o.t ?? '';
            break;
          }
          case 'punto': {
            tono(g, o, 'sv-punto');
            const [c, t] = g.children, [x, y] = mappaXY(o, o.x, o.y, stato);
            c.setAttribute('cx', x); c.setAttribute('cy', y); c.setAttribute('r', o.r || 5);
            t.setAttribute('x', x + (o.tx ?? 9)); t.setAttribute('y', y + (o.ty ?? -9)); t.textContent = o.t ?? '';
            break;
          }
          case 'rett': {
            tono(g, o, 'sv-rett');
            const [r, t] = g.children;
            r.setAttribute('x', o.x); r.setAttribute('y', o.y); r.setAttribute('width', Math.max(0, o.w)); r.setAttribute('height', Math.max(0, o.h));
            t.setAttribute('x', o.x + o.w / 2); t.setAttribute('y', o.y + o.h / 2); t.textContent = o.t ?? '';
            break;
          }
          case 'testo': {
            g.setAttribute('class', 'sv-testo' + (o.tono ? ' tn-' + o.tono : '') + (o.nascosto ? ' sv-nascosto' : ''));
            const [x, y] = mappaXY(o, o.x, o.y, stato);
            g.setAttribute('x', x); g.setAttribute('y', y);
            g.style.fontSize = (o.size || 13) + 'px';
            g.style.textAnchor = o.anchor || 'middle';
            g.style.fontWeight = o.bold ? '700' : '';
            g.textContent = o.t ?? '';
            break;
          }
          case 'poli': {
            g.setAttribute('class', 'sv-poli' + (o.tono ? ' tn-' + o.tono : '') + (o.vuoto ? ' vuoto' : '') + (o.nascosto ? ' sv-nascosto' : ''));
            g.setAttribute('points', (o.punti || []).map(p => mappaXY(o, p[0], p[1], stato).join(',')).join(' '));
            break;
          }
          case 'celle': {
            g.setAttribute('class', 'sv-celle' + (o.nascosto ? ' sv-nascosto' : ''));
            const vals = o.valori || [], cw = o.cw || 40, ch = o.ch || 34;
            while (g.children.length > vals.length) g.lastChild.remove();
            while (g.children.length < vals.length) { const c = sv('g', { class: 'sv-cella' }); c.append(sv('rect'), sv('text'), sv('text', { class: 'idx' })); g.appendChild(c); }
            vals.forEach((v, k) => {
              const c = g.children[k], [r, t, ix] = c.children;
              const tn = (o.toni || {})[k];
              c.setAttribute('class', 'sv-cella' + (tn ? ' tn-' + tn : ''));
              r.setAttribute('x', o.x + k * cw); r.setAttribute('y', o.y); r.setAttribute('width', cw); r.setAttribute('height', ch);
              t.setAttribute('x', o.x + k * cw + cw / 2); t.setAttribute('y', o.y + ch / 2); t.textContent = v;
              ix.setAttribute('x', o.x + k * cw + cw / 2); ix.setAttribute('y', o.y + ch + 11);
              ix.textContent = o.etichette ? (o.etichette[k] ?? '') : (o.indici === false ? '' : k + (o.da1 ? 1 : 0));
            });
            break;
          }
          case 'griglia': {
            g.setAttribute('class', 'sv-griglia' + (o.nascosto ? ' sv-nascosto' : ''));
            g.innerHTML = '';
            const vals = o.valori || [], cw = o.cw || 40, ch = o.ch || 30;
            const offX = o.intR ? (o.cwR || cw) : 0, offY = o.intC ? ch : 0;
            if (o.intC) o.intC.forEach((t, c) => { const e = sv('text', { class: 'sv-testo', x: o.x + offX + c * cw + cw / 2, y: o.y + ch / 2 }); e.textContent = t; e.style.fill = 'var(--ink-3)'; e.style.fontSize = '11.5px'; g.appendChild(e); });
            if (o.intR) o.intR.forEach((t, r) => { const e = sv('text', { class: 'sv-testo', x: o.x + offX / 2, y: o.y + offY + r * ch + ch / 2 }); e.textContent = t; e.style.fill = 'var(--ink-3)'; e.style.fontSize = '11.5px'; g.appendChild(e); });
            vals.forEach((riga, r) => riga.forEach((v, c) => {
              const tn = (o.toni || {})[r + ',' + c];
              const cella = sv('g', { class: 'sv-cella' + (tn ? ' tn-' + tn : '') });
              cella.append(sv('rect', { x: o.x + offX + c * cw, y: o.y + offY + r * ch, width: cw, height: ch }));
              const t = sv('text', { x: o.x + offX + c * cw + cw / 2, y: o.y + offY + r * ch + ch / 2 }); t.textContent = v ?? '';
              cella.appendChild(t); g.appendChild(cella);
            }));
            break;
          }
          case 'assi': {
            if (g.dataset.fatto) break;
            g.dataset.fatto = '1';
            const [bx, by, bw, bh] = o.box, [x0, x1, y0, y1] = o.dom;
            const X = x => bx + (x - x0) / (x1 - x0) * bw, Y = y => by + bh - (y - y0) / (y1 - y0) * bh;
            const [passoX, passoY] = Array.isArray(o.tacche) ? o.tacche : [o.tacche || 1, o.tacche || 1];
            if (o.griglia !== false) {
              for (let x = Math.ceil(x0 / passoX) * passoX; x <= x1 + 1e-9; x += passoX) g.appendChild(sv('line', { class: 'griglia', x1: X(x), y1: by, x2: X(x), y2: by + bh }));
              for (let y = Math.ceil(y0 / passoY) * passoY; y <= y1 + 1e-9; y += passoY) g.appendChild(sv('line', { class: 'griglia', x1: bx, y1: Y(y), x2: bx + bw, y2: Y(y) }));
            }
            const ax0 = Math.min(Math.max(0, y0), y1), ay0 = Math.min(Math.max(0, x0), x1);
            g.appendChild(sv('line', { x1: bx, y1: Y(ax0), x2: bx + bw, y2: Y(ax0) }));
            g.appendChild(sv('line', { x1: X(ay0), y1: by, x2: X(ay0), y2: by + bh }));
            if (o.numeri !== false) {
              for (let x = Math.ceil(x0 / passoX) * passoX; x <= x1 + 1e-9; x += passoX) if (Math.abs(x) > 1e-9) { const t = sv('text', { x: X(x), y: Y(ax0) + 12 }); t.textContent = +x.toFixed(2); g.appendChild(t); }
              for (let y = Math.ceil(y0 / passoY) * passoY; y <= y1 + 1e-9; y += passoY) if (Math.abs(y) > 1e-9) { const t = sv('text', { x: X(ay0) - 12, y: Y(y) }); t.textContent = +y.toFixed(2); g.appendChild(t); }
            }
            if (o.etX) { const t = sv('text', { x: bx + bw + 4, y: Y(ax0) - 10 }); t.textContent = o.etX; t.style.textAnchor = 'end'; g.appendChild(t); }
            if (o.etY) { const t = sv('text', { x: X(ay0) + 8, y: by - 6 }); t.textContent = o.etY; t.style.textAnchor = 'start'; g.appendChild(t); }
            break;
          }
        }
      }
    }

    // pannello laterale
    const testa = testataFoglio(figura, 'animazione', figura.dataset.titolo, true);
    const corpo = el('div', { class: 'scena-corpo' });
    const zonaSvg = el('div', { class: 'scena-svg puntinato' });
    zonaSvg.appendChild(svg);
    const lato = el('div', { class: 'scena-lato' });
    let pre = null, righeCod = [];
    if (def.codice) {
      righeCod = def.codice.testo.replace(/^\n/, '').replace(/\s+$/, '').split('\n');
      pre = el('pre', { class: 'scena-cod' });
      lato.appendChild(pre);
    }
    const nota = el('div', { class: 'scena-nota', 'aria-live': 'polite' });
    lato.appendChild(nota);
    corpo.append(zonaSvg, lato);
    const tutti = el('div', { class: 'scena-tutti' }, '<ol>' + passiDef.map((p, k) => `<li data-k="${k}">${p.nota || ''}</li>`).join('') + '</ol>');
    figura.append(testa);
    if (def.legenda) figura.appendChild(el('div', {}, legendaHtml(def.legenda)).firstChild);
    figura.append(corpo, tutti);

    let mostrato = JSON.parse(JSON.stringify(stati[0])), anim = null, chiusura = null;
    function vai(i) {
      const obiettivo = stati[i], partenza = mostrato;
      if (anim) cancelAnimationFrame(anim);
      clearTimeout(chiusura);
      const dur = RIDOTTO || document.hidden ? 0 : 480;
      // colori, testi e visibilità cambiano subito; solo le posizioni scorrono
      const interpola = e => {
        const inter = JSON.parse(JSON.stringify(obiettivo));
        for (const id in inter) for (const k of GEOM) {
          const a = partenza[id]?.[k], b = obiettivo[id][k];
          if (typeof a === 'number' && typeof b === 'number') inter[id][k] = a + (b - a) * e;
        }
        return inter;
      };
      disegna(dur ? interpola(0) : obiettivo);
      mostrato = JSON.parse(JSON.stringify(obiettivo));
      if (dur) {
        const t0 = performance.now();
        const passo = now => {
          const t = Math.min(1, (now - t0) / dur);
          disegna(interpola(t < .5 ? 2 * t * t : 1 - Math.pow(-2 * t + 2, 2) / 2));
          anim = t < 1 ? requestAnimationFrame(passo) : null;
        };
        anim = requestAnimationFrame(passo);
        // se il browser sospende le animazioni (scheda in background) arrivo comunque allo stato finale
        chiusura = setTimeout(() => { if (anim) { cancelAnimationFrame(anim); anim = null; } disegna(obiettivo); }, dur + 80);
      }
      const p = passiDef[i];
      nota.innerHTML = p.nota || '';
      nota.style.animation = 'none'; void nota.offsetWidth; nota.style.animation = '';
      if (pre) {
        const st = {};
        const r = (p.righe || []).map(n => n - 1);
        pre.classList.toggle('con-fuoco', r.length > 0);
        pre.innerHTML = righeCod.map((x, k) => `<span class="cod-riga${r.includes(k) ? ' fuoco' : ''}">${colora(x, def.codice.lang || 'pseudo', st) || ' '}</span>`).join('');
      }
      $$('li', tutti).forEach((li, k) => li.classList.toggle('qui', k === i));
    }
    disegna(stati[0]);
    const c = comandi(figura, passiDef.length, vai, i => 1700 + Math.min(4500, (passiDef[i].nota || '').replace(/<[^>]+>/g, '').length * 30));
    figura.appendChild(c.barra);
    const sw = $('input', testa);
    sw.addEventListener('change', () => { figura.classList.toggle('tutti', sw.checked); });
    tutti.addEventListener('click', e => { const li = e.target.closest('li'); if (li) c.vaiA(+li.dataset.k); });
    c.avvia();
  }

  /* ---------------------------------------------------------------------
     QUIZ
     <div class="domanda"><p class="q">…</p><div class="opzioni"><button>…</button><button data-giusta>…</button></div><div class="perche">…</div></div>
     --------------------------------------------------------------------- */
  function quiz(d) {
    const perche = $('.perche', d);
    if (perche) perche.hidden = true;
    $$('.opzioni button', d).forEach(b => {
      b.type = 'button';
      b.addEventListener('click', () => {
        const giusta = b.hasAttribute('data-giusta');
        b.classList.add(giusta ? 'giusta' : 'sbagliata');
        if (giusta) $$('.opzioni button', d).forEach(x => x.disabled = x !== b && !x.classList.contains('sbagliata') ? false : x.disabled);
        if (perche && giusta) perche.hidden = false;
        if (!giusta && perche && d.querySelectorAll('.sbagliata').length >= 2) {
          const g = $('.opzioni button[data-giusta]', d); if (g) g.classList.add('giusta'); perche.hidden = false;
        }
      });
    });
  }

  /* ---------------------------------------------------------------------
     HOME: calendario, scadenze, orario, conto alla rovescia, mappa degli argomenti
     --------------------------------------------------------------------- */
  const GIORNO = 86400000;
  const dataLocale = s => { const [a, m, g] = s.split('-').map(Number); return new Date(a, m - 1, g); };
  const piuGiorni = (d, n) => new Date(d.getFullYear(), d.getMonth(), d.getDate() + n);
  const oggiLocale = () => { const o = new Date(); o.setHours(0, 0, 0, 0); return o; };
  const fmt = (d, opz) => d.toLocaleDateString(LOCALE[LINGUA_UI], opz || { day: 'numeric', month: 'short' });

  function settimane(ul) {
    const oggi = oggiLocale();
    // SITO.lezioneDopo: giorni tra la data del calendario (il lunedì della settimana) e il giorno della lezione
    const dopo = SITO.lezioneDopo || 0;
    (SITO.calendario || []).forEach(s => {
      const da = dataLocale(s.da);
      const fine = piuGiorni(da, s.giorni || 7);
      let stato = 'poi', etichetta = tr('in arrivo');
      if (oggi >= fine) { stato = 'fatta'; etichetta = tr('fatta'); }
      else if (oggi >= da) { stato = 'adesso'; etichetta = tr('questa settimana'); }
      if (s.pausa) { stato += ' pausa'; etichetta = tr('pausa'); }
      if (s.esame) { etichetta = stato === 'fatta' ? tr('passato') : tr('esame'); }
      const giorno = (!s.etichetta && !s.pausa && !s.esame && !s.giorni) ? piuGiorni(da, dopo) : da;
      const titolo = s.h ? `<a href="${verso(s.h)}">${esc(tv(s.t))}</a>` : esc(tv(s.t));
      ul.appendChild(el('li', { class: stato }, `<span class="quando">${esc(tq(s.etichetta) || fmt(giorno, { weekday: 'short', day: 'numeric', month: 'short' }))}</span>` +
        `<span class="cosa">${titolo}${s.sub ? `<small>${s.sub}</small>` : ''}</span><span class="stato">${etichetta}</span>`));
    });
  }

  /* Lo stato interno resta in inglese per le classi CSS; qui solo l'etichetta mostrata. */
  const etichStato = s => { const m = /^tra (\d+) giorni$/.exec(s); return m ? tempo(m[1]) : tr(s); };

  /* Scadenze: consegne, test, sessioni orali, cose da fare. Nessuna spunta: lo stato è solo la data. */
  function rigaScadenza(t, oggi) {
    const d = dataLocale(t.data);
    let quando, stato;
    if (t.soloSettimana) {
      const fine = piuGiorni(d, 6);
      quando = `${tr('sett.')} ${t.soloSettimana}<small>${fmt(d)} – ${fmt(fine)}</small>`;
      stato = oggi > fine ? 'passata' : oggi >= d ? 'questa settimana' : `tra ${Math.round((d - oggi) / GIORNO)} giorni`;
    } else {
      const g = Math.round((d - oggi) / GIORNO);
      quando = `${esc(fmt(d, { weekday: 'short', day: 'numeric', month: 'short' }))}${t.ora ? `<small>${esc(t.ora)}</small>` : ''}`;
      stato = g < 0 ? 'passata' : g === 0 ? 'oggi' : g === 1 ? 'domani' : `tra ${g} giorni`;
    }
    const tag = (t.provvisoria ? `<em class="tag">${tr('da confermare')}</em>` : '') + (t.facoltativa ? `<em class="tag">${tr('facoltativo')}</em>` : '');
    const classi = [t.tipo || 'consegna', stato === 'passata' ? 'fatta' : stato === 'oggi' || stato === 'domani' ? 'urgente' : ''].join(' ').trim();
    return el('li', { class: classi }, `<span class="quando">${quando}</span>` +
      `<span class="cosa"><b>${esc(tv(t.t))}</b>${tag}${t.nota ? `<small>${t.nota}</small>` : ''}</span><span class="stato">${etichStato(stato)}</span>`);
  }

  function scadenze(ul) {
    const oggi = oggiLocale();
    const tutti = (SITO.task || []).slice().sort((a, b) => dataLocale(a.data) - dataLocale(b.data) || (a.ora || '99:99').localeCompare(b.ora || '99:99'));
    const fineTask = t => piuGiorni(dataLocale(t.data), t.soloSettimana ? 6 : 0);
    const prossime = tutti.filter(t => fineTask(t) >= oggi);
    const passate = tutti.filter(t => fineTask(t) < oggi);
    const max = Number(ul.dataset.max) || 6;
    prossime.slice(0, max).forEach(t => ul.appendChild(rigaScadenza(t, oggi)));
    if (!prossime.length) ul.appendChild(el('li', { class: 'vuota' }, tr('Nessuna scadenza in programma.')));
    const gruppo = (titolo, lista) => {
      if (!lista.length) return null;
      const det = el('details', { class: 'scadenze-resto' }, `<summary>${titolo} (${lista.length})</summary>`);
      const l = el('ul', { class: 'scadenze' });
      lista.forEach(t => l.appendChild(rigaScadenza(t, oggi)));
      det.appendChild(l);
      return det;
    };
    ul.after(...[gruppo(tr('Altre scadenze'), prossime.slice(max)), gruppo(tr('Già passate'), passate.reverse())].filter(Boolean));
  }

  /* Orario della settimana: giorno, ora e aula di lezioni ed esercizi. */
  function orario(box) {
    const righe = (SITO.orario || []).map(o => `<tr><th scope="row">${esc(o.giorno)}</th><td>${o.quando}</td><td>${o.nota || ''}</td></tr>`).join('');
    box.innerHTML = righe
      ? `<div class="tab-wrap"><table class="tab"><thead><tr><th>${tr('giorno')}</th><th>${tr('quando e dove')}</th><th>${tr('note')}</th></tr></thead><tbody>${righe}</tbody></table></div>`
      : '';
  }

  /* Punti ancora da confermare con la documentazione ufficiale. */
  function daConfermare(ul) {
    const voci = SITO.daConfermare || [];
    if (!voci.length) { const sezione = ul.closest('section'); if (sezione) sezione.remove(); return; }
    voci.forEach(x => ul.appendChild(el('li', {}, x)));
  }

  function conto(box) {
    const e = SITO.esame; if (!e) return;
    const quando = new Date(e.data);
    const oggi = new Date(); oggi.setHours(0, 0, 0, 0);
    const giorno = new Date(quando); giorno.setHours(0, 0, 0, 0);
    const g = Math.round((giorno - oggi) / GIORNO);
    const quandoTxt = quando.toLocaleDateString(LOCALE[LINGUA_UI], { weekday: 'long', day: 'numeric', month: 'long', year: 'numeric' });
    const etich = tv(e.etichetta);
    box.innerHTML = g > 0
      ? `<span class="n">${g}</span><span class="d">${tr("giorni all'esame — ")}${esc(etich)}, ${quandoTxt}${e.ora ? ', ' + esc(e.ora) : ''}</span>`
      : g === 0 ? `<span class="n">${tr('Oggi')}</span><span class="d">${esc(etich)}${e.ora ? ', ' + esc(e.ora) : ''}. ${tr('In bocca al lupo.')}</span>`
        : `<span class="d">${tr("L'esame ordinario (")}${quandoTxt}${tr(') è passato.')}</span>`;
  }

  function mappa(box) {
    const capiti = archivio.leggi('capiti', []);
    const sezione = box.dataset.sezione;
    let dentro = !sezione;
    for (const v of SITO.menu) {
      if (v.sez) { dentro = !sezione || v.sez === sezione; continue; }
      if (!dentro || !v.g) continue;
      const pagine = [];
      (function raccogli(vv) { for (const x of vv || []) { if (x.g) raccogli(x.figli); else pagine.push(x); } })(v.figli);
      const pronte = pagine.filter(p => p.h);
      const primo = pronte[0];
      const fatte = pronte.filter(p => capiti.includes(p.h)).length;
      const nomi = pagine.map(p => tv(p.t)).join(' · ');
      box.appendChild(el(primo ? 'a' : 'div', { href: primo ? verso(primo.h) : null, class: primo ? null : 'arriva-carta' },
        `<small>${esc(tq(v.quando || ''))}${pronte.length ? ` · ${fatte}/${pronte.length} ${tr('capite')}` : ` · ${tr('in arrivo')}`}</small><b>${esc(tv(v.g))}</b><span>${esc(nomi)}</span>`));
    }
  }

  /* ---------------------------------------------------------------------
     Avvio
     --------------------------------------------------------------------- */
  async function avvia() {
    // Se la pagina non è nella lingua scelta (o è in en/ e si è scelto IT), si va alla copia giusta prima di montare il guscio
    const giusta = verso(qui);
    if (giusta !== location.href.split('#')[0].split('?')[0]) { location.replace(giusta + location.hash); return; }
    await sincronizzaCapiti();
    guscio();
    testata();
    $$('figure.passi').forEach(passi);
    $$('figure.codice').forEach(codice);
    $$('figure.scena').forEach(scena);
    preSemplici();
    $$('.domanda').forEach(quiz);
    $$('.settimane[data-auto]').forEach(settimane);
    $$('.scadenze[data-auto]').forEach(scadenze);
    $$('.orario[data-auto]').forEach(orario);
    $$('.da-confermare[data-auto]').forEach(daConfermare);
    $$('.conto[data-auto]').forEach(conto);
    $$('.mappa[data-auto]').forEach(mappa);
    if (location.hash) { const t = document.getElementById(decodeURIComponent(location.hash.slice(1))); if (t) t.scrollIntoView(); }
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', avvia); else avvia();
})();
