---
Type: PriseDeNote
MiseAuPropre: oui
---
## Définition
>[!important]
>Un décodeur détecte la présence d’une combinaison spécifique en entrée 
>Pour un décodeur à n entrées, il y en a $2^n$ sorties.
>Application typique: décodage d’adresses pour la mémoire But : activer la sortie dont on donne le numéro sous forme binaire (entier non signé).
>- décode la valeur binaire d'entrée de n bits 
>- génère tous les mintermes de l'entrée n bits
>
>Une seule sortie active simultanément -> correspond à un minterme

![](..//_src/img/docs/Pasted%20image%2020231026133039.png)
![](..//_src/img/docs/Pasted%20image%2020231026135512.png)

Les images présentées ci-dessus présente le fonctionnement ainsi que la table de vérité d'un décodeur à `4 bits`.
Ci-dessous la version avec le **enable**.
![](..//_src/img/docs/Pasted%20image%2020231026135806.png)
>[!important]
>Un décodeur permet donc de choisir une sortie précise et **unique** en fonction des bits d'entrée. La valeur numérique des bits représente la valeur 1 des mintermes.

![](..//_src/img/docs/Pasted%20image%2020231026140408.png)
