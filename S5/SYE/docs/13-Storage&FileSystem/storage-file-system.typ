#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Stockage et système de fichiers
  ],
  lesson: "SYE",
  chapter: "13 - Stockage et Système de fichiers",
  definition: "Definition",
  col: 1,
  doc,
)

= Organisation d'un stockage secondaire
Dans un disque dur type HDD nous avons plusieurs manières d'adresser les données. Un secteur est la plus petite unité de stockage sur un disque dur et mesure généralement 512 octets même si maintenant on trouve des disques durs avec des secteurs de 4 Ko.

== Adressage C/H/S
L'adressage C/H/S (Cylinder/Head/Sector) est une méthode d'adressage des données sur un disque dur.

- *Cylindre* : Un cylindre est un ensemble de pistes situées à la même distance du centre du disque.
- *Tête* : Une tête est un élément de lecture/écriture situé sur un bras mobile.
- *Secteur* : Un secteur est la plus petite unité de stockage sur un disque dur.

== Adressage LBA
L'adressage LBA (Logical Block Addressing) est une méthode d'adressage des données sur un disque dur.

== Master Boot Record (MBR)
- Premier secteur du disque (LBA 0), recherché par le BIOS
- Partitionnement de type Intel (fdisk)
- Description des partitions d'un disque dur

== GUID Partition Table (GPT)
- GUID Partition Table
- Standard UEFI (Unified Extensible Firmware Interface) proposé par Intel

= Systèmes de fichiers et partitions
== VFS
La couche VFS permet de s'abstraire de tout type de système de fichier. Ce dernier peut alors utiliser les appels systèmes habituels `open()`, `read()`, `write()`, `close()`.

La couche VFS peut ainsi gérer plusieurs types de systèmes de fichiers. L'opération de montage permettra alors d'accéder au contenu géré par un système de fichier. Grâce à ce mécanisme, plusieurs systèmes de fichiers peuvent coexister simultanément et le processeur peut accéder aux fichiers de l'un ou l'autre de manière totalement transparente.
#image("../img/image copy 8.png")

Le système de fichier à sa propre notion de bloc.
- Un bloc au niveau FS correspond à un ou plusieurs secteurs

== Espaces d'adressage
L'espace d'adressage d'un FS correspond à un *partition* sur le disque dur.

#image("../img/image copy 9.png")

= Allocation contiguë
L'allocation contiguë consiste à allouer un espace de stockage contigu pour un fichier. Cette méthode est simple et efficace, mais elle peut entraîner une fragmentation du disque.

Les blocs sont attribués séquentiellement :
- Accès aléatoire rapide.
- Fragmentation externe problématique.
- Croissance des fichiers impossible.

= Allocation par listes chaînées

Les blocs sont reliés par des pointeurs internes :
- Optimise l'utilisation de l'espace disque.
- Adapté à l'accès séquentiel, mais accès direct limité.
- Risque accru si un bloc est corrompu.

== FAT (File Allocation Table)

La FAT utilise une table pour stocker les pointeurs en dehors des blocs. Elle offre :
- Une meilleure gestion des pointeurs.
- Une sécurité accrue en isolant les métadonnées des données utilisateur.

Il existe plusieurs versions de FAT :
- FAT12 : 12 bits encoder l'adresse du bloc
- FAT16 : 16 bits encoder l'adresse du bloc
- FAT32 : 28 bits encoder l'adresse du bloc
- exFAT
 - limite théorique pour la taille d'un fichier : $2^64$ octets
 - taille de grappe maximale : $2^255$ octets
 - présence d'uen bitmap pour les blocs libres