#import "../../../_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Gestion de la mémoire
  ],
  lesson: "ARO",
  chapter: "1 - Introduction",
  definition: "Comprendre la gestion de la mémoire dans le cours d'ARO vous permettera de pouvoir calculer facilement des tailles de mémoire ainsi que des adresses mémoires.",
  col: 1,
  doc,
)

= Taille mémoire
- Une adresse est stockée dans un mot de la mémoire d'un ordinateur.
- Le nombre de bits d'un mot limite donc la taille maximale de la mémoire d'un ordinateur.

== Exemple
- Si un ordinateur utilise des mots de *32 bits*, la taille maximale de sa mémoire est de 4 gigabytes car,
#set align(center)
$2^32 = 2^2 * 2^30 = 4"GB"$
#set align(left)
*NB*: comme nous le verrons plus tard, $2^30$ fait passer notre valeur en *GB* directement puis $2^2 = 4$ ce qui explique le $4"GB"$.

== Taille mot mémoire
La taille d'un mot mémoire est forcément un multiple de $8$. C'est pourquoi nous pouvons appliquer le tableau suivant :
#image("../../../_src/img/docs/image.png")

== Gestion des adresses
En fonction de la taille de la mémoire nous aurons une taille d'adresses variables, le tableau suivant représente les possibilités : 
#image("../../../_src/img/docs/image2.png")

// = Ilona mon amoureuse