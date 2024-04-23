---
Type: PriseDeNote
MiseAuPropre: oui
---

>[!important] Définition
>Un arbre AVL est un arbre binaire de recherche qui garantit qu'aucun noeud n'a un déséquilibre autre que $-1$, $0$ ou $1$ en se ré-équilibrant à chaque opération d’insertion / suppression.

## Structure
Dans le cas ou nous souhaitons construire un arbre AVL il est **nécessaire** d'ajouter un champ dans notre structure de données.

```cpp
structure Noeud<K> 
	K clé 
	Noeud* gauche 
	Noeud* droit 
	Entier hauteur // la hauteur doit être ajoutée
```

Comme expliqué dans la note [[Propriétés d'un arbre générique]] l'information `hauteur` permet de connaitre la distance depuis la feuille la plus basse jusqu'au noeud souhaité. Il sera primordial que cette information de hauteur soit recalculée après chaque opération du type **insertion ou suppression**.

## Equilibrage
Pour équilibrer un arbre il nous faut, premièrement, calculer pour chaque noeud son équilibre. Pour calculer l'équilibre il suffit de prendre chaque noeud et de soustraire la hauteur du sous-arbre droite à la hauteur du sous-arbre gauche. Si la valeur trouvée est différente de $-1, 0, 1$ alors l'arbre est dit déséquilibré.

## Rotation
La rotation dans un arbre AVL est la technique qui nous permettra de rééquilibrer un arbre. 
- Si un noeud à un déséquilibre plus petit que $-1$, alors sa rotation sera une rotation gauche.
- Si un noeud à un déséquilibre plus grand que $+1$, alors sa rotation sera une rotation droite.
- Il existe des cas dans lesquels une double rotation doit être faite.

### Gauche (-2)
Dans le cas d'une rotation gauche il faut : 

| Explication | Arbres |
| ----------- | ------ |
|1. Prendre l'enfant de droite `Y` (de la racine en déséquilibre)<br>2. Rattacher l'enfant gauche `B` à la racine `X` à la place de `Y`<br>3. Rattacher la racine `X` comme enfant gauche de `Y`|![[/_src/img/docs/Pasted image 20230529110305.png]]|

### Droite (+2)
Dans le cas d'une rotation à droite on applique exactement le même procédé en inversant juste le sous-arbre dans lequel on va chercher l'enfant.

### Cas particulier 1
Dans certains cas l'arbre aura un déséquilibre mais son sous-arbre tendra vers l'intérieur de l'arbre. Dans cette situation il faudra passer par une double rotation pour rendre l'arbre équilibré.

D'abord il faudra faire une rotation pour pousser le sous-arbre interne sur l'extérieur. Une fois le sous-arbre interne sur l'extérieur nous pourrons appliquer une simple rotation pour rendre l'arbre équilibré.

## Linéariser
Le principe de linéaires un arbre est de transformer notre ABR en un ABR dégénéré. Cet ABR dégénéré ressemblera grandement à une liste simplement chainée. Grâce à cette technique il sera possible d'arboriser notre arbre et de retrouver une forme correcte pour un ABR.

Pour ce faire, nous allons commencer par chercher la valeur avec la plus grande clé et la définir comme étant le bas de notre ABR dégénéré, puis nous allons remonter celui-ci en ajoutant à chaque fois la valeur de moins en moins grande comme racine de notre ABR dégénéré.

| ABR |     | ABR dégénéré |
| --- | --- | ------------ |
|![[/_src/img/docs/Pasted image 20230529114335.png]]|![[/_src/img/docs/Pasted image 20230529114353.png]]|![[/_src/img/docs/Pasted image 20230529114415.png]]|

1. 8 est la plus grande clé de l'arbre
2. 7 aura comme enfant droite 8
3. 6 aura comme enfant droite 7
4. 5 aura comme enfant droite 6 et gardera son sous-arbre comme enfant gauche
5. 4 aura comme enfant droite 5
6. 3 aura comme enfant droite 4
7. 2 aura comme enfant droite 3 et gardera 1 comme enfant gauche
8. 1 aura comme enfant droite 2

## Arboriser
Le principe d'arboriser est de partir d'un ABR dit dégénéré mais ordonné (de la plus petite clé à la plus grande) et retrouver une forme équilibrée d'un ABR. Pour cela il faut prendre notre ABR dégénéré et prendre son élément $\frac{n-1}{2}$ de manière récursive sur chaque sous-ensemble séparé

| ABR dégénéré |     | ABR |
| ------------ | --- | --- |
|![[/_src/img/docs/Pasted image 20230529114415.png]]|![[/_src/img/docs/Pasted image 20230529114353.png]]|![[/_src/img/docs/Capture d’écran 2023-05-29 à 12.15.31.png]]|

1. 4 est choisi comme racine de l'arbre car se trouve au milieu de la liste
2. 2 est choisi comme enfant gauche de la racine 4 car se trouve au milieu de la liste allant de 1 à 3
3. 1 est choisi comme enfant gauche de 2
4. 3 est choisi comme enfant droite de 2
5. 6 est choisi comme enfant droite de la racine 4 car se trouve au milieu de la liste allant de 5 à 8
6. 5 est choisi comme enfant gauche de 6
7. 7 est choisi comme enfant droite de la sous-racine 6 car se trouve au milieu de la liste allant de 7 à 8
8. 8 est choisi comme enfant droite de 7