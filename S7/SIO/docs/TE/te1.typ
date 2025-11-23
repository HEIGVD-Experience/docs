#import "/_settings/typst/template-te.typ": *
#show: resume.with(
  "Résumé SIO TE1",
  "Guillaume Trüeb",
  cols: 2
)

= Simulation et générateurs

== Pourquoi simuler ?

La simulation permet de modéliser le comportement d'un système réel complexe. Difficultés :
- Choix, conception et validation du modèle
- Collecte et analyse des données
- Mise en œuvre informatique longue
- Risque de bugs
- Analyse statistique rigoureuse nécessaire
- Convergence souvent lente

#info[
Simulation gourmande en temps de conception, développement, validation et calcul.
]

== Génération de nombres aléatoires

Un ordinateur étant déterministe, il génère des *pseudo-nombres aléatoires* (PRNG) via des algorithmes à partir d'une *graine* (seed). Même graine → même séquence.

= Génération de variables aléatoires

Objectif : représenter des phénomènes aléatoires réels dans une simulation.

== Méthode des fonctions inverses

Utilise la fonction de répartition inverse (quantile) pour générer des variables suivant une distribution donnée.

*Variables uniformes* : Générer $u in [0,1]$, puis $x = F^(-1)(u) = a + u(b-a)$

#image("../img/image copy 10.png", width: 90%)

*Variables exponentielles* : Générer $u in [0,1]$, puis $x = -1/lambda ln(1-u)$

#image("../img/image copy 11.png", width: 90%)
== Variables aléatoires discrètes

Méthode des fonctions inverses adaptée : $F^(-1)(u) = min{x | F(x) >= u}$

*Utilisation* : Générer $u in [0,1]$, déterminer $k$ tel que $sum_(i=1)^(k-1) p_i < u <= sum_(i=1)^k p_i$, retourner $x = x_k$

*Variable de Bernoulli* $X tilde B(p)$ : 
- Si $u < p$ : succès ($X=1$)
- Sinon : échec ($X=0$)

*Variable binomiale* $X tilde B(n,p)$ : Répéter $n$ fois Bernoulli et compter les succès

*Variable de Poisson* $X tilde P(lambda)$ : Générer des $y_i tilde E(1)$ jusqu'à $sum_(i=0)^k y_i > lambda$, retourner $k$

== Méthode des mélanges

S'applique quand $F(x) = sum_(i=1)^n p_i F_i(x)$ avec $sum p_i = 1$

*Algorithme* :
1. Générer indice $k$ selon $P(K=i) = p_i$
2. Générer $x$ selon $F_k$

== Méthode des convolutions

S'applique quand $X = X_1 + X_2 + ... + X_n$

*Algorithme* : Générer chaque $x_i$ selon $X_i$, retourner $x = sum x_i$

== Méthode des rejets

Utilise distribution auxiliaire $g(x)$ et constante $M >= 1$ tel que $f(x) <= M dot g(x)$

*Algorithme* :
1. Générer $z$ selon $g(x)$
2. Générer $u tilde U(0,1)$
3. Si $u <= f(z)/(M dot g(z))$ : accepter $z$
4. Sinon : recommencer

Probabilité d'acceptation = $1/M$

= Méthode de Monte-Carlo

Générer un grand nombre de réalisations indépendantes pour estimer des caractéristiques.

== Estimateur classique

Espérance : $hat(mu) = overline(x) = 1/n sum_(k=1)^n x_k$

== Estimateur de la variance

Variance : $hat(sigma)^2 = s^2 = 1/(n-1) sum_(k=1)^n (x_k - overline(x))^2$

== Précision de l'estimateur

Largeur intervalle de confiance : $Delta I_c = 2 z_(1-alpha/2) s/sqrt(n)$

Convergence en $O(1/sqrt(n))$ → diviser par 2 la largeur nécessite 4× plus de réalisations

== Intervalle de confiance

