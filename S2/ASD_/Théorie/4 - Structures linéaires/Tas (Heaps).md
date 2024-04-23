---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Un tas est un tableau semi-ordonné permettant de stocker des valeurs grâce à des indices. Dans le cas où nous avons un tableau `d'entiers` nous aurons : 
```cpp
// Tableau de 6 valeurs ordonné
vector<int> v = {3, 5, 7, 21, 34, 55}

// Tas de 6 valeurs
vector<int> v = {55, 34, 21, 7, 5, 3}
```

Pour représenter un tas, il faut le visualiser comme un arbre binaire :

|Valeurs|Affichage|
|--|--|
|Avant : `23, 45, 12, 8, 4, 67, 19`<br>Après : `67, 23, 45, 12, 8, 4, 19`|![](/_src/img/docs/Pasted image 20230509160044.png)|

## Methodes
### Insérer une valeur
Pour insérer une valeur dans un tas nous allons exploiter le fait que l'insertion en fin de tableau est d'une complexité de $O(1)$. Une fois l'insertion faite il faut déplacer la valeur dans le tableau pour qu'elle soit au bon endroit. Pour cela il existe une méthode qui s'appelle `std::make_heap`.

Prenons un tableau :
```cpp
vector<int> v = {13, 5, 8, 2, 3, 1};
```

Si nous souhaitons insérer l'élément `14` dans notre tableau nous aurons donc : 
```cpp
v.insert(v.end(), 14);
// {13, 5, 8, 2, 3, 1, 14}
make_heap(v.being(), v.end());
```

|Valeurs|Affichage|
|--|--|
|Avant : `13, 5, 8, 2, 3, 1, 14` <br> Après : `14, 5, 13, 2, 3, 1, 8`|![](/_src/img/docs/Pasted image 20230509161507.png)|

### Résumé d'autres méthodes
![](/_src/img/docs/Pasted image 20230527113343.png)

| Fonction             | Principe                                                                                                                                                                                        | Doit être un tas? |Complexité (moyenne)|
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------------- | --- |
| make_heap(begin,end) | Commencer par le dernier élément à avoir un enfant (environ le milieu du tableau) et regarder si un de ses enfants est plus grand que lui. Puis remonter dans le tas.                           | non               |$O(n)$| 
| sort_heap(begin,end) | Va trier un **tas** en mettant la racine du tas à la fin et en réduisant la taille logique de 1 pour trier les $n-1$ éléments restants. Puis échangera la nouvelle racine avec l'élément $n-1$. | oui               |$O(n\log n)$|
| push_heap(begin,end) | À appeler après avoir fait un `push_back` sur le vecteur pour placer correctement le nouvel élément dans le tas.                                                                                | oui               |$O(\log n)$|
| pop_heap(begin,end)  | Déplacer la tête du tas à la fin puis rétablis le tas sans compter la valeur en fin du tas. Pour supprimer complètement l'élément il faut appeler `pop_back`.                                   | oui               |$O(\log n)$|
| is_heap(begin,end)   | Permet de retourner un booleen qui donne true si c'est un tas et false si c'en est pas un.                                                                                                      | -                 |$O(n)$|


