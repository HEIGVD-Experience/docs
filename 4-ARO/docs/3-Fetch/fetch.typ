#import "../../../_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Fetch
  ],
  lesson: "ARO",
  chapter: "3 - Fetch",
  definition: "La documentation suivante traite du fonctionnement du registre de compteur de programme (PC) dans les architectures informatiques. Elle explique comment le PC stocke l'adresse de l'instruction en cours d'exécution, comment il est incrémenté et géré lors de sauts inconditionnels ou conditionnels. De plus, elle aborde la gestion des sauts, des interruptions et des vecteurs d'interruption dans les processeurs.",
  col: 1,
  doc,
)

= Opération FETCH
L'opération de fetch (récupération) dans un processeur consiste à récupérer l'instruction suivante depuis la mémoire, en utilisant l'adresse stockée dans le compteur de programme (PC). Cette instruction est ensuite placée dans le registre d'instruction (IR) pour être décodée et exécutée ultérieurement.

= Program Counter (PC)
Le programme counter (PC) est un registre qui contient l'adresse de l'instruction courante à éxécuter. Il est incrémenté à chaque instruction pour passer à l'instruction suivante *sauf si un saut est effectué*.

== Incrémenter le PC
La valeur de l’incrément correspond au nombre de bytes de l’instruction, indépendamment du bus d’adresses! 
#table(
  columns: (1fr, 1fr),
  table.header(
    [*Code d'instruction*], [*Incrément*]
  ),
  "8 bits = 1 byte", "1",
  "16 bits = 2 bytes", "2",
  "32 bits = 4 bytes", "4",
)

#image("../../../_src/img/docs/image copy 7.png")

== Adresse suivante avec un saut
Dans le cas ou un saut doit être réalisé l'incrément de l'adresse est quand même réalisé sauf que celle-ci n'est pas insérée dans le PC à la place on viendra y insérer l'adresse de la prochaine instruction suite au saut.

#image("../../../_src/img/docs/image copy 8.png")

= Gestion des sauts
Les sauts sont des instructions qui permettent de modifier le PC pour exécuter une instruction à une adresse différente de celle suivante. Il existe plusieurs types de sauts:
== Déclanché par une instruction
- Saut inconditionnel
 - Exemple : Retour au début d’un programme
- Saut conditionnel
 - Exemple : Exécution d’une boucle 
- Appel de fonction
== Déclanché matériellement
- Interruption
- Exception

== Saut inconditionnel
#image("../../../_src/img/docs/image copy 9.png")
L'opcode pour un saut inconditionnel prends 5 bits et le reste est alloué pour donner l'adresse de la prochaine instruction à exécuter.
=== Calcul de l'adresse de saut
Pour calculer l'adresse de saut il suffit d'utiliser la formule suivante : 
$
"Adr" = "PC" + "extension_16bits"("offset"_11 * 2) + 4
$
#table(
  columns: (0.5fr, 1fr),
  table.header(
    [*Code d'instruction*], [*Incrément*]
  ),
  "Adr", "Adresse finale du saut",
  "PC", "Adresse de l'instruction courante",
  "Extension 16 bits", "Extension de l'adresse de saut en y ajoutant la valeur du bit de signe",
  "Offset","Correspond à l'instruction moins les 5 bits de l'opcode",
  "4", "Valeur en fixe à ajouter à l'adresse de saut"
)

== Saut conditionnel
#image("../../../_src/img/docs/image copy 10.png")
Pour calculer l'adresse de saut il suffit d'utiliser la formule suivante *attention elle est légèrement différente de celle pour le saut inconditionnel* : 
$
"Adr" = "PC" + "extension_16bits"("offset"_8 * 2) + 4
$
#colbreak()
=== Gestion de la condition
#image("../../../_src/img/docs/image copy 11.png")

= Interruption
Les interruptions sont des signaux envoyés par des périphériques pour signaler un événement. Lorsqu'une interruption est reçue, le processeur suspend l'exécution du programme en cours et exécute une routine de traitement de l'interruption. Une fois la routine terminée, le processeur reprend l'exécution du programme interrompu. Il existe plusieurs type d'interruption:

- *Interruption par périphériques*
 - timer, clavier, entrées /sorties (port série, parallèle, USB, disques, ….)
- *Erreurs systèmes*
  - division par zéro, dépassement de capacité, protection mémoire, ...
- *Interruption processeur (IPI)*
 - interruption par un autre processeur (système multi-processeurs)

== Gestion des interruptions
Il existe 5 modes de gestion des interruptions:
- Sans interruption (scrutation)
- Interruptions multi-sources sans identification de la source
- Interruptions multi-sources avec identification de la source
- Interruptions chaînées
- Interruptions imbriquées

=== Scrutation
Le processeur scrute périodiquement l’état des périphériques pour savoir s’ils ont besoin de son intervention. Cette méthode est simple mais consomme beaucoup de ressources.

=== Interruptions multi-sources sans identification de la source
Les interruptions sont gérées par un seul vecteur d’interruption. Le processeur doit interroger chaque périphérique pour savoir lequel a généré l’interruption.
#image("../../../_src/img/docs/image copy 12.png")

#colbreak()

=== Interruptions multi-sources avec identification de la source
Chaque périphérique possède un vecteur d’interruption. Le processeur interroge chaque périphérique pour savoir lequel a généré l’interruption.
#image("../../../_src/img/docs/image copy 13.png")

=== Interruptions chaînées
Les adresses des interruptions sont stockées dans une pile de stockage (stack) puis déplié au fur et à mesure de l'exécution des routines d'interruption.
#image("../../../_src/img/docs/image copy 14.png")

#colbreak()

=== Interruptions imbriquées
Les interruptions sont gérées par un contrôleur d’interruption qui attribue une priorité à chaque interruption. Lorsqu’une interruption est reçue, le contrôleur d’interruption détermine si elle doit être traitée ou non.
#image("../../../_src/img/docs/image copy 15.png")

= Vecteur d'interruption
Moyen technique pour attacher une routine d’interruption (ISR) à une requête d’interruption (IRQ). Le vecteur d’interruption est une table qui contient l’adresse de la routine d’interruption associée à chaque requête d’interruption. Lorsqu’une interruption est reçue, le processeur consulte le vecteur d’interruption pour connaître l’adresse de la routine d’interruption à exécuter.

== Calculer l'adresse du vecteur d'interruption
$
"Adresse vecteur" = "Adresse base" + ("No de l’interruption" * "Nbre bytes du bus d’instruction")
$