Avec seuil $1-alpha$ : $I_c = [overline(x) - z_(1-alpha/2) s/sqrt(n) ; overline(x) + z_(1-alpha/2) s/sqrt(n)]$

Seuils courants : 95% ($z=1.960$), 99% ($z=2.576$). Nécessite $n >= 30$ observations.

== Méthode d'acceptation-rejet

#image("../img/image copy 12.png", width: 90%)

#image("../img/image copy 13.png", width: 90%)

== Échantillonnage uniforme

#image("../img/image copy 14.png", width: 90%)

#image("../img/image copy 15.png", width: 90%)

== Échantillonnage préférentiel

Génère des points dans les régions favorisant les points contribuant le plus à la valeur de $G$.

#image("../img/image copy 16.png", width: 90%)

#image("../img/image copy 17.png", width: 90%)

= Optimisation combinatoire

Caractérisée par un ensemble de solutions finies mais très grand :
- Ensemble *fini* $S$ de solutions admissibles
- Fonction objectif $f: S arrow RR$

Objectif : $min_(x in S) f(x)$

== Types de problèmes

*Faciles (polynomiaux)* : solution optimale en temps polynomial
- Arbre recouvrant de poids minimal
- Plus court chemin (Dijkstra, Bellman-Ford)

*Difficiles (NP-difficiles)* : pas d'algorithme polynomial connu
- Voyageur de commerce (TSP)
- Stable de cardinal maximum

== Algorithmes de résolution

*Algorithmes exacts* : fournissent toujours une solution optimale
- Problèmes faciles : complexité polynomiale
- Problèmes difficiles : complexité exponentielle

*Algorithmes approximatifs* : solution réalisable mais pas forcément optimale
- Assurent qualité minimale
- Complexité raisonnable (polynomiale)

*Algorithmes heuristiques* : solution sous-optimale en général
- Aucune garantie sur la qualité
- Efficaces en pratique
- Fournissent souvent de bonnes solutions empiriquement

== Types d'heuristiques

*Heuristiques constructives* : construisent une solution pas à pas en ajoutant des éléments

*Heuristiques d'amélioration* : partent d'une solution admissible et cherchent à l'améliorer en explorant son voisinage

= Heuristiques de coloration

== Coloration d'un graphe

Soit $G = (V, E)$ un graphe non orienté. Une *coloration* affecte des couleurs aux sommets tels que deux sommets adjacents n'ont pas la même couleur. But : minimiser le nombre de couleurs.

== Heuristique LF (largest-first)

Ordonner les sommets par ordre décroissant de degré et les colorier dans cet ordre.

*Étapes* :
1. Calculer le degré de chaque sommet
2. Trier les sommets par degré décroissant
3. Pour chaque sommet dans l'ordre :
  - Assigner la plus petite couleur non utilisée par ses voisins
  - Si toutes les couleurs sont utilisées, créer une nouvelle couleur

#image("../img/image.png", width: 90%)

== Heuristique SL (smallest-last)

Colorier le plus petit sommet (degré minimal) dans le sous-graphe restant, puis le retirer. Répéter jusqu'à tous les sommets colorés. Coloration dans l'ordre inverse de suppression.

*Étapes* :
1. Initialiser une pile vide
2. Tant qu'il reste des sommets :
  - Trouver le sommet de degré minimal dans le sous-graphe restant
  - Empiler ce sommet
  - Retirer le sommet du graphe (et ses arêtes)
3. Tant que la pile n'est pas vide :
  - Dépiler un sommet
  - Lui assigner la plus petite couleur non utilisée par ses voisins

#image("../img/image copy.png", width: 90%)

== Heuristique DSATUR

Colorier les sommets selon leur degré de saturation : nombre de couleurs différentes déjà utilisées par leurs voisins.

