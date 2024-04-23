---
Type: PriseDeNote
MiseAuPropre: oui
---


## Service offert par le protocole IP
- Transmisions sans connexion
	- Aucun établissement de connexion avant l’envoi des données
	- Un paquet (appelé « datagramme IP ») contient toutes les informations nécessaires à son traitement
- Service non fiable « Best Effort »
	- IP essaie au mieux de transmettre les paquets, mais ne garantit rien
	- Les paquets peuvent être perdus, arriver en désordre, arriver en retard
- Fragmentation et réassemblage
	- Une source de paquets ne connaît pas le chemin emprunté, ni les technologies sous-jacentes. Elle ne peut pas anticiper la taille de paquet maximum possible
	- Les routeurs intermédiaires peuvent fragmenter un datagramme en plusieurs fragments plus petits

## Format des datagrammes
![](/_src/img/docs/Pasted image 20230403143224.png)
