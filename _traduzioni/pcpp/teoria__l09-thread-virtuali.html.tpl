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
    <div class="passo"><div class="espr"><mark class="dato">Thread di piattaforma</mark>: uno per ogni thread del sistema</div><p class="nota">{{s|s010|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">Thread virtuale</mark>: tanti possono esistere insieme</div><p class="nota">{{s|s011|}}</p></div>
    <div class="passo"><div class="espr">Il thread virtuale fa una richiesta e <mark class="ora">si blocca</mark></div><p class="nota">{{s|s012|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ok">Attesa senza costo</mark>: l’operazione bloccante non occupa un thread del sistema</div><p class="nota">{{s|s013|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s014|}}</h2>
  <p>{{s|s015|}}</p>
  <div class="tab-wrap"><table class="tab"><thead><tr><th>{{s|s016|}}</th><th>{{s|s017|}}</th></tr></thead><tbody>
    <tr><td>{{s|s018|}}</td><td>{{s|s019|}}</td></tr>
    <tr><td>{{s|s020|}}</td><td>{{s|s021|}}</td></tr>
    <tr><td>{{s|s022|}}</td><td>{{s|s023|}}</td></tr>
    <tr><td>{{s|s024|}}</td><td>{{s|s025|}}</td></tr>
  </tbody></table></div>
  <div class="box attenzione" data-tit="{{a|s026|}}">{{s|s027|}}</div>
</section>

<section>
  <h2>{{s|s028|}}</h2>
  <p>{{s|s029|}}</p>
  <figure class="codice" data-titolo="{{a|s030|}}">
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
      <li data-righe="8" data-segna="Thread.sleep(100)@ora"><p>{{s|s031|}}</p></li>
      <li data-righe="15" data-segna="List.of@ora"><p>{{s|s032|}}</p></li>
      <li data-righe="16" data-segna="threads@due"><p>{{s|s033|}}</p></li>
      <li data-righe="17" data-segna="inizio@ora"><p>{{s|s034|}}</p></li>
      <li data-righe="18" data-segna="for (String url : urls)@ora"><p>{{s|s035|}}</p></li>
      <li data-righe="19" data-segna="final String mioUrl = url;@due"><p>{{s|s036|}}</p></li>
      <li data-righe="20" data-segna="Thread.ofVirtual().start@ora"><p>{{s|s037|}}</p></li>
      <li data-righe="22-23" data-segna="t.join()@ora"><p>{{s|s038|}}</p></li>
      <li data-righe="24-25" data-segna="System.out.println@ok"><p>{{s|s039|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s040|}}</h2>
    <figure class="passi" data-titolo="{{a|s041|}}" data-legenda="{{a|s042|}}">
    <div class="passo"><div class="espr">Una alla volta: <mark class="dato">100 + 100 + 100 + 100 = 400 ms</mark></div><p class="nota">{{s|s043|}}</p></div>
    <div class="passo"><div class="espr"><mark class="ora">Quattro thread virtuali</mark> partono insieme</div><p class="nota">{{s|s044|}}</p></div>
    <div class="passo"><div class="espr">Tutte finiscono intorno a <mark class="ok">100 ms</mark></div><p class="nota">{{s|s045|}}</p></div>
  </figure>
</section>

<section>
  <h2>{{s|s046|}}</h2>
  <div class="box regola" data-tit="{{a|s047|}}">{{s|s048|}}</div>
  <div class="box inglese" data-tit="{{a|s049|}}">{{s|s050|}}</div>
</section>

</main>
</body>
</html>
