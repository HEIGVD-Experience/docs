---
Type: PriseDeNote
MiseAuPropre: oui
---

## Parcours post-ordonné
Le parcours post-ordonné à comme principe d'évaluer la valeur après avoir confirmé que le noeuds n'a pas d'enfant. De manière générale on évalue toujours l'élément de gauche en premier.

|Arbre|Evaluation|
|--|--|
|F, L, M, G, B, C, H, D, I, J, K, E, A|![[S0/PiecesJointes/Pasted image 20230523215910.png]]|
>[!important]
>La racine de l'arbre sera **toujours** évaluée en dernière.

## Parcours pré-ordonné
De la même manière que le parcours post-ordonné nous allons toujours commencer par l'élément de gauche. Dans le cas d'un parcours pré-ordonné, l'élément sera évalué au moment où on l'atteint.

|Arbre|Evaluation|
|--|--|
|A, B, F, G, L, M, C, D, H, E, I, J, K|![[S0/PiecesJointes/Pasted image 20230523215910.png]]|
>[!important]
>La racine de l'arbre sera **toujours** évaluée en première.

## Parcours en largeur
Dans le cas d'un parcours en largeur il suffit de lire les éléments de gauche à droite et ligne par ligne en partant de la racine.

|Arbre|Evaluation|
|--|--|
|A, B, C, D, E, F, G, H, I, J, K, L, M|![[S0/PiecesJointes/Pasted image 20230523215910.png]]|
