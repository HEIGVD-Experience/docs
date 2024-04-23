---
Type: PriseDeNote
MiseAuPropre: non
---
**Table des matières**
- [Définition](#d%C3%A9finition)

___
## Définition
>[!important]
>Un itérateur en Java est un objet qui permet de parcourir une collection d'éléments un à un, offrant des méthodes telles que `hasNext()` pour vérifier la présence d'un élément suivant et `next()` pour accéder à l'élément suivant.
## Utilisation
Pour une collection définie comme `c`:
```java 
Iterator i = c.iterator(); 
while (i.hasNext()) { 
	Object o = i.next(); 
	// … 
}
```

>[!attention]
>Ne pas modifier une collection pendant qu’elle est itérée, sauf par les méthodes fournies par l’itérateur (p. ex. remove())
