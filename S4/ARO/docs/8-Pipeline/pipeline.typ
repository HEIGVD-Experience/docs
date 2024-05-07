#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Pipeline
  ],
  lesson: "ARO",
  chapter: "8 - Pipeline",
  definition: "TBD",
  col: 1,
  doc,
)

= Type de parallélisme
== Parallélisme Bit-level
- Augmenter la taille des mots
- 64 bits (mais DDR2 de 256 bits)
== Parallélisme d'instructions
- *Pipeline*
- Superscalaire : Le matériel est responsable à l’exécution du lancement parallèle des instructions
- VLIW (very long instruction word): Le compilateur est responsable de présenter au matériel des instructions exécutables en parallèle
== Parallélisme de donnée
- Traitement vectoriel, images, matrices
== Parallélisme de tâches (threads)
- Multithreading simultané

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

= Le pipeline
- Permet d'accroître la vitesse d'exécution des instructions dans un micro-processeur.
- Découpe une tâche en plusieurs morceaux de manière à augmenter le débit.
- Les données progressent les unes derrière les autres.
- Permet de commencer une instruction avant la fin de la précédente.

#image("/_src/img/docs/image copy 40.png")

== Formule séquentielle vs pipeline
$
T_e &= "temps de passage à chaque étape" \
T_p = n * T_e &= "temps de passage pour n étapes" \
T_t = m * T_p &= "temps total pour m personnes" \ \

T_t &= n * m * T_e
$

== Formule pipeline
$
T_t = n * T_e + (m - 1) * T_e
$

== Niveau de pipeline
- Pipeline à 3 niveaux : Fetch, Decode, Execute
- Pipeline à 5 niveaux : Fetch, Decode, Execute, Memory, WriteBack

#columns(2)[
  La principale raison d'augmenter le nombre de niveaux de pipeline est d'augmenter le débit d'instructions (IPC, Instructions Per Cycle) et donc d'améliorer les performances globales du processeur. En théorie, plus il y a d'étapes dans le pipeline, plus le processeur peut travailler sur plusieurs instructions en parallèle, ce qui permet d'augmenter le débit.

  Un pipeline plus profond peut entraîner des retards supplémentaires dus à des bulles de pipeline (lorsque le pipeline doit attendre qu'une instruction précédente se termine avant de pouvoir continuer). De plus, un pipeline plus profond peut rendre plus difficile la gestion des dépendances de données, des sauts conditionnels, et des erreurs de prédiction de branchement.
  #colbreak()
  #image("/_src/img/docs/image copy 41.png")
]

== Calcul des performances
=== Latence
#columns(2)[
  Latence : temps écoulé entre le début et la fin d’exécution de la tâche (instruction).
  #colbreak()
  #image("/_src/img/docs/image copy 42.png")
]

=== Débit
#columns(2)[
  Débit: nombre d’opérations (tâches, instructions) exécutées par unités de temps.
  #colbreak()
  #image("/_src/img/docs/image copy 43.png")
]

=== Accélération
Accélération: nombre de fois plus vite qu’en séquentiel.
$
A = frac(T_s, T_p) = frac(m * n * T_e, (n + m - 1) * T_e) = frac(m * n, n + m -1) " " ~ " " n " (pour m très grand)"
$