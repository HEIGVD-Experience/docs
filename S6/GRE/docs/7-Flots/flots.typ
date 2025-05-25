#import "/_settings/typst/template-note.typ": *
#show: doc => conf(
  title: [
    Les Flots
  ],
  lesson: "GRE",
  chapter: "7 - Flots",
  definition: "Definition",
  col: 1,
  doc,
)

= Notions de flots
== Loi de conservation
#note(
  title: "Description",
  "La loi de conservation des flots stipule qu'à l'execption des sources et des puits, le débit entrant dans un nœud est égal au débit sortant. En d'autres termes, la somme des débits entrants est égale à la somme des débits sortants.",
)

== Flots dans un graphe
Ci-dessous un example de flot de $s$ à $t$ dans un graphe. Les flots sont représentés par des triangles (donnant la direction) sur l'arc.
#image("../img/image copy 27.png")

- Capacité: la capacité d'un arc est la quantité maximale de flot qui peut passer par cet arc.
- Flot: le flot d'un arc est la quantité de flot qui passe par cet arc.

= Réseau d'augmentation
Un réseau d'augmentation est construit à partir de l'observation qu'il est possible d'augmenter le flux de $j$ à $i$ en diminuant le flux de $i$ à $j$.

#image("../img/image copy 28.png")

Grâce au réseau d'augmentation nous pouvons chercher à maximiser le flot entre $s$ et $t$ en augmentant le flot dans les arcs du réseau d'augmentation. Voici ce que cela donne en reprenant l'expample précédent.

#image("../img/image copy 29.png")

Nous voyons donc que ce graphe contient un flot de valeurs maximale de 2.

#note(
  "Cette approche, de générer le réseau d'augmentation est très similaire à l'algorithme que nous allons présenter plus tard, l'algorithme de Ford-Fulkerson. ",
)

= Algorithme de Ford-Fulkerson
L'algorithme de Ford-Fulkerson permet de trouver un 'flot compatible de valeur maximale de $s$ à $t$' dans un graphe orienté. Il s'applique de la manière suivante:

1. Partir d'un flot initial admissible (typiquement le flot nul).
2. *Répéter*
  3. Construire le réseau d'augmentation $R*$ associé au flot courant.
  4. Chercher un chemin de s à t dans $R*$ et, en cas de succès, augmenter au maximum le flot le long de ce chemin (en diminuant le flux de l'arc (i, j) dans R si le chemin utilise l'arc renversé (j, i) dans $R*$).
5. Tant qu'un chemin de s à t existe dans $R*$.
*Fin*

= Coupe séparant $s$ à $t$
Une coupe séparant $s$ à $t$ est un ensemble d'arcs qui, si on les supprime du graphe, sépare $s$ de $t$. En d'autres termes, il n'existe plus de chemin de $s$ à $t$ dans le graphe après la suppression de ces arcs.

- Dans un réseau $R$, la *capacité d'une coupe* est la somme des capacités des arcs formant la coupe.

La coupe définie par l'ensemble $A = {1,3}$ est formé des arcs $(1,2)$ et $(3,4)$.
#image("../img/image copy 32.png")

Elle sépare la source $s$ du puits $t$ et sa capacité est égale à 2, la même valeur que celle du flot compatible obtenu précédemment.
#image("../img/image copy 33.png")

La coupe est donc de capacité minimale et le flot de valeur maximale.

== Théorème de Ford-Fulkerson
Soit $R$ un réseau orienté et $f$ un flot compatible de $R$. Alors la valeur du flot est égale à la capacité d'une coupe minimale.

#note(
  "Cette propriété est très importante car elle nous permet de trouver un flot de valeur maximale en construisant une coupe minimale. En effet, si nous pouvons trouver une coupe minimale, nous pouvons également trouver un flot de valeur maximale.",
)

== Performance de l'algorithme de Ford-Fulkerson
L'algorithme de Ford-Fulkerson n'est pas un algorithme polynomial. Si $f*$ dénote la valeur maximale d'un flot compatible de $s$ à $t$, alors la complexité de l'algorithme est de $O(m f*)$.

= Algorithme de Edmonds-Karp
L'algorithme de Edmonds-Karp est une variante de l'algorithme de Ford-Fulkerson qui permet de trouver un flot de valeur maximale en utilisant un chemin de s à t dans le réseau d'augmentation.

Pour cela, dans le réseau d'augmentation, nous cherchons le plus court chemin de $s$ à $t$ en utilisant un BFS (car on cherche à minimiser le nombre d'arcs traversés).

La complexité de l'algorithme de Edmonds-Karp est de $O(m^2 n)$ où $m$ est le nombre d'arcs et $n$ est le nombre de sommets ou $O(n^5)$ dans un réseau dense.

= Couplage maximum dans un graphe biparti
Grâce aux problèmes de flots on peut résoudre le problème du couplage maximum dans un graphe biparti.

- on oriente les arêtes de $G$ de $A$ vers $B$ avec une capacité de 1 ou $infinity$
- on ajoute une source $s$ et un puits $t$
- on cherche un flot de valeur maximale de $s$ à $t$
- le couplage maximum est égal à la valeur du flot

#image("../img/image copy 34.png")

= Flot maximum à coût minimum
Comme pour le problème de flot maximum, on peut déterminer un flot maximum de coût minimum en partant d'un flot nul et en augmentant le successivement la valeur du flot.

- À chaque itération le flot est à coût minimum mais sa valeur augmente au fil des itérations
- Chaque augmentation se fait en saturant un *plus court chemin de $s$ à $t$* dans le réseau d'augmentation $R*$

#image("../img/image copy 35.png")

== Algorithme de Busacker-Gowen
L'algorithme de Busacker-Gowen permet de trouver un flot maximum de coût minimum.

1. Partir d'un flot initial nul dans tous les arcs
2. *Répéter*
  3. Construire le réseau d'augmentation $R*$ associé au flot courant
  4. Chercher un plus court chemin de $s$ à $t$ dans $R*$ et, en cas de succès, augmenter au maximum le flot le long de ce chemin.
5. Tant qu'un chemin de $s$ à $t$ existe dans $R*$.
*Fin*

== Points d'attention
#note()[
- Dans un réseau d'augmentation, les arcs renversés ont des coûts négatifs (si les coûts de départ sont positifs) de ce fait, nous ne pouvons pas utiliser un Dijkstra pour trouver le plus court chemin sauf pour la première itération.
]

Pour résoudre ce problème, il existe deux solutions:
1. Utiliser un algorithme de plus court chemin qui permet de traiter les coûts négatifs (comme Bellman-Ford), mais cela impactera la complexité de l'algorithme.
2. Modifier le coûts des arcs à la fin de chaque itération de l'algorithme. Pour cela, on peut se baser sur une fonction de potentiel.

== Fonction de potentiel
La fonction de potentiel utilisée par Edmonds et Karp etst définie par les longueurs des plus courts chemin depuis $s$ dans le réseau d'augmentation actuel.

Si on note $lambda_i$ ces longueurs, le coût $c_(i j)$ d'un arc $(i,j)$ est remplacé par le coût réduit
$
  c'_(i j) = c_(i j) + lambda_i - lambda_j
$

#attention()[
  Si dans notre réseau de base, nous avons des circuits de coût négatif, l'algorithme de Busacker-Gowen ne pourra pas déterminer un flot maximum.
]