---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
La technique de calcul par parties utilise deux formule pour arriver à la forme initiale. Ces deux formules sont souvent appelées : $u(x)$ et $v(x)$. Grace à ces deux fonctions nous aurons l'identité : 
$$
\int u'(x)*v(x)\>dx = u(x)*v(x)-\int u(x)*v'(x)\>dx
$$

## Intégrale indéfinie
Dans le cas d'un calcul d'une intégrale indéfinie nous pouvons appliquer la formule ci-dessus et définir qui est $u(x)$ et qui est $v(x)$.

Avant cela, posons la fonction dont nous cherchons l'intégrale :
$$
\int xe^x \, dx 
$$
### Définir $u(x)$ et $v(x)$

|Partie gauche|Partie droite|
|--|--|
|$$u'(x) = e^x$$|$$v(x) = x$$|
|$$u(x) = e^x$$|$$v'(x) = 1$$|

>[!important]
>Il est important de chercher à simplifier au maximum les formules et surtout à avoir les fonctions les plus simples dans la **partie droite** du tableau ci-dessus. La partie droite se retrouvera à être le reste de notre intégrale après l'application de la formule.

### Appliquer la formule
$$
\int xe^x \, dx = xe^x - \int e^x*1 \, dx
$$
$$
\int xe^x \, dx = xe^x - e^x
$$
