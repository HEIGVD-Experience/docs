#import "/_settings/typst/template-te.typ": *
#show: resume.with(
  "Résumé DAA TE2",
  "Guillaume Trüeb",
  cols: 2
)

= Threads & Coroutines

== Threads

*UI-Thread et opérations bloquantes*
- Thread principal responsable de l'UI, ne doit jamais être bloqué
- Opérations réseau → exception si sur UI-Thread
- Opérations longues → thread séparé obligatoire

#image("../img/image copy 33.png", width: 80%)

*Handler*
- Communication entre threads
- Post tâches sur thread principal depuis background
```kotlin
val handler = Handler(Looper.getMainLooper())
handler.post { myImage.setImageBitmap(bmp) }
```

*runOnUiThread dans Activity*
```kotlin
runOnUiThread { myImage.setImageBitmap(bmp) }
```

*Limites des threads*
- Non conscients du cycle de vie Android
- Risque de fuites mémoire (références Activity)
- Gestion concurrence complexe
- Solution : WeakReference pour éviter memory leaks

== Coroutines

*Caractéristiques*
- Unité légère d'exécution asynchrone
- Suspendent/reprennent sans bloquer thread
- Code asynchrone séquentiel (lisible)
- Mot-clé `suspend`
- Coroutine = partage de threads

*Suspending vs Bloquantes* : Fonctions *suspendues* libèrent le thread pendant l'attente (améliore réactivité), fonctions *bloquantes* empêchent le thread de continuer. L'approche `suspended` permet d'écrire du *code asynchrone* de manière *séquentielle*, facilitant la lecture et la maintenance.

Exemple :
```kotlin
suspend fun downloadImage(url: String): ByteArray {
  return withContext(Dispatchers.IO) {
    URL(url).readBytes() // bloquant mais hors UI-Thread
  }
}
```

*Dispatchers*
Associe une tâche à un thread ou pool de threads spécifique.
- *`Dispatchers.Main`* : UI thread
- *`Dispatchers.IO`* : I/O (réseau, fichiers, DB) - max 64 threads
- *`Dispatchers.Default`* : calculs CPU - nbr threads = nbr coeurs

#image("../img/image copy 37.png", width: 90%)
#image("../img/image copy 38.png", width: 90%)

*Scopes*
Les scopes permettent de limiter la durée de vie des coroutines à un contexte spécifique.
- *`GlobalScope`* : scope application (éviter, memory leaks)
- *`lifecycleScope`* : lié Activity/Fragment, auto-stop
- *`viewModelScope`* : lié ViewModel

```kotlin
lifecycleScope.launch {
  val bytes = downloadImage(url)
  val bmp = decodeImage(bytes)
  displayImage(bmp)
}
```

*delay vs Thread.sleep*
- `delay()` : suspend coroutine, libère thread
- `Thread.sleep()` : bloque thread

== WorkManager

*Usage*
- Tâches longues/périodiques garanties
- Survit fermeture app et redémarrage
- Contraintes : réseau, batterie, stockage

#image("../img/image copy 39.png")

*Mode Doze*
- Économie batterie : tâches différées
- Fenêtres activité contrôlées par système
- Classification apps : Active, Working set, Frequent, Rare, Restricted

#image("../img/image copy 40.png")

*Implémentation*
```kotlin
class MyWork(appContext: Context, workerParams: WorkerParameters) : Worker(appContext, workerParams) {
  override fun doWork(): Result {
    // tâche
    return Result.success()
  }
}

val workManager = WorkManager.getInstance(applicationContext)
val myWorkRequest = OneTimeWorkRequestBuilder<MyWork>().build()
workManager.enqueue(myWorkRequest)
```

#image("../img/image copy 41.png", width: 80%)

= Communication Web

== Connectivité

*Technologies*
- Wi-Fi : 2.4 GHz (portée) vs 5 GHz (débit)
- Réseaux mobiles : 2G, 3G, 4G, 5G

#image("../img/image copy 42.png", width: 90%)
#image("../img/image copy 43.png", width: 90%)

*Permissions*
```kotlin
<uses-permission android:name="android.permission.INTERNET" />
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
```

== Services REST

*Appel GET avec java.net.URL*
```kotlin
val url = URL("https://api.example.com/data")
thread {
  val json = url.readText(Charsets.UTF_8)
}
```

*Désérialisation JSON avec Gson*
```kotlin
val type = object : TypeToken<List<FruitDTO>>() {}.type
val fruits = Gson().fromJson<List<FruitDTO>>(json, type)
```

*Appel POST/PUT*
```kotlin
val connection = url.openConnection() as HttpURLConnection
connection.requestMethod = "PUT"
connection.doOutput = true
connection.setRequestProperty("Content-Type", "application/json")
connection.outputStream.bufferedWriter(Charsets.UTF_8).use {
  it.append(Gson().toJson(newFruit))
}
val responseCode = connection.responseCode
```

#warning[
- Méthodes synchrones/bloquantes
- Connexion lors de `outputStream`, `inputStream` ou `responseCode`
- Réutilisation automatique connexion
]

