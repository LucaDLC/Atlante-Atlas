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
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        int[] archiU = new int[m];
        int[] archiV = new int[m];
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            archiU[i] = Integer.parseInt(st.nextToken());
            archiV[i] = Integer.parseInt(st.nextToken());
        }

        int migliore = Integer.MAX_VALUE;
        // Ogni k da 0 a 2^n − 1 è un sottoinsieme: il bit i dice se il nodo i è nella copertura.
        for (int k = 0; k &lt; (1 &lt;&lt; n); k++) {
            boolean copre = true;
            for (int i = 0; i &lt; m &amp;&amp; copre; i++) {
                boolean u = ((k &gt;&gt; archiU[i]) &amp; 1) == 1;
                boolean v = ((k &gt;&gt; archiV[i]) &amp; 1) == 1;
                copre = u || v;                       // ogni arco ha almeno un estremo scelto
            }
            if (copre) {
                migliore = Math.min(migliore, Integer.bitCount(k));   // popcount: quanti bit accesi
            }
        }
        System.out.println("vertex cover minima: " + migliore);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="21"><p>{{s|s007|}}</p></li>
    <li data-righe="24"><p>{{s|s008|}}</p></li>
    <li data-righe="26"><p>{{s|s009|}}</p></li>
    <li data-righe="29"><p>{{s|s010|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s011|}}"><ul><li>{{s|s012|}}</li><li>{{s|s013|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s014|}}</h2>
  <p>{{s|s015|}}</p>
  <pre class="cod">3 3
0 1
1 2
0 2

(output)
vertex cover minima: 2</pre>
</section>
<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
</section>

</main>
</body>
</html>
