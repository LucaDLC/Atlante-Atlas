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
    static int[] padre;

    // find con path compression: ogni nodo incontrato viene collegato direttamente alla radice.
    static int find(int x) {
        if (padre[x] != x) {
            padre[x] = find(padre[x]);
        }
        return padre[x];
    }

    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        // Ogni arco è {u, v, peso}.
        int[][] archi = new int[m][3];
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            archi[i][0] = Integer.parseInt(st.nextToken());
            archi[i][1] = Integer.parseInt(st.nextToken());
            archi[i][2] = Integer.parseInt(st.nextToken());
        }

        // Kruskal: archi per peso crescente.
        Arrays.sort(archi, (x, y) -&gt; Integer.compare(x[2], y[2]));

        padre = new int[n];
        for (int i = 0; i &lt; n; i++) {
            padre[i] = i;                 // ogni nodo è la radice di sé stesso
        }

        long costo = 0;
        int presi = 0;
        for (int[] a : archi) {
            int ru = find(a[0]);
            int rv = find(a[1]);
            if (ru != rv) {               // radici diverse: nessun ciclo
                padre[ru] = rv;           // unisco le due componenti
                costo += a[2];            // long: la somma può superare int
                presi++;
            }                             // altrimenti l'arco chiuderebbe un ciclo: scartato
        }
        System.out.println("costo " + costo + ", archi " + presi);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="8"><p>{{s|s007|}}</p></li>
    <li data-righe="10"><p>{{s|s008|}}</p></li>
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
    static int[] padre;

    // find con path compression: ogni nodo incontrato viene collegato direttamente alla radice.
    static int find(int x) {
        if (padre[x] != x) {
            padre[x] = find(padre[x]);
        }
        return padre[x];
    }

    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int n = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        // Ogni arco è {u, v, peso}.
        int[][] archi = new int[m][3];
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            archi[i][0] = Integer.parseInt(st.nextToken());
            archi[i][1] = Integer.parseInt(st.nextToken());
            archi[i][2] = Integer.parseInt(st.nextToken());
        }

        // Kruskal: archi per peso crescente.
        Arrays.sort(archi, (x, y) -&gt; Integer.compare(x[2], y[2]));

        padre = new int[n];
        for (int i = 0; i &lt; n; i++) {
            padre[i] = i;                 // ogni nodo è la radice di sé stesso
        }

        long costo = 0;
        int presi = 0;
        for (int[] a : archi) {
            int ru = find(a[0]);
            int rv = find(a[1]);
            if (ru != rv) {               // radici diverse: nessun ciclo
                padre[ru] = rv;           // unisco le due componenti
                costo += a[2];            // long: la somma può superare int
                presi++;
            }                             // altrimenti l'arco chiuderebbe un ciclo: scartato
        }
        System.out.println("costo " + costo + ", archi " + presi);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="22"><p>{{s|s014|}}</p></li>
    <li data-righe="31"><p>{{s|s015|}}</p></li>
    <li data-righe="43" data-segna="ru != rv@ok"><p>{{s|s016|}}</p></li>
    <li data-righe="45"><p>{{s|s017|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s018|}}"><ul><li>{{s|s019|}}</li><li>{{s|s020|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
  <pre class="cod">5 6
0 1 1
1 2 2
3 4 2
0 2 3
2 3 4
1 4 5

(output)
costo 9, archi 4</pre>
</section>
<section>
  <h2>{{s|s023|}}</h2>
  <p>{{s|s024|}}</p>
</section>

</main>
</body>
</html>
