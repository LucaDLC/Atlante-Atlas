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

        // Ogni intervallo è un array di due interi: {inizio, fine}.
        int[][] iv = new int[n][2];
        for (int i = 0; i &lt; n; i++) {
            StringTokenizer st = new StringTokenizer(in.readLine());
            iv[i][0] = Integer.parseInt(st.nextToken());
            iv[i][1] = Integer.parseInt(st.nextToken());
        }

        // Ordino per fine crescente. Il comparatore e una lambda: confronta la colonna 1.
        // Integer.compare evita l'overflow che avrebbe x[1] - y[1] con valori enormi.
        Arrays.sort(iv, (x, y) -&gt; Integer.compare(x[1], y[1]));

        List&lt;String&gt; scelti = new ArrayList&lt;&gt;();
        int ultimaFine = Integer.MIN_VALUE;   // fine dell'ultimo intervallo preso
        for (int[] c : iv) {                  // for-each su un array di array
            if (c[0] &gt;= ultimaFine) {         // compatibile: non inizia prima della fine
                scelti.add("[" + c[0] + "," + c[1] + ")");
                ultimaFine = c[1];
            }
        }
        System.out.println(scelti.size() + " intervalli: " + String.join(" ", scelti));
    }
}</pre>
    <ol class="spiega">
    <li data-righe="10"><p>{{s|s007|}}</p></li>
    <li data-righe="19"><p>{{s|s008|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s009|}}"><ul><li>{{s|s010|}}</li><li>{{s|s011|}}</li></ul></div>
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

        // Ogni intervallo è un array di due interi: {inizio, fine}.
        int[][] iv = new int[n][2];
        for (int i = 0; i &lt; n; i++) {
            StringTokenizer st = new StringTokenizer(in.readLine());
            iv[i][0] = Integer.parseInt(st.nextToken());
            iv[i][1] = Integer.parseInt(st.nextToken());
        }

        // Ordino per fine crescente. Il comparatore e una lambda: confronta la colonna 1.
        // Integer.compare evita l'overflow che avrebbe x[1] - y[1] con valori enormi.
        Arrays.sort(iv, (x, y) -&gt; Integer.compare(x[1], y[1]));

        List&lt;String&gt; scelti = new ArrayList&lt;&gt;();
        int ultimaFine = Integer.MIN_VALUE;   // fine dell'ultimo intervallo preso
        for (int[] c : iv) {                  // for-each su un array di array
            if (c[0] &gt;= ultimaFine) {         // compatibile: non inizia prima della fine
                scelti.add("[" + c[0] + "," + c[1] + ")");
                ultimaFine = c[1];
            }
        }
        System.out.println(scelti.size() + " intervalli: " + String.join(" ", scelti));
    }
}</pre>
    <ol class="spiega">
    <li data-righe="22"><p>{{s|s015|}}</p></li>
    <li data-righe="23"><p>{{s|s016|}}</p></li>
    <li data-righe="24" data-segna="c[0] >= ultimaFine@ok"><p>{{s|s017|}}</p></li>
    <li data-righe="26"><p>{{s|s018|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s019|}}"><ul><li>{{s|s020|}}</li><li>{{s|s021|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s022|}}</h2>
  <p>{{s|s023|}}</p>
  <pre class="cod">6
0 3
2 5
4 7
1 8
6 9
8 10

(output)
3 intervalli: [0,3) [4,7) [8,10)</pre>
</section>
<section>
  <h2>{{s|s024|}}</h2>
  <p>{{s|s025|}}</p>
</section>

</main>
</body>
</html>
