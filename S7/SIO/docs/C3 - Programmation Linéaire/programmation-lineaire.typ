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
  |"expr"_1| lt.eq "expr"_2 space space space "ou" space space space "expr"_1 gt.eq |"expr"_2|
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

= Analyse de sensibilité
L'analyse de sensibilité étudie le comportement de la solution optimale d'un programme linéaire et de sa valeur lorsque l'on modifie légèrement les coefficients du problème (qui ne sont pas toujours connus avec une précision parfaite).

Deux questions principales sont abordées :
- *Analyse de la fonction objectif* : Comment se comporte la solution optimale et sa valeur lorsqu'on modifie un coefficient de la fonction objectif ?
- *Analyse du second membre* : Comment se comporte la solution optimale et sa valeur lorsqu'on modifie le second membre (terme constant) d'une contrainte ?

== Sensibilité de la fonction objectif
Considérons le problème de Geppetto SA :
$
  "Max" z = &3x_1 + 2x_2 \
  "s.c." space space space &2x_1 + x_2 lt.eq 100 \
  &x_1 + x_2 lt.eq 80 \
  &x_1 lt.eq 40 \
  &x_1, x_2 gt.eq 0
$

La solution optimale est : $x_1 = 20$ soldats, $x_2 = 60$ trains, avec $z = 180$ francs.

=== Modification d'un coefficient
Que se passe-t-il si on modifie le coefficient $c_1$ (actuellement 3) dans la fonction objectif ?

*Géométriquement*, cela modifie la pente des lignes de niveau de la fonction objectif :
- Si $c_1 = 2$ : Les lignes de niveau deviennent $2x_1 + 2x_2 = "constante"$. On obtient deux sommets optimaux : $(20, 60)$ et $(0, 80)$, avec une infinité de solutions optimales entre ces points (valeur = 160).
- Si $c_1 = 3$ : Solution unique $(20, 60)$ avec $z = 180$ (situation actuelle).
- Si $c_1 = 4$ : Les lignes de niveau deviennent $4x_1 + 2x_2 = "constante"$. On obtient deux sommets optimaux : $(20, 60)$ et $(40, 20)$, avec une infinité de solutions optimales (valeur = 200).

=== Intervalle de stabilité
*Principe général* : Quand on modifie un coefficient de la fonction objectif, le sommet optimal actuel et la base associée restent optimaux tant que ce coefficient varie dans un intervalle $[a, b]$.

- Dans cet intervalle, la *solution optimale* (valeurs des variables) ne change pas.
- Seule la *valeur de la fonction objectif* est modifiée.
- Aux bornes de l'intervalle, on obtient généralement plusieurs solutions optimales.
- En dehors de l'intervalle, le sommet optimal change et on obtient un nouvel intervalle de stabilité.

Pour l'exemple : tant que $c_1 in ]2; 4[$, la solution optimale reste $(20, 60)$ et seule la valeur $z$ varie entre 160 et 200.

=== Rapport de sensibilité dans GLPK
Dans GUSEK, ces informations sont obtenues via *Tools → Generate LP Sensitivity Analysis (CTRL+9)*.

La *deuxième page* du rapport contient l'analyse pour la fonction objectif :

#figure(
  image("../img/image copy 18.png", width: 100%),
  caption: [Rapport GLPK - Analyse de sensibilité de la fonction objectif]
)

*Colonnes du rapport :*
- *Column name* : Nom de la variable de décision.
- *St (Status)* : Statut de la variable (BS = Basic, dans la base ; NU = Non-Upper, à sa borne supérieure).
- *Activity* : Valeur de la variable à l'optimum (solution actuelle).
- *Obj coef* : Coefficient actuel de la variable dans la fonction objectif.
- *Activity range* : Intervalle de variation de la valeur de la variable (si elle reste dans la base).
- *Obj coef range* : *Intervalle de stabilité* du coefficient — tant que le coefficient reste dans cet intervalle, la solution optimale ne change pas.
- *Obj value at break point* : Valeur de la fonction objectif aux bornes de l'intervalle de stabilité.
- *Limiting variable* : Variable qui entre/sort de la base aux bornes de l'intervalle.

