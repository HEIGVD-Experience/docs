---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
En C une chaine de caractères est simplement une **liste de caractères** terminée par un caractère nul `\0`. 
```c
// tableau de caractères
char chaine[] = "Hello";
```
![[/_src/img/docs/Pasted image 20230604161529.png]]
Il existe une manière de définir un tableau de caractère, c'est en passant par un pointeur. La chaine ci-dessus pourrait donc aussi s'écrire :
```c
char* chaine = "Hello";
```

 >[!attention]
 >Implicitement le compilateur ajoute le caractère `\0` pour terminer la chaine. Sans celui-ci, les résultats seront indéterminés.

## Déclaration de chaines
Les bonnes pratiques pour déclarer une chaîne pouvant contenir, par exemple 80 caractères :
```c
#define TAILLE 80
char chaine[TAILLE + 1];

// ou bien

#define TAILLE 80
typedef char Chaine[TAILLE + 1];
Chaine chaine;
```

>[!important]
>Il est très important d'ajouter le `+1` pour la chaîne car si l'utilisateur rempli les 80 emplacements disponibles alors le `\0` ne pourra pas être ajouté et de ce fait celle-ci deviendra inutilisable.

## Chaîne constante
Lors de la déclaration de pointeur sur chaine constante donc `const char*`, l'allocation est faite en mémoire statique. De ce fait si plusieurs littéraux apparaissent, le compilateur **peut ou non** utiliser une seule zone.

```c
const char* ptr1 = "Hello";
const char* ptr2 = "Hello";
printf("%p - %p", (void*)ptr1, (void*)ptr2);
// 0x100003fa2 - 0x100003fa2 donc la même adresse
```

## Cas particulier
![[/_src/img/docs/Pasted image 20230604164153.png]]
![[/_src/img/docs/Pasted image 20230604164213.png]]
