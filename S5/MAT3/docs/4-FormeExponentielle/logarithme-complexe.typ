#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Logarithmes complexes
  ],
  lesson: "MAT3",
  chapter: "4 - Forme Exponentielle",
  definition: "Le document aborde le logarithme complexe, expliquant que la fonction exponentielle n'est pas bijective, ce qui entraîne l'existence d'une infinité de solutions pour les logarithmes complexes. Il présente également la forme exponentielle du logarithme et introduit la notion de détermination principale, qui est une solution unique avec une partie imaginaire dans un intervalle donné.",
  col: 1,
  doc,
)

= Logarithme complexe

== Propriétés du logarithme complexe

La fonction exponentielle complexe n'est pas bijective, donc elle ne peut pas être inversée sur tout l'espace des nombres complexes. Cependant, pour tout nombre complexe non nul $w$, l'équation $e^z = w$ admet une infinité de solutions. On appelle toute solution $z$ un logarithme complexe de $w$.

== Exemple

Prenons $w = 1$. Alors $z = 0$ est un logarithme complexe de $w$, et aussi $z = 2 pi j$ car $e^(2 pi j) = 1$. Plus généralement, tous les logarithmes complexes de $w = 1$ sont $z = 2 pi k j$ pour $k ∈ Z$.

= Logarithme complexe sous forme exponentielle

Si $w = "RE"^(j theta)$ est sous forme exponentielle, un logarithme complexe de $w$ est $z = ln(r) + j theta$ car $e^z = w$. Tous les logarithmes complexes de $w ≠ 0$ sont donc équivalents modulo $2 pi j$.

== Détermination principale du logarithme

La détermination principale du logarithme de $w ≠ 0$, notée $"Log"(w)$, est l'unique solution de $e^z = w$ dont la partie imaginaire est dans $] -π, π]$. Pour calculer $"Log"(w)$, on écrit $w$ sous forme exponentielle en utilisant son argument principal.

== Exemple

Pour $w = j - √3$, on a $w = 2e^(5pi/6 j)$ et $"Log"(w) = ln(2) + 5π/6 j$.