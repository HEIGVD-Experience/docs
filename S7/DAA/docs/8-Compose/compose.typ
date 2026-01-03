#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Jetpack Compose",
  course: "DAA - Développement d'applications Android",
  col: 1,
  doc,
)

= Jetpack Compose
- Jetpack Compose est une API déclarative permettant de définir l'UI
- Uniquement disponible en Kotlin
- Basé sur une approche "Qu'est-ce que je veux faire" au lieu de "Comment est-ce que je vais le faire"
- Possibilité de créer des composants UI, réutilisables et facilement testables

Jetpack Compose est un ensemble de librairies, ce qui peut-être difficile de gérer la compatibilité entre les versions. C'est pourquoi Gradle propose l'utilisation d'un Bill of Materials (BOM) pour gérer les versions des dépendances Compose.

== Exemple simple
Une activité doit hériter de `ComponentActivity` et utiliser la fonction `setContent` pour définir l'UI avec Compose.

#himg("S7/DAA/docs/img/image copy 53.png", "Exemple d'une activité avec Jetpack Compose")

== Fonction \@Composable
Les fonctions annotées avec `@Composable` permettent de définir des composants UI. Elles peuvent être imbriquées pour créer des interfaces complexes.

```kotlin
@Composable
fun Hello() {
  Text(text = "Hello world !")
}
// On peut remplacer le contenu de setContent par notre fonction composable
setContent {
  MyComposeApplicationTheme {
    Hello()
  }
}
```

#colbreak()

=== Fonctions avec paramètres
Les fonctions composables peuvent accepter des paramètres pour rendre les composants plus dynamiques.

```kotlin
@Composable
fun Hello(name: String) {
  Text(text = "Hello $name !")
}

setContent {
  MyComposeApplicationTheme {
    Hello(name = "Android")
  }
}
```

#info[
  Une fonction composable peut être exécutée très fréquemment. C'est le cas par exemple pour un composant effectuant une animation (60 fps <=> 16.6 ms)
]

Jetpack Compose permet d'optimiser le processus de recomposition:
- Eviter de recomposer un composant qui ne change pas
- Recompositions en parallèle (multi-threading)

Cela implique qu'une fonction composable doit:
- Être rapide à s'exécuter
- Eviter les effets de bords, en particulier:
  - Ne pas modifier de variables externes
  - Ne pas réaliser d'opérations I/O
- Être idempotente (même entrée => même sortie)

=== Prévisualisation dans Android Studio
Il est possible de prévisualiser une fonction composable directement dans Android Studio en utilisant l'annotation `@Preview`.

#himg("S7/DAA/docs/img/image copy 54.png", "Exemple d'une prévisualisation avec Jetpack Compose")

#colbreak()

== Layout
Les layouts permettent d'organiser les composants UI à l'écran. Jetpack Compose propose plusieurs layouts de base, tels que `Column`, `Row` et `Box`.

#himg("S7/DAA/docs/img/image copy 55.png", "Exemple d'utilisation des layouts Column et Row", width: 80%)

=== Column
Le layout `Column` organise les composants verticalement.

#himg("S7/DAA/docs/img/image copy 56.png", "Exemple d'un layout Column")

La fonction `Column` accepte plusieurs paramètres optionnels pour personnaliser l'agencement des éléments:
- `modifier`: Permet de modifier l'apparence ou le comportement du layout (ex: taille, marges, etc.)
- `verticalArrangement`: Définit l'espacement vertical entre les éléments
- `horizontalAlignment`: Définit l'alignement horizontal des éléments
- `content`: Contient les éléments enfants à afficher dans la colonne

```kotlin
Column(content = {
  Text(text = "Premier élément")
  Text(text = "Deuxième élément")
  Text(text = "Troisième élément")
})
```

#himg("S7/DAA/docs/img/image copy 57.png", "Exemple d'un layout Row")

=== Row
Le layout `Row` organise les composants horizontalement.

#himg("S7/DAA/docs/img/image copy 58.png", "Exemple d'un layout Row")

