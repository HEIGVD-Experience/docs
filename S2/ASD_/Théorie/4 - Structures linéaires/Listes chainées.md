---
Type: PriseDeNote
MiseAuPropre: oui
---

## Liste simplement chainée
### Définition
Une liste chainée est une structure de donnée linéaire contenant deux éléments : 
1. La variable ou objet que la liste contient
2. Un pointeur sur le maillon suivant

Si nous visualisons cela comme une chaine, chaque maillon de celle-ci contient la valeur gardée ainsi que le pointeur sur l'adresse mémoire du maillon suivant.
![](/_src/img/docs/Pasted image 20230425133013.png)
>[!important]
>Un des **gros** avantages est que d'un point de vue mémoire, une liste chainée ne nécessite pas d'avoir de la mémoire contigue. De ce fait, contrairement à un vecteur ajouter beaucoup d'éléments ne nécessiteront pas de déplacer tout le conteneur. 

### Méthodes
#### Parcourir la liste
Pour parcourir une liste chainée nous pourrons aller quand dans un seul sens. Une fois une valeur passée, il ne sera pas possible de revenir en arrière. Si cela est demandé il faudra re-parcourir la liste depuis le début.

## Liste doublement chainée
### Définition
Une liste doublement chainée est une structure de donnée linéaire contenant trois éléments : 
1. La variable ou objet que la liste contient
2. Un pointeur sur le maillon suivant
3. Un pointeur sur le maillon précédent
![](/_src/img/docs/Pasted image 20230425135235.png)
### Méthodes
#### Parcourir la liste
Pour parcourir une liste doublement chainée nous pourrons aller dans les deux sens pour lire notre conteneur.

#### Splice
```cpp
// Splice avec deux paramètres --> insère avant pos la liste list
void splice (itérateur constant pos, list)

// Splice avec trois paramètres --> insère avant pos l'élément it contenu dans la liste list
void splice (itérateur constant pos, list, itérateur constant it)

// Splice avec quatre paramètres --> insère avant pos la plage d'éléments first -> end dans la
// liste list
void Splice (itérateur constant pos, list, itérateur constant first, itérateur constant end)
```
>[!attention]
>La méthode splice n'existe que pour des listes doublement chainées. Concernant les listes simplement chainées nous utilisons `splice_after` qui à les mêmes signatures.

![](/_src/img/docs/Pasted image 20230531102332.png)
```cpp
std::list<int> list1 = { 1, 2, 3, 4, 5 };
std::list<int> list2 = { 10, 20, 30, 40, 50 };

auto it = list1.begin();   // Place l'itérateur sur le début de la list1
std::advance(it, 2);       // Avance l'itérateur de 2 donc se positionne sur 3
list1.splice(it, list2);       // Insère dans list1 depuis la position it toute la list2

// list1 : 1, 2, 10, 20, 30, 40, 50, 3, 4, 5      list2 : vide

list2.splice(list2.begin(), list1, it, list1.end());  // Insère au début de list2 les éléments dans list1                                                                                 // allant de it à la fin de list1.
// list1 : 1, 2, 10, 20, 30, 40, 50      list2 : 3, 4, 5
```
