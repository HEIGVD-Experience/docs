---
Type: PriseDeNote
MiseAuPropre: non
---

>[!important] Définition
>Une combinaison de $k$ objets parmi $n$ est un **sous-ensemble** (donc n'a pas d'ordre) de $k$ objets choisis parmi $n$ objets **avec répétitions**.

## Théorie
Si on note $\bar{C^{n}_{k}}$ le nombre de combinaisons de $k$ objets choisi parmi $n$, alors :
$$
\bar{C^{n}_{k}} = \frac{(n-1+k)!}{(n-1)! * k!}
$$
Passer d'une combinaison à répétition à une répétition sans :
$$
\bar{C^{n}_{k}} = C^{n+k-1}_{k}
$$
