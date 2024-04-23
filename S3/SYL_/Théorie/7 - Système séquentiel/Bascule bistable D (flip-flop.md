---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Fonctionnement](#fonctionnement)
	- [Table d'état](#table-d%C3%A9tat)
	- [Table des transitions](#table-des-transitions)
	- [Schéma interne](#sch%C3%A9ma-interne)

___
## Définition
>[!important]
>Cette bascule est appelée "bistable" car elle a deux états stables qui correspondent généralement à la présence des valeurs logiques "0" ou "1". Elle est également appelée bascule D en référence à la connexion de son entrée principale, appelée entrée de données (D).

## Fonctionnement
- Si CK=0, l'élément maître laisse passer l'entrée D à sa sortie, mais la sortie de l'élément esclave reste inchangée.
- Lorsque CK=1, la sortie de l'élément maître est conservée, et passe à la sortie de l'élément esclave.
- La sortie de la bascule peut changer seulement pendant la montée du signal d’horloge CK.
- La sortie de la bascule prend la valeur présente à l'entrée D au moment de la montée du signal d’horloge.
![](..//_src/img/docs/Pasted%20image%2020240105144515.png)
### Table d'état
![](..//_src/img/docs/Pasted%20image%2020240105144704.png)
Cette table montre la valeur de la sortie future en fonction de l'entrée et de l'état présent. Le comportement de la bascule peut être décrit également par son équation caractéristique:
$$
\begin{align}
Q^+ = D \\
1 \leftarrow D
\end{align}
$$
### Table des transitions
![](..//_src/img/docs/Pasted%20image%2020240105145156.png)
![](..//_src/img/docs/Pasted%20image%2020240105145423.png)

### Schéma interne
![](..//_src/img/docs/Pasted%20image%2020240105145501.png)
