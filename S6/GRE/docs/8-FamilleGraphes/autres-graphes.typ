#import "/_settings/typst/template-note.typ": *
#show: doc => conf(
  title: [
    Familles et problèmes classiques de graphes
  ],
  lesson: "GRE",
  chapter: "8 - Famille de Graphes",
  definition: "Definition",
  col: 1,
  doc,
)

= Types de Graphes et Couplages
== Graphes complets
*Définition* : Graphe simple non orienté où toute paire de sommets distincts est reliée.
- *Notation* : $K_n$ (graphe complet sur $n$ sommets)
- *Propriété* : $K_n$ possède $binom(n,2) = (n(n-1))/2$ arêtes

#image("../img/image copy 37.png")

== Graphes complémentaires
*Définition* : Le complémentaire $overline(G)$ de $G = (V, E)$ a les mêmes sommets et pour arêtes toutes celles qui ne sont pas dans $E$ :
$
overline(E) = {{u,v} | {u,v} in.not E, u != v "et" u,v in V}
$

== Tournois
*Définition* : Graphe orienté simple où chaque paire de sommets est reliée par exactement un arc.
- *Propriétés* :
  - Graphe sous-jacent = graphe complet
  - Au plus 1 sommet sans prédécesseurs, au plus 1 sans successeurs
  - Sans circuits ⟺ matrice d'adjacence définit un ordre strict total

== Graphes bipartis
*Définition* : Graphe $G = (V, E)$ où $V = A union B$ (disjoints) tel que chaque arête relie un sommet de $A$ à un de $B$.
- *Notation* : $G = (A, B, E)$
- *Caractérisation* : Graphe biparti ⟺ aucun cycle de longueur impaire

#image("../img/image copy 38.png")

#colbreak()

=== Graphes bipartis complets
*Définition* : Graphe biparti avec nombre maximal d'arêtes (chaque sommet de $A$ adjacent à tous ceux de $B$).
- *Notation* : $K_(r,s)$ ($r$ sommets dans un ensemble, $s$ dans l'autre)

#image("../img/image copy 39.png")

== Couplages
*Couplage* : Sous-ensemble $M subset.eq E$ d'arêtes sans extrémités communes.
- *Couplage parfait* : sature tous les sommets
- *Couplage maximum* : cardinal maximal

#image("../img/image copy 40.png")

== Recouvrements et transversaux
*Recouvrement* : $R subset.eq E$ tel que chaque sommet est extrémité d'au moins une arête de $R$.

*Transversal* : $T subset.eq V$ tel que chaque arête est incidente à au moins un sommet de $T$.

*Complexité* : Recouvrement minimum = polynomial, Transversal minimum = NP-difficile.

== Chaînes alternées et augmentantes
Soit $M$ un couplage :
- *Chaîne alternée* : arêtes alternent entre $M$ et $overline(M)$
- *Chaîne augmentante* : chaîne alternée avec extrémités non saturées par $M$

*Théorème de Berge (1957)* : $M$ est maximum ⟺ aucune chaîne augmentante relativement à $M$.

= Graphes planaires
== Définition
*Graphe planaire* : admet une représentation sur le plan où les arêtes ne se coupent pas (sauf aux extrémités).

*Graphe planaire topologique* : représentation planaire concrète d'un graphe planaire.

#image("../img/image copy 41.png")

== Formule d'Euler
Pour tout graphe planaire topologique connexe :
$
n - m + f = 2
$
où $n$ = sommets, $m$ = arêtes, $f$ = faces.

=== Conséquences pour graphes simples connexes

*Cas général* ($n >= 3$) :
$
m <= 3n - 6
$

*Corollaire* : $K_5$ n'est pas planaire (car $10 not<= 3 dot 5 - 6 = 9$).

*Cas biparti* ($n >= 4$) :
$
m <= 2n - 4
$

*Corollaire* : $K_(3,3)$ n'est pas planaire (car $9 not<= 2 dot 6 - 4 = 8$).

=== Démonstrations
*Cas général* : Chaque face a $>= 3$ arêtes sur sa frontière ⟹ $3f <= 2m$.

*Cas biparti* : Chaque face a $>= 4$ arêtes sur sa frontière ⟹ $4f <= 2m$.

== Théorème de Kuratowski

*Subdivision* : graphe obtenu en insérant des sommets au milieu de certaines arêtes.

*Théorème (Kuratowski, 1930)* : Un graphe est planaire ⟺ il ne contient aucun sous-graphe partiel qui est une subdivision de $K_5$ ou $K_(3,3)$.