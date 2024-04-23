---
MiseAuPropre: oui
---

## Définition
- Un switch Ethernet doit fonctionner sans aucune configuration
- Un switch essaie d’envoyer les trames seulement en direction du destinataire
	- Réduction du trafic sur le réseau
- Nécessite une table de filtrage qui indique le port de sortie pour chaque adresse MAC
	- Aussi appelé « table CAM », mais jamais « table de routage »
- Si une adresse MAC destination est inconnue, le switch envoie la trame sur toutes les sorties

>[!warning] Attention
>Lors-ce que nous parlons de table filtrage, cela n'a rien à voir avec une table de routage (qui elle est rattachée à des routeurs). La table de filtrage permet de dire sur quel port se trouve quelle adresse MAC.


## Table de filtrage
Une table de filtrage est initialement vide. Il initialement diffuser la trame sur toutes les sorties réseau (inondation du réseau). Le switch lira l'adresse source de la trame et ajoutera dans sa table de filtrage le numéro du port depuis lequel est venu la trame et y associera l'adresse MAC.

>[!info]
>Dès que le switch aura à faire avec une adresse MAC il ne fera plus de broadcast mais transmerttera la trame directement à la bonne destination.

La table de filtrage est un gros point de différence entre un switch et un hub. Le hub ne fera que du broadcast, ce qui amène, dans de gros réseaux, à une surcharge. Le switch, quand à lui, après quelques temps permettera de réduire drastiquement la quantité de trames echangées.