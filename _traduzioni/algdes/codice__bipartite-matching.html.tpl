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
    static List&lt;List&lt;Integer&gt;&gt; permessi;   // permessi.get(l) = elementi di R accoppiabili con l
    static int[] partnerR;                  // partnerR[r] = elemento di L accoppiato con r, -1 se libero
    static boolean[] visitato;

    // Cerca un cammino aumentante partendo da l: se un r è libero lo prendo, altrimenti
    // provo a spostare il suo partner su un'altra scelta.
    static boolean prova(int l) {
        for (int r : permessi.get(l)) {
            if (!visitato[r]) {
                visitato[r] = true;
                if (partnerR[r] == -1 || prova(partnerR[r])) {
                    partnerR[r] = l;
                    return true;
                }
            }
        }
        return false;
    }

    public static void main(String[] args) throws IOException {
        BufferedReader in = new BufferedReader(new InputStreamReader(System.in));
        StringTokenizer st = new StringTokenizer(in.readLine());
        int nL = Integer.parseInt(st.nextToken());
        int nR = Integer.parseInt(st.nextToken());
        int m = Integer.parseInt(st.nextToken());

        permessi = new ArrayList&lt;&gt;();
        for (int i = 0; i &lt; nL; i++) {
            permessi.add(new ArrayList&lt;&gt;());
        }
        for (int i = 0; i &lt; m; i++) {
            st = new StringTokenizer(in.readLine());
            permessi.get(Integer.parseInt(st.nextToken())).add(Integer.parseInt(st.nextToken()));
        }

        partnerR = new int[nR];
        Arrays.fill(partnerR, -1);
        int dimensione = 0;
        for (int l = 0; l &lt; nL; l++) {
            visitato = new boolean[nR];
            if (prova(l)) {
                dimensione++;                  // un cammino aumentante: il matching cresce di 1
            }
        }
        System.out.println("matching massimo " + dimensione);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="11"><p>{{s|s007|}}</p></li>
    <li data-righe="13"><p>{{s|s008|}}</p></li>
    <li data-righe="15"><p>{{s|s009|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s010|}}"><ul><li>{{s|s011|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s012|}}</h2>
  <p>{{s|s013|}}</p>
  <pre class="cod">3 3 5
0 0
0 1
1 0
2 1
2 2

(output)
matching massimo 3</pre>
</section>
<section>
  <h2>{{s|s014|}}</h2>
  <p>{{s|s015|}}</p>
</section>

</main>
</body>
</html>
