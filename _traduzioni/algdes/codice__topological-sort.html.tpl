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

        // Archi DIRETTI: adj.get(u) contiene i successori di u. entrante[v] conta gli archi che entrano in v.
        List&lt;List&lt;Integer&gt;&gt; adj = new ArrayList&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            adj.add(new ArrayList&lt;&gt;());
        }
        int[] entrante = new int[n];
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());
            adj.get(u).add(v);
            entrante[v]++;
        }

        // Lista delle sorgenti: nodi con grado entrante 0.
        Deque&lt;Integer&gt; pronti = new ArrayDeque&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            if (entrante[i] == 0) {
                pronti.add(i);
            }
        }

        List&lt;Integer&gt; ordine = new ArrayList&lt;&gt;();
        while (!pronti.isEmpty()) {
            int u = pronti.poll();   // scrivo u nell'ordine e lo "tolgo" dal grafo
            ordine.add(u);
            for (int v : adj.get(u)) {
                entrante[v]--;       // l'arco u -&gt; v non c'è più
                if (entrante[v] == 0) {
                    pronti.add(v);   // v non ha più prerequisiti
                }
            }
        }

        // Se non ho scritto tutti i nodi, nel grafo c'è un ciclo: nessun ordine esiste.
        if (ordine.size() &lt; n) {
            System.out.println("ciclo: nessun ordinamento");
        } else {
            StringBuilder out = new StringBuilder();
            for (int i = 0; i &lt; n; i++) {
                out.append(ordine.get(i)).append(i + 1 &lt; n ? " " : "\n");
            }
            System.out.print(out);
        }
    }
}</pre>
    <ol class="spiega">
    <li data-righe="16"><p>{{s|s007|}}</p></li>
    <li data-righe="22"><p>{{s|s008|}}</p></li>
    <li data-righe="28"><p>{{s|s009|}}</p></li>
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

        // Archi DIRETTI: adj.get(u) contiene i successori di u. entrante[v] conta gli archi che entrano in v.
        List&lt;List&lt;Integer&gt;&gt; adj = new ArrayList&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            adj.add(new ArrayList&lt;&gt;());
        }
        int[] entrante = new int[n];
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());
            adj.get(u).add(v);
            entrante[v]++;
        }

        // Lista delle sorgenti: nodi con grado entrante 0.
        Deque&lt;Integer&gt; pronti = new ArrayDeque&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            if (entrante[i] == 0) {
                pronti.add(i);
            }
        }

        List&lt;Integer&gt; ordine = new ArrayList&lt;&gt;();
        while (!pronti.isEmpty()) {
            int u = pronti.poll();   // scrivo u nell'ordine e lo "tolgo" dal grafo
            ordine.add(u);
            for (int v : adj.get(u)) {
                entrante[v]--;       // l'arco u -&gt; v non c'è più
                if (entrante[v] == 0) {
                    pronti.add(v);   // v non ha più prerequisiti
                }
            }
        }

        // Se non ho scritto tutti i nodi, nel grafo c'è un ciclo: nessun ordine esiste.
        if (ordine.size() &lt; n) {
            System.out.println("ciclo: nessun ordinamento");
        } else {
            StringBuilder out = new StringBuilder();
            for (int i = 0; i &lt; n; i++) {
                out.append(ordine.get(i)).append(i + 1 &lt; n ? " " : "\n");
            }
            System.out.print(out);
        }
    }
}</pre>
    <ol class="spiega">
    <li data-righe="35"><p>{{s|s016|}}</p></li>
    <li data-righe="38"><p>{{s|s017|}}</p></li>
    <li data-righe="39"><p>{{s|s018|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s019|}}"><ul><li>{{s|s020|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
  <figure class="codice" data-titolo="{{a|s023|}}">
<pre data-lang="java">import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        // Archi DIRETTI: adj.get(u) contiene i successori di u. entrante[v] conta gli archi che entrano in v.
        List&lt;List&lt;Integer&gt;&gt; adj = new ArrayList&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            adj.add(new ArrayList&lt;&gt;());
        }
        int[] entrante = new int[n];
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            int u = Integer.parseInt(st.nextToken());
            int v = Integer.parseInt(st.nextToken());
            adj.get(u).add(v);
            entrante[v]++;
        }

        // Lista delle sorgenti: nodi con grado entrante 0.
        Deque&lt;Integer&gt; pronti = new ArrayDeque&lt;&gt;();
        for (int i = 0; i &lt; n; i++) {
            if (entrante[i] == 0) {
                pronti.add(i);
            }
        }

        List&lt;Integer&gt; ordine = new ArrayList&lt;&gt;();
        while (!pronti.isEmpty()) {
            int u = pronti.poll();   // scrivo u nell'ordine e lo "tolgo" dal grafo
            ordine.add(u);
            for (int v : adj.get(u)) {
                entrante[v]--;       // l'arco u -&gt; v non c'è più
                if (entrante[v] == 0) {
                    pronti.add(v);   // v non ha più prerequisiti
                }
            }
        }

        // Se non ho scritto tutti i nodi, nel grafo c'è un ciclo: nessun ordine esiste.
        if (ordine.size() &lt; n) {
            System.out.println("ciclo: nessun ordinamento");
        } else {
            StringBuilder out = new StringBuilder();
            for (int i = 0; i &lt; n; i++) {
                out.append(ordine.get(i)).append(i + 1 &lt; n ? " " : "\n");
            }
            System.out.print(out);
        }
    }
}</pre>
    <ol class="spiega">
    <li data-righe="46"><p>{{s|s024|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s025|}}"><ul><li>{{s|s026|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s027|}}</h2>
  <p>{{s|s028|}}</p>
  <pre class="cod">5 5
0 2
1 2
0 4
2 3
4 3

(output)
0 1 4 2 3

Con il ciclo 0→1→2→0:
ciclo: nessun ordinamento</pre>
</section>
<section>
  <h2>{{s|s029|}}</h2>
  <p>{{s|s030|}}</p>
</section>

</main>
</body>
</html>
