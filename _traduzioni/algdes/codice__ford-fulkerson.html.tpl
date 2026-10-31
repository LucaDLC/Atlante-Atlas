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
    static int n;
    static int[][] cap;      // capacità residua: cap[u][v] = quanto posso ancora mandare da u a v

    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        int s = Integer.parseInt(st.nextToken());
        int t = Integer.parseInt(st.nextToken());

        cap = new int[n][n];                   // matrice: adatta a grafi piccoli (n piccolo)
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());
            cap[u][v] += Integer.parseInt(st.nextToken());
        }

        // Finché trovo un cammino s→t nella rete residua, aumento il flusso del collo di bottiglia.
        int flusso = 0;
        while (true) {
            int[] padre = new int[n];
            Arrays.fill(padre, -1);
            padre[s] = s;
            Deque&lt;Integer&gt; coda = new ArrayDeque&lt;&gt;();
            coda.add(s);
            while (!coda.isEmpty() &amp;&amp; padre[t] == -1) {    // BFS sulla residua
                int u = coda.poll();
                for (int v = 0; v &lt; n; v++) {
                    if (padre[v] == -1 &amp;&amp; cap[u][v] &gt; 0) {
                        padre[v] = u;
                        coda.add(v);
                    }
                }
            }
            if (padre[t] == -1) {
                break;                                     // nessun cammino: flusso massimo
            }
            int collo = Integer.MAX_VALUE;                 // collo di bottiglia del cammino
            for (int v = t; v != s; v = padre[v]) {
                collo = Math.min(collo, cap[padre[v]][v]);
            }
            for (int v = t; v != s; v = padre[v]) {
                cap[padre[v]][v] -= collo;                 // l'avanti si riduce
                cap[v][padre[v]] += collo;                 // l'indietro cresce: si può disfare
            }
            flusso += collo;
        }
        System.out.println("flusso massimo " + flusso);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="16"><p>{{s|s007|}}</p></li>
    <li data-righe="21"><p>{{s|s008|}}</p></li>
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
    static int n;
    static int[][] cap;      // capacità residua: cap[u][v] = quanto posso ancora mandare da u a v

    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());
        int s = Integer.parseInt(st.nextToken());
        int t = Integer.parseInt(st.nextToken());

        cap = new int[n][n];                   // matrice: adatta a grafi piccoli (n piccolo)
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());
            cap[u][v] += Integer.parseInt(st.nextToken());
        }

        // Finché trovo un cammino s→t nella rete residua, aumento il flusso del collo di bottiglia.
        int flusso = 0;
        while (true) {
            int[] padre = new int[n];
            Arrays.fill(padre, -1);
            padre[s] = s;
            Deque&lt;Integer&gt; coda = new ArrayDeque&lt;&gt;();
            coda.add(s);
            while (!coda.isEmpty() &amp;&amp; padre[t] == -1) {    // BFS sulla residua
                int u = coda.poll();
                for (int v = 0; v &lt; n; v++) {
                    if (padre[v] == -1 &amp;&amp; cap[u][v] &gt; 0) {
                        padre[v] = u;
                        coda.add(v);
                    }
                }
            }
            if (padre[t] == -1) {
                break;                                     // nessun cammino: flusso massimo
            }
            int collo = Integer.MAX_VALUE;                 // collo di bottiglia del cammino
            for (int v = t; v != s; v = padre[v]) {
                collo = Math.min(collo, cap[padre[v]][v]);
            }
            for (int v = t; v != s; v = padre[v]) {
                cap[padre[v]][v] -= collo;                 // l'avanti si riduce
                cap[v][padre[v]] += collo;                 // l'indietro cresce: si può disfare
            }
            flusso += collo;
        }
        System.out.println("flusso massimo " + flusso);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="44"><p>{{s|s014|}}</p></li>
    <li data-righe="49"><p>{{s|s015|}}</p></li>
    <li data-righe="50"><p>{{s|s016|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s017|}}"><ul><li>{{s|s018|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <pre class="cod">4 5 0 3
0 1 1
0 2 1
1 2 1
1 3 1
2 3 1

(output)
flusso massimo 2</pre>
</section>
<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
</section>

</main>
</body>
</html>
