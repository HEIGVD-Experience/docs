---
Type: PriseDeNote
MiseAuPropre: oui
---

>[!important]
>La librairie stdio.h fournit une collection de constantes, de macros et de fonctions pour les opérations d’entrées / sorties.

## Printf
La fonction **printf** permet d'afficher des valeurs dans le terminal. 
```c
printf("const char* format", val1, val2, etc);
```
Printf possède **deux** paramètre obligatoires. Le premier est de type `const char*` et permet de définir les paramètres d'affichage. Le deuxième sera la valeur à afficher et en fonction des paramètres d'affichage nous pouvons afficher plusieurs valeurs.

### Type de valeur à afficher 
Nous avons plusieurs paramètres en fonction du type que nous souhaitons afficher. 
![](/_src/img/docs/Pasted image 20230411101200.png)
### Instructions d'affichage
Les instructeurs d'affichage permettent de modifier l'affichage possible avec le **printf**.
![](/_src/img/docs/Pasted image 20230411105520.png)
#### Flags

|Flags|Description|
|----|----|
|-|Permet de forcer l'alignement à gauche des valeurs dans la plage d'espace définie par l'instruction `width`.|
|+|Permet de forcer l'affichage du signe `+/-` alors que de base s'affiche uniquement quand nous avons le signe `-`.|
|espace|Si aucun signe ne doit être écrit, un espace blanc est inséré avant la valeur.|
|#|Utilisé avec les descripteurs `o,x ou X` cela permet d'afficher le `0, 0x ou 0X` au début des pointeurs affichés. <br> Dans le cas des `G, g` cela remplira de 0 après la virgule jusqu'à atteindre 6 chiffres significatifs.<br>Avec les autres il force la sortie écrite à contenir un point décimal même si aucun chiffre ne suit.|
|0|Le nombre est rempli à gauche avec des zéros (0) au lieu d'espaces lorsque le remplissage est spécifié (voir le sous-spécificateur de largeur).|

#### Width

|Width|Description|
|----|----|
|nombre|Nombre minimum de caractères devant être affichés. Si le nombre de valeur à afficher est plus petit que le nombre pouvant être affichés, alors on rempli d'espace vide. La valeur n'est jamais tronquée même si le résultat est plus grand.|
|\*|La largeur n'est pas spécifiée dans la chaîne de format, mais en tant qu'argument supplémentaire de valeur entière précédant l'argument qui doit être formaté.|

#### Precision

|Precision|Description|
|----|----|
|.nombre|`d, i, o, u, x, X` : la précision spécifie le nombre minimum de chiffres à écrire. Si la valeur à écrire est plus courte que ce nombre, le résultat est complété par des zéros initiaux. La valeur n'est pas tronquée même si le résultat est plus long. Une précision de 0 signifie qu'aucun caractère n'est écrit pour la valeur 0.<br> `a, A, e, E, f et F` : nombre de chiffres à imprimer après la virgule (par défaut, ce nombre est de 6). <br>`g et G` : C'est le nombre maximum de chiffres significatifs à imprimer. <br>`s` : il s'agit du nombre maximal de caractères à imprimer. Par défaut, tous les caractères sont imprimés jusqu'à ce que le caractère nul final soit rencontré.|
|.\*|La précision n'est pas spécifiée dans la chaîne de formatage, mais en tant qu'argument supplémentaire de valeur entière précédant l'argument à formater.|

#### Length
![](/_src/img/docs/Pasted image 20230411143424.png)

## Scanf
La fonction **scanf** permet la lecture et la conversion de caractères depuis stdin dans des variables. 
```c
scanf("const char* format", val1, val2, etc);
```
**Scanf** prends 2 paramètres obligatoires, le premier est un `const char*` permettant de définir le type de valeur que nous voulons stocker, le deuxième sera l'adresse mémoire de la valeur dans la quelle il doit aller écrire. De plus **scanf** retourne le nombre de données saisies avec succes.

>[!attention]
> **Scanf** essaie de faire matcher les suites de caractères mais s'arrêtera au premier caractère qui ne correspond pas au type demandé.

De plus le caractère **espace** se verra comme un séparateur de valeurs, mais dans le cas ou on précise le type de séparateur plusieurs cas existent : 
![](/_src/img/docs/Pasted image 20230411161507.png)
### Cas spéciaux
![](/_src/img/docs/Pasted image 20230411161755.png)
