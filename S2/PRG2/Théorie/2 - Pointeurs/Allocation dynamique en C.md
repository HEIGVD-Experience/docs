---
Type: PriseDeNote
MiseAuPropre: oui
---

## Fonction proposée
- `malloc`   : alloue un bloc de mémoire, mais n’initialise pas l’espace mémoire  
- `calloc`    : alloue un bloc de mémoire et l’initialise à zéro (tous les bits à 0)  
- `realloc`   : redimensionne un bloc de mémoire précédemment alloué (sans initialiser)
- `free`       : désalloue une zone mémoire demandée lors d'allocation dynamique

>[!important]
> Ces fonctions retournent toutes (excepté `free` qui retourne `void`) un pointeur générique `(void*)`. Pour s'assurer que la l'allocation de mémoire à bien fonctionné il faut ensuite vérifier que ce pointeur sur void soit **différente** de `NULL`.

## Malloc
Malloc prends en paramètre un entier de type `size_t` qui définit le nombre de byte demandés. Malloc est préférable pour y stocker une variable.

>[!attention]
> Le bloc mémoire réservé par cet appel **ne sera pas initialisé** donc si des valeurs préalables existaient, elles y seront encore.

**Exemple**
```cpp
const size_t N = 10;
int* ptr = (int*)malloc(N * sizeof(int));
if (!ptr) {

   // échec de l'allocation dynamique ...

} else {

   // réussite de l'allocation dynamique ...

}
```

## Calloc
Calloc prends en paramètre deux entier de type `size_t`, `num` qui correspond au nombre d'éléments dans la zone mémoire et `size` qui sera la taille de l'octet d'un seul élément. Calloc est préférable pour y stocker un tableau de `num` éléments.

## Realloc
Realloc prends en paramètre un `void*` pointant sur le bloc mémoire ou il est demandé d'augmenter la mémoire. De plus nous aurons un entier de type `size_t` qui sera la **quantité totale** de mémoire demandée.

>[!important]
> Les octets ajoutés dans la zone mémoire **ne seront pas initialisé** donc si des valeurs préalables existaient, elles y seront encore.

## Free
Free prends en paramètre un `void*` qui correspond à la zone mémoire que l'on souhaite désallouer. Après avoir appelé free il faut absolument mettre à `NULL` le pointeur qui vient d'être désalloué.
```cpp
char* ptr = (char*)malloc(4);
free(ptr);
ptr = NULL;   // Mets le pointeur ptr à NULL après sa désallocation
ptr[2] = 'a'; // segfault : garde-fou
```
