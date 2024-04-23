---
MiseAuPropre: oui
---

>[!important]
>Pour utiliser l'algèbre pour faire de la géométrie il faut absolument définir un repaire orthonomée $(0,\vec{e_{1}}, \vec{e_{2}})$.

Considérons un point $A(x_{A}, y_{A})$ d'une droite $d$ et $\vec{d} = \begin{pmatrix} d_{1} \\ d_{2} \end{pmatrix}$ un vecteur directeur de cette droite.

Pour tout point $P$ d'une droite $d$, les vecteurs $\vec{AP}$ et $\vec{d}$ sont colinéaires. Il existe donc un nombre réel $\lambda$ vérifiant $\vec{AP} = \lambda \vec{d}$. Réciproquement, tout nombre réel $\lambda$ définit un point de la droite.

## Equation vectorielle
En utilisant l'identité suivante nous pouvons donc dire :
$$
P \in d \iff \vec{AP} = \lambda\vec{d}, \>\>\>\> k \in \mathbb{R}
$$
Comme $\vec{OP} = \vec{OA} + \vec{AP} = \vec{OA} + \lambda \vec{d}$, on obtient **l'équation vectorielle** de la droite $d$.
$$
P \in d \iff \vec{OP} = \vec{OA} + \lambda \vec{d}
$$

## Equation paramétrique
On obtient alors les **équations paramétriques** de la droite.
$$
\begin{cases}
x = x_{A} + \lambda d_{1} \\
y = y_{A} + \lambda d_{2}
\end{cases}
$$
Pour cela il faut poser $x$ égal et additionner la coordonnée $x$ du point $A$ avec un multiple de $\lambda$ et de la valeur $d_{1}$ du vecteur directeur $\vec{d}$. Faire de même pour $y$.

## Equation cartésienne
Pour trouver les équations cartésienne il faut éliminer le paramètre $\lambda$ pour trouver une relation entre $x$ et $y$.
Nous aurons donc pour l'équation **cartésienne implicite** de la droite $d$ une forme du type :
$$
ax + by + c = 0
$$
il existe aussi une forme dite **cartésienne explicite** lors ce que $b$ est non nul on peut isoler par rapport à $y$ et avoir une forme du type :
$$
y = mx + h
$$
$m$ correspond à la pente de la droite qui est trouvée en faisant : 
$$
m = \frac{\Delta y}{\Delta x} = \frac{y_{B}-y_{A}}{x_{B}-x_{A}}
$$
et $h$ correspond à :
$$
h = \frac{c}{b}
$$
