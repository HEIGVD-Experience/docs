---
Type: PriseDeNote
MiseAuPropre: oui
---

## Estimer la complexité
### Opération simple
```cpp
 ++k;
```

Nous aurons une complexité de $O(1)$ car cette partie de code n’est pas liée à $n$.

### Boucle simple
```cpp
 for(int i = 1; i <= n; ++i) {
	 ++k;
 }
```

Nous aurons une complexité de $O(n)$ car pour nous allons faire $n$ fois l’opération ++k.

### Boucles imbriquée
```cpp
 for(int i = 0; i <= n; ++i) {
	 for(int j = 0; j <= n; ++j) {
		 ++k;
	 }
 }
```

Nous aurons une complexité de $O(n^2)$ car pour la boucle interne nous allons la parcourir $n$ fois et la boucle externe $n$ fois aussi donc $n * n = n^2$.

## Boucles particulières
### Boucle à double paramètres distincts
```cpp
for(int i = 0; i < n; ++i) {
	for(int j = 0; j < m; ++j) {
		k++;
	}
}
```

Ayant deux paramètres distinct nous aurons une complexité un peu particulière. Pour la boucle interne nous aurons une complexité en $O(m)$ et en boucle externe en $O(n)$ nous aurons donc une complexité globale de $O(m) * O(n) = O(m*n)$

### Boucle imbriquée avec paramètre interne dépendant du paramètre externe
```cpp
for(int i = 0; i < n; ++i) {
	for(int j = 0; j < i; ++j) {
		k++;
	}
}
```

Boucles imbriquées dont le nombre d’itération de la boucle interne dépend de l’indice de la boucle externe. Ce calcul peut facilement être adapté dans une suite arithmétique :

$$ \sum_{i = 1}^{n}\sum_{j = 1}^{i}1 = \sum_{i = 1}^{n}i = \frac{n(n+1)}{2} = \frac{n^2+n}{2} = O(n^2) $$

### Boucle avec indice multiplié
```cpp
for(int i = 1; i <= n; i *= 2) {
	k++;
}
```

La forme $i \>\> *= 2$ est une forme exponentielle donc la boucle s’arretera quand $2^k > n$ soit quand $k > \log_{2}(n)$. La complexité est donc de $O(\log_{2}(n))$

### Boucle avec indice divisé
```cpp
for(int i = n; i > 0; i /= 3) {
	k++;
}
```

De la même manière que la boucle ci-dessus, la complexité est ici de $O(log_3(n))$.

## Enchaînement alternatif
Dès que nous parlons d’enchainement alternatif nous introduisons la notion de :

-   Le meilleur cas
-   Le cas moyen
-   Le pire cas

[[Espérance mathématique |Pour trouver la chance de tomber dans une branche ou une autre du code nous utiliserons l’espérance mathématique qui permet de calculer la probabilité.)

```cpp
if( rand() % n == 0 ) {
	for(int i = 0; i < n; ++i) {
		++k;
	}
} 
else {
	++k;
}
```

-   Dans le meilleur cas nous aurons que **rand()** n’est pas un multiple de **n** dans ce cas nous et irons dans la branche **else** et aurons une complexité de $O(1)$.
  
-   Dans le pire cas nous aurons que **rand()** est un multiple de **n** et dans ce cas nous irons dans la branche du **if** et aurons une complexité de $O(n)$.
   
-   Dans le cas moyen nous devons chercher l’**espérance mathématique** de la complexité.
	-   La chance que nous allions dans la branche **if** est de $\frac{1}{n}$ car nous avons une chance sur toutes les valeurs possibles de $n$ que la valeur du ********rand()******** soit son modulo.
	- La chance que nous allions dans la branche *********else******** est tout le reste donc $\frac{n-1}{n}$.

La complexité moyenne est donc égale à

$$ C_{moy} = \frac{1}{n}(O(n)) + \frac{n-1}{n}*O(1) $$

$$ C_{moy} = \frac{O(n)}{n} + \frac{O(n)-O(1)}{n} = O(1) + O(1) = O(1) $$







