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
<pre data-lang="java">class LockFreeStack&lt;T&gt; {
    AtomicReference&lt;Node&lt;T&gt;&gt; top = new AtomicReference&lt;Node&lt;T&gt;&gt;();

    public void push(T value) {
        Node&lt;T&gt; newHead = new Node&lt;T&gt;(value);
        Node&lt;T&gt; oldHead;
        do {
            oldHead      = top.get();
            newHead.next = oldHead;
        } while (!top.compareAndSet(oldHead,newHead));
    }

    public T pop() {
        Node&lt;T&gt; newHead;
        Node&lt;T&gt; oldHead;
        do {
            oldHead = top.get();
            if(oldHead == null) { return null; }
            newHead = oldHead.next;
        } while (!top.compareAndSet(oldHead,newHead));
        return oldHead.value;
    }
}</pre>
    <ol class="spiega">
      <li data-righe="2" data-segna="top@dato"><p>{{s|s007|}}</p></li>
      <li data-righe="7-10" data-segna="top.compareAndSet(oldHead,newHead)@ok"><p>{{s|s008|}}</p></li>
      <li data-righe="16-20" data-segna="top.compareAndSet(oldHead,newHead)@ok"><p>{{s|s009|}}</p></li>
      <li data-righe="17-18" data-segna="oldHead = top.get()@ora|return null;@no"><p>{{s|s010|}}</p></li>
    </ol>
  </figure>
</section>

<section>
  <h2>{{s|s011|}}</h2>
  <p>{{s|s012|}}</p>
  <figure class="passi" data-titolo="{{a|s013|}}" data-legenda="{{a|s014|}}">
    <div class="passo"><div class="espr">Punto 1 (CAS di push)       →  test 7.2.2: n thread fanno push insieme   <mark class="ok">coperto</mark></div><p class="nota">{{s|s015|}}</p></div>
    <div class="passo"><div class="espr">Punto 2 (CAS di pop)        →  test 7.2.3: n thread fanno pop insieme    <mark class="ok">coperto</mark></div><p class="nota">{{s|s016|}}</p></div>
    <div class="passo"><div class="espr">Punto 3 (pop su vuoto)      →  nessun test concorrente                  <mark class="no">non coperto</mark></div><p class="nota">{{s|s017|}}</p></div>
    <div class="passo"><div class="espr">push e pop insieme          →  mai                                      <mark class="no">non coperto</mark></div><p class="nota">{{s|s018|}}</p></div>
  </figure>
  <div class="box domanda-tua" data-tit="{{a|s019|}}">
    <p>{{s|s020|}}</p>
  </div>
  <div class="box idea" data-tit="{{a|s021|}}">
    <p>{{s|s022|}}</p>
    <p>{{s|s023|}}</p>
    <p>{{s|s024|}}</p>
  </div>
  <div class="box attenzione" data-tit="{{a|s025|}}">
    <p>{{s|s026|}}</p>
  </div>
  <div class="box inglese" data-tit="{{a|s027|}}">
    <p>{{s|s028|}}</p>
  </div>
</section>

</main>
</body>
</html>
