#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Sondes et Echos",
  course: "SDR - Systèmes Distribués et Repartis",
  author: "Guillaume Trüeb",
  date: "30 Novembre 2025",
  toc: true,
  col: 1,
  doc,
)

= Programmation par Sondes et Echos
La programmation par sondes et echos consiste en un modèle de communication asynchrone entre des entités distribuées, appelées sondes et echos. Cette approche permet à un processus de pouvoir échanger avec tous les autres processus.

== Concept
=== Diffusion
Le processus choisi envoie une sonde à tous les processus dont il est directement connecté, on appèle cette phase, la phase de diffusion.

#columns(3)[
  #himg("S7/SDR/docs/img/image copy 66.png", "Phase de diffusion")
  #colbreak()
  #himg("S7/SDR/docs/img/image copy 67.png", "Phase de diffusion")
  #colbreak()
  #himg("S7/SDR/docs/img/image copy 68.png", "Phase de diffusion")
]

=== Contraction
Puis une fois cette phase terminée, nous entrons dans la phase de contraction. Celle-ci consiste au fait que chaque processus renvoie un echo au processus qui lui a envoyé la sonde.

#columns(3)[
  #himg("S7/SDR/docs/img/image copy 69.png", "Phase de contraction")
  #colbreak()
  #himg("S7/SDR/docs/img/image copy 70.png", "Phase de contraction")
]

== Application sur un arbre
Dans le cas d'un arbre, la sonde est envoyée du noeud racine vers les feuilles, puis les echos sont renvoyés des feuilles vers la racine. Dans un arbre il n'y a pas de risque de boucle, car chaque noeud n'a qu'un seul parent. Ce risque en moins permet de simplifier l'algorithme. Nous nous retrouvons donc avec quelque chose dans ce style:

#columns(2)[
Réception d'une *sonde*
- Je la propage à mes enfants
- _Je fais des calculs (optionnel)_
- Si je n'ai pas d'enfants
  - J'envoie un *echo* à mon parent

#colbreak()

Réception d'un *echo*
- Si j'ai tous les echos
  - _Je fais des calculs (optionnel)_
  - J'envoie un *echo* à mon parent
  - Si je suis la source, j'ai terminé
]

== Comportement des noeuds
Il existe 3 cas de comportement différents pour les noeuds:

*Comportement de la source*
- La source démarre en envoyant une sonde à tous ses enfants. Puis elle attend de recevoir tous les echos de ses enfants. Une fois reçus, le sondage est terminé avec les échos aggrégés.

*Comportement des noeuds intermédiaires*
- Un noeud intermédiaire attend de recevoir une sonde de son parent. Une fois reçue, il propage la sonde à tous ses enfants. Ensuite, il attend de recevoir tous les echos de ses enfants. Une fois reçus, il envoie un echo aggrégeant les résultats à son parent.

*Comportement des feuilles*
- Une feuille attend de recevoir une sonde de son parent. Une fois reçue, elle envoie immédiatement un echo à son parent, car elle n'a pas d'enfants.

=== Interface
On peut voir ce mécanisme comme une interface définie de la manière suivante:
#himg("S7/SDR/docs/img/image copy 71.png", "Interface Sondes et Echos")

== Graphes arbitraires
Dans le cas de graphes arbitraires, il y a un risque de boucle. Pour éviter cela, nous pouvons légèrement modifier notre algorithme précédent en disant:

#columns(2)[
Réception d'une *sonde*
- *Si je connais déjà cette sonde*
  - *J'arrête d'attendre l'écho de ce voisin*
- Sinon
  - Je la propage à mes enfants
  - _Je fais des calculs (optionnel)_
  - Si je n'ai pas d'enfants
    - J'envoie un *echo* à mon parent

#colbreak()

Réception d'un *echo*
- Si j'ai tous les echos *attendus*
  - _Je fais des calculs (optionnel)_
  - J'envoie un *echo* à mon parent
  - Si je suis la source, j'ai terminé
]

== Sources multiples
Il se peut que dans un réseau, plusieurs noeuds initient une sonde en même temps. Dans ce cas, chaque noeud doit gérer indépendamment chaque sonde reçue. Pour cela, chaque sonde doit avoir un identifiant unique, permettant ainsi de différencier les sondes et leurs échos associés.

=== Identifiant unique
Pour générer un identifiant unique, on peut utiliser une combinaison de l'identifiant du noeud source et d'un compteur local. Par exemple, si le noeud A initie une sonde, il peut utiliser "A-1" pour la première sonde, "A-2" pour la deuxième, etc. De cette manière, chaque sonde dans le réseau aura un identifiant unique.