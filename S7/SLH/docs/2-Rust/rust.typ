#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Rust",
  course: "SLH - Sécurité logicielle haut niveau",
  author: "Guillaume Trüeb",
  date: "24 octobre 2025",
  toc: false,
  col: 2,
  doc,
)

= Traitement d'Erreurs

== Result< T,E >

Le type `Result` représente une opération qui peut échouer:

```rust
enum Result<T,E> {
  Ok(T),
  Err(E),
}
```

Utilisation basique avec `match`:

```rust
fn do_that(&self) -> Result<Foo, FooException> {
  if self.broken {
    return Err(FooException::EverythingIsBroken)
  }
  Ok(foo)
}
```

== Opérateur ?

Sucre syntaxique pour chaîner les opérations qui peuvent échouer:

```rust
let x = expr_that_can_fail?;
```

Équivalent à:

```rust
let x = match expr_that_can_fail {
  Err(e) => return Err(e.into()),
  Ok(r) => r,
};
```

Permet le chaînage fluide:

```rust
fn do_something(&self) -> Result<(), FooException> {
  self.do_that()?.and_this()?.but_also_that();
  Ok(())
}
```

== Option<T>

Remplace `null` pour marquer l'absence de valeur:

```rust
enum Option<T> {
  None,
  Some(T),
}
```

Méthodes utiles:

- `o.is_some()` / `o.is_none()`
- `o.map(|x| { ... })`
- `o.unwrap_or(default)`
- `o.expect("message")`

== If-let et Let-else

Déstructuration partielle:

```rust
if let Some(x) = maybe_x {
  // using x
}

let Some(x) = maybe_x else { 
  eprintln!("error"); 
  return 42 
}
```

== Librairies d'Erreurs

*Pour les applications:* `anyhow` ou `color-eyre`
- Type d'erreur unifié
- Conversion automatique

*Pour les librairies:* `thiserror`
- Automatise la création d'enums d'erreurs

= Types de Données

== Structures

Trois styles de structures:

```rust
// Named-field
struct Circle {
  x: f64,
  y: f64,
  radius: f64,
}

// Tuple-struct
struct Circle(f64, f64, f64);

// Tuple (anonyme)
let c = (0.5, 0.0, 1.0);
```

Accès: `c.x`, `c.0`

== Représentation Mémoire

Le compilateur réordonne et aligne les champs pour optimiser. Par défaut, la représentation n'est pas garantie.

*Newtypes:* Une struct avec un seul champ a la même représentation que son champ - excellent pour imposer des invariants:

```rust
struct String { vec: Vec<u8> }
```

== Enums

Collection de variants:

```rust
enum Message {
  Quit,
  Move { x: i32, y: i32 },
  Print(String),
}
```

== Pattern Matching

Déconstruction exhaustive:

```rust
match msg {
  Message::Quit => { ... },
  Message::Move { x, y } => { ... },
  Message::Print(text) => { ... },
}
```

Le compilateur exige l'exhaustivité. Captures par référence:

```rust
match &msg {
  Message::Print(text) => { ... } // text: &String
}
```

= Méthodes

Syntaxe spéciale pour dispatch statique sur une variable:

```rust
impl Rectangle {
  fn area(&self) -> u32 {
    self.height * self.width
  }
}

let r = Rectangle { height: 20, width: 30 };
r.area()
```

Plusieurs blocs `impl` peuvent exister pour le même type. Le type `Self` alias le type implémenté.

Paramètres: `self` (prise de propriété), `&self` (emprunt), `&mut self` (emprunt mutable).

= Allocation & Sûreté Mémoire

== Invariants Fondamentaux

*Propriété:* Il existe exactement un chemin propriétaire de chaque ressource.
- Une valeur est copiée ou déplacée selon son type
- La ressource est désallouée quand le propriétaire disparaît

*Exclusivité:* S'il existe un chemin mutable, il n'existe aucun autre chemin actif.
- Élimine les effets de bord inattendus

== Copie vs Déplacement

```rust
let x: i32 = 42;
let y = foo(x); // i32 est copié; x reste actif

let x: Box<i32> = Box::new(42);
let y = foo(x); // Box est déplacé; x est inutilisable
```

== Borrows (Références)

```rust
fn foo(x: &mut i32) { ... }
let x: Box<i32> = Box::new(42);
foo(&mut *x); // Conversion explicite
foo(&mut x);  // Autoderef appliqué automatiquement
```

Mode facile Rust:
- Pas de références en valeur de retour
- Pas de références dans des structs
- Clone si nécessaire

= Lifetimes

== Problème des Pointeurs

Le type d'une valeur ne change pas avec le temps. Mais avec les pointeurs, c'est faux:

```
let r;
{
  let x: usize = ...;
  r = &x; // x disparaît à la fin du bloc
}
println!("{}", *r); // r pointe sur une donnée libérée!
```

== Notation des Lifetimes

Intègre au système de types la notion de temps pour les références:

```rust
// C
size_t * const ptr;

// Rust
ptr: &'p mut usize
```

Fonctionne comme un générique: `&'p usize ≈ Ref<'p, usize>`

