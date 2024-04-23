---
Type: PriseDeNote
MiseAuPropre: oui
---
**Table des matières**
- [Définition](#d%C3%A9finition)
- [Première forme normale (1FN)](#premi%C3%A8re-forme-normale-1fn)
	- [Exemple](#exemple)
- [Deuxième forme normale (2FN)](#deuxi%C3%A8me-forme-normale-2fn)
	- [Exemple](#exemple)
- [Troisième forme normale (3FN)](#troisi%C3%A8me-forme-normale-3fn)
	- [Exemple](#exemple)
- [Frome norme de Boyce-Codd (FNBC)](#frome-norme-de-boyce-codd-fnbc)

___
## Définition
>[!important]
>Les formes normales sont des règles de conception de base de données relationnelles visant à minimiser la redondance des données et à prévenir certaines anomalies de mise à jour. Il existe plusieurs formes normales, dont les trois premières sont les plus couramment utilisées : la première forme normale (1NF), la deuxième forme normale (2NF) et la troisième forme normale (3NF).
## Première forme normale (1FN)
Une relation r est dite en première forme normale (1FN) si tout attribut de r contient une valeur atomique.
- Aucun attribut ne doit être composite ou multivalué
### Exemple
![](../../../../S0/PiecesJointes/Pasted%20image%2020240114152808.png)
## Deuxième forme normale (2FN)
Une relation r est dite en deuxième forme normale (2FN) si
- r est en **1FN**
- Toutes les colonnes non clés dépendent entièrement de la clé primaire
### Exemple
![](../../../../S0/PiecesJointes/Pasted%20image%2020240114153035.png)
Une décomposition qui serait de type **2FN** vaudrait ça : 
$$
\begin{align}
&r_{1} (K_{1}, K_{2}, X) \\
&r_{2} (K_{2}, Y)
\end{align}
$$
## Troisième forme normale (3FN)
Une relation r est dite en troisième forme normale (3FN) si
- r est en **2FN**
- Les colonnes non clés ne doivent pas dépendre d'autres colonnes non clés.
### Exemple
![](../../../../S0/PiecesJointes/Pasted%20image%2020240114153654.png)
La 3FN permet d’éliminer les redondances dues aux dépendances transitives.
## Frome norme de Boyce-Codd (FNBC)
Une relation r est dite en forme normale de Boyce-Codd (FNBC) s’il n’existe aucune dépendance fonctionnelle autre que K -> A ou
- K est la clé
- A est un attribut non clé

>[!warning]
>La forme normale de Boyce-Codd implique d'être en 3FN mais pas l'inverse!

