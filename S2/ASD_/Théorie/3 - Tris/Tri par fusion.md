---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Le tri par fusion consiste à découper notre conteneur de données et n conteneurs et de trier des plus petits éléments. Une fois ces n petits éléments triés, nous les fusionnons. Le tri par fusion est un **tri stable**.

![[/_src/img/docs/triparfusion.gif| 700]]
## Pseudo-code

```
fonction Fusionner(A,p,q,r)
	L ← copie du tableau A de p à q
	R ← copie du tableau A de q+1 à r
	insérer une sentinelle ∞ en fin de L et R

	i ← 1, j ← 1
	pour k de p à r boucler
		si L(i) ≤ R(j), alors
			A(k) ← L(i)
			incrémenter i
		sinon
			A(k) ← R(j)
			incrémenter j
		fin si
	fin pour
```

## Complexité

$$ C(n) = O(n*\log_{2}n) $$