#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Résumé TE2",
  course: "SDR - Systèmes Distribués et Repartis",
  author: "Guillaume Trüeb",
  date: "02 décembre 2025",
  toc: false,
  col: 2,
  doc,
)

= Elections
Le principe d'élection dans un système distribué consiste à choisir un noeud particulier pour assumer un rôle spécifique, souvent celui de coordonnateur ou de leader. Cela est crucial pour assurer la cohérence et la coordination des actions dans le système.

== Aptitude
La notion d'aptitude fait référence à la capacité d'un noeud à remplir efficacement le rôle de leader. Les critères d'aptitude peuvent inclure la puissance de calcul, la disponibilité, la fiabilité, la connectivité du noeud ou d'autres facteurs pertinents.

Cela pourrait servir par exemple à:
- Algorithme à jeton : régénérer un jeton après perte
- Architecture manager/worker : désigner un nouveau manager
- Répartition de charge : sélectionner le serveur le moins chargé


== Propriétés des algorithmes d'élection
- *Sureté*: un seul leader est élu à un moment donné
- *Progrès*: il doit y avoir un élu un jour
- *Validité*: l'élu doit être un noeud valide du système avec la meilleure aptitude
- *Résilience*: 
 - Un processus en panne ne doit pas être élu
 - Si le réseau est partitionné, chaque partition doit pouvoir élire un leader

== Algorithme du Bully
=== Principe
L'algorithme du Bully peut-être résumé par: *j'envoie mon aptitude à tout le monde et tout le monde m'envoie la sienne. Celui qui a l'aptitude la plus élevée gagne*.

=== Étapes
Dans cet algorithme nous avons 2 étapes principales:

*Une élection commence*

Je broadcast mon aptitude.

J'attends $2T$ pour tout recevoir.

Je détermine l'élu

*Réception d'une aptitude*

Si je ne suis pas déjà en élection,

j'entre en élection

#warning[
  Pour que l'algorithme soit correct, il faut que l'on attende $1T$ avant de lancer une nouvelle élection aprés en terminé une.
]

=== Performance
- Messages: $O(n^2)$ dans le pire des cas
- Durée d'une élection: Jusqu'à $4T$ dans le pire des cas 
 - _1T d'attente, 2T de timeout, 1T de transit_

=== Gestion des pannes
Nous allons supposer que: _Un processus ne tombe jamais en panne pendant l'envoi de messages en batch. Soit il envoie tout, soit il n'envoie rien._

*Risque*: un noeud qui était en train de gagner tombe en panne.

*Solution*: un détecteur de panne (_un jour_) chez les autres qui relance une élection si le leader tombe en panne.

== Algorithme Chang et Roberts (sans pannes)
L'algorithme de Chang et Roberts peut être résumé par: *j'envoie mon aptitude dans un anneau. Si je reçois une aptitude plus grande, je la retransmets sinon j'envoie la mienne. Si je reçois la mienne, j'ai gagné*.

#image("../img/image copy 51.png")

=== Étapes
#image("../img/image copy 72.png")

#warning(title: "Demandes concurrentes")[
  Quand on est déjà en élection,
  - Si je reçois une aptitude plus basse, je l'ignore
  - (Sinon, l'algorithme normal s'applique)
]

=== Résumé
#image("../img/image copy 54.png")

