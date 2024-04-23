---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Le préprocesseur en C est un élément essentiel dans le processus de compilation d'un programme. Il est chargé de traiter les fichiers source avant la compilation, afin de réaliser des tâches de pré-traitement qui permettent d'optimiser le code et de faciliter sa maintenance.

## Directives du préprocesseur
Les directives commencent par le symbole # servent à

-   inclure un fichier externe
-   définir une constante
-   définir une macro
-   rendre la compilation conditionnelle
    -   par exemple pour gérer la différence d’OS pour certaines lignes de code uniquement disponible sur un OS

>[!info]
>Le préprocesseur fait plus qu’exécuter des directives il :
>- efface tous les commentaires
>- supprime les espaces inutiles (débuts de ligne, indentation, ...)

## Sémantique des délimitateurs
**\<nom>** : chercher le fichier dans les dossiers système
**"nom"** : chercher dans le dossier courant