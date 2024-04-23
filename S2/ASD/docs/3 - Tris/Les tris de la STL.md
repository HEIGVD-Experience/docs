---
Type: PriseDeNote
MiseAuPropre: oui
---

## Complexité des tris

|Tri|Complexité dans le pire cas|Complexité dans le cas moyen|Complexité dans le meilleur cas|
|---|---|---|---|
|Bulle|$O(n^2)$|$O(n^2)$|$O(n)$|
|Sélection|$O(n^2)$|$O(n^2)$|$O(n^2)$|
|Insertion|$O(n^2)$|$O(n^2)$|$O(n)$|
|Fusion|$O(n \log n)$|$O(n \log n)$|$O(n \log n)$|
|Comptage|$O(n + k)$|$O(n + k)$|$O(n + k)$ -> $k$ représentant la plage de valeurs|
|Tri par base|$O(k*n)$|$O(k*n)$|$O(k*n)$|
|Tri rapide|$O(n^2)$|$O(n \log n)$|$O(n \log n)$|
|Quickselect|$O(n^2)$|$O(n)$|$O(n)$|

## Complexité des fonctions STL

| Fonction                 | Complexité dans le pire cas | Complexité dans le cas moyen | Complexité dans le meilleur cas                |
| ------------------------ | --------------------------- | ---------------------------- | ---------------------------------------------- |
| `std::sort`              | $O(n \log n)$               | $O(n \log n)$                | $O(n \log n)$                                  |
| `std::stable_sort`       | $O(n \log^2 n)$             | $O(n \log^2 n)$              | $O(n \log n)$ si mémoire aditionnelle possible |
| `std::nth_element`       | $O(n)$                      | $O(n)$                       | $O(n)$                                         |
| `std::partial_sort`      | $O(n \log k)$               | $O(n \log k)$                | $O(n \log k)$                                  |
| `std::partial_sort_copy` | $O(n \log k)$               | $O(n \log k)$                | $O(n \log k)$                                  |
| `std::partition`         | $O(n)$                      | $O(n)$                       | $O(n)$                                         |
| `std::partition_copy`    | $O(n)$                      | $O(n)$                       | $O(n)$                                         |
| `std::partition_point`   | $O(\log n)$                 | $O(\log n)$                  | $O(\log n)$                                    |
| `std::is_sorted`         | $O(n)$                      | $O(n)$                       | $O(n)$                                         |
| `std::is_sorted_until`   | $O(n)$                      | $O(n)$                       | $O(n)$                                         |
| `std::is_partitioned`    | $O(n)$                      | $O(n)$                       | $O(n)$                                         |
| `std::merge`             | $O(n \log n)$               | $O(n \log n)$                | $O(n \log n)$                                  |
| `std::inplace_merge`     | $O(n \log n)$               | $O(n \log n)$                | $O(n \log n)$                                  |
| `std::stable_partition`  | $O(n)$                      | $O(n)$                       | $O(n)$                                         |

## Stabilité et en place

|Tri|Stabilité|En place|
|---|---|---|
|Bulle|Oui|Oui|
|Sélection|Non|Oui|
|Insertion|Oui|Oui|
|Fusion|Oui|Non|
|Comptage|Non|Non|
|Rapide|Non|Oui|
|Par base|Non|Non|

