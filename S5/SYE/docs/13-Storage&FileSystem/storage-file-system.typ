#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Title
  ],
  lesson: "Lesson",
  chapter: "Chapter",
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


= Allocation par listes chaînées