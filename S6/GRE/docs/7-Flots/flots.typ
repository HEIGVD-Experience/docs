#import "/_settings/typst/template-note.typ": conf, note
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