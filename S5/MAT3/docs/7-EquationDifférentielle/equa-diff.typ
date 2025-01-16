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
Une equation différentielle linéaire est dite *homogène* si
$
a_n y^n + dots + a_2y'' + a_1' + a_0y = 0 "avec" a_k in RR
$

Dans les EDO linéaire homogène à coefficients constants, on cherche des solutions de cette équation dans la famille des exponentielles, sous la forme
$
y(x) = e^(lambda x)
$
avec $lambda$ *réel* ou *complexe*.

Pour résoudre ce type d'équations nous devons utiliser le polynôme caractéristique.

=== Polynôme caractéristique
Le polynôme caractéristique se construit en s'appuyant sur le degré de dérivation de l'équation différentielle et les coefficients de l'équation. Cela permet de trouver une polynôme de degré $n$ qui nous aidera à trouver les solutions de l'équation.

==== Exemple
EDO: $y'' - 3y' + 2y = 0$

Polynôme caractéristique: $lambda^2 - 3lambda + 2 = 0$

Solutions: $lambda_1 = 1$ et $lambda_2 = 2$

=== Equation d'ordre 1
Prenons l'exemple d'une EDO linéaire d'ordre 1 homogène à coefficients constants
$
a y' + b y = 0
$
avec $a$ et $b$ des constantes et $a eq.not 0$.

On y injecte la solution $y(x) = e^(lambda x)$ et $y'(x) = lambda e^(lambda x)$ nous aurons donc
$
e^(lambda x) (a lambda + b) = 0
$
De ce fait, la valeur $lambda$ doit être solution de l'équation caractéristique
$
a lambda + b = 0
$
Cette solution est
$
lambda = - frac(b, a)
$
La *solution générale de l'équation homogène* est
$
y(x) = y_h (x) = C e^(- frac(b, a) x), C in RR
$

==== Nota bene
Nous pouvons aussi traiter l'equation en utilisant la méthode des variables séparables.
$
(y'/y) = - b/a
$
puis après intégration
$
ln |y| = - frac(b, a) x + C
$
en résolvant par rapprt à $y$ nous obtenons
$
abs(y) = e^(C) dot e^(- frac(b, a) x) " puis " y eq plus.minus e^(C) e^(- frac(b, a) x), C in RR
$
On y retrouve donc la solution générale de l'équation homogène
$
y(x) = C e^(- frac(b, a) x), C in RR
$

=== Equation d'ordre 2
Prenons l'exemple d'une EDO linéaire d'ordre 2 homogène à coefficients constants
$
a y'' + b y' + c y = 0
$
avec $a$, $b$ et $c$ des constantes et $a eq.not 0$.

Comme pour le cas d'ordre 1 nous décidons d'injecter la fonction $y(x)$ ainsi que ses dérivées
- $y(x) = e^(lambda x)$
- $y'(x) = lambda e^(lambda x)$
- $y''(x) = lambda^2 e^(lambda x)$

Nous retrouvons donc les valaurs suivantes pour satisfaire l'équation caractéristique
$
a lambda^2 + b lambda + c = 0
$

Nous pouvons rencontrer 3 cas
1. L'équation caractéristique possède *deux* solutions *réelles* distinctes $lambda_1$ et $lambda_2$
2. L'équation caractéristique possède *une* solution *réelle* double $lambda_1 = lambda_2$
3. L'équation caractéristique possède *deux* solutions *complexes* conjuguées $lambda_1 = alpha + j beta$ et $lambda_2 = alpha - j beta$

Dans le cas 1, la solution générale de l'équation homogène est
$
y(x) = y_h(x) = C_1 e^(lambda_1 x) + C_2 e^(lambda_2 x), C_1, C_2 in RR
$

Dans le cas 2, la solution générale de l'équation homogène est
$
y(x) = y_h(x) = (C_1 + C_2 x) e^(lambda x), C_1, C_2 in RR
$

Dans le cas 3, la solution générale de l'équation homogène est
$
y(x) = y_h(x) = e^(alpha x) (C_1 cos(beta x) + C_2 sin(beta x)), C_1, C_2 in RR
$

== EDO non homogène