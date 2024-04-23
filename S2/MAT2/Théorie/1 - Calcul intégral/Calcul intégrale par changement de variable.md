---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
La technique de calcul d'intégrale par changement de variable permet de transformer une intégrale de forme complexe en une plus simplifiée. Le changement de variable à des impactes sur la forme de l'intégrale. 

## Intégrale indéfinie
Dans la cas du calcul d'une intégrale indéfinie nous aurons besoin, après avoir calculé notre intégrale, de remplacer la valeur de $u$. Posons l'intégrale suivante :
$$
I = \int 2x(x^2+1)^3 \, dx 
$$
Maintenant nous devons remplacer la forme complexe $x^2+1$ par $u$ :
$$
u = x^2+1 \>\> donc \>\> x = \sqrt{ u-1 }
$$
En remplacent dans l'intégrale nous aurons :
$$
I = \int 2\sqrt{ u-1 } * u^3 \, dx 
$$
Cependant nous devons remplacer le $dx$ par $du$ pour retrouver la bonne différentielle de l'intégrale. Pour cela il suffit de dériver la partie $x = \sqrt{ u-1 }$
$$
dx = \sqrt{ u-1 }' = \frac{1}{2\sqrt{ u-1 }}
$$
Désormais nous pouvons calculer la valeur de notre intégrale.
$$
\begin{align}
I &= \int 2\sqrt{ u-1 } * u^3 * \frac{1}{2\sqrt{ u-1 }}\, du  \\
&= \int u^3 \, du  \\
&= \frac{u^4}{4} + c
\end{align}
$$
### Remplacer $u$
Dans le cas de l'intégrale indéfinie il est obligatoire de remplacer le $u$ que nous trouvons par sa forme initiale qui est, dans ce cas, $x^2+1$. Une fois cela fait nous aurons la bonne réponse de l'intégrale.
$$
I = \frac{(x^2+1)^4}{4} + c
$$
## Intégrale définie
Reprenons le même example mais cette fois dans le cas d'une intégrale bien définie :
$$
I = \int_{1}^{2} 2x(x^2+1)^3 \, dx 
$$
>[!important]
>Dans cette situation il n'est pas nécessaire de remplacer $u$ cependant il faut remplacer les bornes de notre intégrale.

Pour remplacer les bornes il suffit de poser :
$$
u_{1} = 1^2 + 1 = 2 \>\> et \>\> u_{2} = 2^2 + 1 = 5
$$
Maintenant que les nouvelles bornes sont trouvées nous pouvons reprendre l'intégrale et les remplacer.
$$
I = \int_{2}^{5} u^3 \, dx 
$$
Différence avec le calcul d'une intégrale indéfinie ici nous souhaitons une surface, donc celle-ci ne doit plus contenir de variable. Pour cela nous devons poser :
$$
\begin{align}
I = [\frac{u^4}{4}]_{2}^{5} = \frac{5^4}{4} - \frac{2^4}{4} = \frac{625-16}{4} = \frac{609}{4}
\end{align}
$$
