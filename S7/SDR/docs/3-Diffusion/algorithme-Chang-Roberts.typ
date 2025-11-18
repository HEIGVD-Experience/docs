#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Algorithme Chang et Roberts",
  course: "SDR - Systèmes Distribués et Repartis",
  author: "Guillaume Trüeb",
  date: "18 Novembre 2025",
  toc: true,
  col: 1,
  doc,
)

= Chang et Roberts
== Définition
L'algorithme de Chang et Roberts est un protocole de sélection d'un leader dans un anneau orienté d'ordinateurs. Chaque nœud a un identifiant unique. Le but est que tous les nœuds conviennent d'un seul leader, celui avec l'identifiant le plus élevé.

== Fonctionnement
#columns(2)[

  Le processus A démarre une élection en envoyant un message contenant son identifiant ainsi que son aptitude au noeud suivant dans l'anneau. Chaque nœud qui reçoit un message d'élection compare l'identifiant dans le message avec le sien:
  - Si l'identifiant dans le message est plus grand que le sien, il transmet le message au nœud suivant.
  - Si l'identifiant dans le message est plus petit que le sien, il remplace l'identifiant dans le message par le sien et transmet le message.

  #colbreak()

  #himg("S7/SDR/docs/img/image copy 51.png", "Démarrage d'une élection")
]

#himg("S7/SDR/docs/img/image copy 52.png", "Propagation des messages d'élection")

`D`est donc le noeud étant élu comme leader.

#colbreak()

== Cas de concurrence
Dans le cas où plusieurs demande d'éléctions sont lancées simultanément, l'algorithme gère cela grâce à une règle simple qui est : 

*Quand je suis déjà en cours d'élection,*
#figure[
- *Si je reçois une aptitude plus basse, je l'ignore*
- (Sinon l'algorithme continue comme d'habitude)
]

#himg("S7/SDR/docs/img/image copy 53.png", "Gestion des élections concurrentes")

(B demande une éléction, puis A en demande une autre juste après)

== Résumé
#himg("S7/SDR/docs/img/image copy 54.png", "Résumé de l'algorithme de Chang et Roberts", width: 80%)

#colbreak()

== Performances
*Communication*: $3N$ messages dans le pire des cas (N le nombre de nœuds dans l'anneau).
*Durée de l'élection*: $O(3 N T)$ pour $T$ la durée de transit max

== Pseudo-code
#himg("S7/SDR/docs/img/image copy 55.png", "Pseudo-code de l'algorithme de Chang et Roberts", width: 75%)
#himg("S7/SDR/docs/img/image copy 56.png", "Suite du pseudo-code de l'algorithme de Chang et Roberts", width: 75%)
#himg("S7/SDR/docs/img/image copy 57.png", "Fin du pseudo-code de l'algorithme de Chang et Roberts", width: 75%)
#himg("S7/SDR/docs/img/image copy 58.png", "Fin du pseudo-code de l'algorithme de Chang et Roberts", width: 75%)

= Chang et Roberts - avec pannes
== Gérer l'anneau avec pannes
Pour gérer ce cas, nous allons ajouter un module `Maintenance d'anneau` qui va permettre de détecter les nœuds défaillants et de réajuster l'anneau en conséquence. L'anneau aura pour rôle de transmettre les messages d'élection et de leader, tandis que le module de maintenance d'anneau s'occupera de la détection des pannes et de la réorganisation de l'anneau.

=== Suppositions
- Pas de perte de messages.
- Pas de duplication de messages.
- Pas de changement d'ordre de messages.
- Une panne peut être récupérable.
- Durée de transit maximale bornée par une constante T.
- Durées de traitement négligeables.
- Chaque processus connait tous les autres.

== Gestion de l'absence du voisin
#himg("S7/SDR/docs/img/image copy 59.png", "Détection de la panne du nœud B par A", width: 75%)

== Résumé
#himg("S7/SDR/docs/img/image copy 60.png", "Résumé de l'algorithme de Chang et Roberts avec pannes", width: 75%)

== Risque de famine
Dans le cas où le noeud ayant la plus haute aptitude tombe en panne après avoir communiqué son aptitude mais avant d'avoir été élu leader, il y a un risque de famine. En effet, aucun autre nœud n'aura une aptitude plus haute et l'élection ne pourra jamais se terminer et tournera en boucle infinie.

== Solutions au risque de famine
Pour gérer ce risque, nous pouvons approcher le problème en signant le passge du message d'élection. Chaque nœud ajoute sa signature ainsi que son aptitude au message lorsqu'il le transmet. Ainsi, si un nœud reçoit un message d'élection qu'il a déjà signé, il sait que le message a fait un tour complet de l'anneau.

Une fois que le message a fait un tour complet, un nouveau message est transmis en mettant l'id du processus avec la plus haute aptitude et un tableau devant contenir les noeuds validant acceptant le résultat.

#warning[
  - Si je reçois un résultat que j'ai accepté, il a fait le tour et je ne le propage pas.
  - Si je reçois un résultat que je n'ai pas accepté et que je ne suis pas en élection, alors je n'y ai pas participé et je relance l'élection (sauf si mon élu est déjà le bon).
]

== Résumé
#himg("S7/SDR/docs/img/image copy 61.png", "Résumé de l'algorithme de Chang et Roberts avec pannes et gestion du risque de famine", width: 75%)

== Pseudo-code
#himg("S7/SDR/docs/img/image copy 62.png", "Pseudo-code de l'algorithme de Chang et Roberts avec pannes et gestion du risque de famine", width: 75%)
#himg("S7/SDR/docs/img/image copy 63.png", "Suite du pseudo-code de l'algorithme de Chang et Roberts avec pannes et gestion du risque de famine", width: 75%)
#himg("S7/SDR/docs/img/image copy 64.png", "Fin du pseudo-code de l'algorithme de Chang et Roberts avec pannes et gestion du risque de famine", width: 75%)
#himg("S7/SDR/docs/img/image copy 65.png", "Fin du pseudo-code de l'algorithme de Chang et Roberts avec pannes et gestion du risque de famine", width: 75%)