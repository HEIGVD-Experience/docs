---
Type: PriseDeNote
MiseAuPropre: non
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Java](#java)
	- [Constantes](#constantes)
- [Multiples interfaces](#multiples-interfaces)
- [Sceller classes et interfaces](#sceller-classes-et-interfaces)
- [Variable de type interface](#variable-de-type-interface)
- [Héritage d'interface](#h%C3%A9ritage-dinterface)
- [Méthode par défaut](#m%C3%A9thode-par-d%C3%A9faut)

___
## Définition
>[!important]
>En Java, une interface est un type de structure qui permet de déclarer un ensemble de méthodes (sans les implémenter) qu'une classe doit fournir. Elle fournit un moyen de spécifier un contrat ou un ensemble de comportements que les classes qui implémentent l'interface doivent suivre.

>[!warning]
>- Il est possible qu'une classe implémentes plusieurs interfaces contrairement à l'héritage de classe qui lui est unique!
>- De plus il est aussi possible d'allier héritage et implémentation d'interface pour la même classe.

## Java
Pour définir des interfaces il faut utiliser la syntaxe suivante : 
```java
interface I { 
	int MAX = 12;                   // public static final int MAX = 12; 
	void m();                           // public abstract void m(); 
}
```
Et pour l'implémenter:
```java
public class TestInterface implements I {
	public TestInterface() {
		...
	}
	public void m() {
		...
	}
}
```

- Une interface peut posséder une visibilité paquetage (sans qualification) ou publique (auquel cas elle doit être définie dans un fichier de même nom).
- Toutes les méthodes d’une interface sont implicitement (et forcément) abstraites et publiques, puisqu’elles doivent être obligatoirement redéfinies par toute classe implémentant l’interface.
- Tous les attributs d’une interface sont implicitement (et forcément) des constantes (static final) publiques.

### Constantes
Une interface peut définir des constantes qui seront accessibles à toutes les classes qui l’implémentent (comme si déclarées dans la classe).

>[!important]
>Ces constantes sont accessibles en dehors de la classe en les préfixant du nom de la classe (`TestInterface.MAX`) ou celui de l’interface (`I.MAX`).

Les attributs des interfaces sont nécessairement des constantes mais ils peuvent être initialisés avec des expressions non constantes.
```java
interface I { 
	Random r = new java.util.Random(); 
	int i = r.nextInt(10); 
}
```

>[!important]
>Comme ces attributs sont statiques ils sont initialisés dès que l’interface est chargée en mémoire par la machine virtuelle (i.e., lorsqu’elle est accédée). `System.out.println(I.i);` 
>// valeur potentiellement différente à chaque exécution du programme

## Multiples interfaces
Lors-ce qu'une classe implémentes plusieurs interfaces, aucune ambiguïté n'est possible. Si nous avons deux interfaces qui définissent le même nom de classe ainsi que la même signature, cela ne posera pas de problème.

## Sceller classes et interfaces
Une classe ou une interface peut être scellée pour limiter son extensibilité à certaines classes ou interfaces.
- Elle est déclarée sealed et seules les classes ou interfaces spécifiées dans la clause permits peuvent l’étendre.

| Type | Explication |
| ---- | ---- |
| final | Non extensible (uniquement pour les classes) |
| sealed | Extension limitées aux classes définies après le mot clé `permit` |
| non-sealed | Extensible à souhait (-> par défaut) |
```java
abstract sealed class Shape permits Square, Circle { 
	/* … */ 
}

final class Square extends Shape { 
	/* … */ 
}
```

## Variable de type interface
Il est possible de définir des variables de type interface en utilisant la syntaxe suivante : 
```java
public interface I { /* … */ } 
I i;
```
`i` est une référence sur un objet d'une classe implémentant `I`

>[!warning]
>Il est interdit d'**instancier** une interface (pas de `I i = new I(...)`)

Cela permets d'affecter à une variable de type `I` toutes les objets implémentant la dite interface. Si la classe en question n'implémente pas l'interface alors il sera impossible de l'affecter
```java
class A implements I { /* … */ } 
A a = new A(…);
i = a; 

Object o = new A(…); 
i = o;     // erreur : Object n’implémente pas I
```

## Héritage d'interface
Pour une classe il n'est pas possible de faire de l'héritage multiple, contrairement aux Interfaces, qui elles peuvent hériter de plusieurs.
```java
interface I1 {
	void f(); 
	int MAX = 100;
} 
interface I2 { 
	void g(); 
} 
// Double héritages des deux interfaces I1 et I2
interface I extends I1, I2 { 
	int MIN = 0; 
}
```
- Si elle n'est pas définie comme abstraite, une classe doit fournir les implémentations complètes de ses méthodes.

## Méthode par défaut
Java 8 a introduit la possibilité de définir des méthodes possédant une implémentation par défaut (default method) au moyen du mot clef default.

>[!important]
>Cela permet de : 
>- ne pas redéfinir la méthode et hériter de son implémentation par défaut
>- redéfinir la méthode avec une nouvelle implémentation
>- redéfinir la méthode comme abstraite (elle devra alors être implémentée dans les sous-classes)

```java
interface Actionable { 
	String actionNoise();       // méthode abstraite 
	default void action() {     // méthode par défaut 
		System.out.println("Action: " + actionNoise()); 
	} 
}
```
