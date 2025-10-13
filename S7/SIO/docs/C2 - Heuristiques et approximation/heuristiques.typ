#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Heuristiques et approximation",
  course: "SIO - Simulation et optimisation",
  author: "Guillaume Trüeb",
  date: "13 octobre 2025",
  toc: true,
  col: 1,
  doc,
)

= Heuristiques
== Optimisation combinatoire
L'optimisation dite combinatoire est caractérisée par un ensemble de solutions finies mais souvent très grand. Nous aurons donc les caractéristiques suivantes:
- un ensemble *fini* $S$ de solutions admissibles ou réalisables
- une fonction objectif $f: S #sym.arrow RR $ associant une valeur à chaque solution

#info[
On cherchera donc souvent à résoudre le problème d'optimisation suivant:

$
  min_(x in S) f(x)
$
]

=== Type de problèmes
- problèmes `faciles` (polynomiaux): on peut trouver une solution optimale en temps polynomial
- problèmes `difficiles` (NP-difficiles): on ne connaît pas d'algorithme polynomial pour trouver une solution optimale

=== Exemples
- *problème de l'arbre recouvrant de poids minimal* #sym.arrow problème polynomial
- *problème du plus court chemin de $s$ à $t$* #sym.arrow problème polynomial grâce à l'algorithme de Dijkstra ou Bellman-Ford
- *problème du voyageur de commerce (TSP)* #sym.arrow problème NP-difficile
- *problème du stable de cardinal maximum* #sym.arrow problème NP-difficile
- *problème d'optimisation linéaire*
 - si les variables sont continues #sym.arrow problème polynomial
 - si les variables sont entières #sym.arrow problème NP-difficile


== Algorithmes de résolution
=== Algorithmes exacts
- un algortihme `exact` fournit toujours une solution optimale
- pour les problèmes faciles, un bon algorithme `exact` a une complexité polynomiale et demande donc un temps de résolution borné par un polynôme en la taille du problème
- pour les problèmes difficiles, un algorithme `exact` a souvent une complexité exponentielle et demande donc un temps de résolution très long

=== Algorithmes approximatifs
- un algorithme `approximatif` fournit une solution réalisable mais pas forcément optimale
- elle assure la qualité minimale de la solution produite
- elle est de complexité raisonnable (polynomiale)

=== Algorithmes heuristiques
- une heuristique fournit une solution sous-optimale en général
- aucune garantie sur la qualité de la solution
- elle est efficace en pratique (temps de calcul raisonnable)
- on constate empiriquement qu'elle fournit souvent de bonnes solutions

#hint[
  Une bonne heuristique doit posséder les qualités suivantes:
  - complexité raisonnable et relativement simple à implémenter
  - produire de bonnes solutions en pratique proche de l'optimal tout en minimisant les cas de mauvaises solutions
]

==== Heuristiques constructives
Les heuristiques constructives construisent une solution réalisable pas à pas en ajoutant des éléments à une solution partielle jusqu'à obtenir une solution complète. Ces méthodes ne disposent pas d'une solution complète du problème mais parfois d'une solution partielle.

==== Heuristiques d'amélioration
Les heuristiques d'amélioration ou dite d'échange, partent d'une solution admissible et cherchent à l'améliorer en explorant son voisinage. Ces modifications, souvent appelés échanges, sont enchaînées tant que des améliorations sont possibles.

= Heuristiques de coloration
== Coloration d'un graphe
Soit $G = (V, E)$ un graphe non orienté. Une *coloration* de $G$ est une affectation de couleurs aux sommets de $G$ telle que deux sommets adjacents n'ont pas la même couleur. Le but est de minimiser le nombre de couleurs utilisées.

= Heuristiques pour le TSP

= Heuristiques d'échanges

= Métaheuristiques