*Interprétation pour $x_1$* :
- *Activity* = 20 : À l'optimum actuel, on produit 20 soldats.
- *Obj coef* = 3 : Le profit unitaire actuel est de 3 francs.
- *Obj coef range* = $[2, 4]$ : Tant que le profit unitaire des soldats varie entre 2 et 4 francs, la solution optimale reste $(x_1, x_2) = (20, 60)$.
- *Obj value at break point* = 160 / 200 : 
  - Si $c_1 = 2$, le profit total devient 160 francs.
  - Si $c_1 = 4$, le profit total devient 200 francs.
- *Limiting variable* = x3 / x4 : Aux bornes, les contraintes associées à $x_3$ et $x_4$ deviennent critiques.
- *Activity range* = $[-infinity, 40]$ : Si le coefficient sort de l'intervalle, $x_1$ pourrait varier entre 0 et 40.

#colbreak()

== Sensibilité du second membre
Reprenons le problème de Geppetto SA et modifions le second membre $b_2$ de la deuxième contrainte (actuellement 80).

=== Effet géométrique
Modifier $b_2$ provoque un *déplacement parallèle* de la droite délimitant le demi-plan admissible associé à cette contrainte.

La région admissible se déforme, et le sommet optimal peut changer ou se déplacer le long d'une arête.

=== Analyse similaire
De manière analogue à l'analyse de la fonction objectif, on peut déterminer :
- Un *intervalle de variation* $[b_"min", b_"max"]$ pour le second membre.
- Dans cet intervalle, la *base optimale* reste la même (mais les valeurs des variables changent).
- La valeur de la fonction objectif varie linéairement avec le second membre.
- Aux bornes de l'intervalle, la base optimale change.

=== Rapport de sensibilité dans GLPK
La première page du rapport contient l'analyse pour les contraintes (second membre) :

#figure(
  image("../img/image copy 19.png", width: 100%),
  caption: [Rapport GLPK - Analyse de sensibilité des contraintes]
)

*Colonnes du rapport :*
- *Row name* : Nom de la contrainte (ligne du problème).
- *St (Status)* : Statut de la contrainte (BS = Basic, contrainte non saturée ; NU = Non-Upper, contrainte saturée à sa borne).
- *Activity* : Valeur du membre de gauche de la contrainte à l'optimum.
- *Slack Marginal* : Marge (slack) et *prix dual* (ou variable duale) de la contrainte.
- *Lower/Upper bound* : Bornes actuelles du second membre.
- *Activity range* : *Intervalle de stabilité* du second membre — tant qu'il reste dans cet intervalle, la base optimale ne change pas.
- *Obj coef range* : Intervalle de variation du prix dual.
- *Obj value at break point* : Valeur de la fonction objectif aux bornes de l'intervalle.
- *Limiting variable* : Variable qui entre/sort de la base aux bornes.

*Interprétation pour la contrainte x3 (finissage : $x_1 + x_2 lt.eq 100$)* :
- *Activity* = 100 : La contrainte est *saturée* (on utilise les 100 heures disponibles).
- *Slack* = 0 (implicite par NU) : Il n'y a pas de marge, la contrainte est active.
- *Marginal* = 1 : Le *prix dual* est 1. Cela signifie que si on augmente $b_1$ d'une unité (de 100 à 101), le profit optimal augmente de 1 franc.
- *Activity range* = $[80, 120]$ : Tant que le second membre $b_1$ varie entre 80 et 120 heures, la base optimale reste la même (mais les valeurs des variables changent).
- *Obj value at break point* = 160 / 200 : 
  - Si $b_1 = 80$, le profit devient 160 francs.
  - Si $b_1 = 120$, le profit devient 200 francs.

*Interprétation pour la contrainte x5 (demande soldats : $x_1 lt.eq 40$)* :
- *Activity* = 20 : On produit 20 soldats (bien en-dessous de la limite de 40).
- *Slack* = 20 : Il reste une marge de 20 soldats avant d'atteindre la limite.
- *Marginal* = 0 : Le prix dual est nul. Augmenter cette limite n'améliorerait pas le profit (la contrainte n'est pas active).
- *Activity range* = $[dot, 50]$ : Si la limite passe au-dessus de 50, la base optimale change.

