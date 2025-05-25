#import "/_settings/typst/template-te.typ": *

#show: resume.with(
  "Résumé GRE TE2",
  "Guillaume Trüeb", 
  cols: 3
)

= Graphes sans circuits et applications
Les graphes sans circuits (*DAG*) sont essentiels en gestion de projets, ordonnancement et compilation.

== Propriétés fondamentales
- Tout graphe fini sans circuits possède au moins un sommet sans prédécesseurs et un sans successeurs
- Tout sous-graphe partiel d'un graphe sans circuits est sans circuits
- Permettent d'introduire une notion de *rang* : $"rang"(u) < "rang"(v)$

== Tri topologique (Kahn) - $O(n + m)$
*But* : Ordonner les sommets en respectant les relations d'ordre (indispensable pour ordonnancement)
*Applications* : Compilation, gestion projets, détection cycles
*Principe* : Répéter jusqu'à épuisement des sommets
1. Identifier un sommet sans prédécesseurs dans le graphe résiduel
2. Le numéroter dans l'ordre croissant (rang topologique)
3. Le supprimer du graphe avec tous ses arcs sortants
*Propriété* : Si le graphe contient un cycle, l'algorithme s'arrête avant d'avoir numéroté tous les sommets

== Plus court/long chemin - Équation de Bellman
*Applications* : Ordonnancement projets, optimisation, planification
*Avantage DAG* : Traitement dans l'ordre topologique, pas d'itérations multiples comme Bellman-Ford classique
*Plus court chemin* : $lambda_j = min_(i in "Pred"[j])(lambda_i + c_(i j))$ avec $lambda_s = 0$
*Plus long chemin* : $lambda_j = max_(i in "Pred"[j])(lambda_i + c_(i j))$ avec $lambda_s = 0$
*Algorithme* : Traiter sommets dans ordre topologique, appliquer équation
*Complexité* : $O(n + m)$ (une seule passe suffit grâce au DAG)

= Graphes potentiels-tâches

== Modélisation de projets
- *Sommets* : tâches du projet
- *Arcs* : contraintes de précédence (i précède j)
- *Poids* : durée $d_i$ de la tâche i
- *Ajouts* : sommet début $a$ et fin $w$ (poids 0)

#image("../img/image copy 30.png")

== Méthode du chemin critique
*But* : Identifier les tâches critiques dont tout retard retarde le projet entier
*Applications* : Gestion de projets, planification industrielle, optimisation

*Phase 1 - Calcul dates au plus tôt* (forward pass) :
- $t_a = 0$ (début projet)
- $t_j = max_(i in "Pred"[j])(t_i + d_i)$ pour chaque tâche j
- Traitement dans l'ordre topologique

*Phase 2 - Calcul dates au plus tard* (backward pass) :
- $T_w = t_w$ (durée minimale projet)
- $T_i = min_(j in "Succ"[i])(T_j) - d_i$ pour chaque tâche i
- Traitement dans l'ordre topologique inverse

*Résultats* :
- *Tâche critique* : $t_i = T_i$ (marge libre nulle)
- *Chemin critique* : Succession de tâches critiques de début à fin
- *Durée projet* : $t_w$ (date plus tôt de fin)
- *Marge libre tâche i* : $T_i - t_i$ (retard possible sans impact)

#colbreak()

== Composition d'un nœud
#table(
  align: center + horizon,
  columns: (1fr, 1fr),
  "Nom des tâches", "Numéros topologiques",
  "Date de début au plus tôt", "Date de début au plus tard",
)

= Flots dans un réseau

== Concepts fondamentaux
*Réseau* : $R = (V, E, c, u)$ avec capacités $u_(i j)$ et coûts $c_(i j)$
*Flot compatible* : Respecte capacités et conservation
*Loi de conservation* : $sum_("entrant") = sum_("sortant")$ (sauf source/puits)

#image("../img/image copy 27.png")

== Réseau d'augmentation
*Principe* : Construire graphe permettant d'augmenter le flot
- *Arcs directs* : $(i,j)$ si $x_(i j) < u_(i j)$, capacité résiduelle = $u_(i j) - x_(i j)$
- *Arcs inverses* : $(j,i)$ si $x_(i j) > 0$, capacité = $x_(i j)$ (annuler flot)

