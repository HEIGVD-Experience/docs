---
Type: PriseDeNote
MiseAuPropre: oui
---

## Description UDP
Le protocole UDP est utilisé pour transmettre des données entre deux noeuds informatique. Le protocole UDP à comme caractéristiques : 
- UDP est un protocole de transport non fiable.
- Il ne garantit pas la livraison des données, ni l'ordre de leur arrivée.
- Il n'utilise pas de mécanisme de retransmission automatique pour les paquets perdus ou endommagés.
- Il n'établit pas de connexion préalable avant le transfert des données.
- Il est léger et a une faible surcharge de l'en-tête, ce qui le rend plus rapide et efficace que TCP dans certaines situations.
- Il n'inclut pas de mécanismes de contrôle de flux ou de contrôle de congestion intégrés.

## Utilisation
Le protocole UDP est particulièrement léger au niveau de l'en-tête du paquet, de ce fait il est très utilisé lors-ce que nous souhaitons privilégier la rapidité de transmission à la qualité.
- Les transmissions multimédia (tolèrent quelques pertes)
- Les transmissions multicast (multicast toujours sans connexion)
- Les échanges courts, comme DNS (pas de connexion)

## Datagrammes
![[S0/PiecesJointes/slide13-n.jpg]]

>[!important]
>- Seulement 4 champs dans l’en-tête UDP, 8 octets en total 
>- Longueur maximum d’un datagramme: 65’535 octets

