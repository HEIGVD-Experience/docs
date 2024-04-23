---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Syntaxe](#syntaxe)
	- [Paramètres](#param%C3%A8tres)
		- [IN](#in)
		- [OUT](#out)
		- [INOUT](#inout)
- [Procedure vs Function](#procedure-vs-function)
	- [Procédures](#proc%C3%A9dures)
	- [Fonctions](#fonctions)
- [Exemples](#exemples)

___
## Définition
>[!important]
>En SQL, une procédure stockée (stored procedure) est un ensemble d'instructions SQL précompilées qui peuvent être enregistrées et réutilisées dans une base de données. Une procédure stockée peut accepter des paramètres d'entrée et de sortie, effectuer des opérations sur la base de données, et retourner un résultat ou effectuer une action spécifique.
## Syntaxe
Voici la définition générale d'une procédure stockée en SQL :
```sql
CREATE PROCEDURE nom_de_procedure
    (parametre1 type, parametre2 type, ...)
AS
BEGIN
    -- Instructions SQL de la procédure
END;
```
### Paramètres
Les paramètres de procédure stockée ou de fonction peuvent être définis avec différents modes, tels que `IN`, `OUT`, et `INOUT`. Ces modes déterminent comment les valeurs sont passées entre l'appelant (l'endroit où la procédure ou la fonction est appelée) et la procédure ou fonction elle-même.
#### IN
- Mode utilisé pour transmettre des valeurs de l'appelant à la procédure ou à la fonction.
- La valeur est définie dans l'appelant et ne peut pas être modifiée à l'intérieur de la procédure ou de la fonction.
- Exemple : `IN param1 INT`.
#### OUT
- Mode utilisé pour transmettre des valeurs de la procédure ou de la fonction à l'appelant.
- La valeur initiale dans l'appelant n'a pas d'importance. La procédure ou la fonction affecte une valeur à ce paramètre.
- Exemple : `OUT param1 INT`.
#### INOUT
- Mode utilisé pour transmettre des valeurs dans les deux sens, de l'appelant à la procédure ou à la fonction, et vice versa.
- La valeur initiale est définie dans l'appelant, peut être lue et modifiée à l'intérieur de la procédure ou de la fonction, et la valeur modifiée est renvoyée à l'appelant après l'exécution.
- Exemple : `INOUT param1 INT`.
## Procedure vs Function
Les procédures (procedures) et les fonctions (functions) sont toutes deux des objets de programmation stockés dans une base de données, mais elles présentent des différences fondamentales en termes de structure, de fonctionnement et de but. Voici quelques-unes des différences clés entre les procédures et les fonctions en SQL :
### Procédures
1. **Retour de valeur :** Peut retourner zéro ou plusieurs valeurs via des paramètres d'entrée/sortie, mais n'a pas de valeur de retour explicite.
2. **Utilisation dans des expressions :** Ne peut pas être utilisée dans des expressions SQL.
3. **Structure :** Peut contenir des instructions SQL, des contrôles de flux et n'est pas limitée par la nécessité de retourner une valeur.
4. **Appel :** Généralement appelée avec l'instruction `CALL` ou directement.
5. **Transaction :** Peut modifier l'état de la base de données, mais n'affecte pas automatiquement la transaction en cours.
6. **Gestion d'exceptions :** Peut contenir des gestionnaires d'exceptions.
### Fonctions
1. **Retour de valeur :** Retourne une seule valeur.
2. **Utilisation dans des expressions :** Peut être utilisée dans des expressions SQL.
3. **Structure :** Généralement plus restreinte en termes de complexité logique, conçue pour effectuer un calcul spécifique et renvoyer une valeur.
4. **Appel :** Généralement appelée dans des expressions SQL, comme dans une clause `SELECT`.
5. **Transaction :** Considérée comme plus sûre dans le cadre de transactions car elle ne modifie pas l'état global de la base de données.
6. **Gestion d'exceptions :** Peut contenir des gestionnaires d'exceptions, mais leur utilisation est souvent limitée.

## Exemples
Voici l'exemple d'une `procedure` qui permettrait d'augmenter le salaire d'un employé : 
```sql
CREATE PROCEDURE AugmenterSalaire
    (IN employe_id INT, IN augmentation DECIMAL(10, 2))
AS
BEGIN
    UPDATE employes
    SET salaire = salaire + augmentation
    WHERE id = employe_id;
END;

CALL AugmenterSalaire(4532, 500)
```
Un autre exemple, cette fois en utilisant une `function` permettant de retourner le salaire complet d'un employé en y ajoutant les primes : 
```sql
CREATE FUNCTION CalculerSalaireTotal
    (IN employe_id INT, IN prime DECIMAL(10, 2))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE salaire_base DECIMAL(10, 2);

    -- Récupération du salaire de base de l'employé
    SELECT salaire INTO salaire_base FROM employes WHERE id = employe_id;

    -- Calcul du salaire total en ajoutant la prime
    RETURN salaire_base + prime;
END;

SELECT CalculerSalaireTotal(1, 200.00) AS SalaireTotal;
```
