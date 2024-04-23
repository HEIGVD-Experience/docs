---
Type: PriseDeNote
MiseAuPropre: oui
---

### Définition
Un pointeur est une adresse mémoire sur un emplacement dans le quel se trouve une valeur. Si un pointeur est stocké dans un emplacement mémoire alors nous avons un pointeur sur un pointeur. 

```cpp
// Variable entière
int i = 5;

// Stocke dans ptrI (variable de type pointeur d'entier) l'adresse
// mémoire de l'entier i.
int* ptrI = $i;
```

### Initialisation d'un pointeur
Sans cast explicit, lors de l'initialisation d'un pointeur, celui-ci ne peu uniquement pointer vers une valeur du même type du pointeur.
**Bonne pratique** : il est important de déclarer un pointeur à *null* si aucune valeur lui est attribué à l'initialisation.

```cpp
// Notation pour définir un pointeur
int* ptr = NULL;

// Attention si déclaration multiple
int *ptr1 = NULL, *ptr2 = NULL;

// Si on connaît pas le type du pointeur
void* ptr3;
```

>[!warning]
>Le déréférencement (*) d’un pointeur qui pointe sur une variable (ou objet) n'existant plus, retourne une valeur indéterminée.
>Le déréférencement d’un pointeur non initialisé ou NULL produit une erreur de segmentation (segfault).
