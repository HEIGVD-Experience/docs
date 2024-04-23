---
Type: PriseDeNote
MiseAuPropre: oui
---

## Tri comptage

### Définition
Le tri comptage est tri permettant de ne faire aucune comparaison entre des valeurs. Toute la technique repose sur le fait de créer des indices avec nos valeurs et de définir des slots pour ces éléments dans un nouveaux tableau.

>[!info]
>Ce tri est un tri stable. C'est pourquoi nous pouvons l'appliquer plusieurs fois, sur plusieurs clées permettant de le trier toujours de manière plus précise.

### Compléxité
La compléxité de cet algorithme est de :
$$O(n + b)$$
pour $b$ étant le nombre de catégorie dans lesquelles ranger nos valeurs.

## Tri par base

### Définition
Le tri par base est un tri se basant sur le **tri comptage** et passant plusieurs fois pour trier par exemple des nombres. Dans le cas de nombre, nous allons passer une première fois pour trier le tableau sur le nombre d'un chiffre, ensuite sur les dizaines, sur les centaines, etc...

### Compléxité
La compléxité de cet algorithme est de : 
$$ O(d.(n+b)) $$
pour $b$ étant le nombre de catégorie dans lesquelles ranger nos valeurs et $d$ étant...