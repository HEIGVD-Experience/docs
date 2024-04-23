---
Type: PriseDeNote
MiseAuPropre: oui
---

## Fonctionnement clé
Une information complète se retrouve normalement à l’aide d’une clé qui l’identifie. Par exemple,
- Dans un annuaire téléphonique, connaître le nom et les prénoms d’un individu permet de retrouver son numéro de téléphone.
- Dans les sociétés modernes qui refusent le flou (et dans les ordinateurs) la clé doit identifier un individu unique, d’où par exemple, l’idée du numéro de sécurité sociale (AVS).

## Tableau associatif
- Nous voulons un ensemble dynamique d’informations, c’est-à-dire aussi pouvoir ajouter ou supprimer un élément d’information.
- On en vient naturellement à définir un type abstrait de données, appelée table de symboles, table d’association, ou map, qui offre les opérations suivantes:
	- Ajouter une nouvelle association entre une clé et une valeur: insert / put
	- Trouver la valeur associée à une clé donnée: find / search / get
	- Retirer une clé de la table (avec la valeur associée): erase / delete

## Complexité
![](/_src/img/docs/Pasted image 20230626134417.png)
