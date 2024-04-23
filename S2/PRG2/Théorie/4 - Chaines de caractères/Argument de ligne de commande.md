---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition
Une fois un code C compilé, le programme s’exécute dans un « environnement » préparé et fourni par le système d’exploitation. Il est donc possible d'appeler du code avec des lignes de commandes.

```C
int main(int argc, char* argv[]) {...}
```

- `argc` ("argument count") contient le nombre d’arguments dans la ligne
- `argv` ("argument vector") contient un tableau de pointeurs vers les arguments

### Structure `argv`
`argv` étant un tableau de pointeur sur des chaînes de caractères. L'élément 0 de ce tableau pointe directement sur le nom du programme. L'ordre des paramètres reprends l'ordre d'écriture dans le terminal.

### Exemple
Dans le cas d'une commande : 

```
ls -l remind.c
```

- `argc` vaut 3
- `argv` contient `0 => ls`, `1 => -l \0`, `2 => remind.c \0` et `3 => NULL`

>[!important]
>Dans tous les cas `argv[argc]` vaut `NULL` car le tableau `argv` fera toujours $n+1$ en taille et aura toujours comme dernier élément un pointeur sur `NULL`.

