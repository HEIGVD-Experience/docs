#import "/_settings/typst/template-note.typ": conf
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

== Arbre recouvrant minimal
=== Algorithmes gloutons
==== Algorithme de Kruskal (1956)
L'algorithme de Kruskal consisite à  partir d'une forêt vide ne contenant que les sommets du graphe puis diminuer progressivement le nombre de composantes connexes en reliant à chaque fois de la façon la plus économique possible deux composantes de la forêt actuelle.

==== Algorithme de Prim (1957)
L'algorithme de Prim consiste à partir d'un arbre vide ne contenant qu'un sommet du graphe puis ajouter progressivement des sommets au graphe en choisissant à chaque fois le sommet le plus proche de l'arbre actuel.

==== Algorithme de Borůvka (1926)
L'algorithme de Borůvka consiste à partir d'une forêt vide ne contenant que les sommets du graphe puis diminuer progressivement le nombre de composantes connexes en reliant à chaque fois de la façon la plus économique possible deux composantes de la forêt actuelle.