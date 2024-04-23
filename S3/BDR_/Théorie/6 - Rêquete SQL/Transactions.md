---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [ACID](#acid)
- [Syntaxe](#syntaxe)

___
## Définition
>[!important]
>En SQL, une transaction est un ensemble d'instructions SQL regroupées de manière logique qui sont exécutées comme une unité indivisible. Une transaction garantit l'atomicité, la cohérence, l'isolation et la durabilité, souvent abrégées par le sigle ACID.
## ACID
- **Atomicité**: soit toutes les opérations d’une transaction sont exécutées, soit aucune.
- **Cohérence**: à la fin d’une transaction le contenu de la base de données doit être cohérent, si ce n’est pas le cas toutes les opérations de la transaction doivent être annulées.
- **Isolation**: lorsque deux transactions (A et B) sont exécutées simultanément, les modifications exécutées par l’une doivent être invisibles pour l’autre tant qu’elle n’est pas validée.
- **Durabilité**: une fois validés, les changements apportés par une transaction doivent persister dans la base de données, même en cas d’incident technique.
## Syntaxe
Une transaction doit toujours commencer par le mot clé `BEGIN` et se termine soit par :
- `COMMIT` -> permet de valider la transaction
- `ROLLBACK` ou `ABORT` -> pour annuler la transaction et remettre la base dans son état initial

Dans l'exemple ci-dessous les RHs ont gracieusement accepté de réduire leur salaire de 200.- par mois pour l'attribuer aux employés du service informatique.
```sql
BEGIN;
UPDATE employes SET salaire = salaire + 200 WHERE departement = 'Informatique';
UPDATE employes SET salaire = salaire - 200 WHERE departement = 'RH';
COMMIT;
```
Dans le cas ou nous aurions fait `ROLLBACK` au lieu de `COMMIT`, l'état de la base de donnée serait revenu avant que les opérations aient été faites.