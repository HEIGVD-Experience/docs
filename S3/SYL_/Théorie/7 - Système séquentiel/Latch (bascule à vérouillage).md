---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Fonctionnement](#fonctionnement)
	- [Bascule RS vs Latch](#bascule-rs-vs-latch)
	- [Comportement](#comportement)

___
## Définition
>[!important]
>Une bascule D à verrouillage fonctionne généralement avec une entrée de données (D), une entrée d'horloge (CLK) et une sortie (Q). Contrairement à une bascule RS asynchrone, la bascule D à verrouillage est généralement sensible à un signal d'horloge. Elle stocke l'état de l'entrée de données au moment où le front d'horloge se produit.

## Fonctionnement
### Bascule RS vs Latch
Dans un latch nous ajoutons une commande LD (load) permettant d'ajouter la notion de verrouillage. En comparant à une bascule RS il faut que LD soit à 1 pour que les valeurs de R et S interviennent sur la sortie.

### Comportement
````col
```col-md
flexGrow=1
===
**Entrées**
D -> donnée
LD -> commande de verrouillage (gate)
```
```col-md
flexGrow=1
===
![](/_src/img/docs/Pasted%20image%2020240105121733.png)
```
````

| LD | Sortie |
| ---- | ---- |
| 1 | La sortie prend la valeur de l'entrée D (bascule transparente -> verrou ouvert) |
| 0 | La sortie conserve sa valeur |
- Si l'entrée LD est **inactive** alors la sortie conserve sa valeur (**HOLD**).
- Si l'entrée LD est **active** alors la sortie prend la valeur de son entrée d'excitation (**LOAD**).
![](..//_src/img/docs/Pasted%20image%2020240105141753.png)
>[!warning]
>Ce qu'il faut savoir c'est qu'avec des latchs il y a un temps de propagations donc un décalage au moment du front montant.

