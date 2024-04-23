---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
En C les opérateurs de base ne fonctionnent pas sur les chaînes. On ne peut donc pas copier ou comparer des chaines avec des opérateurs habituels `(=, ==, !=)`.

>[!important]
>- Rappel : dans la déclaration char nom[] = "Hello";  
>	- = n’est pas un opérateur d’affectation, mais une initialisation

Dès que des manipulations sont nécessaires sur des chaînes de caractères il faut passer par la librairie `string.h` mettant à disposition des fonction sur chaines.

Une partie d'entre elles ont été expliquées dans la note [[Méthodes sur string]].