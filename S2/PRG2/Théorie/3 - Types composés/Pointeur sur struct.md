---
Type: PriseDeNote
MiseAuPropre: non
---

## Définition
>[!warning]
>La priorité du `.` est plus grande que celle du `*` donc il est impératif de mettre entre parenthèse la variable.
>```c
>void printPersonne(const struct Personne* p) {
>	printf("%s\n", (*p).nom);
>}

