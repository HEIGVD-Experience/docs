#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Performance et optimisation
  ],
  lesson: "AMT",
  chapter: "12 - Performance et optimisation",
  definition: "Cette note traite des concepts liés à la performance et à l'optimisation des systèmes. Elle introduit des notions comme la latence, le débit et les goulots d'étranglement, ainsi que des outils statistiques tels que l'écart-type et les percentiles. Les métriques fondamentales incluent les compteurs, jauges et histogrammes, permettant d'observer et d'analyser l'utilisation des ressources. Enfin, elle souligne l'importance de mesurer et surveiller efficacement les systèmes pour améliorer leur performance globale.",
  col: 1,
  doc,
)

= Performance et optimisation
== Terminologie
- *Performance* : Efficacité d'un système à accomplir des tâches (vitesse, réactivité, qualité).
- *Efficacité* : Usage optimal des ressources pour une performance donnée.
- *Optimisation* : Processus visant à maximiser l'efficacité et la performance.
- *Latence* : Délai entre une action et sa réponse.
- *Débit* : Quantité de travail ou données traitées dans un temps donné.
- *Surcharge* : Ressources supplémentaires nécessaires pour accomplir une tâche.
- *Goulot d'étranglement* : Point limitant la performance globale d'un système.

== Utilisation
- *Basée sur le temps* : $U = B / T$ où $U$ est l'utilisation, $B$ le temps occupé et $T$ la période observée.

- *Basée sur la capacité* : $U = O / C$ où $O$ est la capacité occupée et $C$ la capacité totale.

== Outils statistiques
- *Écart-type* : Mesure de la variance dans les données.
- *Percentiles* : Valeurs représentant un pourcentage de points dans un ensemble de données.
- *Outliers* : Points de données s'écartant significativement des autres.

== Échantillonnage
- Conversion d'un signal continu en un signal discret pour obtenir une approximation statistique.
- Exemples : CPU, mémoire, latence.

== Métriques fondamentales
- *Compteur* : Valeur qui ne peut qu'augmenter (ex. : nombre de requêtes).
- *Jauge* : Valeur numérique unique pouvant fluctuer (ex. : température).
- *Histogramme* : Distribution des valeurs sur des intervalles configurables (ex. : latence).

== De compteurs à jauges
- Les compteurs collectent les données brutes (ex. : temps CPU total occupé).
- Les jauges sont dérivées des compteurs (ex. : utilisation CPU calculée sur une période).

== Conclusions
L'observation et l'analyse des métriques permettent de comprendre et d'améliorer la performance. Des outils comme les jauges et les compteurs aident à surveiller les systèmes tout en minimisant la surcharge.
