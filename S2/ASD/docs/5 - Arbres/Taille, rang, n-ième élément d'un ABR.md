---
Type: PriseDeNote
MiseAuPropre: oui
---

## Taille
La taille d'un arbre correspond au **nombre de noeuds de l'arbre**. Stocker la taille dans chaque noeuds permet d'accélérer les algorithmes de parcours, ajout et suppression.
>[!attention]
>Il est important de maintenir cette information à jour de ce fait, à chaque suppression ou ajout, il faut parcourir l'arbre pour mettre à jour l'attribut.

Une fonction récursive simple mais robuste permet de mettre à jour ce champ taille.
```cpp
fonction taille (r)
	si r == ⌀,    retourner 0
	sinon,         retourner taille( r.gauche ) + taille( r.droite ) + 1
```

## Rang d'une clé
Le rang d'une clé correspond au nombre de clé étant plus petite que celle du noeud en question. Dans le cas ou toutes les clés se suivent on peut dire que le rang est $clé-1$. Le rang d'une clé représente sa position relative dans l'ordre linéaire des clés de l'ABR.

## N-ième élément
Grâce au rang discuté ci-dessus il devient possible de trouver de manière linéaire quel est le 3ème élément en utilisant l'information du rang.