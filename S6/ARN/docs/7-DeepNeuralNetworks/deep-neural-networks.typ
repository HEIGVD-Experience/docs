#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
title: [
 Des réseaux de neurones peu profonds aux réseaux profonds
],
lesson: "ARN", 
chapter: "7 - Deep Neural Networks",
definition: "",
col: 1,
doc,
)

= Des Réseaux de Neurones Peu Profonds aux Réseaux Profonds

== Évolution Historique des Réseaux de Neurones

=== L'Ère des Réseaux Peu Profonds (Avant 2006)

*Théorème d'approximation universelle* (Cybenko, 1989) : Les réseaux de neurones avec une *seule couche cachée* peuvent représenter une grande variété de fonctions intéressantes avec des paramètres appropriés.

*Problème majeur* : Avant 2006, l'entraînement de réseaux profonds donnait de *moins bons résultats* que les réseaux peu profonds (1-2 couches cachées), tant sur les données d'entraînement que de test.

*Conséquence* : La communauté scientifique privilégiait les architectures peu profondes par pragmatisme.

=== Stratégie "Large mais Peu Profond"

Face aux limitations de profondeur, les chercheurs ont développé une approche alternative :

*Modèles d'ensemble* : Combinaison de multiples réseaux peu profonds pour améliorer les performances.

*Trois approches principales* :
- *Instances multiples* : même modèle entraîné plusieurs fois sur les mêmes données
- *Sous-ensembles de données* : même modèle sur différents échantillons d'entraînement  
- *Architectures variées* : différentes structures de réseaux peu profonds

=== Réseaux d'Ensemble : Principe Mathématique

*Formulation* : Pour $N$ modèles individuels produisant des sorties $y_1, y_2, ..., y_N$ :

*Classification* : 
$
y_"ensemble" = "argmax"_c sum_(i=1)^N delta(y_i = c)
$

*Régression* : 
$
y_"ensemble" = 1/N sum_(i=1)^N y_i
$

*Avantage fondamental* : Les erreurs individuelles des modèles ont tendance à se "compenser" mutuellement, réduisant l'erreur globale.

== Le Problème du Gradient Qui Disparaît

=== Analyse Mathématique du Problème

Pour un réseau à $L$ couches, le gradient de l'erreur par rapport aux poids des premières couches :

$
frac(partial E, partial W_(L-2)) = frac(partial E, partial y_L) frac(partial y_L, partial y_(L-1)) frac(partial y_(L-1), partial y_(L-2)) frac(partial y_(L-2), partial W_(L-2))
$

*Décomposition avec fonctions d'activation* :
$
frac(partial E, partial W_(L-2)) = frac(partial E, partial y_L) f'_L() frac(partial a_L, partial y_(L-1)) f'_(L-1)() frac(partial a_(L-1), partial y_(L-2)) f'_(L-2)() frac(partial a_(L-2), partial W_(L-2))
$

=== Impact de la Fonction Sigmoïde

*Propriété critique* : Pour la sigmoïde, $0 < f'(x) < 0.25$

