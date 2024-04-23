
## Prise de notes à mettre au propre
```dataview
TABLE 
substring(file.folder, 16) as "Chapitre",
MiseAuPropre as "Mise au propre",
dateformat(file.ctime,"dd-MM-yyyy") as "Date de creation"
FROM "S2/PRG2/Théorie"
WHERE MiseAuPropre = "non"
SORT substring(file.folder, 15), dateformat(file.ctime,"yyyy"), dateformat(file.ctime,"MM"), dateformat(file.ctime,"dd")
```
---
## Laboratoires
```dataview
TABLE 
Chapitre as Chapitre,
dateformat(DateDeRetour,"dd-MM-yyyy") as "Date de retour",
Note as Note
FROM "S2/PRG2/Laboratoires"
SORT Chapitre
```
---
## Wikipédia
```dataview
TABLE 
Chapitre,
MiseAuPropre AS "Mise au propre"
FROM "S0/Wikipédia"
WHERE Branche = "PRG2"
```