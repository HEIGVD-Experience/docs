@main def hello(): Unit =
  var nom: String = ""
  var prenom: String = ""

  nom = "Trueb"
  prenom = "Guillaume"

  // immutable values
  val dateDeNaissance: String = "31.02.2000"

  val message: String = "Bonjour, je m'appelle " + prenom + " " + nom + " et je suis né le " + dateDeNaissance

  println(message)

  var count: Int = 1

  while(count <= 5) {
    println(count + " - " + message)
    count += 1
  }

  println("------------------")

  for(i <- 1 to 5) {
    println(i + " - " + message)
  }

  println("------------------")

  for(i <- 1 until 6) {
    println(i + " - " + message)
  }

  println("------------------")

  for(i <- 0 to 4) {
    if (i == 0) {
      println(i + " - " + nom)
    } else {
      println(i + " - " + prenom)
    }
  }

  println("------------------")

  for(i <- 0 to 4) {
    i match
      case 0 => println(i + " - " + nom)
      case _ => println(i + " - " + prenom)
  }

  println("------------------")

  count = 1
  while(count <= 100) {
    if(count % 2 == 1 && (count % 3 == 0 || count % 5 == 0)) {
      print(count + " ")
    }
    count += 1
  }

  println("\n")

  for(i <- 1 to 100 if i % 2 == 1 && (i % 3 == 0 || i % 5 == 0)) print(i + " ")

  println("\n-------------------")

  def func (x: Int, y: Int): Int = if (x > y) x else y

  println(func(3,5))

  println("-------------------")

  def func2 (s: String): String = {
    s match
      case "Hello" => "World"
      case "World" => "Hello"
      case _ => "Goodbye"
  }

  println(func2("Hello"))
  println(func2("World"))
  println(func2("Scala"))

  println("-------------------")

  for(i <- 1 to 48) println("Hello World ")

  println("-------------------")

  val s14: String = "Hello World!"
  val result14: String = s14 match
    case str if str.length % 2 == 1 => str.length.toString
    case "Hello World!" => "Hello World!"
    case _ => "Goodbye"
  println(result14)

  println("-------------------")

  var compteur: Int = 0
  var iterations: Int = 0
  while (compteur < 10) {
    compteur match
      case c if c % 2 == 0 => compteur += 3
      case _ => compteur += 1
    iterations += 1
  }
  println("iterations=" + iterations + ", compteur=" + compteur)

  println("-------------------")

  def func16(x: Int): Int = x match
    case v if v > 100 => v
    case v if v % 7 == 0 => func16(v + 8)
    case v if v % 2 == 1 => func16(v + 12)
    case v => func16(v + 1)

  val x16: Int = 0
  val result16: Int = func16(x16)
  println("result16=" + result16 + ", x16=" + x16)

  println("-------------------")

  def func17(x: Int, y: Int, z: Int): Int = z match
    case 0 => (x * x + y * y) + ((x + y) * (x + y))
    case v if v % 2 == 0 => x * x + y * y
    case _ => (x + y) * (x + y)

  println("z=1 => " + func17(2, 3, 1))
  println("z=2 => " + func17(2, 3, 2))
  println("z=0 => " + func17(2, 3, 0))

  println("-------------------")

  def func18Bool(x: Int, y: Int): Int =
    if (x == y && y == 0) 42
    else if (x == y) x
    else if (x < y && x > 4) 2 * x
    else if (x < y) y
    else if (x % 2 == 1) 2 * x + 3 * y
    else if (y % 2 == 1 && x % 2 == 0) 4 * x - 7 * y
    else if (x % 3 == 0 && y % 4 == 0) x * x + y * y * y
    else 9

  def func18Match(x: Int, y: Int): Int = (x, y) match
    case (a, b) if a == b && b == 0 => 42
    case (a, b) if a == b => a
    case (a, b) if a < b && a > 4 => 2 * a
    case (a, b) if a < b => b
    case (a, b) if a % 2 == 1 => 2 * a + 3 * b
    case (a, b) if b % 2 == 1 && a % 2 == 0 => 4 * a - 7 * b
    case (a, b) if a % 3 == 0 && b % 4 == 0 => a * a + b * b * b
    case _ => 9

  println(func18Bool(0, 0))
  println(func18Bool(5, 5))
  println(func18Bool(6, 9))
  println(func18Bool(3, 8))
  println(func18Bool(7, 2))
  println(func18Bool(4, 7))
  println(func18Bool(6, 8))
  println(func18Bool(2, 3))

  println(func18Match(0, 0))
  println(func18Match(5, 5))
  println(func18Match(6, 9))
  println(func18Match(3, 8))
  println(func18Match(7, 2))
  println(func18Match(4, 7))
  println(func18Match(6, 8))
  println(func18Match(2, 3))

  println("-------------------")

  def fibSum(n: Int): Long =
    var a: Long = 0
    var b: Long = 1
    var sum: Long = 0
    var i: Int = 0
    while (i < n) {
      sum += a
      val next = a + b
      a = b
      b = next
      i += 1
    }
    sum

  println("fibSum(20)=" + fibSum(20))