---
MiseAuPropre: oui
---

## Définition
Une adresse MAC est une adresse physique d'une **carte réseau**. Elles ont les caractéristiques d'être uniques et fixes.

>[!warning] Attention
>Une adresse MAC est une adresse d'une carte réseau. Ce qui signifique sur une machine type laptop nous aurons plusieurs adresses MAC car plusieurs carte réseaux.
>Exemple : un laptop à une carte réseau pour gérer le WIFI et une carte pour gérer la connexion filaire donc des adresses MAC différentes.

Son format est de `48 bits (6 octets)` en notation héxadécimale.

### Structure
- Les 3 premiers octets définissent le constructeur de la carte
- Les 3 derniers octets définissent l'identification de la carte et sont géré par le constructeur

![[/_src/img/docs/Pasted image 20230326144549.png]]

> [!info]
> L'adresse `FF:FF:FF:FF:FF:FF` correspond à l'adresse de broadcast et les stations doivent traiter les trames reçues sur cette adresse. Elle est utilisée, par exemple, pour les requêtes DHCP.

