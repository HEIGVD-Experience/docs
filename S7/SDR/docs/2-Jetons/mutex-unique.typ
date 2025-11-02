#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Mutex par jetons",
  course: "SDR - Systèmes Distribués et Repartis",
  author: "Guillaume Trüeb",
  toc: true,
  col: 1,
  doc,
)

= Introduction
Jusqu'à maintenant, nous avons vu des algorithmes de synchronisation basés sur des horloges logiques et des demandes de permission. Cependant, une autre approche intéressante pour gérer l'accès à une section critique dans un système distribué est l'utilisation de jetons uniques.

== Petit rappel
- *Lamport*: horloge logique pour ordonner les événements
- *Ricart & Agrawala*: demande de permission à tous les processus avant d'entrer en section critique
- *Carvalho et Roucairol*: demande de permission à un sous-ensemble de processus (passage de témoin entre 2 processus)

= Algorithme par jeton
Jusqu'à maintenant les algorithmes que nous avons vu, nécessistait plusieurs jetons pour fonctionner.

#himg("S7/SDR/docs/img/image copy 24.png", "Différents multi-jetons à jeton unique")

== Critères de réussite
Pour résoudre ce problème, en ayant qu'un seul jeton, nous cherchons à respecter 3 critères:
- Unicité: assurer que le jeton ne sera pas dupliqué
- Transmission: gérer le transit du jeton entre les processus
- Progrès: assurer que tout demandeur finira par obtenir le jeton

== Approche naive (anneau)
Nous pourions imaginer un système où le jeton est transmis de manière circulaire entre les processus. Chaque processus, lorsqu'il reçoit le jeton, vérifie s'il a une demande en attente pour la section critique. Si oui, il entre dans la section critique; sinon, il transmet le jeton au processus suivant.

#himg("S7/SDR/docs/img/image copy 25.png", "Approche circulaire naïve")

#warning[
  Si nous prenons en compte les pannes de processus, cette approche devient problématique. En effet, si un processus tombe en panne, le jeton peut être perdu, ce qui empêche tous les autres processus d'accéder à la section critique.

  Le temps d'attente n'est pas optimial, car un jeton ayant transmis le jeton et ayant une demande en attente doit attendre que le jeton fasse tout le tour avant de pouvoir entrer en section critique. *La structure en anneau n'est pas efficace.*
]

== Approche avec un arbre (Raymond)
L'avantage de la structure en arbre est que la profondeur de celui-ci est 
$
log(n) (n = "nombre de processus")
$ 
Ainsi, le temps d'attente pour obtenir le jeton est réduit.

=== Propriétés

#columns(2)[
#linebreak()
- *Efficacité*: S'il est équilibré, distance logarithmique
- *Simplicité*: Un seul chemin entre tous les points
- *Réalisme*: Les vrais réseaux sont rarement des cliques

#colbreak()

#himg("S7/SDR/docs/img/image copy 26.png", "Approche avec un arbre")
]

Cette approche nous oblige à denouveau gérer de la communication entre les processus pour la demande et la libération du jeton.

#colbreak()

=== Demande du jeton
#columns(2)[
  Dans notre situation, `C` possède le jeton. `E` en fait la demande il prendra donc le chemin qui le mènera vers `C`. Chaque intermédiaire sur le chemin (ici `B`) va stocker la demande de `E` dans une file d'attente locale.

  Au moment où `C` libère le jeton, il le transmet à `B` qui le transmettra à `E` (puisque c'est la première demande dans sa file d'attente) et chaque processus *inverse* le sens de son arc.

  #info[
    Chaque noeud ne connaît que son parent et ses enfants. Lorsqu'un noeud reçoit le jeton, il le transmet au premier demandeur dans sa file d'attente. Donc `C` ne sait pas que `E` a fait la demande, il sait juste que `B` lui a demandé le jeton.
  ]

  #colbreak()

  #himg("S7/SDR/docs/img/image copy 27.png", "Demande du jeton")
]

#columns(2)[
  ==== Demande multiple
  Dans notre cas, si `D` et `A` viennent demander le jeton, `B` va simplement ajouter `A` à sa file d'attente. Lorsque `E` aura terminé, le jeton sera transmis à demandeur le plus ancien dans la file d'attente, ici `D`. *En transmettant le jeton à `D`, vu qu'une autre demande est en attente, `B` demandera le jeton à `D` pour le transmettre à `A`.*

  #colbreak()

  #himg("S7/SDR/docs/img/image copy 28.png", "Libération du jeton")
]

#warning[
  À l'exception des feuilles, cette approche rends notre réseau sensible aux pannes, car si un noeud intermédiaire tombe en panne, *tous ses descendants* sont isolés du reste de l'arbre.
]

=== Resumé
Dans cette approche nous aurons besoin de 2 types de messages:
- `REQUEST`: pour demander le jeton
- `OK`: pour transmettre le jeton

Les règles à respecter sont:
- *Les liens doivent toujours être orientés vers le détenteur du jeton.*
- *Chaque noeud possède une file d'attente pour stocker les demandes.*
- *Renvoi d'une requête après le jeton si besoin.*
- *On ne contacte le parent que si la file d'attente est vide.*

Nous pouvons donc déduire les propriétés suivantes:
- *Correctness*: Jamais plus d'un processus sera en SC
- *Progress*: Toute demande finira par être satisfaite
- *Complexity*: $4 log(n)$ par demande *si l'arbre est équilibré*

=== Pseudo-code
#columns(2)[
  #himg("S7/SDR/docs/img/image copy 29.png", "Pseudo-code de l'algorithme de Raymond")
  #himg("S7/SDR/docs/img/image copy 30.png", "Pseudo-code de l'algorithme de Raymond - suite")
  #himg("S7/SDR/docs/img/image copy 31.png", "Pseudo-code de l'algorithme de Raymond - suite")
  #colbreak()
  #himg("S7/SDR/docs/img/image copy 32.png", "Pseudo-code de l'algorithme de Raymond - suite")
  #himg("S7/SDR/docs/img/image copy 33.png", "Pseudo-code de l'algorithme de Raymond - fin")
]
