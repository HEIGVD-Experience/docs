#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Probabilité conditionnelle
  ],
  lesson: "PST",
  chapter: "4 - Probabilité conditionnelle",
  definition: "Definition",
  col: 1,
  doc,
)


= Probabilité conditionnelle
== Concept
La probabilité conditionnelle nous permet de calculer la probabilité d'un événement en fonction d'une condition. 

L'opération permettant de calculer la probabilité conditionnelle est la suivante:
$
A = "probabilité que l'évenement A se passe" \
B = "événement qui s'est réalisé"
$
Nous cherchons donc la chance que l'évenement A se passe en sachant que l'événement B s'est réalisé:
$
P(A | B)
$
La formule de base permettant de calculer cette probabilité est:
$
P(A bar B) = frac(P(A sect B), P(B)), " "P(B) eq.not 0
$

=== Remarques
$
P(B bar B) = 1
$

si $A$ est inclus dans $B$, alors $A sect B = A$ et donc
$
P(A bar B) = frac(P(A), P(B))
$

== Théorème de multiplication
En utilisant l'inverse de la formule présentée au point 2 nous pouvons retrouver $P(A sect B)$, pour cela nous aurons la formule suivante:
$
P(A sect B) =& P(A bar B) * P(B) \
=& P(B bar A) * P(A)
$

== Théorème des probabilités totales
Soient $A$ et $B$ deux événements quelconques. Comme $B$ et $overline(B)$ forment une partition de $Omega$, on aura selon le théorème des probabilités totales,
$
P(A) &= P(A bar B) * P(B) + P(A bar overline(B)) * P(overline(B)) \
&= P(A bar B) * P(B) + P(A bar overline(B)) * P(1 - P(B))
$

= Théorème de Bayes
Le théorème de Bayes qui fait appel aux théorèmes de multiplication et de probabilités totales est très important. Par exemple, il donna naissance à une autre approche de la statistique. Nous présenterons d'abord la version simple du théorème puis sa version composée.

== Version simplifiée
Supposons que $A$ et $B$ soient deux événements d'un ensemble fondamental $Omega$, avec $P(B) eq.not 0$. Alors,
$
P(A bar B) = frac(P(A sect B), P(B)) = frac(P(B bar A) * P(A), P(B))
$

== Version composée
Soient une partition $H_1, H_2, ..., H_k$ et un événement $B$ d'un ensemble fondamental $Omega$, avec $P(B) eq.not 0$. Pour tout indice $1 eq.lt j eq.lt k$, on aura,
$
P(H_j bar B) &= frac(P(H_j sect B), P(B)) \
&= frac(P(B bar H_j) * P(H_j), P(B bar H_1) * P(H_1) + ... + P(B bar H_k) * P(H_k))
$