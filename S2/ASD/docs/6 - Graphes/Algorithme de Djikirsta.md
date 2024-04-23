---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition Djikstra
- L’algorithme de Dijkstra consiste à relaxer les arcs en parcourant le graphe par ordre de distance croissante au sommet de départ
- Pour cela, on remplace la file FIFO du parcours en largeur par une file de priorité où le sommet le plus prioritaire a la plus petite valeur $distTo(w)$ parmi les sommets non traités
- Problème : le même sommet peut vouloir être placé dans la file par plusieurs de ses voisins. Il y a deux solutions possible :
	- Accepter qu’un sommet soit présent plusieurs fois dans la file, mais ne le traiter que la première fois qu’il en sort
	- Ajouter à la file de priorité une opération permettant de modifier la priorité d’un élément

