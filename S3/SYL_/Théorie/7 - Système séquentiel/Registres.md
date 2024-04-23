---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Fonctionnement](#fonctionnement)
	- [Table des opérations](#table-des-op%C3%A9rations)
	- [Types de registres](#types-de-registres)
- [Registre simple](#registre-simple)
	- [Exemple](#exemple)
- [Registre à décalage](#registre-%C3%A0-d%C3%A9calage)
	- [Schéma](#sch%C3%A9ma)
	- [Nomenclature](#nomenclature)
	- [Symbole registre](#symbole-registre)
	- [Table de fonctions synchrones](#table-de-fonctions-synchrones)
	- [Conception de registres (méthodologie)](#conception-de-registres-m%C3%A9thodologie)

___
## Définition
>[!important]
>Un registre est un ensemble de bascules (ou flip-flops) utilisé pour stocker des données binaires dans un système numérique. Les registres sont souvent utilisés pour stocker des informations temporaires ou pour faciliter le traitement de données dans un processeur ou dans d'autres parties d'un système numérique. Un registre peut être constitué de plusieurs bascules bistables, généralement des bascules D.

## Fonctionnement
L'existence d'un signal de contrôle LOAD (L) permet d'inhiber ou pas le chargement de l'information:
- A la montée du signal d'horloge, si L=1, les signaux d'entrée sont stockés dans le registre.
### Table des opérations
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105151003.png)
### Types de registres
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105151052.png)
## Registre simple
````col
```col-md
flexGrow=1
===
Le registre simple est un ensemble de **bascules en parallèle**. Il est à la base des systèmes séquentiels.
<br><br>
Son symbole CEI ->
```
```col-md
flexGrow=1
===
![](../../../../S0/PiecesJointes/Pasted%20image%2020240105151210.png)
```
````
### Exemple
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105151443.png)
## Registre à décalage
Ces registres sont de taille fixe. Chaque bits est décalés à chaque coups d'horloge. Cela constitue un chaînage de bascules synchronisées sur l'horloge.
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105151933.png)
>[!important]
>Ce type de registre est particulièrement utilisés dans les liaison série. Transmettre de l'information sous forme *parallèle* nécessiterait au moins 9 fils (8 pour les 8bits et un pour la masse). Grace au registre à décalage on ne peut utiliser qu'un seul fil en transmettant chaque bit l'un après l'autre.
### Schéma
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105153140.png)
### Nomenclature
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105152725.png)
### Symbole registre
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105153229.png)
### Table de fonctions synchrones
![](../../../../../S0/PiecesJointes/Pasted%20image%2020240105153351.png)
### Conception de registres (méthodologie)
1. Identifier les fonctions du registre à décalage 
2. Lister ces fonctions (classer synchrones et asynchrones) 
3. Définir les fonctions asynchrones (prioritaires) 
4. Fixer les priorités des fonctions synchrones 
5. Etablir la table des fonctions synchrones 6
6. . Etablir le schéma du registre (penser aux Mux) 
7. Réaliser la description VHDL du registre