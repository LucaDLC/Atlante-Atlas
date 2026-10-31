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

public class Main {
    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        String a = in.readLine().trim();
        String b = in.readLine().trim();
        int n = a.length();
        int m = b.length();

        // opt[i][j] = distanza tra i primi i caratteri di a e i primi j di b.
        int[][] opt = new int[n + 1][m + 1];
        for (int i = 0; i &lt;= n; i++) {
            opt[i][0] = i;                         // cancellare i caratteri
        }
        for (int j = 0; j &lt;= m; j++) {
            opt[0][j] = j;                         // inserire i caratteri
        }
        for (int i = 1; i &lt;= n; i++) {
            for (int j = 1; j &lt;= m; j++) {
                int costo = (a.charAt(i - 1) == b.charAt(j - 1)) ? 0 : 1;   // caratteri uguali: nessun costo
                opt[i][j] = Math.min(opt[i - 1][j] + 1,                   // cancello a[i]
                            Math.min(opt[i][j - 1] + 1,                   // inserisco b[j]
                                     opt[i - 1][j - 1] + costo));         // allineo, eventualmente sostituendo
            }
        }
        System.out.println("distanza " + opt[n][m]);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="12"><p>{{s|s007|}}</p></li>
    <li data-righe="14"><p>{{s|s008|}}</p></li>
    <li data-righe="21"><p>{{s|s009|}}</p></li>
    <li data-righe="22"><p>{{s|s010|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s011|}}"><ul><li>{{s|s012|}}</li><li>{{s|s013|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s014|}}</h2>
  <p>{{s|s015|}}</p>
  <pre class="cod">ALTO
ALTRO

(output)
distanza 1</pre>
</section>
<section>
  <h2>{{s|s016|}}</h2>
  <p>{{s|s017|}}</p>
</section>

</main>
</body>
</html>
