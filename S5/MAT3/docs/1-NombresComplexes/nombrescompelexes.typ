#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Nombres complexes
  ],
  lesson: "MAT3",
  chapter: "1 - Nombres Complexes",
  definition: "",
  col: 1,
  doc,
)

= Nomenclature
Pour pouvoir résoudre la fonction:
$
x^2+1 = 0
$
nous avons du créer la valeur suivante:
$
j^2 = -1
$
Nous aurons la formule suivante:
$
z = a + "bj" \
a = "Partie réelle et notée" Re(z) \
b = "Partie imaginaire et notée" Im(z)
$

= Forme cartésienne
Très pratique pour l'addition et la soustraction.

== Addition 
$
(a + "bj") + (c + "dj") = (a + c) + (b + d)j
$
== Soustraction
$
(a + "bj") - (c + "dj") = (a - c) + (b - d)j
$
== Multiplication
$
(a + "bj") * (c + "dj") = ("ac" - "bd") + ("ad" + "bc")j
$

= Conjugé complexes
Le conjugué d'un nombre complexe est obtenu en changeant le signe de la partie imaginaire. Il est noté: $overline(s)$. De ce fait on peut dire que :
$
z * overline(z) = a^2 + b^2
$
cela signifie que nous pouvons obtenir *un nombre réel* en multipliant un nombre complexe par son conjugué.

== Propriétés
#image("/_src/img/docs/image copy 129.png")

$
"Module 1" = a^2 + b^2 = 1
$


= Plan complexe
