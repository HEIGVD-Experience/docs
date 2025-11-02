#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Mutex par jetons",
  course: "SDR - Systèmes Distribués et Repartis",
  author: "Guillaume Trüeb",
  date: "13 octobre 2025",
  toc: true,
  col: 1,
  doc,
)

= Ricart & Agrawala
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
#columns(2)[
  #heigimg("S7/SDR/docs/img/image copy 10.png", "Variables du pseudo-code")
  #heigimg("S7/SDR/docs/img/image copy 11.png", "Initialisation du pseudo-code")
  #heigimg("S7/SDR/docs/img/image copy 12.png", "Fonctionnement du pseudo-code")
  #heigimg("S7/SDR/docs/img/image copy 13.png", "Fonctionnement du pseudo-code")
]

== Optimisation d'accès
Un autre point est que dans cette approche, si on récupère l'acces pour entrer en section critique, je peux en déduire que j'y ai accès tant que personne ne redemande l'accès.

#heigimg("S7/SDR/docs/img/image copy 14.png", "Optimisation d'accès", width: 80%)

On peut voir cela un peu comme un jeton que l'on possède. Tant que l'on possède le jeton, on peut entrer en section critique.

== Propriétés
- *Corectness*: Jamais plus d'un processus dans la section critique.
- *Progress*: Toute demande d'entrée en section critique finit par être satisfaite.
- *Complexité de message*: $2(n-1)$ messages par entrée en section critique.

== Cas particulier
Dans le cas où un processus vient de sortir de SC et qu'il souhaite y rentrer à nouveau, il doit à nouveau envoyer des demandes à tous les autres processus, alors qu'en optimisant il pourrait directement s'y rendre à nouveau.

#heigimg("S7/SDR/docs/img/image copy 35.png", "Cas particulier", width: 80%)

= Carvalho & Roucairol
== Amélioration
On pourrait penser à modifier l'algorithme de Ricart & Agrawala en se disant: *Tant qu'on m'a pas redemandé l'accès, je peux y retourner directement sans redemander l'accès.*

Dès ce moment, on peut imaginer que chaque processus possède un jeton. Lorsqu'un processus souhaite entrer en section critique, il doit posséder le jeton. S'il ne le possède pas, il doit le demander au processus qui le possède.

On peut visualiser cet algorithme comme un graph ou chaque processus est un noeud, et entre chaques noeuds, il y a une arête qui représente le jeton.

#heigimg("S7/SDR/docs/img/image copy 36.png", "Echanges de messages")

Lors-ce qu'un processus souhaite entrer en section critique, il envoie une demande aux noeuds voisins *dont il ne possède pas déjà le jeton*.

#himg("S7/SDR/docs/img/image copy 37.png", "Echanges de messages")

Une fois que le processus `A` a terminé sa section critique, il envoie le jeton au processus `B` qui lui a fait la demande. Une fois que `B` a terminé, si personne n'a demandé les jetons, il les garde.

#himg("S7/SDR/docs/img/image copy 38.png", "Echanges de messages")

Dans le cas où le processus `A` demande le jeton à `C` mais que `C` demande immédiatiement après avoir donné son jeton le jeton à `A` pour qu'il lui soit retourné à la fin de la section critique de `A`.

== Propriétés
- *Correctness*: Jamais plus d'un processus dans la section critique.
- *Progress*: Toute demande d'entrée en section critique finit par être satisfaite.
- *Complexité de communication*: Entre $0$ et $2(n-1)$ messages par entrée en section critique.

== Pseudo-code
#columns(2)[
  #himg("S7/SDR/docs/img/image copy 39.png", "Variables du pseudo-code", width: 85%)
  #himg("S7/SDR/docs/img/image copy 40.png", "Initialisation du pseudo-code", width: 85%)
  #himg("S7/SDR/docs/img/image copy 41.png", "Fonctionnement du pseudo-code", width: 82%)
  #himg("S7/SDR/docs/img/image copy 42.png", "Fonctionnement du pseudo-code", width: 85%)
  #himg("S7/SDR/docs/img/image copy 43.png", "Fonctionnement du pseudo-code", width: 85%)
]