*Étapes* :
1. Colorier le sommet de degré maximal avec la couleur 1
2. Pour chaque sommet non coloré, calculer DSAT = nombre de couleurs distinctes utilisées par ses voisins
3. Choisir le sommet avec DSAT maximal (en cas d'égalité, choisir celui de degré maximal)
4. Lui assigner la plus petite couleur non utilisée par ses voisins
5. Répéter les étapes 2-4 jusqu'à ce que tous les sommets soient colorés

#image("../img/image copy 2.png", width: 90%)

#image("../img/image copy 3.png", width: 90%)

== Heuristique RLF (recursive largest-first)

Construit séquentiellement une partition du graphe en sous-ensembles stables ${C_1,...,C_k}$, chaque ensemble $C_i$ recevant la couleur $i$.

*Principe* : Pour chaque couleur, construire le plus grand ensemble stable possible en sélectionnant les sommets qui ont le plus de voisins déjà exclus.

*Étapes détaillées* :
1. *Initialisation* : Choisir le sommet $v$ de degré maximal (le plus connecté)
2. *Créer les ensembles* :
  - $C := {v}$ : ensemble des sommets qui recevront la couleur actuelle
  - $U := "Adj"[v]$ : sommets adjacents à $C$ (exclus pour cette couleur)
  - $W := V without ("Adj"[v] union {v})$ : sommets candidats (ni dans $C$, ni adjacents à $C$)
3. *Agrandir l'ensemble stable $C$* :
  - Tant que $W$ non vide :
    - Choisir $w in W$ ayant le *maximum* de voisins dans $U$
    - Ajouter $w$ à $C$
    - Mettre à jour $U := U union "Adj"[w]$ (ajouter les voisins de $w$)
    - Mettre à jour $W := W without ("Adj"[w] union {w})$ (retirer $w$ et ses voisins)
4. *Assigner la couleur* : Tous les sommets de $C$ reçoivent la même couleur
5. *Récursion* : Répéter avec les sommets restants jusqu'à ce que tous soient colorés

== Remarques performances

1. Les 4 heuristiques utilisent au plus $Delta(G) + 1$ couleurs
2. Performance vérifiée par tous les algorithmes gloutons
3. DSATUR et RLF optimales pour graphes bipartis (≤ 2 couleurs)
4. DSATUR et RLF empiriquement supérieures mais plus lentes

= Heuristiques pour le TSP

*Problème du voyageur de commerce* : trouver la tournée la plus courte visitant chaque ville une seule fois.

== Plus proche voisin

1. Choisir ville de départ aléatoirement
2. Visiter ville la plus proche non visitée
3. Répéter jusqu'à toutes visitées
4. Retourner à la ville de départ

#image("../img/image copy 4.png", width: 90%)

== Heuristique gloutonne

1. Ensemble vide d'arêtes
2. Trier arêtes par coût croissant
3. Ajouter arêtes sans créer cycle prématuré ni degré > 2
4. Répéter jusqu'à toutes villes connectées

#image("../img/image copy 5.png", width: 90%)

== Insertion la moins coûteuse

1. Tournée partielle : ville + plus proche voisine
2. Pour chaque ville non incluse : calculer coût d'insertion
3. Insérer ville avec augmentation de coût minimale
4. Répéter jusqu'à toutes incluses

== Insertion la plus coûteuse

Même principe que la moins coûteuse, mais insérer la ville avec augmentation de coût maximale.

== Christofides

Garantit solution ≤ 1,5× coût optimal (avec inégalité triangulaire).

*Principe* : Transformer cycle eulérien en cycle hamiltonien.

1. Arbre recouvrant $T$ de poids minimum
2. Couplage parfait $M$ de poids minimum sur sommets degré impair de $T$
3. Ajouter arêtes de $M$ à $T$ → graphe avec tous sommets degré pair → cycle eulérien
4. Parcourir cycle avec raccourcis pour éviter visites multiples

#image("../img/image copy 6.png", width: 90%)

== Meilleurs fusions

1. Chaque ville = sous-tour individuel
2. Calculer coût de fusion pour chaque paire
3. Fusionner paire avec plus faible augmentation
4. Répéter jusqu'à un seul tour

