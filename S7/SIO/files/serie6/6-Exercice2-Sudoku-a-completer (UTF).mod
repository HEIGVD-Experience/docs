/*
 * Modélisation de la résolution d'un grille de Sudoku (Série 6 - Exercice 2, SIO, 2025-2026)
 */

/* Ensemble des lignes, des colonnes et des valeurs possibles des cases de la grille */
set N := 1..9;

/* Variable de décision : x[i,j,k] = 1 si la case en ligne i et colonne j recoit la valeur k, 0 sinon */
var x{(i,j,k) in N cross N cross N}, binary;

/* Ensemble des cases déjà remplies dans la grille */
set Fixees within N cross N cross N;

/*
 * Contraintes : à compléter
 */
 
/* Fixe les valeurs des cases déjà remplies */
subject to ValeursFixees{(i,j,k) in Fixees}:
	x[i,j,k] = 1;

/* Dans chaque sous-carré principal 3x3, chaque valeur k doit apparaître une et une seule fois */
subject to SousCarre{k in N, p in 1..3, q in 1..3}:
	sum{i in (3*p-2)..(3*p)} sum{j in (3*q-2)..(3*q)} x[i,j,k] = 1;

/* Dans chaque ligne i, chaque valeur k doit apparaître une et une seule fois */
subject to Ligne{i in N, k in N}:
	sum{j in N} x[i,j,k] = 1;

/* Dans chaque colonne j, chaque valeur k doit apparaître une et une seule fois */
subject to Colonne{j in N, k in N}:
	sum{i in N} x[i,j,k] = 1;

/* Chaque case (i,j) doit recevoir une et une seule valeur k */
subject to UnSeulChiffre{i in N, j in N}:
    sum{k in N} x[i,j,k] = 1;

/*
 * Fonction objectif : à compléter
 */

minimize Rien: 0;

solve;

for {i in N} {
	printf{0..0: i = 1 or i = 4 or i = 7} " +-------+-------+-------+\n";
	for {j in N} {
		printf{0..0: j = 1 or j = 4 or j = 7} " |";
		printf{k in N: x[i,j,k] = 1 and sum{l in N} x[i,j,l] = 1} " %d", k;
		printf{0..0: sum{k in N} x[i,j,k] != 1} "  ";
		printf{0..0: j = 9} " |\n";
   }
	printf{0..0: i = 9} " +-------+-------+-------+\n";
}

data;

/* Grille facile */
# set Fixees := 
# 	(2,2,4) (2,3,6) (2,7,2) (2,8,3) (3,1,1) (3,2,8) (3,4,6) (3,6,9) (3,8,5) (3,9,7) (4,1,4) (4,3,8) (4,4,9) (4,6,1) (4,7,5) (4,9,6)
# 	(6,1,6) (6,3,9) (6,4,2) (6,6,7) (6,7,1) (6,9,3) (7,1,7) (7,2,6) (7,4,8) (7,6,5) (7,8,2) (7,9,9) (8,2,9) (8,3,4) (8,7,7) (8,8,8);

/* Grille moyenne */
set Fixees := 
	(1,3,6) (1,4,4) (1,5,5) (2,4,9) (2,7,3) (2,8,4) (3,2,8) (3,7,2) (4,1,5) (4,2,4) (4,6,7) (5,2,6) (5,3,1)
	(5,7,4) (5,8,9) (6,4,6) (6,8,8) (6,9,5) (7,3,8) (7,8,3) (8,2,1) (8,3,4) (8,6,9) (9,5,4) (9,6,8) (9,7,7);

/* Grille difficile */
# set Fixees := 
# 	(1,1,6) (1,3,7) (1,8,3) (2,1,1) (2,4,2) (2,5,9) (2,7,6) (3,4,7) (4,1,4) (4,8,2) (4,9,5) (5,3,5) 
# 	(5,5,7) (5,7,9) (6,1,3) (6,2,8) (6,9,6) (7,6,6) (8,3,3) (8,5,1) (8,6,4) (8,9,9) (9,2,6) (9,7,2) (9,9,1);

/* Grille diabolique */
# set Fixees := 
# 	(1,3,5) (1,5,4) (1,9,6) (2,1,8) (2,4,5) (3,1,2) (3,3,7) (3,4,6) (3,6,3) (4,1,4) (4,5,5) (4,7,2) (4,9,7)
# 	(5,6,2) (5,8,6) (5,9,1) (6,4,1) (6,7,3) (6,8,8) (7,8,5) (8,1,1) (8,6,7) (8,9,2) (9,7,6) (9,9,3);

end;
