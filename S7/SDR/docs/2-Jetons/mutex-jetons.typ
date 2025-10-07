#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: [
    Mutex par jetons
  ],
  lesson: "SDR",
  col: 1,
  doc,
)

= Amélioration de Lamport
On passe d'une approche à 3 messages:
- `REQ`: demande d'accès à la section critique
- `ACK`: autorisation d'accès à la section critique
- `REL`: libération de la section critique

#info[
  Ce que nous pouvons tirer comme conclusion est que nous sommes assez indirect dans notre approche. Ce que nous voulons est d'entrer en *section critique*.
]

== Amélioration
#heigimg("S7/SDR/docs/img/SCR-20251007-nlds.png", "Version améliorée")

Grâce à cette nouvelle approche, nous pouvons désomrmais $2(n-1)$ messages par processus pour entrer en section critique.


=== Pseudo-code
*Variables*
#heigimg("S7/SDR/docs/img/image copy 10.png", "Variables du pseudo-code")

*Initialisation*
#heigimg("S7/SDR/docs/img/image copy 11.png", "Initialisation du pseudo-code")

#heigimg("S7/SDR/docs/img/image copy 12.png", "Fonctionnement du pseudo-code")
#heigimg("S7/SDR/docs/img/image copy 13.png", "Fonctionnement du pseudo-code")

== Optimisation d'accès
Un autre point est que dans cette approche, si on récupère l'acces pour entrer en section critique, je peux en déduire que j'y ai accès tant que personne ne redemande l'accès.

#heigimg("S7/SDR/docs/img/image copy 14.png", "Optimisation d'accès")

On peut voir cela un peu comme un jeton que l'on possède. Tant que l'on possède le jeton, on peut entrer en section critique.