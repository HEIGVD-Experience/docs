---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Un arbre binaire de recherche autrement dit ABR est une structure de données. Il est une extension de l'arbre générique en appliquant quelques règles : 
- le degré d'un ABR est de 2
- contient des clés comparables
- le sous-arbre gauche est forcément plus petit que le noeud et le sous-arbre droite est forcément plus grand

## Recherche d'un élément
De la contrainte qu'un ABR doit forcément avoir son enfant gauche plus petit que sa racine et son enfant droite plus grand que sa racine pour naviguer et trouver la valeur que nous souhaitons, il suffit de descendre progressivement dans l'arbre.
```cpp
fonction chercher (r, k) 
si r est ⌀ 
	// k n’est pas dans l’arbre 
sinon, si k == r.clé 
	// r est le noeud cherché 
sinon, si k < r.clé 
	chercher(r.gauche, k) // on continue à chercher à gauche
sinon // k > r.clé -> on continue à chercher à droite
	chercher(r.droit, k)
```

## Ajouter un élément
Pour ajouter un élément dans l'arbre, il suffit de parcourir l'arbre tout en cherchant le noeud dans le quel la valeur pourrait s'insérer. N'oublions pas qu'un ABR a comme condition que tout élément se trouvant à droite de la racine doit être plus grand et tout élément à gauche doit être plus petit.
![](/_src/img/docs/Pasted image 20230527135636.png)
Dans cette situation on voit que la valeur 5.5 est :
- plus petite que 8 -> on va à gauche
- plus grande que 4 -> on va à droite
- plus petite que 6 -> on va à gauche
- jusqu'à que plus grand que 5 soit un `nullptr` et la on place la valeur `5.5`

## Supprimer un élément
#### Degré 0
Dans le cas d'une suppression d'un élément de degré 0 autrement dit d'une **feuille**, cela n'a aucun impact sur l'arbre binaire.
#### Degré 1
Dans le cas ou l'élément à supprimer est de degré 1, il suffit de rattacher l'élément qui lui est rattaché à la racine situé au dessus.
#### Degré 2
Dans le cas ou l'élément à supprimer possède deux sous-arbres alors il faut utiliser la technique de `Thomas N. Hibbard` qui consiste à aller chercher soit le **minimum du sous-arbre droit** soit le **maximum du sous-arbre gauche**.
>[!attention]
>Dans le cas ou nous devrions supprimer plusieurs élément de degré 2, il peut être important de varier les techniques pour éviter que l'arbre de devienne dégénerer.