*Principe du prix dual* : Le prix dual d'une contrainte indique de combien augmente (ou diminue) la valeur optimale si on augmente le second membre de cette contrainte d'une unité, tant qu'on reste dans l'intervalle de stabilité. Les contraintes avec un prix dual élevé sont les plus "précieuses" (goulots d'étranglement).

== Utilité de l'analyse de sensibilité
L'analyse de sensibilité permet de :
- *Évaluer la robustesse* de la solution face aux imprécisions des données.
- *Identifier les paramètres critiques* dont la variation impacte fortement la solution.
- *Répondre à des questions de type "what-if"* sans résoudre à nouveau le problème.
- *Négocier les ressources* en connaissant leur impact marginal (prix duaux).

= Programme linéaires en nombres entiers
Un programme linéaire en nombres entiers (PLNE) est un programme linéaire où certaines variables ne peuvent prendre que des valeurs entières. On pourra distinguer:
- Les PLNE purs: *toutes* les variables sont contraintes à être entières.
- Les PL binaires: *toutes* les variables sont contraintes à être binaires (0 ou 1).
- Les PL mixtes: *certaines* variables sont contraintes à être entières, les autres pouvant être continues.

== Programme linéaire binaire
Un programme linéaire binaire (PLB) est un type particulier de PLNE où toutes les variables ne peuvent prendre que deux valeurs : 0 ou 1. Ces variables binaires sont utilisées pour modéliser des *décisions de type oui/non* :
- Sélectionner ou non un projet
- Construire ou non une usine
- Inclure ou non un élément dans un ensemble
- Activer ou non une ressource

Les PLB sont particulièrement adaptés pour résoudre des problèmes de :
- *Sélection optimale* (choisir les meilleurs éléments parmi un ensemble)
- *Affectation* (assigner des ressources à des tâches)
- *Couverture* (couvrir un ensemble d'exigences avec un minimum de ressources)
- *Ordonnancement* (planifier des activités dans le temps)

=== Exemple : Sélection de projets
Une entreprise dispose d'un budget de 100'000 francs et doit choisir parmi 4 projets à financer. Chaque projet a un coût et un bénéfice estimé :

#table(
  columns: (auto, auto, auto),
  inset: 8pt,
  align: horizon,
  [*Projet*], [*Coût (kCHF)*], [*Bénéfice*],
  [1], [40], [60],
  [2], [30], [45],
  [3], [50], [70],
  [4], [35], [50]
)

On introduit une variable binaire $x_i$ pour chaque projet :
$
  x_i = cases(
    1 "si le projet" i "est sélectionné",
    0 "sinon"
  ) space space space i = 1\, 2\, 3\, 4
$

Le problème se formule ainsi :
$
  "Max" z = &60x_1 + 45x_2 + 70x_3 + 50x_4 \
  "s.c." space space space &40x_1 + 30x_2 + 50x_3 + 35x_4 lt.eq 100 space &"(budget)" \
  &x_i in {0, 1} space &i = 1\, 2\, 3\, 4
$

*Solution optimale* :
$
  x_1 = 1\, x_2 = 1\, x_3 = 0\, x_4 = 1 space space space "avec" z = 155
$

== Modélisation avec des variables entières
Les variables entières sont souvent utilisées pour modéliser des situations où les décisions sont discrètes, telles que le nombre d'unités produites, le nombre de véhicules utilisés, ou la sélection de projets.

=== Variables discrètes
Pour modéliser une variable discrète qui peut prendre des valeurs dans un ensemble fini, nous pouvons utiliser des variables auxiliaires binaires. Considérons une variable $x$ qui ne peut prendre que deux valeurs :
$
  x = 0 space space space "ou" space space space x = b
$

Pour modéliser $x$, on introduit une variable auxiliaire binaire $y$ et on pose
$
  x = b y space space space "avec" y in {0, 1}
$

De manière générale, une variable *bivalente* se modèlise de la manière suivante :
$
  x in {a, b} space space space <==> space space space cases(
    x = a + (b - a) y,
    y in {0, 1}
  )
$

Dans le cas où une variable doit pouvoir prendre plusieurs valeurs discrètes, nous pouvons modéliser cela comme ça : 
$
  x in {2,5,10} space space space <==> space space space cases(
    x = 2 y_1 + 5 y_2 + 10 y_3,
    y_1 + y_2 + y_3 = 1,
    y_k in {0, 1}\, k = 1\, 2\, 3
  )
$

=== Fonction objectif avec coûts fixes
Il se peut arriver que la fonction objectif comporte des coûts fixes associés à l'activation de certaines variables.
$
  "Min" &z = K y + c x \
  "s.c." &dots\
  &x lt.eq M y &(1)\
  &0 lt.eq x lt.eq M \
  &y in {0, 1}
$

La contrainte (1) garantit que lorsque:
- $y = 0$, alors $x = 0$ (la variable n'est pas activée, donc pas de coût variable).
- $y = 1$, alors $x$ peut prendre n'importe quelle valeur entre 0 et $M$ (la variable est activée, donc le coût variable s'applique).
- Si $x > 0$, alors $y$ doit être égal à 1 (si la variable est activée, le coût fixe s'applique).
- Si $x = 0$, alors $y$ peut être égal à 0 ou 1 (si la variable n'est pas activée, le coût fixe ne s'applique pas).

#colbreak()

=== Variables semi-continues
Une variable semi-continue est une variable qui peut soit être égale à zéro, soit prendre une valeur dans un intervalle continu. Imaginons un intervalle $[a, b]$ :
$
  x = 0 space space space "ou" space space space a lt.eq x lt.eq b
$
Pour gérer ce cas nous devons introduire 2 variables auxiliaires : une variable binaire $y$ et une variable continue $t$.
$
  y = cases(
    1 "si" x in [a, b],
    0 "si" x = 0
  )
$
et
$
  0 lt.eq t lt.eq 1 space space space "servant à paramétrer l'intervalle" [a,b].
$
Nous pouvons alors modéliser $x$ de la manière suivante :
$
  x in {0} union [a,b] space space space <==> space space space cases(
    x = a y + (b - a) t space space space &(1),
    t lt.eq y &(2),
    0 lt.eq t lt.eq 1 &(3),
    y in {0, 1} &(4)
  )
$

Cette approche garantit que :
- Si $y = 1$, la contrainte (2) devient redondante avec les contraintes de borne (3) et (1) devient $x = a + (b-a)t$. La variable $x$ varie alors entre $a$ et $b$ lorsque $t$ varie entre 0 et 1.
- Si $y = 0$, les contraintes (2) et (3) forcent $t = 0$ et (1) devient $x = 0$.
- Si $t > 0$, la contrainte (2) force $y = 1$ et (1) devient $x = a + (b-a)t$ et $x$ varie entre $a$ et $b$.
- Si $t = 0$, on peut avoir $y = 0$ et $x = 0$ ou $y = 1$ et $x = a$.

=== Contraintes disjonctives (OU logique)
Les contraintes disjonctives modélisent des situations où *au moins une* contrainte parmi plusieurs doit être satisfaite.

Considérons deux contraintes dont au moins une doit être satisfaite :
$
  2x_1 + 3x_2 lt.eq 12 space space space "OU" space space space 3x_1 + x_2 lt.eq 9
$

Pour modéliser cette disjonction, on introduit une variable binaire $y$ et un nombre très grand $M$ :
$
  cases(
    2x_1 + 3x_2 lt.eq 12 + M(1-y),
    3x_1 + x_2 lt.eq 9 + M y,
    y in {0, 1}
  )
$

*Analyse :*
- Si $y = 1$ : la première contrainte est active, la seconde devient $3x_1 + x_2 lt.eq 9 + M$ (toujours satisfaite).
- Si $y = 0$ : la seconde contrainte est active, la première devient $2x_1 + 3x_2 lt.eq 12 + M$ (toujours satisfaite).

*Généralisation :* Pour satisfaire *au moins K contraintes parmi L*, on introduit une variable binaire $y_i$ par contrainte et on reformule :
$
  cases(
    sum_(j=1)^n a_"ij" x_j lt.eq b_i + M(1-y_i) space space space &i = 1\, ...\, L,
    sum_(i=1)^L y_i gt.eq K,
    y_i in {0\, 1} space space space &i = 1\, ...\, L
  )
$

=== Valeurs absolues
Nous pouvons facilement linéariser une contrainte avec valeur absolue de type $lt.eq$ en utilisant des inéquations linéaires.
$
  |sum_(j=1)^n a_j x_j| lt.eq b <==> -b lt.eq sum_(j=1)^n a_j x_j lt.eq b
$
*Exemple*
$
  |2x_1 + 3_x_2| lt.eq 12 space space space <==> space space space cases(
    2x_1 + 3x_2 lt.eq &12,
    2x_1 + 3x_2 gt.eq -&12
  )
$

Pour linéariser une contrainte avec valeur absolue de type $gt.eq$, on utilise des variables binaires car elle implique une disjonction (OU logique).

La contrainte non linéaire
$
  |sum_(j=1)^n a_j x_j| gt.eq b
$
est équivalente à la disjonction
$
  sum_(j=1)^n a_j x_j gt.eq b space space space "OU" space space space sum_(j=1)^n a_j x_j lt.eq -b
$

Pour modéliser cette disjonction, on introduit une variable binaire $y$ et un nombre très grand $M$ :
$
  cases(
    -sum_(j=1)^n a_j x_j lt.eq -b + M(1-y),
    sum_(j=1)^n a_j x_j lt.eq -b + M y,
    y in {0, 1}
  )
$

==== Exemple
La contrainte $|x_1 - 2x_2| gt.eq 5$ devient :
$
  cases(
    -x_1 + 2x_2 lt.eq -5 + M(1-y),
    x_1 - 2x_2 lt.eq -5 + M y,
    y in {0, 1}
  )
$

= Résolution des programmes linéaires en nombres entiers

== Relaxation linéaire
La *relaxation linéaire* (ou relaxation continue) d'un PLNE consiste à remplacer les contraintes d'intégralité par des contraintes de non-négativité.

*Exemple :*
$
  "PLNE:" space x_1, x_2 in NN space space space arrow.r.double space space space "Relaxation:" space x_1, x_2 gt.eq 0
$

Cette transformation convertit le PLNE en un PL classique en variables continues, plus facile à résoudre.

== Domaine admissible
- *PL* : Le domaine admissible est un polyèdre convexe (polytope si borné). La solution optimale se trouve à un sommet.
- *PLNE* : L'ensemble des solutions admissibles est un ensemble *discret et fini* de points à coordonnées entières.

Résoudre un PLNE est un *problème d'optimisation combinatoire* : trouver la meilleure solution parmi un ensemble fini (mais généralement gigantesque) de solutions.

== Cas favorables
Dans certains cas, la solution optimale de la relaxation linéaire est déjà entière :
- Si *tous les sommets* du domaine admissible de la relaxation linéaire sont entiers, résoudre le PLNE n'est pas plus difficile que résoudre sa relaxation linéaire.
- Exemple important : les *problèmes de transbordement* (réseaux de transport avec offres, demandes et capacités entières) garantissent toujours une solution optimale entière.

== Arrondir la solution : une fausse bonne idée
Lorsque la solution optimale de la relaxation linéaire n'est pas entière, peut-on simplement l'arrondir ?

*Deux difficultés majeures :*
1. *Admissibilité* : Comment arrondir (vers le haut, vers le bas, au plus proche ?) tout en garantissant que la solution reste admissible ? Il n'existe pas de méthode générale.
2. *Optimalité* : Même si la solution arrondie est admissible, rien ne garantit qu'elle soit optimale pour le PLNE.

*Exemple (sac à dos) :*
$
  "Max" z = &13x_1 + 16x_2 + 7x_3 + 4x_4 \
  "s.c." space space space &6x_1 + 8x_2 + 4x_3 + 3x_4 lt.eq 12 \
  &x_1, x_2, x_3, x_4 in {0, 1}
$

Solution de la relaxation : $(x_1, x_2, x_3, x_4) = (1, 0.75, 0, 0)$ avec $z = 25$.

Si on arrondit $x_2$ vers le bas : $(1, 0, 0, 0)$ donne $z = 13$ (admissible mais sous-optimal).

La vraie solution optimale est : $(0, 1, 1, 0)$ avec $z = 23$.