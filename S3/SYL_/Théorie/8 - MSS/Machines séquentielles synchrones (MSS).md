---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Machine séquentielles](#machine-s%C3%A9quentielles)
	- [Machine de Medvedev](#machine-de-medvedev)
	- [Machine de Moore](#machine-de-moore)
	- [Machine de Mealy](#machine-de-mealy)
- [Comparaison Moore-Mealy](#comparaison-moore-mealy)
- [Représentation du fonctionnement](#repr%C3%A9sentation-du-fonctionnement)
	- [Chronogramme](#chronogramme)
	- [Graphes des états](#graphes-des-%C3%A9tats)
		- [Règles de construction](#r%C3%A8gles-de-construction)
	- [Table des états](#table-des-%C3%A9tats)
		- [Réduire le nombre d'états](#r%C3%A9duire-le-nombre-d%C3%A9tats)
- [Codage des états d'une MSS](#codage-des-%C3%A9tats-dune-mss)
	- [Exemple de codage](#exemple-de-codage)

___
## Définition
>[!important]
>Dans une machine séquentielle synchrone, les différentes parties du système effectuent leurs opérations de manière ordonnée et synchronisée avec une horloge. Cela permet de contrôler le flux d'information et de garantir que chaque étape est complète avant le passage à la suivante.

## Machine séquentielles
### Machine de Medvedev
- Sorties correspondent directement aux bits d'états
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240106101912.png)
### Machine de Moore
- Sorties dépendent uniquement de l'état présent
- Le changement des sorties est synchrone: il se fait avec le changement des états
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240106101938.png)
### Machine de Mealy
- Sorties dépendent de l'état présent et des entrées
- Le changement des sorties est asynchrone: il se fait avec le changement des entrées
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240106101954.png)
## Comparaison Moore-Mealy
- Tout problème peut être résolu par une machine de type Mealy ou Moore
- Une machine de Moore **demande plus d'états** que la machine de Mealy

>[!warning]
>Si on ne sait pas laquelle choisir on partira par défaut sur une machine de Moore.

## Représentation du fonctionnement
### Chronogramme

### Graphes des états
Le graphe est constitué par une série de bulles reliées par des flèches.
- Une bulle correspond à un **code de bits d'état**
- Une flèche représente une **transition entre deux états**
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240106103706.png)
#### Règles de construction
1. De chaque bulle d'état, il faut autant de flèches que de combinaisons valides des entrées 
2. Chaque changement des entrées pertinentes (nouvelle combinaison) provoque un changement d'état
	1. Génère souvent trop d'états => seront simplifiés après 
3. Chaque changement sur les sorties, avec les mêmes valeurs des entrées, implique un changement d'état 
4. Maintien des sorties pendant un certains temps (multiple $_{Thorloge}$) est réalisé par une succession d'état interne (1 état = maintien de 1 $_{Thorloge}$)
### Table des états
C'est la liste des actions **synchrones** de la MSS, équivalent à la liste des actions synchrones d'un registre ou compteur. Utilisée pour déterminer les équations logiques du décodeur d'état futur et du décodeur de sortie.
#### Réduire le nombre d'états
- Recherche des états identiques
	- **Même états futurs** et **mêmes sorties** -> pour chaque combinaison des entrées
- Recherche des états compatibles
	- états futurs différents mais compatibles après groupement des états compatibles; **les sorties doivent être identiques**
## Codage des états d'une MSS
Il y a des règles obligatoires à respecter pour garantir le bon fonctionnement de la MSS.
**Entrées asynchrones**
- Obligatoire de synchroniser les entrées correspondantes avec un flip-flop
**Sorties sans aléas (transitoires)**
- Obligatoire de générer les sorties correspondantes directement par un flip-flop
	- La sortie doit correspondre à un bit d’état de la MSS

Essayer de placer les états dans une table de Karnaugh en respectant les sorties sans aléas et en simplifiant au mieux les décodeurs.
### Exemple de codage
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240106110142.png)