La fonction `Row` accepte plusieurs paramètres optionnels similaires à ceux de `Column`. Elle propose également:
- `horizontalArrangement`: Définit l'espacement horizontal entre les éléments avec par exemple `Arrangement.SpaceBetween` pour espacer les éléments de manière égale.

== Eléments de base
Jetpack Compose propose plusieurs composants UI de base, tels que `Text`, `Button` et `Image`.

=== Scaffold
Le composant `Scaffold` fournit une structure de base pour une application, incluant des éléments comme la barre d'application, le tiroir de navigation et le bouton d'action flottant.

#himg("S7/DAA/docs/img/image copy 59.png", "Exemple d'un Scaffold avec une TopAppBar et un FloatingActionButton")

Le Scaffold accepte plusieurs paramètres pour personnaliser son apparence et son comportement:
- `topBar`: Permet de définir une barre d'application en haut de l'écran
- `bottomBar`: Permet de définir une barre en bas de l'écran
- `floatingActionButton`: Permet d'ajouter un bouton d'action flottant
- `content`: Contient le contenu principal de l'écran

=== Fonctions composables paresseuses
À la place des ListView ou RecyclerView, il existe les layouts paresseux:
- `LazyColumn`: Pour afficher une liste verticale
- `LazyRow`: Pour afficher une liste horizontale
- `LazyVerticalGrid`: Pour afficher une grille verticale

Ces vues sont scrollables et n'affichent que les éléments visibles à l'écran, ce qui améliore les performances. Cependant, les vues ne sont pas recyclées, elles sont systématiquement recomposées.

#himg("S7/DAA/docs/img/image copy 60.png", "Exemple d'une LazyColumn")

==== Gestion d'événements
Il est possible de gérer des événements sur des actions utilisateurs en utilisant des paramètres de type lambda dans les fonctions composables.

Pour ajouter l'afficahge d'un `toast` lors du clic sur une ligne, nous pouvons redéfinir `MyItem`:

```kotlin
@Composable
fun MyItem(value: String) {
  val context = LocalContext.current
  val androidIcon: Painter = painterResource(id = R.drawable.android_icon)
  Row(modifier = Modifier.fillMaxWidth()
      .height(48.dp)
      .padding(2.dp)
      .clickable {
        Toast.makeText(context, "Vous avez cliqué sur $value", Toast.LENGTH_SHORT).show()
      },
      horizontalArrangement = Arrangement.SpaceBetween,
      verticalAlignment = Alignment.CenterVertically {
        Text(text = value)
        Icon(painter = androidIcon, contentDescription = "Android Icon")
      }  
    )
}
```

= Gestion des états
Pour pouvoir ajouter de l'interactivité (par exemple, un champ textuel de saisie), il est nécessaire de gérer des états dans les fonctions composables. Une interface déclarative nécessite d'appeler à novueau les fonctions composables avec de nouvelles valeurs pour mettre à jour l'UI. L'état d'une fonction composable doit être explicitement mis à jour.

#himg("S7/DAA/docs/img/image copy 61.png", "Gestion des états avec Jetpack Compose")

== State / MutableState
Jetpack Compose propose des classes pour gérer les états:
- `State<T>`: Représente une valeur immuable de type T
- `MutableState<T>`: Représente une valeur mutable de type T, qui peut être modifiée

Le mot clé `remember` permet de conserver la valeur d'un état entre les recompositions d'une fonction composable.

Toute modification d'un `MutableState` déclenche automatiquement la recomposition des fonctions composables qui l'utilisent, ce qui permet de mettre à jour l'UI en fonction des changements d'état. Si la composition n'est plus visible, les valeurs mémorisées sont libérées pour économiser de la mémoire.

#warning[
  - `remember` permet uniquement de garder l'état entre les recompositions successives de la fonction. L'état ne survit pas à la recréation de l'Activité.
  - `rememberSaveable` permet de sauvegarder l'état même lors de la recréation de l'Activité (ex: rotation de l'écran).
]

