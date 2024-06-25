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

== Endianess
- *Big Endian*: lecture de gauche à droite
- *Little Endian*: lecture de droite à gauche

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

= Réels

== Standard IEEE 754 (virgule flottante)

=== Binary8 (quarter precision)
- nombre de bits : 8
- exposant sur 4 bits
- mantisse sur 3 bits
- biais : 7 ($2^(4-1) - 1$)

=== Binary16 (half precision)
- nombre de bits : 16
- exposant sur 5 bits
- mantisse sur 10 bits
- biais : 15 ($2^(5-1) - 1$)

=== Binary32 (simple precision)
- nombre de bits : 32
- exposant sur 8 bits
- mantisse sur 23 bits
- biais : 127 ($2^(8-1) - 1$)

== Décimal vers binaire (float)
1. Partie entière : conversion de la partie entière en binaire
2. Partie décimale : conversion de la partie décimale en binaire en utilisant le tableau ci-dessous
#table(
  columns: (1fr, 1fr),
  [*Binaire*], [*Valeur*],
  $0.1$, $2^(-1) = 1/2^1 = 0.5$,
  $0.01$, $2^(-2) = 1/2^2 = 0.25$,
  $0.001$, $2^(-3) = 0.125$,
  $0.0001$, $2^(-4) = 0.0625$,
  $0.00001$, $2^(-5) = 0.03125$,
  $0.000001$, $2^(-6) = 0.015625$,
)

== Binaire IEEE754 vers décimal (ex sur 32 bits)
1. Signe : le premier bit est le signe
2. Exposant : les 8 bits suivants sont l'exposant
3. Mantisse : les 23 bits suivants sont la mantisse

== Règles importantes
- Si l'exposant est à 0 ou hors de la plage $2^(k-1) - 1$ à $2^(k-1)$ pour $k$ le nombre de bits de l'exposant, alors le nombre est un nombre non-normalisé.


#pagebreak()

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

=== Latence
Temps écoulé entre le début et la fin d’exécution de la tâche (instruction).

$ n * 1 / "Frequence (temps de cycle)" $

==== Exemple
Frequence = 1 GHz / 1 instruction par nanoseconde / $10^(-9)$
$n$ = nombre d'étapes = 5
$ "Latence" = 5 * 1 / 10^(9) = 5 / 10^(9) = 5 * 10^(-9) = 5 "ns" $

=== Débit
Nombre d’opérations (tâches, instructions) exécutées par unités de temps.
==== Sans pipeline
$ 1 / "Latence" $

==== Avec pipeline
$ 1 / "Frequence (temps de cycle)" $

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
 - *Attention*: si le nombre d'instruction est *très grand*, il sera égal au nombre d'étages du pipeline.
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
- Une seule instruction exécutée et une seule donnée (simple, non-structurée) traitée.

== SIMD
Plusieurs types de machine SIMD : parallèle ou systolique.
- En général l'exécution en parallèle de la même instruction se fait en même temps sur des processeurs différents (parallélisme de donnée synchrone).
== MISD
Exécution de plusieurs instructions en même temps sur la même donnée.

== MIMD
Machines multi-processeurs où chaque processeur exécute son code de manière asynchrone et indépendante.
- S’assurer la cohérence des données,
 - Synchroniser les processeurs entre eux, les techniques de synchronisation dépendent de l'organisation de la mémoire.

#colbreak()

= Memoire cache
== Calcul accès mémoire
=== Calcul temps moyenne d’accès
Temps moyenne d’accès a mem = $T_"MAM"$

$T_"MAM" = T_"succes" + (1 - H) * T_"penal"$

$H = "fréquence de succès"$

=== Fréquence de succès
- Dépend de la taille de la cache et des politiques de placement
- Miss penalty >> Hit time

#table(
  columns: (0.5fr, 1fr, 1fr),
  [], [*Rate*], [*Time*],
  "Cache Hit", "Hit rate =Nombre de hits/Nombre d’accès", "Temps d’accès à la cache (hit time)",
  "Cache Miss", "1 - Hit rate", "Temps d’accès à la mémoire principale + temps de chargement cache (miss penalty)"
)

== Recherche dans le cache
Consiste à trouver quelle est la ligne de cache dont le tag correspond à l’adresse de base demandée au répertoire.

*3 stratégies (cablées, non logicielles)* :
1. Fully Associative – Complètement associative
2. Direct Mapped – Associative par ensembles
3. Set Associative – Associative par voies

=== Fully Associative
#columns(2)[
- un mot de la mémoire principale peut être stocké n’importe où dans la cache
- Avantages : taux de succès très élevé (pas de conflit)
- Désavantages : trop lent (séquentiel, toutes les lignes à regarder)
#colbreak()
#image("/_src/img/docs/image copy 79.png")
]

=== Direct Mapped
#columns(2)[
- un mot de la mémoire principale est chargé dans une ligne de cache prédéfinie (toujours la même)
- Avantages : accès rapide, car il faut vérifier qu’une ligne
- Désavantages : défaut par conflit, taux de succès mauvais
#colbreak()
#image("/_src/img/docs/image copy 80.png")
]
#columns(2)[

L’adresse physique (32 bits) est divisée en deux parties :
- Bits de poids faible permettent de spécifier un index, qui indique à quelle ligne de la cache l’information se trouve, ainsi que la position dans la ligne
- Bits de poids fort forment un tag, qui est à comparer avec la valeur stockée dans le répertoire
  - Bit de validité inclus

#colbreak()

#image("/_src/img/docs/image copy 82.png")
]

#linebreak()

=== Set Associative
#columns(2)[
- Caches composés de plusieurs «caches» directement adressés accessibles en parallèle
- Chaque cache est appelé une voie
- Un mot de la mémoire peut être stocké en N positions différentes de la cache
- Diminution de la fréquence d’échec:
- $"Associativité" * 2$ = diminution de 20%
- $"Taille cache" * 2$ = diminution de 69%

#colbreak()

#image("/_src/img/docs/image copy 83.png")
]

#colbreak()

== Map avec Fully associative
#image("/_src/img/docs/image copy 121.png")
1. Nbr bits mémoire cache donné dans la consigne
2. Calculer le nbr de bits d'une ligne de la mémoire
3. LSB = puissance de 2 calculée de la taille de la ligne
4. MSB = puissance de 2 calculée par -> $"taille mémoire" / "taille ligne"$ 
5. Cacluler le nombre de répertoire -> $"taille mémoire" / "taille ligne"$
6. Comparateur et Tag = $"taille du bus" - "LSB"$

== Map avec Direct Mapped
#image("/_src/img/docs/image copy 122.png")
1. Nbr bits mémoire cache donné dans la consigne
2. Calculer le nbr de bits d'une ligne de la mémoire
3. Adressage par octet dans une ligne = puissance de 2 calculée de la taille de la ligne
4. Cacluler le nombre de tag dans les repertoires -> $"taille mémoire" / "taille ligne"$
5. MSB et Tag = $"taille du bus" - "LSB"$
6 Index = $"LSB" - "puissance de 2 calculée de la taille de la ligne"$

*Attention*: si c'est une mémoire cache à voie multiple, il faut multiplier le nombre de tag par le nombre de voies.