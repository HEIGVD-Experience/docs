---
Type: PriseDeNote
MiseAuPropre: oui
---

## Acquittement TCP
- Le numéro d’acquittement indique le prochain octet attendu par le récepteur
- Un acquittement peut être envoyé séparément ou combiné avec des données
- Les acquittements sont cumulatifs :
	- Un acquittement confirme la réception de toutes les données jusqu’à ce point

## Retransmission après timeout
- L’émetteur gère un temporisateur de retransmission pour chaque segment envoyé
- Si le temporisateur expire avant la réception d’un acquittement, le segment est retransmis
- TCP a un mécanisme pour adapter la durée du temporisateur

## Retransmission rapide
- Problème des acquittements cumulatifs
	- Un segment intermédiaire a été perdu
	- Comment signaler que les segments suivants sont arrivés ?
- Solution :
	- Lors de la réception d’un segment en désordre, le récepteur répète le dernier ACK (‘ACK dupliqué’)
	- Si l’émetteur reçoit 3 ACK dupliqués, il retransmet le segment sans attendre un timeout

## Détection de la perte des paquets
- Timeout du temporisateur de retransmission
	- Aucun acquittement n’a été reçu
	- C’est-à-dire plusieurs paquets ont été perdus
	- Signale typiquement une congestion sévère
- Trois acquittements dupliqués
	- Un ou plusieurs paquets ont été perdus
	- Mais quelques paquets sont arrivés correctement
	- Signale une congestion légère


