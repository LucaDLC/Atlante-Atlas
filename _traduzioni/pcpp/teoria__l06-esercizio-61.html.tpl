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
</head>
<body>
<main class="pagina">

<header class="testa">
  <h1>{{s|s002|}}</h1>
  <p class="lede">{{s|s003|}}</p>
</header>

<section>
  <h2>{{s|s004|}}</h2>
  <p>{{s|s005|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s006|}}</th><th>{{s|s007|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s008|}}</td><td>{{s|s009|}}</td></tr>
      <tr><td>{{s|s010|}}</td><td>{{s|s011|}}</td></tr>
      <tr><td>{{s|s012|}}</td><td>{{s|s013|}}</td></tr>
      <tr><td>{{s|s014|}}</td><td>{{s|s015|}}</td></tr>
    </tbody>
  </table></div>
  <div class="colonne">
    <div class="carta cattiva"><h4>{{s|s016|}}</h4><p>{{s|s017|}}</p></div>
    <div class="carta buona"><h4>{{s|s018|}}</h4><p>{{s|s019|}}</p></div>
  </div>
</section>

<section>
  <h2>{{s|s020|}}</h2>
  <figure class="codice" data-titolo="{{a|s021|}}">
<pre data-lang="java">class CasHistogram implements Histogram {
    private final AtomicInteger[] counts;

    public CasHistogram(int span) {
        this.counts = new AtomicInteger[span];
        for (int i = 0; i &lt; span; i++) {
            this.counts[i] = new AtomicInteger(0);
        }
    }

    public void increment(int bin) {
        int oldValue;
        do {
            oldValue = counts[bin].get();
        } while (!counts[bin].compareAndSet(oldValue, oldValue + 1));
    }

    public int getCount(int bin) { return counts[bin].get(); }

    public int getSpan() { return counts.length; }

    public int getAndClear(int bin) {
        int oldValue;
        do {
            oldValue = counts[bin].get();
        } while (!counts[bin].compareAndSet(oldValue, 0));
        return oldValue;
    }
}</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="private final@ok"><p>{{s|s022|}}</p></li>
      <li data-righe="5-8" data-segna="new AtomicInteger(0)@ora"><p>{{s|s023|}}</p></li>
      <li data-righe="11-15" data-segna="compareAndSet(oldValue, oldValue + 1)@ora"><p>{{s|s024|}}</p></li>
      <li data-righe="18-20"><p>{{s|s025|}}</p></li>
      <li data-righe="22-28" data-segna="return oldValue;@ok"><p>{{s|s026|}}</p></li>
    </ol>
  </figure>
  <div class="box regola" data-tit="{{a|s027|}}">
    <p>{{s|s028|}}</p>
    <p>{{s|s029|}}</p>
  </div>
  <figure class="passi" data-titolo="{{a|s030|}}" data-legenda="{{a|s031|}}">
    <div class="passo"><div class="espr">stato = <mark class="dato">counts</mark> e i 30 AtomicInteger dentro</div><p class="nota">{{s|s032|}}</p></div>
    <div class="passo"><div class="espr">1. campo: <mark class="ok">private</mark></div><p class="nota">{{s|s033|}}</p></div>
    <div class="passo"><div class="espr">{{s|s034|}}</div><p class="nota">{{s|s035|}}</p></div>
    <div class="passo"><div class="espr">{{s|s036|}}</div><p class="nota">{{s|s037|}}</p></div>
  </figure>
  <div class="box inglese" data-tit="{{a|s038|}}">
    <p>{{s|s039|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s040|}}">
    <p>{{s|s041|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s042|}}</h2>
  <p>{{s|s043|}}</p>
  <figure class="passi" data-titolo="{{a|s044|}}" data-legenda="{{a|s045|}}">
    <div class="passo"><div class="espr">bin 7 = 5      T1: getAndClear(7)      T2: increment(7)</div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr">T1: oldValue = get() = <mark class="dato">5</mark></div><p class="nota">{{s|s047|}}</p></div>
    <div class="passo"><div class="espr">T2: <mark class="ora">CAS(5 → 6)</mark> <mark class="ok">riesce</mark>      bin 7 = 6</div><p class="nota">{{s|s048|}}</p></div>
    <div class="passo"><div class="espr">T1: <mark class="ora">CAS(5 → 0)</mark> <mark class="no">fallisce</mark>      bin 7 = 6</div><p class="nota">{{s|s049|}}</p></div>
    <div class="passo"><div class="espr">T1: oldValue = <mark class="dato">6</mark>, <mark class="ora">CAS(6 → 0)</mark> <mark class="ok">riesce</mark>, return 6</div><p class="nota">{{s|s050|}}</p></div>
  </figure>
  <div class="colonne">
    <div class="carta cattiva"><h4>{{s|s051|}}</h4><p>{{s|s052|}}</p></div>
    <div class="carta buona"><h4>{{s|s053|}}</h4><p>{{s|s054|}}</p></div>
  </div>
  <div class="box inglese" data-tit="{{a|s055|}}">
    <p>{{s|s056|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s057|}}</h2>
  <p>{{s|s058|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s059|}}</th><th>{{s|s060|}}</th><th>{{s|s061|}}</th></tr></thead>
    <tbody>
      <tr><td>0, 1</td><td>{{s|s062|}}</td><td>0</td></tr>
      <tr><td>2, 3, 5, 7</td><td>{{s|s063|}}</td><td>1</td></tr>
      <tr><td>4, 6, 9</td><td>2·2, 2·3, 3·3</td><td>2</td></tr>
      <tr><td>8</td><td>2·2·2</td><td>3</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s064|}}</p>
  <figure class="passi" data-titolo="{{a|s065|}}" data-legenda="{{a|s066|}}">
    <div class="passo"><div class="espr"><mark class="dato">expected</mark>: un thread, p = 0…4999, expected.increment(countFactors(p))</div><p class="nota">{{s|s067|}}</p></div>
    <div class="passo"><div class="espr">{{s|s068|}}</div><p class="nota">{{s|s069|}}</p></div>
    <div class="passo"><div class="espr">{{s|s070|}}</div><p class="nota">{{s|s071|}}</p></div>
    <div class="passo"><div class="espr">{{s|s072|}}</div><p class="nota">{{s|s073|}}</p></div>
  </figure>
  <div class="box attenzione" data-tit="{{a|s074|}}">
    <p>{{s|s075|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s076|}}">
    <p>{{s|s077|}}</p>
  </div>
</section>

</main>
</body>
</html>
