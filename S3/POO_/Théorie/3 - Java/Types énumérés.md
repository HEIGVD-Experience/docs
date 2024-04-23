---
Type: PriseDeNote
MiseAuPropre: non
---
**Table des matières**
- [Définition](#d%C3%A9finition)

___
## Définition
>[!important]
>En Java, les types énumérés sûrs (ou enums) sont des types de données spéciaux qui permettent de définir un ensemble fixe de valeurs possibles. Ils offrent une manière plus propre et plus sûre de représenter des ensembles de constantes liées.

## Déclaration
Pour déclarer un enum en Java il suffit d'écrire le code suivant:
```java
// Déclaration d'un type énuméré appelé Couleur 
public enum Couleur { 
	ROUGE, VERT, BLEU;
}
```

- **Déclaration de l'énumération :** Les valeurs de l'énumération (ici, ROUGE, VERT, BLEU) sont énumérées de manière fixe entre accolades. Chaque valeur représente une instance unique de l'énumération.
- **Utilisation :** On peut utiliser les valeurs de l'énumération comme des constantes. Les comparaisons peuvent être effectuées à l'aide d'instructions `switch` ou d'instructions `if`.
- **Méthodes associées :** Chaque énumération possède des méthodes intégrées telles que `name()` (qui renvoie le nom de la constante) et `ordinal()` (qui renvoie l'indice de la constante dans l'énumération).

## Méthode
Un type énuméré étant une classe, cela lui permet de :
- définir des propriétés (y compris des constructeurs)
- redéfinir des méthodes
- implémenter des interfaces

```java
enum Day { 
	mon, tue, wed, thu, fri, sat, sun;
	public Day next() { 
		Day[] array = values(); 
		return array[(ordinal() + 1) % array.length]; 
	} 
}
System.out.println(Day.mon.next());   // affiche "tue"
```

De ce fait en appelant Day.mon cela serait similaire à avoir une instance d'une classe Day avec un paramètre `String name` set à "mon". Mais l'avantage d'un enum c'est qu'il connaît les autres valeurs définies dans la classe énumérée.

### Enum de méthodes
Il est par exemple possible de créer un enum contenant uniquement des implémentations de méthodes abstraites.
```java
enum Operation { 
	plus { int eval(int x, int y) { return x + y; } }, 
	minus { int eval(int x, int y) { return x - y; } } ; 
	abstract int eval(int x, int y); 
} 
for (Operation op : Operation.values()) 
	System.out.printf("4 %s 3 = %d\n", op, op.eval(4, 3));
```

**Implémentation** : chaque valeur énumérée est l’unique instance d’une sous-classe (anonyme) du type énuméré qui implémente la méthode abstraite.

>[!important]
>Il est possible de parcourir l'ensemble des valeurs d'un enum en utilisant une boucle `foreach`ainsi qu'en appelant `nomEnum.values()`. La méthodes values retourne un array contenant la liste des enums définis.

