#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Algorithme Bully",
  course: "SDR - Systèmes Distribués et Repartis",
  author: "Guillaume Trüeb",
  date: "11 Novembre 2025",
  toc: true,
  col: 1,
  doc,
)

= Problème de l'élection
Dans un groupe de processus, chacun a une aptitude pas nécessairement statique. On souhaite élire un celui qui à la meilleure aptitude.

#info[
  Par *aptitude*, on entend une vleur numérique représentant la capacité d'un processus à assumer le rôle de coordinateur. Par exemple, cela peut être basé sur la puissance de calcul, la mémoire disponible, ou toute autre métrique pertinente pour le système distribué en question.
]

== Dans quel but?
- Algorithme à jeton : régénérer un jeton après perte
- Architecture manager/worker : désigner un nouveau manager
- Répartition de charge : sélectionner le serveur le moins chargé

== Propriétés souhaitées
- Sureté : un seul processus ne peut être élu
- Progrès : il doit y avoir un élu un jour
- Validité : l'élu doit être le participant correct à la plus grande aptitude
- Résilience :
  - Un processus en panne ne doit pas être élu, même s'il redémarre.
  - Si le réseau est scindé en deux, un élu doit exister par partition.

=== Différences avec une mutex
#himg("S7/SDR/docs/img/image copy 44.png", "Différence entre élection et mutex")

#hint[
La ou la mutex s'assure que tout le monde aura droit à son moment, l'élection sert uniquement à décider à qui attribuer un titre spécial d'_élu_.
]

= Algorithme Bully
== Idée générale
_Tout le monde doit tout savoir._

Chaque processus envoie son aptitude à tous les autres. Chaque processus reçoit donc les aptitudes de tous les autres. Le processus avec la plus grande aptitude s'auto-électe.

== Evénements
Dans cet algorithme, on considère 2 types d'événements :
#himg("S7/SDR/docs/img/image copy 45.png", "Événements dans l'algorithme Bully")

#warning[
  Si une élection est en cours quand une nouvelle est demandée, elle est différée à la fin de celle en cours.
]

== Performance
- *Communications* : O(n²) messages
- *Durée d'une élection* : Jusqu'à $4T$
 - $1T$ d'attente, $2T$ de timeout, $1T$ de transit


== Pseudo-code
#columns(2)[
#himg("S7/SDR/docs/img/image copy 46.png", "Pseudo-code de l'algorithme Bully")
#himg("S7/SDR/docs/img/image copy 47.png", "Suite du pseudo-code de l'algorithme Bully")
#himg("S7/SDR/docs/img/image copy 48.png", "Suite du pseudo-code de l'algorithme Bully")
#himg("S7/SDR/docs/img/image copy 49.png", "Suite du pseudo-code de l'algorithme Bully")
#colbreak()
#himg("S7/SDR/docs/img/image copy 50.png", "Suite du pseudo-code de l'algorithme Bully")
]

= Gestion des pannes
#info[
  Nous faisons la supposition qu'un processus ne tombe jamais en panne _pendant_ l'envoi de messages en batch. Soit il envoie tout, soit il n'envoie rien.
]

On suppose alors un _détecteur de panne_ chez les autres, surveillant l'élu:
 - Si je détecte une panne de l'élu, je lance une nouvelle élection.
Détecteur parfait ou un jour?
 - Un jour suffit : si suspicion annulée, relancer une élection.
 - En cas de faux positif, le même élu sera à nouveau choisit.