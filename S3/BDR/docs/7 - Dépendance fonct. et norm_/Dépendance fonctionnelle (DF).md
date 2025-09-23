---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Nomenclature](#nomenclature)
- [Déterminant non-clé](#d%C3%A9terminant-non-cl%C3%A9)
	- [Autre exemple](#autre-exemple)
- [Règles d'inférence](#r%C3%A8gles-dinf%C3%A9rence)
- [Fermeture ensemble attributs](#fermeture-ensemble-attributs)
	- [Algoritme (pseudo-code)](#algoritme-pseudo-code)
	- [Exemple](#exemple)
- [DF élémentaire](#df-%C3%A9l%C3%A9mentaire)
___
## Définition
>[!important]
>Une dépendance fonctionnelle est un lien entre plusieurs attributs imposé par une contrainte métier. Cela représente d'une certaine manière une contrainte d'intégrité. Une DF doit être valide **en tout temps** dans une base de données.

## Nomenclature
Une DF s'exprime de la manière suivante : 
$$
\{attribut 1\} \to \{attribut 2, attribut 3, \dots\}
$$
Si nous reprenons l'exemple dans le chapitre [Décomposition](Décomposition.md#Utilisation) alors nous pourrons voir que cela serait noté : 
![](/_src/img/docs/Pasted%20image%2020231231153931.png)
## Déterminant non-clé
Une DF dont le déterminant n’est pas une clé de la relation crée des redondances. Cela a été vu dans l'exemple discuté ci-dessus.
![](/_src/img/docs/Pasted%20image%2020231231154241.png)
Dans la première décomposition chaque déterminant d'une DF est une clé de sa relation, il n'y a donc plus de redondances.
![](/_src/img/docs/Pasted%20image%2020231231154427.png)

### Autre exemple
Exemple d’une relation dans laquelle le déterminant d’une DF n’est qu’une partie d’une clé.
![](/_src/img/docs/Pasted%20image%2020231231155021.png)
## Règles d'inférence
- Si une relation vérifie une dépendance fonctionnelle donnée (DF), elle vérifie également d'autres DF obtenues par des règles d'inférence à partir de la DF donnée.
- Les règles d'inférence, parfois appelées règles de dérivation, permettent d'obtenir de nouvelles DF à partir des DF existantes.
- La notation $F⊨X→Y$ indique que la $DF \>X→Y$ peut être inférée à partir de l'ensemble des $DF \> F$.
- Soit $F$ un ensemble initial de $DF$. L'ensemble de toutes les $DF$ dérivées de $F$ constitue la fermeture de $F$. Cette fermeture est notée $F^+$.
## Fermeture ensemble attributs
Pour savoir si une $DF$ fait partie de $F^+$ , donc découle d’un ensemble initial $F$ de $DFs$, il existe aussi un algorithme. Celui-ci permet d'obtenir tous les attributs déterminés par un ensemble d'attributs X relativement à un ensemble $F$ de $DFs$. Il repose sur la notion de **fermeture d’un ensemble d’attributs**.
### Algoritme (pseudo-code)
![](/_src/img/docs/Pasted%20image%2020240101105910.png)
### Exemple
![](/_src/img/docs/Pasted%20image%2020240101110312.png)
## DF élémentaire
Une DF $X \to Y$ est élémentaire si:
- Y est un singleton ne contenant qu’un attribut $A \notin X$
- Il n’existe pas de $X’  \subset X$ tel que $X’ \to Y$

![](/_src/img/docs/Pasted%20image%2020240101110752.png)
