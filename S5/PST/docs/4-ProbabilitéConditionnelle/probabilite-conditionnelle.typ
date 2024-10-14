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

== Filtre bayesien anti-spam
$
p_i : "probabilité qu'un mot choisi au hasard dans un message électronique " \ " est le mot " i " en sachat que le mot est un spam." \
q_i : "probabilité qu'un mot choisi au hasard dans un message électronique " \ " est le mot " i " en sachant que le message n'est pas un spam"
$

=== Exemple
$
M_i : "le mot choisi au hasard dans le message électronique est le mot" i; \
S : "le message électronique est un spam"
$

Ainsi,
$
p_i = P(M_i bar S) " et " q_i = P(M_i bar overline(S))
$

Pour illustrer le fonctionnement du filtre bayesien, supposons que la proportion de messages spam d'une certaine compagnie vaut $0.9$ et que pour le mot "hypothèque" noté $1, p_1 = 0.05 " et " q_1 = 0.001$.

Pour ce mot, on a alors
$
p_1 = P(M_1 bar S) = 0.05 " et " q_1 = P(M bar overline(S)) = 0.001
$

Un nouveau message électronique vient d'arriver et le mot "hypothèque" y apparaît exactement une fois. En appliquant le théroème de Bayes, la probabilité que le message électronique soit un spam est
$
P(S bar M_1) &= frac(P(M_1 bar S) * P(S), P(M_1 bar S) * P(S) + P(M_1 bar overline(S)) * P(overline(S))) = 0.998
$

#colbreak()

=== Formules utiles
Dans le cas ou les événements $M_1$ et $M_2$ sont dit *indépendants* nous aurons,
$
P(S bar M_1 sect M_2) &= frac(P(M_1 sect M_2 bar S) * P(S), P(M_1 sect M_2 bar S) * P(S) + P(M_1 sect M_2 bar overline(S)) * P(overline(S))) \ \
&= frac(P(M_1 bar S) * P(M_2 bar S) * P(S), P(M_1 bar S) * P(M_2 bar S) * P(S) + P(M_1 bar overline(S)) * P(M_2 bar overline(S)) * P(overline(S)))
$

= Indépendance
L'événement $A$ est *indépendant* de l'événement B si le fait de savoir que $B$ s'est déroulé n'influence pas la probabilité de $A$.

Nous aurons donc
$
P(A bar B) = P(A)
$

Or, par définition d'une probabilité conditionnelle,
$
P(A bar B) = frac(P(A sect B), P(B))
$

Ainsi, on obtient
$
P(A) = frac(P(A sect B),P(B)) 
$

On peut donc dire que $A$ est indépendant de $B$ si
$
P(A sect B) = P(A) * P(B)
$

*Deux événements sont dépendants s'ils ne sont pas indépendants.*