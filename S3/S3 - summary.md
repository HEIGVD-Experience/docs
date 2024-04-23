## Prise de notes à mettre au propre
```dataview
TABLE 
replace(substring(file.folder,3,7), "_","") as "Branche",
substring(file.folder, 16) as "Chapitre",
MiseAuPropre as "Mise au propre",
dateformat(file.ctime,"dd-MM-yyyy") as "Date de creation"
FROM "S3"
WHERE Type = "PriseDeNote"
AND MiseAuPropre = "non"
SORT substring(file.folder,3,7),substring(file.folder, 16)
```
