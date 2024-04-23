# Résume TE1 - Trüeb Guillaume
````col
```col-md
flexGrow=1
===
## Type d'apprentissage
**Apprentissage automatique** 
L'apprentissage automatique consiste à donner aux ordinateurs la capacité d'apprendre à partir de données, sans être explicitement programmés.
### Paradigmes d'apprentissage
**Apprentissage supervisé:**
- Les données d'entraînement sont des paires de tuples (entrées, sorties désirées).
- **Exemple classification**: Classification des e-mails comme "spam" ou "non-spam". Le modèle apprend à associer des caractéristiques spécifiques des e-mails (entrées) à leurs étiquettes correspondantes (sorties désirées).
- **Exemple régression**: Prédiction du prix des maisons en fonction de caractéristiques telles que la superficie, le nombre de chambres, etc. Le modèle est entraîné à estimer une valeur continue (prix) à partir des caractéristiques d'entrée.
- **Algorithme K-NN (k plus proches voisins) :**
	- **Paramètre clé :** K (nombre de voisins à considérer).
	- **Requis :** Ensemble de données étiquetées, métrique de similarité.
	- **Fonctionnement :** Choix de K, mesure de la similarité, sélection des K plus proches voisins, vote majoritaire pour la classification.
	- ![](../../../../S0/PiecesJointes/Pasted%20image%2020231123114344.png)
- **Prédiction**
- **Détection d’anomalies**
- **Authentification**

**Apprentissage semi-supervisé:**
- Les données d'entraînement contiennent seulement une partie des sorties désirées.

**Apprentissage non supervisé:**
- Les données d'entraînement ne comportent que des données en entrée.
- _Exemple:_ Groupement (trouver des groupes de données sans a priori des classes), Réduction de la dimensionnalité, Prototypage, Compression.

**Reinforcement learning:**
- Les données d'entraînement fournissent un score suite à une séquence d'actions.
- _Exemple:_ Problème de contrôle (trouver les actions ou séquences d'actions pour compléter une tâche).

**Apprentissage par renforcement**
 - Problème de contrôle
 - Trouver les actions (ou séquences d’actions) pour compléter une tâche

**Deep learning**
- Techniques permettant de donner en entrée des données brutes simplifiant le travail humain d’extraction de caractéristiques.

### Diagramme de Voronoï
La région de Voronoï est celle qui est composée de tous les points qui sont plus proches d’une observation que d’aucune autre. La classe prédite par I-NN pour tous les points d’une région de Voronoï sera donc la même.
![](../../../../S0/PiecesJointes/Pasted%20image%2020231123120115.png)
```
```col-md
flexGrow=1
===
## Analyse exploratoire des données
### Distribution
- **Mode :** La valeur la plus fréquente (unimodale, bimodale ou multimodale).
- **Moyenne :** Calculée en prenant la somme des valeurs et en la divisant par le nombre de valeurs.
- **Médiane :** La valeur du milieu lorsque les données sont classées dans l'ordre croissant, prenant la moyenne des deux en cas de nombre pair.
- **Écart type :** Mesure de la dispersion des valeurs, représentant la moyenne quadratique des écarts par rapport à la moyenne.
### Boite à moustache
![](../../../../S0/PiecesJointes/Pasted%20image%2020231123115728.png)
## Mesures d’évaluation
- **Accuracy :**
  - *Description :* Pourcentage de prédictions correctes parmi l'ensemble des prédictions.
  - *Formule :* $$ \frac{{\text{true positives + true negatives}}}{{\text{total de prédictions réalisées}}} \times 100 $$
- **Precision :**
  - *Description :* Proportion de vrais positifs parmi l'ensemble des prédictions positives.
  - *Formule :* $$ \frac{{\text{true positives}}}{{\text{true positives + false positives}}} $$
- **Recall :**
  - *Description :* Proportion de vrais positifs parmi l'ensemble réel des positifs.
  - *Formule :* $$ \frac{{\text{true positives}}}{{\text{true positives + false negatives}}} $$
- **F-score :**
  - *Description :* Une métrique unique combinant precision et recall.
  - *Formule :* $$ \frac{{2 \cdot \text{precision} \cdot \text{recall}}}{{\text{precision + recall}}} $$
- **Specificity :**
  - *Description :* Proportion de vrais négatifs parmi l'ensemble réel des négatifs.
  - *Formule :* $$ \frac{{\text{true negatives}}}{{\text{true negatives + false positives}}} $$
```
````

````col
```col-md
flexGrow=1
===
#### Quel K utiliser?
**Avantages d’un grand K:**
- Meilleure confiance, surtout si les données sont bruitées
- Fournit une réponse “probabiliste”
	- Le ratio d’exemples utilisé pour chaque prédiction donne une information sur la confiance ou l’ambiguïté de la décision
- Le consensus qu’il construit à partir des k voisins conduit à une séparation de l’espace d’entrée plus simple; aussi appelée limite de décision

**Désavantages d’un grand K:**
- Détruit la localité de l’estimation puisque des exemples plus éloignés sont pris en compte
- Augmente la charge de calcul

**Avantages d’un petit K:**
- Exploite au mieux l’information locale en donnant plus d’importance à chaque point de la base de données d’exemples:  e.g. pour k=1
- Il n’est pas très robuste face au bruit dans les données

**Classification ambigüe**
- Avec un K pair il est possible d’avoir des régions qui n’ont pas de classe majoritaire et sont donc ambigue.
```
```col-md
flexGrow=1
===
### Evaluation des modèles
On attend d’un modèle créé par apprentissage automatique de pouvoir généraliser au-delà des données d’entraînement.
- **Overfitting**: le modèle représente “trop bien” les données d’exemple
	- Mauvasie performance face à de nouvelles données
	- Modèle excessivement complexe, apprentissage “par coeur” des exemples
- **Underfitting**: le modèle ne représente pas suffisamment bien les données d’exemple
	- Modèle excessivement simple

> [!important]
> L’overfitting et l’underfitting sont les causes prinicipales de mauvaises performances (mauvaise généralisation).

![](../../../../S0/PiecesJointes/Pasted%20image%2020231123120536.png)

**Validation hold-out**
- Réserver une partie des données disponibles pour tester la performance du modèle.
- Pour ne pas mal estimer la capacité de généralisation, évaluer plusieurs fois la performance du modèle en divisant aléatoirement et différemment la base de données en train-test.
- Calculer une performance moyenne à partir de ses multiples tests.


**Validation croisée**
- Diviser la base de données en 𝑛 “folds”, entrainer le modèle avec $\frac{𝑛−1}{n}$ des
données et tester avec les 𝑛 des données restant. Répéter ceci 𝑛 fois et calculer la moyenne ou le pire de cas.


**Evaluation complète**
- Utiliser la méthode de validation croisée pour sélectionner le modèle final. Réserver une partie de la base de données pour évaluer le modèle final (test set).

```
````
