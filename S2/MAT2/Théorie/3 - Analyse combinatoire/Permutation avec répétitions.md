---
Type: PriseDeNote
MiseAuPropre: non
---

>[!important] Définition
>Dans le cas ou nous souhaitons calculer le nombre de permutations d'un objet composé de plusieurs fois les même éléments, il existe une formule différente de la formule initiale pour les permutations.

## Théorème (avec répétitions)
Si $n$ est le nombre d'objets dont nous voulons trouver le nombre de permutations la formule est donc : 
$$
\frac{n!}{n_{1}!*n_{2}!*n_{k}!}
$$
$n_{1}!*n_{2}!*n_{k}!$ étant le nombre de permutation interne de chaque éléments étant plusieurs fois dans notre ensemble.

## Application
Prenons le mot $PAPATATE$ et nous souhaitons connaître combien de possibilités de mots différents nous pouvons construire. Si nous annotons chaque lettres pour qu'elle devienne unique nous aurons :
$$
P_{1}A_{1}P_{2}A_{2}T_{1}A_{3}T_{2}E_{1}
$$
maintenant mettons les dans l'ordre
$$
P_{1}P_{2}A_{1}A_{2}A_{3}T_{1}T_{2}E_{1}
$$
nous aurons donc 
$$
P = 2, \>\> A = 3, \>\> T = 2, \>\> E = 1 \>\>\>\> et \>\>\>\> n = 8
$$
Maintenant appliquons la formule donnée ci-dessus :
$$
\frac{8!}{2!*3!*2!*1!} = \frac{8!}{2!*3!*2!} = \frac{4*5*6*7*8}{4} = 5*6*7*8 = 1680
$$
