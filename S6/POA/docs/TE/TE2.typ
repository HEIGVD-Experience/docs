#import "/_settings/typst/template-te.typ": *

#show: resume.with(
  "Résumé POA TE2",
  "Guillaume Trüeb",
  cols: 3
)

= Documentation Java Stream API

== Méthodes Stream

=== Méthodes terminales - boolean
- `allMatch(Predicate<? super T> predicate)` | `boolean` \
  _Vérifie si tous les éléments satisfont la condition_
- `anyMatch(Predicate<? super T> predicate)` | `boolean` \
  _Vérifie si au moins un élément satisfait la condition_
- `noneMatch(Predicate<? super T> predicate)` | `boolean` \
  _Vérifie qu'aucun élément ne satisfait la condition_

=== Méthodes intermédiaires - Stream<T>
- `builder()` | `Stream.Builder<T>` \
  _Crée un constructeur de stream_
- `concat(Stream<? extends T> a, Stream<? extends T> b)` | `Stream<T>` \
  _Concatène deux streams en un seul_
- `distinct()` | `Stream<T>` \
  _Élimine les doublons du stream_
- `empty()` | `Stream<T>` \
  _Crée un stream vide_
- `filter(Predicate<? super T> predicate)` | `Stream<T>` \
  _Garde seulement les éléments qui satisfont la condition_
- `generate(Supplier<T> s)` | `Stream<T>` \
  _Génère un stream infini avec une fonction fournisseur_
- `iterate(T seed, UnaryOperator<T> f)` | `Stream<T>` \
  _Génère un stream infini par itération (seed, f(seed), f(f(seed))...)_
- `limit(long maxSize)` | `Stream<T>` \
  _Limite le stream aux n premiers éléments_
- `map(Function<? super T,? extends R> mapper)` | `Stream<R>` \
  _Transforme chaque élément avec la fonction donnée_
- `of(T t)` | `Stream<T>` \
  _Crée un stream d'un seul élément_
- `of(T... values)` | `Stream<T>` \
  _Crée un stream à partir des éléments donnés_
- `peek(Consumer<? super T> action)` | `Stream<T>` \
  _Exécute une action sur chaque élément sans modifier le stream_
- `skip(long n)` | `Stream<T>` \
  _Ignore les n premiers éléments_
- `sorted()` | `Stream<T>` \
  _Trie les éléments dans l'ordre naturel_
- `sorted(Comparator<? super T> comparator)` | `Stream<T>` \
  _Trie les éléments avec le comparateur donné_

=== Méthodes spécialisées
- `collect(Collector<? super T,A,R> collector)` | `R` \
  _Collecte les éléments dans une structure de données (List, Set, Map...)_
- `collect(Supplier<R> supplier, BiConsumer<R,? super T> accumulator, BiConsumer<R,R> combiner)` | `R` \
  _Collecte avec un collecteur personnalisé_
- `flatMap(Function<? super T,? extends Stream<? extends R>> mapper)` | `Stream<R>` \
  _Transforme chaque élément en stream puis les aplatit en un seul stream_
- `flatMapToDouble(Function<? super T,? extends DoubleStream> mapper)` | `DoubleStream` \
  _FlatMap vers un stream de double_
- `flatMapToInt(Function<? super T,? extends IntStream> mapper)` | `IntStream` \
  _FlatMap vers un stream d'entiers_
- `flatMapToLong(Function<? super T,? extends LongStream> mapper)` | `LongStream` \
  _FlatMap vers un stream de long_
- `mapToDouble(ToDoubleFunction<? super T> mapper)` | `DoubleStream` \
  _Transforme en stream de double_
- `mapToInt(ToIntFunction<? super T> mapper)` | `IntStream` \
  _Transforme en stream d'entiers_
- `mapToLong(ToLongFunction<? super T> mapper)` | `LongStream` \
  _Transforme en stream de long_

=== Méthodes terminales - long
- `count()` | `long` \
  _Compte le nombre d'éléments_

=== Méthodes terminales - Optional
- `findAny()` | `Optional<T>` \
  _Trouve un élément quelconque (utile pour les streams parallèles)_
- `findFirst()` | `Optional<T>` \
  _Trouve le premier élément_
- `max(Comparator<? super T> comparator)` | `Optional<T>` \
  _Trouve l'élément maximum selon le comparateur_
