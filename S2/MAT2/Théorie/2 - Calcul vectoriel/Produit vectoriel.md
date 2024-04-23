---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Le produit vectoriel est défini dans **uniquement** dans l'espace.
1. $\vec{a}$ et $\vec{b}$ deux vecteurs dans l'espace
2. si $\vec{a}$ et $\vec{b}$ sont colinéaires, alors $\vec{a} \wedge \vec{b} = \vec{0}$
3. si $\vec{a}$ et $\vec{b}$ ne sont pas colinéaires, alors $\vec{a} \wedge \vec{b}$ est défini par sa **direction** qui est $\perp$ au plan formé par $\vec{a}$ et $\vec{b}$, pour trouver le sens utiliser la technique du tire-bouchon

La surface du parallélogramme formée par $\vec{a}$ et $\vec{b}$
$$
\lvert \lvert \vec{a} \wedge \vec{b} \rvert  \rvert = \lvert \lvert \vec{a} \rvert  \rvert * \lvert \lvert \vec{b} \rvert  \rvert * \lvert \sin(\theta) \rvert 
$$

## Exemple
Pour calculer le produit vectoriel il faut utiliser le calcul de déterminant de matrices.
$$
\vec{a} \begin{pmatrix} a_{1} \\ a_{2} \\ a_{3} \end{pmatrix}, \>\>\>\> \vec{b} \begin{pmatrix} b_{1} \\ b_{2} \\ b_{3} \end{pmatrix}
$$
$$
\begin{pmatrix} a_{1} \\ a_{2} \\ a_{3} \end{pmatrix} \wedge \begin{pmatrix} b_{1} \\ b_{2} \\ b_{3} \end{pmatrix} = 
\begin{pmatrix}
+\begin{vmatrix} a_{2} \ b_{2} \\ a_{3} \ b_{3} \end{vmatrix} \\
-\begin{vmatrix} a_{1} \ b_{1} \\ a_{3} \ b_{3} \end{vmatrix} \\
+\begin{vmatrix} a_{1} \ b_{1} \\ a_{2} \ b_{2} \end{vmatrix}
\end{pmatrix}
$$
## Application géométrique
### Surface d'un triangle ABC
$$
Surface = \frac{\lvert \lvert \vec{AB} \wedge \vec{AC} \rvert  \rvert }{2}
$$
### Equation cartésienne d'un plan
>[!important]
>Pour trouver l'équation cartésienne d'un plan, il nous faut **3 points** $\in$ plan. Avec ces trois points nous aurons la formule suivante : 
>$$
>\vec{AM} * (\vec{AB} \wedge \vec{AC}) = 0
>$$
>![](/_src/img/docs/Pasted image 20230428203810.png)

## Propriétés
$$
\begin{align}  
\overrightarrow{a} \wedge \overrightarrow{a} & = \overrightarrow{0} \tag{1} \\  
\overrightarrow{a} \wedge \overrightarrow{b} & =-(\overrightarrow{b} \wedge \overrightarrow{a} ) & (\text{pas commutatif})\tag{2} \\  
\alpha \overrightarrow{a} \wedge \beta \overrightarrow{b} & =\alpha\beta \overrightarrow{a} \wedge \overrightarrow{b} & \forall \alpha,\beta \in \mathbb{R} \tag{3} \\  
\overrightarrow{a} \wedge (\overrightarrow{b} +\overrightarrow{c} ) & =\overrightarrow{a} \wedge \overrightarrow{b} +\overrightarrow{a} \wedge \overrightarrow{c}\tag{4} \\  
(\overrightarrow{a} +\overrightarrow{b} )\wedge (\overrightarrow{c} +\overrightarrow{d} ) & =\overrightarrow{a} \wedge \overrightarrow{c} +\overrightarrow{a} \wedge \overrightarrow{d} +\overrightarrow{b} \wedge \overrightarrow{c} +\overrightarrow{b} \wedge \overrightarrow{d} \tag{5}  
\end{align}
$$
