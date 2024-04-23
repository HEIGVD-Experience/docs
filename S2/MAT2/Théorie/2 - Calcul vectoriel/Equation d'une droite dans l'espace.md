---
MiseAuPropre: oui
---

>[!important]
>Pour utiliser l'algèbre pour faire de la géométrie il faut absolument définir un repaire orthonomée $(0,\vec{e_{1}}, \vec{e_{2}}, \vec{e_{3}})$.

Considérons un point $A(x_{A}, y_{A},z_{A})$ d'une droite $d$ et $\vec{d} = \begin{pmatrix} d_{1} \\ d_{2} \\ d_{3}\end{pmatrix}$ un vecteur directeur de cette droite.

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
Les coordonnées $x,y$ et $z$ d'un point $P$ quelconque de $d$ doivent alors vérifier la condition suivante appelée **représentation paramétrique** de la droite.
$$
\begin{pmatrix} 
 x \\
 y \\
 z 
\end{pmatrix} =
\begin{pmatrix} 
 x_{A} \\
 y _{A}\\
 z_{A} 
\end{pmatrix} + \lambda *
\begin{pmatrix} 
 d_{1} \\
 d_{2} \\
 d_{3} 
\end{pmatrix} \>\>\>\> avec \>\> \lambda \in \mathbb{R}
$$

## Equation paramétrique
On obtient alors les **équations paramétriques** de la droite.
$$
\begin{cases}
x = x_{A} + \lambda d_{1} \\
y = y_{A} + \lambda d_{2} \\
z = z_{A} + \lambda d_{3}
\end{cases} \>\>\>\> avec \>\> \lambda \in \mathbb{R}
$$
Pour cela il faut poser $x$ égal et additionner la coordonnée $x$ du point $A$ avec un multiple de $\lambda$ et de la valeur $d_{1}$ du vecteur directeur $\vec{d}$. Faire de même pour $y$ et $z$.

## Equation cartésienne
Pour trouver les équations cartésienne il faut éliminer le paramètre $\lambda$ pour trouver une relation entre $x, y$ et $z$. Nous aurons donc une forme du style : 
$$
\begin{cases}
a_{1}x + b_{1}y + c_{1}z + e_{1} = 0 \\
a_{2}x + b_{2}y + c_{2}z + e_{2} = 0
\end{cases}
$$