*Calcul du produit maximal* :
$
max(f'_L() times f'_(L-1)() times f'_(L-2)()) = 0.25^3 ≈ 0.016
$

*Conséquence dramatique* : Le gradient devient exponentiellement petit, ne fournissant plus d'information utile pour ajuster les poids des premières couches.

== Révolution des Fonctions d'Activation

=== Fonction ReLU : La Solution

*Définition mathématique* :
$
"ReLU"(x) = max(0, x) = cases(x "si" x > 0, 0 "si" x ≤ 0)
$

*Dérivée* :
$
"ReLU"'(x) = cases(1 "si" x > 0, 0 "si" x ≤ 0, "indéfini en" x = 0)
$

*Avantages décisifs* :
- *Gradient non-saturant* : la dérivée vaut 1 pour $x > 0$
- *Calcul ultra-rapide* : simple comparaison et sélection
- *Parcimonie naturelle* : de nombreuses activations sont nulles
- *Inspiration biologique* : les neurones ne transmettent que des signaux positifs

=== Leaky ReLU : Amélioration

*Formulation* :
$
"LeakyReLU"(x) = max(alpha x, x)
$
où $alpha$ est un petit coefficient (ex: 0.01)

*Dérivée* :
$
"LeakyReLU"'(x) = cases(1 "si" x > 0, alpha "si" x < 0)
$

*Avantage* : Évite les "neurones morts" en permettant un gradient non-nul pour les valeurs négatives.

== L'Émergence des Réseaux Profonds

=== Les Pionniers du Deep Learning

*Figures clés* : Geoffrey Hinton (Toronto & Google), Yann LeCun (NYU & Facebook), Yoshua Bengio (Montréal), Jürgen Schmidhuber (IDSIA & USI, Suisse)

*Contexte historique* : Les idées pionnières ont été publiées dans les années 1980-1990, mais leur application pratique a dû attendre les années 2000.

*Performance* : Ces techniques permettent désormais les *meilleures performances actuelles* sur les benchmarks de traitement d'images et bien d'autres problèmes.

=== Deux Approches Initiales

*Deep Belief Networks (DBN)* :
- Basés sur des machines de Boltzmann restreintes (RBM)
- Connexions bidirectionnelles et symétriques
- Apprentissage non-supervisé récursif de détecteurs de caractéristiques
- *Verdict* : Finalement moins performants que prévu

*Convolutional Neural Networks (CNN)* :
- Couches multiples de convolutions (filtres spatiaux)
- Couches de sous-échantillonnage
- Couches entièrement connectées
- *Succès* : Base de nombreuses solutions état de l'art

== Technique d'Entraînement : Auto-encodeurs Empilés

=== Méthode de Pré-entraînement Couche par Couche

*Étape 1* : Entraîner un auto-encodeur sur les deux premières couches
- *Objectif* : reproduire l'entrée à la sortie
- *Architecture* : entrée → couche cachée → reconstruction de l'entrée

*Étape 2* : Fixer les poids appris et répéter pour la couche suivante

*Étape 3* : Affinage final par rétropropagation classique sur l'ensemble du réseau

*Avantage* : Cette approche permet d'initialiser intelligemment les poids avant l'entraînement supervisé final.

== CNN : De Peu Profond à Profond

=== Comparaison Architecturale

*Réseau peu profond traditionnel* :
$
"Image" arrow.r "Aplatissement" arrow.r "MLP" arrow.r "Classification"
$

*CNN profond moderne* :
$
"Image" arrow.r ["Conv" + "ReLU" + "Pool"] times N arrow.r "Flatten" arrow.r "Dense" arrow.r "Softmax"
$

*Innovation clé* : L'extraction automatique de caractéristiques hiérarchiques remplace l'ingénierie manuelle de features.

=== Traitement Spatial et Partage de Poids

*Principe fondamental* : Chaque neurone traite séquentiellement de petites régions de l'image avec les *mêmes poids*.

*Avantages du partage de poids* :
- *Réduction drastique des paramètres* : de millions à quelques milliers
- *Invariance par translation* : détection indépendante de la position
- *Généralisation* : ce qui est appris localement s'applique globalement

*Formulation mathématique* : Pour un filtre $W$ et une position $(x,y)$ :
$
O(x,y) = sum_(i,j) I(x+i,y+j) times W(i,j) + b
$

== Paramètres de Convolution

=== Stride (Pas) et Padding (Rembourrage)

*Stride = 1 avec zero-padding* :
- Conservation de la taille de l'image d'entrée
- Exploration exhaustive de tous les pixels

*Stride = 2 sans padding* :
- Réduction de taille par facteur 2
- Calcul plus rapide, moins de redondance

*Formule de taille de sortie* :
$
O_"size" = floor((I_"size" + 2P - K)/S) + 1
$

Où :
- $I_"size"$ : taille d'entrée
- $P$ : padding  
- $K$ : taille du noyau
- $S$ : stride

=== Convolutions Multiples et Détection de Caractéristiques

*Principe* : Chaque "neurone" applique un filtre particulier à l'image complète pour détecter une caractéristique spécifique.

*Pour images RGB* : Chaque neurone additionne les sorties des filtres appliqués sur chaque canal :
$
O(x,y) = sum_(c in {R,G,B}) I_c(x,y) star W_c + b
$

*Objectif d'apprentissage* : Le réseau apprend automatiquement les filtres optimaux pour la tâche (ex: détection d'yeux, oreilles, museau pour reconnaître des chats).

== Détection Hiérarchique de Caractéristiques

=== Progression des Niveaux d'Abstraction

*Première couche* : Détection de caractéristiques de bas niveau
- Contours, edges, coins
- Textures basiques

*Couches intermédiaires* : Combinaisons de caractéristiques de bas niveau
- Formes géométriques simples
- Motifs plus complexes

*Couches supérieures* : Caractéristiques de haut niveau
- Parties d'objets (yeux, oreilles pour les animaux)
- Objets complets

*Formulation* : Pour la couche $l$ avec $N_(l-1)$ entrées de la couche précédente :
$
O^l(x,y) = f(sum_(k=1)^(N_(l-1)) I^(l-1)_k(x,y) star W^l_k + b^l)
$

=== Convolutions dans les Couches Intermédiaires

*Processus* : Si la couche précédente produit 10 cartes de caractéristiques, chaque neurone de la couche suivante :
+ Applique un filtre sur chaque carte d'entrée
+ Additionne toutes les sorties filtrées
+ Ajoute un biais
+ Applique une fonction d'activation
+ Produit une nouvelle carte de caractéristiques

== Fonctions d'Activation Modernes

=== Fonction Softmax pour la Classification

*Définition mathématique* :
$
"Softmax"(x_i) = (e^(x_i))/(sum_(j=1)^K e^(x_j)) quad "pour" j = 1, ..., K
$

