/* Controllo automatico delle scene (strumento di lavoro, non fa parte dei siti).
   Uso dalla console di http://localhost:8766/ :
     await caricaControllo(); await __prova2(['Atlante%20Machine%20Learning/teoria/w01-cos-e-ml'])
   Per ogni scena scorre tutti i passi e segnala testi fuori dal disegno o sovrapposti. */
window.__controllaScene = async function (d) {
  const rapporti = [];
  for (const [si, s] of [...d.querySelectorAll('figure.scena')].entries()) {
    const svg = s.querySelector('svg');
    if (!svg) { rapporti.push(`scena ${si} (${s.dataset.scena}): nessun svg`); continue; }
    const vb = svg.viewBox.baseVal;
    const b = [...s.querySelectorAll('.comandi button')];
    const indietro = b.find(x => /indietro|←/i.test(x.textContent));
    const avanti = b.find(x => /avanti/i.test(x.textContent));
    for (let k = 0; k < 60 && indietro && !indietro.disabled; k++) indietro.click();
    let passo = 0;
    while (true) {
      await new Promise(r => setTimeout(r, 520));
      const testi = [...svg.querySelectorAll('text')].filter(t => t.textContent.trim() && !t.closest('.sv-nascosto'));
      const box = testi.map(t => ({ t: t.textContent.trim(), b: t.getBBox() }));
      for (const x of box)
        if (x.b.x < vb.x - 2 || x.b.y < vb.y - 2 || x.b.x + x.b.width > vb.x + vb.width + 2 || x.b.y + x.b.height > vb.y + vb.height + 2)
          rapporti.push(`${s.dataset.scena} passo ${passo}: "${x.t}" esce dal disegno`);
      for (let i = 0; i < box.length; i++) for (let j = i + 1; j < box.length; j++) {
        const a = box[i].b, c = box[j].b;
        const ox = Math.min(a.x + a.width, c.x + c.width) - Math.max(a.x, c.x), oy = Math.min(a.y + a.height, c.y + c.height) - Math.max(a.y, c.y);
        if (ox > 3 && oy > 3) rapporti.push(`${s.dataset.scena} passo ${passo}: "${box[i].t}" sopra "${box[j].t}"`);
      }
      if (!avanti || avanti.disabled) break;
      avanti.click(); passo++;
      if (passo > 60) break;
    }
  }
  return [...new Set(rapporti)];
};
window.__prova2 = async function (lista) {
  const out = [];
  for (const p of lista) {
    const f = document.createElement('iframe');
    f.style.cssText = 'position:fixed;left:0;top:0;width:1200px;height:900px;opacity:0.01;pointer-events:none';
    const pronto = new Promise(res => f.onload = res);
    f.src = '/' + p + '.html';
    document.body.appendChild(f);
    await pronto;
    await new Promise(r => setTimeout(r, 300));
    const d = f.contentDocument;
    d.querySelectorAll('details').forEach(x => x.open = true);
    await new Promise(r => setTimeout(r, 200));
    const sez = [...d.querySelectorAll('main section')];
    const senza = sez.filter(x => !x.querySelector('figure.scena, figure.interleaving')).map(x => (x.querySelector('h2') || {}).textContent);
    const nscene = d.querySelectorAll('figure.scena').length;
    const errori = [...d.querySelectorAll('figure.scena')].filter(s => /non trovata/.test(s.textContent)).map(s => s.dataset.scena);
    const r = await window.__controllaScene(d);
    const sito = typeof f.contentWindow.SITO === 'object' ? '' : ' MENU ROTTO (sito.js)!';
    out.push(p.split('/').pop() + sito + ` [${sez.length} sezioni, ${nscene} scene, non trovate: ${errori.join(',') || 0}, sezioni senza scena: ${senza.length ? senza.join(' / ') : 0}]: ` + (r.length ? r.slice(0, 16).join(' | ') : 'ok'));
    f.remove();
  }
  return out.join('\n');
};
