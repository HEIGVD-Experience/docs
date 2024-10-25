#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Introductiona aux nombres complexes
  ],
  lesson: "MAT3",
  chapter: "2 - Le corps des nombres complexes",
  definition: "Introduction aux nombres complexes, rappelant les séries arithmétiques et géométriques, le discriminant pour les équations quadratiques, et les propriétés des nombres complexes, y compris la forme cartésienne, le conjugué, et les opérations comme l'addition, la soustraction et la multiplication. Il explore également l'application du discriminant dans les polynômes irréductibles sur R mais réductibles sur C.",
  col: 1,
  doc,
)

= Rappel
== Série arithmétique
La formule pour calculer la valeur d'une série arithmétique est:
$
S(n) = n * frac("premier terme" + "dernier terme", 2)
$

== Série géométrique
=== Finie
La formule pour calculer la valeur d'une série géométrique finie est:
$
S(n) = "premier terme" * frac(1 - "raison"^("nb termes"), 1 - "raison")
$
=== Infinie
La formule pour calculer la valeur d'une série géométrique infinie est dans le cas ou la raison vérifie $bar r bar < 1$, nous utiliserons la formule:
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

== Delta
Dans le cas d'une équation du deuxième degré nous pouvons utiliser la formule du discriminant:
$
Delta = b^2 - 4"ac"
$
1. Si $Delta gt 0$ alors l'équation possède 2 solutions réelles:
$
x_(1,2) = frac(-b plus.minus sqrt(Delta), 2a)
$
2. Si $Delta = 0$ alors l'équation possède une unique solution réelle:
$
x_(1,2) = frac(-b, 2a)
$
3. Si $Delta lt 0$ alors l'équation n epossède pas de solution réelle.

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

Deux nombres complexes sont considéré comme égaux si:
$
z = a + "bj" " et " w = c + "dj" \
a = c " et " b = d
$

== Exemple
Dans un nombre complexe $z = 2 + 3j$ nous aurons:
$
"Re"(z) = 2 " et " "Im"(z) = 3
$

- Un nombre $z = 3 + 0j$ est un nombre réel
- Un nombre $z = 0 + 6j$ est un imaginaire pure

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

== Opposé
Un nombre complexe $z = a + "bj"$ possède un *opposé* $-z = -a - "bj"$ avec les propritétés usuelles:

$
z_1 - z_2 = z_1 - (+ z_2), " " z + (-z) = 0 " et " -z = (-1) * z
$

#table(
  align: center + horizon,
  columns: (1fr, 1fr),
  [$3 + 2j$], [$-3 - 2j$],
  image("/_src/img/docs/image copy 145.png"), image("/_src/img/docs/image copy 146.png")
)

== Inverse
Considérons $z = a + "bj"$ *non nul*, alors son inverse est:

$
z^(-1) = frac(1,z) = frac(1, a + "bj") = frac(a - "bj", a^2 + b^2)
$

= Conjugé complexes
Le conjugué d'un nombre complexe est obtenu en changeant le signe de la partie imaginaire. Il est noté: $overline(z)$. De ce fait on peut dire que :
$
z * z^* = a^2 + b^2
$
cela signifie que nous pouvons obtenir *un nombre réel* en multipliant un nombre complexe par son conjugué.

#table(
  align: center + horizon,
  columns: (1fr, 1fr),
  [$3 + 2j$], [$3 - 2j$],
  image("/_src/img/docs/image copy 145.png"), image("/_src/img/docs/image copy 147.png")
)

== Propriétés
#image("/_src/img/docs/image copy 129.png", height: 110pt)

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

== Discriminant avec $j$
Dans la situation ou notre $Delta$ est un nombre complexe, nous devons calculer la racine de ce nombre complexe pour avoir les deux possibilités. Pour cela nous devons poser $w^2 = Delta$ puis utiliser les propriétés des nombres complexes pour résoudre une équation à deux inconnues.

=== Exemple
Cherchons à résoudre l'équation suivante dans $CC$ :
$
(1-j)z^2 - 2z + 4-8j = 0 \
$
Première chose à faire, cherchons $Delta$ :
$
Delta = b^2 - 4a c "ici nous avons " \ 
a = 1-j, " " b = -2 " et " c = 4-8j \
Delta = -2^2 - 4(1-j)(4-8j) = 20 + 48j
$
Maintenant en déduisant de l'équation $w^2 = 20 + 48j$, nous pouvons en tirer les racines carrées du nombre complexe :

#columns(3)[
$
cases(
"Re"(w^2) &= "Re"(20 + 48j),
"Im"(w^2) &= "Im"(20 + 48j),
|w^2| &= |20 + 48j|
)
$
#colbreak()
#align(center)[
c.-à-d.
]
#colbreak()
$
cases(
a^2 - b^2 &= 20,
2a b &= 48,
a^2 + b^2 &= sqrt(20^2 + 48^2) = 52
)
$
]
#linebreak()
De ça nous pouvons additionner la première et la dernière équation :
$
a^2-b^2+a^2+b^2 &= 20 + 52 \
2a^2 &= 72 \
a^2 &= 36 \
a_(1,2) &= plus.minus 6
$

Remplacer $a$ dans la deuxième équation :
$
2 * 6 * b_1 &= 48 \
b_1 &= 4 \
"et" \
b_2 &= -4
$

Nous trouvons donc nos deux racines du nombre $w^2$
$
delta_1  = 6 + 4j " et " delta_2 = -6 - 4j
$

Puis utilisons la formule du $Delta$ en remplaçant la partie $sqrt(- Delta)$ par nos deux nombres complexes $delta_1$ et $delta_2$ :
$
z_1 = (2+6+4j)/(2-2j) = (8+4j)/(2-2j) = (4+2j)/(1-j) = 1+3j \
z_2 = (2-6-4j)/(2-2j) = (-4-4j)/(2-2j) = (-2-2j)/(1-j) = (-4j)/2 = -2j
$

Nous trouvons donc les deux solutions de l'équation $(1-j)z^2 - 2z + 4-8j = 0$ avec les valeurs $z_1 = 1+3j$ et $z_2 = -2j$.