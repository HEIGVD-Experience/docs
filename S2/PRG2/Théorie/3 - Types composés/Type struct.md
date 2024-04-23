---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Le type "struct" est utilisé pour définir une structure de données personnalisée, qui peut contenir un ensemble de variables de types différents.

>Une structure est un regroupement logique de variables de **différents** types, qui sont stockées sous une seule entité. 
>Par exemple, vous pourriez définir une structure `Personne` qui contient les variables **nom**, **âge**, et **adresse**, chacune ayant un type de données différent. Ensuite, vous pouvez créer une variable de type `Personne` pour stocker toutes ces informations ensemble.

Voici un exemple de définition de structure en C :
```c
struct Personne {    
	char nom[50];    
	int age;    
	char adresse[100]; 
};
```

Dans cet exemple, nous avons défini une structure `Personne` qui contient une chaîne de caractères **nom** d'une longueur maximale de 50 caractères, un entier **age** et une chaîne de caractères **adresse** d'une longueur maximale de 100 caractères.

Ensuite, vous pouvez créer une variable de type `Personne` et l'utiliser comme suit :
```c
// Alternative de définition
struct Personne personne1 = {.nom = "Francis", .age = 25, .adresse = "Rue de Sur-Roche 123"};

// Définition en 2 temps
struct Personne personne2;
personne2 = (struct Personne) {"Gwen", 17, "Rue de Storm 4"};
```

Dans cet exemple, nous avons créé une variable de type `Personne` appelée **personne1** et nous avons affecté des valeurs à ses différentes variables internes en utilisant l'opérateur point.

En utilisant les structures en C, vous pouvez créer des enregistrements de données plus complexes pour stocker et organiser des informations de manière plus efficace.