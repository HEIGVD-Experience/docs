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

=== Combinaison
La combinaison de $n$ éléments par $k$ est notée $binom(n, k)$ et est définie par:
$
binom(n,k) = frac(n!,k! dot (n-k)!)
$

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
La loi uniforme est utilisée pour représenter une variable aléatoire continue qui prend ses valeurs dans un intervalle $[a,b]$. On définit une variable aléatoire $X$ qui prend ses valeurs dans l'intervalle $[a,b]$.

La loi uniforme est composée de:
- deux paramètres $a$ et $b$ qui représentent les bornes de l'intervalle $[a,b]$ avec $a lt b$
- $H$ l'ensemble des valeurs possibles de $X$ qui est $H = [a,b]$
- fonction de densité de probabilité
$
f_x (u) =
cases(
  1/(b-a) &"si " a lt.eq u lt.eq b \
  0 &"sinon"
)
$
- fonction de répartition
$
F_x (x) =
cases(
  0 &"si " x lt a \
  (x-a)/(b-a) &"si " a lt.eq x lt.eq b \
  1 &"si " x gt b
)
$

L'espérance et la variance de la loi uniforme sont respectivement:
$
E(X) &= (a+b)/2 \
"Var"(X) &= (b-a)^2/12
$

*Notation:* $UU(a,b)$

=== Exemples
- heure indiquant la fin d'un batch informatique entre son heure de début et une durée maximale de 8 heures
- choix d'un point sur un segment
- distance de l'endroit d'une panne à une ville donnée

== Loi exponentielle
La loi exponentielle est utilisée pour représenter le temps entre deux événements rares consécutifs. On définit une variable aléatoire $X$ qui représente le temps entre deux événements rares consécutifs.

La loi exponentielle est composée de:
- un paramètre $lambda$ qui représente le taux d'occurrence des événements rares
- $H$ l'ensemble des valeurs possibles de $X$ qui est $H = [0, +infinity[$
- fonction de densité de probabilité
$
f_x (u) =
cases(
  lambda e^(-lambda u) &"si " u gt.eq 0 \
  0 &"sinon"
)
$
- fonction de répartition
$
F_x (x) =
cases(
  1 - e^(-lambda x) &"si " x gt.eq 0 \
  0 &"sinon"
)
$

L'espérance et la variance de la loi exponentielle sont respectivement:
$
E(X) &= 1/lambda \
"Var"(X) &= 1/lambda^2
$

*Notation:* $EE(lambda)$

=== Propriété sans mémoire

- Une variable aléatoire est dite *sans mémoire* si pour tous $s$ et $t$ positifs, 
$
P(X gt s + t | X gt t) = P(X gt s)
$

- Selon la définition des probabilités conditionnelles, la relation est équivalente à
$
(P(X gt s + t, X gt t))/(P(X gt t)) = P(X gt s)
$
ou encore
$
P(X gt s + t) = P(X gt s) dot P(X gt t)
$
Puisque 
$
e^(-lambda dot (s + t)) =  e^(-lambda s) dot e^(-lambda t)
$

=== Exemples
- temps d'attente d'un phénomène poissonnien de taux $lambda$ : temps d'attente du premier événement ou temps entre deux événements consécutifs
- durée de vie d'un composant électronique
- durée d'une conversation téléphonique

== Loi normale (Laplace - Gauss)
La loi normale est utilisée pour représenter une variable aléatoire continue qui suit une distribution symétrique en forme de cloche. On définit une variable aléatoire $X$ qui suit une distribution normale.

La loi normale est composée de:
- deux paramètres $mu in RR$ et $sigma^2 in RR^+$ qui représentent respectivement la moyenne et l'écart-type de la distribution au carré
- $H$ l'ensemble des valeurs possibles de $X$ qui est $H = RR$
- fonction de densité de probabilité
$
f_x (u) = 1/(sqrt(2 pi sigma^2)) e^(-((u-mu)^2)/(2sigma^2)), " " -infinity lt u lt infinity
$
- fonction de répartition
$
F_x (x) = integral_(-infinity)^x f_x (u) d u, " " -infinity lt x lt infinity
$

L'espérance et la variance de la loi normale sont respectivement:
$
E(X) &= mu \
"Var"(X) &= sigma^2
$

*Notation:* $NN(mu, sigma^2)$

=== Propriétés
Les aires des surfaces des graphes de densité valent:
- 0.683 pour $mu - sigma$ et $mu + sigma$
- 0.954 pour $mu - 2 sigma$ et $mu + 2 sigma$
- 0.997 pour $mu - 3 sigma$ et $mu + 3 sigma$

Pour centrer et réduire une variable aléatoire $X$ suivant une loi normale $NN(mu, sigma^2)$, on utilise la variable aléatoire $Z$ suivant une loi normale centrée réduite $NN(0, 1)$:
$
Z = (X - mu)/sigma
$