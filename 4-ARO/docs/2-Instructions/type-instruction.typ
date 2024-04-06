#import "../../../_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Gestion de la mémoire
  ],
  lesson: "ARO",
  chapter: "2 - Instructions",
  definition: "TBD",
  col: 1,
  doc,
)

= Types d'instruction
Il existe 3 types d'instructions que nous allons voir.
1. instructions de calcul/traitement #sym.arrow (arithmétique et logique)
2. instructions de transfert de donnée
 - interne #sym.arrow interne
 - interne #sym.arrow externe
3. instructions de branchement (saut)

= Format d'une instruction
#image("../../../_src/img/docs/image3.png")
== Opcode
Le champ «opcode» est l’identificateur de l’instruction est permet donc de définir ce que doit celle-ci va devoir faire.
== Opérande(s)
- Les champs opérandes spécifient la destination et les deux opérandes pour le traitement
 - Le nombre d’opérandes peut varier de 1 à 3.
 - Ci-dessous exemple avec le cas général
== Exemple(s)
=== 1 opérande
```shell
INC r1
```
Incrément de r1 de 1.
#image("../../../_src/img/docs/image copy 3.png")
=== 2 opérandes
```shell
ADD r1, r2
```
Addition de r1 et r2 puis stockage dans r1.
#image("../../../_src/img/docs/image copy 2.png")
=== 3 opérandes
```shell 
ADD r1, r2, r3 
```
Addition de r2 et r3 dans r1.
#image("../../../_src/img/docs/image copy.png")

= Execution d'une instruction
Un processeur effectue sans arrêt une boucle composée de trois phases:
1. *FETCH* #sym.arrow recherche de l'instruction : dans un premier temps le processeur va chercher l'instruction à éxécuter en récupèrant l'instruction pointée par le PC (*Program Counter*). Cette instruction sera stockée dans un autre registre du processeur, le IR (*Instruction Register*).
2. *DECODE* #sym.arrow décodage de l'instruction : dans un deuxième temps, chaque instruction est identifiée, grâce à un code (*opcode*). En fonction de ce code, le processeur choisit la tâche à exécuter, c'est-àdire la séquence de micro-instructions à exécuter.
3. *EXECUTE* #sym.arrow exécution de l'instruction : finalement on exécute l'instruction puis revenons à la première.

Deux étapes suplémentaires seront vue dans la suite du cours qui permetteront de compléter ce que fait un procésseur, soit *MEMORY* et *WRITE BACK*.

= Modes d'adressage
Le mode d'adressage correspond à la méthode d'accès au données. En fonction de l’instruction à exécuter, la donnée à utiliser peutêtre différente. Nous pouvons imaginer quelques cas:
- Valeur immédiat: opérande = donnée
- Valeur dans un registre: opérande = no registre
- Valeur en mémoire: opérande = adresse
 - nombreuses variantes pour ce dernier cas

 == Adressage immédiat
 Pour ce qui est de l'adressage immédiat nous aurons une valeur constante dans le champ d'instruction.
 ```shell
 mov rd, #valeur
 add rd, #cte
 ```

 == Adressage direct
 Lors de l'adressage direct nous adressons directement l'adresse de l'opérande. De plus, il existe 2 sous catégories d'adressage direct:
 === Absolu
 Dans ce cas, l'adresse est directement ajoutée dans le champ d'instruction.
 ```shell
  mov r1, 0x1234
  add r1, 0x1234
  ```
 === Par registre
 Dans ce cas, l'adresse est stockée dans un registre donc on met le numéro du registre.
 ```shell
  mov r1, r2
  add r1, r2
  ```
  #image("../../../_src/img/docs/image copy 4.png")

  == Adressage indirect
  Lors de l'adressage indirect, l'adresse de l'opérande est stockée dans un registre.
  ```shell
  mov r1, [0x1234]
  add r1, [2]
  ```
  #image("../../../_src/img/docs/image copy 5.png")

  = Comment interpréter une instruction
  Pour interpréter une instruction, il faut suivre les étapes suivantes:
  Dans notre situation notre instruction vaut ```shell 0x1F19``` et nous travaillons sur un procésseur 16 bits.
  1. La convertir en binaire: ```shell 0001 1111 0001 1001```
  2. Chercher dans la table des instructions l'opcode correspondant à ```shell 00011```
  3. Interpreter les opérandes en fonction de l'opcode trouvé.
  #image("../../../_src/img/docs/image copy 6.png")
