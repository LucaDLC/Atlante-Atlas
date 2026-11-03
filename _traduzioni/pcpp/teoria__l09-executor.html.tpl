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
  <div class="occhiello">{{s|s002|}}</div>
  <h1>{{s|s003|}}</h1>
  <p class="lede">{{s|s004|}}</p>
</header>

<section>
  <h2>{{s|s005|}}</h2>
  <p>{{s|s006|}}</p>
  <figure class="passi" data-titolo="{{a|s007|}}" data-legenda="{{a|s008|}}">
    <div class="passo"><div class="espr">{{s|s009|}}</div><p class="nota">{{s|s010|}}</p></div>
    <div class="passo"><div class="espr">{{s|s011|}}</div><p class="nota">{{s|s012|}}</p></div>
    <div class="passo"><div class="espr">{{s|s013|}}</div><p class="nota">{{s|s014|}}</p></div>
    <div class="passo"><div class="espr">{{s|s015|}}</div><p class="nota">{{s|s016|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <div class="box attenzione" data-tit="{{a|s019|}}">{{s|s020|}}</div>
</section>

<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
  <figure class="codice" data-titolo="{{a|s023|}}">
<pre data-lang="java">import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.LongAdder;

public class Esecutore {
    static boolean isPrime(int n) {
        if (n &lt; 2) return false;
        for (int d = 2; (long) d * d &lt;= n; d++)
            if (n % d == 0) return false;
        return true;
    }

    public static void main(String[] args) throws Exception {
        final int range = 100_000, taskCount = 8;
        final int perTask = range / taskCount;
        ExecutorService executor = Executors.newWorkStealingPool();
        LongAdder conteggio = new LongAdder();
        List&lt;Future&lt;?&gt;&gt; futures = new ArrayList&lt;&gt;();
        for (int t = 0; t &lt; taskCount; t++) {
            final int da = perTask * t, a = perTask * (t + 1);
            futures.add(executor.submit(() -&gt; {
                for (int i = da; i &lt; a; i++)
                    if (isPrime(i)) conteggio.increment();
            }));
        }
        for (Future&lt;?&gt; f : futures)
            f.get();                            // aspetta il risultato di ogni task
        executor.shutdown();
        System.out.println("primi sotto 100000: " + conteggio.sum());
    }
}</pre>
    <ol class="spiega">
      <li data-righe="9-13" data-segna="isPrime(int n)@ora"><p>{{s|s024|}}</p></li>
      <li data-righe="18" data-segna="range / taskCount@ora"><p>{{s|s025|}}</p></li>
      <li data-righe="19" data-segna="Executors.newWorkStealingPool()@ora"><p>{{s|s026|}}</p></li>
      <li data-righe="20" data-segna="LongAdder conteggio@due"><p>{{s|s027|}}</p></li>
      <li data-righe="22-23" data-segna="for (int t = 0; t &lt; taskCount; t++)@ora"><p>{{s|s028|}}</p></li>
      <li data-righe="24-27" data-segna="executor.submit@ora"><p>{{s|s029|}}</p></li>
      <li data-righe="29-30" data-segna="f.get()@ora"><p>{{s|s030|}}</p></li>
      <li data-righe="31" data-segna="executor.shutdown()@ora"><p>{{s|s031|}}</p></li>
      <li data-righe="32" data-segna="conteggio.sum()@ok"><p>{{s|s032|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s033|}}</h2>
  <p>{{s|s034|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s035|}}</th><th>{{s|s036|}}</th></tr></thead><tbody>
    <tr><td>{{s|s037|}}</td><td>{{s|s038|}}</td></tr>
    <tr><td>{{s|s039|}}</td><td>{{s|s040|}}</td></tr>
    <tr><td>{{s|s041|}}</td><td>{{s|s042|}}</td></tr>
  </tbody></table></div>
  <div class="box regola" data-tit="{{a|s043|}}">{{s|s044|}}</div>
</section>

</main>
</body>
</html>
