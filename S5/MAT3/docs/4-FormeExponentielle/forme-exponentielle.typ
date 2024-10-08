#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Forme exponentielle
  ],
  lesson: "MAT3",
  chapter: "4 - Forme Exponentielle",
  definition: "Definition",
  col: 1,
  doc,
)

= Formule d'Euler
== Forme polaire
$
e^(j theta) = cos(theta) + j * sin(theta) " pour tout " theta " réel."
$
#image("/_src/img/docs/image copy 134.png")

== Forme exponentielle
$
z = "re"^(j theta)
$
pour $r$ représente le module et d'argument $theta$.

= Propriétés
- $z = a + "bj"$ alors $e^z = e^(a + "bj") = e^a (cos(b) + j sin(b))$
- $bar e^(a+"bj")bar = e^a$ et en particulier $bar e^(j b) bar = 1$