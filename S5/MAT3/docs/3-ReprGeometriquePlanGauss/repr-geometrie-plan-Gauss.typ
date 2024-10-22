#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Représentation géométrique et plan de Gauss
  ],
  lesson: "MAT3",
  chapter: "3 - Représentation géométrique et plan de Gauss",
  definition: "Definition",
  col: 1,
  doc,
)

= Représentation dans le plan
Dans un repère orthonormé du plan $R^2$, un nombre complexe $z = a + "bj"$ est représenté par le point $M(a, b)$, où $a$ est la partie réelle et $b$ la partie imaginaire. Cette représentation visuelle se fait dans le plan complexe, également appelé plan de Gauss.

#image("/_src/img/docs/image copy 148.png")

== Conjugé complexe dans le plan
Dans le plan complexe, le conjugé complexe de $z, z"*"$ représente la sysmétrie par rapport à l'axe des réels.

#image("/_src/img/docs/image copy 149.png")

= Forme trigonométrqiue
Tout nombre complexe peut-être défini par deux valeur nommées *module* et *argument principal*.

== Module
Le module correspond à la norme du vecteur nombre complexe $z = a + b = arrow("OM")$ et on le note:
$
|z| = r = norm((a/b)) = sqrt(a^2 + b^2)
$

== Argument principal
L'argument principal d'un nombre imaginaire dit $z$ correspond à l'angle orienté $theta$, mesuré en radian et exprimé dans l'intervale $]- pi, pi]$ que forme le vecteur $arrow("OM")$ avec l'axe des nombres réels positifs. Pour calculer l'angle nous devrons toujours prendre la partie la plus petite de celui-ci soit en passant par le cadran 1 et 2 ou par 4 et 3 en ajoutant le signe $-$ avant.

Pour le calculer l'angle $theta$ nous pouvons utiliser le tableau suivant:
$
"Arg"(z) = cases("Arctan"(b/a) - pi &"si" a < 0 " et " b < 0, (-pi)/2 &"si" a = 0 " et " b < 0, "Arctan"(b/a) &"si" a > 0, pi/2 &"si" a = 0 " et " b > 0, "Arctan"(b/a) + pi &"si" a < 0 " et " b gt.eq 0)
$

= Determination d'un nombre complexe par la forme trigonométrique

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
frac(z_1,z_2) = frac(r_1,r_2)(cos(Theta_1 - Theta_2) + j*sin(Theta_1 - Theta_2))
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

= Rappel
À noter que si $"Arg"(z) = alpha$ alors,
$
"Arg"(z * j) = "on fait une rotation de " frac(pi, 2) \
"Arg"(frac(z, j)) = "on fait une rotation de " frac(-pi, 2)
$