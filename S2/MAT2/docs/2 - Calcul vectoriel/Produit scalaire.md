---
MiseAuPropre: oui
---

>[!important]
>Pour utiliser l'algèbre pour faire de la géométrie il faut absolument définir un repaire orthonomée $(0,\vec{e_{1}}, \vec{e_{2}})$.

## Définition analytique
Pour deux vecteurs $\vec{u} = \begin{pmatrix} u_{1} \\ u_{2}\end{pmatrix}$ et $\vec{v} = \begin{pmatrix} v_{}{1} \\ v_{}{2}\end{pmatrix}$ nous aurons : 
#### Dans le plan
$$
\vec{u} * \vec{v} = u_{1} * v_{1} + u_{2} * v_{2}
$$
#### Dans l'espace
$$
\vec{u} * \vec{v} = u_{1} * v_{1} + u_{2} * v_{2} + u_{3} * v_{3}
$$
#### Propriétés
1. $\vec{u} * \vec{u} = \lvert \lvert \vec{u} \rvert \rvert^2$
2. $\vec{u} * (\vec{v}+\vec{w}) = \vec{u}*\vec{v} + \vec{u} * \vec{w}$
3. $(\lambda \vec{u})*\vec{v} = \lambda(\vec{u}*\vec{v})$

## Définition géométrique
$$
\vec{u}*\vec{v} = \lvert \lvert \vec{u} \rvert  \rvert * \lvert \lvert \vec{v} \rvert  \rvert  \cos(\theta)
$$
où $\theta$ est l'angle entre $\vec{u}$ et $\vec{v}$ et $\theta \in [0,\pi]$

## Conséquences
1. Si le produit scalaire de deux vecteurs est égal à 0 alors ils sont perpendiculaire.
   $\vec{u} \perp \vec{v} \iff \vec{u}*\vec{v} = 0$
2. Dans le plan l'équation cartésienne d'une droite s'écrit sous forme : $\vec{v} = ax + by + c = 0$. Le vecteur directeur perpendiculaire à $\vec{v}$ est $\vec{p} = \begin{pmatrix} a \\ b \end{pmatrix}$.
3. Dans l'espace nous pouvons appliquer la même théorie et le vecteur serait $\vec{p} = \begin{pmatrix} a \\ b  \\ c \end{pmatrix}$
4. Pour la projection orthogonale
5. Identité du parallélogramme : la somme des deux diagonales au carré à la somme des côtés au carré donc :
   $$
   \lvert \lvert \vec{u}+\vec{v} \rvert  \rvert^2 + \lvert \lvert \vec{u}-\vec{v} \rvert  \rvert =2(\lvert \lvert u \rvert  \rvert^2+\lvert \lvert \vec{v} \rvert  \rvert^2  )
   $$
   