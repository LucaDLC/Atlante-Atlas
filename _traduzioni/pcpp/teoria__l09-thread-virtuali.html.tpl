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
  <p>{{s|s007|}}</p>
  <figure class="passi" data-titolo="{{a|s008|}}" data-legenda="{{a|s009|}}">
    <div class="passo"><div class="espr">{{s|s010|}}</div><p class="nota">{{s|s011|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">Thread virtuale</mark>: tanti possono esistere insieme</div><p class="nota">{{s|s012|}}</p></div>
    <div class="passo"><div class="espr">{{s|s013|}}</div><p class="nota">{{s|s014|}}</p></div>
    <div class="passo"><div class="espr">{{s|s015|}}</div><p class="nota">{{s|s016|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s019|}}</th><th>{{s|s020|}}</th></tr></thead><tbody>
    <tr><td>{{s|s021|}}</td><td>{{s|s022|}}</td></tr>
    <tr><td>{{s|s023|}}</td><td>{{s|s024|}}</td></tr>
    <tr><td>{{s|s025|}}</td><td>{{s|s026|}}</td></tr>
    <tr><td>{{s|s027|}}</td><td>{{s|s028|}}</td></tr>
  </tbody></table></div>
  <div class="box attenzione" data-tit="{{a|s029|}}">{{s|s030|}}</div>
</section>

<section>
  <h2>{{s|s031|}}</h2>
  <p>{{s|s032|}}</p>
  <figure class="codice" data-titolo="{{a|s033|}}">
<pre data-lang="java">import java.util.ArrayList;
import java.util.List;

public class Virtuali {
    // simula una richiesta web: il thread aspetta, non lavora
    static void scarica(String url) {
        try {
            Thread.sleep(100);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }

    public static void main(String[] args) throws InterruptedException {
        List&lt;String&gt; urls = List.of("a.it", "b.it", "c.it", "d.it");
        List&lt;Thread&gt; threads = new ArrayList&lt;&gt;();
        long inizio = System.nanoTime();
        for (String url : urls) {
            final String mioUrl = url;          // copia locale: ogni thread usa il suo url
            threads.add(Thread.ofVirtual().start(() -&gt; scarica(mioUrl)));
        }
        for (Thread t : threads)
            t.join();                           // aspetta la fine di ognuno
        long ms = (System.nanoTime() - inizio) / 1_000_000;
        System.out.println("pagine: " + urls.size() + ", tempo sotto 300 ms: " + (ms &lt; 300));
    }
}</pre>
    <ol class="spiega">
      <li data-righe="8" data-segna="Thread.sleep(100)@ora"><p>{{s|s034|}}</p></li>
      <li data-righe="15" data-segna="List.of@ora"><p>{{s|s035|}}</p></li>
      <li data-righe="16" data-segna="threads@due"><p>{{s|s036|}}</p></li>
      <li data-righe="17" data-segna="inizio@ora"><p>{{s|s037|}}</p></li>
      <li data-righe="18" data-segna="for (String url : urls)@ora"><p>{{s|s038|}}</p></li>
      <li data-righe="19" data-segna="final String mioUrl = url;@due"><p>{{s|s039|}}</p></li>
      <li data-righe="20" data-segna="Thread.ofVirtual().start@ora"><p>{{s|s040|}}</p></li>
      <li data-righe="22-23" data-segna="t.join()@ora"><p>{{s|s041|}}</p></li>
      <li data-righe="24-25" data-segna="System.out.println@ok"><p>{{s|s042|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s043|}}</h2>
    <figure class="passi" data-titolo="{{a|s044|}}" data-legenda="{{a|s045|}}">
    <div class="passo"><div class="espr">Una alla volta: <mark class="dato">100 + 100 + 100 + 100 = 400 ms</mark></div><p class="nota">{{s|s046|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">Quattro thread virtuali</mark> partono insieme</div><p class="nota">{{s|s047|}}</p></div>
    <div class="passo"><div class="espr">Tutte finiscono intorno a <mark class="ok">100 ms</mark></div><p class="nota">{{s|s048|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s049|}}</h2>
  <div class="box regola" data-tit="{{a|s050|}}">{{s|s051|}}</div>
  <div class="box inglese" data-tit="{{a|s052|}}">{{s|s053|}}</div>
</section>

</main>
</body>
</html>
