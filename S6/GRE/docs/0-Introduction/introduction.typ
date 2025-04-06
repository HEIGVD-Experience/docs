#import "/_settings/typst/template-note.typ": conf, note
#show: doc => conf(
  title: [
    Introduction aux graphes
  ],
  lesson: "GRE",
  chapter: "0 - Introduction",
  definition: "Definition",
  col: 1,
  doc,
)

= Types de graphes
== Graphes non orientés
Un graphe non orienté est un ensemble de points appelés *sommets*, reliés par des segments appelés *arêtes*. Les arêtes n'ont pas de direction, ce qui signifie que si une arête relie les sommets A et B, on peut aller de A à B et de B à A. Deux sommets sont dis adjacents s'ils sont reliés par une arête.

== Graphes orientés
Un graphe orienté est un ensemble de points appelés *sommets*, reliés par des segments appelés *arcs*. Contrairement aux graphes non orientés, les arêtes ont une direction. Si une arête relie le sommet A au sommet B, on peut aller de A à B, mais pas de B à A.

#image("../img/image copy 2.png", )

== Boucles, arêtes et arcs multiples
- Une *boucle* est une arête ou un arc qui relie un sommet à lui-même.
- Deux arêtes ou arcs qui relient les mêmes sommets sont appelés *arêtes multiples* ou *arcs multiples*.
- Deux arêtes ou arcs qui relient les mêmes sommets mais dans la même direction sont appelés *multiples* ou *paralèles*.
- Deux arcs qui relient les mêmes sommets mais dans des directions opposées sont appelés *arêtes opposées* ou *arcs opposés*.

== Graphes simples, finis, vides, triviaux et nuls
- Un *graphe simple* est un graphe qui ne contient ni boucles ni arêtes multiples.
- $n$ est le nombre de sommets et $m$ est le nombre d'arêtes/arcs.
- Un graphe *vide* est un graphe sans arêtes ni arcs ($|E|=0$).
- Un graphe *trivial* est un graphe avec un seul sommet et aucune arête ou arc ($|V|=1$ et $|E|=0$).
- Un graphe *nul* est un graphe sans sommet, arête ou arc ($|V|>0$ et $|E|=0$).

== Degrés, demi-degrés et sommets pendants
- Le *degré* d'un sommet est noté $deg(v)$, est égal au nombre d'arêtes ou d'arcs qui lui sont connectés, chaque boucle comptant pour deux.
- Un graphe est dit *régulier* si tous ses sommets ont le même degré.
- Le *demi-degré extérieur* d'un sommet est noté $deg^+(v)$ et est égal au nombre d'arcs sortants du sommet.
- Le *demi-degré intérieur* d'un sommet est noté $deg^-(v)$ et est égal au nombre d'arcs entrants du sommet.
- Un sommet est dit *pendant* s'il a un degré de 1.

#note[
  Le *Théorème d'Euler* dit que pour tout graphe $G = (V, E)$ alors,
  $
  sum_(u in V) deg(v) = 2|E|
  $
  autrement dit, la somme des degrés de tous les sommets est égale au double du nombre d'arêtes.
]

#note[
  De plus, pour tout graphe orienté $G = (V, E)$ alors,
  $
  sum_(u in V) deg^+(v) = sum_(u in V) deg^-(v) = |E|
  $
]

== Graphes partiels et sous-graphes
=== Graphes partiels
Un *graphe partiel* de $G$ est un graphe contenant *tous les sommets* de $G$ et un sous-ensemble de ses arêtes ou de ses arcs.

=== Sous-graphes
Un *sous-graphe* de $G$ est un graphe contenant un sous-ensemble des sommets d'origine ainsi que toutes les arêtes ou arcs qui relient ces sommets.

=== Sous-graphes partiels
Un *sous-graphe partiel* de $G$ est un graphe contenant un sous-ensemble des sommets d'origine ainsi qu'un sous-ensemble de ses arêtes ou arcs.

#image("../img/image copy 3.png")

= Caratéristiques des graphes
== Chaînes, cycles, chemins et circuits
=== Chaînes
Une chaine est une suite alternée de sommets et d'arêtes commençant et se terminant par un sommet où chaque arête est encadrée par ses deux extrémités.

=== Cycles
- Un cycle est une chaîne fermée, c'est-à-dire qu'elle commence et se termine par le même sommet.
- Une chaîne ou un cycle est *élémentaire* si chaque sommet y apparaît au plus une fois.
- Une chaîne ou un cycle est *simple* si chaque arête y apparaît au plus une fois.

=== Chemins
Un chemin est une suite alternée de sommets et d'arcs commençant et se terminant par un sommet où chaque arc est encadré par ses deux extrémités.

=== Circuits
Un circuit est un chemin fermé, c'est-à-dire qu'il commence et se termine par le même sommet *comptant au moins un arc*.

== Graphes sans cycles et forêts
- Un graphe sans cycles ou acyclique est un graphe sans cycles simples.
- Un graphe sans cycles est appelé une *forêt* et même un *arbre* s'il est connexe.

#image("../img/image copy 4.png")