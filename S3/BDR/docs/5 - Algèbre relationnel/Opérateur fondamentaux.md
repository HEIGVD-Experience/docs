---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Sélection](#s%C3%A9lection)
- [Projection](#projection)
- [Union](#union)
- [Difference](#difference)
- [Produit cartésien](#produit-cart%C3%A9sien)

___
## Définition
>[!important]
>L'algèbre relationnelle est un langage formel utilisé pour décrire les opérations sur les relations dans le contexte des bases de données relationnelles. Elle a été développée par Edgar F. Codd, un informaticien, dans les années 1970. Celui-ci contient 5 opérateurs fondamentaux qui serviront à manipuler les données de tables.
>![](/_src/img/docs/Pasted%20image%2020231230115943.png)

## Sélection
- La sélection s’écrit: $\sigma c(r)$
	- r est la relation de schéma R sur laquelle s’applique la sélection 
	- c est le critère de sélection qui est une expression booléenne 
	- le résultat est une relation r' qui contiendra tous les tuples de r qui satisfont au critère c
![](/_src/img/docs/Pasted%20image%2020231101091557.png)

## Projection
- La projection s’écrit: $\pi s(r)$
	- r est la relation de schéma R, projetée sur $S \in R$ 
	- Le résultat est une relation r' de schéma S qui ne conserve que les attributs de S
	- Les éventuels doublons sont supprimés
![](/_src/img/docs/Pasted%20image%2020231101091751.png)
>[!important]
>Equivalent à une commande SQL 
>```SQL
>SELECT nom, prenom, annéeNaissance FROM Réalisateur
>```

## Union
- L’union s’écrit: $r \cup s$ 
	- le résultat est une relation r' qui contiendra tous les tuples qui sont dans r et tous ceux qui sont dans s 
	- les éventuels doublons sont supprimés
	- r et s doivent être de même schéma (leurs attributs doivent être identiques en nombre, de même nom et de même type)
![](/_src/img/docs/Pasted%20image%2020231101092807.png)

## Difference
- La différence s’écrit: $r - s$
	- le résultat est une relation r' qui contiendra tous les tuples de r qui n’existent pas dans s 
	- les éventuels doublons sont supprimés 
	- r et s doivent être de même schéma

- La différence sert souvent à résoudre les requêtes voulant des résultats ne vérifiant pas une propriété
![](/_src/img/docs/Pasted%20image%2020231101093004.png)

## Produit cartésien
- Le produit cartésien s’écrit: $r \times s$ 
	- le résultat est une relation r' où chaque tuple de r est associé à chaque tuple de s
![](/_src/img/docs/Pasted%20image%2020231101093251.png)
>[!important]
>Equivalent à une commande SQL 
>```SQL
>SELECT ... FROM Cinéma CROSS JOIN Salle
>```
