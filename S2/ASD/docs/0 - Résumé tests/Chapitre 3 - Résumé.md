---
Type: Resume
MiseAuPropre: oui
---

### Résumé général des algorithmes de tri classique

|Nom|Principe|Stable/En place|Complexité|
|----|----|----|----|
|Tri à bulles|Faire remonter les plus grandes valeurs en faisant des comparaisons et des swaps.|Oui (si n'échange pas les éléments égaux) / Oui|Pire comp $O(n^2)$, Moyen $O(n^2)$, Meilleur $O(n)$|
|Tri par séléction|Prends la valeur la plus petite dans le reste des valeurs à trier et la swap avec la position `i`.|Non / Oui|Pire comp $O(n^2)$,  Moyen $O(n^2)$,  Meilleur $O(1)$|
|Tri par insertion|Insère la valeur en `i+1` et vient la placer dans la gauche du tableau. Décale tout le reste des éléments vers la droite.|Oui / Oui|Pire comp $O(n^2)$,  Moyen $O(n^2)$,  Meilleur $O(n)$|
|Tri par fusion|Approche récursive qui va diviser en `n` sous-tableaux, les trier puis les fusionner ensemble à nouveau|Oui / Non|$O(n*\log(n))$|
|Tri rapide|Permutter tous les éléments de telle sorte que tous ceux qui sont inférieurs au pivot soient à sa gauche et que tous ceux qui sont supérieurs au pivot soient à sa droite.|Non / Oui|Pire comp $O(n^2)$,  Moyen $O(n*\log(n))$,  Meilleur $O(n*\log(n))$|
|Tri comptage|Se base sur une caractéristique des données pour les triers sans les comparer. (Ex. Trier un jeu de carte par couleur)|Oui / Non|$O(n+b)$ b étant le nombre de clé de comptage|
|Tri par base|Se base souvent sur le tri comptage (car est stable) en l'effectuant plusieurs fois sur plusieurs base. (Ex. unité, dizaine, centaine)|Oui / Non|$O(d.(n+b))$ d étant le passage sur les compteurs et b passage sur le tableau|

### Tris de la STL

|Nom|Complexité|
|----|----|
|std::sort|$O(n*\log n)$|
|std::stable_sort|Si assez de mémoire : $O(n*\log n)$ sinon $O(n*\log^2n)$|
|std::nth_element|$O(n)$|
|std::partial_sort|$O(n*\log m)$ pour `n = last-first` et `m = middle - first`|

### Fonctions offertes par STL

|Nom|But|Complexité|
|----|----|----|
|std::lower_bound|Retourne un itérateur sur la première position ou la valeur est plus petite que la valeur donnée en paramètre.|$O(\log n)$|
|std::upper_bound|Retourne un itérateur sur le premier élément qui est plus grand que la valeur passée en paramètre.|$O(\log n)$|
|std::distance|Retourne la distance entre deux valeur d'un vecteur.|$O(n)$|
|std::generate|Affecte la valeur renvoyée par les appels successifs aux éléments de la plage.|$O(n)$|
