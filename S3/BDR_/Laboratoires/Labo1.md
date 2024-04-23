---
Note: 4.3
Chapitre: 2 - Modèle EA
DateDeRetour: 2023-10-17
---
**Groupe :** numéro 7   
**Auteurs :** Piemontesi Gwendal, Quinn Calum, Trüeb Guillaume   
**Date :** 17 octobre 2023
***
## Sommaire
- [Introduction](#introduction)
- [Modélisation](#mod%C3%A9lisation)
	- [Schéma-EA](#sch%C3%A9ma-ea)
	- [Contraintes d’intégrité](#contraintes-dint%C3%A9grit%C3%A9)
	- [Questions ouvertes et choix de conception](#questions-ouvertes-et-choix-de-conception)
- [Conclusion](#conclusion)

## Introduction
Ce laboratoire a pour objectif la modélisation d'une base de données, ainsi que la création d'un schéma Entité-Association (EA) en notation UML, pour répondre aux besoins d'une plateforme de streaming de vidéos.

## Modélisation

### Schéma-EA
![Schéma-EA](../../../../S0/PiecesJointes/Model.png)

### Contraintes d’intégrité
- Pour qu'un client puisse regarder un média, son age doit être plus grand ou égal à l'âge légal du média.

### Questions ouvertes et choix de conception

| Question                                                                                                                         | Explication                                                                                                                                                                         |
| -------------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Pourquoi faire hériter les tables **Film** et **Episode** d'une table **Média**?                                                 | En utilisant une table **Média**, cela nous permet premièrement de factoriser les champs partagés entre les deux entités (film et série).                                                              |
| Pourquoi faire hériter la table **Episode** et non pas **Série** ?                                                               | Nous avons choisi de faire hériter la table **Episode** car malgré qu'un producteur puisse produire une série, il se peut qu'un autre puisse s'occuper d'un épisode en particulier. |
| Pourquoi faire une table **Parametre** et non pas une table pour chacune de ses propriétés (table Langue, SousTitre, Format) ? | De notre compréhension un film ou épisode de série possède obligatoirement au moins une qualité et pas forcément de langue (film muet). De plus, d'un point de vue utilisation le stockage d'un film se fait sous format de fichier contenant directement la langue ainsi que la qualité. C'est pourquoi nous avons décidé de stocker ces 2 informations dans la même table.                                                                                                                                                                                   |
| Pourquoi une franchise a-t-elle au minimum 2 médias ? | Pour qu'une franchise soit considérer comme telle, nous estimons qu'il doit y avoir au minimum deux médias la composant. Un film ou une série toute seule ne peux pas raisonnablement être considérée comme une franchise. |

## Conclusion
Dans ce rapport nous vous avons présenté une modélisation d'une base de données pour gérer une plateforme de streaming vidéo. Grâce au schéma détaillé ainsi que des contraintes d'intégrités nécessaires à une modélisation complète nous avons résumé efficacement toutes les parties importantes de la plateforme et de son fonctionnement.
