---
MiseAuPropre: oui
---

> [!info] 
> La commutation est le processus d’acheminement de données à travers un réseau.

## Commutation de circuits
Les anciens réseaux téléphoniques était typiquement une commutation de circuits.

-   Etablissement d’un circuit par des commutateurs avant la transmission des données
-   Transmission d’un signal analogique ou d’un flux continu de bits

![[/_src/img/docs/Pasted image 20230326134410.png]]

## Commutation de paquets
La commutation de paquets à l’avantage d’être beaucoup plus redondant car la transmissions se passe par paquets. Si le lien réseau se coupe les paquets trouveront une autre chemin pour arriver à leur destination. Les paquets sont numérotés car ils se déplacent de manière **indépendante** Le destinataire recombine les paquets reçus pour obtenir le message.

![[/_src/img/docs/Pasted image 20230326134455.png]]

## Avantages
-   Utilisation économique de la ligne (mutualisation des ressources)
-   Reroutage facile en cas de panne d’un lien
-   Conversion des formats possibles

## Désavantages
-   Délai de transfert variable et plus long
-   Pertes de paquets possibles
-   Nœuds intermédiaires doivent effectuer des opérations complexes