#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Analyse exploratoire des données
  ],
  lesson: "PST",
  chapter: "2 - Analyse exploratoire des données",
  definition: "Definition",
  col: 1,
  doc,
)

= Statistiques élémentaires
== Tendance centrale
Les indicateurs de tendance centrale informent sur le milieu d'une distribution grâce à la moyenne, la médiane et accessoirement le mode.

=== Mauvaise représentation
La moyenne et la médianne ne permettent pas de représenter précisement les détails des valeurs calculée.

Note: 4.5 4.5 4.5 #sym.arrow moyenne = 4.5 #sym.arrow médiane = 4.5 #sym.arrow écart-type = 0
Note: 4 4.5 5 #sym.arrow moyenne = 4.5 #sym.arrow médiane = 4.5 #sym.arrow écart-type > 0

=== Moyenne
$
overline(x) = 1/n * sum x_i
$

=== Médiane
$
"med"(x)
$
Valeur observée donc valeur représentant la moitié de l'ensemble de donnée.

//ToDo

=== Mode
Le mode aussi dit *valeur dominante* et consiste à trouver le/les valeurs les plus représentée dans notre échantillon.

== Indicateurs de dispersion
Les indicateurs de dispersion informent sur la variabilité de la distribution grâce à l'étendue, l'écart-type, l'étendue interquartile et le coefficient de variation.

=== Etendue
L'étendue notée $R$ et représente la plus grande valeur et la plus petite de l'échantillon.
$
x_(n bar n) - x_(1 bar n)
$

=== Ecart-type
L'écart-type noté $s$ d'une liste de données est la racine carrée de la somme des carrés des écarts à la moyenne divisée par $(n-1)$:
$
s = sqrt(((x_1 - overline(x))^2 + (x_2 - overline(x))^2 + ... + (x_n - overline(x))^2)/(n-1))
$

=== Etendue interquartile
La médiane permet de diviser l'échantillon ordonné en deux parties de la même grandeur. Pour calculer les différents quartile nous feront:
- le *premier quartile* est noté $q(25%)$ et sera la médiane des $50%$ des valeurs les plus petites
- le *second quartile* est la médiane
- le *troisième quartile* est noté $q(75%)$ et sera la médiane des $50%$ des valeurs les plus grandes

=== Etendue interquartile
Un troisième indicateur de dispersion (le moins sensibles aux données dites atypiques) est l'*étendue interquartile* définie par:
$
q(75%) - q(25%)
$

=== Coefficient de variation
Le coefficient de variation, noté, $"CV"$ est obtenu en divisant l'écart-type $s$ par la moyenne arithmétique.
$
"CV" = s/overline(x) "avec " overline(x) eq.not 0
$

== Indicateurs de forme
Les indicateurs de forme qui mesurent le degré d'asymétrie ou d'aplatissement d'une distribution grâce à l'asymétrie et l'aplatissement.

= Boite à moustache
La boite à moustache permet de représenter visuellement les données des 3 quartiles ($q 1, q 2, q 3$).

#image("/_src/img/docs/image copy 173.png")

Pour construire la boite nous aurons:
- la barre gauche vaudra $q(25%)$
- la barre centrale vaudra $"med"(x)$ donc la médiane
- la barre de droite vaudra $q(75%)$

Pour construire les moustache nous devons:
1. mesurer la longeur de la boite
2. multiplier cette longeur par $1.5$
3. se placer à la distance calculée des deux extrémités de la boite puis se rapprocher de la boite jusqu'à tomber sur une valeur de l'ensemble de donnée

