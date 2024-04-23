---
Type: PriseDeNote
MiseAuPropre: oui
---

## Valeur fixe
Dans un struct il est impossible de définir des valeurs par défaut, de ce fait nous ne pouvons pas écrire : 
```c
struct S { 
	char c; 
	float x = 1.5f;      // Aucunes valeurs peut-être définie dans un struct avant initialisation
} s;
```

## Assignation de valeur constante
Si un struct possède une valeur constante, il devient impossible de l'initialiser au travers d'une assignation.
```C
struct S {  
	const char C;  
	float x;  
} s;
s = (struct S) {'A', 1.5f}; // = pas possible car s est déjà définie avec un const donc assignation                                              // impossible après initialisation
```

## Comparaison de struct
Il est impossible de comparer des structures. Si on souhaite les comparer nous devons choisir les champs que l'on souhaite comparer. En C il n'est pas possible de créer des opérateurs pour des types du type struct.
```c
typedef struct {  
	char c;  
	int n;  
} S;

S s1 = {'A', 1}, s2 = {65, 1};  
printf ("s1 == s2 ? §s\n", (s1 == s2 ? "oui" : "non")); // == pas possible de comparer directement                                                                                         // des structures
```

## Utilisation d'une variable static
En C il n'est pas possible d'ajouter une variable statique dans une structure ou un union. Le moyen de contourner ce blocage est de passer par un pointeur sur une variable statique est de l'inclure dans notre struct
```c
typedef struct {  
	char c;  
	static int n;      // pas possible d'appeler une variable statique directement dans le struct
} S;
```

## Double appel du `struct`
Dans le cas ou nous définissons notre struct avec un `typedef` du type : 
```c
typedef struct {  
	char c;  
	float x;  
} S;
```

Lors de l'appel pour une définition ou autre il ne faut pas appeler à nouveau `struct`.
```c
S s1 = (struct S) {.c = 'A', .x = 1.5f};             // pas possible car S vaut déjà struct S
S s2 = s1 = (struct S){.c = 'A', .x = 1.5f};      // pareil sinon la sytaxe est ok
```

## Utilisation d'`enum`
En C il n'existe que le type d'`enum` dit de portée globale. En effet en définissant un `enum`les valeurs qu'il contiendra seront automatique définie comme valeur globale. De ce fait il est impossible d'avoir deux `enum` différents mais ayant une clé similaire.
```c
struct S {  
	enum E {A, B=-1, C= 0} e;  
} s;

s.e = E::B;                 // pas possible il aurait fallut dire s.e = B; étant donné que B est global
printf("%d\n", s.e);
```

## Appel de `struct` l'un après l'autre
Si nous souhaitons définir plusieurs `struct` à la suite, il est important de les définir correctement. Cette syntaxe est donc fausse : 
```c
typedef struct {  
	T* а;  
} S;  
  
typedef struct {  
	S* b;  
} T;
```
Cela ne fonctionnera pas car au moment d'arriver au `T* a` le compilateur ne sera pas de quel type est ce `T` car sa définition est en dessous mais surtout que le type `struct` n'est pas précisé avant.

## `union` ou `struct` imbriqué
Dans le cas ou des union ou struct sont imbriqué les uns dans les autres, il est très important d'appeler à nouveau le nom de la structure avant de remplir ses valeurs.
```c
typedef union {  
	int n;  
	union V {  
		char c;  
		float x;  
	} v;
} U;
U u = {{.x = 1.5f}};    // Faux car il faut appeler le .v puis ensuite remplir les valeurs choisies la                                           // bonne manière est : U u = {.v = {.x = 1.5f}};
```
