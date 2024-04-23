---
Type: PriseDeNote
MiseAuPropre: oui
---
*5*Table des matières**
- [Définition](#d%C3%A9finition)
- [Machine à états finie asynchrone](#machine-%C3%A0-%C3%A9tats-finie-asynchrone)
- [Machine à états finie synchrone](#machine-%C3%A0-%C3%A9tats-finie-synchrone)

___
## Définition
>[!important]
>Un système séquentiel est aussi appelé machine à états finie ou Finite State Machine (FSM) en anglais. Dans une telle machine, une mémoire est nécessaire pour stocker une indication sur l’historique des entrées: c'est l'état du système. Etant donné le caractère fini de la mémoire, la séquence doit être également de taille finie: le nombre d'états d'un système séquentiel est donc fini.
## Machine à états finie asynchrone
Une machine à états finie asynchrone peut changer ses valeurs de sortie et d'état à **chaque fois** qu'il y a un changement des entrées.
## Machine à états finie synchrone
Une machine à états finie synchrone change d'état à des moments fixes, généralement définis par le **flanc montant ou descendant** d'un signal d'horloge.