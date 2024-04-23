---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Systèmes séquentiels](#syst%C3%A8mes-s%C3%A9quentiels)
- [Bascule](#bascule)
	- [Type de bascules par état(s)](#type-de-bascules-par-%C3%A9tats)
	- [Bascule bistable](#bascule-bistable)
___
## Définition
>[!important]
>Il existe deux types de système, les systèmes séquentiels et les système combinatoires.
>### Systèmes combinatoires
>-  Etat des sorties dépend uniquement des entrées 
>- Système univoque
>### Systèmes séquentiels
>- Etat des sorties dépend des entrées et de l'historique (événements passés)
>- Implique une mémorisation

## Systèmes séquentiels
La valeur des sorties dans un système séquentiel ne dépend pas uniquement des valeurs des entrées à l'instant présent, **mais également de la valeur des entrées dans les instants précédents**.

Les systèmes séquentiels introduisent donc la notion de **mémoire** (pour stocker l’état du système) et **d'horloge** (pour déterminer les instants de mesure).
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105114357.png)
## Bascule
Une bascule est un module logique permettant d'initialiser et de stocker une valeur logique.
- Le circuit a un comportement séquentiel
- Il contient qu'une seule sortie à deux états
- Il ne contient pas plus de deux états stables
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105115314.png)
### Type de bascules par état(s)
- Astable -> aucun état stable
- Monostable -> 1 état stable
- Bistable -> 2 états stables

### Bascule bistable
- 2 états stables 
- Des actions sur les entrées permettent de forcer un état ou un changement d’état 
- En l’absence de nouvelles actions, l’état est maintenu 
	- **Effet de mémorisation**
- L’état ne dépend pas uniquement de l'état actuel des entrées, **mais aussi de l'historique des évènements**
