---
Type: PriseDeNote
MiseAuPropre: oui
---
## Définition
>[!important]
>Un minterme de n variables est un monôme possédant les n variables, sous forme vraie ou inversée. Il existe un minterme par état d'entrée d’une fonction combinatoire (ou ligne de la table de vérité)

## Exemple
Dans le cas de la table de vérité analysée sur une porte AND nous pouvons en tirer les résultats suivants:

| Minterme | A | B | AND (A.B) |
|----------|----|----|----------|
|    0    | 0 | 0 |    0     |
|    1    | 0 | 1 |    0     |
|    2    | 1 | 0 |    0     |
|    3    | 1 | 1 |    1     |

Nous pouvons donc analyser qu'une fonction à 2 entrées possèderas 4 mintermes, une à 3 entrées 8 mintermes. Nous avons donc une relation :
$$
2^{nbr. \> d' \> entrée}
$$
