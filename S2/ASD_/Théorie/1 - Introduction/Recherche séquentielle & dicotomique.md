---
Type: PriseDeNote
MiseAuPropre: oui
---

## Recherche séquentielle

La recherche séquentielle est une recherche linéaire qui va retourner la première valeur qui correspond à la recherche. Si la valeur à chercher est la dernière dans la liste cette recherche parcourra tous les éléments du conteneur.

```cpp
std::find
std::find_if
std::find_if_not
std::find_first_of
std::adjacent_find
std::search
std::search_n
std::find_end
```

| Fonction           | Complexité |
| ------------------ | ---------- |
| std::find          | $O(n)$ |
| std::find_if       |$O(n)$|
| std::find_if_not   |$O(n)$|
| std::find_first_of |$O(n*s)$            |
| std::adjacent_find |$O(n)$            |
| std::search        |$O(n*s)$            |
| std::search_n      |$O(n)$            |
| std::find_end      | $O(s*(n−s+1))$           |

## Recherche dichotomique

La recherche dichotomique **part du principe que le conteneur est trié** suite à cela la recherche découpe à chaque itération le conteneur en 2 puis regarde dans quelle partie se trouve la valeur que l’on cherche et continue ainsi de suite.

```cpp
std::lower_bound
std::upper_bound
std::equal_range
std::binary_search
```

| Fonction           | Complexité |
| ------------------ | ---------- |
| std::lower_bound          | $O(\log n)$ |
| std::upper_bound       |$O(\log n)$|
| std::equal_range   |$O(\log n + m)$|
| std::binary_search |$O(\log n)$            |

>[!attention]
>Dans le cas de conteneurs dits "non ordonnés" comme `std::unordered_set` ou `std::unordered_map` la complexité des fonctions ci-dessus sera de $O(n)$


![[/_src/img/docs/Pasted image 20230323172538.png]]