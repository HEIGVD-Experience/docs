---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Syntaxe](#syntaxe)
- [Evaluation](#evaluation)
- [Exemple](#exemple)

___
## Définition
>[!important]
>Une requête récursive en SQL est une requête qui fait référence à elle-même, permettant ainsi de traiter des données hiérarchiques stockées dans une table. Cela peut être utile pour traiter des structures d'arborescence comme les arbres généalogiques, les organigrammes, les listes imbriquées, etc.
## Syntaxe
La requête récursive utilise la clause `WITH RECURSIVE` dans laquelle une ou plusieurs parties de la requête sont définies. Ces parties sont généralement appelées "ancres" et "itérations".

```sql
WITH RECURSIVE data AS (
	SELECT * FROM table1 -- Ancrage
	UNION -- ou UNION ALL
	SELECT * FROM table2 -- Partie récursive -> à mettre avec une condition
)
SELECT * FROM data;
```
## Evaluation
- L’évaluation se fait de manière itérative en commençant par la partie non récursive
- Ensuite la partie récursive génère des valeurs jusqu’à ce qu’elle retourne un ensemble vide (0 tuples)
- Enfin, toutes les valeurs sont appondues par le UNION ou UNION ALL
## Exemple
Dans cet exemple, la requête récursive commence avec l'ancrage, sélectionnant les employés qui n'ont pas de gestionnaire (`manager_id IS NULL`). Ensuite, elle itère en sélectionnant les employés qui ont comme gestionnaire les employés déjà sélectionnés, créant ainsi une hiérarchie complète d'employés et de gestionnaires.
```sql
WITH RECURSIVE Organigramme AS (
    SELECT id, nom, manager_id
    FROM employes
    WHERE manager_id IS NULL -- Ancrage : les managers principaux
    UNION ALL
    SELECT e.id, e.nom, e.manager_id
    FROM employes e
    JOIN Organigramme o ON e.manager_id = o.id -- Itération
)
SELECT * FROM Organigramme;
```