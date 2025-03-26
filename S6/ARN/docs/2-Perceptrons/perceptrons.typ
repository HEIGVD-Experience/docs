#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Perceptrons
  ],
  lesson: "ARN",
  chapter: "2 - Perceptrons",
  definition: "",
  col: 1,
  doc,
)

= Perceptrons

#table(
  align: center + horizon,
  columns: (1fr, 1fr, 1fr),
  [*Caractéristique*], [*Ordinateur von Neumann*], [*Cerveau*],
  "Processeur", "Complexe (GHz)", "Simple (Hz) ",
  "Fréquence", "Élevée", "Basse",
  "Nombre d'unités", "Quelques cœurs", "Très nombreuses",
  "Mémoire", "Séparée, adressable", "Intégrée, distribuée",
  "Calcul", "Centralisé, séquentiel", "Distribué, parallèle",
  "Programmation", "Programmable", "Apprentissage",
  "Fiabilité", "Vulnérable", "Très robuste"
)

== Connexionnisme
- Modélisation des phénomènes mentaux/comportementaux comme des processus émergents de réseaux interconnectés.
- Architecture massivement parallèle : chaque neurone corrèle les entrées avec des poids synaptiques.
- Changement de paradigme #sym.arrow remplace la programmation par l'apprentissage.

#image("../img/image.png")

== Neurone Artificiel
Le neurone artificiel, inventé par Warren McCulloch et Walter Pitts en 1948, est une unité de calcul qui prend des entrées, les pondère et les somme pour produire une sortie.

#image("../img/image copy.png")

=== Formule
Si (x1 + x2 + ... + xn) ≥ Θ alors y = 1, sinon y = 0

- Entrées : excitatrices (poids = 1) et inhibitrices (poids = -1).
- Sortie binaire.

== Perceptron de Rosenblatt (1958)

#columns(2)[
  #linebreak()
Si $sum w_i x_i gt.eq Theta "alors" y = 1, "sinon" y = -1$

- Somme pondérée des entrées.
- Fonction d'activation : discontinue.
#colbreak()
#image("../img/image copy 2.png")
]

== Séparation Linéaire
- Le perceptron sépare les données par un hyperplan :
  - 2D : une ligne.
  - 3D : un plan.
  - nD : un hyperplan.

== Biais
- Se débarrasse du seuil en ajoutant un poids supplémentaire appelé "biais" :

Si $sum w_i x_i + w_0 gt.eq 0 "alors" y = 1, "sinon" y = 0$


== Algorithme d'Apprentissage du Perceptron
1. Initialisation aléatoire des poids.
2. Calcul de la sortie `y` pour une entrée `x`.
3. Mise à jour des poids :

$"Wj"(t+1) = "Wj"(t) + mu (d - y)"xj"$

4. Répéter jusqu'à ce que l'erreur soit inférieure à un seuil.

== Descente de Gradient (Widrow-Hoff / Delta Rule)
- Minimise la fonction d'erreur :

$E = frac(1,2) sum ("yi" - "di")^2$

- Mise à jour des poids :

$Delta "wj" = mu(d - y) "xj"$


== Fonction d'Activation Sigmoïde

$y = frac(1, (1 + e^(-"Sj")))$

- Activation non linéaire souvent utilisée.
- Autres fonctions courantes : tanh, ReLU.

== Classification à Deux Classes
- Le perceptron classe les données selon un seuil fixé.
- Équilibre entre taux de vrais positifs et taux de faux positifs.

== Problèmes Non-Linéairement Séparables
- Le perceptron ne peut pas séparer certaines classes avec une ligne simple.