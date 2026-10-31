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
        int n = Integer.parseInt(in.readLine().trim());

        // Job come {inizio, fine, valore}.
        int[][] job = new int[n][3];
        for (int i = 0; i &lt; n; i++) {
            StringTokenizer st = new StringTokenizer(in.readLine());
            job[i][0] = Integer.parseInt(st.nextToken());
            job[i][1] = Integer.parseInt(st.nextToken());
            job[i][2] = Integer.parseInt(st.nextToken());
        }
        // Ordino per fine: così OPT(j) dipende solo da job precedenti.
        Arrays.sort(job, (x, y) -&gt; Integer.compare(x[1], y[1]));

        // p[j] = numero di job (nell'ordine) compatibili con j, cioè che finiscono prima dell'inizio di j.
        int[] fine = new int[n];
        for (int i = 0; i &lt; n; i++) {
            fine[i] = job[i][1];
        }
        int[] p = new int[n];
        for (int j = 0; j &lt; n; j++) {
            int lo = 0, hi = j;                    // ricerca binaria: ultimo job con fine &lt;= inizio di j
            while (lo &lt; hi) {
                int mid = (lo + hi + 1) / 2;
                if (fine[mid - 1] &lt;= job[j][0]) {
                    lo = mid;
                } else {
                    hi = mid - 1;
                }
            }
            p[j] = lo;                              // numero di job compatibili (indici 0..lo-1)
        }

        // opt[j] = valore massimo con i primi j job; opt[0] = 0.
        long[] opt = new long[n + 1];
        for (int j = 1; j &lt;= n; j++) {
            long prendo = job[j - 1][2] + opt[p[j - 1]];
            opt[j] = Math.max(prendo, opt[j - 1]);   // prendo il job j, oppure lo salto
        }
        System.out.println("valore massimo " + opt[n]);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="18"><p>{{s|s007|}}</p></li>
    <li data-righe="27"><p>{{s|s008|}}</p></li>
    <li data-righe="30"><p>{{s|s009|}}</p></li>
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
    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        int n = Integer.parseInt(in.readLine().trim());

        // Job come {inizio, fine, valore}.
        int[][] job = new int[n][3];
        for (int i = 0; i &lt; n; i++) {
            StringTokenizer st = new StringTokenizer(in.readLine());
            job[i][0] = Integer.parseInt(st.nextToken());
            job[i][1] = Integer.parseInt(st.nextToken());
            job[i][2] = Integer.parseInt(st.nextToken());
        }
        // Ordino per fine: così OPT(j) dipende solo da job precedenti.
        Arrays.sort(job, (x, y) -&gt; Integer.compare(x[1], y[1]));

        // p[j] = numero di job (nell'ordine) compatibili con j, cioè che finiscono prima dell'inizio di j.
        int[] fine = new int[n];
        for (int i = 0; i &lt; n; i++) {
            fine[i] = job[i][1];
        }
        int[] p = new int[n];
        for (int j = 0; j &lt; n; j++) {
            int lo = 0, hi = j;                    // ricerca binaria: ultimo job con fine &lt;= inizio di j
            while (lo &lt; hi) {
                int mid = (lo + hi + 1) / 2;
                if (fine[mid - 1] &lt;= job[j][0]) {
                    lo = mid;
                } else {
                    hi = mid - 1;
                }
            }
            p[j] = lo;                              // numero di job compatibili (indici 0..lo-1)
        }

        // opt[j] = valore massimo con i primi j job; opt[0] = 0.
        long[] opt = new long[n + 1];
        for (int j = 1; j &lt;= n; j++) {
            long prendo = job[j - 1][2] + opt[p[j - 1]];
            opt[j] = Math.max(prendo, opt[j - 1]);   // prendo il job j, oppure lo salto
        }
        System.out.println("valore massimo " + opt[n]);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="42"><p>{{s|s015|}}</p></li>
    <li data-righe="43"><p>{{s|s016|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s017|}}"><ul><li>{{s|s018|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <pre class="cod">5
1 3 2
2 5 4
4 7 4
6 9 7
8 10 2

(output)
valore massimo 11</pre>
</section>
<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
</section>

</main>
</body>
</html>
