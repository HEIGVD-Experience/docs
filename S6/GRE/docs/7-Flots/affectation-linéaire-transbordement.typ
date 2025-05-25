#import "/_settings/typst/template-note.typ": *
#show: doc => conf(
  title: [
    Affectation linéaire et transbordement
  ],
  lesson: "GRE",
  chapter: "7 - Flots",
  definition: "Definition",
  col: 1,
  doc,
)

= Différentes modélisations
== Problème d'affectation linéaire
Posons le problème suivant:
- On considère $n$ personnes et $n$ tâches
- Pour chaque personne $i$ et chaque tâche $j$, on connaît la durée $c_(i j)$ que mets la personne a réaliser la tâche
- On cherche comment répartir les tâches entre les personnes pour minimiser la durée totale de réalisation

Dans ce genre de problème nous sommes ammenés à chercher un *couplage parfait de coût minimum dans un graphe biparti*. En utilisant la même technique que pour un couplage maximum dans un graphe biparti, nous pouvons facilement le transformer en problème de flot maximum à coût minimum.

== Problème du transbordement
Réseau $R = (V, E, c, u)$ avec :
- *Sources* (offre $b_i < 0$), *puits* (demande $b_i > 0$), *transit* ($b_i = 0$)
- *Coûts* $c_(i j)$ et *capacités* $u_(i j)$ sur les arcs
- *Objectif* : minimiser les coûts de transport

== Modélisation
*Équation de conservation* pour chaque sommet $i$ :
$
sum_(j in "Pred"(i)) x_(j i) - sum_(j in "Succ"(i)) x_(i j) = b_i
$

== Conditions et cas particuliers
- *Équilibre nécessaire* : $sum_(i in V) b_i = 0$
- *Transport* : graphe biparti complet
- *Affectation* : transport avec offres/demandes = 1

== Transformation en flot max-coût min
1. Ajouter source $s$ → sommets sources (coût 0, capacité = offre)
2. Ajouter puits sommets → $t$ puits (coût 0, capacité = demande)  
3. Chercher flot max de $s$ à $t$ de coût min

*Condition* : solution optimale ⟺ valeur du flot = somme des demandes

#image("../img/image copy 36.png")