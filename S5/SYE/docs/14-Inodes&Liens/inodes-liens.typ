#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Inodes & Liens
  ],
  lesson: "SYE",
  chapter: "14 - Inodes & Liens",
  definition: "Definition",
  col: 1,
  doc,
)

= Allocation indexée
La *méthode d'allocation indexée* est une technique de gestion du stockage des fichiers sur disque. Elle utilise un *bloc d'index* contenant des pointeurs vers les blocs de données du fichier, contrairement à l'allocation contiguë ou chaînée.  

Lors de la création d'un fichier, un bloc d'index lui est attribué pour référencer ses blocs de données, qui peuvent être stockés *de manière non contiguë*, réduisant ainsi la fragmentation.  

Pour accéder aux données, le système utilise l'adresse du bloc d'index enregistrée dans les métadonnées du fichier. Cette méthode permet un *accès direct et efficace*, améliorant les performances pour les accès aléatoires.

== Inodes
Les *inodes* sont des structures de données utilisées par les systèmes de fichiers pour stocker les métadonnées des fichiers, telles que les permissions, les propriétaires, les dates de création et de modification, ainsi que les adresses des blocs de données.

#image("../img/image copy 22.png")

- l'adresse est généralement sur *32 bits*
- le nombre de blocs d'un fichier est limité

L'*inode* est initialisé lors de la création d'un fichier, mais pour améliorer les performances, plusieurs inodes sont *pré-initialisés* lors du formatage du système de fichiers. Cela permet une allocation rapide des blocs d'index et des métadonnées.  

Si aucun inode n'est disponible, le système alloue un nouveau bloc via la gestion des blocs libres. Les *métadonnées*, incluant les adresses des blocs de données, font partie de l'inode, mais leur nombre est limité.  

Pour gérer des *fichiers volumineux*, une *allocation indexée multi-niveaux* est utilisée : des blocs d'index peuvent pointer vers d'autres blocs d'index, formant une structure hiérarchique et augmentant la capacité de stockage adressable.

== Indirection de blocs
L'*indirection de blocs* est une technique utilisée pour accéder à des blocs de données via des blocs d'index. Elle permet de *réduire la taille des inodes* et de gérer des fichiers de grande taille.

#image("../img/image copy 23.png")

== Niveau d'indirection
Pour gérer des *fichiers volumineux*, l'*indirection double* est utilisée : le bloc d'index pointe vers des *blocs d'index secondaires*, qui contiennent à leur tour les pointeurs vers les blocs de données.  

Pour des *fichiers très grands*, l'*indirection triple* est introduite : le bloc d'index principal pointe vers des *blocs d'index secondaires*, qui référencent des *blocs d'index tertiaires*, lesquels contiennent les adresses des blocs de données.  

Le *nombre de niveaux d'indirection* est défini lors du formatage de la partition, déterminant ainsi la *taille maximale des fichiers*. Ce modèle, utilisé dans les *systèmes Unix*, impose une structure uniforme pour l'accès aux blocs et est géré via les *inodes*.

- le nombre d'indirection est déterminé lors du formatage de la partition

== Exemple
L'inode représente le bloc principal d'un fichier. 

#image("../img/image copy 24.png")

- *direct blocks*: 12 blocs x 4Ko = 48Ko
- *single indirect block*: 1024 blocs x 4Ko + 48Ko = 4144Ko = 4Mo
- *double indirect block*: 1024 blocs x 1024 blocs x 4Ko + 4144Ko = 4192256Ko = 4Go

= Notion de liens
== Liens physiques
Les *liens physiques* sont des entrées de répertoire qui pointent vers un *inode* existant. Ils permettent de créer des *alias* pour un fichier, partageant ainsi le même contenu et les mêmes métadonnées. Plusieurs liens durs peuvent être créés pour un même fichier, et tous ces liens sont équivalents : ils partagent la même inode et les mêmes données. Si l'un des liens est supprimé, les autres restent fonctionnels tant que l'inode n'a pas été supprimée (ce qui ne se produit que lorsque le dernier lien est supprimé). Les liens durs sont généralement limités au même système de fichiers, car ils dépendent des inodes.
- Linux: ln <cible> <lien>
- Windows: fsutil hardlink create <lien> <cible>

== Liens symboliques
Les *liens symboliques* sont des entrées de répertoire qui pointent vers un *chemin de fichier*. Ils permettent de créer des raccourcis vers des fichiers ou répertoires, même situés sur des systèmes de fichiers différents. Les liens symboliques sont plus flexibles que les liens physiques, mais ils sont moins efficaces en termes de performances, car ils nécessitent une résolution supplémentaire pour accéder au fichier cible.
- Linux: ln -s <cible> <lien>
- Windows: mklink <lien> <cible>