*Propriétés* :
$
sum_(i=1)^K "Softmax"(x_i) = 1 quad "et" quad 0 ≤ "Softmax"(x_i) ≤ 1
$

*Interprétation probabiliste* : 
$
P("classe" = i | "entrées", "poids", "biais")
$

*Usage* : Couche de sortie pour problèmes de classification multi-classes.

== Régularisation et Prévention du Surapprentissage

=== Technique du Dropout

*Principe* (Hinton et al., 2012) : Désactiver aléatoirement des neurones pendant l'entraînement pour prévenir le surapprentissage.

*Mécanisme* : Avec probabilité $p$ (ex: 0.5), un neurone est temporairement "supprimé" du réseau.

*Effet* : Les autres neurones doivent apprendre à compenser l'absence du neurone désactivé, forçant une représentation plus robuste et distribuée.

*Implémentation* : Pendant l'entraînement seulement ; à l'inférence, tous les neurones sont actifs.

=== Stratégies Anti-Surapprentissage

*Liste des techniques efficaces* :
+ *Augmentation des données* : créer des variations artificielles des données d'entraînement
+ *Augmentation de données* : rotation, translation, zoom, recadrage, retournement, perturbation colorimétrique
+ *Architectures robustes* : utiliser des modèles connus pour bien généraliser
+ *Régularisation L1/L2* : pénaliser les poids trop importants
+ *Normalisation par batch* : stabiliser l'entraînement
+ *Réduction de complexité* : simplifier l'architecture si nécessaire

=== Augmentation de Données (Data Augmentation)

*Transformations géométriques* :

- *Rotation* : 
$
[x', y'] = [x cos θ - y sin θ, x sin θ + y cos θ]
$

- *Translation* : 
$
[x', y'] = [x + Delta x, y + Delta y]
$

- *Zoom/Recadrage* : modification d'échelle
- *Retournement* : symétrie horizontale/verticale

*Transformations colorimétriques* :
- Perturbation des canaux RGB
- Modification de luminosité/contraste
- Dé-texturation et amélioration des contours

== Le Défi de la Sélection de Modèle

=== Questions Architecturales

*Choix structurels critiques* :
- *Nombre de couches convolutionnelles* : profondeur du réseau
- *Nombre de filtres par couche* : largeur du réseau  
- *Tailles de filtres* : 3×3, 5×5, 7×7, etc.
- *Placement des couches de pooling* : où réduire la dimensionnalité
- *Fonctions d'activation* : ReLU, Leaky ReLU, autres
- *Configuration des couches denses finales* : nombre et taille

=== Paramètres d'Apprentissage

*Optimisation* :
- *Optimiseur* : SGD, Adam, RMSprop, AdaGrad
- *Fonction de perte* : entropie croisée, MSE, autres
- *Taux d'apprentissage* : souvent le paramètre le plus critique
- *Taille de batch* : compromis vitesse/qualité de convergence
- *Nombre d'époques* : équilibre entre sous et sur-apprentissage
- *Régularisation* : L1, L2, dropout, normalisation par batch

== Impact et Applications

=== Succès Médiatiques du Deep Learning

*Moments historiques de l'IA* :
+ *Deep Blue vs Kasparov* : victoire de l'IA aux échecs
+ *Watson à Jeopardy* : compréhension du langage naturel
+ *Challenge Kaggle Merck* (nov. 2012) : étudiants utilisant le deep learning remportent le défi d'activité moléculaire

*Démocratisation* : Outils interactifs permettant d'expérimenter le deep learning directement dans le navigateur.

=== Hiérarchies de Caractéristiques Apprises

*Reconnaissance d'images* :
$
"pixel" arrow.r "edge" arrow.r "texton" arrow.r "motif" arrow.r "partie" arrow.r "objet"
$

*Traitement de texte* :
$
"caractère" arrow.r "mot" arrow.r "groupe de mots" arrow.r "clause" arrow.r "phrase" arrow.r "histoire"
$

*Traitement de la parole* :
$
"échantillon" arrow.r "bande spectrale" arrow.r "son" arrow.r "phonème" arrow.r "mot" arrow.r ...
$

*Principe de Jeff Dean (Google)* : "Tout ce que les humains peuvent faire en 0.1 seconde, un bon réseau à 10 couches peut aussi le faire."

== Conclusion

La transition des réseaux peu profonds aux réseaux profonds représente une révolution majeure en intelligence artificielle. Cette évolution s'appuie sur plusieurs innovations clés :

*Innovations techniques décisives* :
- Nouvelles fonctions d'activation (ReLU) résolvant le problème du gradient qui disparaît
- Techniques de régularisation (dropout) prévenant le surapprentissage
- Méthodes d'entraînement sophistiquées (auto-encodeurs empilés)
- Augmentation de données pour améliorer la généralisation

*Impact transformateur* : Les réseaux profonds, particulièrement les CNN, ont révolutionné la vision par ordinateur et établi les fondations de l'IA moderne, ouvrant la voie aux succès actuels dans de nombreux domaines d'application.