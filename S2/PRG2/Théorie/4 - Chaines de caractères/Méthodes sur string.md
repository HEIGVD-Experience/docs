---
Type: PriseDeNote
MiseAuPropre: oui
---

## Listing (non exhaustive) de string.h
![[/_src/img/docs/Pasted image 20230601165038.png]]

## Recherche dans une chaine
Il existe en C grâce à la librairie `string.h` de faire des recherches dans un string.

```c
char* strchr(const char* str, int c);
```
- cherche le caractère c (donné comme int) dans la chaîne st
- retourne un pointeur sur la 1ère occurrence de c, ou NULL si pas trouvé
```c
char* strrchr(const char* str, int c);
```
- même fonction, mais depuis la fin (« reverse »)
```c
char* strstr(const char* str, const char* sub);
```
- cherche la chaîne sub dans la chaîne str 
- retourne un pointeur sur la 1ère occurrence de sub, ou NULL si pas trouvée

## Décomposition d'une chaine
Cette fonction permet de décomposer une chaine de caractères en sous chaines en appelant deux fois la méthode :
```c
char* strtok(char* string, const char* delims);
```

**Exemple**
```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
   char str[] = "- This, a sample string.";
   const char* delims = " ,.-";
   
   char* pch = strtok(str, delims);
   while (pch != NULL) {
      printf("%s\n", pch);
      pch = strtok(NULL, delims);
   }
   return EXIT_SUCCESS;
}
```
