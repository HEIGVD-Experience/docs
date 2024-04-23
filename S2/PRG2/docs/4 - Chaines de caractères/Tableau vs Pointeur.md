---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
**Tableau** : permet de modifier les caractères de tab mais pas tab lui-même.
```c
char tab[]      = "Hello";      // tableau de caractères
```
**Pointeur** : le pointeur ptr pointe vers un littéral de type chaîne, qui ne devrait pas être modifié, mais ptr est une variable qui peut aussi pointer vers d’autres chaînes (attention à la perte du littéral !!).
```c
const char* ptr = "Hello";   // pointeur sur une chaîne littérale
```

## Tableau
En utilisant la syntaxe des tableaux l'affectation globale d'un tableau n'est pas possible, c'est à dire qu'il est impossible d'utiliser l'opérateur **=** entre deux chaines de type tableau.

```c
char chaine1[10] = "Hello";
char chaine2[10] = chaine1;    // erreur
chaine2 = chaine1;                   // erreur
// chaine1 et chaine2 sont des tableaux donc des adresses constantes !
```

Cependant, dans le cas ou une structure est utilisée pour encapsuler le tableau cela devient possible.

```c
typedef struct {
   char s[10];

} Chaine;

Chaine chaine1 = {"Hello"};
Chaine chaine2 = chaine1;

chaine2 = chaine1;
```

