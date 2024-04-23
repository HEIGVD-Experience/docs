---
Type: PriseDeNote
MiseAuPropre: oui
---

## Opérateur de décalage
Les opérateurs `<<` et `>>` permettent de faire des décalages de bits.

### Opérateur `<<`
L'opérateur `<<` décale les valeurs à gauche. C'est à dire que l'on va insérer un ou plusieurs `0` au début du nombre. Les bits qui débordent à gauche sont perdus. Cela revient à **multiplier la valeur par 2**.
![[/_src/img/docs/Pasted image 20230410190405.png]]
```c
uint8_t i = (uint8_t)7;
i  =  i  <<  1;                     // i devient 14
```

### Opérateur `>>`
L'opérateur `>>` décale les valeurs à droite. C'est à dire que l'on va insérer des `0` ou le même que la valeur du signe (cela dépend du compilateur mais dans la majorité des cas c'est `0`). Les bits qui débordent à droite sont perdus. Cela revient à **diviser la valeur par 2**.
![[/_src/img/docs/Pasted image 20230410210201.png]]
```c
uint8_t i = (uint8_t)15; 
i  =  i  >>  1;                     // i devient 7
```

## Opérateur `&`
L'opérateur `&` a deux significations en C/C++. La première permet de récupérer l'adresse mémoire d'une variable comme montré ci-dessous.
```c
int i       = 0;  
int* ptr  = &i;          // ptr contient l'adresse de i
```

L'autre signification est l'opérateur **AND** bit à bit qui permet de faire un calcul de bits pour des variables données. 
|Type|8|4|2|1|
|----|----|-----|----|----|
|1er nombre|0|0|1|1|
|2ème nombre|0|1|0|1|
|AND / `&`|0|0|0|1|

>[!important]
> En décomposant deux entiers en binaire nous pouvons faire l'opération **AND** qui garde uniquement les bits à `1` dans les deux nombres.

## Opérateur `|`
L'opérateur `|` ou appelé **OR** bit à bit permet de faire un calcul de bits pour des variables données.
|Type|8|4|2|1|
|-----|-----|-----|-----|-----|
|1er nombre|0|0|1|1|
|2ème nombre|0|1|0|1|
|OR |0|1|1|1|

>[!important]
> En décomposant deux entiers en binaire nous pouvons faire l'opération **OR** qui prends tous les bits ou au moins un des deux vaut `1` ainsi que lors-ce que les deux valent `1`.

## Opérateur `^`
L'opérateur `^` ou appelé **XOR** bit à bit permet de faire un calcul de bits pour des variables données.
|Type|8|4|2|1|
|----|----|-----|----|----|
|1er nombre|0|0|1|1|
|2ème nombre|0|1|0|1|
|XOR / `^`|0|1|1|0|

>[!important]
> En décomposant deux entiers en binaire nous pouvons faire l'opération **XOR** qui prends les bits uniquement quand les deux sont différents et les mettra à `1`.

## Opérateur `~`
L'opérateur `~` ou appelé **Tilde** bit à bit permet de faire un calcul de bits pour des variables données.
|Type|8|4|2|1|
|----|----|-----|----|----|
|Nombre|0|0|1|1|
|Tilde / `~` |1|1|0|0|

>[!important]
>L'opérateur `~` ou appelé tilde permet d'inverser tous les bits de l'entier.

