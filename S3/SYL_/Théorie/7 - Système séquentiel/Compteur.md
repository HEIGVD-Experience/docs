---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Compteur](#compteur)
	- [Compteur classique](#compteur-classique)
	- [Décompteur](#d%C3%A9compteur)
	- [Table des fonctions synchrones](#table-des-fonctions-synchrones)

___
## Définition
>[!important]
>Un compteur est un module logique séquentiel qui ajuste ses sorties en fonction d'une séquence prédéfinie et en réaction à un signal d'horloge. Dans un compteur entièrement synchrone, tous les éléments de stockage (flip-flops) sont synchronisés avec le même signal d'horloge, assurant une évolution coordonnée des sorties.

## Compteur
### Compteur classique
Il existe plusieurs type de compteur celui-ci permet d'augmenter de le compteur à chaque coup de clock ou `En` est à 1.
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105154317.png)
### Décompteur
Dans le cas d'un décompteur il possède une entrée particulière supplémentaire appelée UP/DOWN permettant de définir si nous ajoutons 1 ou soustrayons 1.
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105154507.png)
### Table des fonctions synchrones
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105154806.png)