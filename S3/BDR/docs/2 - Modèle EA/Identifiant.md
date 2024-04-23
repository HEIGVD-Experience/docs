---
Type: PriseDeNote
MiseAuPropre: oui
---
## Définition
>[!important]
>Un identifiant est tout sous-ensemble minimal des attributs d’un type d’entité permettant d’identifier univoquement chaque tuple

## Clé candidates
Les clés candidates sont la liste des clés qui pourraient être la clé primaire de notre table. Il peut y en avoir qu'une, on doit donc en choisir une.

## Choix de clé primaire
- Être absolument univoque
- Ne, si possible, pas voir sa valeur être modifiée
- Avoir une taille de stockage la plus petite possible

## Type de clé
- Clé naturelle -> Ensemble, minimal et unique, d’attributs présents naturellement dans le type d’entité (par exemple le no AVS d’une personne)
	- Avantage -> pas besoin d’ajouter d’attribut
	- Désavantage -> est liée à la logique métier donc pourrait être modifiée voir supprimée (peut-être composé de beaucoup d'attributs donc attention)
- Clé artificielle -> Attribut que l’on rajoute et qui n’est pas lié sémantiquement aux attributs naturels
	- Avantage -> n’est pas lié à la logique métier, donc on a le choix du type et ses valeurs ne seront pas modifiées
	- Désavantage -> ne fournit aucune information métier