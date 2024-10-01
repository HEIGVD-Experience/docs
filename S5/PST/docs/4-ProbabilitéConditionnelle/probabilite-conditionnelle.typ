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

= Concept
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
P(A | B) = frac(P(A sect B), P(B))
$