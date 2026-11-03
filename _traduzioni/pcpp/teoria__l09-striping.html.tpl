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
</section>

<section>
  <h2>{{s|s007|}}</h2>
  <p>{{s|s008|}}</p>
  <figure class="codice" data-titolo="{{a|s009|}}">
<pre data-lang="java">public class Striping {
    static class SyncLongArrayAdder {
        private static final int logS = 6, stripeCount = 1 &lt;&lt; logS, stripeMask = stripeCount - 1;
        private final long[] counts = new long[stripeCount];
        private final Object[] locks = new Object[stripeCount];

        SyncLongArrayAdder() {
            for (int s = 0; s &lt; stripeCount; s++)
                locks[s] = new Object();
        }

        void add(long delta) {
            int s = (int) Thread.currentThread().threadId() &amp; stripeMask;
            synchronized (locks[s]) {
                counts[s] += delta;
            }
        }

        long longValue() {
            long somma = 0;
            for (int s = 0; s &lt; stripeCount; s++)
                synchronized (locks[s]) {
                    somma += counts[s];
                }
            return somma;
        }
    }

    public static void main(String[] args) throws InterruptedException {
        SyncLongArrayAdder adder = new SyncLongArrayAdder();
        Thread[] threads = new Thread[4];
        for (int t = 0; t &lt; threads.length; t++) {
            threads[t] = Thread.ofPlatform().start(() -&gt; {
                for (int i = 1; i &lt;= 100_000; i++)
                    adder.add(1);
            });
        }
        for (Thread t : threads)
            t.join();
        System.out.println("somma: " + adder.longValue());
    }
}</pre>
    <ol class="spiega">
      <li data-righe="3" data-segna="stripeMask = stripeCount - 1@ora"><p>{{s|s010|}}</p></li>
      <li data-righe="7-9" data-segna="SyncLongArrayAdder()@ora"><p>{{s|s011|}}</p></li>
      <li data-righe="13" data-segna="int s = (int) Thread.currentThread().threadId() &amp; stripeMask@ora"><p>{{s|s012|}}</p></li>
      <li data-righe="14-16" data-segna="synchronized (locks[s])@ora"><p>{{s|s013|}}</p></li>
      <li data-righe="20" data-segna="long somma = 0@ora"><p>{{s|s014|}}</p></li>
      <li data-righe="33" data-segna="Thread.ofPlatform().start@ora"><p>{{s|s015|}}</p></li>
      <li data-righe="35" data-segna="adder.add(1)@ok"><p>{{s|s016|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <figure class="passi" data-titolo="{{a|s019|}}" data-legenda="{{a|s020|}}">
    <div class="passo"><div class="espr">{{s|s021|}}</div><p class="nota">{{s|s022|}}</p></div>
    <div class="passo"><div class="espr">{{s|s023|}}</div><p class="nota">{{s|s024|}}</p></div>
    <div class="passo"><div class="espr">{{s|s025|}}</div><p class="nota">{{s|s026|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
  <ul>
    <li>{{s|s029|}}</li>
    <li>{{s|s030|}}</li>
    <li>{{s|s031|}}</li>
    <li>{{s|s032|}}</li>
  </ul>
  <div class="box regola" data-tit="{{a|s033|}}">{{s|s034|}}</div>
</section>

</main>
</body>
</html>
