---
Type: PriseDeNote
MiseAuPropre: oui
---

L'algorithme de Dijkstra est un algorithme de recherche de chemin dans un graphe pondéré, souvent utilisé dans les réseaux de communication pour trouver le chemin le plus court entre deux nœuds. Voici les étapes principales de l'algorithme :

1.  Définir le nœud de départ et initialiser les distances de tous les autres nœuds à l'infini, sauf le nœud de départ dont la distance est fixée à zéro.
2.  Sélectionner le nœud non visité avec la distance la plus courte et le marquer comme visité.
3.  Mettre à jour la distance de tous les nœuds adjacents à ce nœud en ajoutant la distance de l'arête qui les relie au nœud de départ.
4.  Répéter les étapes 2 et 3 jusqu'à ce que tous les nœuds aient été visités ou que le nœud d'arrivée soit atteint.
5.  Si le nœud d'arrivée a été atteint, le chemin le plus court a été trouvé en suivant les distances mises à jour depuis le nœud de départ jusqu'au nœud d'arrivée.

L'algorithme de Dijkstra est un algorithme de recherche gloutonne, ce qui signifie qu'il sélectionne toujours le nœud non visité avec la distance la plus courte. Cependant, il ne garantit pas de trouver le chemin le plus court dans tous les cas, notamment s'il y a des boucles dans le graphe pondéré.![](/_src/img/docs/dijkstra.gif)