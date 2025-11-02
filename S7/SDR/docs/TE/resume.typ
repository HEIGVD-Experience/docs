#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Résumé TE1",
  course: "SDR - Systèmes Distribués et Repartis",
  author: "Guillaume Trüeb",
  date: "02 novembre 2025",
  toc: true,
  col: 1,
  doc,
)

= Notion de pannes

== Types de pannes

=== Panne permanente
Une panne permanente est une défaillance d'un composant du système qui persiste indéfiniment.

Dans notre cas, on dit qu'un processus est correct en terme de panne permanente quand il ne tombera jamais en panne permanente.

#heigimg("S7/SDR/docs/img/image copy 15.png", "Panne permanente")

#info[
  L'aspect *correct* est une caractéristique théorique.
  - Elle servira à analyser les algorithmes.
  - Elle n'a aucun sens dans la vraie vie.
]

=== Panne récupérable
Une panne récupérable est une défaillance d'un composant du système qui peut être corrigée, permettant au composant de revenir à un état de fonctionnement normal.

Lors-ce que notre processus revient d'une panne, il se peut qu'il ait perdu des informations, dans ce cas nous parlons d'*amnésie*.

#heigimg("S7/SDR/docs/img/image copy 16.png", "Panne récupérable")

On dit qu'un processus est correct en terme de panne récupérable quand il existe un instant T après lequel il ne tombera plus en panne.

#heigimg("S7/SDR/docs/img/image copy 17.png", "Panne récupérable - correct")

=== Panne arbitraire (Byzantine)
Une panne arbitraire, aussi appelée panne byzantine, est une défaillance d'un composant du système qui peut se comporter de manière imprévisible ou malveillante, affectant la fiabilité et la sécurité du système.

#heigimg("S7/SDR/docs/img/image copy 18.png", "Panne byzantine")

On dit qu'un processus est correct en terme de panne arbitraire quand il suivra toujours l'algorithme attendu.

#note[
  Les pannes byzantines sont les plus difficiles et couteuses à gérer dans les systèmes distribués, car elles peuvent impliquer des comportements malveillants ou erratiques.
]

=== Autres types de pannes
- *Panne d'omission*: lorsqu'un message devant être envoyé ne l'est pas.
- *Panne d'eavesdropping*: lorsqu'un message peut être lu par une entité extérieure au système.

== Détecteur de pannes

=== Détecteur de pannes parfait
Un détecteur de pannes parfait est un mécanisme qui permet d'identifier avec certitude les processus défaillants dans un système distribué.

#heigimg("S7/SDR/docs/img/image copy 19.png", "Détecteur de pannes parfait")

*Propriétés:*
- *Complétude*: Un jour, tout processus en panne sera détecté par tous les processus corrects.
- *Précision*: Si un processus `p` est détecté par un quelconque processus, alors `p` est effectivement en panne.

=== Heartbeat
Un détecteur de pannes de type *heartbeat* est un mécanisme utilisé dans les systèmes distribués pour surveiller l'état des processus en envoyant périodiquement des signaux (ou "battements de cœur") entre eux.

#heigimg("S7/SDR/docs/img/image copy 20.png", "Détecteur de pannes Heartbeat", width: 80%)

#heigimg("S7/SDR/docs/img/image copy 21.png", "Détecteur de pannes Heartbeat - exemple", width: 80%)

Dans ces exemples, nous voyons que notre système répond aux deux propriétés d'un détecteur de pannes parfait.

#warning[
  Cependant la supposition d'un système synchrone est irréaliste. Les vrais réseaux ne nous donnent pas de garantie sur la durée de transit du message. C'est pourquoi ce genre de détecteur de type Heartbeat donnera potentiellement des faux positifs, *la notion de `T` unité de temps n'existe pas*.
]

=== Détecteur de pannes parfait #underline[un jour]
Un détecteur de pannes parfait *un jour* est un mécanisme qui garantit que, après un certain temps, tous les processus corrects auront détecté tous les processus en panne, tout en maintenant la précision.

#heigimg("S7/SDR/docs/img/image copy 22.png", "Détecteur de pannes parfait un jour")

*Propriétés:*
- *Complétude*: Un jour, tout processus en panne sera détecté par tous les processus corrects.
- *Précision un jour*: *Un jour*, aucun processus correct ne sera suspecté par processus correct.

