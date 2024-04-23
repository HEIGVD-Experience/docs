---
Type: PriseDeNote
MiseAuPropre: oui
---
# Système séquentiel
````col
```col-md
flexGrow=1
===
## Compteur classique
![](..//_src/img/docs/Pasted%20image%2020240105154317.png)
## Décompteur
![](..//_src/img/docs/Pasted%20image%2020240105154507.png)
```
```col-md
flexGrow=1
===
## Bascule Reset-Set
![](..//_src/img/docs/Pasted%20image%2020240105120617.png)
## Table des fonctions synchrones
![](..//_src/img/docs/Pasted%20image%2020240105154806.png)
```
````
````col
```col-md
flexGrow=1
===
# Mealy
## Graphe des états
- Chaque état est nommé
- L'état de la sortie est indiqué sur chaque transition
- Sur chaque transition la condition est indiquée
![](..//_src/img/docs/Pasted%20image%2020240106104051.png)
## Table de Mealy
![](..//_src/img/docs/Pasted%20image%2020240106104637.png)
```
```col-md
flexGrow=1
===
# Moore
## Graphe des états
- Chaque état est nommé
- L'état de la sortie est indiqué dans chaque état
- Sur chaque transition, la condition est indiquée
![](..//_src/img/docs/Pasted%20image%2020240106103834.png)
## Table des états
![](..//_src/img/docs/Pasted%20image%2020240106104521.png)
```
````
## Machine séquentielles
````col
```col-md
flexGrow=1
===
### Machine de Medvedev
- Sorties correspondent directement aux bits d'états
![](..//_src/img/docs/Pasted%20image%2020240106101912.png)
### Machine de Moore
- Sorties dépendent uniquement de l'état présent
- Le changement des sorties est synchrone: il se fait avec le changement des états
![](..//_src/img/docs/Pasted%20image%2020240106101938.png)
```
```col-md
flexGrow=1
===
### Machine de Mealy
- Sorties dépendent de l'état présent et des entrées
- Le changement des sorties est asynchrone: il se fait avec le changement des entrées
![](..//_src/img/docs/Pasted%20image%2020240106101954.png)
```
````
