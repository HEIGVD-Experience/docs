#import "/_settings/typst/template-note.typ": *
#show: doc => conf(
  title: [
    Graphes sans circuits et applications
  ],
  lesson: "GRE",
  chapter: "6 - Graphes sans circuits",
  definition: "Definition",
  col: 1,
  doc,
)

= Graphes sans circuits et applications
Les graphes sans circuits parfois appelé *graphes orienté acycliques* jouent un rôle important dans de nombreux problèmes tel que de la gestion de projets complexe, compilation séparée ou encore de l'ordonnancement d'activités.

== Rang
Les graphes sans circuits permettent d'introduire une notion de `rang` qui permet d'ordonnancer les sommets d'un graphe.
$
  "rang"(u) < "rang"(v)
$

#image("../img/image copy 23.png")

== Propriétés
#note[
  - Tout graphe *fini* sans circuits possède au moins un sommet sans prédécesseurs et au moins un sommet sans successeurs.
  - Tout sous-graphe partiel d'un graphe sans circuits est également sans circuits.
]

== Tri topologique (Kahn)
Le tri topologique est un algorithme qui permet d'ordonner les sommets d'un graphe orienté acyclique de manière à respecter les relations d'ordre entre les sommets. Il existe plusieurs algorithmes pour effectuer un tri topologique, mais l'un des plus courants est l'algorithme de Kahn.

Le concept est le suivant:
```
Tant qu'il reste des sommets non numérotés faire
  Identifier un sommet sans prédécesseurs
  Le numéroter (à la suite de celui de l'itération précédente)
  Le supprimer du graphe
```

#image("../img/image copy 24.png")

=== Complexité
Cet algorithme a une complexité de $O(n + m)$ où n est le nombre de sommets et m le nombre d'arêtes du graphe. On parle donc de complexité linéaire.

== Plus court chemin dans un graphe
Pour trouver le plus court chemin nous pouvons utiliser l'équation de *Bellman* dans le cas où les sommets sont traités dans un ordre compatible *avec le rang* et que le graphe ne contient pas de circuits.

$
  lambda_j = &min(lambda_i + c_(i j)) \
  &i in "Pred"[j]
$

En appliquant ces équations nous pouvons trouver les valeurs suivantes:

#columns(2)[
  #image("../img/image copy 25.png")
  #colbreak()
  #image("../img/image copy 26.png")
]

Une fois que nous avons calculé les valeurs de $lambda_j$ pour tous les sommets (grâce à l'agorithme *PCC_SansCircuits*), nous pouvons reconstruire le plus court chemin en suivant les prédécesseurs.

Dans ce cas la, le plus court chemin de $1$ à $6$ est $1 - 2 - 6$ avec un cout de $-1$.

== Plus long chemin dans un graphe
Pour trouver le plus long chemin dans un graphe orienté acyclique, nous pouvons utiliser une approche similaire à celle du plus court chemin, mais en maximisant plutôt qu'en minimisant les coûts. L'équation de *Bellman* pour le plus long chemin est la suivante:
$
  lambda_j = &max(lambda_i + c_(i j)) \
  &i in "Pred"[j]
$


= Graphes potentiels-tâches
Un graphe potentiel-tâches est un graphe orienté acyclique qui représente les relations entre les tâches d'un projet.

- chaque tâche est représentée par un sommet
- la contraite "la tâche $i$ doit être terminée avant que la tâche $j$ ne commence" est modélisée par un arc du sommet $i$ vers le sommet $j$.
- le poids de l'arc ($i$,$j$) est égal à la durée $d_i$ de la tâche $i$ (ou, de manière plus générale, à la durée minimale à respecter entre le début de la tâche $i$ et celui de la tâche $j$).

À ce graphe on ajoute
- un sommet $a$ modélisant le début de la réalisation du projet et relié à tous les sommets sans prédécesseurs par un arc de poids nul
- un sommet $w$ modélisant la fin de la réalisation du projet et relié à tous les sommets sans successeurs par un arc de poids nul

#image("../img/image copy 30.png")
#image("../img/image copy 31.png")

== Composition d'un noeud

#note()[
  Dans chaque exercice il est *crucial* de bien préciser la composition d'un noeud. Voici un exemple pour une majorité des cas:
]

#table(
  align: center + horizon,
  columns: (1fr, 1fr),
  "Nom des tâches", "Numéros topologiques",
  "Date de début au plus tôt", "Date de début au plus tard",
)

== Méthode du chemin critique
Cela s'applique à un graphe potentiel-tâches sans circuits dans les dommets ont été numérotés de manière compatible avec le rang.

- Dans une première phase on calcule les dates $t_i$ de début au plus tôt des différentes tâches en calculant la longueur d'un plus long chemin entre le sommet $a$ et le sommet $i$.
- Pour cela on pose $t_1 = 0$ et pour chaque sommet $i$ on calcule la valeur de $t_i$ en fonction des sommets prédécesseurs de $i$.
$
  t_j = &max(t_i + d_i) \
  &i in "Pred"[j]
$

- Dans une seconde phase on calcule les dates $T_i$ de début au plus tard des différentes tâches en calculant la longueur d'un plus court chemin entre le sommet $i$ et le sommet $w$. On utilise donc l'*ordre topologique inverse* et on calcule:
$
  T_j = min (T_k - d_j) = min(T_k) - d_j
$

Une tâche $i$ est *critique* si $t_i = T_i$. Tout retard dans l'exécution de cette tâche retarde l'exécution du projet.