---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Syntaxe](#syntaxe)
	- [Agrégation sur sous-ensemble](#agr%C3%A9gation-sur-sous-ensemble)
	- [Agrégation sur ensemble complet](#agr%C3%A9gation-sur-ensemble-complet)
	- [rank() vs row_number()](#rank-vs-row_number)

___
## Définition
>[!important]
>Une window function en SQL est une fonction d'analyse qui s'applique à un ensemble spécifique de lignes dans le résultat d'une requête. Elle diffère des fonctions d'agrégation classiques (comme `SUM`, `AVG`, `COUNT`, etc.) en ce sens qu'elle ne réduit pas le nombre de lignes résultantes, mais attribue plutôt une valeur à chaque ligne basée sur un "fenêtre" spécifié de lignes.
## Syntaxe
### Agrégation sur sous-ensemble
Dans le cas ou nous souhaitons faire la moyenne de tous les salaires par département tout en gardant l'ensemble de données de la table `employes` nous pouvons utiliser une `window function`.
```sql
SELECT 
	*,
	avg (salaire) OVER (PARTITION BY departement) AS salaire_moyen_departement
FROM employes;
```
La fonction de fenêtre commence toujours par le mot clé `OVER` suivit de : 
- `PARTITION BY` pour spécifier les sous-ensemble sur le quel effectuer la fonction.
- `ORDER BY` permet d'ordonner les tuples dans la fonction d'agrégation.
### Agrégation sur ensemble complet
Dans le cas ou nous souhaitons appliquer un calcul sur tous les tuples il ne faut pas utiliser le mot clé `PARTITION BY` dans notre `OVER`. Si nous souhaitons avoir le salaire moyen de tous les employés de l'entreprise nous pouvons faire : 
```sql
SELECT
	*,
	avg (salaire) OVER () AS salaire_moyen_global
FROM employes;
```
### rank() vs row_number()
En SQL il existe deux fonctions `rank()` ainsi que `row_number()` qui permettent de donner des valeurs incrémentales à chaque tuple et ce aussi grâce à des conditions. Nous pourrions par exemple classer les employés de chaque département par salaire.
```sql
SELECT
	*,
	rank() OVER (PARTITION BY departement ORDER BY salaire),
	row_number() OVER (PARTITION BY departement ORDER BY salaire)
FROM employes
```

>[!warning]
>Attention, dans le cas ou nous utilisons `rank()` et que nous aurions deux personnes du même département avec le même salaire, alors ces deux personnes aurons la même valeur pour `rank()` ce qui aurait été différent avec  `row_number()`.

