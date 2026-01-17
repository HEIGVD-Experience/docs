#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Programmation Linéaire",
  course: "SIO - Simulation et optimisation",
  author: "Guillaume Trüeb",
  date: "17 janvier 2026",
  toc: true,
  col: 1,
  doc,
)

#set math.mat(delim: "[")

= Introduction à la Programmation Linéaire
La programmation linéaire est une méthode mathématique utilisée pour optimiser une fonction linéaire, appelée fonction objectif, sous certaines contraintes également linéaires. Elle est largement utilisée dans divers domaines tels que la gestion des ressources, la logistique, la production, et bien d'autres.

== Structure d'un problème
Un problème de programmation linéaire se compose généralement de trois éléments principaux :
- *Fonction objectif* : C'est la fonction que l'on cherche à maximiser ou minimiser. Elle est exprimée sous forme linéaire.
- *Variables de décision* : Ce sont les variables que l'on peut ajuster pour optimiser la fonction objectif.
- *Contraintes* : Ce sont les restrictions ou les limites imposées aux variables de décision, également exprimées sous forme linéaire.

== Résolution graphique
Une des méthodes les plus simples pour résoudre un problème de programmation linéaire à deux variables est la méthode graphique. Cette méthode consiste à tracer les contraintes sur un graphique, puis à identifier la région faisable et à déterminer le point optimal. Pour déterminer le point optimal, nous devons faire glisser la fonction objectif parallèlement jusqu'à ce qu'elle atteigne le dernier point de la région faisable.

== Résulats possibles
Lors de la résolution d'un problème de programmation linéaire, plusieurs résultats sont possibles :
- *Vide*: dans un tel cas, le problème est sans solution admissible et ne possède donc pas de solution optimale.
- *Borné* (et non vide): dans ce cas, le problème possède une solution optimale unique ou multiple.
- *Non borné*: dans ce cas, selon la fonction objectif choisie,
 - le problème peut posséder des solutions optimales;
 - il peut exister des solutions admissibles de valeur arbitrairement grande/petite (en cas de maximisation/minimisation). Dans une telle situation, on dit que le problème est non borné et que le PL n'admet pas de solution optimale (finie).

= Forme canonique
Un problème de programmation linéaire est dit être en forme canonique s'il est exprimé de la manière suivante :
$
  max z = &sum_(j=1)^(n) c_j x_j \
  "s.c." space space space space space space &sum_(j=1)^(n) a_"ij" x_j lt.eq b_i space space space &i = 1, ..., m \
  &x_j gt.eq 0 space &j = 1, ..., n

$

