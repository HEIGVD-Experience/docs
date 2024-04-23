---
Type: PriseDeNote
MiseAuPropre: non
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Méthode abstraite](#m%C3%A9thode-abstraite)
- [Classe abstraite](#classe-abstraite)

___
## Définition
>[!important]
>**Méthode abstraite**: défini uniquement la déclaration, l'implémentation est nécessaire dans les sous-classe.
>**Classe abstraite:** défini une classe non instenciable, ne pouvons donc pas créer des objets.

## Méthode abstraite
- L’implémentation de la méthode est à définir dans une sous-classe.
- Elle ne peut être déclarée privée (**vu qu’elle doit être redéfinie**). 
- Le nom des paramètres formels doit être spécifié dans la déclaration de la méthode (même s’ils ne servent à rien…). 
- Une méthode statique ne peut être déclarée abstraite (méthode de classe => pas de redéfinition possible).

## Classe abstraite
- Elle ne peut servir que de classe de base pour ses sous-classes (abstraites ou non).
- Une classe déclarant des méthodes abstraites doit **obligatoirement être définie comme abstraite**.
- Elle peut définir des attributs et des méthodes concrètes (y compris des constructeurs) dont héritera toute sous-classe, ainsi que des méthodes abstraites.
- Une classe peut être définie comme abstraite même si elle ne possède pas de méthode abstraites (p.ex. interdire l’instanciation de cette classe).
- Une sous-classe d’une classe abstraite qui ne fournit pas l’implémentation de toutes les méthodes abstraites héritées doit aussi être abstraite.
- Une classe abstraite peut être sous-classe d’une classe concrète (vu que toute classe est sous-classe de la classe concrète Object).