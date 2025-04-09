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

= Définition
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
Cet algorithme a une complexité de O(n + m) où n est le nombre de sommets et m le nombre d'arêtes du graphe. On parle donc de complexité linéaire.

== Plus court chemin dans un graphe sans circuits
Pour trouver le plus court chemin nous pouvons utiliser l'équation de Bellman dans le cas où les sommets sont traités dans un ordre compatible *avec le rang*.

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
