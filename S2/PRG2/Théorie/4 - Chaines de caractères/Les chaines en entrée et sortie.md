---
Type: PriseDeNote
MiseAuPropre: oui
---

## Affichage d'une chaine
Il existe deux options fournies par la librairie `stdio.h`. La première consiste à utiliser le `printf` que nous avons déjà vu dans la note [[Printf et Scanf).

La deuxième consiste à utiliser une fonction nommée `puts` et qui permet d'afficher une chaine dans la console. Sa structure est : 

```c
int puts(const char* s);
```

En cas de succès la fonction retourne une valeur $\geq 0$ sinon le code EOF (End Of File).

## Saisie d'une chaine
La lecture d’une chaîne (depuis stdin ou un fichier) peut être dangereuse si ce qui est lu par le programme **est trop long** et dépasse la réservation prévue pour la variable de type chaîne.

```c
#define TAILLE 80  
char nom[TAILLE + 1];  
scanf("%s", nom); // N.B. : nom et pas &nom ! 
// l’input ne doit pas dépasser 80 caractères
```

Lors de l'appel de `scanf`
- le programme ignore les premiers espace blancs du buffer d'entrée
- lit des caractères et les stocke dans l'argument passé à `scanf`
	- **attention** : il lit jusqu'à rencontrer **espace, tab ou saut de ligne**
	- les caractères suivant restent dans le buffer d'entrée
- ajoute automatiquement un `\0` à la fin de la chaine lue

### Sécuriser le `scanf`
Il est possible de rendre `scanf` plus sur en utilisant le descripteur `%ns` ou `n` indiquera le **nombre maximal de caractères** à stocker, les caractères en plus resteront dans le buffer.

```c
#define TAILLE 80
char nom[TAILLE + 1];
char format[5];
sprintf(format, "%%%ds", TAILLE);   // %%% car il faut échapper le premier % et garder le                                                                            // deuxième % pour qu'il reste dans la chaine format.
scanf(format, nom);
```
