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
    // Divide et impera: ordina a[lo..hi) dividendo a metà e fondendo.
    static void ordina(int[] a, int lo, int hi, int[] tmp) {
        if (hi - lo &lt;= 1) {
            return;                            // caso base: un elemento è già ordinato
        }
        int mid = (lo + hi) / 2;
        ordina(a, lo, mid, tmp);
        ordina(a, mid, hi, tmp);
        int i = lo, j = mid, k = lo;
        while (i &lt; mid &amp;&amp; j &lt; hi) {            // fusione: sposto il più piccolo dei due fronti
            tmp[k++] = (a[i] &lt;= a[j]) ? a[i++] : a[j++];
        }
        while (i &lt; mid) tmp[k++] = a[i++];
        while (j &lt; hi) tmp[k++] = a[j++];
        System.arraycopy(tmp, lo, a, lo, hi - lo);   // ricopio la parte fusa nell'array originale
    }

    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(in.readLine().trim());
        StringTokenizer st = new StringTokenizer(in.readLine());
        int[] a = new int[n];
        for (int i = 0; i &lt; n; i++) {
            a[i] = Integer.parseInt(st.nextToken());
        }
        ordina(a, 0, n, new int[n]);
        StringBuilder out = new StringBuilder();
        for (int i = 0; i &lt; n; i++) {
            out.append(a[i]).append(i + 1 &lt; n ? " " : "\n");
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="7"><p>{{s|s007|}}</p></li>
    <li data-righe="10"><p>{{s|s008|}}</p></li>
    <li data-righe="11"><p>{{s|s009|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s010|}}"><ul><li>{{s|s011|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s012|}}</h2>
  <p>{{s|s013|}}</p>
  <figure class="codice" data-titolo="{{a|s014|}}">
<pre data-lang="java">import java.io.*;
import java.util.*;

public class Main {
    // Divide et impera: ordina a[lo..hi) dividendo a metà e fondendo.
    static void ordina(int[] a, int lo, int hi, int[] tmp) {
        if (hi - lo &lt;= 1) {
            return;                            // caso base: un elemento è già ordinato
        }
        int mid = (lo + hi) / 2;
        ordina(a, lo, mid, tmp);
        ordina(a, mid, hi, tmp);
        int i = lo, j = mid, k = lo;
        while (i &lt; mid &amp;&amp; j &lt; hi) {            // fusione: sposto il più piccolo dei due fronti
            tmp[k++] = (a[i] &lt;= a[j]) ? a[i++] : a[j++];
        }
        while (i &lt; mid) tmp[k++] = a[i++];
        while (j &lt; hi) tmp[k++] = a[j++];
        System.arraycopy(tmp, lo, a, lo, hi - lo);   // ricopio la parte fusa nell'array originale
    }

    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(in.readLine().trim());
        StringTokenizer st = new StringTokenizer(in.readLine());
        int[] a = new int[n];
        for (int i = 0; i &lt; n; i++) {
            a[i] = Integer.parseInt(st.nextToken());
        }
        ordina(a, 0, n, new int[n]);
        StringBuilder out = new StringBuilder();
        for (int i = 0; i &lt; n; i++) {
            out.append(a[i]).append(i + 1 &lt; n ? " " : "\n");
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="15"><p>{{s|s015|}}</p></li>
    <li data-righe="19"><p>{{s|s016|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s017|}}"><ul><li>{{s|s018|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <pre class="cod">8
5 2 4 7 1 3 2 6

(output)
1 2 2 3 4 5 6 7</pre>
</section>
<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
</section>

</main>
</body>
</html>
