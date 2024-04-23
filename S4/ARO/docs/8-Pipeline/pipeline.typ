#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Pipeline
  ],
  lesson: "ARO",
  chapter: "8 - Pipeline",
  definition: "TBD",
  col: 1,
  doc,
)

= Type de parallélisme

= Taxonomie de Flynn

== SISD

== SIMD

== MISD

== MIMD

= Le pipeline
== Formule séquentielle vs pipeline
$
T_e &= "temps de passage à chaque étape" \
T_p = n * T_e &= "temps de passage pour n étapes" \
T_t = m * T_p &= "temps total pour m personnes" \ \

T_t &= n * m * T_e
$

== Formule pipeline
$
T_t = n * T_e + (m - 1) * T_e
$

== Niveau de pipeline

== Calcul des performances
=== Latence

=== Débit

=== Accélération