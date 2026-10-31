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

        // Archi con peso: adj.get(u) contiene coppie {vicino, peso}.
        List&lt;List&lt;int[]&gt;&gt; adj = new ArrayList&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            adj.add(new ArrayList&lt;&gt;());
        }
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());
            int w = Integer.parseInt(st.nextToken());
            adj.get(u).add(new int[]{v, w});
            adj.get(v).add(new int[]{u, w});
        }

        // dist = distanze provvisorie; Integer.MAX_VALUE fa da infinito.
        int[] dist = new int[n];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[s] = 0;

        // Coda di priorità: esce per primo l'elemento con distanza minima.
        // Ogni elemento è {nodo, distanza}; il comparatore confronta la distanza (colonna 1).
        PriorityQueue&lt;int[]&gt; coda = new PriorityQueue&lt;&gt;((x, y) -&gt; Integer.compare(x[1], y[1]));
        coda.add(new int[]{s, 0});

        while (!coda.isEmpty()) {
            int[] top = coda.poll();
            int u = top[0];
            if (top[1] &gt; dist[u]) {
                continue;                 // voce vecchia: esiste già una distanza migliore
            }
            for (int[] arco : adj.get(u)) {
                int v = arco[0];
                int nuova = dist[u] + arco[1];
                if (nuova &lt; dist[v]) {    // rilassamento: passare da u è più economico
                    dist[v] = nuova;
                    coda.add(new int[]{v, nuova});
                }
            }
        }

        StringBuilder out = new StringBuilder();
        for (int i = 0; i &lt; n; i++) {
            out.append(i).append(' ').append(dist[i] == Integer.MAX_VALUE ? "inf" : String.valueOf(dist[i])).append('\n');
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="13"><p>{{s|s007|}}</p></li>
    <li data-righe="28"><p>{{s|s008|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s009|}}"><ul><li>{{s|s010|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s011|}}</h2>
  <p>{{s|s012|}}</p>
  <figure class="codice" data-titolo="{{a|s013|}}">
<pre data-lang="java">import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        int s = Integer.parseInt(st.nextToken());

        // Archi con peso: adj.get(u) contiene coppie {vicino, peso}.
        List&lt;List&lt;int[]&gt;&gt; adj = new ArrayList&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            adj.add(new ArrayList&lt;&gt;());
        }
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());
            int w = Integer.parseInt(st.nextToken());
            adj.get(u).add(new int[]{v, w});
            adj.get(v).add(new int[]{u, w});
        }

        // dist = distanze provvisorie; Integer.MAX_VALUE fa da infinito.
        int[] dist = new int[n];
        Arrays.fill(dist, Integer.MAX_VALUE);
        dist[s] = 0;

        // Coda di priorità: esce per primo l'elemento con distanza minima.
        // Ogni elemento è {nodo, distanza}; il comparatore confronta la distanza (colonna 1).
        PriorityQueue&lt;int[]&gt; coda = new PriorityQueue&lt;&gt;((x, y) -&gt; Integer.compare(x[1], y[1]));
        coda.add(new int[]{s, 0});

        while (!coda.isEmpty()) {
            int[] top = coda.poll();
            int u = top[0];
            if (top[1] &gt; dist[u]) {
                continue;                 // voce vecchia: esiste già una distanza migliore
            }
            for (int[] arco : adj.get(u)) {
                int v = arco[0];
                int nuova = dist[u] + arco[1];
                if (nuova &lt; dist[v]) {    // rilassamento: passare da u è più economico
                    dist[v] = nuova;
                    coda.add(new int[]{v, nuova});
                }
            }
        }

        StringBuilder out = new StringBuilder();
        for (int i = 0; i &lt; n; i++) {
            out.append(i).append(' ').append(dist[i] == Integer.MAX_VALUE ? "inf" : String.valueOf(dist[i])).append('\n');
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="33"><p>{{s|s014|}}</p></li>
    <li data-righe="39"><p>{{s|s015|}}</p></li>
    <li data-righe="45" data-segna="nuova < dist[v]@ora"><p>{{s|s016|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s017|}}"><ul><li>{{s|s018|}}</li><li>{{s|s019|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s020|}}</h2>
  <p>{{s|s021|}}</p>
  <pre class="cod">4 5 0
0 1 2
0 2 5
1 2 1
1 3 4
2 3 1

(output: nodo distanza)
0 0
1 2
2 3
3 4</pre>
</section>
<section>
  <h2>{{s|s022|}}</h2>
  <p>{{s|s023|}}</p>
</section>

</main>
</body>
</html>
