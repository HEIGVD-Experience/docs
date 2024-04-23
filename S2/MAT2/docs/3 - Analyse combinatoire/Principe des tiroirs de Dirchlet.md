---
Type: PriseDeNote
MiseAuPropre: oui
---

>[!important] Définition
>Si l'on a $n+1$ objets à placer dans $n$ boîtes, alors au moins l'une des boîtes contiendra au moins deux objets. Ce principe est basé sur la simple observation qu'il est impossible de répartir $n+1$ objets de manière distincte dans seulement $n$ boîtes. Il y aura nécessairement une boîte qui contiendra plus d'un objet.

## Généralisation
Si nous avons $N$ objets et $k$ boites nous pouvons dire qu'il y aura au moins une boite qui contiendra :
$$
\left \lceil \frac{N}{k} \right \rceil
$$
car $\left \lceil x \right \rceil < x+1$