- `min(Comparator<? super T> comparator)` | `Optional<T>` \
  _Trouve l'élément minimum selon le comparateur_
- `reduce(BinaryOperator<T> accumulator)` | `Optional<T>` \
  _Réduit le stream en une seule valeur par accumulation_

=== Méthodes - T
- `reduce(T identity, BinaryOperator<T> accumulator)` | `T` \
  _Réduit avec une valeur d'identité (valeur par défaut)_

=== Méthodes - U  
- `reduce(U identity, BiFunction<U,? super T,U> accumulator, BinaryOperator<U> combiner)` | `U` \
  _Réduit avec une valeur d'identité et un combinateur_

=== Méthodes - void
- `forEach(Consumer<? super T> action)` | `void` \
  _Exécute une action sur chaque élément_
- `forEachOrdered(Consumer<? super T> action)` | `void` \
  _Exécute une action sur chaque élément dans l'ordre_

=== Méthodes - Object[]
- `toArray()` | `Object[]` \
  _Convertit le stream en tableau d'objets_
- `toArray(IntFunction<A[]> generator)` | `A[]` \
  _Convertit le stream en tableau du type spécifié_

== Predicate methods
- `and(Predicate<? super T> other)` | `Predicate<T>` \
  _Combine deux prédicats avec un ET logique_
- `isEqual(Object targetRef)` | `Predicate<T>` \
  _Crée un prédicat qui teste l'égalité avec l'objet donné_
- `negate()` | `Predicate<T>` \
  _Inverse le prédicat (NON logique)_
- `or(Predicate<? super T> other)` | `Predicate<T>` \
  _Combine deux prédicats avec un OU logique_
- `test(T t)` | `boolean` \
  _Teste si l'élément satisfait la condition_

== Optional methods

=== Méthodes statiques de création
- `empty()` | `static Optional<T>` \
  _Crée un Optional vide_
- `of(T value)` | `static Optional<T>` \
  _Crée un Optional avec une valeur (ne doit pas être null)_
- `ofNullable(T value)` | `static Optional<T>` \
  _Crée un Optional, vide si la valeur est null_

=== Méthodes de test de présence
- `isPresent()` | `boolean` \
  _Vérifie si une valeur est présente_
- `isEmpty()` | `boolean` \
  _Vérifie si l'Optional est vide_

=== Méthodes d'accès à la valeur
- `get()` | `T` \
  _Récupère la valeur (lance une exception si vide)_
- `orElse(T other)` | `T` \
  _Récupère la valeur ou retourne une valeur par défaut_
- `orElseGet(Supplier<? extends T> supplier)` | `T` \
  _Récupère la valeur ou exécute un fournisseur_
- `orElseThrow()` | `T` \
  _Récupère la valeur ou lance une exception_
- `orElseThrow(Supplier<? extends X> exceptionSupplier)` | `T` \
  _Récupère la valeur ou lance l'exception fournie_

=== Méthodes conditionnelles
- `ifPresent(Consumer<? super T> action)` | `void` \
  _Exécute une action si la valeur est présente_
- `ifPresentOrElse(Consumer<? super T> action, Runnable emptyAction)` | `void` \
  _Exécute une action si présent, sinon exécute l'action vide_

=== Méthodes de transformation
- `map(Function<? super T,? extends U> mapper)` | `Optional<U>` \
  _Transforme la valeur si présente_
- `flatMap(Function<? super T,? extends Optional<? extends U>> mapper)` | `Optional<U>` \
  _Transforme et aplatit l'Optional_
- `filter(Predicate<? super T> predicate)` | `Optional<T>` \
  _Filtre la valeur selon un prédicat_

=== Méthodes de combinaison
- `or(Supplier<? extends Optional<? extends T>> supplier)` | `Optional<T>` \
  _Retourne cet Optional ou l'alternative si vide_

=== Méthodes de conversion
- `stream()` | `Stream<T>` \
  _Convertit l'Optional en Stream_

=== Méthodes héritées d'Object
- `equals(Object obj)` | `boolean` \
  _Teste l'égalité avec un autre objet_
- `hashCode()` | `int` \
  _Retourne le code de hachage_
- `toString()` | `String` \
  _Retourne une représentation textuelle_