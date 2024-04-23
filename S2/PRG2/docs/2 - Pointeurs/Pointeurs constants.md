---
Type: PriseDeNote
MiseAuPropre: oui
---

### Définition
Il existe quatre types de pointeurs constants ou non constants.

#### Variable et pointeur non constant
Dans cette situation nous aurons la variable `x` qui sera non constante ainsi que le pointeur `ptr` qui sera aussi non constant.
```cpp
int x = 3;
int* ptr = &x;
```

#### Variable non constante et pointeur constant
Dans cette situation nous aurons la variable `x` qui sera non constante mais le pointeur `ptr` sera constant.
```cpp
int* const ptr = &x;
```

#### Variable constante et pointeur non constant
Dans cette situation nous aurons la variable `x` qui sera constante mais le pointeur `ptr` sera aussi constant.
```cpp
const int* ptr = &x;
```

#### Variable et pointeur constant
Dans cette situation nous aurons la variable `x` et le pointeur `ptr` qui seront constant.
```cpp
const int* const ptr = &x;
```

>[!info]
>Le mot clé **const** s'appliquera toujours sur ce qu'il précède.