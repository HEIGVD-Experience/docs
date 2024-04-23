---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Syntaxe](#syntaxe)
- [INSERT, UPDATE et DELETE](#insert-update-et-delete)
- [Materialized Views](#materialized-views)

___
## Définition
>[!important]
>En SQL, une vue (ou vue SQL) est une représentation virtuelle d'une ou plusieurs tables dans une base de données. Une vue ne stocke pas réellement les données, mais elle fournit une vue structurée et filtrée des données stockées dans les tables sous-jacentes. Les vues sont souvent utilisées pour simplifier les requêtes complexes, masquer des détails de données sensibles et créer des abstractions pour faciliter l'accès aux informations.

## Syntaxe
Lors de la création d'une vue il existe une convention de nommage qui nous demande de commencer le nom des vues par un `v` avant son nom. Si nous souhaitons créer une vue qui nous retourne le salaire moyen de chaque département de notre entreprise nous pourrions faire : 
```sql
CREATE VIEW vSalaireParDepartement AS
	SELECT
		departement,
		avg(salaire) OVER (PARTITION BY departement)
	FROM employes;
```
L'avantage est que si l'on ajoute des employés dans la table `employes` et que nous faisons : 
```sql
SELECT * FROM vSalaireParDepartement;
```
Les données seront automatiquement mise à jour par rapport aux nouveaux tuples inséré dans la table `employes`.

## INSERT, UPDATE et DELETE
Pour pouvoir utiliser les instructions de mise à jour des données (INSERT, UPDATE et DELETE) sur une vue, il faut que sa requête:
- Ne contienne qu’une seule table dans sa clause FROM
- N’ait pas d’opérations ensemblistes (UNION,…)
- Ne contienne pas de fonctions d’agrégation, ni de CTE, …
## Materialized Views
Les differences avec une vue non matérialisée sont que:
- Les données sont stockées (de manière similaire à une table)
- Les données ne sont pas automatiquement à jour, il faut faire: 
	  `REFRESH MATERIALIZED VIEW name; `
- On peut y associer des INDEX