Nous pouvons définir la forme canonique par les critères suivants : 
- Problème de *maximisation*
- Toutes les variables sont *positives*
- Toutes les contraintes (sauf celle de s'assurer que les variables sont positives) sont du type *$lt.eq$*

== Expression matricielle
Un problème de programmation linéaire en forme canonique peut être exprimé de manière matricielle comme suit :
$
  "Max" z = &3x_1 + 2x_2 \
  "s.c." space space space space space space &2x_1 + x_2 &lt.eq 100 \
  &x_1 + x_2 &lt.eq 80 \
  &x_1 &lt.eq 40 \
  &x_1, x_2 &gt.eq 0
$

Nous pouvons le réecrire en utilisant les matrices suivantes:

- $arrow(c)$: vecteur des coefficients de la fonction objectif
- $arrow(x)$: vecteur des variables de décision
- $arrow(A)$: matrice des coefficients des contraintes
- $arrow(b)$: vecteur des termes constants des contraintes

$
  arrow(c) = mat(3; 2), arrow(x) = mat(x_1; x_2), arrow(A) = mat(2,1;1,1;1,0), arrow(b) = mat(100;80;40)
$

== Règles de transormmation
Pour transformer un problème de programmation linéaire en forme canonique, nous pouvons appliquer les règles suivantes :
- Pour la fonction objectif, si nous cherchons à minimiser, nous pouvons appliquer la conversion suivante
$
  min f(x) = -max(-f(x))
$
- Pour passer d'une contrainte de type $gt.eq$ à une contrainte de type $lt.eq$, nous multiplions les deux côtés de l'inégalité par -1 et cela nous permet d'inverser le sens de l'inégalité.
$
  a_1 x_1 + ... + a_n x_n gt.eq b <==> -a_1 x_1 - ... - a_n x_n lt.eq -b
$
- Pour transformer une contrainte d'égalité en deux contraintes d'inégalités, nous pouvons utiliser la conversion suivante :
$
  a_1 x_1 + ... + a_n x_n = b <==> 
  cases(
    a_1 x_1 + ... + a_n x_n lt.eq b,
    a_1 x_1 + ... + a_n x_n gt.eq b
  )
$
- Pour passer d'une inéquation à une équation, nous devons ajouter une variable décart non négative :
$
  a_1 x_1 + ... + a_n x_n lt.eq b <==> cases(
    a_1 x_1 + ... + a_n x_n + s = b, s gt.eq 0
    "avec" s gt.eq 0
  )
$
- Tout nombre réel peut être écrit comme la différence de deux nombres non négatifs :
$
  x in R <==> cases(x = x^+ - x^-, x^+\, x^- gt.eq 0)
$
Dans ce cas, nous devons remplacer chaque occurrence de $x$ par $x^+ - x^-$ dans la fonction objectif et les contraintes.
- Si une variable est bornée inférieurement :
$
  x gt.eq b <==> cases(x = x' + b, x' gt.eq 0)
$

= Technique de linéarisation de base
Certaines contraintes ou fonctions objectives ne sont pas linéaires. Pour les résoudre à l'aide de la programmation linéaire, nous devons les linéariser. Nous allobns voir comment le faire pour les fonctions minimum, maximum et valeur absolue.

== Contrainte min/max
Pour linéariser une contraite de *minimum*, il faut qu'elle soit sous la forme suivante :
$
  min("expr"_1, ..., "expr"_n) gt.eq b
$
Pour linéairser une contraite de *maximum*, il faut qu'elle soit sous la forme suivante :
$
  max("expr"_1, ..., "expr"_n) lt.eq b
$

Ces deux opérations peuvent être vues comme un opérateur *AND* logique. Pour linéariser ces contraintes, nous devons les transformer en plusieurs contraintes linéaires comme suit :
- Pour la contrainte de minimum :
$
  min("expr"_1, ..., "expr"_n) gt.eq b <==>
  cases(
    "expr"_1 gt.eq b,
    ...,
    "expr"_n gt.eq b
  )
$
_Donc toutes les expressions doivent être supérieures ou égales à b._

- Pour la contrainte de maximum :
$
  max("expr"_1, ..., "expr"_n) lt.eq b <==>
  cases(
    "expr"_1 lt.eq b,
    ...,
    "expr"_n lt.eq b
  )
$
_Donc toutes les expressions doivent être inférieures ou égales à b._

== Objectif min/max
Pour linéariser une fonction objective de *minimum*, il faut qu'elle soit sous la forme suivante :
$
  "Min" z = max("expr"_1, ..., "expr"_n)
$
Pour linéairser une fonction objective de *maximum*, il faut qu'elle soit sous la forme suivante :
$
  "Max" z = min("expr"_1, ..., "expr"_n)
$

Pour linéariser ces fonctions objectives, nous devons appliquer le processus suivant:
- Introduire une nouvelle variable $t$ qui représentera la valeur de la fonction objective.
$
  "Min" z = &t \
  "s.c" space space space space space space space &t = max{"expr"_1, ..., "expr"_n}
$
- Grâce à cette nouvelle variable $t$, nous pouvons trasnformer l'égalité en une opération plus grand ou égal.
$
  "Min" z = &t \
  "s.c" space space space space space space space &t gt.eq max{"expr"_1, ..., "expr"_n}
$
_Ensuite, nous pouvons linéariser ces objectifs en utilisant la même technique que pour les contraintes min/max._

#colbreak()
=== Exemple
Considérons le problème d'optimisation suivant :
$
  "Min" z = &max(3x_1 - 2x_2, -x_1 + 4x_2) \
  "s.c." space space space space space space &5x_1 - 3x_2 lt.eq 6 \
  &x_1, x_2 gt.eq 0
$
En appliquant la technique de linéarisation, nous introduisons une nouvelle variable $t$ et reformulons le problème comme suit :
$
  "Min" z = &t \
  "s.c." space space space space space space 5x_1 - 3x_2 &lt.eq 6 \
  t &gt.eq 3x_1 - 2x_2 \
  t &gt.eq -x_1 + 4x_2 \
  x_1, x_2 &gt.eq 0 \
  t &in \R
$
Voici un problème de programmation linéaire en forme canonique.

== Linéarisation d'une valeur absolue
=== Contrainte
La contrainte non linéaire
$
  |"expr"_1| lt.eq "expr"_2
$
est équivalente aux deux inéquations linéaires
$
  -"expr"_2 lt.eq "expr"_1 lt.eq "expr"_2 <==> cases(
    "expr"_1 lt.eq "expr"_2,
    "expr"_1 gt.eq -"expr"_2
  )
$

Les contraintes non linéaires
$
  |"expr"_1| gt.eq "expr"_2 space space space "et" space space space |"expr"_1| eq "expr"_2
$
ne sont pas linéarisables en général sans l'introduction de variables binaires supplémentaires.

=== Objectif
La fonction objective non linéaire
$
  "Min" z = |"expr"_1|
$
peut-être récrit sous la forme équivalente:
$
  "Min" z = &t \
  "s.c." space space space space space space space &t eq |"expr"_1| \
  &t gt.eq 0
$
qui possède le même optimum que:
$
  "Min" z = &t \
  "s.c." space space space space space space space &t gt.eq |"expr"_1| \
  &t gt.eq 0
$
et donc que sa linéarisation:
$
  "Min" z = &t \
  "s.c." space space space space space space space &-t lt.eq "expr"_1 lt.eq t \
  &t gt.eq 0
$