#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Processus et changements de contextes
  ],
  lesson: "SYE",
  chapter: "4 - Processus & changement de context",
  definition: "Definition",
  col: 1,
  doc,
)

= Structure PCB (Process Control Block)
- PCB (Process Control Block)
 - Fiche signalétique d'un processus
 - Structure de données gérée et visible que par le noyau
 - Contient toutes les informations système liées au processus
 - Utilisé lors de changements de contexte
- Chaque processus dispose d'un PCB propre et unique.


= Création de processus, appels systèmes fork(), exec(), waitpid(), exit()


= Changement de contexte