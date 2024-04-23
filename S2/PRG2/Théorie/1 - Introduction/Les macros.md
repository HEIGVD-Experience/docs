---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition et syntaxe
Une macro est formée de mots et est séparées par des espaces ou tabulation. Une macro se termine au premier retour à la ligne mais un `\` permet de continuer la macro sur la ligne suivante.
La macro suivante permet de retourner si la plus petite valeur entre `a` et `b`.
```
#define min(a,b) ((a) < (b) ? (a) : (b))
```

>[!warning]
>Il est très important de coller le nom de la macro et ses paramètres formels.

## Priorité des opérations
Il est important de comprendre qu'une macro viendra comme remplacer le code présent dans votre main ou autres fonctions. Il faut donc prendre en compte la priorités des opérations.

```c
#define DOUBLE(a) a * 2

int main(void) {
	int i = 4;
	int j = 2;
	
	int a = DOUBLE(i + j);
	
	return EXIT_SUCCESS;
}
```

Ici le `DOUBLE(i + j)` va remplacer les paramètres `i + j` directement dans la macro. Se faisant nous aurons donc le code suivant : 

```c
int a = i + j * 2;
```

Nous aurons donc la réponse $4 + 2 * 2 = 8$ alors que la réponse voulue était $(4 + 2) * 2 = 12$. Pour régler ce problème nous devons donc bien mettre les parenthèses pour éviter que la priorité des opérations prime.

```
#define DOUBLE(a) ((a) * 2)
```

## Opérateur \#\#
L'opérateur `##` permet de concatener deux tokens dans la macro. La suivante permet de créer une chaine commençant par `i` et concatener avec la valeur passée en paramètre n.

```
#define MK_ID(n) i##n
```
```c
int main(void) {
   int MK_ID(1), MK_ID(2);
}
// Après appel de la macro nous aurons 
int main(void) {
   int i1, i2;
}
```

Grâce à cette technique nous pouvons créer une sorte de généricité permettant de faire abstraction du type de données traitées. Vu que la macro fait un remplacement de texte pur nous pouvons faire : 

```
#define GENERIC_SOMME(type)                   \
type somme_##type(type lhs, type rhs) {     \
	return lhs + rhs;                                           \ 
}
```

Cette marco permet de générer du code en remplacent `type` par un type de donnée disponible en `C` qui créera une fonction permettant de sommer deux valeurs.

```c
// Avant le main
GENERIC_SOMME(int)         // Ce code sera remplacé par : 
int somme_int (int lhs, int rhs) { return lhs + rhs; }
GENERIC_SOMME(float)     // Ce code sera remplacé par :
float somme_float(float lhs, float rhs) { return lhs + rhs; }
```

Cela permet donc de faire des sommes pour des `int` ainsi que pour des `floats`.