---
Type: PriseDeNote
MiseAuPropre: non
---

# Intégrales
## Généralités

| $f(x)$                   | $\int f(x) \, dx$         |
| ------------------------ | ------------------------- |
| $$x^a$$                  | $$\frac{x^{a+1}}{a+1}+c$$ |
| $$x^{-1} = \frac{1}{x}$$ | $$\ln(x)+c$$              |
| $$e^x$$                  | $$e^x+c$$                 |
| $$\sin(x)$$              | $$-\cos(x+c)$$            |
| $$\cos(x)$$              | $$\sin(x)+c$$             |
| $$\frac{1}{x^2+1}$$      | $$\arctan(x)+c$$          |

## Formules spéciales
$$
\int f(t)^a * f'(t)\>dt = \frac{(f(t))^{a+1}}{a+1}+c \>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\>\> a \neq -1
$$

$$ \int \frac{f'(t)}{f(t)}dt = ln(|f(t)|) + c $$

$$ \int e^{f(t)}*f'(t) \>dt = e^{f(t)} + c $$

$$ \int \frac{f'(t)}{f^2(t)+1}\>dt = arctan(f(t))+c $$

$$ \int sin(f(t)) * f'(t)\>dt = -cos(f(t))+c $$

$$ \int cos(f(t)) * f'(t)\>dt = sin(f(t))+c $$
## Volumes corps de révolution
$$
 V = \pi \int_{a}^{b} f^2(x)dx 
$$
## Longueur fonction
$$
l_{AB} = \int_{a}^{b} \sqrt{1+f'^2(x)}\>\>dx
$$
# Calcul vectoriel
## Produit scalaire
$$
\begin{align}
\vec{u}*\vec{u} &= \lvert \lvert \vec{u} \rvert  \rvert^2 \\
\vec{u} * \vec{v} &= u_{x} * v_{x} + u_{y} * v_{y} \\
\lvert \lvert \vec{u}+\vec{v} \rvert \rvert^2 &= \lvert \lvert \vec{u} \rvert  \rvert^2 + 2\vec{u}*\vec{v} + \lvert \lvert \vec{v} \rvert \rvert^2
\end{align}
$$
## Distance point à une droite
$$
\begin{cases}
d : ax + by + c = 0 \\
P(x,y)
\end{cases}
$$
$$
dist(d,P) = \frac{\mid ax + by + c\mid}{\sqrt{ a^2+b^2 }}
$$
## Distance point à un plan

$$
\begin{cases}
\pi_{1} : ax + by + cz + d = 0 \\
P(x,y)
\end{cases}
$$
$$
dist(\pi_{1},P) = \frac{\mid ax + by + cz + d\mid}{\sqrt{ a^2+b^2 +c^2}}
$$
## Distance droites parallèles
$$
\begin{cases}
d_{1} : a_{1}x + b_{1}y + c_{1} = 0 \\
d_{2} : a_{2}x + b_{2}y + c_{2} = 0 \\ 
\end{cases}
$$
$$
dist(d_{1},d_{2}) = \frac{\mid c_{2} - c_{1}\mid}{\sqrt{ a^2+b^2 }}
$$
## Distance plans parallèles
$$
\begin{cases}
\pi_{1}: ax+by+cz+d_{1} = 0 \\
\pi_{2}: ax + by + cz + d_{2} = 0
\end{cases}
$$
$$
dist(\pi_{1},\pi_{2}) = \frac{\mid d_{2} - d_{1} \mid}{\sqrt{ a^2+b^2+c^2 }}
$$
## Projection d'un vecteur sur un autre
$$
(\vec{a} * \frac{\vec{b}}{\lvert \lvert \vec{b} \rvert  \rvert })\frac{\vec{b}}{\lvert \lvert \vec{b} \rvert  \rvert } = \vec{a'}
$$
## Projection point sur une droite ou plan
$$
\vec{OM'} = \vec{OM} - (\vec{AM}*\vec{n})* \frac{\vec{n}}{\lvert \lvert \vec{n} \rvert  \rvert^2}
$$
## Symétrie point par rapport à une droite
$$
\vec{OM'} = \vec{OM} - 2(\vec{AM}*\vec{n})*\frac{\vec{n}}{\lvert \lvert \vec{n} \rvert  \rvert^2 }
$$
## Angles entre droites
$$
\delta = \arccos(\frac{\vec{a}*\vec{b}}{\lvert \lvert \vec{a} \rvert  \rvert \lvert \lvert \vec{b} \rvert  \rvert  })
$$
## Angles entre plans
$\vec{n_{1}}$ et $\vec{n_{2}}$ les vecteurs normaux aux plans $\pi_{1}$ et $\pi_{2}$
$$
\delta = \arccos(\frac{\vec{n_{1}}*\vec{n_{2}}}{\lvert \lvert \vec{n_{1}} \rvert  \rvert \lvert \lvert \vec{n_{2}} \rvert  \rvert  })
$$
## Bissectrices droites sécantes
$$
\begin{cases}
d_{1} : a_{1}x + b_{1}y + c_{1} = 0 \\
d_{2} : a_{2}x + b_{2}y + c_{2} = 0 \\ 
\end{cases}
$$
$$
\frac{a_{1}x+b_{1}y+c_{1}}{\sqrt{ a_{1}^{2}+b_{1}^{2} }}=\pm \frac{a_{2}x+b_{2}y+c_{2}}{\sqrt{ a_{2}^{2}+b_{2}^{2}}}
$$
## Plans bissecteurs
$$
\begin{cases} \pi_{1}: a_{1}x+b_{1}y+c_{1}z+d_{1}=0 \\
\pi_{2}: a_{2}x+b_{2}y+c_{2}z+d_{2}=0 \end{cases}
$$
$$
\frac{a_{1}x+b_{1}y+c_{1}z+d_{1}}{\sqrt{ a_{1}^{2}+b_{1}^{2}+c_{1}^{2} }}=\pm \frac{a_{2}x+b_{2}y+c_{2}z+d_{2}}{\sqrt{ a_{2}^{2}+b_{2}^{2}+c_{2}^{2} }}
$$
## Surface triangle PV
$$
Surface = \frac{\lvert \lvert \vec{AB} \wedge \vec{AC} \rvert  \rvert }{2}
$$
## Equation cartésienne plan PV
$$
\vec{AM} * (\vec{AB} \wedge \vec{AC}) = 0
$$
## Volume parallélépipède PV
$$
 V = \lvert (\vec{AB} \wedge \vec{AC}) * \vec{AD} \rvert  
$$
## Volume tétraèdre PV
$$ V = \frac{1}{6} \lvert (\vec{AB} \wedge \vec{AC}) * \vec{AD} \rvert  $$
## Distance point droite dans l'espace PV
$$ \delta = \frac{\lvert \lvert (\vec{AP} \wedge \vec{d}) \rvert  \rvert }{\lvert \lvert \vec{d} \rvert  \rvert } $$
## Distance droites gauche PV
$$
\begin{cases} \pi_{1}: a_{1}x+b_{1}y+c_{1}z+d_{1}=0 \\
\pi_{2}: a_{2}x+b_{2}y+c_{2}z+d_{2}=0 \end{cases}
$$
$$ \delta = \lvert \vec{AB} * \frac{\vec{d_{1} \wedge d_{2}}}{\lvert  \rvert \vec{d_{1} \wedge d_{2}}\lvert  \rvert } \rvert  $$
pour $A \in \pi_{1}$, $B \in \pi_{2}$, $d_{1}$ est un vecteur du plan $\pi_{1}$ et $d_{2}$ est un vecteur du plan $\pi_{2}$.
## Intersection deux plans non parallèles PV
Un vecteur de la droite d'intersection entre $\pi_{1}$ et $\pi_{2}$ est donné par :
$$ \vec{d} = \vec{n_{1}} \wedge \vec{n_{2}} $$
## Equation du cercle
$$
(x-\alpha)^2 + (y-\beta)^2 = R^2
$$
pour un cercle de centre $\Omega$ ($\alpha$,$\beta$) et de rayon $R$ puis un point $M(x,y)$ appartenant au pour-tour du cercle.

# Analyse combinatoire
## Permutation
$$
P_{n} = n!
$$
## Arrangement
$$
A^{n}_{k} = \frac{n!}{(n-k)!}
$$
## Combinaison
$$
C^{n}_{k} = \frac{n!}{(n-k)! * k!} = \frac{A^{n}_{k}}{k!}
$$
## Binôme de Newton
$$
(a+b)^n = \sum_{k=0}^{n} C^{n}_{k}*a^{n-k}*b^k 
$$
## Permutation avec répétition
$$
\frac{n!}{n_{1}!*n_{2}!*n_{k}!}
$$
$n_{k}$ étant les facteurs de répétitions des éléments semblables
## Arrangement avec répétition
$$
\bar{A^n_{k}} = n^k
$$
## Combinaison avec répétition
$$
\bar{C^{n}_{k}} = \frac{(n-1+k)!}{(n-1)! * k!}
$$
