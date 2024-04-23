---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Un graph informatique est une structure de données utilisée pour représenter des relations entre des éléments. Il est utilisé pour résoudre des problèmes de parcours et d'analyse de données. Les graphes sont représentés sous forme de listes ou de matrices et sont utilisés dans divers domaines informatiques tels que la recherche de chemins, les réseaux sociaux et les systèmes logiciels. Ils permettent de trouver des chemins, des cycles et des composantes connexes.

## Composition
Un graph est composé de trois informations :
1. Des sommets
	- Représentent des points (ex. des stations de métro)
2. Des arcs / arêtes
	- Représentent les connexion entre les sommets (ex. ligne de métro)
3. Des pondérations
	- Représentent les poids de chacun des arcs (ex. le temps de parcours ou distance d'un somment à un autre)

## Orientation
Il existe deux types de graph, ceux dit orientés et ceux dit non orientés.

### Non orientés
![[S0/PiecesJointes/Pasted image 20230616221259.png]]
- Les deux sommets sont reliés par une **arrête** qui n'a pas de sens
- Ces deux sommets sont dis adjacents

### Orientés
![[S0/PiecesJointes/Pasted image 20230616221440.png]]
- Les deux sommets sont reliés par un **arc**

## Caractéristiques

### Degré
Le degré `deg(v)` d’un sommet `v` est le nombre d’arêtes ou d’arcs incidents à `v`, les boucles étant comptées à **double**.
Le calcul du degré d'un sommet s'effectue en additionnant tous les arcs sortant aux arcs entrants tout en oubliant pas de compter l'entrée et la sortie pour les arcs étant des boucles.