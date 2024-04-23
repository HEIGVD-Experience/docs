---
Type: PriseDeNote
MiseAuPropre: oui
---
## Nombres signés
**Calcul binaire**
- Partie fractionnaire --> diviser par 2
	- Si > 1 alors bit à 1 / sinon bit à 0
	- Reprendre la partie fractionnaire de la division, puis recommencer
- Notation --> nombre écrit en complément à deux --> signé
	- Inversion puis +1
**Débordement**
- si les deux opérandes sont du même signe: dépassement si le résultat est du signe opposé
- si les deux opérandes sont de signe opposé: il n'y a jamais de dépassement de capacité
## Portes logiques
````col
```col-md
flexGrow=1
===
![](..//_src/img/docs/a1.jpg)
```
```col-md
flexGrow=1
===
![](..//_src/img/docs/a2.jpg)
```
````
## Algèbre de Boole
- La forme canonique algébrique est l'expression ou tous les mintermes sont à 1 avec l'expression des valeurs correspondantes.
$$ Z(B,A) = \bar{B}A + B \bar{A} + BA $$
- La forme algébrique minimale, simplifiée avec algèbre de Boole ou Karnaugh.
$$
Z(B,A) = B + A
$$
- La forme canonique algébrique décimale corresponds à la somme de tous les numéros de mintermes ou la valeur résultante est égale à 1.
$$
F (C,B,A) = \sum 0, 3, 5, 7
$$
````col
```col-md
flexGrow=1
===
![](/_src/img/docs/Pasted%20image%2020231025162431.png)
```
```col-md
flexGrow=1
===
![](/_src/img/docs/Capture%20d%E2%80%99%C3%A9cran%202023-10-25%20%C3%A0%2015.24.52.png)
```
````
## Fonctions standards combinatoires
### Multiplexeur
![](..//_src/img/docs/Pasted%20image%2020231026140449.png)
### Décodeur
![](/_src/img/docs/Pasted%20image%2020240131105100.png)
### Comparateur
![](..//_src/img/docs/Pasted%20image%2020231025164259.png)