---
Type: PriseDeNote
MiseAuPropre: oui
---

>[!important]
> Les membres d’une structure (instance) occupent des places consécutives dans la mémoire. Suivant l'alignement des types, des octets de paddings sont nécéssaire.
> - les champs sont placés dans l’ordre de leur déclaration
> - l’adresse de l’instance est celle du 1er champ

## Notion de mots
Ce qu'on appelle les `mots` du compilateur, sont des regroupements d'octets permettant de simplifier la lecteur des données. Ils peuvent varier de `4 ou 8 octets`.

## Règles de calcul
- La taille totale d'un `struct` doit être un multiple du nombre d'octets du plus grand élément du `struct`.
- En fonction de la taille du type composant le `struct`, le début de son emplacement dans un `mots mémoire` ne sera pas le même. Ici en orange nous aurons un `char` et en vert un `int`. Les longueurs d'un `char` est `1 octet` et un `int` est `4 octets`. En définissant le `char` en premier, cela empêche le `int` de suivre directement. Nous aurons donc en gris du padding pour aligner les éléments en mémoire.
![[/_src/img/docs/Pasted image 20230514120931.png]]
	En inversant les deux types nous aurions eu :
![[/_src/img/docs/Pasted image 20230514121548.png]]
	car un `char` ne prenant que `1 octet` celui-ci peut se placer sur tous les multiples de 1 dans le mots mémoire.

>[!attention]
> Dans les deux cas ci présent, la mémoire totale utilisée pour le stockage de ce `struct` sera `1 octet (8 bits)` car la mémoire totale doit forcément être un multiple du plus grand élément ici `int = 4 bits`.

## Exemple
![[/_src/img/docs/Pasted image 20230514115701.png]]
Dans ce cas nous voyons que comme expliqué ci-dessus l'ordonnancement mémoire d'un `struct` à un impact sur l'utilisation de la mémoire. Pour les deux types structurés `S1` et `S2` qui contiennent les mêmes types mais dans un ordre différent, il est possible d'économiser 8 octets sur le `struct`.

>[!attention]
> Suivant l'environnement de développement (Mac OS, Linux ou Windows) la taille de certains types varies.

