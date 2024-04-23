---
Type: PriseDeNote
MiseAuPropre: oui
---

## Etablissement connexion TCP
- Le protocole doit tenir compte de la possibilité de doublons
- Mécanisme de TCP : Three way handshake (établissement de connexion en trois temps)
	- Les hôtes se mettent d’accord sur les numéros de séquence initiaux
	- Lors d’une erreur, un message RST (RESET) permet d’interrompre l’établissement de connexion

## Libération d'une connexion TCP
- Les connexions TCP sont bidirectionnelles
	- Libération séparément dans les deux sens
		- Un hôte qui n’a plus de données à transmettre peut fermer la connexion dans une direction
		- L’autre hôte peut continuer à transmettre
	- Deux segments pour libérer un sens de la connexion: FIN + ACK