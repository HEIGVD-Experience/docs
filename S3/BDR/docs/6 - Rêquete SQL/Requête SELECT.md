---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Requête](#requ%C3%AAte)
- [Distinct](#distinct)
- [Condition = ou LIKE](#condition--ou-like)
- [Between](#between)
- [Order By](#order-by)
- [Operations ensemblistes](#operations-ensemblistes)
	- [Union](#union)
	- [Union All](#union-all)
- [Case](#case)
- [Structure complète](#structure-compl%C3%A8te)

___
## Définition
>[!important]
>Le type de requête SELECT ... permet de sélectionner des données dans une ou plusieurs tables. Les requêtes SELECT sont composée d'une multitude de sous argument permettant d'affiner et/ou complexifier les données que nous souhaitons remonter.

## Requête
La requête a comme arguments obligatoires les suivants:
```sql
SELECT expression
FROM    nom_table
[WHERE condition];
```
- SELECT correspond à la [projection](../5%20-%20Algèbre%20relationnel/Opérateur%20fondamentaux.md#projection) en algèbre relationnelle 
- WHERE correspond à la [sélection](../5%20-%20Algèbre%20relationnel/Opérateur%20fondamentaux.md#s%C3%A9lection) en algèbre relationnelle
>[!warning]
>Cette requête SQL n’est par contre pas ensembliste, on a donc le doublon ‘Scott’ (ce qui n’était pas le cas en algèbre relationnelle).
>

## Distinct
Il est possible d'avoir un résultat ensembliste en appliquant le mot clé `DISTINCT` directement après le `SELECT`.

```SQL
SELECT DISTINCT nom 
FROM Réalisateur 
WHERE annéeNaissance > 1900;
```
- Cette requête est équivalente à la version en algèbre relationnelle: $\pi \> nom (\sigma \> annéeNaissance > 1900 (Réalisateur))$

## Condition = ou LIKE
Il est souvent nécessaire dans la condition `WHERE` de la requête de faire matcher les tuples avec une valeur. Pour cela nous serons amener à utiliser :
```sql
WHERE colonne = 'valeur';
```
Le = oblige la valeur dans colonne à être exactement pareille que la valeur passée après le =. 
Dans certains cas nous souhaitons retrouver un pattern dans notre colonne et non pas une valeur exacte. C'est pourquoi le mot clé `LIKE` existe : 
```sql
WHERE colonne LIKE '%valeur%'
```
Le symbole **%** signifie que l'on souhaite avoir notre chaine `valeur` mais qu'elle peut se trouver au milieu d'autres caractères. Si nous avions : 
- `LIKE 'valeur%'` la correspondance devrait commencer par valeur puis peut avoir $n$ caractères **après**.
- `LIKE '%valeur'` la correspondance devrait finir par valeur mais peut avoir $n$ caractères **avant**.

Il existe aussi le symbole _ qui permet de signifier exactement 1 caractère. Par exemple : `WHERE colonne LIKE '_s%';` -> implique la deuxième lettre à `s`.

## Between
Une condition sur un intervalle de valeurs s’écrit: 
```sql
WHERE durée BETWEEN 120 AND 150;
```
Permet de simplifier deux conditions plus petit que et plus grand que.

## Order By
Pour trier les résultats d’une requête, selon un ou plusieurs critères, il faut utiliser la clause ORDER BY: 
```sql
SELECT * 
FROM Film 
ORDER BY durée DESC, année;
```

## Operations ensemblistes
PostgreSQL propose des correspondance aux opérateurs de l’algèbre relationnelle suivantes :
- Union -> UNION
- Différence -> EXCEPT
- Intersection -> INTERSECT

Ces opérations sont ensemblistes, les doublons sont automatiquement supprimés du résultat. 

### Union
Le mot clé `UNION` permet d'assembler les résultats de plusieurs requêtes, celle-ci doivent avoir la même structure. Cette opération est ensembliste donc si des tuples sortent dans plusieurs requêtes ils n'apparaîtront qu'une seule fois.

### Union All
Pareil que le mot clé `UNION` sauf que cette requête garde tout les tuples et n'est donc pas ensembliste.

## Case
SQL dispose de l’expression conditionnelle `CASE` avec la syntaxe suivante : 
```sql
SELECT id,
CASE 
	WHEN condition THEN result
	[WHEN ...]
	[ELSE result]
END AS condition
FROM table;
```
Chaque **result** doit retourner une valeur d’un type compatible.
- Fonctionnement "classique", sert aussi à faire les if/else:
	- condition doit retourner une valeur booléenne
	- Si la condition est vraie, l’expression retourne le result qui suit
		- Le reste est ignoré ("break" automatique)
	- Si aucune condition est vraie
		- result de ELSE est retourné
		- NULL est retourné en cas d’absence de ELSE
## Structure complète
Seules les clauses SELECT et FROM sont obligatoires
```sql
SELECT  expression 
FROM     table_name 
[WHERE condition]
[GROUP BY  group_condition]
[HAVING       having_condition]
[ORDER BY   sort_expression];
```

- Chaque requête est évaluée dans l’ordre suivant: 
	1. WHERE 
	2. GROUP BY (et HAVING) 
	3. SELECT
- Sans ORDER BY, l’ordre des résultats n’est pas défini.