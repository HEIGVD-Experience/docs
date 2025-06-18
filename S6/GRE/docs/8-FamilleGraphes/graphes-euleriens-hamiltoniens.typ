#import "/_settings/typst/template-note.typ": *
#show: doc => conf(
  title: [
    Graphes Eulériens et Hamiltoniens,
  ],
  lesson: "GRE",
  chapter: "8 - Famille de Graphes",
  definition: "Definition",
  col: 1,
  doc,
)

= Pont de Königsberg
Le problème des ponts de Königsberg est un problème mathématique posé par Leonhard Euler en 1736. Il s'agit de déterminer s'il est possible de traverser tous les ponts de la ville de Königsberg (aujourd'hui Kaliningrad, en Russie) une seule fois sans repasser sur aucun d'eux.

#image("../img/image copy 45.png")

= Graphes Eulériens
- Une *chaîne* est eulérienne si elle passe une et une seule fois par chaque arête du graphe. Un *cycle* est eulérien s'il apsse une et une seule fois par chaque arête du graphe.
- Si le graphe est orienté, on définit de la même manière un chemin et un circuit eulérien comme passant une et une seule fois par chaque aarc du graphe.
- Un graphe non orienté est *eulérien* s'il possède un *cycle* eulérien.
- De même, un graphe orienté est *eulérien* s'il possède un *circuit* eulérien.

== Observations
Tout cycle arrive et repart d'un sommet un même nombre de fois. Donc, si un graphe est eulérien, tous les sommets du graphe doivent avoir un degré *pair*.

== Caractérisation
#note(title: "Graphe non orienté")[
  Un graphe $G$ non orienté et connexe est eulérien (c'est-à-dire qu'il possède un cycle eulérien) si et seulement si tous les sommets de $G$ ont un degré pair.
  Si $G$ possède exactement 2 sommets de degré impair alors il admet une chaîne eulérienne (dont les deux sommets de degré impair sont les extrémités de la chaîne).
]

#note(title: "Graphe orienté")[
  Un graphe $G$ orienté et connexe est eulérien (c'est-à-dire qu'il possède un circuit eulérien) si et seulement si, le demi-degré entrant est égal au demi-degré sortant.
  Si l'égalité entre les demi-degrés entrant et sortant est vérifiée pour tous les sommets sauf deux pour lesquels l'écart est de 1, alors $G$ admet un chemin eulérien (dont les deux sommets de degré différent sont les extrémités de la chaîne).

  Si $"deg"_+(v) = "deg"_-(v)$ pour chaque sommet $v$ d'un graphe orienté connexe alors ce graphe est fortement connexe car il est eulérien.
]

== Construction d'un circuit eulérien
1. Choisir un sommet r ∈ V et construire une anti-arborescence recouvrante d’anti-racine r.
2.  Construire le circuit eulérien itérativement en explorant le graphe à partir du sommet r mais en respectant la règle suivante :
 - Lors du choix d’un arc sortant d’un sommet (différent de r), choisir celui de l’anti-arborescence uniquement s’il s’agit du dernier arc non encore utilisé quittant le sommet.

*Fin*

== Postier chinois
Soit $G = (V, E)$ un graphe non orienté connexe et $c : E -> R_+$ une pondération *non négative* des arêtes de $G$.

Le problème du postier chinois consiste à déterminer une tournée passant *au moins une fois* par chaque arête d $G$ et de longueur totale minimale.

#note[
  Si tous les sommets de $G$ sont de degré pair, le graphe possède un cycle eulérien et ce dernier est une solution optimale du problème (la tournée passe une et une seule fois par chaque arête).

  Cependant si le graphe ne possède pas de cycle eulérien, la tournée devra passer plusieurs fois par certaines arêtes. Le problème revient alors à déterminer quelle sarêtes doivent être dédoublées afin de minimiser la somme des longueurs des arêtes dédoublées.
]

= Graphes hamiltoniens
Prenons un grpahe $G = (V, E)$ un graphe connexe,
- Une chaîne est hamiltonienne si elle passe une et une seule fois par chaque sommet de $G$. Une chaîne hamiltonienne est donc une chaîne élémentaire de longueur $n-1$ dans un graphe à $n$ sommets.
- On définit de manière similaire un chemin hamiltonien ainsi qu'un cycle et un circuit hamiltonien.
- Un graphe est *hamiltonien* s'il possède un cycle hamiltonien (non orienté) ou un circuit hamiltonien (orienté).

#note[
  Le problème de la recherche d'un chemin hamiltonien apparaît dans certains problème d'ordonnancement où l'ordre de réalisation de $n$ tâches doit être établi tout en respectant des contraintes d'antériorité (on suppose qu'il n'est pas possible d'exécuter plusieurs tâches simultanément).
]

== Problème du voyageur de commerce
Le problème du voyageur de commerce (TSP) est un problème d'optimisation combinatoire qui consiste à trouver le plus court circuit hamiltonien dans un graphe (généralement complet) pondéré.