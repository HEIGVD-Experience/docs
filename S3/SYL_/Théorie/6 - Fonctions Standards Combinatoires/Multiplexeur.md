---
Type: PriseDeNote
MiseAuPropre: oui
---
## Définition
>[!important]
>Le multiplexeur fonctionne un peu comme un aiguillage de train. Il permet de transmettre sur la sortie l’entrée sélectionnée par son numéro

![](..//_src/img/docs/Pasted%20image%2020231109172543.png)

![](..//_src/img/docs/Pasted%20image%2020231026140449.png)
Ci-dessous la version avec le **enable**.
![](..//_src/img/docs/Pasted%20image%2020231026140555.png)
## Table de vérité
![](..//_src/img/docs/Pasted%20image%2020231026140656.png)
## Formule à retenir
$$
EN * (SEL * D0 + Sel \>\> D1  )
$$

>[!attention]
>Important: le sommet de plusieurs MUX mis à la suite est forcément le bit de poids fort.

