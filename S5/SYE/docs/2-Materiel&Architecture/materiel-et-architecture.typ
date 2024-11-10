#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Matériel et architecture
  ],
  lesson: "SYE",
  chapter: "2 - Materiel et architecture",
  definition: "Definition",
  col: 1,
  doc,
)

= Architecture Matérielle

== Composants du Système
Une architecture matérielle simplifiée d'un système comporte les éléments suivants :
- *Processeur (CPU)* : Exécute les instructions.
- *Mémoire (Caches, RAM)* : Stocke temporairement les données et les instructions.
- *Bus de périphériques* : Permet la communication entre le processeur et les périphériques.
- *Contrôleurs de périphériques* : Gèrent les communications entre le CPU et les périphériques spécifiques.

== Communication CPU et Périphériques
L'interface entre le CPU et les périphériques se fait via deux types de requêtes :
- *Requêtes synchrones* : Initiées par le processeur (ex. lecture/écriture en RAM).
- *Requêtes asynchrones* : Initiées par les périphériques, comme les interruptions matérielles.

== Exemple de code simplifié
Pour illustrer les opérations de lecture et écriture, voici un exemple pseudocode :
```c
// Lecture d'un registre d'un contrôleur de périphérique
uint32_t read_register(uint32_t *reg) {
    return *reg;
}

// Écriture dans un registre
void write_register(uint32_t *reg, uint32_t value) {
    *reg = value;
}
```

== Gestion de l'Adresse Mémoire
Le *Memory Management Unit (MMU)* est responsable de la traduction des adresses virtuelles en adresses physiques, permettant la virtualisation de la mémoire.

= Modes d'Exécution du CPU

== Instructions Privilégiées
Les processeurs modernes utilisent deux types d'instructions :
- *Instructions privilégiées* : Réservées au noyau pour des raisons de sécurité (ex. accès I/O).
- *Instructions non-privilégiées* : Exécutables par les applications en mode utilisateur.

== 2.2 Modes Utilisateur et Noyau
Le CPU possède deux modes d'exécution :
- *Mode utilisateur* : Limité aux instructions non-privilégiées.
- *Mode noyau* : Accède aux instructions et aux régions mémoire protégées.

== Exemple de passage entre modes
Le passage du mode utilisateur au mode noyau s'effectue via une interruption :
```asm
; Passage en mode noyau
INT 0x80 ; Appel système, qui interrompt le CPU et déclenche une ISR
```

= Notions d'Interruption

== Interruption Matérielle et Logicielle
Les interruptions permettent aux périphériques d'interrompre le CPU pour traiter des événements externes.
- Interruption matérielle : Vient d'un périphérique externe (clavier, disque, etc.) pour signaler un événement au processeur. Elle est *asynchrone* et nécessite une ligne d'interruption dédiée.
- Interruption logicielle : Déclenchée par un programme, souvent pour appeler une fonction système. Elle est synchronisée avec l'exécution du programme et ne dépend pas d'un signal externe.

=== Strucutre d'une interruption
1. interruption du programme en cours d'exécution
2. passage en mode kernel
3. execution de l'ISR (routine d'interruption)
4. passage en mode user
5. reprise du programme interrompu

== Routine de Service d'Interruption (ISR)
Chaque interruption est associée à une ISR (Interrupt Service Routine) qui gère le traitement spécifique de l'interruption.

== Exemple d'ISR
Voici un exemple simplifié d'une ISR en C :
```c
void interrupt_handler() {
    // Code de gestion de l'interruption
    acknowledge_interrupt(); // Acquitter l'interruption
    // Suite du traitement
}
```

= Architectures des Systèmes d'Exploitation

== Architecture Monolithique
Dans une architecture monolithique, tous les composants de l'OS (gestion mémoire, pilotes de périphériques, etc.) sont situés dans l'espace noyau. Cela offre :
- *Avantage* : Haute performance, car les composants communiquent directement.
- *Inconvénient* : Moins de sécurité, car une défaillance peut affecter tout le noyau.

== Architecture Micronoyau
Dans une architecture de micronoyau, seules les fonctions de base sont dans l'espace noyau, tandis que les autres composants sont dans l'espace utilisateur.
- *Avantage* : Améliore la sécurité et l'extensibilité.
- *Inconvénient* : Performances réduites en raison de la communication inter-processus (IPC).

== Exemple de structure d'architecture monolithique
```plaintext
Kernel Space:
- Process Scheduler
- Memory Manager
- Device Drivers
User Space:
- Applications (Ex: Serveur Web, Éditeur de texte)
```

== Comparaison des Architectures
#table(
  align: center + horizon,
  columns: (1fr, 1fr, 1fr),
  [*Type d'Architecture*], [*Avantages*], [*Inconvénients*],
  "Monolithique", "Haute performance, Simplicité", "Faible sécurité",
  "Micronoyau", "Sécurité, Extensibilité", "Performance moindre",
)