#image("../img/image copy 28.png")

== Algorithmes de flot maximum

=== Ford-Fulkerson - $O(m f*)$
*But* : Trouver flot de valeur maximale de source s vers puits t
*Applications* : Réseau transport, affectation ressources, couplage
*Principe général* :
1. Partir d'un flot initial (souvent flot nul)
2. Construire réseau d'augmentation du flot actuel
3. Chercher chemin augmentant de s à t (DFS par exemple)
4. Si chemin existe : augmenter flot et retour étape 2
5. Si aucun chemin : flot actuel est optimal

*Terminaison* : Algorithme se termine quand aucun chemin augmentant
*Complexité* : $O(m f*)$ où $f*$ = valeur flot maximum (non polynomial)

=== Edmonds-Karp - $O(m^2 n)$
*Amélioration de Ford-Fulkerson* : Choix du chemin augmentant
*Stratégie* : Choisir plus court chemin (nombre d'arcs) via BFS
*Avantages* :
- Complexité polynomiale garantie
- Évite cas pathologiques de Ford-Fulkerson
- Plus efficace en pratique sur graphes denses

== Coupe et théorème max-flow min-cut
*Coupe $(S,T)$* : Partition de V avec $s in S, t in T$
*Capacité coupe* : $sum_((i,j): i in S, j in T) u_(i j)$
*Théorème Ford-Fulkerson* : Valeur flot max = capacité coupe min

#image("../img/image copy 32.png")

= Flot maximum à coût minimum

== Algorithme de Busacker-Gowen
*But* : Flot de valeur maximale avec coût total minimal
*Principe* : À chaque itération, saturer le plus court chemin (coût) dans réseau d'augmentation
*Problème* : Arcs inverses ont coûts négatifs → impossibilité d'utiliser Di jkstra

== Fonction de potentiel (Edmonds-Karp)
*Solution* : Transformer les coûts pour éliminer les valeurs négatives
*Potentiel* : $lambda_i$ = distance depuis s dans réseau actuel
*Coût réduit* : $c'_(i j) = c_(i j) + lambda_i - lambda_j$
*Condition* : Réseau de base sans circuits de coût négatif

#image("../img/image copy 35.png")

= Applications des flots

== Couplage maximum dans un graphe biparti
*Transformation* :
1. Orienter arêtes $A arrow B$ (capacité 1)
2. Ajouter source s reliée à A (capacité 1)
3. Ajouter puits t relié depuis B (capacité 1)
4. Flot max = taille couplage max

#image("../img/image copy 34.png")

== Problème d'affectation linéaire
*Contexte* : n personnes, n tâches, coût $c_(i j)$ pour personne i sur tâche j
*Objectif* : Affecter chaque personne à une tâche (coût minimum)
*Méthode* : Couplage parfait de coût minimum → flot max-coût min

== Problème de transbordement
*Modélisation* : Réseau $R = (V, E, c, u)$
- *Sources* : offre $b_i < 0$
- *Puits* : demande $b_i > 0$  
- *Transit* : $b_i = 0$

*Équation conservation* : $sum_(j in "Pred"(i)) x_(j i) - sum_(j in "Succ"(i)) x_(i j) = b_i$
*Condition équilibre* : $sum_(i in V) b_i = 0$

*Transformation en flot max-coût min* :
1. Source artificielle s → sources (coût 0, capacité = |offre|)
2. Puits → puits artificiel t (coût 0, capacité = demande)

*Cas particuliers* :
- *Transport* : graphe biparti complet (sources vers puits)
- *Affectation* : transport avec offres = demandes = 1

#image("../img/image copy 36.png")

= Types de graphes

== Graphes complets et complémentaires
*Graphe complet* $K_n$ : Graphe simple où toute paire sommets distincts reliée
- Nombre arêtes : $binom(n,2) = (n(n-1))/2$
- Tous sommets ont degré $n-1$
- Exemple : $K_4$ a 6 arêtes, $K_5$ a 10 arêtes

*Graphe complémentaire* $overline(G)$ de $G = (V,E)$ :
- Mêmes sommets que G
- Arêtes = toutes arêtes possibles non présentes dans G
- $overline(E) = {{u,v} | {u,v} in.not E, u != v "et" u,v in V}$
- Propriété : $G$ et $overline(G)$ forment partition complète des arêtes

#image("../img/image copy 37.png")

== Tournois
*Définition* : Graphe orienté simple où chaque paire sommets reliée par exactement un arc
*Construction* : Orientation complète d'un graphe complet
*Propriétés fondamentales* :
- Graphe sous-jacent = graphe complet $K_n$  
- Nombre total d'arcs = $binom(n,2)$
- Au plus 1 sommet sans prédécesseurs (source)
- Au plus 1 sommet sans successeurs (puits)

*Caractérisation acyclique* : 
Tournoi sans circuits ⟺ matrice adjacence définit ordre strict total
*Applications* : Modélisation compétitions, classements, votes

== Graphes bipartis
*Définition* : Graphe $G = (V,E)$ avec $V = A union B$ (A,B disjoints) 
tel que toute arête relie sommet de A à sommet de B
*Notation* : $G = (A,B,E)$ ou $G = (A union B, E)$

*Théorème caractérisation* : 
Graphe biparti ⟺ ne contient aucun cycle de longueur impaire

*Graphes bipartis complets* $K_(r,s)$ :
- r sommets dans A, s sommets dans B  
- Toute paire (a∈A, b∈B) reliée par arête
- Nombre arêtes = $r × s$
- Applications : modélisation relations complètes entre deux ensembles

#image("../img/image copy 38.png")

== Couplages et chaînes augmentantes
*Couplage* : Ensemble M ⊆ E d'arêtes sans extrémités communes
- *Couplage parfait* : Sature tous les sommets du graphe
- *Couplage maximum* : Cardinal maximal parmi tous couplages possibles
- *Sommet saturé* : Incident à arête du couplage

*Chaînes alternées* (relativement à couplage M) :
Chaîne dont arêtes alternent : dans M, hors M, dans M, hors M, ...

*Chaînes augmentantes* (relativement à M) :
Chaîne alternée avec extrémités NON saturées par M
*Propriété clé* : Permet augmenter taille couplage de 1

*Théorème de Berge (1957)* - Condition optimalité :
Couplage M maximum ⟺ graphe ne contient aucune chaîne augmentante relative à M

*Applications algorithmes* : Base algorithmes hongrois, Blossom

#image("../img/image copy 40.png")

== Recouvrements et complexité
*Recouvrement* : Arêtes couvrant tous les sommets
*Transversal* : Sommets couvrant toutes les arêtes  
*Complexité* : Recouvrement min = polynomial, Transversal min = NP-difficile

= Graphes planaires

== Définitions et formule d'Euler
*Planaire* : Représentable sur le plan sans croisements d'arêtes
*Faces* : Régions délimitées par les arêtes (incluant face extérieure)
*Formule d'Euler* : $n - m + f = 2$ (graphe connexe planaire)

#image("../img/image copy 41.png")

== Bornes et non-planarité
*Inégalité générale* (graphes simples connexes, $n >= 3$) :
$m <= 3n - 6$

*Démonstration* : 
- Chaque face bordée par ≥ 3 arêtes → $3f <= 2m$ 
- Formule Euler : $f = 2 - n + m$
- Substitution : $3(2-n+m) <= 2m$ → $m <= 3n-6$

*Inégalité bipartie* (graphes bipartis simples connexes, $n >= 4$) :
$m <= 2n - 4$

*Démonstration* :
- Graphe biparti : chaque face bordée par ≥ 4 arêtes → $4f <= 2m$
- Même substitution → $m <= 2n-4$

*Applications non-planarité* :
- $K_5$ : $n=5, m=10$ mais $10 not<= 3(5)-6 = 9$ → non planaire
- $K_(3,3)$ : $n=6, m=9$ mais $9 not<= 2(6)-4 = 8$ → non planaire

*Théorème de Kuratowski (1930)* :
*Subdivision* : Graphe obtenu en insérant sommets au milieu d'arêtes
*Théorème* : Graphe planaire ⟺ ne contient aucune subdivision de $K_5$ ou $K_(3,3)$