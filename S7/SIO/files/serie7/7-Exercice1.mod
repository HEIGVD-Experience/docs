/*
 * Modèlisation de l'exercice 1 de la série 7 (SIO, 2025-2026)
 */

// Variables de décision
set T; // tâches

param Debut{T}; // date de début de chaque tâche

/* Foncion objectif : minimiser la plus grande date de fin d'éxécution */

Min makespan = max{t in T} Debut[t] + Duree[t];

/* Contraintes */

// Ne pas commencer une t'âche avant qu'elle ne soit disponible
subject to
    Disponibilite{t in T}: Debut[t] >= DateDisponibilite[t];

// Terminer chaque tâches avant sa date limite
subject to
    DateLimite{t in T}: Debut[t] + Duree[t] <= DateLimite[t];

// Pour chaque paire de tâches {i,j} i termine avant le début de j ou l'inverse
subject to
    Ordonnancement{i in T, j in T: i < j}:
        Debut[i] + Duree[i] <= Debut[j]
        or Debut[j] + Duree[j] <= Debut[i];


solve;

printf "Date de fin maximale (makespan) : %g\n", makespan;
printf "Dates de début des tâches :\n";
printf {t in T}: "Tâche %g : début à %g\n", t, Debut[t];
printf "\n";

data;

set T := 1 2 3;

p