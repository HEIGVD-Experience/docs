---
Type: PriseDeNote
MiseAuPropre: oui
---

>[!important] Définition
>Le tri topologique consiste à redessiner un graphe orienté acyclique (**DAG**) pour que tous ses arcs pointent dans la même direction.
![[S0/PiecesJointes/Pasted image 20230625160201.png]]

## Fonctionnement
Pour faire un tri topologique il suffit de suivre les étapes suivantes : 
1. Faire **DFS** en post-ordre sur le graphe
2. Inverser les valeurs trouvées
3. Contrôler que l'ordre est bon

>[!attention]
>**Le tri topologique n'est pas possible pour un graphe comprenant un circuit.** Si un circuit est découvert pendant le parcours il faut stopper le parcours et dire que le tri topologique n'est pas possible.

