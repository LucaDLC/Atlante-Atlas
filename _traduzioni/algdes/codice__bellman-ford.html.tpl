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
        int s = Integer.parseInt(st.nextToken());

        // Archi diretti {u, v, peso}: il peso puo essere negativo.
        int[][] archi = new int[m][3];
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            archi[i][0] = Integer.parseInt(st.nextToken());
            archi[i][1] = Integer.parseInt(st.nextToken());
            archi[i][2] = Integer.parseInt(st.nextToken());
        }

        final long INF = Long.MAX_VALUE / 4;     // infinito che non va in overflow sommando un peso
        long[] dist = new long[n];
        Arrays.fill(dist, INF);
        dist[s] = 0;

        // n-1 giri: ogni giro rilassa tutti gli archi.
        for (int giro = 1; giro &lt; n; giro++) {
            for (int[] a : archi) {
                if (dist[a[0]] != INF &amp;&amp; dist[a[0]] + a[2] &lt; dist[a[1]]) {
                    dist[a[1]] = dist[a[0]] + a[2];
                }
            }
        }
        // Un giro in piu: se una distanza migliora ancora, c e un ciclo negativo.
        for (int[] a : archi) {
            if (dist[a[0]] != INF &amp;&amp; dist[a[0]] + a[2] &lt; dist[a[1]]) {
                System.out.println("ciclo negativo raggiungibile");
                return;
            }
        }
        StringBuilder out = new StringBuilder();
        for (int v = 0; v &lt; n; v++) {
            out.append(v).append(' ').append(dist[v] == INF ? "inf" : String.valueOf(dist[v])).append('\n');
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="21"><p>{{s|s007|}}</p></li>
    <li data-righe="27"><p>{{s|s008|}}</p></li>
    <li data-righe="30"><p>{{s|s009|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s010|}}"><ul><li>{{s|s011|}}</li><li>{{s|s012|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s013|}}</h2>
  <p>{{s|s014|}}</p>
  <figure class="codice" data-titolo="{{a|s015|}}">
<pre data-lang="java">import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        int s = Integer.parseInt(st.nextToken());

        // Archi diretti {u, v, peso}: il peso puo essere negativo.
        int[][] archi = new int[m][3];
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            archi[i][0] = Integer.parseInt(st.nextToken());
            archi[i][1] = Integer.parseInt(st.nextToken());
            archi[i][2] = Integer.parseInt(st.nextToken());
        }

        final long INF = Long.MAX_VALUE / 4;     // infinito che non va in overflow sommando un peso
        long[] dist = new long[n];
        Arrays.fill(dist, INF);
        dist[s] = 0;

        // n-1 giri: ogni giro rilassa tutti gli archi.
        for (int giro = 1; giro &lt; n; giro++) {
            for (int[] a : archi) {
                if (dist[a[0]] != INF &amp;&amp; dist[a[0]] + a[2] &lt; dist[a[1]]) {
                    dist[a[1]] = dist[a[0]] + a[2];
                }
            }
        }
        // Un giro in piu: se una distanza migliora ancora, c e un ciclo negativo.
        for (int[] a : archi) {
            if (dist[a[0]] != INF &amp;&amp; dist[a[0]] + a[2] &lt; dist[a[1]]) {
                System.out.println("ciclo negativo raggiungibile");
                return;
            }
        }
        StringBuilder out = new StringBuilder();
        for (int v = 0; v &lt; n; v++) {
            out.append(v).append(' ').append(dist[v] == INF ? "inf" : String.valueOf(dist[v])).append('\n');
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="34"><p>{{s|s016|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s017|}}"><ul><li>{{s|s018|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <pre class="cod">4 5 0
0 1 4
0 2 5
1 2 -3
2 3 2
1 3 6

(output)
0 0
1 4
2 1
3 3</pre>
</section>
<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
</section>

</main>
</body>
</html>
