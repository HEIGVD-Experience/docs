---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Syntaxe](#syntaxe)
	- [Before](#before)
	- [After](#after)
- [Exemple](#exemple)

___
## Définition
>[!important]
>Un déclencheur en SQL est un ensemble d'instructions automatiquement exécutées en réponse à certains événements survenant dans une table ou une vue. Il permet d'automatiser des actions ou des vérifications lors de l'insertion, de la mise à jour ou de la suppression de données dans une base de données.

## Syntaxe
### Before
Les déclencheurs "BEFORE" sont exécutés avant l'événement déclencheur réel, permettant des modifications préalables aux données à insérer.
```sql
CREATE TRIGGER nom_du_declencheur
BEFORE INSERT ON ma_table
FOR EACH ROW
BEGIN
    -- Instructions BEFORE INSERT
END;
```
### After
Les déclencheurs "AFTER" sont exécutés après l'événement déclencheur, facilitant les actions postérieures à l'insertion, à la mise à jour ou à la suppression de données.
```sql
CREATE TRIGGER nom_du_declencheur
AFTER UPDATE ON ma_table
FOR EACH ROW
BEGIN
    -- Instructions AFTER UPDATE
END;
```
## Exemple
Nous souhaitons nous assurer que tout employé du département informatique touche au minimum un salaire de 5000.- mensuel, pour cela nous pouvons écrire le trigger suivant : 
```sql
CREATE TRIGGER before_insert_update_salary
BEFORE INSERT OR UPDATE ON employes
FOR EACH ROW
BEGIN
    IF NEW.departement = 'Informatique' AND NEW.salaire < 5000.00 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Le salaire minimum pour le département Informatique est de 5000.-';
    END IF;
END;
```
