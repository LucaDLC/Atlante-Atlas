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
  <div class="box idea" data-tit="{{a|s006|}}">
    <p>{{s|s007|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s008|}}</h2>
  <p>{{s|s009|}}</p>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s010|}}</th><th>{{s|s011|}}</th><th>{{s|s012|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s013|}}</td><td>{{s|s014|}}</td><td>{{s|s015|}}</td></tr>
      <tr><td>{{s|s016|}}</td><td>{{s|s017|}}</td><td>{{s|s018|}}</td></tr>
      <tr><td>{{s|s019|}}</td><td>{{s|s020|}}</td><td>{{s|s021|}}</td></tr>
    </tbody>
  </table></div>
  <p>{{s|s022|}}</p>
</section>

<section>
  <h2>{{s|s023|}}</h2>
  <figure class="passi" data-titolo="{{a|s024|}}" data-legenda="{{a|s025|}}">
    <div class="passo"><div class="espr">{{s|s026|}}</div><p class="nota">{{s|s027|}}</p></div>
    <div class="passo"><div class="espr">{{s|s028|}}</div><p class="nota">{{s|s029|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">Mark2</mark>: <mark class="ok">dummy += multiply(i)</mark> e si restituisce dummy</div><p class="nota">{{s|s030|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">Mark3</mark>: <mark class="ok">10 ripetizioni</mark>, ognuna stampata</div><p class="nota">{{s|s031|}}</p></div>
    <div class="passo"><div class="espr">{{s|s032|}}</div><p class="nota">{{s|s033|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">Mark5</mark>: <mark class="ora">count</mark> raddoppia (2, 4, 8, …) <mark class="ok">finché un giro dura almeno 0,25 s</mark></div><p class="nota">{{s|s034|}}</p></div>
    <div class="passo"><div class="espr">{{s|s035|}}</div><p class="nota">{{s|s036|}}</p></div>
    <div class="passo"><div class="espr">{{s|s037|}}</div><p class="nota">{{s|s038|}}</p></div>
    <div class="passo"><div class="espr">{{s|s039|}}</div><p class="nota">{{s|s040|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">Mark8Setup</mark>: <mark class="ora">setup.run()</mark> tra <mark class="ora">t.pause()</mark> e <mark class="ora">t.play()</mark></div><p class="nota">{{s|s041|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s042|}}</h2>
  <figure class="codice" data-titolo="{{a|s043|}}">
<pre data-lang="java">public static double Mark7(char tunit, String msg, LongToDoubleFunction f) {
    long n = 10, count = 1, totalCount = 0;
    double dummy = 0.0, runningTime = 0.0, st = 0.0, sst = 0.0;
    do {
      count *= 2;
      st = sst = 0.0;
      for (long j=0; j&lt;n; j++) {
        Timer t = new Timer();
        for (long i=0; i&lt;count; i++)
          dummy += f.applyAsDouble(i);
        runningTime = t.check();
        double time = runningTime * scale(tunit) / count;
        st += time;
        sst += time * time;
        totalCount += count;
      }
    } while (runningTime &lt; 0.25);
    double mean = st/n, sdev = Math.sqrt((sst - mean*mean*n)/(n-1));
    System.out.printf("%-25s %15.1f %cs %10.2f %10d%n", msg, mean, tunit, sdev, count);
    return dummy / totalCount;
}</pre>
    <div class="intro"><p>{{s|s044|}}</p></div>
    <ol class="spiega">
      <li data-righe="2" data-segna="n = 10@dato|count = 1@ora"><p>{{s|s045|}}</p></li>
      <li data-righe="3" data-segna="dummy@ok|st@dato|sst@due"><p>{{s|s046|}}</p></li>
      <li data-righe="4-5" data-segna="count *= 2@ora"><p>{{s|s047|}}</p></li>
      <li data-righe="6" data-segna="st = sst = 0.0@ora"><p>{{s|s048|}}</p></li>
      <li data-righe="7-8,11" data-segna="Timer t = new Timer();@dato|t.check()@ok"><p>{{s|s049|}}</p></li>
      <li data-righe="9-10" data-segna="dummy += f.applyAsDouble(i);@ora"><p>{{s|s050|}}</p></li>
      <li data-righe="12" data-segna="runningTime * scale(tunit) / count@ok"><p>{{s|s051|}}</p></li>
      <li data-righe="13-15" data-segna="time * time@due"><p>{{s|s052|}}</p></li>
      <li data-righe="17" data-segna="runningTime &lt; 0.25@no"><p>{{s|s053|}}</p></li>
      <li data-righe="18" data-segna="mean@ok|sdev@due"><p>{{s|s054|}}</p></li>
      <li data-righe="19" data-segna="mean@ok|sdev@due|count@ora"><p>{{s|s055|}}</p></li>
      <li data-righe="20" data-segna="dummy / totalCount@ok"><p>{{s|s056|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s057|}}</h2>
  <p>{{s|s058|}}</p>
  <figure class="passi" data-titolo="{{a|s059|}}" data-legenda="{{a|s060|}}">
    <div class="passo"><div class="espr">tempi: <mark class="dato">9, 10, 10, 11</mark> µs      n = 4</div><p class="nota">{{s|s061|}}</p></div>
    <div class="passo"><div class="espr">st = <mark class="dato">9 + 10 + 10 + 11 = 40</mark></div><p class="nota">{{s|s062|}}</p></div>
    <div class="passo"><div class="espr">sst = <mark class="due">81 + 100 + 100 + 121 = 402</mark></div><p class="nota">{{s|s063|}}</p></div>
    <div class="passo"><div class="espr">mean = st / n = 40 / 4 = <mark class="ok">10</mark></div><p class="nota">{{s|s064|}}</p></div>
    <div class="passo"><div class="espr">sdev = √( (<mark class="due">sst</mark> − mean²·n) / (n−1) ) = √( (402 − 100·4) / 3 )</div><p class="nota">{{s|s065|}}</p></div>
    <div class="passo"><div class="espr">sdev = √(2/3) = <mark class="ok">0,82</mark></div><p class="nota">{{s|s066|}}</p></div>
  </figure>
  <div class="box regola" data-tit="{{a|s067|}}">
    <p>{{s|s068|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s069|}}</h2>
  <figure class="codice" data-titolo="{{a|s070|}}">
<pre data-lang="java">public class Timer {
  private long start, spent = 0;
  public Timer() { play(); }
  public double check() { return (System.nanoTime()-start+spent)/1e9; }
  public void pause() { spent += System.nanoTime()-start; }
  public void play() { start = System.nanoTime(); }
}

// dentro Mark8Setup, per ogni chiamata:
t.pause();
setup.run();
t.play();
dummy += f.applyAsDouble(i);</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="start@dato|spent@due"><p>{{s|s071|}}</p></li>
      <li data-righe="4" data-segna="System.nanoTime()@ora|/1e9@ok"><p>{{s|s072|}}</p></li>
      <li data-righe="5" data-segna="spent += System.nanoTime()-start@due"><p>{{s|s073|}}</p></li>
      <li data-righe="6" data-segna="start = System.nanoTime()@dato"><p>{{s|s074|}}</p></li>
      <li data-righe="10-13" data-segna="t.pause();@ora|setup.run();@due|t.play();@ora|f.applyAsDouble(i)@ok"><p>{{s|s075|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s076|}}</h2>
  <p>{{s|s077|}}</p>
  <figure class="passi" data-titolo="{{a|s078|}}" data-legenda="{{a|s079|}}">
    <div class="passo"><div class="espr"><mark class="dato">8.1</mark> funzioni matematiche (pow, exp, sin…): <mark class="ok">6–23 ns a chiamata</mark></div><p class="nota">{{s|s080|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">8.2</mark> thread: platform <mark class="ok">≈110 µs</mark> contro virtual <mark class="ok">≈11,6 µs</mark> (crea + avvia + join)</div><p class="nota">{{s|s081|}}</p></div>
    <div class="passo"><div class="espr">{{s|s082|}}</div><p class="nota">{{s|s083|}}</p></div>
    <div class="passo"><div class="espr"><mark class="dato">8.4</mark> campo <code>volatile</code>: <code>add</code> <mark class="ok">≈0,3 ns</mark> contro <code>addVolatile</code> <mark class="ok">5,6–8,5 ns</mark></div><p class="nota">{{s|s084|}}</p></div>
  </figure>
  <div class="box idea" data-tit="{{a|s085|}}">
    <p>{{s|s086|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s087|}}</h2>
  <div class="box attenzione" data-tit="{{a|s088|}}">
    <p>{{s|s089|}}</p>
  </div>
  <div class="box basi" data-tit="{{a|s090|}}">
    <p>{{s|s091|}}</p>
  </div>
</section>

</main>
</body>
</html>
