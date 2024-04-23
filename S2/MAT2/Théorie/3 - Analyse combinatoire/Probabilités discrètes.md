---
Type: PriseDeNote
MiseAuPropre: non
---

## Quelques définitions
1. **Expérience aléatoire** : experience dont l'issue est imprévisible.
2. **Ensemble fondamental** : ensemble de toutes les issues possibles de l'expérience aléatoire. Noté en général : $\Omega$ et dans notre cours $\lvert \Omega \rvert < +\infty$
3. **Evénement** : un sous-ensemble de $\Omega$ pour $A \subseteq \Omega$
4. **Evénement aléatoire** : correspond à un événement formé d'une seule issue possible
5. **Loi de probabilité** (chance) : est une fraction ou la valeur est entre $[0,1]$
	1. Pour tout $A \in P(A)$ alors $0 \leq P^{A} \leq 1$
	2. $P(\Omega)$ = 1
	3. $P(A \cup B) = P(A) + P(B)$ si $A \cap B =$ ensemble vide
	4. $P(vide) = 0$
	5. $P(A \cup B) = P(A) + P(B) - P(A \cap B)$

## Hypothèse d'équiprobabilité
$$
\begin{align}
\Omega &= {w_{1}, \dots, w_{n}} \\ \\
p({w_{1}})& = p({w_{2}}) = \dots = p({w_{n}})
\end{align}
$$
Avec cette hypothèse 
$$
A \subseteq \Omega \>\>\>\> p(A) = \frac{ \lvert A \rvert }{\lvert \Omega \rvert }
$$
## Exemple
Lancer un dé équilibré à 6 faces combien de chances avons nous de tomber sur un nombre paire ?
$$
\begin{align}
\Omega = {1,2,3,4,5,6} \\ \\
A = {2,4,6} \>\>\>\> donc \>\>\>\> p(A) = \frac{\lvert A \rvert }{\lvert \Omega \rvert } = \frac{3}{6}
\end{align}
$$
