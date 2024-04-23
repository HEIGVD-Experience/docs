---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Les sommets dits adjacents sont tous ceux reliés par un arc ou une arrête à un sommet.

| Explications | Image |
| ------------ | ----- |
| Dans ce cas si nous prenons le sommet $v_{3}$ nous pouvons voir qu'il possèdes 4 arrêtes. 2 reliant au sommet $v_{1}$, 1 reliant au sommet $v_{2}$ ainsi que 1 sur lui même. |![[S0/PiecesJointes/Pasted image 20230616222800.png]]|

## Matrice d'adjacence
### Graph non-orienté
Dans le cas d'un graph non-orienté, la matrice d'adjacence construite en se basant sur ses arrêtes sera **forcément symétrique**. Celle-ci stockera le nombre d'arrêtes entre deux sommets.
![[S0/PiecesJointes/Pasted image 20230616223338.png]]

### Graph orienté
Dans le cas d'un graph orienté, la matrice d'adjacence construite en se basant sur ses arcs ne sera **pas forcément symétrique**. Celle-ci stockera le nombre d'arcs entre deux sommets.
![[S0/PiecesJointes/Pasted image 20230616223631.png]]
## Liste d'adjacence
### Graph non-orienté
![[S0/PiecesJointes/Pasted image 20230624113359.png]]
### Graph orienté
![[S0/PiecesJointes/Pasted image 20230624113419.png]]

### Exemple d'écriture
![[S0/PiecesJointes/Pasted image 20230624113616.png]]


