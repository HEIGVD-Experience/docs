#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: [
    Horloges logiques
  ],
  lesson: "SDR",
  col: 1,
  doc,
)

= Horloges logiques
== Problèmatique
Lors-ce qu'on travaille dans un système distribué, il est crucial de pouvoir ordonner les événements qui s'y produisent. Cependant, en l'absence d'une horloge globale, il devient difficile de déterminer l'ordre exact des événements.

#heigimg("S7/SDR/docs/img/image.png", "Horloges logiques")

#warning[
  Sur cette image, nous voyons la problèmatique concernant l'ordonnancement des événements dans un système distribué. Chaque système peçois que son événement est le premier.
]

== Protocole existant
- *NTP*: Network Time Protocol (NTP) _`ms` precision_
- *PTP*: Precision Time Protocol (PTP) _`μs` precision_

== Résolution
On ne cherche pas l'heure excate mais plutot un ordre d'évenement.

#heigimg("S7/SDR/docs/img/image copy.png", "Ordre d'événements")

== Propiétés des ordres
Nous pouvons définir trois propriétés pour un ordre d'événements:
- *Transitivité*: Si un événement A précède un événement B, et que B précède C, alors A précède C.
- *Anti-réflexif*: Aucun événement ne peut précéder lui-même.
- *Antisymétrique*: Si un événement A précède B, alors B ne peut pas précéder A.

#heigimg("S7/SDR/docs/img/image copy 2.png", "Propriétés des ordres")

== Horloge logique
On cherche à définir une fonction `H` qui associe un entier à chaque événement, de manière à respecter les propriétés d'ordre définies précédemment.

Une idée serait d'utiliser une horloge locale pour chaque processus, qui s'incrémente à chaque événement. Cependant, cela ne garantit pas que les événements soient ordonnés correctement à travers les différents processus. Le risque de décalage entre les horloges locales est trop grand et nous pourrons nous retrouver avec un événement 6 qui arrive en réalité avant un événement 5.

#heigimg("S7/SDR/docs/img/image copy 3.png", "Risque d'utilisation d'horloges locales")

== Horloge de Lamport
Pour résoudre ce problème, Lamport propose un algorithme d'horloge logique qui utilise des horloges locales, mais ajoute des règles pour garantir l'ordre des événements à travers les processus.

#columns(2)[
  #heigimg("S7/SDR/docs/img/image copy 4.png", "Algorithme de Lamport", width: 75%)

  #colbreak()

  - Chaque site maintient un numéro
  - À chaque événement local, le site incrémente son numéro
  - Le timestamp est attaché au message
  - À la réception d'un message, le site met à jour son numéro avec le maximum entre son numéro et le timestamp reçu, puis incrémente ce numéro de 1

  #warning[
    Cet algorithme n'est pas déterministe, si deux événements sont concurrents, l'ordre peut varier selon les exécutions.
    *Solution*: priorité à la machine avec l'ID le plus petit
  ]
]

#warning[
  - Les timestamps de Lamport n'ordonnancent pas les messages immédiatement.
  - Ils assurent seulement qu'un ordre strict sera obtenu un jour.
]

= Exclusion mutuelle
== Problèmatique
Dans un système distribué, il est crucial de gérer l'accès concurrent aux ressources partagées. L'exclusion mutuelle garantit qu'une ressource ne peut être utilisée que par un seul processus à la fois, évitant ainsi les conflits et les incohérences.

#heigimg("S7/SDR/docs/img/image copy 5.png", "Exclusion mutuelle")

== Systpème centralisé
Un serveur centralisé gère les demandes d'accès aux ressources. Chaque processus doit demander la permission au serveur avant d'accéder à la ressource.

#heigimg("S7/SDR/docs/img/image copy 6.png", "Système centralisé")

#heigimg("S7/SDR/docs/img/image copy 7.png", "Système centralisé 2")

== Solution répartie
Chaque processus maintient une file d'attente des demandes d'accès aux ressources, ordonnée par les horloges logiques. Lorsqu'un processus souhaite accéder à une ressource, il envoie une demande à tous les autres processus et attend les réponses.

=== Version priority queue
#heigimg("S7/SDR/docs/img/image copy 8.png", "Solution répartie")

#colbreak()

#columns[
  ==== On request
  - Push demandeur dans la file d'attente
  - Réodonner la file d'attente par heure de Lamport
  - Envoie un `ack` avec nouveau timestamp

  #colbreak()

  ==== On realese
  - Pop tête de file
  - Entrer en section critique
   - Si je suis la nouvelle tête et que j'ai reçus tous les `acks`
]

=== Version tableau
#heigimg("S7/SDR/docs/img/image copy 9.png", "Solution répartie version tableau")

Chaque processus maintient un tableau des derniers messages reçus ainsi qu'un timestamp pour chaque message, par exemple `(REQ, id)`.

== Propriétés de l'algorithme Lamport
- *Corectness*: Un seul processus peut être en section critique à la fois.
- *Progrès*: Toute demande d'entrée en SC sera autorisée un jour.
- *Complexité*
  - Communication par SC par processus : $3n(n-1)$
  - Calcul  par événement :
   - $O(n)$  par réception de message
   - $O(1)$ pour le reste.