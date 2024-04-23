---
Type: PriseDeNote
MiseAuPropre: oui
---

## Régulation de la vitesse de transmission
- Contrôle de flux
	- Adaptation à la vitesse du récepteur
	- Évite qu’un émetteur rapide surcharge un récepteur lent
- Contrôle de congestion
	- Adaptation à la vitesse du réseau
	- Évite des pertes excessives de paquets à cause d’une surcharge du réseau

## Protocole de fenêtre glissante
- Améliore le taux d’utilisation
	- Permettant à l’émetteur d’envoyer plusieurs paquets avant de devoir attendre un accusé de réception
- Principe
	- Les données dans la fenêtre peuvent être envoyées sans attendre d’acquittement
	- La réception d’un acquittement permet de glisser la fenêtre à droite

## Contrôle de flux dans TCP
- Basé sur un protocole à fenêtre glissante mais avec une taille de fenêtre variable
- La fenêtre utilisable correspond à la place libre dans le tampon du récepteur 
- Chaque accusé de réception indique en plus la taille de la fenêtre (window advertisement)

>[!important]
>En variant la taille de la fenêtre, le récepteur peut contrôler la vitesse de transmission de l’émetteur

