---
Type: PriseDeNote
MiseAuPropre: oui
---

## Pourquoi ?
Dans les bonnes pratiques du C++ il existe un principe qui dit de ne pas faire appel directement à `new` ou `delete` avec de l'allocation dynamique de la mémoire.
La bonne pratique serait d'encapsuler cela dans une classe et de définir les constructeur ainsi que les destructeurs de la classe pour qu'ils appellent `new` et `delete`.

## Utilisation du constructeur de copie implicite
Pour une classe `RandomString` définie comme :
```cpp
class RandomString {
	size_t N;
	char*  data;
public :
	Constructeur()...;
	Destructeur()...;
}
```
En utilisant une classe nous pourrons rencontrer un problème si nous utilisons le constructeur par copie implicite.
```cpp
RandomString rs1(10);
RandomString rs2 = rs1;
```
Si la classe utilise de l'allocation de mémoire dynamique et n'a pas défini de constructeur par copie nous aurons un problème à la destruction.
>[!warning]
>Lors de la copie `rs2 = rs1` cela va copier tout les attributs de l'objet `rs1` dans `rs2`. Hors cela va poser problème car `data` utilise l'allocation dynamique. Lors de la destruction de `rs2` celui-ci va supprimer l'attribut `data` de ce fait, à la destruction de `rs1`, l'attribut `data` n'existera déjà plus car c'est **l'adresse mémoire** qui aura été copiée.

L'erreur suivante apparaîtra : 
![[/_src/img/docs/Pasted image 20230402172304.png]]
### Implémentation d'un constructeur de copie
```cpp
RadomString(const RandomString& rs){
	data = new char[rs.N]; // Crée un espace mémoire pour data de taille N
	N = rs.N;
	copy(rs.data,rs.data+N, data); // <algorithm>
}
```