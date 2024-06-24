#import "/_settings/typst/template-te.typ": *

#show: resume.with(
  "Résumé ARO - Examen",
  "Guillaume Trüeb",
  cols: 2
)

== Taille mot mémoire
La taille d'un mot mémoire est forcément un multiple de $8$. C'est pourquoi nous pouvons appliquer le tableau suivant :
#image("/_src/img/docs/image.png")

== Gestion des adresses
En fonction de la taille de la mémoire nous aurons une taille d'adresses variables, le tableau suivant représente les possibilités : 
#image("/_src/img/docs/image2.png")

== Calculer la mémoire
=== Calculer adresse de fin
$
"Adr.Fin" = "Adr.Deb" + "Taille" - 1
$

=== Calculer adresse de début
$
"Adr.Deb" = "Adr.Fin" - "Taille" + 1
$

=== Calculer la taille
$
"Taille" = "Adr.Fin" - "Adr.Deb" + 1
$

==== Autre formule
$
"Taille" = 1 << log_2(2^n)
$
$n =$ le nombre de bits alloué à la zone mémoire
Exemple : $2"KB" = 2^10 * 2^1 = 2^11$ donc $n = 11$

== Saut inconditionnel
#image("/_src/img/docs/image copy 9.png")
L'opcode pour un saut inconditionnel prends 5 bits et le reste est alloué pour donner l'adresse de la prochaine instruction à exécuter.
=== Calcul de l'adresse de saut
Pour calculer l'adresse de saut il suffit d'utiliser la formule suivante : 
$
"Adr" = "PC" + "extension_16bits"("offset"_11 * 2) + 4
$
#table(
  columns: (0.5fr, 1fr),
  [*Code d'instruction*], [*Incrément*],
  "Adr", "Adresse finale du saut",
  "PC", "Adresse de l'instruction courante",
  "Extension 16 bits", "Extension de l'adresse de saut en y ajoutant la valeur du bit de signe",
  "Offset","Correspond à l'instruction moins les 5 bits de l'opcode",
  "4", "Valeur en fixe à ajouter à l'adresse de saut"
)

== Saut conditionnel
#image("/_src/img/docs/image copy 10.png")
Pour calculer l'adresse de saut il suffit d'utiliser la formule suivante *attention elle est légèrement différente de celle pour le saut inconditionnel* : 
$
"Adr" = "PC" + "extension_16bits"("offset"_8 * 2) + 4
$

#colbreak()

== Instructions
#table(
  align: center + horizon,
  columns: (0.5fr, 1fr),
  rows: 10pt,
  [*Mnemonic*],[*Instruction*],
  "ADC","Add with Carry",
  "ADD","Add",
  "AND","AND",
  "ASR","Arithmetic Shift Right",
  "B","Uncoditional Branch",
  "Bxx","Conditional Branch",
  "BIC","Bit Clear",
  "BL","Branch and Link",
  "BX","Branch and Exchange",
  "CMN","Compare NOT",
  "CMP","Compare",
  "EOR","XOR",
  "LDMIA","Load Multiple",
  "LDR","Load Word",
  "LDRB","Load Byte",
  "LDRH","Load Halfword",
  "LSL","Logical Shift Left",
  "LDSB","Load Sign-Extended Byte",
  "LDSH","Load Sign-Extended Halfword",
  "LSR","Logical Shift Right",
  "MOV","Move Register",
  "MUL","Multiply",
  "MVN","Move NOT(Register)",
  "NEG","Negate (" + $*-1$ + ")",
  "ORR","OR",
  "POP","Pop Register",
  "PUSH","Push Register",
  "ROR","Rotate Right",
  "SBC","Subtract with Carry",
  "STMIA","Store Multiple",
  "STR","Store Word",
  "STRB","Store Byte",
  "STRH","Store Halfword",
  "SWI","Software Interrupt",
  "SUB","Subtract",
  "TST","Test Bits",
)

#table(
  columns: (1fr, 1fr, 1fr),
  [*Décimal*], [*Héxadécimal*], [*Binaire*],
  "0", "0", "0000",
  "1", "1", "0001",
  "2", "2", "0010",
  "3", "3", "0011",
  "4", "4", "0100",
  "5", "5", "0101",
  "6", "6", "0110",
  "7", "7", "0111",
  "8", "8", "1000",
  "9", "9", "1001",
  "10", "A", "1010",
  "11", "B", "1011",
  "12", "C", "1100",
  "13", "D", "1101",
  "14", "E", "1110",
  "15", "F", "1111"
)

== Incrémenter le PC
#table(
  columns: (1fr, 1fr),
  [*Code d'instruction*], [*Incrément*],
  "8 bits = 1 byte", "1",
  "16 bits = 2 bytes", "2",
  "32 bits = 4 bytes", "4",
)

#colbreak()