*Alternatives* : OkHttp, Volley, Retrofit (planification, annulation, cache, retry, sérialisation)

== Comparaison java.net.URL vs Volley

#image("../img/image copy 44.png")
#image("../img/image copy 45.png")
#image("../img/image copy 46.png")

*java.net.URL avec coroutines*
```kotlin
suspend fun downloadHTML(urlParam: String): String = withContext(Dispatchers.IO) {
  URL(urlParam).readText(Charsets.UTF_8)
}
```

*Volley avec coroutines*
```kotlin
suspend fun downloadHTMLVolley(urlParam: String): String = suspendCoroutine { cont ->
  val textRequest = StringRequest(Request.Method.GET, urlParam,
    { response -> cont.resume(response) },
    { e -> cont.resumeWithException(e) })
  queue.add(textRequest)
}
```

== Ktor

Framework asynchrone client/serveur pour HTTP.

#image("../img/image copy 47.png")

= Synchronisation données

*Contexte*
- App fonctionne hors-ligne
- DB locale synchronisée avec serveur
- Algorithme sync complexe (conflits multiples devices)

*Structure DB locale*
- `id` : identifiant local unique
- `remoteId` : identifiant serveur (null si nouveau)
- `status` : ok, new, mod, del

#image("../img/image copy 48.png", width: 80%)
#image("../img/image copy 49.png", width: 80%)

*Création locale*
```
status = new, remoteId = null
→ Sync : POST → remoteId reçu, status = ok
```

#image("../img/image copy 50.png", width: 80%)

*Modification*
```
status = mod
→ Sync : PUT
```

#image("../img/image copy 51.png", width: 80%)

*Suppression*
```
status = del
→ Sync : DELETE
```

#image("../img/image copy 52.png", width: 80%)

*Single Source of Truth (SSOT)*
- DB locale = source unique de vérité
- Repository gère sync
- UI observe DB uniquement
- Pattern offline-first

= Jetpack Compose

*Caractéristiques*
- API déclarative pour UI (Kotlin uniquement)
- Approche "Quoi" vs "Comment"
- Composants réutilisables et testables
- BOM pour gestion versions

#image("../img/image copy 53.png", width: 80%)

== Fonctions \@Composable

*Règles importantes*
- Exécution très fréquente (animations 60fps)
- Optimisation recomposition automatique
- Doit être rapide, sans effets de bord
- Idempotente (même entrée = même sortie)
- Éviter I/O et modifications externes

*Prévisualisation*
```kotlin
@Preview
@Composable
fun Hello(name: String = "World") {
  Text(text = "Hello $name!")
}
```

#image("../img/image copy 54.png", width: 70%)

== Layouts

*Column*
```kotlin
Column(
  verticalArrangement = Arrangement.SpaceBetween,
  horizontalAlignment = Alignment.CenterHorizontally
) {
  Text("Élément 1")
  Text("Élément 2")
}
```

#image("../img/image copy 56.png", width: 80%)

*Row*
```kotlin
Row(
  horizontalArrangement = Arrangement.SpaceBetween,
  verticalAlignment = Alignment.CenterVertically
) { }
```

#image("../img/image copy 58.png", width: 80%)

== Composants de base

*Scaffold*
```kotlin
Scaffold(
  topBar = { TopAppBar(...) },
  floatingActionButton = { FloatingActionButton(...) },
  content = { }
)
```

#image("../img/image copy 59.png", width: 80%)

*Listes paresseuses*
- `LazyColumn` : liste verticale
- `LazyRow` : liste horizontale
- `LazyVerticalGrid` : grille

#image("../img/image copy 60.png", width: 80%)

*Gestion événements*
```kotlin
Row(modifier = Modifier.clickable {
  Toast.makeText(context, "Cliqué", Toast.LENGTH_SHORT).show()
}) { }
```

== Gestion états

*State / MutableState*
- `remember` : conserve état entre recompositions
- `rememberSaveable` : survit recréation Activity

#image("../img/image copy 61.png", width: 80%)

*Compteur*
```kotlin
@Composable
fun Counter() {
  var counter by remember { mutableStateOf(0) }
  Button(onClick = { ++counter }) {
    Text("+")
  }
  Text("$counter")
}
```

*TextField*
```kotlin
@Composable
fun Editor() {
  var name by remember { mutableStateOf("") }
  TextField(value = name, onValueChange = {name = it})
}
```

== ViewModel et LiveData

#image("../img/image copy 62.png", width: 80%)
#image("../img/image copy 63.png", width: 80%)

*Flux exécution*
1. Saisie TextField
2. Appel `changeName()` ViewModel
3. Modification `_name.value`
4. `observeAsState()` détecte changement
5. Recomposition avec nouvelle valeur

#image("../img/image copy 64.png", width: 80%)

== State Hoisting

Déplacer gestion état vers composant parent.

*Avantages*
- Single Source of Truth
- Encapsulation
- Interceptable
- Partage entre composants
- Découplage (facilite tests)

#image("../img/image copy 65.png", width: 80%)

