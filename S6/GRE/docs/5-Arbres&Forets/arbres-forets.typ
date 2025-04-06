#import "/_settings/typst/template-note.typ": conf, note
#show: doc => conf(
  title: [
    Arbres et Forets
  ],
  lesson: "GRE",
  chapter: "4 - Arbres et Forets",
  definition: "Definition",
  col: 1,
  doc,
)

= Définition
#image("../img/image.png")

== Propriétés
Les propriétés des arbres et forêts sont les suivantes :
- Un arbre est une forêt connexe.
- Chaque composante connexe d'une forêt est un arbre.
- Forêts et arbres sont des graphes simples ! En effet, toute boucle ou toute paire d'arêtes parallèles crée un cycle simple.
- Dans un arbre (ou une forêt) les sommets pendants (sommet de degré 1) sont souvent appelés des feuilles.
- Tout arbre comptant au moins 2 sommets possède au moins 2 feuilles.

= Arbres et forêts
== Recouvrant
Un arbre recouvrant d'un graphe non orienté connexe est un arbre qui contient tous les sommets du graphe initial. Cela est pareil pour une forêt recouvrante.

#image("../img/image copy.png")

- En bleu: un arbre non recouvrant
- En vert: un arbre recouvrant
- En rouge: une forêt recouvrante

== Arbre recouvrant minimal
Un arbre recouvrant minimal d'un graphe non orienté connexe est un arbre recouvrant de poids minimal. L'objectif est de trouver un arbe permettant de relier tous les sommets du graphe avec le plus petit poids possible.
== Algorithme de Kruskal (1956)
L'algorithme de Kruskal consisite à  partir d'une forêt vide ne contenant que les sommets du graphe puis diminuer progressivement le nombre de composantes connexes en reliant à chaque fois de la façon la plus économique possible deux composantes de la forêt actuelle.

=== Application
Pour appliquer cet algorithme, il faut:
- construire un tableau contenant toutes les arêtes du graphe avec leurs poids respectifs
- trier ce tableau par ordre croissant de poids
- sélectionner les plus petites arêtes du tableau pour relier tous les sommets du graphe

=== Exemple
#image("../img/image copy 17.png")

=== Complexité
$
O (m log n + m n) = = (m n)
$

== Algorithme de Prim (1957)
L'algorithme de Prim consiste à partir d'un arbre vide ne contenant qu'un sommet du graphe puis ajouter progressivement des sommets au graphe en choisissant à chaque fois le sommet le plus proche de l'arbre actuel.

=== Application
Pour appliquer cet algorithme, il faut:
- construire un tableau ayant comme colonne
 - le n°d'itération
 - le sommet en cours de traitement
 - tous les sommets du graphe
- on définit des couples (distance, sommet) en commançant par l'itération 0
- on choisit le sommet le plus proche de l'arbre actuel puis mets à jour le tableau

=== Exemple
#image("../img/image copy 18.png")

=== Complexité
En fonction de la structure de données utilisée pour représenter le graphe, la complexité de l'algorithme de Prim est:

#table(
  columns: (1fr, 1fr, 1fr, 1fr),
  [], [*Tableau*], [*Tas binaire*], [*Tas de Fibonacci*],
  "Insert", $O(1)$, $O(log n)$, $O(1)$,
  "FindMin", $O(n)$, $O(1)$, $O(1)$,
  "ExrtactMin", $O(n)^[a]$, $O(log n)$, $O(log n)^[b]$,
  "DecreaseKey", $O(1)$, $O(log n)$, $O(1)^[b]$, 
  "Prim", $O(n^2)$, $O(m log n)$, $O(m + n log n)$,
)

#note[
  Les algorithmes de Kruskal, de Prim et de Boruvka permettent également de déterminer des arbres recouvrants de poids total *maximum*.
]