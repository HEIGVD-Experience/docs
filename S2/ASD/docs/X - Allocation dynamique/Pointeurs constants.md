---
Type: PriseDeNote
MiseAuPropre: oui
---

## Syntaxe des pointeurs
Pour des pointeurs d'entier basic nous pourrons écrire : 
```cpp
int i;
int* p0;
p0 = &i;
*p0 = i;
```

> [!info] 
> Avec cette écriture la valeur *p0* (étant un pointeur) vaut l'adresse mémoire de l'entier *i*.

## Syntaxe des pointeurs constants
Dès que nous commençons à manipuler des variables constantes il existe **3 sytaxes**.

### 1re syntaxe
```cpp
int const* p1;
p1 = &i;
// *p1 = i;
```

>[!Warning]
>Dans cette syntaxe nous ne pouvons pas attribuer la valeur *i* en déréférençant le pointeur *p1*. Cependant nous pouvons modifier l'adresse mémoire que contient *p1* en la faisant pointer sur la référence de la variable *i*.

### 2ème syntaxe
```cpp
int* const p2 = new int;
//p2 = &i;
*p2 = i;
```

>[!Warning]
>Dans cette syntaxe nous ne pouvons pas modifier l'adresse du pointeur *p2* en lui attribuant la référence vers *i*. Cependant nous pouvons modifier la valeur de *p2* en le déréférençant et en lui attribuant *i*.

### 3ème syntaxe
```cpp
int const* const p3 = new int(42);
//p2 = &i;
//*p2 = i;
```
Dans cette écriture nous ne pouvons ni modifier la référence ni la valeur qui lui est attribuée.