== Règles Clés

- Une référence ne peut pas sortir du bloc contenant la variable référée
- Pour `&x`: `x` doit survivre à la lifetime, `x` perd `mut`
- Pour `&mut x`: `x` doit être `mut`, `x` est inutilisable pendant la lifetime

== Exemple: strip_prefix()

```rust
fn strip_prefix<'s>(s: &'s str, prefix: &str) -> Option<&'s str> { ... }
```

Le type de retour est lié à la durée de vie du premier argument.

== Structures Génériques

```rust
enum Json<'s> {
  Int(i64),
  String(&'s str),
  Array(Vec<Json<'s>>),
}
```

== Élision des Lifetimes

Peuvent être omis quand:
- Sur une variable (toujours inféré)
- Type de retour avec un seul lifetime générique
- Méthode prenant `&self` ou `&mut self`

= Closures

== Traits Fn

Hiérarchie basée sur comment on utilise l'environnement:

```
fn : Fn : FnMut : FnOnce
```

- `Fn(&self)`: Pas d'utilisation mut de l'environnement
- `FnMut(&mut self)`: Pas de consommation de l'environnement
- `FnOnce(self)`: Peut être appelée qu'une seule fois

== Closures en Arguments

Chaque closure est un type unique:

```rust
fn map<B, F>(self, f: F) -> impl Iterator<Item=B>
where F: FnMut(Self::Item) -> B
```

== Closures move

`move` transfère la propriété de l'environnement vers la closure (pendant sa construction):

```rust
let env: Environment = { ... };
let tx = tx.clone();
thread::spawn(move || { do_some_work(env, tx) })
```

= Concurrence

== Threads

```rust
use std::thread;
let handle = thread::spawn(|| {
  for i in (1..100) {
    println!("thread 1 = {i}");
  }
});
handle.join()?;
```

Signature:

```rust
pub fn spawn<F, T>(f: F) -> JoinHandle<T>
where
  F: FnOnce() -> T + Send + 'static,
  T: Send + 'static,
```