*Timeout dynamique:*

#heigimg("S7/SDR/docs/img/image copy 23.png", "Timeout dynamique", width: 80%)

Grâce à cette nouvelle définition, nous pouvons donc affirmer les informations suivantes:

- Complétude: Un jour, tout processus en panne sera détecté par tous les processus corrects.
  - _Oui, un processus en panne permanente ne répondra plus aux pings, et après 𝚫, cette panne sera découverte._
- Précision un jour: Un jour, aucun processus correct ne sera suspecté par processus correct.
  - _Oui, un processus correct (en terme de panne permanente comme récupérable) répondra aux pings en un temps fini ; quand 𝚫 sera assez grand, plus de panne ne sera suspectée : tout processus sera soit "en panne" et suspecté pour toujours, ou "correct" et plus jamais suspecté._

#note[
  Pour résoudre ce problème, était-il nécessaire d'avoir un timeout dynamique?
  - Oui, sinon on risquerait de constamment suspecter un processus qui est simplement lent mais bien correct.
]

= Horloges logiques

== Problèmatique
Lors-ce qu'on travaille dans un système distribué, il est crucial de pouvoir ordonner les événements qui s'y produisent. Cependant, en l'absence d'une horloge globale, il devient difficile de déterminer l'ordre exact des événements.

#heigimg("S7/SDR/docs/img/image.png", "Problèmatique d'ordonnancement")

#warning[
  Sur cette image, nous voyons la problèmatique concernant l'ordonnancement des événements dans un système distribué. Chaque système peçois que son événement est le premier.
]

== Protocole existant
- *NTP*: Network Time Protocol (NTP) _`ms` precision_
- *PTP*: Precision Time Protocol (PTP) _`μs` precision_

== Résolution
On ne cherche pas l'heure excate mais plutot un ordre d'évenement.

#heigimg("S7/SDR/docs/img/image copy.png", "Ordre d'événements")

== Propriétés des ordres
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

#heigimg("S7/SDR/docs/img/image copy 4.png", "Algorithme de Lamport", width: 75%)

- Chaque site maintient un numéro
- À chaque événement local, le site incrémente son numéro
- Le timestamp est attaché au message
- À la réception d'un message, le site met à jour son numéro avec le maximum entre son numéro et le timestamp reçu, puis incrémente ce numéro de 1

#warning[
  Cet algorithme n'est pas déterministe, si deux événements sont concurrents, l'ordre peut varier selon les exécutions.
  *Solution*: priorité à la machine avec l'ID le plus petit
]

#warning[
  - Les timestamps de Lamport n'ordonnancent pas les messages immédiatement.
  - Ils assurent seulement qu'un ordre strict sera obtenu un jour.
]

= Exclusion mutuelle

== Problèmatique
Dans un système distribué, il est crucial de gérer l'accès concurrent aux ressources partagées. L'exclusion mutuelle garantit qu'une ressource ne peut être utilisée que par un seul processus à la fois, évitant ainsi les conflits et les incohérences.

#heigimg("S7/SDR/docs/img/image copy 5.png", "Exclusion mutuelle")

== Système centralisé
Un serveur centralisé gère les demandes d'accès aux ressources. Chaque processus doit demander la permission au serveur avant d'accéder à la ressource.

#heigimg("S7/SDR/docs/img/image copy 6.png", "Système centralisé")

#heigimg("S7/SDR/docs/img/image copy 7.png", "Système centralisé - exemple")

== Solution répartie
Chaque processus maintient une file d'attente des demandes d'accès aux ressources, ordonnée par les horloges logiques. Lorsqu'un processus souhaite accéder à une ressource, il envoie une demande à tous les autres processus et attend les réponses.

=== Version priority queue
#heigimg("S7/SDR/docs/img/image copy 8.png", "Solution répartie - priority queue")

*On request:*
- Push demandeur dans la file d'attente
- Réodonner la file d'attente par heure de Lamport
- Envoie un `ack` avec nouveau timestamp

*On release:*
- Pop tête de file
- Entrer en section critique
  - Si je suis la nouvelle tête et que j'ai reçus tous les `acks`

=== Version tableau
#heigimg("S7/SDR/docs/img/image copy 9.png", "Solution répartie - version tableau")

