 #import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Equation différentielle,
  ],
  lesson: "MAT3",
  chapter: "Equation différentielle",
  definition: "Definition",
  col: 1,
  doc,
)

= Equation différentielle
Une équation différentielle est une équation qui contient une fonction inconnue et une ou plusieurs de ses dérivées. L'*ordre* d'une équation différentielle est l'ordre de la plus haute dérivée présente dans l'équation.
Dans le cas suivant on considère une équation différentielle d'ordre 1.
$
y'(x) = x dot y(x)
$
Pour un ordre 2, on aurait une équation de la forme
$
y''(x) + y'(x) - 6 dot y(x) = 0
$

#rect(fill: silver, width: 100%)[*Résoudre* une équation différentielle consiste à trouver *toutes* ses solutions possibles. Cet ensemble de fonctions définit la solution générale de l'équation.]

== Problème à condition initiale (problème de Cauchy)
- Dans les applications, ce n'est pas tant la solution générale d'une équation différentielle qui est intéressante mais plutôt une solution spécifique vérifiant une ou plusieurs contraintes supplémentaires.
- Ces contraintes, appelées *condition initiale*, consistent le plus souvent à fixer la valeur de la solution et de ses premières dérivées à un instant donné (*il faut autant de conditions que l'ordre de l'équation différentielle*).

=== Exemple
$
cases(
  y'(x) &= x^3 \
  y'(2) &= 1
) \ \

y(x) = frac(x^4, 4) + C \ \
"On remplace " y(x) "par la condition initiale" 1 "et" x "par" 2 \ \
1 = frac(2^4, 4) + C \
1 = 4 + C \
C = -3 \ \
"La solution du problème de Cauchy sera donc" \ \
y(x) = frac(x^4, 4) - 3
$

= Equation différentielle d'ordre 1 à variables séparables
Une équation différentielle d'ordre 1 est dite à *variables séparables* si elle peut s'écrire sous la forme
$
h(y(x)) dot y'(x) = g(x)
$
ou de manière plus compacte
$
h(y)y' = g(x)
$

= Equation différentielle linéaire
Une équation différentielle est dite *linéaire* si elle est linéaire en $y$ (la fonction inconnue) et en ses dérivées. Donc pour être linéaire, toutes les dérivées de $y$ incluant $y$ elle-même doivent être de degré 1.

== EDO linéaire
=== Forme générale
La forme générale d'une équation différentielle linéaire d'ordre $n$ est
$
a_n(x)y^n + dots + a_2(x)y'' + a_1(x)y' + a_0(x)y = b(x)
$
où $a_i(x)$ et $b(x)$ sont des fonctions données de $x$.

==== Exemple
$
y'' - (x+1)y' + 3y = x^2 + 1
$
*est* linéaire car toutes les dérivées de $y$ sont de degré 1.
$
y'y = x 
$
*ne l'est pas* car $y$ est multipliée par $y'$.

== EDO à coefficients constants
Une équation différentielle linéaire d'ordre $n$ est dite à *coefficients constants* si les coefficients $a_i$ sont des constantes donc $in RR$.

=== Forme générale
$
a_n y^n + dots + a_2y'' + a_1y' + a_0y = b(x)
$

=== Exemple
$
y'' + y' - 6y = (x+1)e^(3x)
$
est une équation différentielle linéaire à coefficients constants d'ordre 2.

== EDO homogène