- `F` est `FnOnce` car le thread démarre une seule fois
- `F` et `T` doivent être `'static` (pas de références non-'static)

== Send & Sync

- *Send:* Peut être déplacé sans danger d'un thread à un autre
- *Sync:* Peut être accédé sans danger depuis plusieurs threads simultanément
  - `T: Sync ⟺ &T: Send`

== Arc & Mutex

`std::sync::Arc`: Atomic Reference Counter

```rust
pub fn new(data: T) -> Arc<T>;
pub fn clone(&self) -> Self; // Clone l'Arc, pas les données
pub fn deref(&self) -> &T;
```

`std::sync::Mutex`: Mutual Exclusion

```rust
pub const fn new(t: T) -> Mutex<T>;
pub fn lock(&self) -> LockResult<MutexGuard<'_,T>>;
```

== Message Passing

`std::sync::mpsc`: Multiple-Producer Single-Consumer

```rust
pub fn channel<T>() -> (Sender<T>, Receiver<T>);
pub fn Sender::send(&self, t:T) -> Result<(),SendError<T>>;
pub fn Receiver::recv(&self) -> Result<T, RecvError>;
```

- `Sender` est `Clone` (Arc en interne)
- `Receiver` n'est pas `Sync`

= Modules & Crates

== Crates vs Modules

- *Crate:* Unité de compilation
- *Module:* Organisation du code, crée des namespaces

== Versionage Sémantique

`MAJOR.MINOR.PATCH`:

- *Majeur:* Changements incompatibles
- *Mineur:* Nouvelles fonctionnalités (compatibles)
- *Patch:* Corrections sans changement d'API

Dépendance `X.Y` = `(MAJOR = X) ∧ (MINOR ≥ Y)`

== Modules

En ligne:

```rust
mod tests {
  fn foo() { ... }
}
```

Ou dans un fichier:

```rust
mod tests; // tests.rs ou tests/mod.rs
```

== Visibilité

- *Privé par défaut:* Accessible depuis le module et ses enfants
- *`pub`*: Accessible de partout
- *`pub(crate)`*: Accessible dans toute la crate

`use` pour importer dans le scope:

```rust
use std::io::Result;
use std::{io, cmp::Ordering};
use std::io::Result as IOR;
```

= Traits

== Définition

Collection de méthodes abstraites et concrètes:

```rust
trait Vehicle {
  fn drive(&mut self);
  fn honk(&self) { println!("Bip bip"); }
}
```

== Implémentation

```rust
struct Car { position: u8 }
impl Vehicle for Car {
  fn drive(&mut self) { ... }
}
```

== Traits comme Marqueurs

Certains traits n'ont pas de méthodes, seulement un rôle de marqueur:

- `Copy`: Type peut être copié (shallow)
- `Sized`: Taille connue à la compilation
- `Send`: Thread-safe pour être envoyé entre threads
- `Sync`: Thread-safe pour être partagé entre threads

= Génériques

== Syntaxe

```rust
fn hello<V: Vehicle>(v: V) { ... }
struct Container<T> { data: T }
trait Motor<D: Driver> { ... }
```

Contrainte par un ou plusieurs traits.

== Traits Génériques

```rust
trait From<T>: Sized {
  fn from(value: T) -> Self;
}

impl From<&str> for String { ... }
impl<T> From<T> for Box<T> { ... }
```

== Types Unitaires pour Statique

Une struct sans champs existe seulement à la compilation:

```rust
struct Public;
struct Secret;

struct Actor<S> {
  access: S,
}

impl Actor<Secret> {
  fn write_confidential(self) -> Actor<Public> { ... }
}
```

== Types Fantômes

Un générique non utilisé par la structure:

```rust
struct Key<T: RedisType>(String, PhantomData<T>);
```

== Iterator

```rust
trait Iterator {
  type Item;
  fn next(&mut self) -> Option<Self::Item>;
  fn count(self) -> usize { ... }
  fn zip<U: Iterator>(self, other: U) -> Zip<Self,U> { ... }
}
```

== Types Associés

Types choisis en fonction de l'implémentation:

```rust
trait Iterator {
  type Item;
  fn next(&mut self) -> Option<Self::Item>;
}
```

vs générique où type est choisi à l'appel.

== Dispatch Dynamique

`dyn Vehicle` représente une implémentation dynamique du trait:

```rust
let v: &dyn Vehicle = &car;
let v: Box<dyn Vehicle> = Box::new(car);
```

Rarement utilisé directement, fonctionne via référence/pointeur.

== Résolution de Conflits

Deux traits avec la même méthode? Solution Rust avec namespaces:

```rust
<Car as Vehicle>::drive(&car)
```

== Règle des Orphelins

Une implémentation de trait `T for Type` doit avoir:
- `T` défini dans cette crate, OU
- `Type` défini dans cette crate

Évite l'"action à distance".

== impl dans les Signatures

Sucre pour générique implicite en argument:

```rust
fn f(&self, drivable: &impl Vehicle) { ... }
// Équivalent à:
fn f<V: Vehicle>(&self, vehicle: &V) { ... }
```

En retour, rend le type opaque (existe vraiment un type unique):

```rust
fn f(&self) -> impl Vehicle { ... }
```

= Tableaux, Vecteurs & Slices

== Tableaux

Taille constante, éléments contigus:

```rust
let foo: [usize; 4] = [1, 3, 2, 4];
let bar: [i32; 20] = [-1; 20];
```

Accès: `foo[1]`, `foo.get(5)` retourne `Option`

== Vecteurs

Taille variable, allouée sur le heap:

```rust
let foo: Vec<usize> = vec![1, 3, 2, 4];
foo.push(42);
let x = foo.pop(); // Option
```

Représentation: 3 mots (pointeur, longueur, capacité)

== Slices

Suite contigue d'éléments, longueur connue en runtime:

```rust
&[T]     // Fat pointer (ptr + len)
&mut [T] // Fat pointer mutable
```

Construction:

```rust
let xs = [0,1,2,3,4];
let slice = &xs[1..3];    // &[1, 2]
let slice = &xs[2..];     // &[2,3,4]
```

== Bonnes Pratiques

- Jamais `&Vec<T>` en argument; utiliser `&[T]`
- `&mut Vec<T>` est ok, différent de `&mut [T]`

= Strings

== Types String

- `str`: Équivalent à `[u8]`, doit être UTF-8 valide
- `&str`: Référence, immutable
- `String`: Équivalent à `Vec<u8>`
- `char`: Point de code UTF-8 (32 bits)

*Pas de terminateur NUL.*

== Littéraux

Stockés dans `.data`, immutables, type `&str`:

```rust
const HELLO: &str = "Hello World!";
const QUOTE: &str = r#"we "quote" hehe"#;
const BYTES: &[u8] = b"\xE9";
```

== Allocation

Toujours sur la heap:

```rust
let x = String::from(HELLO);
let x = HELLO.to_string();
let x = HELLO.to_owned();
let x: String = HELLO.into();
```

== Concaténation

```rust
let mut buf: String = "abcd".into();
buf += "efgh";
buf = format!("{}{}", buf, "efgh");
```

== Méthodes Utiles

- `.len()`: Longueur EN BYTES
- `.chars().count()`: Nombre de points de code (O(n))
- `.as_bytes()`: &str → &[u8]
- `.trim()`, `.split()`, ...

Pas d'indexation directe (à cause d'UTF-8).

= Tests & Documentation

== Tests Unitaires

Attribut `#[test]` pour les fonctions de test:

```rust
#[test]
fn my_test() {
  assert_eq!(42, answer());
}
```

Exécution: `cargo test`

`#[cfg(test)]` pour code exclusif aux tests.

Tests d'intégration dans le répertoire `tests/`.

== Doc-comments

Commentaires de documentation:

```rust
/// Une matrice n-by-n
///
/// Elle utilise un [`Vec`] en interne.
struct Matrix { ... }
```

Génération avec `cargo doc`.

== Doctests

Exemples dans la documentation qui sont aussi testés:

```rust
///
/// let a = identity(2);
/// assert_eq!(matsum(a), Ok(...))
///
pub fn matsum(a: &Matrix) { ... }
```