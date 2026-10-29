# -*- coding: utf-8 -*-
"""Genera gli indici di lezione dell'Atlante PCPP."""
import pathlib, json, sys

HUB_URL = "https://claude.ai/code/artifact/28d55e87-8c70-4b36-8dac-532818fc0088"   # riempito al secondo giro, dopo la pubblicazione dell'hub

A = "https://claude.ai/code/artifact/"

LECTURES = [
  dict(
    n=1, slug="l1-index",
    title="Lezione 1 · Concorrenza e Mutua Esclusione",
    orig="Intro to Concurrency and Mutual Exclusion",
    fav="1️⃣",
    accent=("#3F51A8", "#8093E8"),
    lede="Da dove nasce tutto: due thread che incrementano lo stesso contatore e ne perdono metà. "
         "Atomicità, non-determinismo dello scheduler, interleaving, e la prima cura — il lock.",
    pages=[
      dict(t="Interleaving e Lost Update", u=A+"51f3e189-e762-4545-85f1-ea7ae22f5994", i="🎢",
           d="Costruisci gli interleaving di <span class='mono'>counter++</span> passo per passo e guarda un aggiornamento sparire. Tutti i 6 casi enumerati, 4 dei quali sbagliati.",
           k=["atomicità","interleaving","race condition","data race"]),
      dict(t="Mutua Esclusione e Lock", u=A+"93b4e141-97f6-474e-b6b9-b3e9dde5772d", i="🔒",
           d="Gli stessi thread con <span class='mono'>lock()</span> e <span class='mono'>unlock()</span>: da 70 interleaving possibili a 2. Più un quiz sulle domande &ldquo;questo interleaving è possibile?&rdquo;.",
           k=["sezione critica","lock/unlock","deadlock","starvation"]),
      dict(t="Stati del Thread e Scheduler", u=A+"8eb9c0fc-206a-40b6-9086-902025fe8fed", i="🚦",
           d="La macchina a stati <span class='mono'>enabled → running → blocked</span>, cliccabile, e un generatore di esecuzioni che mostra il non-determinismo dello scheduler.",
           k=["stati del thread","scheduler","non-determinismo"]),
    ],
    agenda=[
      ("Introduzione alla concorrenza", "sequenziale, parallelo, concorrente; le tre motivazioni: exploitation, hidden, inherent", None),
      ("Thread in Java", "<span class='mono'>extends Thread</span>, <span class='mono'>Runnable</span>, lambda; <span class='mono'>start()</span> e <span class='mono'>join()</span>", None),
      ("Atomicità e interleaving", "perché <span class='mono'>counter++</span> non è atomico", 0),
      ("Stati del thread e non-determinismo", "cosa decide lo scheduler e cosa no", 2),
      ("Race condition e data race", "due nozioni diverse che spesso coincidono", 0),
      ("Il problema della mutua esclusione", "le tre proprietà di Dijkstra", 1),
      ("Lock in Java", "<span class='mono'>java.util.concurrent.locks</span>", 1),
    ],
    key=[
      ("atomico", "eseguito come una singola operazione indivisibile. Una riga sola di codice <b>non</b> è per questo atomica."),
      ("interleaving", "una possibile sequenza di operazioni <b>del programma concorrente</b>, non di un thread. Notazione: <span class='mono'>t1(1), t2(1), t1(2), …</span>"),
      ("race condition", "il risultato del programma dipende dall&rsquo;interleaving."),
      ("data race", "due thread accedono alla stessa locazione e almeno uno scrive."),
      ("sezione critica", "la parte di programma dove l&rsquo;accesso concorrente va limitato."),
      ("mutua esclusione", "al più un thread esegue la sezione critica alla volta."),
    ],
  ),
  dict(
    n=2, slug="l2-index",
    title="Lezione 2 · Shared Memory I",
    orig="Shared Memory I",
    fav="2️⃣",
    accent=("#1F7A4D", "#3FBF7F"),
    lede="Il lock da solo è troppo grosso. I monitor aggiungono le variabili condizione, che portano due code, "
         "la semantica Mesa e la starvation. Poi il livello sotto: cache, flush e riordino delle istruzioni.",
    pages=[
      dict(t="Monitor Readers-Writers", u=A+"9a5d08f9-bedb-49d0-84d8-985ddf297de9", i="📖",
           d="Fai girare lettori e scrittori fra entry queue, condition queue e sezione critica. Poi attiva la versione fair e guarda la starvation sparire.",
           k=["monitor","condition variable","readers-writers","fairness"]),
      dict(t="Code, Signal e Semantica Mesa", u=A+"43ca423c-d471-424c-acf0-60e8fd9f4b13", i="🚪",
           d="<span class='mono'>await</span>, <span class='mono'>signal</span>, <span class='mono'>signalAll</span> su due code, Mesa contro Hoare, perché la guardia è un <span class='mono'>while</span>, e un quiz su quale lock usa <span class='mono'>synchronized</span>.",
           k=["entry queue","condition queue","Mesa","spurious wakeup","synchronized"]),
      dict(t="Visibility, Reordering e volatile", u=A+"f8abd0d8-05a7-4abe-9d90-e8635e725066", i="👁️",
           d="Il diagramma di cache che spiega perché una scrittura non arriva mai, e il confronto fra le tre varianti di <span class='mono'>PossibleReordering</span>: quali output sopravvivono a ciascuna.",
           k=["visibility","reordering","volatile","cache flush"]),
    ],
    agenda=[
      ("Il problema Readers-Writers", "molti lettori insieme, uno scrittore alla volta", 0),
      ("Monitor", "stato interno, metodi mutuamente esclusivi, variabili condizione", 0),
      ("Variabili condizione", "<span class='mono'>await()</span>, <span class='mono'>signal()</span>, <span class='mono'>signalAll()</span>", 1),
      ("Fairness e starvation", "perché gli scrittori muoiono di fame, e come rimediare", 0),
      ("Busy-wait", "l&rsquo;alternativa da non usare: il thread non passa in <span class='mono'>blocked</span> e brucia CPU", None),
      ("Lock intrinseci · synchronized", "<span class='mono'>wait</span>/<span class='mono'>notify</span>/<span class='mono'>notifyAll</span>, lock di istanza contro lock di classe", 1),
      ("Visibility", "cache coherence e flush verso la memoria condivisa", 2),
      ("Reordering", "JIT e CPU riordinano in assenza di dipendenze", 2),
      ("volatile", "sincronizzazione debole: visibility e ordine, ma non mutua esclusione", 2),
    ],
    key=[
      ("monitor", "stato condiviso più operazioni che lo proteggono dalla corruzione anche se eseguite concorrentemente. In Java si realizza come classe."),
      ("condition variable", "coda dove il monitor mette i thread ad aspettare. Da non confondere con la condizione di un <span class='mono'>if</span> o di un <span class='mono'>while</span>."),
      ("entry queue", "thread che aspettano il lock per entrare nel monitor."),
      ("semantica Mesa", "i thread svegliati tornano a competere nella entry queue. È quella di Java — per questo la guardia è un <span class='mono'>while</span>."),
      ("fairness", "in questo corso significa <b>assenza di starvation</b>, non ordine FIFO."),
      ("visibility", "se e quando la scrittura di un thread diventa osservabile da un altro."),
      ("volatile", "garantisce visibility e impedisce il reordering. <b>Non</b> garantisce mutua esclusione."),
    ],
  ),
  dict(
    n=3, slug="l3-index",
    title="Lezione 3 · Java Memory Model",
    orig="Java Memory Model",
    fav="3️⃣",
    accent=("#0C737C", "#2FB4BC"),
    lede="La formalizzazione. Cosa sarebbe stato &ldquo;normale&rdquo; (sequential consistency), perché non possiamo "
         "sempre averlo, e il contratto preciso che Java offre in cambio: se non hai data race, ragiona pure per interleaving.",
    pages=[
      dict(t="Azioni e Sequential Consistency", u=A+"f91f8e01-27ac-4037-b5fa-aa0d2c89d230", i="⚖️",
           d="Enumera i sei interleaving sequenzialmente consistenti e verifica che <span class='mono'>(0,0)</span> non compaia mai. Poi classifica le azioni <span class='mono'>t(o)</span> nei tre tipi.",
           k=["sequential consistency","azioni t(o)","memory model"]),
      dict(t="Grafo Happens-Before", u=A+"fe6f94fc-b52c-4e3f-aeea-bc56ce185028", i="🧵",
           d="Clicca due azioni e scopri se sono ordinate o in data race, con il cammino evidenziato. Attiva <span class='mono'>volatile</span> e guarda <span class='mono'>(0,0)</span> diventare impossibile.",
           k=["happens-before","program order","synchronizes-with","data race"]),
    ],
    agenda=[
      ("Perché serve un memory model", "hardware diverso, ottimizzazioni, risultati paradossali", 0),
      ("Sequential consistency", "cosa il programmatore considera comportamento normale", 0),
      ("Definizioni di base · azioni", "la coppia <span class='mono'>t(o)</span> e i tre tipi di azione", 0),
      ("Happens-before", "program order, synchronizes-with, e la chiusura transitiva", 1),
      ("Correttezza nel memory model", "data-race-free implica sequential consistency", 1),
      ("Visibility e volatile nel modello", "gli accessi volatile come synchronization action", 1),
    ],
    key=[
      ("sequential consistency", "preserva il program order intra-thread e le operazioni appaiono avvenire istantaneamente, in un ordine totale visto da tutti."),
      ("memory model", "regole a livello di linguaggio che determinano quali esecuzioni di un programma sono valide, su qualunque hardware."),
      ("azione", "coppia <span class='mono'>t(o)</span>: il thread che esegue e l&rsquo;operazione eseguita. Un evento di esecuzione, non una riga di codice."),
      ("program order", "ordine totale delle azioni <b>dentro un singolo thread</b>. Non dice nulla fra thread diversi."),
      ("synchronizes-with", "lista chiusa di regole che creano archi fra thread diversi: <span class='mono'>start</span>, <span class='mono'>join</span>, lock/unlock, accessi volatile."),
      ("happens-before", "chiusura transitiva di program order ∪ synchronizes-with. Non è ordine temporale: è <b>garanzia di visibilità</b>."),
    ],
  ),
]

