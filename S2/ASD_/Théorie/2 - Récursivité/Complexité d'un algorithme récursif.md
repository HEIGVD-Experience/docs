---
Type: PriseDeNote
MiseAuPropre: oui
---

### Algorithme 1
Pour calculer la complexité d'un appel récursif il faut dans un premier temps regarder combien de branches possède l'appèle récursif.
```cpp
int f(usigned n) {
	if(n == 0)
		return 1;
	return f(n/2) + f(n/2);
}

fonction(val)
	si n est égal à 0 -> retourne 1
	sinon -> retourne fonction(val/2) + fonction(val/2)
```
Sur cet algorithme on peut voir que pour chaque appel de la fonction *f* nous appelons la rappelons 2 fois (si *n* est différent de 0). Si nous prenons *n* = 8 nous aurons donc :
![](/_src/img/docs/Pasted image 20230328103142.png)
Ce cas est un cas particulier car nous aurons **2 types** de fonction récursive. 
#### Première fonction
```cpp
int f(usigned n) {
	if(n == 0)
		return 1;
	return f(n-1) + f(n-1);
}

fonction(val)
	si n est égal à 0 -> retourne 1
	sinon -> retourne fonction(val-1) + fonction(val-1)
```
Cette fonction aura une complexité de $O(2^n)$ car la décrémentation va plus lentement que la divison pour arriver au bout de la récursivité donc à la condition triviale.
#### Deuxième fonction
```cpp
int f(usigned n) { 
	if(n == 0) 
		return 1; 
	return f(n/2); 
}

fonction(val)
	si n est égal à 0 -> retourne 1
	sinon -> retourne fonction(val / k)	
```
Celle-ci aura une complexité de $O(\log_{2}n)$. Donc décrémentera plus vite que celle au dessus.

#### Complexité finale
La concaténation des deux fonctions nous donnera du coup une complexité finale de :
$$ O(2^{\log_{2}n}) = O(n)$$

| Boucle                               | Complexité                 |
| ------------------------------------ | -------------------------- |
| ![](/_src/img/docs/Pasted image 20230621171717.png) | $O(n)$                     |
| ![](/_src/img/docs/Pasted image 20230621171955.png) | $O(2^n)$ -> $O(nbAppel^n)$ |
| ![](/_src/img/docs/Pasted image 20230621172604.png) | $O(\log_{k}n)$          |

