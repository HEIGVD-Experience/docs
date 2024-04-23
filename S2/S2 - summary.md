## Prise de notes à mettre au propre
```dataview
TABLE 
replace(substring(file.folder,3,7), "_","") as "Branche",
substring(file.folder, 16) as "Chapitre",
MiseAuPropre as "Mise au propre",
dateformat(file.ctime,"dd-MM-yyyy") as "Date de creation"
FROM "S2"
WHERE Type = "PriseDeNote"
AND MiseAuPropre = "non"
SORT substring(file.folder,3,7),substring(file.folder, 16)
```

## Moyenne S2
PRG2 : note 4.0 -> exam 2.9 -> moyenne 3.5
ASD   : note 4.7 -> exam 3.3-> moyenne 4
MAT2 : note 3.9 -> exam 3.6 -> moyenne 4
RXI     : note 5.4 -> exam 2.1 -> moyenne 4