=== Exemple compteur
```kotlin
@Composable
fun Counter() {
  var counter by remember { mutableStateOf(0) }
  
  Row(modifier = Modifier.fillMaxWidth(),
      horizontalArrangement = Arrangement.SpaceBetween,
      verticalAlignment = Alignment.CenterVertically) {

    Text("$counter")
    Button(onClick = { ++counter }) {
      Text(text = "+")
    }
  }
}
```

=== Exemple TextField
```kotlin
@Composable
fun Editor() {
  var name by remember { mutableStateOf("") }

  Column(modifier = Modifier.fillMaxWidth(),
      horizontalAlignment = Alignment.CenterHorizontally) {

    Text("Bienvenue $name !")
    TextField(value = name, onValueChange = {name = it} )
  }
}
```

== ViewModel et LiveData
L'état d'une fonction composable peut être une LiveData contenue dans un ViewModel, cela permet de réaliser une architecture MVVM. Cette approche permet de séparer la logique métier de l'interface utilisateur et de gérer plus facilement le cycle de vie des données.

=== Examples
#himg("S7/DAA/docs/img/image copy 62.png", "Référence d'un ViewModel dans une fonction composable")

#himg("S7/DAA/docs/img/image copy 63.png", "Exemple d'un ViewModel avec LiveData")

=== Example complet
#himg("S7/DAA/docs/img/image copy 64.png", "Utilisation d'un ViewModel dans une fonction composable")

Le flux d'ecécution est le suivant:
1. L'utilisateur saisit du texte dans le TextField
2. La fonction `changeName()` du ViewModel est appelée pour mettre à jour la LiveData
3. La valeur `_name.value` est modifiée, ce qui déclenche la notification des observateurs
4. `observeeAsState()` détecte le changement et met à jour la variable `name` dans la fonction composable
5. La fonction composable est recomposée avec la nouvelle valeur de `name`, mettant à jour l'UI

== State hoisting
Le State hoisting est un principe de conception dans Jetpack Compose qui consiste à déplacer la gestion de l'état d'un composant vers un composant parent. Cela permet de rendre les composants plus réutilisables et testables en les rendant "stateless" (sans état).

#himg("S7/DAA/docs/img/image copy 65.png", "Exemple de State hoisting")

Les éléments dont l'état a été levé possèdent certaines propriétés intéressantes:
- Single Source of Truth: L'état est géré à un seul endroit, ce qui facilite la maintenance et la compréhension du code.
- Encapsulation: Le composant enfant ne gère pas son propre état, ce qui le rend plus simple et plus réutilisable.
- Interceptable: Les événements peuvent être ignorés
- Partage: L'état peut être partagé entre plusieurs composants enfants.
- Découplage: Le composant enfant est découplé de la logique de gestion de l'état, ce qui facilite les tests unitaires.

=== Problèmes
Pour que le LiveData et Compose détecte les changements d'état, il est nécessaire de créer une nouvelle instance de l'objet d'état (ex: data class) à chaque modification car les objets sont comparés par référence.

On peut alors faire appel à la fonction `copy()` d'une data class pour créer une nouvelle instance avec les modifications souhaitées.

```kotlin
fun changePerson(name : String? = null, firstName : String? = null) {
    val p = _person.value!!.copy()  // On COPIE pour créer une NOUVELLE instance
    if(name != null)
        p.name = name
    if(firstName != null)
        p.firstName = firstName
    _person.postValue(p)  // On poste une NOUVELLE référence
}
```

Pour éviter l'asynchronisme provoquant la désynchronisation des TextFields on va devoir mettre à jour la LiveData directement avec son `value` (setter) au lieu de `postValue()`.

```kotlin
...
    _person.value = p
...
```

== StateFlow
Avec Jetpack Compose, il est recommandé d'utiliser `StateFlow` à la place de `LiveData` pour gérer les états dans les ViewModels. `StateFlow` est une API de flux réactif qui offre plusieurs avantages par rapport à `LiveData`, notamment une meilleure intégration avec les coroutines Kotlin, une gestion plus fine des états et une meilleure performance.

