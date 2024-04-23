---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Le `typedef` permet d'alléger le code en proposant des alias sur des types de variables, en particulier sur des type structurés.

Il faut définir les types au début du fichier en question :
```c
typedef   existing_type_name    new_type_name;
```

## Utilisation
Dans le cas ou nous avons implémenté un structure :
```c
struct Personne {
	int age;
	int taillle;
	char* nom;
};

// Pour simplifier la lecture du code il est possible d'écrire
typedef struct Personne Personne;

int main(void) {
	// Utilisation du type Personne
	Personne p = { 23 , 176 , "Guillaume" };
	return EXIT_SUCCESS;
}
```

>[!warning]
>Une marque de signe (par ex `unsigned`) ne peut pas être ajoutée lors de la déclaration d'objets.
>```c
>typedef int entier;
>// ------------------
>unsigned entier n = 12;              // Ne fonctionne pas
>entier n = 12;                              // Fonctionne
>```

### Problème
Utiliser cette technique bloque donc **deux** noms globaux. C'est pourquoi avec les `struct, union` ou `enum` nous pouvons utiliser la syntaxe suivante:
```c
typedef struct {
	int age;
	int taillle;
	char* nom;
} Personne;
```

Cela permet donc aussi de créer facilement des variable de type `struct Personne` en appelant directement `Personne p` dans le code.