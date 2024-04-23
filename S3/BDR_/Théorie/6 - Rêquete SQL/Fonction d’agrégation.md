---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Fonctions](#fonctions)
	- [Count](#count)
	- [Sum](#sum)
	- [Avg](#avg)
	- [Min](#min)
	- [Max](#max)
- [Group By](#group-by)
- [Having](#having)
- [Coalesce](#coalesce)

___
## Définition
>[!important]
>En SQL, les fonctions d'agrégation sont utilisées pour effectuer des calculs sur un ensemble de valeurs et retourner un résultat unique. Ces fonctions sont généralement utilisées avec la clause `GROUP BY` pour regrouper les données en fonction de certaines colonnes, puis appliquer l'opération d'agrégation sur chaque groupe de données.

## Fonctions
### Count
Compte le nombre de tuples dans la requête.
```sql
SELECT COUNT(*) FROM employes;
```
### Sum
Calcule la somme des valeurs dans un groupe.
```sql
SELECT SUM(salaire) FROM employes;
```
### Avg
Calcule la moyenne des valeurs dans un groupe.
```sql
SELECT AVG(salaire) FROM employes;
```
### Min
Retourne la valeur minimale dans un groupe.
```sql
SELECT MIN(salaire) FROM employes;
```
### Max
Retourne la valeur maximale dans un groupe.
```sql
SELECT MAX(salaire) FROM employes;
```
## Group By
La clause `GROUP BY` est utilisée en SQL pour regrouper les lignes d'un résultat de requête en fonction des valeurs de une ou plusieurs colonnes spécifiées. Elle est souvent utilisée en conjonction avec des fonctions d'agrégation telles que `COUNT`, `SUM`, `AVG`, `MIN`, et `MAX` pour effectuer des calculs sur des groupes spécifiques de données.
## Having
La clause `HAVING` permet de mettre une ou des conditions que les groupements faits par le `GROUP BY` doivent respecter.
Si nous souhaitons regrouper combien d'employés nous avons par département administratif de l'entreprise nous pouvons faire la requête suivante : 
```SQL
SELECT
	departement,
	COUNT(id) AS nombre_employes
FROM employes
GROUP BY departement
HAVING departement LIKE '2%'
```
## Coalesce
La fonction `COALESCE` en SQL est utilisée pour renvoyer la première valeur non nulle dans une liste de valeurs. Elle prend plusieurs arguments et renvoie le premier argument non nul trouvé. Si tous les arguments sont nuls, elle renvoie également `NULL`.
Supposons que nous ayons une table `employes` avec les colonnes `nom`, `salaire`, et `prime`. La colonne `prime` peut contenir des valeurs nulles. Nous voulons créer une requête qui renvoie le salaire total pour chaque employé, en prenant en compte la prime s'il y en a une, sinon en considérant le salaire seul.

```sql
SELECT  
	nom, 
    salaire, 
    COALESCE(prime, 0) AS prime, 
    salaire + COALESCE(prime, 0) AS salaire_total
FROM employes;
```

````col
```col-md
flexGrow=1
===
### Table employes
|id|nom|salaire|prime|
|---|---|---|---|
|1|Alice|50000|2000|
|2|Bob|60000|NULL|
|3|Charlie|55000|1000|
|4|David|70000|3000|
```
```col-md
flexGrow=1
===
### Résultat
| nom      | salaire | prime | salaire_total |
|----------|---------|-------|---------------|
| Alice    | 50000   | 2000  | 52000         |
| Bob      | 60000   | 0     | 60000         |
| Charlie  | 55000   | 1000  | 56000         |
| David    | 70000   | 3000  | 73000         |
```
````
