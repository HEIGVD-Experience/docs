---
Type: PriseDeNote
MiseAuPropre: oui
---

## Description NDP
Dans IPv6, une nouvelle méthode appelée **"Neighbor Discovery Protocol"** (NDP) est utilisée pour accomplir des tâches similaires à celles d'ARP.

## Fonctionnement NDP
1. Lorsqu'un nœud IPv6 a besoin de connaître l'adresse MAC (Media Access Control) correspondant à une adresse IPv6 donnée, il envoie une requête NDP appelée "Neighbor Solicitation" (NS) en multicast sur le réseau local.
2. La requête NS est adressée à l'adresse IPv6 de destination pour laquelle l'adresse MAC est recherchée.
3. Les autres nœuds du réseau qui reçoivent la requête NS vérifient si l'adresse IPv6 cible correspond à l'une de leurs propres adresses.
4. Si un nœud possède l'adresse IPv6 cible, il répond avec un message NDP appelé "Neighbor Advertisement" (NA) contenant l'adresse MAC correspondante.
5. Le nœud émetteur de la requête NS reçoit le NA et associe l'adresse IPv6 à l'adresse MAC fournie dans la réponse.
6. Le nœud émetteur peut maintenant utiliser l'adresse MAC pour communiquer directement avec le nœud cible sur le réseau local.