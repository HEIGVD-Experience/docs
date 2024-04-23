---
Type: PriseDeNote
MiseAuPropre: oui
---
## Définition
>[!important]
>Un comparateur sert à indiquer si deux nombres binaires sont soit égaux soit plus petit soit plus grand.

![](..//_src/img/docs/Capture%20d’écran%202023-10-25%20à%2016.40.04.png)

Dans le cas présenté ci-dessus nous avons un comparateur de `4 bits`. En fonction du type d'opération choisie nous aurons une sortie différente.

>[!important]
>Un comparateur 1 bit se réalise au moyen d’un **ou‐exclusif inversé (xnor)**.

Une entrée supplémentaire «Enable» est souvent présente pour faciliter l’extension (permet la comparaison ou non).
![](..//_src/img/docs/Pasted%20image%2020231025164259.png)
Si **En ( => enable)** = 0, alors la fonction n'est pas activée et sortira 0 peu importe les valeurs d'entrée.

## Décomposition
Tout **comparateur à n bits** peut se décomposer en n comparateurs 1 bit.
La décomposition peut être de type cascade ou parallèle 
	**A) cascade** : moins de matériel, plus lent => moins coûteux 
	**B) parallèle** : plus de matériel, plus rapide => plus performant

### En cascade
![](..//_src/img/docs/Pasted%20image%2020231025164541.png)
### En parallèle
![](..//_src/img/docs/Pasted%20image%2020231025164603.png)
