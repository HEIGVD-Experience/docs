#import "../../../_settings/typst/template-te.typ": *

#show: resume.with(
  "Résumé ARO",
  "Guillaume Trüeb",
  cols: 3
)

= Calculer la mémoire
=== Calculer adresse de fin
$
"Adr.Fin" = "Adr.Deb" + "Taille" - 1
$

=== Calculer adresse de début
$
"Adr.Deb" = "Adr.Fin" - "Taille" + 1
$

=== Calculer la taille
$
"Taille" = 1 << log_2(2^n)
$

== Saut inconditionnel
#image("../../../_src/img/docs/image copy 9.png")
L'opcode pour un saut inconditionnel prends 5 bits et le reste est alloué pour donner l'adresse de la prochaine instruction à exécuter.
=== Calcul de l'adresse de saut
Pour calculer l'adresse de saut il suffit d'utiliser la formule suivante : 
$
"Adr" = "PC" + "extension_16bits"("offset"_11 * 2) + 4
$
#table(
  columns: (0.5fr, 1fr),
  table.header(
    [*Code d'instruction*], [*Incrément*]
  ),
  "Adr", "Adresse finale du saut",
  "PC", "Adresse de l'instruction courante",
  "Extension 16 bits", "Extension de l'adresse de saut en y ajoutant la valeur du bit de signe",
  "Offset","Correspond à l'instruction moins les 5 bits de l'opcode",
  "4", "Valeur en fixe à ajouter à l'adresse de saut"
)

== Saut conditionnel
#image("../../../_src/img/docs/image copy 10.png")
Pour calculer l'adresse de saut il suffit d'utiliser la formule suivante *attention elle est légèrement différente de celle pour le saut inconditionnel* : 
$
"Adr" = "PC" + "extension_16bits"("offset"_8 * 2) + 4
$

=== Gestion de la condition
#image("../../../_src/img/docs/image copy 11.png")