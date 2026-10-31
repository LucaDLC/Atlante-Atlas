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
    static List&lt;List&lt;Integer&gt;&gt; adj;
    static boolean[] visto;
    static int[] padre;
    static int[] ordineVisita;
    static int contatore = 0;
    static boolean ciclo = false;

    // Visita ricorsiva: va a fondo e torna indietro quando il nodo non ha più vicini nuovi.
    static void dfs(int u) {
        visto[u] = true;
        ordineVisita[u] = ++contatore;
        for (int v : adj.get(u)) {
            if (!visto[v]) {
                padre[v] = u;
                dfs(v);
            } else if (v != padre[u]) {
                ciclo = true; // back edge: v è già visto ed è un antenato di u
            }
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        adj = new ArrayList&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            adj.add(new ArrayList&lt;&gt;());
        }
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());
            adj.get(u).add(v);
            adj.get(v).add(u);
        }

        visto = new boolean[n];
        padre = new int[n];
        Arrays.fill(padre, -1);
        ordineVisita = new int[n];

        // Una visita per ogni componente connessa: ogni nodo non visto fa partire una DFS.
        int componenti = 0;
        for (int s = 0; s &lt; n; s++) {
            if (!visto[s]) {
                componenti++;
                dfs(s);
            }
        }

        StringBuilder out = new StringBuilder();
        out.append("componenti: ").append(componenti).append('\n');
        out.append("ciclo: ").append(ciclo ? "sì" : "no").append('\n');
        out.append("ordine di visita: ");
        for (int i = 0; i &lt; n; i++) {
            out.append(i).append('=').append(ordineVisita[i]).append(i + 1 &lt; n ? " " : "\n");
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="13"><p>{{s|s007|}}</p></li>
    <li data-righe="15"><p>{{s|s008|}}</p></li>
    <li data-righe="17"><p>{{s|s009|}}</p></li>
    <li data-righe="18"><p>{{s|s010|}}</p></li>
    <li data-righe="19"><p>{{s|s011|}}</p></li>
    <li data-righe="21"><p>{{s|s012|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s013|}}"><ul><li>{{s|s014|}}</li><li>{{s|s015|}}</li><li>{{s|s016|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s017|}}</h2>
  <p>{{s|s018|}}</p>
  <figure class="codice" data-titolo="{{a|s019|}}">
<pre data-lang="java">import java.io.*;
import java.util.*;

public class Main {
    static List&lt;List&lt;Integer&gt;&gt; adj;
    static boolean[] visto;
    static int[] padre;
    static int[] ordineVisita;
    static int contatore = 0;
    static boolean ciclo = false;

    // Visita ricorsiva: va a fondo e torna indietro quando il nodo non ha più vicini nuovi.
    static void dfs(int u) {
        visto[u] = true;
        ordineVisita[u] = ++contatore;
        for (int v : adj.get(u)) {
            if (!visto[v]) {
                padre[v] = u;
                dfs(v);
            } else if (v != padre[u]) {
                ciclo = true; // back edge: v è già visto ed è un antenato di u
            }
        }
    }

    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        adj = new ArrayList&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            adj.add(new ArrayList&lt;&gt;());
        }
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());
            adj.get(u).add(v);
            adj.get(v).add(u);
        }

        visto = new boolean[n];
        padre = new int[n];
        Arrays.fill(padre, -1);
        ordineVisita = new int[n];

        // Una visita per ogni componente connessa: ogni nodo non visto fa partire una DFS.
        int componenti = 0;
        for (int s = 0; s &lt; n; s++) {
            if (!visto[s]) {
                componenti++;
                dfs(s);
            }
        }

        StringBuilder out = new StringBuilder();
        out.append("componenti: ").append(componenti).append('\n');
        out.append("ciclo: ").append(ciclo ? "sì" : "no").append('\n');
        out.append("ordine di visita: ");
        for (int i = 0; i &lt; n; i++) {
            out.append(i).append('=').append(ordineVisita[i]).append(i + 1 &lt; n ? " " : "\n");
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="50"><p>{{s|s020|}}</p></li>
    <li data-righe="53"><p>{{s|s021|}}</p></li>
    <li data-righe="54"><p>{{s|s022|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s023|}}"><ul><li>{{s|s024|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s025|}}</h2>
  <p>{{s|s026|}}</p>
  <pre class="cod">5 5 0
0 1
1 2
2 3
3 1
0 4

(output)
componenti: 1
ciclo: sì
ordine di visita: 0=1 1=2 2=3 3=4 4=5</pre>
</section>
<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
</section>

</main>
</body>
</html>
