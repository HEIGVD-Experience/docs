---
Type: PriseDeNote
MiseAuPropre: oui
---

## Règles d'interprétation
Pour transformer une déclaration en `C` d'un tableau, fonction ou autre en français nous utilisant le tableau suivant. Celui-ci permet d'appliquer des règles et de décortiquer les notations.
![](/_src/img/docs/Pasted image 20230413214928.png)

**Exemples**

```c
int*  (*a (char* const)) [5];
```
`a` est un pointeur sur une fonction prenant en paramètre un pointeur constant sur un `char` et retournant un pointeur sur un tableau de 5 pointeurs sur des entiers.

```c
int  (* (*b [5]) (int)) [10];
```
`b` est un tableau de 5 pointeurs renvoyant à une fonction prenant en paramètre un `int` et retournant un tableau de 10 entiers.

## Règles d'écriture
Pour transformer une définition en français d'un déclarateur en code en `C` nous utiliserons le tableau suivant.
![](/_src/img/docs/Pasted image 20230413222546.png)

**Exemples**

`p` est un pointeur sur une fonction prenant en paramètre un pointeur sur un tableau de 5 `int` et livrant un pointeur sur un `double` constant.
```c
const double* (*p) ( int (*) [5]));
```