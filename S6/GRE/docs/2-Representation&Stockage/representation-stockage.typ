#import "/_settings/typst/template-note.typ": conf, note
#show: doc => conf(
  title: [
    Introduction aux graphes
  ],
  lesson: "GRE",
  chapter: "2 - Représentation et stockage d'un graphe",
  definition: "Definition",
  col: 1,
  doc,
)

= Matrices
== Types de matrices
Il existe plusieurs types de matrices :
- matrices d'incidence
- matrices d'adjacence

== Matrices d'incidence
L'utilisation des matrices d'incident est centrale pour la modélisation mathématique de nombreux problèmes et l'étude de certaines propriétés d'un graphe.

#note[
  Les materices d'incidence ne sont pas adaptées à la représentation des boucles.
]

=== Graphe non orienté
#image("../img/image copy 8.png")

=== Graphe orienté
#image("../img/image copy 9.png")

== Matrices d'adjacence
Un matrice d'adjacence est une matrice carrée qui représente un graphe orienté ou non orienté. Les éléments de la matrice indiquent si les paires de sommets sont adjacentes ou non dans le graphe.

#note[
  Une matrice d'adjacence permet de représenter n'importe quel graphe.
]

#colbreak()

=== Graphe non orienté
Les matrices d'adjacence d'un graphe *non orienté* sont toujours symétriques et il est de même de toutes ses puissances non négatives.
*Version simple*
#image("../img/image copy 5.png")

*Version avec boucles*
#image("../img/image copy 6.png")

=== Graphe orienté
#image("../img/image copy 7.png")

= Listes
== Tableau de liste d'adjacence
Un tableau composé de liste d'adjacences permet de stocker pour chaque `sommets` sa liste de voisins.
#image("../img/image copy 10.png")

== Tableau liste des successeurs
Dans le cas d'un graphe orienté, on peut aussi utiliser un tableau de liste de successeurs. Chaque case du tableau contient la liste des successeurs du sommet correspondant.
#image("../img/image copy 11.png")

== Tableau compact de successeurs
Cette représentation est composée de 2 tableaux :
- un tableau de successeurs appelé `TabSucc`
- un tableau de taille $n+1$ indexé par les sommets de $0$ à $n$

#columns(2)[
  #image("../img/image copy 12.png")
  #colbreak()
  #image("../img/image copy 13.png")
]

#colbreak()

1. *Matrices d'incidence* :
   - Pas utilisées pour stocker des graphes
   - Important pour les formulations mathématiques théoriques

2. *Matrices d'adjacence* :
   - Idéales pour les graphes denses (nombre d'arêtes ≈ n²)
   - Avantage : test d'adjacence en temps constant
   - Inconvénient : espace mémoire important ($n dot n$)

3. *Listes/tableaux d'adjacence* :
   - Recommandés pour les graphes peu denses (nombre d'arêtes ≈ n)
   - Avantage : compacité (espace ≈ n + m)
   - Inconvénient : test d'adjacence nécessite un parcours

4. *Tableaux compacts d'adjacence/successeurs* :
   - Efficaces pour les graphes statiques de densité moyenne

5. *Structures spécifiques* :
   - Certains graphes nécessitent des structures adaptées
   - Exemple : représentation DCEL pour les graphes planaires