Chaque processus maintient un tableau des derniers messages reçus ainsi qu'un timestamp pour chaque message, par exemple `(REQ, id)`.

== Propriétés de l'algorithme Lamport
- *Correctness*: Un seul processus peut être en section critique à la fois.
- *Progrès*: Toute demande d'entrée en SC sera autorisée un jour.
- *Complexité*
  - Communication par SC par processus : $3n(n-1)$
  - Calcul par événement :
    - $O(n)$ par réception de message
    - $O(1)$ pour le reste.

= Mutex par jetons (Ricart & Agrawala)

On passe d'une approche à 3 messages:
- `REQ`: demande d'accès à la section critique
- `ACK`: autorisation d'accès à la section critique
- `REL`: libération de la section critique

#info[
  Ce que nous pouvons tirer comme conclusion est que nous sommes assez indirect dans notre approche. Ce que nous voulons est d'entrer en *section critique*.
]

Jusqu'à présent, nous avions 3 messages, hors, ce que l'on souhaite c'est demander d'entrer en section critique, une fois que l'on a *toutes* les autorisations, on entre en section critique, puis on libère la section critique. On en comprend donc que le message `REQ` est nécessaire, cependant on peut simplifier `ACK` et `REL` en un seul message `OK` qui autorise l'entrée en section critique.

#hint[
  En cherchant à limitier le nombre de messages, on peut penser à une approche par jetons.
]

== Amélioration
#heigimg("S7/SDR/docs/img/SCR-20251007-nlds.png", "Version améliorée")

Grâce à cette nouvelle approche, nous pouvons désomrmais $2(n-1)$ messages par processus pour entrer en section critique.

#himg("S7/SDR/docs/img/image copy 34.png", "Echanges de messages")

== Pseudo-code
#heigimg("S7/SDR/docs/img/image copy 10.png", "Variables du pseudo-code")
#heigimg("S7/SDR/docs/img/image copy 11.png", "Initialisation du pseudo-code")
#heigimg("S7/SDR/docs/img/image copy 12.png", "Fonctionnement du pseudo-code")
#heigimg("S7/SDR/docs/img/image copy 13.png", "Fonctionnement du pseudo-code - suite")

== Optimisation d'accès
Un autre point est que dans cette approche, si on récupère l'acces pour entrer en section critique, je peux en déduire que j'y ai accès tant que personne ne redemande l'accès.

#heigimg("S7/SDR/docs/img/image copy 14.png", "", width: 80%)

On peut voir cela un peu comme un jeton que l'on possède. Tant que l'on possède le jeton, on peut entrer en section critique.

== Propriétés
- *Correctness*: Jamais plus d'un processus dans la section critique.
- *Progress*: Toute demande d'entrée en section critique finit par être satisfaite.
- *Complexité de message*: $2(n-1)$ messages par entrée en section critique.

== Cas particulier
Dans le cas où un processus vient de sortir de SC et qu'il souhaite y rentrer à nouveau, il doit à nouveau envoyer des demandes à tous les autres processus, alors qu'en optimisant il pourrait directement s'y rendre à nouveau.

#heigimg("S7/SDR/docs/img/image copy 35.png", "",width: 80%)

= Carvalho & Roucairol

== Amélioration
On pourrait penser à modifier l'algorithme de Ricart & Agrawala en se disant: *Tant qu'on m'a pas redemandé l'accès, je peux y retourner directement sans redemander l'accès.*

Dès ce moment, on peut imaginer que chaque processus possède un jeton. Lorsqu'un processus souhaite entrer en section critique, il doit posséder le jeton. S'il ne le possède pas, il doit le demander au processus qui le possède.

On peut visualiser cet algorithme comme un graph ou chaque processus est un noeud, et entre chaques noeuds, il y a une arête qui représente le jeton.

#heigimg("S7/SDR/docs/img/image copy 36.png", "Visualisation graphe")

Lors-ce qu'un processus souhaite entrer en section critique, il envoie une demande aux noeuds voisins *dont il ne possède pas déjà le jeton*.

#himg("S7/SDR/docs/img/image copy 37.png", "Echanges de messages")

Une fois que le processus `A` a terminé sa section critique, il envoie le jeton au processus `B` qui lui a fait la demande. Une fois que `B` a terminé, si personne n'a demandé les jetons, il les garde.

#himg("S7/SDR/docs/img/image copy 38.png", "Libération du jeton")

