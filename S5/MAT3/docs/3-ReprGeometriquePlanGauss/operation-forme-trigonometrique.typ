#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Operation avec la forme trigonométrique
  ],
  lesson: "MAT3",
  chapter: "3 - Représentation géométrique et plan de Gauss",
  definition: "Definition",
  col: 1,
  doc,
)


= Multiplication avec la forme trigonométrique
Prenons deux nombres complexes sous forme trigonométrique:
$
z_1 = r_1(cos(Theta_1) + j*sin(Theta_1)) " et " z_2 = r_2(cos(Theta_2) + j*sin(Theta_2))
$

Pour multiplier deux nombres complexes sous forme trigonométrique nous devons:

#align(center)[
  1. *Multiplier les modules de $z_1$ et $z_2$,*
  2. *Additionner les arguments de $z_1$ et $z_2$.*
]

Donc nous aurons:
$
z_1*z_2 = r_1*r_2(cos(Theta_1 + Theta_2) + j*sin(Theta_1 + Theta_2))
$

= Division avec la forme trigonométrique
Prenons deux nombres complexes sous forme trigonométrique:
$
z_1 = r_1(cos(Theta_1) + j*sin(Theta_1)) " et " z_2 = r_2(cos(Theta_2) + j*sin(Theta_2))
$
avec *$z_2$ non nul*!

#align(center)[
  1. *Diviser le module de $z_1$ par celui de $z_2$,*
  2. *Soustraire l'argument de $z_2$ à celui de $z_1$.*
]


Nous aurons la formule suivante:
$
frac(r_1,r_2) = frac(r_1,r_2)(cos(Theta_1 - Theta_2) + j*sin(Theta_1 - Theta_2))
$

= Puissance avec la forme trigonométrique
La formule générale de $z^n$ pour $n in Z$ :
$
z^n = r^n*(cos(n*Theta) + j*sin(n*Theta))
$

Donc il suffit de:
#align(center)[
  1. *D'élever le module de $z$ à la puissance $n$*,
  2. *Multiplier l'argument de $z$ par $n$*.
]