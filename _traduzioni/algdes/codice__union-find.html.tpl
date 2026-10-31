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
<pre data-lang="java">import java.util.*;

public class Main {
    static int[] padre;
    static int[] dimensione;

    // find: risale alla radice; con path compression collega ogni nodo incontrato alla radice.
    static int find(int x) {
        if (padre[x] != x) {
            padre[x] = find(padre[x]);
        }
        return padre[x];
    }

    // union by size: la radice del gruppo più piccolo va sotto quella del più grande.
    static void union(int x, int y) {
        int rx = find(x);
        int ry = find(y);
        if (rx == ry) {
            return;                       // già nello stesso gruppo
        }
        if (dimensione[rx] &lt; dimensione[ry]) {
            int t = rx;
            rx = ry;
            ry = t;                       // scambio: rx è sempre la radice più grande
        }
        padre[ry] = rx;
        dimensione[rx] += dimensione[ry];
    }

    public static void main(String[] args) {
        int n = 5;                        // nodi 0..4 corrispondono ad a..e
        padre = new int[n];
        dimensione = new int[n];
        for (int i = 0; i &lt; n; i++) {
            padre[i] = i;                 // make-set: ogni nodo è un gruppo
            dimensione[i] = 1;
        }
        union(0, 1);                      // a b
        union(2, 3);                      // c d
        union(0, 2);                      // a c: fonde {a,b} e {c,d}
        System.out.println("find(3) = " + find(3));
        System.out.println("stesso gruppo 3 e 4? " + (find(3) == find(4)));
        System.out.println("padre di 3 dopo find: " + padre[3]);
    }
}</pre>
    <ol class="spiega">
    <li data-righe="10"><p>{{s|s007|}}</p></li>
    <li data-righe="22"><p>{{s|s008|}}</p></li>
    <li data-righe="27"><p>{{s|s009|}}</p></li>
    <li data-righe="28"><p>{{s|s010|}}</p></li>
    </ol>
  </figure>
  <div class="box basi" data-tit="{{a|s011|}}"><ul><li>{{s|s012|}}</li></ul></div>
</section>
<section>
  <h2>{{s|s013|}}</h2>
  <p>{{s|s014|}}</p>
  <pre class="cod">(output)
find(3) = 0
stesso gruppo 3 e 4? false
padre di 3 dopo find: 0</pre>
</section>
<section>
  <h2>{{s|s015|}}</h2>
  <p>{{s|s016|}}</p>
</section>

</main>
</body>
</html>
