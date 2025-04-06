#import "/_settings/typst/template-note.typ": conf , note
#show: doc => conf(
  title: [
    Connexité et connexité forte
  ],
  lesson: "GRE",
  chapter: "2 - Connexité",
  definition: "Definition",
  col: 1,
  doc,
)

= Graphes et composantes connexes
== Graphes connexes
- Un graphe est dit connexe s'il existe une chaîne entre chaque paire de sommets.
- Une composante connexe d'un graphe est un sous-ensemble maximal de sommets pour lequel il existe une chaîne entre chaque paire de sommets.

#image("../img/image copy 14.png")

- Chaque sommet ne peut appartenir qu'à *une seule* composante connexe.
- Un sommet est dit *isolé* s'il n'appartient à aucune composante connexe.

== Graphes fortement connexes
- Un graphe orienté est dit fortement connexe s'il existe un chemin orienté entre chaque paire de sommets.

#image("../img/image copy 15.png")

Pour être considéré comme fortement connexe, il faut que le graphe soit:
- Composé d'*au moins 2 sommets*
- Un circuit permet de passer au moins une fois par chaque sommet
 -  De ce fait on doit pouvoir partir depuis n'importe quel sommet et revenir à ce même sommet

== Composantes fortement connexes
- Une composante fortement connexe d'un graphe orienté est un sous-ensemble maximal de sommets pour lequel il existe un chemin orienté entre chaque paire de sommets.

#image("../img/image copy 16.jpg")

Ce graphe n'est pas fortement connexe cependant il est composé de 5 composantes fortement connexes.

= Graphes réduits
La notion de composantes fortement connexes permet d'introduire une notion importante pour la suite qui est celle de graphe réduit. Un graphe réduit est un graphe *orienté* dans lequel chaque composante fortement connexe est regroupée et apparaît "comme un sommet".

#image("../img/image copy 16.png")

- Un grpahe réduit est un graphe *simple*
- Un graphe réduit est une graphe sans circuit
- Un graphe orienté est fortement connexe si et seulement si son réduit est un graphe trivial

= Complexité et notation de Landau
La théorie de la complexité est une branche de l'informatique théorique qui étudie les ressources nécessaires (temps ou espace mémoire) à la résolution d'un problème. Elle permet d'établir des hiérarchies entre algorithmes et d'étudier la difficulté intrinsèque de certains problèmes.

*Approches d'analyse de complexité :*
- Complexité dans le pire des cas (approche la plus courante)
- Complexité moyenne (nécessite un modèle probabiliste)
- Complexité dans le meilleur des cas

L'étude de la complexité s'affranchit des considérations matérielles spécifiques et fournit essentiellement des résultats asymptotiques, permettant d'appréhender le comportement des algorithmes pour des problèmes de tailles croissantes.

*Comportement asymptotique des fonctions :*
- Une fonction f est d'ordre inférieur ou égal à g (f = O(g)) si f ne croît pas plus vite que g
- Une fonction f est d'ordre supérieur ou égal à g (f = Ω(g)) si f croît au moins aussi vite que g
- Une fonction f est de même ordre que g (f = Θ(g)) si elle est simultanément O(g) et Ω(g)

Ces notations (notation de Landau) permettent de classifier les algorithmes et d'exprimer leur efficacité relative. Par exemple, un algorithme de tri par tas a une complexité dans le pire des cas en Θ(n ln(n)).