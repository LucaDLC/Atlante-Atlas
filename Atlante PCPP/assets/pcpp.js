/* ==========================================================================
   Atlante PCPP — componente specifico: il costruttore di interleaving
   Uso in pagina:
     <link rel="stylesheet" href="../assets/pcpp.css">
     <script src="../assets/pcpp.js" defer></script>
     <figure class="interleaving" data-prog="nome" data-titolo="…"></figure>
     <script>
     (window.PROGRAMMI = window.PROGRAMMI || {}).nome = {
       memoria: { counter: 0 },                  // variabili condivise
       thread: ['t1', 't2'],                     // stessi passi per tutti…
       locali: { temp: 0 },                      // …con variabili locali separate
       passi: [
         { n: 1, codice: 'int temp = counter;', fai: (m, l) => { l.temp = m.counter; } },
         { n: 2, codice: 'counter = temp + 1;', fai: (m, l) => { m.counter = l.temp + 1; } }
       ],
       // oppure thread con passi diversi:
       // thread: [{ nome: 't1', locali: {}, passi: [...] }, { nome: 't2', ... }]
       // passi di lock:  { n: 1, codice: 'l.lock();', lock: 'l' }  /  { n: 4, codice: 'l.unlock();', unlock: 'l' }
       esito: m => 'counter = ' + m.counter,     // testo del risultato finale
       giusto: m => m.counter === 2              // facoltativo: colora gli esiti
     };
     </script>
   ========================================================================== */
