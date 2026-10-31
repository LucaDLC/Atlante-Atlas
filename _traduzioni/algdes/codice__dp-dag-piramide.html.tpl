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
        int n = Integer.parseInt(in.readLine().trim());   // numero di livelli

        // Leggo la piramide: il livello r ha r+1 valori.
        int[][] c = new int[n][];
        for (int r = 0; r &lt; n; r++) {
            StringTokenizer st = new StringTokenizer(in.readLine());
            c[r] = new int[r + 1];
            for (int j = 0; j &lt;= r; j++) {
                c[r][j] = Integer.parseInt(st.nextToken());
            }
        }

        // opt[j] = miglior somma a partire dalla casella (r, j) fino in fondo.
        // Parto dall'ultima riga e risalgo: ogni casella usa i due figli gia calcolati.
        int[] opt = c[n - 1].clone();
        for (int r = n - 2; r &gt;= 0; r--) {
            int[] nuovo = new int[r + 1];
            for (int j = 0; j &lt;= r; j++) {
                nuovo[j] = c[r][j] + Math.max(opt[j], opt[j + 1]);   // figlio sinistro o destro
            }
            opt = nuovo;
        }
        System.out.println("massimo " + opt[0]);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="10"><p>{{s|s007|}}</p></li>
    <li data-righe="13"><p>{{s|s008|}}</p></li>
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
        int n = Integer.parseInt(in.readLine().trim());   // numero di livelli

        // Leggo la piramide: il livello r ha r+1 valori.
        int[][] c = new int[n][];
        for (int r = 0; r &lt; n; r++) {
            StringTokenizer st = new StringTokenizer(in.readLine());
            c[r] = new int[r + 1];
            for (int j = 0; j &lt;= r; j++) {
                c[r][j] = Integer.parseInt(st.nextToken());
            }
        }

        // opt[j] = miglior somma a partire dalla casella (r, j) fino in fondo.
        // Parto dall'ultima riga e risalgo: ogni casella usa i due figli gia calcolati.
        int[] opt = c[n - 1].clone();
        for (int r = n - 2; r &gt;= 0; r--) {
            int[] nuovo = new int[r + 1];
            for (int j = 0; j &lt;= r; j++) {
                nuovo[j] = c[r][j] + Math.max(opt[j], opt[j + 1]);   // figlio sinistro o destro
            }
            opt = nuovo;
        }
        System.out.println("massimo " + opt[0]);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="21"><p>{{s|s014|}}</p></li>
    <li data-righe="25"><p>{{s|s015|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s016|}}"><ul><li>{{s|s017|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s018|}}</h2>
  <p>{{s|s019|}}</p>
  <pre class="cod">3
1
1 2
2 0 0

(output)
massimo 4</pre>
</section>
<section>
  <h2>{{s|s020|}}</h2>
  <p>{{s|s021|}}</p>
</section>

</main>
</body>
</html>