CSS = """
:root{--accent:%s}
@media (prefers-color-scheme: dark){:root:not([data-theme="light"]){--accent:%s}}
:root[data-theme="dark"]{--accent:%s}

.cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(290px,1fr));gap:16px}
.card{display:flex;flex-direction:column;gap:10px;padding:20px;background:var(--surface);
  border:1px solid var(--line);border-radius:11px;box-shadow:var(--shadow);text-decoration:none;
  color:inherit;transition:border-color .18s,transform .18s}
.card:hover{border-color:var(--accent);transform:translateY(-2px)}
.card:focus-visible{outline:2px solid var(--focus);outline-offset:3px}
.card .ic{font-size:22px;line-height:1}
.card h3{margin:0;font-family:"IBM Plex Mono",monospace;font-size:15px;font-weight:600;color:var(--ink);letter-spacing:-.01em}
.card p{margin:0;font-size:13.3px;color:var(--ink-2);line-height:1.55;flex:1}
.card .tags{display:flex;flex-wrap:wrap;gap:6px;margin-top:2px}
.card .tags span{font-family:"IBM Plex Mono",monospace;font-size:10.5px;padding:3px 8px;border-radius:4px;
  background:var(--surface-2);border:1px solid var(--line-soft);color:var(--ink-3)}
.card .go{font-family:"IBM Plex Mono",monospace;font-size:11.5px;font-weight:600;color:var(--accent);
  letter-spacing:.04em;margin-top:2px}

.agenda{display:flex;flex-direction:column;gap:0}
.agenda .row{display:grid;grid-template-columns:auto minmax(0,1fr) auto;gap:16px;padding:14px 0;
  border-bottom:1px solid var(--line-soft);align-items:baseline}
.agenda .row:last-child{border-bottom:none}
.agenda .n{font-family:"IBM Plex Mono",monospace;font-size:11px;font-weight:600;color:var(--ink-3);letter-spacing:.06em}
.agenda .t{font-size:14px;color:var(--ink);font-weight:500}
.agenda .d{font-size:12.8px;color:var(--ink-2);margin-top:2px;line-height:1.5}
.agenda a{font-family:"IBM Plex Mono",monospace;font-size:11px;font-weight:600;color:var(--accent);
  text-decoration:none;white-space:nowrap;border:1px solid var(--accent);border-radius:5px;padding:4px 9px}
.agenda a:hover{background:var(--accent);color:var(--surface)}
.agenda .none{font-family:"IBM Plex Mono",monospace;font-size:10.5px;color:var(--ink-3);white-space:nowrap}

.gloss{display:flex;flex-direction:column;gap:0}
.gloss .g{display:grid;grid-template-columns:minmax(150px,auto) 1fr;gap:18px;padding:13px 0;
  border-bottom:1px solid var(--line-soft);align-items:baseline}
.gloss .g:last-child{border-bottom:none}
.gloss dt{font-family:"IBM Plex Mono",monospace;font-size:12.8px;font-weight:600;color:var(--ink)}
.gloss dd{margin:0;font-size:13.3px;color:var(--ink-2);line-height:1.55}
@media(max-width:640px){.gloss .g{grid-template-columns:1fr;gap:4px}}
"""

