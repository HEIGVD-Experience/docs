---
Type: PriseDeNote
MiseAuPropre: oui
---

## Différents parcours
Comme pour les arbres, on a deux stratégies possible pour parcourir tous les sommets d’un graphe. 

>[!attention]
>Cependant nous rencontrons un problème car il existe des graphes qui contiennent des arrêtes ou arcs sur eux mêmes ou sur un sommet qui retournera sur eux. Cela créera donc des cycles infinis.

Pour résoudre ce problème la solution choisie est de **marquer les sommets** déjà atteints par le parcours. 

### En profondeur (depth-first search) DFS
- Le parcours depuis un sommet n’atteint pas nécessairement tous les sommets du graphe
- On peut le parcourir tout le graphe en lançant un parcours DFS depuis chaque sommet non atteint par les parcours précédents
- Il est important de préciser l'ordre des indices des sommets pour définir la règle de choix lors-ce que un sommet et reliés à plusieurs

>[!important]
>L'algorithme du parcours en profondeur utilise une approche de pile (stack) pour gérer les nœuds à visiter. À chaque fois qu'un nœud est visité, il est ajouté à la pile et exploré en premier. Une fois qu'un noeud n'a plus de liaison, on remonte de manière récursive sur son appelant.

| Résultat                                   | Graphes                              |
| ------------------------------------------ | ------------------------------------ |
| Pré : `5 2 0 3 1 4 6 7 8`<br>Post : `0 1 4 3 7 8 6 2 5` | ![[/_src/img/docs/Pasted image 20230616231617.png]] |

**Pseudo-code**
```cpp
Précondition: les sommets sont marqués comme non visités 
fonction profondeur (sommet v, Fn pre, (opt.) Fn post)

pre(v) // en pré-ordre 

marquer v visité

pour tout w adjacent à v 
	si w n’est pas visité 
		profondeur(w, pre, post) 
		
post(v) // en post-ordre
```

## En largeur (breadth-first search) BFS
- Plutôt que de parcourir l’arbre niveau par niveau, on parcourt le graphe par distance croissante du sommet original
- Comme pour le parcours en profondeur, il faut marquer les sommets déjà visités

>[!important]
>L'algorithme du parcours en largeur utilise une approche de file d'attente pour gérer les nœuds à visiter. Les nœuds sont visités dans l'ordre où ils ont été ajoutés à la file d'attente, ce qui garantit que les nœuds adjacents au nœud de départ sont visités avant de passer aux nœuds plus éloignés.

**Pseudo-code**
```cpp
fonction largeur (sommet v, Fn action) 

Initialiser une file Q 
Q.push(v) 
marquer v 

tant que Q n’est pas vide 
	v ← Q.pop() 
	action(v) 
	pour tout w adjacent à v 
		si w n’est pas marqué 
			Q.push(w) 
			marquer w
```

>[!attention]
>Dans tous les cas, peut-importe le type de parcours, s'il existe un groupe de sommet non reliés au reste, ceux-ci ne seront jamais visités par le parcours.
>![[/_src/img/docs/Pasted image 20230616234615.png]]

