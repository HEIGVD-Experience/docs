---
Type: Resume
MiseAuPropre: oui
---

### Complexité algorithme récursif
#### Complexité exponentielle
```cpp
int f(usigned n) {
	if(n == 0)
		return 1;
	return f(n-1) + f(n-1);
}
```
Le fait que cet algo s'appelle **2** fois **et** qu'on ait `n-1` en paramètre le rends exponentiel. Sa complexité serait $O(2^n)$. Si on avait un algo qui s'appelle 3 fois avec toujours `n-1` en paramètre nous aurions une complexité de $O(3^n)$.
#### Complexité logarithmique
```cpp
int f(usigned n) { 
	if(n == 0) 
		return 1; 
	return f(n/2);
}
```
Dans cette fonction nous aurons une complexité de $O(\log_{2}n)$. Si le paramètre `n/2` devient `n/3` nous aurons une complexité de $O(\log_{3}n)$. 
En revanche si nous avons `n/2` en paramètre et que la fonction s'appelle **deux** fois comme : 
```cpp
int f(usigned n) { 
	if(n == 0) 
		return 1; 
	return f(n/2) + f(n/2);
}

```
nous aurons une complexité de : 
$$O(\log_{2}(n)) + O(\log_{2}(n)) = O(\log_{2}(n*n)) = O(n)$$
#### Complexité d'algorithme connus

|Algoritmes|Complexités|
|-----|------|
|Factorielle récursif et itératif|$O(n)$|
|Fibonacci récursif|$O(1.618^n)$|
|Fibonacci itératif|$O(n)$|
|PGCD (Euclide)|$O(\log(n))$|
|Tours de Hanoï récursif et itératif|$O(2^n)$|
|Permutations|$O(!n)$|
|Tic Tac Toe|9!|
|Puissance 4, profondeur d’exploration de d tours|$O(7^d)$|
|Minimax (negamax), m mouvements possibles par tour, profondeur de d tours|$O(m^d)$|

>[!warning]
> Si notre fonction récursive s'appelle en (n-1) + (n-2) cela est similaire à l'algorithme de Fibonnaci de ce fait la complexité sera de :
> $$ O(or^n) $$


| Nb appel récursif | Paramètres d’appel                                        | Cas trivial | Complexité                |
| ----------------- | --------------------------------------------------------- | ----------- | ------------------------- |
| 1                 | $n-1$                                                     | $n = 0$     | $O(n)$                    |
| 1                 | $\frac{n}{2}$                                             | $n=0$       | $O(\log_{2}n)$            |
| 2                 | $(n-1)(n-2)$                                              | $n \leq 1$  | $O(\phi^n)$               |
| 3                 | $(n-1)(n-1)(n-1)$                                         | $n=0$       | $O(3^n)$                  |
| 2                 | $\left( \frac{n}{2} \right) * \left( \frac{n}{2} \right)$ | $n=0$       | $O(2^{\log_{2}n}) = O(n)$ |