def build(L):
    acc_l, acc_d = L["accent"]
    css = CSS % (acc_l, acc_d, acc_d)

    cards = "\n".join(
      '<a class="card" href="{u}"><span class="ic">{i}</span><h3>{t}</h3><p>{d}</p>'
      '<div class="tags">{tags}</div><span class="go">apri →</span></a>'.format(
        u=p["u"], i=p["i"], t=p["t"], d=p["d"],
        tags="".join("<span>%s</span>" % k for k in p["k"]))
      for p in L["pages"])

    rows = []
    for i, (t, d, pg) in enumerate(L["agenda"]):
        link = ('<a href="%s">%s</a>' % (L["pages"][pg]["u"], L["pages"][pg]["i"])
                if pg is not None else '<span class="none">solo slide</span>')
        rows.append(
          '<div class="row"><span class="n">%02d</span>'
          '<div><div class="t">%s</div><div class="d">%s</div></div>%s</div>' % (i+1, t, d, link))
    agenda = "\n".join(rows)

    gloss = "\n".join('<div class="g"><dt>%s</dt><dd>%s</dd></div>' % (k, v) for k, v in L["key"])

    hub = ('<a href="%s">Atlante PCPP</a><span>·</span>' % HUB_URL) if HUB_URL else ''
    foot = ('Fa parte dell&rsquo;<a href="%s">Atlante PCPP</a>. ' % HUB_URL) if HUB_URL else ''

    return """<title>{title}</title>
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=IBM+Plex+Mono:wght@400;500;600&family=IBM+Plex+Sans:wght@400;500;600&display=swap">
<style>
/*BASE*/
{css}
</style>

<div class="wrap">
<header>
  <div class="crumb">{hub}<span class="acc">Lezione {n}</span><span>·</span><span>{orig}</span></div>
  <h1>{title}</h1>
  <p class="lede">{lede}</p>
</header>

<section>
  <h2>Pagine interattive</h2>
  <div class="cards">
{cards}
  </div>
</section>

<section>
  <h2>Programma della lezione</h2>
  <div class="panel pad">
    <div class="agenda">
{agenda}
    </div>
  </div>
  <p class="note">Le voci senza pagina sono coperte dalle slide e non hanno bisogno di interazione per essere capite. Quelle con un&rsquo;icona rimandano alla pagina che le rende manipolabili.</p>
</section>

<section>
  <h2>Concetti chiave</h2>
  <div class="panel pad">
    <dl class="gloss">
{gloss}
    </dl>
  </div>
</section>

<footer>
  {foot}Materiale basato sulle slide di Ra&uacute;l Pardo e Peter Sestoft, PCPP F2026, IT University of Copenhagen.
</footer>
</div>
""".format(title=L["title"], css=css, hub=hub, n=L["n"], orig=L["orig"], lede=L["lede"],
           cards=cards, agenda=agenda, gloss=gloss, foot=foot)

out = pathlib.Path(".")
for L in LECTURES:
    p = out / (L["slug"] + ".src.html")
    p.write_text(build(L), encoding="utf-8")
    print("wrote", p)
