---
Type: PriseDeNote
MiseAuPropre: oui
---

>[!important] Définition Kosaraju-Sharir
>L'algorithme de Kosaraju-Sharir est un algorithme utilisé pour trouver les composantes fortement connexes d'un graphe orienté. Une composante fortement connexe est un sous-ensemble de nœuds d'un graphe dans lequel il existe un chemin entre chaque paire de nœuds.

## Fonctionnement
1. Inverser tous les arcs du graphe
2. Faire un **DFS** en post-ordre sur le graphe
3. Inverser les valeurs trouvée et les garder sous-forme de tableau
4. Faire un **DFS** en **pré-ordre** sur le graphe de base en se basant sur l'ordre des valeurs trouvée au point 3
5. Dès qu'un arbre n'a plus de solutions il faut considérer cela comme un **CFC**


