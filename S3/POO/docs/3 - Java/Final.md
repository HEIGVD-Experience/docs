---
Type: PriseDeNote
MiseAuPropre: non
---
**Table des matières**
- [Définition](#d%C3%A9finition)

___
## Définition
>[!important]
>En règle générale signifie « ne peut être modifié ». Dans certains cas d'utilisation, peut-être comparé au `const` en C++.

## Cas d'utilisation
```java
final int a = 4; 
// a = 5;                           // erreur
```
```java
final Person p = new Person(…); 
p.name = "neo";             // ok 
// p = anotherPerson;    // erreur
```
```java
final int[] a = { 1, 2, 3, 4 }; 
a[2] = 42;                        // ok 
// a = anotherArray;        // erreur
```
