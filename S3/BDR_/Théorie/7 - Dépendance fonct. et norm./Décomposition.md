---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Utilisation](#utilisation)
	- [Première décomposition](#premi%C3%A8re-d%C3%A9composition)
	- [Deuxième décomposition](#deuxi%C3%A8me-d%C3%A9composition)
- [SPI](#spi)
___
## Définition
>[!important]
>La décomposition en base de données relationnelles est le processus de décomposition d'une table en plusieurs tables plus petites tout en préservant les informations contenues dans la table d'origine. Cela permet d'organiser les données de manière plus efficace.
## Utilisation
| Première décomposition | Deuxième décomposition |
| ---- | ---- |
| ![](../../../../S0/PiecesJointes/Pasted%20image%2020231231150013.png) | ![](../../../../S0/PiecesJointes/Pasted%20image%2020231231150029.png) |
### Première décomposition
Dans ce cas nous pouvons déduire que la décomposition est **SPI** car après avoir joint les tables nous retrouvons la forme d'origine. En faisant cette décomposition nous avons pu voir que le modèle de la voiture est directement relié à la marque.
### Deuxième décomposition
Dans ce cas en décomposant avec en plus une relation `Type` et `Couleur` nous créons un problème. Il n'est plus possible de connaître la couleur de la voiture car vu que dans $r_{2}$ nous avons le même modèle avec deux couleur différentes, cela impliquera une duplication des tupples d'origines. Cette décomposition n'est **pas SPI**.
## SPI
SPI signifie **sans perte d'information**. Cela revient à une situation après décomposition ou en faisant une jointure sur toutes les décompositions nous retrouvons **exactement** la même table que celle d'origine.