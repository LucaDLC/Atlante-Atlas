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
  <figure class="codice" data-titolo="{{a|s006|}}">
<pre data-lang="java">import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        // BufferedReader legge una riga alla volta: molto piu veloce di Scanner su input grandi.
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

        // Prima riga: il numero di coppie.
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());

        // StringBuilder accumula l'output: stampo una volta sola alla fine.
        StringBuilder out = new StringBuilder();
        for (int i = 0; i &lt; n; i++) {
            st = new StringTokenizer(in.readLine());   // spezza la riga in token
            int s = Integer.parseInt(st.nextToken());  // inizio
            int f = Integer.parseInt(st.nextToken());  // fine
            out.append(f - s).append('\n');
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="7"><p>{{s|s007|}}</p></li>
    <li data-righe="10"><p>{{s|s008|}}</p></li>
    <li data-righe="14"><p>{{s|s009|}}</p></li>
    <li data-righe="17"><p>{{s|s010|}}</p></li>
    <li data-righe="19"><p>{{s|s011|}}</p></li>
    <li data-righe="21"><p>{{s|s012|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s013|}}"><ul><li>{{s|s014|}}</li><li>{{s|s015|}}</li><li>{{s|s016|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <pre class="cod">2
1 4
10 13

(output)
3
3</pre>
</section>
<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
</section>

</main>
</body>
</html>
