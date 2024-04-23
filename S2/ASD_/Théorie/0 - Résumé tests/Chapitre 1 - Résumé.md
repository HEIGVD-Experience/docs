---
Type: Resume
MiseAuPropre: oui
---

### Estimer la complexité d'un algorithme
#### Boucle simple
```cpp
 for(int i = 1; i <= n; ++i) {
	 ++k;
 }
```
Complexité : $O(n)$
#### Boucle imbriquée
```cpp
 for(int i = 0; i <= n; ++i) {
	 for(int j = 0; j <= n; ++j) {
		 ++k;
	 }
 }
```
Complexité : $O(n^2)$ car première boucle $O(n)$ et deuxième $O(n)$ donc $O(n*n) = O(n^2)$
#### Boucle interne avec paramètre différent
```cpp
for(int i = 0; i < n; ++i) {
	for(int j = 0; j < i; ++j) {
		k++;
	}
}
```
Complexité : $O(n^2)$
#### Boucle avec indice multiplié
```cpp
for(int i = 1; i <= n; i *= A) {
	k++;
}
```
Complexité : $O(\log_{A}n)$
#### Boucle avec indice divisé
```cpp
for(int i = n; i > 0; i /= B) {
	k++;
}
```
Complexité : $O(\log_{B}n)$
#### Enchainement alternatif
Quand de la probabilité s'ajoute à l'algorithmie, nous devons utiliser la notion d'espérance mathématique qui permet de calculer une probabilité et son action.
```cpp
if( rand() % n == 0 ) {
	O(n^2)
} 
else {
	O(n)
}
```
De plus il faut ajouter les notion de meilleur cas / cas moyen et pire cas. Pour ici nous aurons :
Complexité, pire cas : $O(n^2)$ (va dans le if)
Complexité, meilleur cas : $O(n)$ (va dans le else)
Complexité, cas moyen : $C_{moy} = \frac{1}{n}*O(n^2) + \frac{n-1}{n}*O(n)$