(function () {
  'use strict';
  const $ = (s, el = document) => el.querySelector(s);
  const esc = s => String(s).replace(/[&<>"]/g, c => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]));
  const clona = o => JSON.parse(JSON.stringify(o));
  const val = x => Array.isArray(x) ? '[' + x.join(', ') + ']' : x;   // liste mostrate come [1, 2]

  function normalizza(P) {
    const thread = P.thread.map(t => typeof t === 'string'
      ? { nome: t, locali: clona(P.locali || {}), passi: P.passi }
      : { nome: t.nome, locali: clona(t.locali || {}), passi: t.passi });
    return { ...P, thread };
  }

  function statoIniziale(P) {
    return {
      m: clona(P.memoria || {}),
      l: P.thread.map(t => clona(t.locali)),
      pc: P.thread.map(() => 0),
      lock: {},
      traccia: []
    };
  }

  // perché il prossimo passo del thread k non si può eseguire (null = si può)
  function bloccato(P, S, k) {
    const t = P.thread[k];
    if (S.pc[k] >= t.passi.length) return 'ha finito';
    const p = t.passi[S.pc[k]];
    if (p.lock) {
      const L = S.lock[p.lock];
      if (L && L.owner !== k && L.count > 0) return `bloccato: ${p.lock} è di ${P.thread[L.owner].nome}`;
    }
    return null;
  }

  function esegui(P, S, k) {
    const t = P.thread[k], p = t.passi[S.pc[k]];
    const primaM = clona(S.m), primaL = clona(S.l[k]);
    if (p.lock) {
      const L = S.lock[p.lock] || (S.lock[p.lock] = { owner: k, count: 0 });
      L.owner = k; L.count++;
    }
    if (p.unlock) {
      const L = S.lock[p.unlock];
      if (L) { L.count--; if (L.count <= 0) delete S.lock[p.unlock]; }
    }
    if (p.fai) p.fai(S.m, S.l[k]);
    S.pc[k]++;
    const effetti = [];
    for (const v in S.m) if (JSON.stringify(S.m[v]) !== JSON.stringify(primaM[v])) effetti.push(`${v} = ${val(S.m[v])}`);
    for (const v in S.l[k]) if (JSON.stringify(S.l[k][v]) !== JSON.stringify(primaL[v])) effetti.push(`${v}<sub>${t.nome}</sub> = ${val(S.l[k][v])}`);
    if (p.lock) effetti.push(`prende ${p.lock}`);
    if (p.unlock) effetti.push(`rilascia ${p.unlock}`);
    if (p.effetto) effetti.push(p.effetto(S.m, S.l[k]));
    S.traccia.push({ k, n: p.n, codice: p.codice, effetto: effetti.join(', ') || '—', m: clona(S.m) });
  }

  const finito = (P, S) => S.pc.every((pc, k) => pc >= P.thread[k].passi.length);

  // tutti gli interleaving: conta per esito
  function enumera(P, limite = 200000) {
    const esiti = {};
    let totale = 0, troncato = false;
    const giro = S => {
      if (troncato) return;
      if (finito(P, S)) {
        totale++;
        const e = P.esito ? P.esito(S.m) : JSON.stringify(S.m);
        esiti[e] = esiti[e] || { n: 0, giusto: P.giusto ? P.giusto(S.m) : null, esempio: S.traccia.map(x => `${P.thread[x.k].nome}(${x.n})`).join(', ') };
        esiti[e].n++;
        if (totale >= limite) troncato = true;
        return;
      }
      let mosse = 0;
      P.thread.forEach((_, k) => {
        if (bloccato(P, S, k)) return;
        mosse++;
        const S2 = { m: clona(S.m), l: clona(S.l), pc: S.pc.slice(), lock: clona(S.lock), traccia: S.traccia.slice() };
        esegui(P, S2, k);
        giro(S2);
      });
      if (mosse === 0 && !finito(P, S)) {
        totale++;
        const e = 'deadlock';
        esiti[e] = esiti[e] || { n: 0, giusto: false, esempio: S.traccia.map(x => `${P.thread[x.k].nome}(${x.n})`).join(', ') };
        esiti[e].n++;
      }
    };
    giro(statoIniziale(P));
    return { totale, esiti, troncato };
  }

  function costruisci(fig) {
    const grezzo = (window.PROGRAMMI || {})[fig.dataset.prog];
    if (!grezzo) { fig.innerHTML = `<p class="piccolo">Programma «${esc(fig.dataset.prog)}» non trovato.</p>`; return; }
    const P = normalizza(grezzo);
    fig.classList.add('foglio', 'il');
    fig.innerHTML = `
      <div class="foglio-testa"><span class="tipo">costruisci un interleaving</span><span class="tit">${fig.dataset.titolo || ''}</span></div>
      <div class="il-corpo">
        <div class="il-thread"></div>
        <div class="il-memoria"></div>
      </div>
      <div class="il-seq" aria-live="polite"></div>
      <div class="comandi">
        <button class="btn" type="button" data-az="annulla">← Annulla</button>
        <button class="btn" type="button" data-az="reset">↺ Da capo</button>
        <button class="btn leggero" type="button" data-az="caso">Completa a caso</button>
        <span class="contatore il-stato"></span>
      </div>
      <details class="il-extra"><summary>Traccia passo per passo</summary><div class="tab-wrap"><table class="tab il-traccia"></table></div></details>
      <details class="il-extra"><summary>Prova una sequenza (è possibile?)</summary>
        <div class="il-prova"><input type="text" spellcheck="false" placeholder="t1(1), t2(1), t1(2), t2(2)"><button class="btn" type="button" data-az="prova">Controlla</button></div>
        <div class="il-prova-esito"></div>
      </details>
      <details class="il-extra"><summary>Tutti gli interleaving possibili</summary><div class="il-tutti"></div></details>`;

    let S = statoIniziale(P);
    const storia = [];

    const disegna = () => {
      $('.il-thread', fig).innerHTML = P.thread.map((t, k) => {
        const motivo = bloccato(P, S, k);
        const prossimo = t.passi[S.pc[k]];
        return `<div class="il-col" data-k="${k}">
          <div class="il-nome t-${k === 0 ? 'dato' : k === 1 ? 'due' : 'ora'}">${esc(t.nome)}</div>
          <ol class="il-passi">${t.passi.map((p, i) => `<li class="${i < S.pc[k] ? 'fatto' : i === S.pc[k] ? 'prossimo' : ''}"><span class="il-n">(${esc(p.n)})</span><code>${esc(p.codice)}</code></li>`).join('')}</ol>
          <button class="btn ${motivo ? '' : 'primario'}" type="button" data-k="${k}" ${motivo ? 'disabled' : ''}>${motivo ? esc(motivo) : `esegui ${esc(t.nome)}(${esc(prossimo.n)})`}</button>
        </div>`;
      }).join('');
      const locks = Object.entries(S.lock);
      $('.il-memoria', fig).innerHTML = `<div class="il-tit">memoria condivisa</div>` +
        Object.entries(S.m).map(([v, x]) => `<div class="il-var"><span>${esc(v)}</span><b>${esc(val(x))}</b></div>`).join('') +
        (P.thread.some(t => Object.keys(t.locali).length) ? `<div class="il-tit">variabili locali</div>` +
          P.thread.map((t, k) => Object.entries(S.l[k]).map(([v, x]) => `<div class="il-var"><span>${esc(v)}<sub>${esc(t.nome)}</sub></span><b>${esc(val(x))}</b></div>`).join('')).join('') : '') +
        (JSON.stringify(P.thread.map(t => t.passi)).includes('"lock"') ? `<div class="il-tit">lock</div>` +
          (locks.length ? locks.map(([n, L]) => `<div class="il-var tenuto"><span>${esc(n)}</span><b>di ${esc(P.thread[L.owner].nome)}</b></div>`).join('') : `<div class="il-var"><span>tutti</span><b>liberi</b></div>`) : '');
      const seq = S.traccia.map(x => `<span class="t-${x.k === 0 ? 'dato' : x.k === 1 ? 'due' : 'ora'}">${esc(P.thread[x.k].nome)}(${esc(x.n)})</span>`).join(', ');
      let fine = '';
      if (finito(P, S)) {
        const e = P.esito ? P.esito(S.m) : '';
        const ok = P.giusto ? P.giusto(S.m) : null;
        fine = `<div class="il-esito ${ok === true ? 'ok' : ok === false ? 'no' : ''}">Fine: <b>${esc(e)}</b>${ok === false ? ' — risultato sbagliato' : ok === true ? ' — risultato corretto' : ''}</div>`;
      } else if (P.thread.every((_, k) => bloccato(P, S, k))) {
        fine = `<div class="il-esito no">Nessun thread può avanzare: <b>deadlock</b></div>`;
      }
      $('.il-seq', fig).innerHTML = (seq ? `<code class="il-stringa">${seq}</code>` : `<span class="piccolo">Premi un pulsante "esegui" per scegliere quale thread va avanti. Sei tu lo scheduler.</span>`) + fine;
      $('.il-stato', fig).textContent = `${S.traccia.length} / ${P.thread.reduce((a, t) => a + t.passi.length, 0)} azioni`;
      $('[data-az="annulla"]', fig).disabled = storia.length === 0;
      $('.il-traccia', fig).innerHTML = `<thead><tr><th>#</th><th>azione</th><th>codice</th><th>effetto</th></tr></thead><tbody>` +
        (S.traccia.length ? S.traccia.map((x, i) => `<tr><td>${i + 1}</td><td class="t-${x.k === 0 ? 'dato' : x.k === 1 ? 'due' : 'ora'}">${esc(P.thread[x.k].nome)}(${esc(x.n)})</td><td><code>${esc(x.codice)}</code></td><td>${x.effetto}</td></tr>`).join('') : `<tr><td colspan="4" class="piccolo">ancora nessuna azione</td></tr>`) + `</tbody>`;
    };

    fig.addEventListener('click', e => {
      const b = e.target.closest('button');
      if (!b) return;
      if (b.dataset.k !== undefined && !b.disabled) { storia.push(clona(S)); esegui(P, S, +b.dataset.k); disegna(); return; }
      const az = b.dataset.az;
      if (az === 'annulla' && storia.length) { S = storia.pop(); disegna(); }
      if (az === 'reset') { storia.length = 0; S = statoIniziale(P); disegna(); }
      if (az === 'caso') {
        while (!finito(P, S)) {
          const liberi = P.thread.map((_, k) => k).filter(k => !bloccato(P, S, k));
          if (!liberi.length) break;
          storia.push(clona(S));
          esegui(P, S, liberi[Math.floor(Math.random() * liberi.length)]);
        }
        disegna();
      }
      if (az === 'prova') prova();
    });
    $('.il-prova input', fig).addEventListener('keydown', e => { if (e.key === 'Enter') prova(); });

    function prova() {
      const testo = $('.il-prova input', fig).value;
      const out = $('.il-prova-esito', fig);
      const pezzi = [...testo.matchAll(/([A-Za-z]\w*)\s*\(\s*([^)]+?)\s*\)/g)];
      if (!pezzi.length) { out.innerHTML = `<p class="piccolo">Scrivi azioni nella forma <code>t1(1), t2(1), …</code></p>`; return; }
      const T = statoIniziale(P);
      for (let i = 0; i < pezzi.length; i++) {
        const [, nome, n] = pezzi[i];
        const k = P.thread.findIndex(t => t.nome === nome);
        if (k < 0) { out.innerHTML = `<div class="il-esito no">Azione ${i + 1}: il thread <b>${esc(nome)}</b> non esiste.</div>`; return; }
        const atteso = P.thread[k].passi[T.pc[k]];
        if (!atteso) { out.innerHTML = `<div class="il-esito no">Azione ${i + 1}, <b>${esc(nome)}(${esc(n)})</b>: ${esc(nome)} ha già eseguito tutti i suoi passi.</div>`; return; }
        if (String(atteso.n) !== n) { out.innerHTML = `<div class="il-esito no">Azione ${i + 1}, <b>${esc(nome)}(${esc(n)})</b>: <b>impossibile</b>. Per il <i>program order</i> il prossimo passo di ${esc(nome)} è (${esc(atteso.n)}).</div>`; return; }
        const motivo = bloccato(P, T, k);
        if (motivo) { out.innerHTML = `<div class="il-esito no">Azione ${i + 1}, <b>${esc(nome)}(${esc(n)})</b>: <b>impossibile</b>, ${esc(nome)} è ${esc(motivo)}.</div>`; return; }
        esegui(P, T, k);
      }
      const completo = finito(P, T);
      out.innerHTML = `<div class="il-esito ok"><b>Possibile.</b> ${completo ? `Esecuzione completa: ${esc(P.esito ? P.esito(T.m) : '')}.` : `È un prefisso valido (mancano ${P.thread.reduce((a, t, k) => a + t.passi.length - T.pc[k], 0)} azioni).`}</div>`;
    }

    // enumerazione (calcolata quando si apre il pannello)
    const tutti = $('.il-tutti', fig);
    $('.il-tutti', fig).closest('details').addEventListener('toggle', function () {
      if (!this.open || tutti.dataset.fatto) return;
      const r = enumera(P);
      tutti.dataset.fatto = '1';
      const righe = Object.entries(r.esiti).sort((a, b) => b[1].n - a[1].n);
      tutti.innerHTML = `<p><b>${r.totale}</b> interleaving ${r.troncato ? '(conteggio interrotto)' : 'possibili'}.</p>
        <div class="tab-wrap"><table class="tab"><thead><tr><th>esito</th><th>quanti</th><th>un esempio</th></tr></thead><tbody>` +
        righe.map(([e, x]) => `<tr><td class="${x.giusto === true ? 't-ok' : x.giusto === false ? 't-no' : ''}">${esc(e)}</td><td>${x.n}</td><td><code>${esc(x.esempio)}</code></td></tr>`).join('') +
        `</tbody></table></div>`;
    });

    disegna();
  }

  function avvia() { document.querySelectorAll('figure.interleaving').forEach(costruisci); }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', avvia); else avvia();
})();
