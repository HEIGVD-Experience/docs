---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [INNER JOIN](#inner-join)
- [LEFT JOIN](#left-join)
- [RIGHT JOIN](#right-join)
- [FULL JOIN](#full-join)
- [CROSS JOIN](#cross-join)
- [NATURAL JOIN](#natural-join)

___
## Définition
>[!important]
>Une jointure permet de lier les tuples de plusieurs tables en y définissant un critère de rapprochement. Il existe différents type de jointure qui vont être expliquées dans les points suivant. La jointure par défaut est INNER, c’est celle correspondant à la (thêta ou équi)-jointure en algèbre relationnelle.

## INNER JOIN
Cette jointure renvoie uniquement les lignes qui ont des valeurs correspondant aux deux tables. Les tuples de la table initiale n'ayant aucune correspondance dans la deuxième table n'apparaîtront pas dans la sortie.
![](/_src/img/docs/Pasted%20image%2020240113170519.png)
La syntaxe est la suivante : 
```sql
SELECT expression 
FROM table1 
INNER JOIN table2 ON table1.val = table2.val;
```

>[!warning]
>- La jointure interne `INNER JOIN` ne fournit dans la table résultat que les tuples qui satisfont au critère de jointure.
>- Les jointures externes permettent de garder tous les tuples d’une table, même ceux qui ne satisfont pas au critère de jointure.
## LEFT JOIN
Un `LEFT JOIN`, aussi appelé `LEFT OUTER JOIN`, est une opération de jointure en SQL qui retourne toutes les lignes de la table de gauche (la première mentionnée) et les lignes correspondantes de la table de droite (la seconde mentionnée). Si aucune correspondance n'est trouvée, les colonnes de la table de droite auront des valeurs NULL.
![](/_src/img/docs/Pasted%20image%2020240113170459.png)
La syntaxe est la suivante : 
```sql
SELECT expression 
FROM table1 
LEFT JOIN table2 ON table1.val = table2.val;
```
## RIGHT JOIN
Un `RIGHT JOIN`, aussi appelé `RIGHT OUTER JOIN`, est une opération de jointure en SQL qui retourne toutes les lignes de la table de droite (la seconde mentionnée) et les lignes correspondantes de la table de gauche (la première mentionnée). Si aucune correspondance n'est trouvée, les colonnes de la table de gauche auront des valeurs NULL.
![](/_src/img/docs/Pasted%20image%2020240113170740.png)
La syntaxe est la suivante : 
```sql
SELECT expression 
FROM table1 
RIGHT JOIN table2 ON table1.val = table2.val;
```
## FULL JOIN
Un `FULL OUTER JOIN` retourne toutes les lignes lorsqu'il y a une correspondance dans l'une des tables. Si aucune correspondance n'est trouvée, les colonnes de la table qui n'a pas de correspondance auront des valeurs NULL. Cela combine les résultats de `LEFT JOIN` et `RIGHT JOIN`.
![](/_src/img/docs/Pasted%20image%2020240113171717.png)

## CROSS JOIN
Un `CROSS JOIN` est une opération de jointure en SQL qui produit le produit cartésien de deux tables, c'est-à-dire toutes les combinaisons possibles de lignes entre les deux tables. Il n'utilise pas de clause `ON` pour spécifier une condition de jointure.
## NATURAL JOIN
La clause `NATURAL JOIN` en SQL effectue une jointure en utilisant toutes les colonnes ayant le même nom dans les deux tables. Cette clause ne nécessite pas de spécifier explicitement les colonnes à utiliser pour la jointure.