Définir une classe avec StateFlow dans un ViewModel:
```kotlin
class PersonViewModel : ViewModel() {
  private val _person = MutableStateFlow(Person("", ""))

  val person : StateFlow<Person> = _person.asStateFlow()

  fun changePerson(name: String? = null,
                  firstName: String? = null) {

    _person.update { currentPerson ->
      currentPerson.copy(
        name = name ?: currentPerson.name,
        firstName = firstName ?: currentPerson.firstName
      )
    }
  }
}
```

=== StateFlow et Android Room
`StateFlow` peut être utilisé avec Android Room pour observer les changements de données dans une base de données locale. Room prend en charge les flux Kotlin, ce qui permet de récupérer des `Flow` directement à partir des requêtes DAO.

- On peut préciser dans le DAO vouloir le résultat sous forme de `Flow`
```kotlin
@Query("SELECT * FROM Contact")
fun getAllContacts(): Flow<List<Contact>>
```
- Le Repository remonte le Flow
```kotlin
val allContacts: Flow<List<Contact>> = contactsDao.getAllContacts()
```
- Le ViewModel devra transformer le Fow en StateFlow et le lier à son cycle de vie
```kotlin
val allContacts: StateFlow<List<Contact>> = repository.allContacts
    .stateIn(
      scope = viewModelScope,
      started = SharingStarted.WhileSubscribed(5000L),
      initialValue = emptyList<Contact>()
  )
```
- Il pourra ensuite être utilisé comme état dans Compose
```kotlin
val contacts: List<Contact> by contactViewModel.allContacts.collectAsStateWithLifecycle()
```

#himg("S7/DAA/docs/img/image copy 66.png", "Utilisation de StateFlow avec Android Room dans un ViewModel")

= Layout adaptatif
Jetpack Compose propose des outils pour créer des interfaces utilisateur adaptatives qui s'ajustent automatiquement en fonction de la taille et de l'orientation de l'écran.

Il est important que notre application soit utilisable sur différents types d'appareils (téléphones, tablettes, ordinateurs de bureau) et dans différentes orientations (portrait, paysage). Pour cela, nous devons adapter la disposition de notre interface utilisateur en fonction de l'espace disponible.

== Elements racines
Les fonctions racines devront s'adapter à la taille de l'écran. 

#himg("S7/DAA/docs/img/image copy 67.png", "Exemple d'une interface adaptative avec Jetpack Compose")

=== BoxWithConstraints
Le composant `BoxWithConstraints` permet d'obtenir les contraintes de taille disponibles pour son contenu. Il fournit des propriétés telles que `maxWidth`, `maxHeight`, `minWidth` et `minHeight` pour adapter dynamiquement la disposition des éléments enfants en fonction de l'espace disponible.

Cela permet d'écrire du code conditionnel pour ajuster l'interface utilisateur en fonction de la taille de l'écran.

#columns(2)[
```kotlin
@Composable
fun Card(/* ... */) {
  BoxWithConstraints {
    if (maxWidth < 400.dp) {
      Column {
        Image(/* ... */)
        Title(/* ... */)
      }
    } else {
      Row {
        Column {
          Title(/* ... */)
          Description(/* ... */)
        }
        Image(/* ... */)
      }
    }
  }
}
```
#colbreak()
#himg("S7/DAA/docs/img/image copy 68.png", "Exemple d'utilisation de BoxWithConstraints", width: 50%)
]

= Divers
== UI Hybride
De manière générale il est pas du tout recommandé de mélanger les vues traditionnelles Android (XML) avec Jetpack Compose dans une même application. Cependant, il est possible d'intégrer des composants Compose dans une application existante en utilisant des `ComposeView` ou d'inclure des vues Android dans une interface Compose avec `AndroidView`. Souvent l'objectif est de migrer progressivement une application existante vers Compose.

#himg("S7/DAA/docs/img/image copy 69.png", "Intégration de Jetpack Compose dans une application Android existante")