#warning[
Créer nouvelle instance avec `copy()` pour détecter changements (comparaison par référence).
]

== StateFlow

Recommandé avec Compose à la place de LiveData.

*ViewModel*
```kotlin
class PersonViewModel : ViewModel() {
  private val _person = MutableStateFlow(Person("", ""))
  val person: StateFlow<Person> = _person.asStateFlow()
  
  fun changePerson(name: String? = null, firstName: String? = null) {
    _person.update { currentPerson ->
      currentPerson.copy(
        name = name ?: currentPerson.name,
        firstName = firstName ?: currentPerson.firstName
      )
    }
  }
}
```

*Room avec StateFlow*
```kotlin
// DAO
@Query("SELECT * FROM Contact")
fun getAllContacts(): Flow<List<Contact>>

// Repository
val allContacts: Flow<List<Contact>> = contactsDao.getAllContacts()

// ViewModel
val allContacts: StateFlow<List<Contact>> = repository.allContacts
  .stateIn(
    scope = viewModelScope,
    started = SharingStarted.WhileSubscribed(5000L),
    initialValue = emptyList()
  )

// Compose
val contacts by contactViewModel.allContacts.collectAsStateWithLifecycle()
```

#image("../img/image copy 66.png", width: 80%)

== Layout adaptatif

*BoxWithConstraints*
```kotlin
@Composable
fun Card() {
  BoxWithConstraints {
    if (maxWidth < 400.dp) {
      Column { /* Layout mobile */ }
    } else {
      Row { /* Layout tablette */ }
    }
  }
}
```

#image("../img/image copy 67.png")
#image("../img/image copy 68.png", width: 70%)

*UI Hybride*
- Possible mais non recommandé
- `ComposeView` : Compose dans XML
- `AndroidView` : XML dans Compose
- Usage : migration progressive

#image("../img/image copy 69.png", width: 80%)

= Tests automatisés

*3 types*
- *Tests unitaires* : classes/méthodes individuelles
- *Tests d'intégration* : interactions composants
- *Tests bout en bout* : comportement utilisateur

== Tests unitaires (JUnit)

```kotlin
class CalculatorTest {
  private val calculator = Calculator()
  
  @Test
  fun testPow() {
    assertEquals(8.0, calculator.pow(2.0, 3.0), 0.001)
  }
  
  @Test
  fun testFactorial() {
    assertEquals(120, calculator.factorial(5))
  }
}
```

== Tests instrumentalisés

*Configuration*
- `@RunWith(AndroidJUnit4::class)`
- Héritage `TestCase`
- `@Before setUp()` : initialisation
- `@After tearDown()` : nettoyage

*Tests Room*
#image("../img/image copy 70.png", width: 85%)

```kotlin
@Before
override fun setUp() {
  val context = ApplicationProvider.getApplicationContext<Context>()
  db = Room.inMemoryDatabaseBuilder(context, HistoryDB::class.java).build()
  dao = db.historyDao()
}

@After
override fun tearDown() {
  db.close()
}
```

== Tests Compose

*Configuration*
```kotlin
@get:Rule
val composeTestRule = createComposeRule()
```

*Tests basés texte (limité)*
```kotlin
@Test
fun editorScreenTest() {
  composeTestRule.setContent { EditorScreen(emptyTestPerson) }
  composeTestRule.onNodeWithText("Name").performTextInput(name)
  composeTestRule.onNodeWithText("Bienvenue", substring = true)
    .assertTextEquals("Bienvenue $fname $name !")
}
```

*Limitations texte*
- Sensible refactoring
- Problèmes traduction
- Ambiguïté éléments multiples

*Solution : testTag*
```kotlin
// Composable
Text(
  modifier = Modifier.testTag("welcome-msg"),
  text = "Bienvenue"
)

// Test
composeTestRule.onNodeWithTag("welcome-msg")
  .assertTextEquals("Bienvenue Jean Neige !")
```

*Cheat-sheet* : https://developer.android.com/jetpack/compose/testing-cheatsheet

== CI/CD

*Prérequis*
- SDK Android
- Émulateur pour tests instrumentalisés

*Docker*
1. Image `openjdk:11-jdk`
2. Télécharger SDK Android
3. Accepter licences CLI
4. Télécharger versions nécessaires
5. Gradle : `app:lintDebug`, `app:assembleDebug`, `app:testDebug`

*Tutoriel* : https://howtodoandroid.com/setup-gitlab-ci-android/

*Configuration émulateur*
- Installation CLI automatisable
- Accélération matérielle requise
- Options : `--no-audio --no-windows`
- Démarrage : plusieurs minutes
- Désactiver animations avant tests

```bash
gradlew app:connectedAndroidTest
```

== Tests supplémentaires

*Monkey Testing (Play Store)*
- Installation + interactions aléatoires
- Identifiants pour connexion
- Tests multi-appareils
- Vérification accessibilité
- Détection failles sécurité

*Firebase Robo Tests*
- Cartographie automatique app
- Captures écran/vidéos
- Logs détaillés
- Profilage
- Vérification niveaux API
- Version gratuite limitée
- Intégration CI/CD possible