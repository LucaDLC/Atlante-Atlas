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
        int W = Integer.parseInt(st.nextToken());

        int[] peso = new int[n + 1];
        int[] valore = new int[n + 1];
        for (int i = 1; i &lt;= n; i++) {
            st = new StringTokenizer(in.readLine());
            peso[i] = Integer.parseInt(st.nextToken());
            valore[i] = Integer.parseInt(st.nextToken());
        }

        // opt[i][w] = valore massimo con i primi i oggetti e budget w.
        // La riga 0 è già zero (caso base): Java inizializza gli array di int a 0.
        int[][] opt = new int[n + 1][W + 1];
        for (int i = 1; i &lt;= n; i++) {
            for (int w = 0; w &lt;= W; w++) {
                opt[i][w] = opt[i - 1][w];                 // salto l'oggetto i
                if (peso[i] &lt;= w) {                        // lo prendo se ci sta
                    opt[i][w] = Math.max(opt[i][w], valore[i] + opt[i - 1][w - peso[i]]);
                }
            }
        }

        // Traceback: se il valore cambia rispetto alla riga sopra, l'oggetto i è stato preso.
        List&lt;Integer&gt; presi = new ArrayList&lt;&gt;();
        int w = W;
        for (int i = n; i &gt;= 1; i--) {
            if (opt[i][w] != opt[i - 1][w]) {
                presi.add(i);
                w -= peso[i];
            }
        }
        Collections.reverse(presi);
        System.out.println("valore " + opt[n][W] + ", oggetti " + presi);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="21"><p>{{s|s007|}}</p></li>
    <li data-righe="24" data-segna="opt[i - 1][w]@dato"><p>{{s|s008|}}</p></li>
    <li data-righe="25" data-segna="peso[i] <= w@ora"><p>{{s|s009|}}</p></li>
    <li data-righe="26" data-segna="Math.max@ok"><p>{{s|s010|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s011|}}"><ul><li>{{s|s012|}}</li><li>{{s|s013|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s014|}}</h2>
  <p>{{s|s015|}}</p>
  <figure class="codice" data-titolo="{{a|s016|}}">
<pre data-lang="java">import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int W = Integer.parseInt(st.nextToken());

        int[] peso = new int[n + 1];
        int[] valore = new int[n + 1];
        for (int i = 1; i &lt;= n; i++) {
            st = new StringTokenizer(in.readLine());
            peso[i] = Integer.parseInt(st.nextToken());
            valore[i] = Integer.parseInt(st.nextToken());
        }

        // opt[i][w] = valore massimo con i primi i oggetti e budget w.
        // La riga 0 è già zero (caso base): Java inizializza gli array di int a 0.
        int[][] opt = new int[n + 1][W + 1];
        for (int i = 1; i &lt;= n; i++) {
            for (int w = 0; w &lt;= W; w++) {
                opt[i][w] = opt[i - 1][w];                 // salto l'oggetto i
                if (peso[i] &lt;= w) {                        // lo prendo se ci sta
                    opt[i][w] = Math.max(opt[i][w], valore[i] + opt[i - 1][w - peso[i]]);
                }
            }
        }

        // Traceback: se il valore cambia rispetto alla riga sopra, l'oggetto i è stato preso.
        List&lt;Integer&gt; presi = new ArrayList&lt;&gt;();
        int w = W;
        for (int i = n; i &gt;= 1; i--) {
            if (opt[i][w] != opt[i - 1][w]) {
                presi.add(i);
                w -= peso[i];
            }
        }
        Collections.reverse(presi);
        System.out.println("valore " + opt[n][W] + ", oggetti " + presi);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="32"><p>{{s|s017|}}</p></li>
    <li data-righe="35"><p>{{s|s018|}}</p></li>
    <li data-righe="37"><p>{{s|s019|}}</p></li>
    <li data-righe="40"><p>{{s|s020|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s021|}}"><ul><li>{{s|s022|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s023|}}</h2>
  <p>{{s|s024|}}</p>
  <pre class="cod">3 6
1 1
2 6
5 18

(output)
valore 19, oggetti [1, 3]</pre>
</section>
<section>
  <h2>{{s|s025|}}</h2>
  <p>{{s|s026|}}</p>
</section>

</main>
</body>
</html>
