---
Type: PriseDeNote
MiseAuPropre: non
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Jointure](#jointure)
	- [Syntaxe](#syntaxe)
	- [Jointure naturelle](#jointure-naturelle)
- [Division](#division)
- [Intersection](#intersection)
- [Renommage](#renommage)
___
## Définition
>[!important]
>L'algèbre relationnelle est un langage formel utilisé pour décrire les opérations sur les relations dans le contexte des bases de données relationnelles. Elle a été développée par Edgar F. Codd, un informaticien, dans les années 1970. Celui-ci contient des opérateurs secondaires qui serviront à manipuler les données de tables.

## Jointure
La jointure s'obtient en utilisant le produit cartésien ainsi qu'en ajoutant une sélection sur celui-ci.
Dans cet exemple nous reprenons celui présenté pour le produit cartésien présenté [ici](Opérateur%20fondamentaux.md#produit-cart%C3%A9sien).
![](../../../../S0/PiecesJointes/Pasted%20image%2020231230111215.png)
En rajoutant la condition $\sigma$ `Salle.idCinéma = Cinéma.id` cela évite que des cinémas soient en relation avec des salles ne leur appartenant pas.

### Syntaxe
La syntaxe est la suivante :
![](../../../../S0/PiecesJointes/Pasted%20image%2020231230113758.png)
- c est le critère de rapprochement qui est une opération de comparaison entre un attribut de r et un attribut de s (**Le seul opérateur réellement utilisé est =**)
- Dans la grande majorité de cas, la comparaison se fait entre la clé étrangère d’une des relations et la clé primaire de l’autre relation

Si l'on reprend la requête de l'exemple suivant nous aurons : 
![](../../../../S0/PiecesJointes/Pasted%20image%2020231230113948.png)
>[!warning]
>Quand le critère de rapprochement est une **égalité**, la jointure s’appelle une **équi-jointure** (sinon c’est une thêta-jointure).

### Jointure naturelle
Si aucun critère de rapprochement n’est précisé, la jointure est une équi-jointure qui se fait sur **tous les attributs qui ont le même nom dans les deux relations**.

![](../../../../S0/PiecesJointes/Pasted%20image%2020231230114458.png)

>[!warning]
>À noter qu’**une seule occurrence** de chaque attribut de même nom (ici idRéalisateur) est gardée dans le résultat

## Division
La division en algèbre relationnelle sélectionne des tuples d'une table (dividende) associés à tous les tuples d'une autre table (diviseur). Elle est utilisée dans des requêtes complexes impliquant plusieurs relations, en particulier pour exprimer des conditions d'existence où l'on veut extraire des enregistrements correspondant à toutes les combinaisons possibles de valeurs dans une autre table.
![](../../../../S0/PiecesJointes/Pasted%20image%2020231230155947.png)
## Intersection
- L’intersection s’écrit: $r \cap s$
	- Le résultat est une relation r' qui contiendra tous les tuples communs à r et s
	- Les éventuels doublons sont supprimés
	- r et s doivent être de même schéma
![](../../../../S0/PiecesJointes/Pasted%20image%2020231230160808.png)
## Renommage
- L’opérateur de renommage s’écrit: $PA \to B (r)$ ou $PB/A (r)$
	- Le résultat est une relation r' qui contiendra tous les tuples de r mais en renommant l’attribut A en B
	- Il existe une notation abrégée qui permet de ne spécifier que les nouveaux noms des attributs: $P(B, C,..) (r)$. Cette notation impose de renommer tous les attributs de r
![](../../../../S0/PiecesJointes/Pasted%20image%2020231230161121.png)