Dans le cas où le processus `A` demande le jeton à `C` mais que `C` demande immédiatiement après avoir donné son jeton le jeton à `A` pour qu'il lui soit retourné à la fin de la section critique de `A`.

== Propriétés
- *Correctness*: Jamais plus d'un processus dans la section critique.
- *Progress*: Toute demande d'entrée en section critique finit par être satisfaite.
- *Complexité de communication*: Entre $0$ et $2(n-1)$ messages par entrée en section critique.

== Pseudo-code
#himg("S7/SDR/docs/img/image copy 39.png", "Variables du pseudo-code", width: 85%)
#himg("S7/SDR/docs/img/image copy 40.png", "Initialisation du pseudo-code", width: 85%)
#himg("S7/SDR/docs/img/image copy 41.png", "Fonctionnement du pseudo-code", width: 82%)
#himg("S7/SDR/docs/img/image copy 42.png", "Fonctionnement du pseudo-code - suite", width: 85%)
#himg("S7/SDR/docs/img/image copy 43.png", "Fonctionnement du pseudo-code - fin", width: 85%)

= Mutex par jeton unique

== Introduction
Jusqu'à maintenant, nous avons vu des algorithmes de synchronisation basés sur des horloges logiques et des demandes de permission. Cependant, une autre approche intéressante pour gérer l'accès à une section critique dans un système distribué est l'utilisation de jetons uniques.

*Petit rappel:*
- *Lamport*: horloge logique pour ordonner les événements
- *Ricart & Agrawala*: demande de permission à tous les processus avant d'entrer en section critique
- *Carvalho et Roucairol*: demande de permission à un sous-ensemble de processus (passage de témoin entre 2 processus)

== Algorithme par jeton
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

- *Efficacité*: S'il est équilibré, distance logarithmique
- *Simplicité*: Un seul chemin entre tous les points
- *Réalisme*: Les vrais réseaux sont rarement des cliques

#himg("S7/SDR/docs/img/image copy 26.png", "Approche avec un arbre")

Cette approche nous oblige à denouveau gérer de la communication entre les processus pour la demande et la libération du jeton.

=== Demande du jeton
Dans notre situation, `C` possède le jeton. `E` en fait la demande il prendra donc le chemin qui le mènera vers `C`. Chaque intermédiaire sur le chemin (ici `B`) va stocker la demande de `E` dans une file d'attente locale.

Au moment où `C` libère le jeton, il le transmet à `B` qui le transmettra à `E` (puisque c'est la première demande dans sa file d'attente) et chaque processus *inverse* le sens de son arc.

#info[
  Chaque noeud ne connaît que son parent et ses enfants. Lorsqu'un noeud reçoit le jeton, il le transmet au premier demandeur dans sa file d'attente. Donc `C` ne sait pas que `E` a fait la demande, il sait juste que `B` lui a demandé le jeton.
]

#himg("S7/SDR/docs/img/image copy 27.png", "Demande du jeton")

=== Demande multiple
Dans notre cas, si `D` et `A` viennent demander le jeton, `B` va simplement ajouter `A` à sa file d'attente. Lorsque `E` aura terminé, le jeton sera transmis à demandeur le plus ancien dans la file d'attente, ici `D`. *En transmettant le jeton à `D`, vu qu'une autre demande est en attente, `B` demandera le jeton à `D` pour le transmettre à `A`.*

#himg("S7/SDR/docs/img/image copy 28.png", "Demande multiple")

#warning[
  À l'exception des feuilles, cette approche rends notre réseau sensible aux pannes, car si un noeud intermédiaire tombe en panne, *tous ses descendants* sont isolés du reste de l'arbre.
]

=== Résumé
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
#himg("S7/SDR/docs/img/image copy 29.png", "Pseudo-code de l'algorithme de Raymond")
#himg("S7/SDR/docs/img/image copy 30.png", "Pseudo-code de l'algorithme de Raymond - suite")
#himg("S7/SDR/docs/img/image copy 31.png", "Pseudo-code de l'algorithme de Raymond - suite")
#himg("S7/SDR/docs/img/image copy 32.png", "Pseudo-code de l'algorithme de Raymond - suite")
#himg("S7/SDR/docs/img/image copy 33.png", "Pseudo-code de l'algorithme de Raymond - fin")

