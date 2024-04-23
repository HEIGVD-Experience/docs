---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Comportement](#comportement)
	- [Table des transitions](#table-des-transitions)
- [Schéma logique](#sch%C3%A9ma-logique)
- [Inconvénients](#inconv%C3%A9nients)

___
## Définition
>[!important]
>La bascule RS (Set-Reset) asynchrone est un type de circuit logique utilisé en électronique numérique pour stocker une information binaire. Cette bascule est constituée de deux entrées principales : l'entrée Set (S) et l'entrée Reset (R). Elle peut exister sous différentes formes, telles que la bascule RS à portes NAND ou NOR.

## Comportement
| Comportement | Sortie |
| ---- | ---- |
| Set = '1' | Mise à '1' de la sortie |
| Reset = '1' | Mise à '0' de la sortie |
| Set = Reset = '0' | Maintient de la valeur en sortie |
| Set = Reset = '1' | Interdit |
L'évolution dépend des entrées **et** de l'état présent (historique), nous rajoutons Q comme entrée dans la table de vérité.
![](..//_src/img/docs/Pasted%20image%2020240105120316.png)
>[!important]
>- `Q`: état actuel de la bascule RS
>- `Q+`: état futur de la bascule RS

### Table des transitions
La table des transitions permet de définir ce qu'il va se passer quand les entrées et la sortie dans sont dans les valeurs R et S.
![](..//_src/img/docs/Pasted%20image%2020240105120617.png)
## Schéma logique
![](..//_src/img/docs/Pasted%20image%2020240105120643.png)
## Inconvénients
Sensible à toute impulsion sur ses entrées
- Si durée supérieure au temps de propagation de 2 portes
	- Changement d'état définitif de la bascule RS
- Si durée inférieure au temps de propagation de 2 portes
	- Etat final de la bascule RS indéterminé !