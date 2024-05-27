#import "/_settings/typst/template-te.typ": *

#show: resume.with(
  "Résumé ARO - TE2",
  "Guillaume Trüeb",
  cols: 2
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