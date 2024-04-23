---
Type: PriseDeNote
MiseAuPropre: oui
---

## std::array
Array est une structure linéaire dont :
- la taille est fixe et doit être connue à la **compilation**
- son type ainsi que sa taille sont spécifiés en paramètres génériques
- la mémoire est allouée automatiquement (stack memory)
![[S0/PiecesJointes/Pasted image 20230527101443.png]]

## std::vector
Vector est une structure linéaire dont : 
- la taille et la capacité sont variable
- son type est donné de manière générique
- la mémoire est allouée dynamiquement (heap memory)
![[S0/PiecesJointes/Pasted image 20230527102039.png]]

## std::list (liste doublement chainée)
List est une structure linéaire dont :
- seul la tête et la queue sont connues sans itération
- contient la taille de la list pour y accéder en $O(1)$
- pas d'accès aléatoire sur les données

| 1                                    | 2                                    |
| ------------------------------------ | ------------------------------------ |
| ![[S0/PiecesJointes/Pasted image 20230527102446.png]] | ![[S0/PiecesJointes/Pasted image 20230527102507.png]] |

## std::forward_list (liste simplement chainée)
Forward_list est une structure linéaire dont :
- seul la tête est connue sans itération
- pas d'accès aléatoire sur les données
- pas d'itération décroissante
![[S0/PiecesJointes/Pasted image 20230527103121.png]]

## std::deque
Deque est une structure linéaire dont : 
- étend les fonctionnalités de `vector` en ajoutant `push_front` et `emplace_front` ainsi que `pop_front`
- N'a pas de méthode `capacity()`

## Efficacité des conteneurs
![[S0/PiecesJointes/Pasted image 20230527111144.png]]
