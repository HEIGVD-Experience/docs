---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition

|Info|Graph|
|--|--|
|En programmation informatique, un arbre est une structure de données hiérarchique utilisée pour organiser et stocker des informations de manière efficace. Il se compose de nœuds reliés entre eux par des liens appelés arêtes. L'élément situé au sommet de l'arbre est appelé nœud racine, tandis que les nœuds suivants sont appelés nœuds enfants. Chaque nœud peut avoir plusieurs enfants, mais ne peut avoir qu'un seul parent.|![[/_src/img/docs/Capture d’écran 2023-05-11 à 08.56.10.png]]|

## Propriétés 
### Noeuds interne

| Info                                                                                                                                                                 | Graph                                |
| -------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------ |
| Les noeuds interne ont **obligatoirement** des enfants.<br> Les autres noeuds sont considérés comme des feuilles de l'arbre.<br> Le `A`est appelé racine de l'arbre. | ![[/_src/img/docs/Pasted image 20230511090150.png]] |

### Degré

| Info                                                                               | Graph               |
| ---------------------------------------------------------------------------------- | ------------------- |
| Degré d’un noeud : nombre d’enfants <br>Degré d’un arbre : degré max de ses noeuds | ![[/_src/img/docs/Sans titre.jpg]] |

### Hauteur

| Info                                                                                                                                            | Graph                                          |
| ----------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- |
| Hauteur d’un arbre: niveau maximum parmi ses noeuds. <br>Comptage du nombre de ligne de l'arbre depuis la racine ou position `p` du sous-arbre. | ![[/_src/img/docs/Capture d’écran 2023-05-14 à 11.40.02.png]] |

### Arbre plein

| Info                                                                                              | Graph                                |
| ------------------------------------------------------------------------------------------------- | ------------------------------------ |
| Tous les noeuds de niveau `h-1` sont de degrés `d`.<br>`h` = hauteur donc 4<br>`d` = degré donc 3 | ![[/_src/img/docs/Pasted image 20230514114523.png]] |

### Arbre complet

| Info                                                        | Graph                                |
| ----------------------------------------------------------- | ------------------------------------ |
| Arbre plein dont le dernier niveau est rempli par la gauche | ![[/_src/img/docs/Pasted image 20230514114909.png]] |

### Arbre dégénéré
Un arbre est dit dégénéré quand son degré est de 1.

## Représentation

|Info|Graph|
|--|--|
|Arbre|![[/_src/img/docs/Pasted image 20230523221018.png]]|
|Représentation liste imbriquées|![[/_src/img/docs/Pasted image 20230523221134.png]]
|Représentation indentée|![[/_src/img/docs/Pasted image 20230523221048.png]]|
