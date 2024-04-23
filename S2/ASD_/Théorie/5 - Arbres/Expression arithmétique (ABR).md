---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Un arbre peut contenir des données mais peut aussi contenir des opérations. De ce fait il est possible de construire un arbre qui contient à la fois des données ainsi que des opérations. Quelques conditions sont nécessaires :
- arbre binaire donc degré 2
- noeuds internes doivent contenir un opérateur (ex : $+,-,*,/$)

|                                         | Arbre                                              |
| ---------------------------------------- | ---------------------------------------------- |
| Prenons comme exemple l'arbre suivant -> | ![[/_src/img/docs/Capture d’écran 2023-05-28 à 11.14.47.png]] |

## Parcours de l'arbre
### Préfixe
La notation préfixe d'un arbre contenant des expressions arithmétiques correspond à la lecture pré-ordonnée d'un ABR.

La notation préfixe de l'arbre ci-dessus donnera : `* a + b c`

### Postfixe
La notation postfixe d'un arbre contenant des expressions arithmétiques correspond à la lecture post-ordonnée d'un ABR.

La notation postfixe de l'arbre ci-dessus donnera : `a b c + *`

### Infixe
La notation infixe d'un arbre contenant des expressions arithmétiques correspond à la lecture symétrique d'un ABR.

La notation infixe de l'arbre ci-dessus donnera : `(a * (b + c))`
