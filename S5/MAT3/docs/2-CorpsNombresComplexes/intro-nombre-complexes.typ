#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Introductiona aux nombres complexes
  ],
  lesson: "MAT3",
  chapter: "2 - Le corps des nombres complexes",
  definition: "",
  col: 1,
  doc,
)

= Rappel
== Série / suite géométrique infinie
La formule pour calculer la valeur d'une série géométrique infinie est:
$
S(infinity) = frac("terme initial", 1 - "raison")
$

== Tableau cercle trigonométrique
#table(
  align: center + horizon,
  columns: (0.16fr, 0.16fr, 0.16fr, 0.16fr, 0.16fr, 0.16fr),
  "",[0],[$pi/6$],[$pi/4$],[$pi/3$],[$pi/2$],
  "cos", [$1$], [$sqrt(3)/2$], [$sqrt(2)/2$], [$1/2$], [$0$],
  "sin", [$0$], [$1/2$], [$sqrt(2)/2$], [$sqrt(3)/2$], [$1$],
  "tan", [$0$], [$frac(sqrt(3),3)$], [$1$], [$sqrt(3)$], [non défini]
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
a = "Partie réelle et notée" "Re"(z) \
b = "Partie imaginaire et notée" "Im"(z)
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
z * z^* = a^2 + b^2
$
cela signifie que nous pouvons obtenir *un nombre réel* en multipliant un nombre complexe par son conjugué.

== Propriétés
#image("/_src/img/docs/image copy 129.png")

$
"Module 1" = a^2 + b^2 = 1
$

Soit $z$ un nombre compelxe, alors:
$
z " est un nombre réel si et seulement si " z = z^* \
"Re"(z) = frac(z + z^*, 2) \
"Im"(z) = frac(z - z^*, 2j)
$

== Utilisation du discriminant
Regardons maintenant une application aux racines d'un polynôme à coefficients réels d'ordre 2.
$
Delta = b^2 - 4"ac"
$
On considère uniquement les cas ou $Delta < 0$. Le polymôme est donc irreductible sur $R$ mais est réductible sur $C$. Ses racines sont des nombres comlexes valant:
$
z_1 = frac(-b + j*sqrt(-Delta), 2a) " et " z_2 = frac(-b - j*sqrt(-Delta), 2a)
$
La décomposition de $P(x)$ sur les complexes donne:
$
P(x) = (z - z_1)(z - z_2)
$