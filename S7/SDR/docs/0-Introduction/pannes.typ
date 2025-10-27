#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Notion de pannes",
  course: "SDR - Systèmes Distribués et Repartis",
  author: "Guillaume Trüeb",
  date: "16 septembre 2025",
  toc: true,
  col: 1,
  doc,
)

= Types de pannes
== Panne permantante
Une panne permanente est une défaillance d'un composant du système qui persiste indéfiniment.

Dans notre cas, on dit qu'un processus est correct en terme de panne permanente quand il ne tombera jamais en panne permanente.

#heigimg("S7/SDR/docs/img/image copy 15.png", "Panne permanente")

#info[
  L'aspect *correct* est une caractéristique théorique.
  - Elle servira à analyser les algorithmes.
  - Elle n'a aucun sens dans la vraie vie.
]

== Panne récupérable
Une panne récupérable est une défaillance d'un composant du système qui peut être corrigée, permettant au composant de revenir à un état de fonctionnement normal.

Lors-ce que notre processus revient d'une panne, il se peut qu'il ait perdu des informations, dans ce cas nous parlons d'*amnésie*.

#heigimg("S7/SDR/docs/img/image copy 16.png", "Panne récupérable")

On dit qu'un processus est correct en terme de panne récupérable quand il existe un instant T après lequel il ne tombera plus en panne.

#heigimg("S7/SDR/docs/img/image copy 17.png", "Panne récupérable - correct")

#colbreak()

== Panne arbitraire (Byzantine)
Une panne arbitraire, aussi appelée panne byzantine, est une défaillance d'un composant du système qui peut se comporter de manière imprévisible ou malveillante, affectant la fiabilité et la sécurité du système.

#heigimg("S7/SDR/docs/img/image copy 18.png", "Panne byzantine")

On dit qu'un processus est correct en terme de panne arbitraire quand il suivra toujours l'algorithme attendu.

#note[
  Les pannes byzantines sont les plus difficiles et couteuses à gérer dans les systèmes distribués, car elles peuvent impliquer des comportements malveillants ou erratiques.
]

== Autres types de pannes
- *Panne d'omission*: lorsqu'un message devant être envoyé ne l'est pas.
- *Panne d'eavesdropping*: lorsqu'un message peut être lu par une entité extérieure au système.

= Détecteur de pannes

== Détecteur de pannes parfait
Un détecteur de pannes parfait est un mécanisme qui permet d'identifier avec certitude les processus défaillants dans un système distribué.

#heigimg("S7/SDR/docs/img/image copy 19.png", "Détecteur de pannes parfait")

=== Propriétés
- *Complétude*: Un jour, tout processus en panne sera détecté par tous les processus corrects.
- *Précision*: Si un processus `p`est détecté par un quelconque processus, alors `p` est effectivement en panne.

== Heartbeat
Un détecteur de pannes de type *heartbeat* est un mécanisme utilisé dans les systèmes distribués pour surveiller l'état des processus en envoyant périodiquement des signaux (ou "battements de cœur") entre eux.

=== Exemple

#heigimg("S7/SDR/docs/img/image copy 20.png", "Détecteur de pannes Heartbeat", width: 80%)

#heigimg("S7/SDR/docs/img/image copy 21.png", "Détecteur de pannes Heartbeat - exemple", width: 80%)

Dans ces exemples, nous voyons que notre système répond aux deux propriétés d'un détecteur de pannes parfait.

#warning[
  Cependant la supposition d'un système synchrone est irréaliste. Les vrais réseaux ne nous donnent pas de garantie sur la durée de transit du message. C'est pourquoi ce genre de détecteur de type Heartbeat donnera potentiellement des faux positifs, *la notion de `T` unité de temps n'existe pas*.
]

== Détecteur de pannes parfait #underline[un jour]
Un détecteur de pannes parfait *un jour* est un mécanisme qui garantit que, après un certain temps, tous les processus corrects auront détecté tous les processus en panne, tout en maintenant la précision.

#heigimg("S7/SDR/docs/img/image copy 22.png", "Détecteur de pannes parfait un jour")

=== Propriétés
- *Complétude*: Un jour, tout processus en panne sera détecté par tous les processus corrects.
- *Précision un jour*: *Un jour*, aucun processus correct ne sera suspecté par processus correct.

#colbreak()

=== Timeout dynamique
#heigimg("S7/SDR/docs/img/image copy 23.png", "Détecteur de pannes parfait un jour - timeout dynamique", width: 80%)

Grâce à cette nouvelle définition, nous pouvons donc affirmer les informations suivantes:

- Complétude: Un jour, tout processus en panne sera détecté par tous les processus corrects.
  - _Oui, un processus en panne permanente ne répondra plus aux pings, et après 𝚫, cette panne sera découverte._
- Précision un jour: Un jour, aucun processus correct ne sera suspecté par processus correct.
  - _Oui, un processus correct (en terme de panne permanente comme récupérable) répondra aux pings en un temps fini ; quand 𝚫 sera assez grand, plus de panne ne sera suspectée : tout processus sera soit "en panne" et suspecté pour toujours, ou "correct" et plus jamais suspecté._

#note[
  Pour résoudre ce problème, était-il nécessaire d'avoir un timeout dynamique?
  - Oui, sinon on risquerait de constamment suspecter un processus qui est simplement lent mais bien correct.
]