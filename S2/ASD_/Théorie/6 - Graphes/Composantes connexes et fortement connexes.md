---
Type: PriseDeNote
MiseAuPropre: oui
---

## Composante connexe
>[!important] Définition
>Une composante connexe autrement dite `CC` représente tous les sommets reliés par un parcours DFS (ou BFS) en partant d'un sommet quelconque.

### Algorithmes
- Un parcours DFS (ou BFS) permet d’atteindre tous les sommets connexe à un sommet donné.
- On marque tous les sommets atteints avec le même indice de composante connexe
- S’il reste des sommets non marqués, on incrémente l’indice de CC et on recommence
- Complexité identique à celle des parcours
![[S0/PiecesJointes/Pasted image 20230624134009.png]]
Dans ce graph nous pouvons voir que il existe zone ou aucun lien entre celle-ci existe.