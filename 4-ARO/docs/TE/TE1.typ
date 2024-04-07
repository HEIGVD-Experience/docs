#import "../../../_settings/typst/template-te.typ": *

#show: resume.with(
  "Résumé ARO",
  "Guillaume Trüeb",
  cols: 2
)

== Taille mot mémoire
La taille d'un mot mémoire est forcément un multiple de $8$. C'est pourquoi nous pouvons appliquer le tableau suivant :
#image("../../../_src/img/docs/image.png")

== Gestion des adresses
En fonction de la taille de la mémoire nous aurons une taille d'adresses variables, le tableau suivant représente les possibilités : 
#image("../../../_src/img/docs/image2.png")

== Calculer la mémoire
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
"Taille" = "Adr.Fin" - "Adr.Deb" + 1
$

==== Autre formule
$
"Taille" = 1 << log_2(2^n)
$
$n =$ le nombre de bits alloué à la zone mémoire
Exemple : $2"KB" = 2^10 * 2^1 = 2^11$ donc $n = 11$

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

#colbreak()

== Instructions
#table(
  align: center + horizon,
  columns: (0.5fr, 1fr),
  rows: 10pt,
  table.header(
    [*Mnemonic*],[*Instruction*]
  ),
  "ADC","Add with Carry",
  "ADD","Add",
  "AND","AND",
  "ASR","Arithmetic Shift Right",
  "B","Uncoditional Branch",
  "Bxx","Conditional Branch",
  "BIC","Bit Clear",
  "BL","Branch and Link",
  "BX","Branch and Exchange",
  "CMN","Compare NOT",
  "CMP","Compare",
  "EOR","XOR",
  "LDMIA","Load Multiple",
  "LDR","Load Word",
  "LDRB","Load Byte",
  "LDRH","Load Halfword",
  "LSL","Logical Shift Left",
  "LDSB","Load Sign-Extended Byte",
  "LDSH","Load Sign-Extended Halfword",
  "LSR","Logical Shift Right",
  "MOV","Move Register",
  "MUL","Multiply",
  "MVN","Move NOT(Register)",
  "NEG","Negate (" + $*-1$ + ")",
  "ORR","OR",
  "POP","Pop Register",
  "PUSH","Push Register",
  "ROR","Rotate Right",
  "SBC","Subtract with Carry",
  "STMIA","Store Multiple",
  "STR","Store Word",
  "STRB","Store Byte",
  "STRH","Store Halfword",
  "SWI","Software Interrupt",
  "SUB","Subtract",
  "TST","Test Bits",
)

#table(
  columns: (1fr, 1fr, 1fr),
  table.header(
    [*Décimal*], [*Héxadécimal*], [*Binaire*]
  ),
"0", "0", "0000",
"1", "1", "0001",
"2", "2", "0010",
"3", "3", "0011",
"4", "4", "0100",
"5", "5", "0101",
"6", "6", "0110",
"7", "7", "0111",
"8", "8", "1000",
"9", "9", "1001",
"10", "A", "1010",
"11", "B", "1011",
"12", "C", "1100",
"13", "D", "1101",
"14", "E", "1110",
"15", "F", "1111"
)

== Incrémenter le PC
#table(
  columns: (1fr, 1fr),
  table.header(
    [*Code d'instruction*], [*Incrément*]
  ),
  "8 bits = 1 byte", "1",
  "16 bits = 2 bytes", "2",
  "32 bits = 4 bytes", "4",
)

#colbreak()

== Registres spéciaux
#table(
  columns: (0.5fr, 1fr),
  table.header(
    [*Registre*], [*Objectif*]
  ),
  "R13 / R5", "Stack Pointer (SP) " + sym.arrow + " Stocke la position dans la pile de stockage (interruptions chaînées)",
  "R14 / R6", "Link Register (LR) " + sym.arrow + "Garde l’adresse de retour (appel de fct, interruption)",
  "R15 / R7", "Program Counter (PC) " + sym.arrow + "Stocke l’adresse de la prochaine instruction",
)
Lors d'une interruption on stocke la valeur actuelle du PC dans le LR et on met la valeur de l'adresse de l'interruption dans le PC.