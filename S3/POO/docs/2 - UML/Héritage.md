---
Type: PriseDeNote
MiseAuPropre: oui
---
## Définition
>[!important]
>L'héritage en programmation orientée-objet consiste à créer un enfant en héritant d'un parent. Cet à dire que les propriétés ainsi que méthodes du parent seront accessible dans l'enfant.

Dans un schéma UML l'héritage ce dessine de la manière suivante : 
![](/_src/img/docs/Pasted image 20230927141458.png)
Le **Sportsman** hérite de la classe **Person**.

## Classes abstraites
Une classe abstraite est une classe qui ne peut pas être instanciée. Celle-ci est obligée d'être instanciée par un enfant.
Une classe abstraite ne peut pas exister d'elle même.

>[!important] Exemple
>Si l'on crée la classe **Animal** et deux classes enfant qui seront **Chien** et **Chat**, étant donné que l'instance **Animal** n'aurait aucun sens cette classe peut-être définie comme abstraite.
>PS: elle sera donc écrite en italique *Animal*

![](/_src/img/docs/Pasted image 20230927141947.png)

## Interface
- Ensemble de méthodes abstraites que peuvent implémenter des classes (pour garantir un comportement).
- Ne possède pas d’état (attributs).
- Une interface est représentée en italique.
![](/_src/img/docs/Capture d’écran 2023-09-27 à 14.21.06.png)
>[!important]
>L’implémentation d’une interface par une classe est représentée par une flèche en pointillés.

