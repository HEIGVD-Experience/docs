#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Simulation et générateurs",
  course: "SIO - Simulation et optimisation",
  author: "Guillaume Trüeb",
  date: "15 septembre 2025",
  toc: true,
  col: 1,
  doc,
)

= Simulation
== Pourquoi simuler un système?
La simulation permet de modéliser le comportement d'un système réel, souvent complexe. Cependant, elle présente plusieurs difficultés:
- le choix, la conception et la validation d’un modèle sont autant d’étapes délicates
- la collecte et l’analyse des données est une phase cruciale pour obtenir des résultats utilisables
- la mise en œuvre informatique peu demander passablement de temps
- le risque de bugs est toujours présent
- l’analyse statistique des résultats doit être faite avec rigueur
- la convergence est parfois (voire souvent) lente

#info[
  Pour obtenir des résultats corrects et suffisamment précis, la simulation est *gourmande en temps* de conception, de développement, de validation et de calcul.
]

== Génération de nombres aléatoires
Un ordinateur étant déterministe, il ne peut pas générer de nombres aléatoires. On utilise donc des *pseudo-nombres aléatoires* (PRNG: Pseudo-Random Number Generator) qui sont générés par des algorithmes à partir d'une *graine* (seed). Si on utilise la même graine, on obtient la même séquence de nombres pseudo-aléatoires.

= Génération de nombres aléatoires

= Génération de varibales aléatoires

== Méthode des rejets
La méthode des rejets permet de générer des variables aléatoires suivant une distribution donnée en utilisant une distribution de référence plus simple. On génère des points aléatoires dans un espace englobant la fonction de densité cible et on rejette ceux qui ne satisfont pas la condition.

= Méthode de Monte-Carlo

= Intégration et réducation de variance