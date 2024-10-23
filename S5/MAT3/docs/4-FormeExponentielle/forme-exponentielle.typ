 #import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Forme exponentielle
  ],
  lesson: "MAT3",
  chapter: "4 - Forme Exponentielle",
  definition: "Ce document explique la forme exponentielle des nombres complexes, basée sur la formule d'Euler, qui relie les fonctions exponentielles et trigonométriques. Il illustre des cas particuliers, les propriétés de cette forme, et décrit comment effectuer des opérations telles que la multiplication, division, élévation à une puissance, et le calcul du conjugué pour les nombres complexes en utilisant cette représentation.",
  col: 1,
  doc,
)

= Forme exponentielle d'un nombre complexe
== Formule d'Euler
#align(center)[
  #linebreak()
  #box(
    stroke: 1pt + color.black,
    inset: 15pt,
  )[
    $
    e^(j theta) = cos(theta) + j * sin(theta)
    $
    #align(left)[pour tout $theta$ réel.]
  ]
]

#image("/_src/img/docs/image copy 134.png")

Lorsque $theta$ varie, l'image du nombre complexe $e^(j theta)$ parcourt le cercle unité dans le plan
complexe.

=== Cas particuliers
1. $1 = e^(j 0) = e^0$

2. $j = e^(j pi/2)$
3. $-1 = e^(j pi)$
4. $-j = e^(j (3pi)/2)$
5. $e^z eq.not 0$ pour n'importe quel nombre complexe $z$

On remarque aussi que $e^(j theta)$ est $2k pi$ périodique ainsi pour tout entier $k$, on aura:
$
e^0 = e^(j 0) = e^(2pi k) = 1
$

== Forme exponentielle

#align(center)[
  #linebreak()
  #box(
    stroke: 1pt + color.black,
    inset: 10pt,
  )[
    $
    z = "re"^(j theta)
    $
  ]
]
pour $r$ représente le module et d'argument $theta$.

== Propriétés
- $z = a + "bj"$ alors $e^z = e^(a + "bj") = e^a (cos(b) + j sin(b))$
- $bar e^(a+"bj")bar = e^a$ et en particulier $bar e^(j b) bar = 1$

= Opération avec la forme exponentielle
Prenons $z_1 = r_1 e^(j theta_1)$ et $z_2 = r_2 e^(j theta_2)$ deux nombres complexes ainsi que $n$ un nombre entier. Alors :

#align(center)[
  #linebreak()
  #box(
    stroke: 1pt + color.black,
    inset: 15pt,
  )[
    1. $z_1 z_2 = r_1 r_2 e^(j(theta_1 + theta_2))$,
    2. $frac(1,z_1) = frac(1,r_1) e^(-j theta_1)$,
    3. $frac(z_1,z_2) = frac(r_1,r_2) e^(j(theta_1 - theta_2))$,

    4. $(z_1)^n = (r_1)^n e^(j n theta_1)$,
    5. $z_1^* = r_1 e^(-j theta_1)$.
  ]
]