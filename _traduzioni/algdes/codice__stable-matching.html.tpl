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

        // pref[p][k] = k-esimo ricevente preferito da p (0 = il migliore).
        int[][] pref = new int[n][n];
        for (int p = 0; p &lt; n; p++) {
            StringTokenizer st = new StringTokenizer(in.readLine());
            for (int k = 0; k &lt; n; k++) {
                pref[p][k] = Integer.parseInt(st.nextToken());
            }
        }
        // rango[r][p] = posizione di p nella lista di r: più piccolo vuol dire più gradito.
        int[][] rango = new int[n][n];
        for (int r = 0; r &lt; n; r++) {
            StringTokenizer st = new StringTokenizer(in.readLine());
            for (int k = 0; k &lt; n; k++) {
                rango[r][Integer.parseInt(st.nextToken())] = k;
            }
        }

        int[] prossimo = new int[n];      // prossimo[p]: prossima posizione nella lista di p
        int[] partnerDi = new int[n];     // partnerDi[r] = proponente accettato da r, -1 se libero
        Arrays.fill(partnerDi, -1);
        int[] partnerOf = new int[n];     // partnerOf[p] = ricevente di p, -1 se libero
        Arrays.fill(partnerOf, -1);

        Deque&lt;Integer&gt; liberi = new ArrayDeque&lt;&gt;();
        for (int p = 0; p &lt; n; p++) {
            liberi.add(p);
        }

        while (!liberi.isEmpty()) {
            int p = liberi.poll();
            int r = pref[p][prossimo[p]++];      // propone al ricevente successivo della sua lista
            if (partnerDi[r] == -1) {            // r è libero: accetta
                partnerDi[r] = p;
                partnerOf[p] = r;
            } else if (rango[r][p] &lt; rango[r][partnerDi[r]]) {  // r preferisce p al partner attuale
                int vecchio = partnerDi[r];
                partnerOf[vecchio] = -1;
                liberi.add(vecchio);          // il vecchio partner torna libero
                partnerDi[r] = p;
                partnerOf[p] = r;
            } else {
                liberi.add(p);                // r rifiuta: p resta libero e propone altrove
            }
        }

        StringBuilder out = new StringBuilder();
        for (int p = 0; p &lt; n; p++) {
            out.append(p).append(" - ").append(partnerOf[p]).append('\n');
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="10"><p>{{s|s007|}}</p></li>
    <li data-righe="22"><p>{{s|s008|}}</p></li>
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
        int n = Integer.parseInt(in.readLine().trim());

        // pref[p][k] = k-esimo ricevente preferito da p (0 = il migliore).
        int[][] pref = new int[n][n];
        for (int p = 0; p &lt; n; p++) {
            StringTokenizer st = new StringTokenizer(in.readLine());
            for (int k = 0; k &lt; n; k++) {
                pref[p][k] = Integer.parseInt(st.nextToken());
            }
        }
        // rango[r][p] = posizione di p nella lista di r: più piccolo vuol dire più gradito.
        int[][] rango = new int[n][n];
        for (int r = 0; r &lt; n; r++) {
            StringTokenizer st = new StringTokenizer(in.readLine());
            for (int k = 0; k &lt; n; k++) {
                rango[r][Integer.parseInt(st.nextToken())] = k;
            }
        }

        int[] prossimo = new int[n];      // prossimo[p]: prossima posizione nella lista di p
        int[] partnerDi = new int[n];     // partnerDi[r] = proponente accettato da r, -1 se libero
        Arrays.fill(partnerDi, -1);
        int[] partnerOf = new int[n];     // partnerOf[p] = ricevente di p, -1 se libero
        Arrays.fill(partnerOf, -1);

        Deque&lt;Integer&gt; liberi = new ArrayDeque&lt;&gt;();
        for (int p = 0; p &lt; n; p++) {
            liberi.add(p);
        }

        while (!liberi.isEmpty()) {
            int p = liberi.poll();
            int r = pref[p][prossimo[p]++];      // propone al ricevente successivo della sua lista
            if (partnerDi[r] == -1) {            // r è libero: accetta
                partnerDi[r] = p;
                partnerOf[p] = r;
            } else if (rango[r][p] &lt; rango[r][partnerDi[r]]) {  // r preferisce p al partner attuale
                int vecchio = partnerDi[r];
                partnerOf[vecchio] = -1;
                liberi.add(vecchio);          // il vecchio partner torna libero
                partnerDi[r] = p;
                partnerOf[p] = r;
            } else {
                liberi.add(p);                // r rifiuta: p resta libero e propone altrove
            }
        }

        StringBuilder out = new StringBuilder();
        for (int p = 0; p &lt; n; p++) {
            out.append(p).append(" - ").append(partnerOf[p]).append('\n');
        }
        System.out.print(out);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="39"><p>{{s|s014|}}</p></li>
    <li data-righe="43"><p>{{s|s015|}}</p></li>
    <li data-righe="46"><p>{{s|s016|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s017|}}"><ul><li>{{s|s018|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s019|}}</h2>
  <p>{{s|s020|}}</p>
  <pre class="cod">3
0 1 2
1 0 2
0 1 2
2 0 1
0 1 2
0 1 2

(output: proponente - ricevente)
0 - 1
1 - 2
2 - 0</pre>
</section>
<section>
  <h2>{{s|s021|}}</h2>
  <p>{{s|s022|}}</p>
</section>

</main>
</body>
</html>
