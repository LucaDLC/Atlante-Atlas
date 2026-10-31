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
  <div class="occhiello">{{s|s002|}}</div>
  <h1>{{s|s003|}}</h1>
  <p class="lede">{{s|s004|}}</p>
</header>

<section>
  <h2>{{s|s005|}}</h2>
  <div class="tab-wrap"><table class="tab">
    <thead><tr><th>{{s|s006|}}</th><th>{{s|s007|}}</th></tr></thead>
    <tbody>
      <tr><td>{{s|s008|}}</td><td>{{s|s009|}}</td></tr>
      <tr><td>{{s|s010|}}</td><td>{{s|s011|}}</td></tr>
      <tr><td>{{s|s012|}}</td><td>{{s|s013|}}</td></tr>
    </tbody>
  </table></div>
  <div class="box domanda-tua" data-tit="{{a|s014|}}">
    <p>{{s|s015|}}</p>
  </div>
</section>

<section>
  <h2>{{s|s016|}}</h2>
  <ol>
    <li>{{s|s017|}}</li>
    <li>{{s|s018|}}</li>
    <li>{{s|s019|}}</li>
  </ol>
</section>

<section>
  <h2>{{s|s020|}}</h2>
  <p class="piccolo">{{s|s021|}}</p>

  <h3>{{s|s022|}}</h3>
  <p>{{s|s023|}}</p>
  <pre class="cod" data-lang="scala">def count[A](l: List[A])(p: A => Boolean): Int = ???</pre>
  <details class="soluzione"><summary>{{s|s024|}}</summary><div>
    <pre class="cod" data-lang="scala">def count[A](l: List[A])(p: A => Boolean): Int =
  l.foldLeft(0)((acc, a) => if p(a) then acc + 1 else acc)</pre>
    <p>{{s|s025|}}</p>
  </div></details>

  <h3>{{s|s026|}}</h3>
  <p>{{s|s027|}}</p>
  <pre class="cod" data-lang="scala">def lastOption[A](l: List[A]): Option[A] = ???</pre>
  <details class="soluzione"><summary>{{s|s028|}}</summary><div>
    <pre class="cod" data-lang="scala">def lastOption[A](l: List[A]): Option[A] =
  l.foldLeft[Option[A]](None)((_, a) => Some(a))</pre>
    <p>{{s|s029|}}</p>
  </div></details>

  <h3>{{s|s030|}}</h3>
  <p>{{s|s031|}}</p>
  <pre class="cod" data-lang="scala">def filterMap[A, B](l: List[A])(f: A => Option[B]): List[B] = ???
// filterMap(List("1", "x", "3"))(_.toIntOption) == List(1, 3)</pre>
  <details class="soluzione"><summary>{{s|s032|}}</summary><div>
    <pre class="cod" data-lang="scala">def filterMap[A, B](l: List[A])(f: A => Option[B]): List[B] =
  l.foldRight(List.empty[B])((a, acc) => f(a).map(_ :: acc).getOrElse(acc))</pre>
    <p>{{s|s033|}}</p>
  </div></details>

  <h3>{{s|s034|}}</h3>
  <p>{{s|s035|}}</p>
  <details class="soluzione"><summary>{{s|s036|}}</summary><div>
    <pre class="cod" data-lang="scala">def depth[A](t: Tree[A]): Int =
  fold[A, Int](t)((l, r) => 1 + (l max r))(_ => 0)</pre>
    <p>{{s|s037|}}</p>
  </div></details>

  <h3>{{s|s038|}}</h3>
  <p>{{s|s039|}}</p>
  <details class="soluzione"><summary>{{s|s040|}}</summary><div>
    <pre class="cod" data-lang="scala">def forAll[A](o: Option[A])(p: A => Boolean): Boolean =
  o.map(p).getOrElse(true)</pre>
    <p>{{s|s041|}}</p>
  </div></details>

  <h3>{{s|s042|}}</h3>
  <pre class="cod" data-lang="scala">def twice(x: => Int): Int = x + x
def twiceLazy(x: => Int): Int =
  lazy val y = x
  y + y

println(twice({ println("hi"); 1 }))
println(twiceLazy({ println("hi"); 1 }))</pre>
  <details class="soluzione"><summary>{{s|s043|}}</summary><div>
    <pre class="cod">hi
hi
2
hi
2</pre>
    <p>{{s|s044|}}</p>
  </div></details>

  <h3>{{s|s045|}}</h3>
  <p>{{s|s046|}}</p>
  <details class="soluzione"><summary>{{s|s047|}}</summary><div>
    <pre class="cod" data-lang="scala">def iterate[A](a: A)(f: A => A): LazyList[A] =
  unfold(a)(x => Some((x, f(x))))</pre>
    <p>{{s|s048|}}</p>
  </div></details>

  <h3>{{s|s049|}}</h3>
  <p>{{s|s050|}}</p>
  <details class="soluzione"><summary>{{s|s051|}}</summary><div>
    <p>{{s|s052|}}</p>
  </div></details>

  <h3>{{s|s053|}}</h3>
  <p>{{s|s054|}}</p>
  <details class="soluzione"><summary>{{s|s055|}}</summary><div>
    <div class="box inglese" data-tit="{{a|s056|}}">
      <p>{{s|s057|}}</p>
    </div>
  </div></details>
</section>

</main>
</body>
</html>
