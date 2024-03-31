#import "../../../_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Gestion de la mémoire
  ],
  lesson: "ARO",
  chapter: "1 - Introduction",
  definition: "Comprendre la gestion de la mémoire dans le cours d'ARO vous permettera de pouvoir calculer facilement des tailles de mémoire ainsi que des adresses mémoires.",
  doc,
)

= Taille mémoire
Une adresse est stockée dans un mot de la mémoire d'un ordinateur
• Le nombre de bits d'un mot limite donc la taille maximale de la
mémoire d'un ordinateur
• Si un ordinateur utilise des mots de 32 bits, la taille maximale
de sa mémoire est de 4 gigabytes:

