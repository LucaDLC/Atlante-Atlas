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
    <div class="passo"><div class="espr">2. metodi: restituiscono solo <mark class="ok">int</mark></div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">3. costruttore: <mark class="ok">this non esce</mark></div><p class="nota">{{s|s035|}}</p></div>
  </figure>
  <div class="box inglese" data-tit="{{a|s036|}}">
    <p>{{s|s037|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s038|}}">
    <p>{{s|s039|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s040|}}</h2>
  <p>{{s|s041|}}</p>
  <figure class="passi" data-titolo="{{a|s042|}}" data-legenda="{{a|s043|}}">
    <div class="passo"><div class="espr">bin 7 = 5      T1: getAndClear(7)      T2: increment(7)</div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">T1: oldValue = get() = <mark class="dato">5</mark></div><p class="nota">{{s|s045|}}</p></div>
    <div class="passo"><div class="espr">T2: <mark class="ora">CAS(5 → 6)</mark> <mark class="ok">riesce</mark>      bin 7 = 6</div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr">T1: <mark class="ora">CAS(5 → 0)</mark> <mark class="no">fallisce</mark>      bin 7 = 6</div><p class="nota">{{s|s047|}}</p></div>
    <div class="passo"><div class="espr">T1: oldValue = <mark class="dato">6</mark>, <mark class="ora">CAS(6 → 0)</mark> <mark class="ok">riesce</mark>, return 6</div><p class="nota">{{s|s048|}}</p></div>
  </figure>
  <div class="colonne">
    <div class="carta cattiva"><h4>{{s|s049|}}</h4><p>{{s|s050|}}</p></div>
    <div class="carta buona"><h4>{{s|s051|}}</h4><p>{{s|s052|}}</p></div>
  </div>
  <div class="box inglese" data-tit="{{a|s053|}}">
    <p>{{s|s054|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s055|}}</h2>
  <p>{{s|s056|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s057|}}</th><th>{{s|s058|}}</th><th>{{s|s059|}}</th></tr></thead>
    <tbody>
      <tr><td>0, 1</td><td>{{s|s060|}}</td><td>0</td></tr>
      <tr><td>2, 3, 5, 7</td><td>{{s|s061|}}</td><td>1</td></tr>
      <tr><td>4, 6, 9</td><td>2·2, 2·3, 3·3</td><td>2</td></tr>
      <tr><td>8</td><td>2·2·2</td><td>3</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s062|}}</p>
  <figure class="passi" data-titolo="{{a|s063|}}" data-legenda="{{a|s064|}}">
    <div class="passo"><div class="espr"><mark class="dato">expected</mark>: un thread, p = 0…4999, expected.increment(countFactors(p))</div><p class="nota">{{s|s065|}}</p></div>
    <div class="passo"><div class="espr"><mark class="due">histogram</mark>: 5000 thread, uno per numero, tutti sullo stesso oggetto</div><p class="nota">{{s|s066|}}</p></div>
    <div class="passo"><div class="espr">barriera da 5000 + 1: partenza insieme, poi main aspetta la fine</div><p class="nota">{{s|s067|}}</p></div>
    <div class="passo"><div class="espr">per ogni bin 0…29: assertEquals(<mark class="dato">expected</mark>.getCount(bin), <mark class="due">histogram</mark>.getCount(bin))</div><p class="nota">{{s|s068|}}</p></div>
  </figure>
  <div class="box attenzione" data-tit="{{a|s069|}}">
    <p>{{s|s070|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s071|}}">
    <p>{{s|s072|}}</p>
  </div>
</section>

</main>
</body>
</html>
