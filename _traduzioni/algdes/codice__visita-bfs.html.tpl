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
        // Lettura veloce: BufferedReader legge una riga alla volta.
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

        // Prima riga: n (nodi), m (archi), s (sorgente). I nodi vanno da 0 a n-1.
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        int s = Integer.parseInt(st.nextToken());

        // Lista di adiacenza: adj.get(u) contiene i vicini di u.
        List&lt;List&lt;Integer&gt;&gt; adj = new ArrayList&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            adj.add(new ArrayList&lt;&gt;());
        }
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());
            adj.get(u).add(v);
            adj.get(v).add(u); // grafo non diretto: l'arco vale nei due versi
        }

        // dist[v] = distanza da s; -1 vuol dire "non ancora visto".
        int[] dist = new int[n];
        Arrays.fill(dist, -1);

        // Coda FIFO: add mette in fondo, poll toglie dalla testa.
        Deque&lt;Integer&gt; coda = new ArrayDeque&lt;&gt;();
        dist[s] = 0;
        coda.add(s); // il nodo si segna come visto quando ENTRA in coda

        while (!coda.isEmpty()) {
            int u = coda.poll();          // Integer -&gt; int: unboxing automatico
            for (int v : adj.get(u)) {    // for-each sulla lista dei vicini
                if (dist[v] == -1) {      // primo arrivo: il cammino è il più corto
                    dist[v] = dist[u] + 1;
                    coda.add(v);
                }
            }
        }

        // StringBuilder: si accumula l'output e si stampa una volta sola.
        StringBuilder out = new StringBuilder();
        for (int i = 0; i &lt; n; i++) {
            out.append(i).append(' ').append(dist[i]).append('\n');
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="11"><p>{{s|s007|}}</p></li>
    <li data-righe="30"><p>{{s|s008|}}</p></li>
    <li data-righe="33"><p>{{s|s009|}}</p></li>
    <li data-righe="34"><p>{{s|s010|}}</p></li>
    <li data-righe="38"><p>{{s|s011|}}</p></li>
    <li data-righe="39"><p>{{s|s012|}}</p></li>
    <li data-righe="40"><p>{{s|s013|}}</p></li>
    <li data-righe="41" data-segna="dist[v] = dist[u] + 1@ora"><p>{{s|s014|}}</p></li>
    <li data-righe="42"><p>{{s|s015|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s016|}}"><ul><li>{{s|s017|}}</li><li>{{s|s018|}}</li><li>{{s|s019|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s020|}}</h2>
  <p>{{s|s021|}}</p>
  <pre class="cod">5 6 0
0 1
0 2
1 3
2 3
3 4
1 4

(output: nodo distanza)
0 0
1 1
2 1
3 2
4 2</pre>
</section>
<section>
  <h2>{{s|s022|}}</h2>
  <p>{{s|s023|}}</p>
</section>

</main>
</body>
</html>
