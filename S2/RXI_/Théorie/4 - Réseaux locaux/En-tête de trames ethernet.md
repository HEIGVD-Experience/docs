---
MiseAuPropre: oui
---

## Technologie Ethernet
- Technologie LAN la plus importante
- Initialement conçu comme bus, sur un câble coaxial partagé 
- Aujourd’hui principalement en étoile, avec un switch qui interconnectent les stations
![[S0/PiecesJointes/Pasted image 20230326142029.png]]

## Trames Ethernet
### Emetteur / récepteur
Ethernet (émetteur) reçoit les données de la couche supérieure et les encapsule dans une trame Ethernet.
Ethernet (récepteur) reçoit la trame de la couche physique, contrôle les en-têtes et passe les données à la couche supérieur.

>[!info]
> Une trame ethernet est l'emballage dans le quelle se trouve le contenu d'un fichier transitant sur le réseaux. Il existe deux formats de trames Ethernet : 

### Ethernet II
![[S0/PiecesJointes/Pasted image 20230326142418.png]]

### 802.3
![[S0/PiecesJointes/Pasted image 20230326142547.png]]
#### Préambule + délimiteur
- 7 octets 10101010, dernier octet 10101011
- Permet au récepteur de synchroniser son horloge pour garantir la bonne réception
#### Adresse MAC destination
- La carte réseau du récepteur vérifie si la trame est adressée à son adresse MAC
- Les switches utilisent l’adresse MAC de destination pour envoyer la trame sur la bonne interface de sortie
#### Adresse MAC source
- Permet au récepteur de répondre à l’émetteur
#### Type (pour Ehternet II)
- Indique le protocole de la couche supérieure
	- Les données seront passées à ce protocole
	- IPv4 : 0x0800
	- IPv6 : 0x86DD
	- ARP : 0x0806
#### Données
- Une trame peut transporter jusqu’à 1500 octets de données
- Les données doivent avoir une longueur minimum de 46 octets
- Si les données sont plus courtes de 46 octets, des octets de remplissage (pad) sont ajoutées
#### FCS (frame control sequence)
- La trame se termine par une somme de contrôle sur 32 bits 
- Elle est calculé par l’algorithme CRC-32 
- Les récepteurs et les switches intermédiaires la vérifient et éliminent les trames erronées
- **Ethernet n’effectue pas de retransmission de trames erronées**