== Registres spéciaux
#table(
  columns: (0.5fr, 1fr),
  [*Registre*], [*Objectif*],
  "R13 / R5", "Stack Pointer (SP) " + sym.arrow + " Stocke la position dans la pile de stockage (interruptions chaînées)",
  "R14 / R6", "Link Register (LR) " + sym.arrow + "Garde l’adresse de retour (appel de fct, interruption)",
  "R15 / R7", "Program Counter (PC) " + sym.arrow + "Stocke l’adresse de la prochaine instruction",
)
Lors d'une interruption on stocke la valeur actuelle du PC dans le LR et on met la valeur de l'adresse de l'interruption dans le PC.

== Puissance de 2
#table(
  columns: (1fr, 1fr),
  [*Puissance de 2*], [*Résultat*],
  $2^0$, "1",
  $2^1$, "2",
  $2^2$, "4",
  $2^3$, "8",
  $2^4$, "16",
  $2^5$, "32",
  $2^6$, "64",
  $2^7$, "128",
  $2^8$, "256",
  $2^9$, "512",
)


= Pipeline
== Découpage des instructions
Découpage d’une instruction
- *Fetch* : Recherche d’instruction 
- *Decode* : Décodage instruction & lecture registres opérandes
- *Execute* : Exécution de l’opération / calcul adresse mémoire 
- *Memory* : Accès mémoire / écriture PC de l’adresse de saut 
- *Write back* : Écriture dans un registre du résultat de l’opération

== Calcul de métriques
=== Formule séquentielle vs pipeline
$
T_e &= "temps de passage à chaque étape" \
T_p = n * T_e &= "temps de passage pour n étapes" \
T_t = m * T_p &= "temps total pour m personnes" \ \

T_t &= n * m * T_e
$

=== Formule pipeline
$
T_t = n * T_e + (m - 1) * T_e
$

=== Nombre de cycles d'horloges
$
T_t / T_e = n + m - 1
$

=== Débit
Nombre d’opérations (tâches, instructions) exécutées par unités de temps.
#image("/_src/img/docs/image copy 43.png")

=== Latence
Temps écoulé entre le début et la fin d’exécution de la tâche (instruction).
#image("/_src/img/docs/image copy 42.png")

=== IPC
Instructions Per Cycle : nombre d’instructions exécutées par cycle d’horloge.
$
"IPC" = 1 / ("ratio instruction sans arret" * 1 + "ratio instruction avec arret" * ("nb opération"))
$

=== Accélération
Accélération: nombre de fois plus vite qu’en séquentiel.
$
A = frac(T_s, T_p) = frac(m * n * T_e, (n + m - 1) * T_e) = frac(m * n, n + m -1) " " ~ " " n " (pour m très grand)"
$

- $T_t$ : temps total
- $m$ : nombre d'instructions fournies au pipeline
- $n$ : nombre d'étages du pipeline (MIPS, ARM = 5)
- $T_e$ : temps de cycle d'horloge ($= 1 / "Fréquence horloge"$)

#linebreak()

#image("/_src/img/docs/image copy 91.png")

#colbreak()

= Pipelining aléas
== Résolution d'aléas
Arrêt de pipeline (hardware/software)

*Hardware* : Arrêter le pipeline (stall/break) -> dupliquer les opérations bloquées.
*Software* : Insérer des NOPs (no operation).
== Sans forwarding
Les règles de gestion des aléas sont les suivantes :
- Si l'instruction dépend d'une *valeur calculée par une instruction précédente* (RAW) nous devons attendre que l'opération *write-back soit terminée*.
- Dans le cas ou nous avons des dépendances de données (WAW ou WAR) cela n'impacte pas le pipeline.
*Attention* dans le cas d'aléas structurels, nous ne pouvons pas faire d'opération *Memory Access (M)* et *Fetch (F)* en même temps.
== Avec forwarding
#image("/_src/img/docs/image copy 90.png")
Les règles de gestion des aléas sont les suivantes :
- Si l'instruction suivante dépend d'une valeur calculée par une instruction précédente, la valeur sera directement disponible dans le bloc *Execute*.
- Si un *LOAD* est fait, la valeur sera accesible directement après le bloc *Memory* dans le bloc *Execute*, donc pas besoin d'attendre jusqu'au bloc *Write Back*.
#image("/_src/img/docs/image copy 92.png")

= Taxonomie de Flynn
Classification basée sur les notions de flot de contrôle

- 2 premières lettres pour les instructions, I voulant dire Instruction, S - Single et M - Multiple
- 2 dernières lettres pour le flot de données avec D voulant dire Data, S – Single et M - Multiple

#image("/_src/img/docs/image copy 39.png")

== SISD
Machine SISD (Single Instruction Single Data) = Machine de «Von Neuman».
- Une seule instruction exécutée et une seule donnée (simple, non‐structurée) traitée.

== SIMD
Plusieurs types de machine SIMD : parallèle ou systolique.
- En général l'exécution en parallèle de la même instruction se fait en même temps sur des processeurs différents (parallélisme de donnée synchrone).
== MISD
Exécution de plusieurs instructions en même temps sur la même donnée.

== MIMD
Machines multi-processeurs où chaque processeur exécute son code de manière asynchrone et indépendante.
- S’assurer la cohérence des données,
 - Synchroniser les processeurs entre eux, les techniques de synchronisation dépendent de l'organisation de la mémoire.