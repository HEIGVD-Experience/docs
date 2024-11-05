#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Racines n-ièmes d'un nombre complexe
  ],
  lesson: "MAT3",
  chapter: "5 - Racines et Polynômes complexes",
  definition: "Definition",
  col: 1,
  doc,
)

= Définition
Soit $z$ un nombre complexe et $n$ un entier positif, une racine n-ième de $z$ est un nombre complexe vérifiant:

#align(center)[
  #linebreak()
  #box(
    stroke: 1pt + color.black,
    inset: 15pt,
  )[
    $
    w^n = z
    $
  ]
]

*Tout nombre complexe z non null possède n racines n-ièmes distinctes.*

= Racine de nombre sous forme exponentielle
Si $z = r e^(j theta)$, alors ses n racines n-ièmes sont égales à 

#align(center)[
  #linebreak()
  #box(
    stroke: 1pt + color.black,
    inset: 15pt,
  )[
    $
    w_k = root(n, r) * e^(theta/n + (2k pi)/n), quad k = 0, 1, dots, n-1
    $
  ]
]

== Conditions pour que w soit une racine n-ième de z

Soit $z = r e^(j theta)$ un nombre complexe non nul et $w = rho e^(j phi)$ un autre nombre complexe. $w$ est une racine $n$-ième de $z$ (c'est-à-dire $w^n = z$) si et seulement si les deux conditions suivantes sont satisfaites :

1. *Condition sur le module :*
$
|w^n| = |z| quad arrow.double.long.l.r quad rho^n = r quad arrow.double.long.l.r quad rho = root(n, r)
$

2. *Condition sur l'argument :*
$
n phi ≡ theta (mod 2 pi) quad arrow.double.long.l.r quad n phi = theta + 2k pi quad arrow.double.long.l.r quad phi  = theta / n + (2 k pi) / n, quad "avec " k " un entier"
$

Cela signifie que le module de $w$ doit être $root(n,r)$ et son argument doit être de la forme $theta/n + (2 pi k)/n$ pour un entier $k$.
