---
Type: PriseDeNote
MiseAuPropre: oui
---
## Définition
>[!important]
> En base de données un attribut correspond à variable ou un attribut en programmation. Un attribut dans une table listant des films aurait comme attribut le titre par exemple.

## Types d'attributs

- Monovalué -> si l’attribut ne peut prendre qu’une seule valeur, par exemple une date de naissance
- Multivalué -> l’attribut peut prendre plusieurs valeurs (par exemple pour gérer des personnes pouvant avoir plusieurs prénoms)
---
- Simple -> (ou atomique) si l’attribut ne peut pas être décomposé en plusieurs autres attributs
- Composite -> par exemple une adresse (que l’on peut décomposer en ville + NPA + rue +…)
---
- Obligatoire -> s’il doit forcément avoir une valeur pour chaque tuple
- Facultatif -> souvent dit nullable car peut prendre la valeur NULL
---
- Stocké -> La valeur est simplement stockée dans la base de données
- Dérivé/calculé -> Par exemple l’âge d’une personne peut être calculé à partir de sa date de naissance (qui est un attribut stocké) et de la date courante

>[!attention]
>Sauf en cas d’obligation, par exemple pour des questions de performance, on ne **stocke jamais d’attributs qui peuvent être dérivés/calculés**

![](/_src/img/docs/Pastedimage20230920092100.png)