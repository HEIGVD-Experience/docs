#import "/_settings/typst/template-te.typ": *

#show: resume.with(
  "Résumé MCR TE1",
  "Guillaume Trüeb",
  cols: 2
)

#set text(size:13pt, font: "Times New Roman")

= Singleton
Singleton est un patron de conception de création qui garantit que l'instance d'une classe n'existe qu'en un seul exemplaire, tout en fournissant un point d'accès global à cette instance.

#image("img/image.png")

= Fabrique
Fabrique est un patron de conception de création qui définit une interface pour créer des objets dans une classe mère, mais délègue le choix des types d'objets à créer aux sous-classes.

#image("img/image copy.png")


= Fabrique abstraite
Fabrique abstraite est un patron de conception de création qui fournit une interface pour créer des familles d'objets liés ou dépendants sans spécifier leurs classes concrètes.
#image("img/image copy 2.png")

= Observateur
Observateur est un patron de conception comportemental qui définit une relation de dépendance entre des objets de sorte que lorsque l'un change d'état, tous ses observateurs sont notifiés et mis à jour automatiquement.
#image("img/image copy 3.png")

= Stratégie
Stratégie est un patron de conception comportemental qui permet de définir une famille d'algorithmes, de les mettre dans des classes séparées et de rendre leurs objets interchangeables.
#image("img/image copy 4.png")

= État
État est un patron de conception comportemental qui permet à un objet de changer son comportement lorsqu'il change d'état, en déléguant le comportement à des objets d'état spécifiques.
#image("img/image copy 5.png")

= Composite
Composite est un patron de conception structurel qui permet de composer des objets en structures arborescentes pour représenter des hiérarchies partie-tout, en traitant les objets individuels et les compositions d'objets de manière uniforme.
#image("img/image copy 6.png")

= Adaptateur
Adaptateur est un patron de conception structurel qui permet à des classes incompatibles de travailler ensemble en convertissant l'interface d'une classe en une interface attendue par les clients.