=== Performances
*Communication*: $3N$ messages dans le pire des cas (N le nombre de nœuds dans l'anneau).
*Durée de l'élection*: $O(3 N T)$ pour $T$ la durée de transit max

== Algorithme Chang et Roberts (avec pannes)
Dans la version avec pannes, nous allons devoir gérer les cas où des nœuds tombent en panne pendant l'élection. Cela se fait au travers d'un mécanisme: *le mainteneur d'anneau*.

=== Mainteneur d'anneau
#image("../img/image copy 59.png")

=== Résumé
*Chaque processus a une estampille t.*

---

*Demande d'envoi au nième suivant*
- Incrémenter t
- Envoyer message et t au nième suivant dans l'anneau
- Lancer un timer, dont le timeout
 - Demande l'envoi du message au (n+1)ième suivant.

*Réception d'un message*
- Notifier de la réception
- Répondre `ACK` avec `t_i`

*Réception de `ACK` avec `t_i`*
- Annuler le timeout associé à `t_i`

=== Gérer les pannes
Imaginons que le procesus allant gagner l'élection tombe en panne, le message transitant sur le réseau n'ayant que l'ID du gagnant, l'élection ne s'arrêtera jamais et tombera en famine.

*Solution*: chaque message d'élection contient la liste des nœuds déjà visités. Si un nœud reçoit un message d'élection et qu'il se trouve dans la liste, il sait que le message a fait un tour complet, il peut donc élire le nœud avec la plus grande aptitude parmi ceux de la liste. Une fois l'élu déterminé, le noeud l'ayant choisi relance un message en transmettant l'id du processus élu et une liste vide ou chaque nœud ajoute son id pour confirmer la réception du message.

#warning[
  Si je reçois le message de validation et que je ne suis pas en élection, je relance l'élection sauf si le résultat correspond déjà à l'élu que j'ai en mémoire.
]

*Election*:
```json
[
  {id: 3, aptitude: 5},
  {id: 5, aptitude: 8},
  {id: 2, aptitude: 3},
  //etc..
]
```

*Validation*:
```json
{
  elected: 5,
  validators: [3,2,7,9]
}
```

Et si celui qui va être élu tombe en panne après l'envoi d'un résultat ?
- _Il sera élu ! C'est ensuite qu'un détecteur de panne le verra et relancera une élection._

Et si celui qui va être élu tombe en panne après l'envoi d'une annonce ?
- _Il sera élu ! C'est ensuite qu'un détecteur de panne le verra et relancera une élection._

Et si celui qui va être élu tombe en panne après l'envoi d'une annonce, mais réapparait avant la réception du résultat ?
- _Il sera élu ! Et personne ne l'aura remarqué !_

Et si on enlevait la supposition qu'un transit dure moins de T unités de temps ?
- _On risque d'élire un processus dont l'aptitude n'est pas la plus grande._

#image("../img/image copy 61.png")

= Sondes et echos

== Principe
La programmation par sondes et echos est un modèle de communication asynchrone permettant à un processus d'échanger avec tous les autres processus du réseau.

== Phases
*Diffusion*: Le processus source envoie une sonde à tous ses voisins directs.

#columns(2)[
  #image("../img/image copy 66.png", width: 100%)
  #colbreak()
  #image("../img/image copy 67.png", width: 100%)
]

*Contraction*: Chaque processus renvoie un echo au processus qui lui a envoyé la sonde.

#columns(2)[
  #image("../img/image copy 68.png", width: 100%)
  #colbreak()
  #image("../img/image copy 69.png", width: 100%)
]

== Application sur un arbre
Dans un arbre, pas de risque de boucle car chaque noeud n'a qu'un seul parent.

*Réception d'une sonde*
- Propager aux enfants
- Si pas d'enfants → envoyer echo au parent

*Réception d'un echo*
- Si tous les echos reçus → envoyer echo au parent
- Si source → terminé

== Interface
#image("../img/image copy 71.png", width: 90%)

== Graphes arbitraires
Risque de boucle → modification de l'algorithme:

*Réception d'une sonde*
- *Si déjà connue* → arrêter d'attendre l'écho de ce voisin
- Sinon → propager normalement

*Réception d'un echo*
- Si tous les echos *attendus* reçus → envoyer echo au parent

== Sources multiples
Plusieurs noeuds peuvent initier des sondes simultanément. Chaque sonde doit avoir un *identifiant unique* (combinaison ID source + compteur local, ex: "A-1", "A-2").

== Comportements des noeuds
*Source*: Envoie sondes aux enfants → attend tous les echos → terminé

*Noeud intermédiaire*: Attend sonde du parent → propage aux enfants → attend tous les echos → envoie echo au parent

*Feuille*: Attend sonde du parent → envoie immédiatement echo au parent
