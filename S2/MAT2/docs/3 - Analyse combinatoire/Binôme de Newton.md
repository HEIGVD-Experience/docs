---
Type: PriseDeNote
MiseAuPropre: non
---

>[!important] Définition
>Le binôme de Newton permet d'expliciter l'expansion d'une expression de la forme $(a + b)^n$, où $a$ et $b$ sont des nombres réels ou des variables, et $n$ est un nombre entier positif.

## Formule
$$
(a+b)^n = \sum_{k=0}^{n} C^{n}_{k}*a^{n-k}*b^k 
$$
## Application
Nous souhaitons trouver le polynôme développé de l'identité $(x+y)^4$ trouvons les [[Combinaison) de la formule
$$
C^{4}_{0} = \frac{4!}{4!} = 1, \>\> C^{4}_{1} = \frac{4!}{3!} = 4, \>\> C^{4}_{2} = \frac{4!}{2!*2!} = 6, \>\> C^{4}_{3} = \frac{4!}{3!} = 4, \>\> C^{4}_{4} = \frac{4!}{4!} = 1
$$
nous aurons donc
$$
\begin{align} \\
(x+y)^4 &= \sum^{4}_{k=0}C^{4}_{k}*a^{4-k}*b^k \\ \\
&= C^{4}_{0}*a^{4}*b^0 + C^{4}_{1}*a^{3}*b^1 + C^{4}_{2}*a^{2}*b^2 +  C^{4}_{3}*a^{1}*b^3 + C^{4}_{4}*a^{0}*b^4 \\ \\
&= a^4 + 4a^3b + 6a^2b^2 + ab^3 + b^4
\end{align}
$$