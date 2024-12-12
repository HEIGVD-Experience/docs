#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Loi discrètes et continues
  ],
  lesson: "PST",
  chapter: "6 - Distributions usuelles",
  definition: "Definition",
  col: 1,
  doc,
)

= Loi discrètes
== Loi de Bernoulli
On utilise la loi de Bernoulli lors-ce qu'on réalise une expérience dont l'issue est interprétée soit comme un *succcès* soit comme un *échec*. On définit une variable aléatoire $X$ qui prend la valeur 1 si le succès est réalisé et 0 sinon.

La loi de Bernoulli est composée de:

- un paramètre $p$ qui représente la probabilité de succès $0 lt.eq p lt.eq 1$
- $H$ l'ensemble des valeurs possibles de $X$ qui est $H = {0,1}$
- la loi de probabilité
$
P(X = x) = cases(p &"si" x = 1, 1-p=q &"si" x = 0)
$

L'espérance et la variance de la loi de Bernoulli sont respectivement:
$
E(X) &= p \
"Var"(X) &= p q
$

=== Exemples
- lancer d'une pièce de monnaie
- tirage d'une carte

== Loi binomiale
La loi binomiale est utilisée pour représenter le nombre de succès dans une série de $n$ expériences de Bernoulli indépendantes chacunes ayant $p$ comme probabilité de succès. On définit une variable aléatoire $X$ qui compte le nombre de succès dans les $n$ expériences.

La loi binomiale est composée de:

- un paramètre $n$ qui représente le nombre d'expériences
- un paramètre $p$ qui représente la probabilité de succès $0 lt.eq p lt.eq 1$ et $q = 1-p$
- $H$ l'ensemble des valeurs possibles de $X$ qui est $H = {0,1,2,...,n}$
- la loi de probabilité
$
P(X = x) = binom(n, x) p^x (1-p)^(n-x) = binom(n, x) p^x q^(n-x)
$

L'espérance et la variance de la loi binomiale sont respectivement:
$
E(X) &= n p \
"Var"(X) &= n p q
$

*Notation*: $BB(n,p)$

En posant $n = 1$, on obtient la loi de Bernoulli.

=== Exemples
- lancer d'une pièce de monnaie $n$ fois
- tirage de $n$ cartes

#colbreak()

== Loi géométrique
La loi géométrique est utilisée pour représenter le nombre d'expériences de Bernoulli indépendantes nécessaires pour obtenir le premier succès. On définit une variable aléatoire $X$ qui compte le nombre d'expériences nécessaires pour obtenir le premier succès.

La loi géométrique est composée de:

- un paramètre $p$ qui représente la probabilité de succès $0 lt.eq p lt.eq 1$ et $q = 1-p$
- $H$ l'ensemble des valeurs possibles de $X$ qui est $H = {1,2,3,...}$
- la loi de probabilité
$
P(X = x) = p(1-p)^(x-1) = p q^(x-1)
$

L'espérance et la variance de la loi géométrique sont respectivement:
$
E(X) &= 1/p \
"Var"(X) &= q/p^2
$

*Notation:* $GG(p)$

=== Exemples
- lancer d'une pièce de monnaie jusqu'à obtenir le premier succès
- tirage de cartes jusqu'à obtenir la première carte rouge

== Loi de Poisson
La loi de Poisson est utilisée pour représenter le nombre d'événements rares dans un intervalle de temps ou d'espace donné. On définit une variable aléatoire $X$ qui compte le nombre d'événements rares dans un intervalle de temps ou d'espace donné.

La loi de Poisson est composée de:

- un paramètre $lambda$ qui représente le nombre moyen d'événements rares dans l'intervalle de temps ou d'espace donné
- $H$ l'ensemble des valeurs possibles de $X$ qui est $H = {0,1,2,...}$
- la loi de probabilité
$
P(X = x) = e^(-lambda) dot frac(lambda^x, x!)
$

L'espérance et la variance de la loi de Poisson sont respectivement:
$
E(X) &= lambda \
"Var"(X) &= lambda
$

*Notation:* $PP(lambda)$

Si $lambda = n p$ avec $n$ grand et $p$ petit, alors la loi de Poisson est une approximation de la loi binomiale $BB(n,p)$.

=== Exemples
- le nombre de fautes d'impression par page dans un livre;
- le nombre de pièces défectueuses dans une livraison importante, la production étant de bonne qualité;
- le nombre d'individus dépassant l'âge de 100 ans dans une communauté;
- le nombre de faux numéros téléphoniques composés en un jour.

= Loi continues
== Loi uniforme
== Loi exponentielle
== Loi normale (Laplace - Gauss)