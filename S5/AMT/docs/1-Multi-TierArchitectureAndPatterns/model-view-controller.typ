#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Modèle - Vue - Controlleur
  ],
  lesson: "AMT",
  chapter: "1 - Multi-Tier Architecture And Patterns",
  definition: "Ce document présente les aspects fondamentaux du modèle MVC.",
  col: 1,
  doc,
)

= Définition
Le pattern MVC (Modèle-Vue-Controlleur) est un pattern extrèmement connu dans le design d'applications. Ce modèle est fortement appuyé sur le principe de séparer l'application en 3 couches inter-connectées.

- *Couche modèle*
 - Responsable des données
 - Responsable de la gestion des entitées, repositoires et domain objects
- *Couche Vue*
 - Responsable de l'interface utilisateur
- *Couche Controlleur*
 - Responsable de la logique de l'application
  - Login
  - Routage
  - Authorisation, etc...

Il existe plusieurs variantes du model MVC. En général, ces variantes se basent toujours sur la séparation des données, de la logique et de l'interface.

= Structure de base
La structure classique du modèle MVC peut-être schématisée de la manière suivante
#image("/_src/img/docs/image copy 156.png")

== Structure alternative
Il existe aussi d'autres structures plus ou moins similaires
#columns(2)[
  #image("/_src/img/docs/image copy 157.png")
  #colbreak()
  #image("/_src/img/docs/image copy 158.png")
]

== Pattern d'organisation
Le MVC est souvent vu comme un pattern d'architecture alors qu'il s'agit plus d'un pattern d'organisation car cela permet d'organiser le code.

Ainsi, les développeurs peuvent facilement trouver le code associé à une fonctionnalité spécifique, ce qui améliore la maintenabilité de l'application.