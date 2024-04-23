---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Syntaxe](#syntaxe)
- [Delete](#delete)
- [Avantages](#avantages)
- [Insertion avec héritage](#insertion-avec-h%C3%A9ritage)

___
## Définition
>[!important]
>CTE, ou Common Table Expression, est une clause SQL introduite par `WITH`. Elle permet de définir temporairement une table dans une requête SQL, souvent utilisée pour simplifier la lecture ou optimiser l'exécution de la requête. Les CTE sont utiles pour organiser et modéliser des parties complexes de requêtes.
## Syntaxe
La syntaxe générale d'une CTE est la suivante : 
```sql
WITH nom_cte (colonne1, colonne2, ...) AS (
    SELECT ...
    FROM ...
    WHERE ...
)
SELECT ...
FROM nom_cte
WHERE ...;
```

En appelant `nom_cte` nous pouvons réutiliser le résultat de cette requête stockée dans une table dite temporaire.
## Delete
Dans le cas ou l'on souhaite déplacer des tuples il est possible d'utiliser une CTE. Par exemple nous souhaitons déplacer dans une table `old_employes` tous les employés qui ont quitté notre entreprise. Nous pouvons utiliser la requête suivante : 
```sql
WITH moved_employes AS (
	DELETE FROM employes WHERE date_depart < 'today_date' RETURNING *
)
INSERT INTO old_employes SELECT * FROM moved_employes;
```

>[!warning]
>Il est important que la table `old_employes` ait la même structure que la table `employes` pour que l'insertion puisse se faire sans condition.

Pour compléter l’exemple initial, une table de log est créée afin de savoir quand et combien d'ancien employés ont été archivés.

```sql
CREATE TABLE LogArchivage ( 
	id smallserial,
	dateArchivage date NOT NULL, 
	nombreFilms integer NOT NULL, 
	CONSTRAINT PK_LogArchivage PRIMARY KEY(id) 
);

-- REQUETE DE DEPLACEMENT

INSERT INTO log_archivage(dateArchivage, nombreEmployes) 
	SELECT now(), count(*) FROM moved_employes;
```

## Avantages
Les avantages des CTE incluent une meilleure lisibilité du code, la possibilité de réutiliser des sous-requêtes, et l'optimisation par le moteur de base de données, qui peut stocker temporairement les résultats de la CTE pour des performances améliorées.

Il peut y avoir plus d’une CTE dans une requête et elles peuvent se référencer entre elles.

## Insertion avec héritage
![](../../../../S0/PiecesJointes/Pasted%20image%2020240114092959.png)
