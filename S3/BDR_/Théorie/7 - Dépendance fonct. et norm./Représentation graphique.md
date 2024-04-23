---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Attributs singletons](#attributs-singletons)
- [Attributs multiples](#attributs-multiples)
- [Fermeture transitive](#fermeture-transitive)
	- [Notation](#notation)
	- [Exemple](#exemple)
- [Equivalence des DFs](#equivalence-des-dfs)
	- [Contre-exemple](#contre-exemple)
- [Couverture minimale](#couverture-minimale)
	- [Vérification](#v%C3%A9rification)
	- [Graphe minimal](#graphe-minimal)
___
## Définition
>[!important]
>Il est possible de représenter graphiquement un ensemble F de DFs élémentaires en utilisant un graphe orienté acyclique.

## Attributs singletons
Dans le cas ou tous les attributs déterminants sont des singletons nous aurons le graphe suivant :
$$
\begin{align}
\{NoVéh\} &\to \{Couleur\} \\
\{NoVéh\} &\to \{Type\} \\
\{Type\} &\to \{Marque\} \\
\{Type\} &\to \{Puissance\}
\end{align}
$$
![](/_src/img/docs/Pasted%20image%2020240102151138.png)
Les arcs sont uniques entre chaque attribut car il n'y a aucune relation basé sur une combinaison de plusieurs attributs.
## Attributs multiples
Dans le cas ou une composition d'attributs servent de clé sur un ou plusieurs attributs alors nous aurons le type de graphe suivant :
$$
\begin{align}
\{A,B\} &\to \{C,D\} \\
\end{align}
$$
![](/_src/img/docs/Pasted%20image%2020240102151835.png)
La relation entre A et B est le point de départ de la relation sur les attributs C et D.
## Fermeture transitive
>[!important]
>À partir d’un ensemble de DFs élémentaires on peut parfois **composer par transitivité** d’autres DFs élémentaires.
### Notation
L’ensemble des DFs élémentaires enrichi des DFs élémentaires obtenues par transitivité est la **fermeture transitive**, notée $F^T$.
### Exemple
![](/_src/img/docs/Pasted%20image%2020240102152216.png)
## Equivalence des DFs
>[!important]
>Deux ensembles de DFs élémentaires sont dits **équivalents** s’ils ont la même fermeture transitive.
### Contre-exemple
![](/_src/img/docs/Pasted%20image%2020240102152935.png)

**Les deux premières DFs dans F1 et F2 sont identiques.**

$F1^T$ contient les 2 autres DFs de F2 mais $F2^T$ ne contient pas les 2 autres DFs de F1. Nous pouvons donc en conclure que F1 et F2 **ne sont pas équivalent**.
## Couverture minimale
>[!important]
>En pratique il est intéressant de pouvoir déterminer un ensemble minimal de DFs élémentaires permettant de générer toutes les autres, c’est la couverture minimale (notée $F_{min}$). 
>La couverture minimale d'un ensemble de dépendances fonctionnelles $F$ est un sous-ensemble minimal de $F$ qui a le même ensemble de dépendances fonctionnelles. En d'autres termes, il s'agit de l'ensemble le plus petit de dépendances fonctionnelles qui exprime exactement les mêmes contraintes que l'ensemble original.
### Vérification
La couverture minimale permet de vérifier plusieurs points pour un ensemble de DFs élémentaires. Ces points sont : 
- Chaque DF de $F_{min}$ **est élémentaire**
- Aucune DF de $F_{min}$ **est redondante**
	- Aucune DF n’est déduite et aucune DF ne peut être supprimée sans modifier la fermeture de $F_{min}$
- Toute DF de $F_{min} \in F^T$

Tout ensemble de DFs admet au moins une **couverture minimale**!
### Graphe minimal
Le graphe de $F_{min}$ s’appel **graphe minimal** des DFs
![](/_src/img/docs/Pasted%20image%2020240102163239.png)
