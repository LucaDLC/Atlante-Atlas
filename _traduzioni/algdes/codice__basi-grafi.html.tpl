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

        // Lista di adiacenza: una lista di vicini per ogni nodo.
        List&lt;List&lt;Integer&gt;&gt; adj = new ArrayList&lt;&gt;();
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

        // Grado di ogni nodo = lunghezza della sua lista.
        StringBuilder out = new StringBuilder();
        out.append("n = ").append(n).append(", m = ").append(m).append('\n');
        for (int u = 0; u &lt; n; u++) {
            out.append("grado(").append(u).append(") = ").append(adj.get(u).size()).append('\n');
        }

        // Domanda: c'è l'arco u–v? Scorro la lista di u: costa il grado di u.
        int u = 0, v = 3;
        boolean c = adj.get(u).contains(v);
        out.append("arco ").append(u).append('-').append(v).append(": ").append(c).append('\n');
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="6"><p>{{s|s007|}}</p></li>
    <li data-righe="8"><p>{{s|s008|}}</p></li>
    <li data-righe="12"><p>{{s|s009|}}</p></li>
    <li data-righe="20"><p>{{s|s010|}}</p></li>
    <li data-righe="21"><p>{{s|s011|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s012|}}"><ul><li>{{s|s013|}}</li><li>{{s|s014|}}</li><li>{{s|s015|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
  <figure class="codice" data-titolo="{{a|s018|}}">
<pre data-lang="java">import java.io.*;
import java.util.*;

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        // Lista di adiacenza: una lista di vicini per ogni nodo.
        List&lt;List&lt;Integer&gt;&gt; adj = new ArrayList&lt;&gt;();
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

        // Grado di ogni nodo = lunghezza della sua lista.
        StringBuilder out = new StringBuilder();
        out.append("n = ").append(n).append(", m = ").append(m).append('\n');
        for (int u = 0; u &lt; n; u++) {
            out.append("grado(").append(u).append(") = ").append(adj.get(u).size()).append('\n');
        }

        // Domanda: c'è l'arco u–v? Scorro la lista di u: costa il grado di u.
        int u = 0, v = 3;
        boolean c = adj.get(u).contains(v);
        out.append("arco ").append(u).append('-').append(v).append(": ").append(c).append('\n');
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="28"><p>{{s|s019|}}</p></li>
    <li data-righe="33"><p>{{s|s020|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s021|}}"><ul><li>{{s|s022|}}</li><li>{{s|s023|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s024|}}</h2>
  <p>{{s|s025|}}</p>
  <pre class="cod">4 4
0 1
0 3
1 2
2 3

(output)
n = 4, m = 4
grado(0) = 2
grado(1) = 2
grado(2) = 2
grado(3) = 2
arco 0-3: true</pre>
</section>
<section>
  <h2>{{s|s026|}}</h2>
  <p>{{s|s027|}}</p>
</section>

</main>
</body>
</html>
