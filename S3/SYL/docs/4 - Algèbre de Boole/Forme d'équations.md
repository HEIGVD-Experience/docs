---
Type: PriseDeNote
MiseAuPropre: oui
---
## Forme canonique algébrique
>[!important]
>La forme canonique algébrique est l'expression ou tous les mintermes sont à 1 avec l'expression des valeurs correspondantes.

Prenons l'exemple de la fonction **OU**

| Minterme | B | A | Z |
|----------|---|---|-----------|
|    0    | 0 | 0 |     0     |
|    1    | 0 | 1 |     1     |
|    2    | 1 | 0 |     1     |
|    3    | 1 | 1 |     1     |

Nous aurons l'expression canonique algébrique suivante:
$$
Z(B,A) = \bar{B}A + B \bar{A} + BA 
$$
## Forme algébrique minimale
>[!important]
>Exactement la même chose que la forme canonique algébrique, sauf que dans notre cas nous souhaitons simplifier au maximum la forme.

Pour ce faire il existe deux techniques : 
- en utilisant l'algèbre de Boole (algébrique)
- en utilisant une table de Karnaugh (graphique)

## Forme canonique décimale
>[!important]
>La forme canonique décimale corresponds à la somme de tous les numéros de mintermes ou la valeur résultante est égale à 1.

Prenons exemple sur la table de vérité suivante:

| Minterme | C | B | A | F |
|----------|---|---|---|---|
|    0    | 0 | 0 | 0 | 1 |
|    1    | 0 | 0 | 1 | 0 |
|    2    | 0 | 1 | 0 | 0 |
|    3    | 0 | 1 | 1 | 1 |
|    4    | 1 | 0 | 0 | 0 |
|    5    | 1 | 0 | 1 | 1 |
|    6    | 1 | 1 | 0 | 0 |
|    7    | 1 | 1 | 1 | 1 |

Nous aurons donc la forme suivante:
$$
F(C,B,A) = \sum0,3,5,7
$$

