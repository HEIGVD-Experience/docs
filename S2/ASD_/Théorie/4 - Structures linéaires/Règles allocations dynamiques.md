---
Type: PriseDeNote
MiseAuPropre: oui
---

```cpp
vector<objet> v(n)                        // Constructeur par défaut pour n objets
v.reserve(n)                                   // Constructeur par move puis détruit l'objet
v.push_back(objet construit)       // Constructeur par copie mais ne détruit pas l'objet initial
Objet* obj;                                     // Ne construit pas l'objet mais donne un ptr sur le type
obj = new Objet                             // Constructeur par défaut
v.push_back(*obj)                         // Constructeur par copie de l'objet mais ne le détruit pas
v.push_back(Objet(param))          // Construit l'objet avec paramètres -> move -> détruit
v.emplace_back(param)                // Constructeur par paramètres
swap(v[1], v[2])                              // Constructeur par move de 2 dans temp -> move 1 dans 2 ->                                                            // move de 2 dans 1 -> detruit temp
v[0] = Objet(param)                       // Constructeur par paramètre -> move -> détruit
```

### Allocation dynamique

| Méthodes                    | Explication                                       |
| --------------------------- | ------------------------------------------------- |
| créer un pointeur sur objet | ne construit pas l'objet mais assigne un pointeur |
| création objet avec new     | crée l'objet en fonction des paramètres possibles |

### Allocation avec vecteur

| Méthodes                                            | Explication                                                                                         |
| --------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| vecteur de `n` éléments                             | Constructeur par défaut pour les n objets                                                           |
| vecteur `reserve` de `n`                            | Reserve un nouveau vecteur de `n` place puis `move` les éléments dans le vecteur                    |
| vecteur `push_back` objet construit                 | Constructeur par copie mais ne détruit pas l'objet initial                                          |
| vecteur `push_back` objet non-construit             | Constructeur avec param de l'objet puis move dans vecteur puis détruit l'objet                      |
| vecteur `emplace_back` avec paramètres              | Constructeur avec param                                                                             |
| swap de deux éléments dans le vecteur               | Constructeur par `move` de 2 dans `temp` -> `move` 1 dans 2 -> `move` de 2 dans 1 -> détruit `temp` |
| accès direct à `[n]` dans le vecteur et assignation | Constructeur par paramètre -> `move` -> détruit l'objet temporaire                                  |
