# Résume TE2 - Trüeb Guillaume

````col
```col-md
flexGrow=1
===
# Régression
### Régression linéaire
**Rappel:** l'équation d'une droite dans le plan est la suivante -> $ŷ = mx + b$
Pour calculer une régression linéaire il faut appliquer les étapes suivantes : 
#### Calculer la moyenne
Calculer la moyenne des x cela nous donnera $\bar{x}$
Calculer la moyenne des y cela nous donnera $\bar{y}$
#### Calculer coefficient de la pente
Cela consiste à faire : 
- la somme des coordonnées x - la moyenne des coordonnées x multiplié par la somme des coordonnées y - la moyenne des coordonnées y
- divisé par la somme des coordonnées x - la moyenne des coordonnées x le tout au carré
$$
m = \frac{∑​(x_{i}−\bar{x})(y_{i}​−\bar{y}​)}{∑​(x_{i}​−\bar{x})^2}​
$$
Grace à cette opération on obtient le paramètre $m$ de notre droite.
#### Ordonnée à l'origine
Pour trouver l'ordonnée il faut appliquer la formule :
$$
b = \bar{y}​−m⋅\bar{x}
$$
### Régression non linéaire
Exemple: $𝑦=𝑎𝑥^𝑛_{1} +𝑏𝑥^{𝑛−1}_{2} +𝑐𝑥^{𝑛−2}\dots+𝑘+𝜀$
### Learning rate
Conditionne la vitesse d’apprentissage:  
- Trop grand, possibilité d’osciller autour du minimum et même diverger  
- Trop petit, passera plus de temps que nécessaire pour arriver au minimum
### Descente de gradient stochastique
Estimer le gradient sur la base d’une donnée d’entraînement choisie au hasard Avantages:  
- Permet de traiter de très grands ensembles de données  
- Permet un apprentissage progressif, adaptation à la volée
Désavantages:  
- Jamais de vrai convergence, arrivée par erreur près du minimum
### Solution algébrique
L’algèbre linéaire fournit une solution directe, mais qui peut être très coûteuse, du point de vue computationnel.
### Solution itérative
La valeur minimum d'une fonction se trouve lorsque la dérivée s'annule et change de signe passant de négatif à positif.
### Formule de Pearson
Le coefficient de détermination linéaire de Pearson, noté $R^2$ ou $r^2$, est une mesure de la qualité de la prédiction d'une régression linéaire.
![](/_src/img/docs/Pasted%20image%2020240118120159.png)
où n est le nombre de mesures, ŷi est la prédiction de la valeur yi (le “ground truth”) et ȳ est la moyenne des mesures
### Erreur du modèle
L’erreur de chaque estimation est $y_i - ŷ_i$ et globalement, l’erreur du modèle peut-être donné par l’expression
$$
erreur = 1/N ∑ (y_i - ŷ_i)^2
$$
```
```col-md
flexGrow=1
===
### Gradiant Descent
1. On initialise m et b à deux valeurs aléatoires 
2. On calcule l’erreur: $E =1/2N ∑ (y_i - ŷ_i)^2 = 1/2N ∑ (y_i - (mx + b))^2$ 
3. On met à jour la valeur de m et de b: 
	- m <- m - lr * ∂E/∂m,
	- b <- b - lr * ∂E/∂b, où 0< lr <1 est une constante appelée “learning rate”
4. On répète 2 et 3 jusqu’à trouver le minimum (ou un certain nombre de fois)
![](/_src/img/docs/Pasted%20image%2020240118123011.png)
# Algorithme LVQ
### Etapes
1. Choisir un point aléatoire de la classe
2. Trouver le prototype le plus proche (best matching unit ou bmu)
3. S’ils ont la même classe, rapprocher le prototype de la donnée
4. Sinon, éloigner le prototype
5. Diminuer le facteur de rapprochement/éloignement
### Hyper-paramètres
- Nombre de prototypes  
- Nombre d’epochs à itérer  
- Valeur de rapprochement initiale (learning rate)  
- k (si on utilisait les k-NN au lieu de seulement le plus proche)
### Détails
Train_set représente l'ensemble du cluster auquel appartient le prototype.
L’ensemble de vecteurs prototypes, on l’appelle un codebook.
# Classification des données
- Discrètes: ne peut revêtir qu’un nombre défini de valeurs réelles (comptées)  
- Continues: peut supposer un nombre infini de valeurs réelles (mesurées)  
- Numériques (quantitative): peut supposer un nombre infini de nombres  
- Catégorielles (qualitative): peut être classée dans une catégorie particulière -> (bleu, rouge, vert, gris, etc..)
- Nominales: identifications ou appartenances à des catégories  
- Ordinales: rang dans une classe d’objets, qualité dans un énoncé hiérarchique
- Cardinales (intervalle-rapport): ajoute une notion de distance  
- Séquentielles (séries temporelles): suite montrant l’évolution selon le temps  
- Scalaire: valeur spécifiée uniquement par sa grandeur  
- Array: structure de données qui contient un nombre fixe d’éléments  
- Matrice: structure de données bidimensionnelle  
- Tenseur: structure de données de 3 dimensions ou plus  
- Structurées: organisées et formatées (vont dans des tableaux, DB, ...)  
- Non structurées: sans format prédéfini (e.g. info sur des pages web)  
- Semi structurées: avec des éléments poru séparer les champs (e.g. name:"Bob") 
- Manquantes: pas de valeur
- Inexactes: donnée non contrôlée  
- Tronquées: donnée incomplète  
- Censurées: plage de valeurs plutôt qu’exacte
```
````

![](/_src/img/docs/Pasted%20image%2020240207175623.png)
