---
MiseAuPropre: oui
---

## Définition
- L’adressage IP est un élément essentiel d’Internet
- Chaque interface réseau connectée à Internet doit avoir une adresse IP pour être atteignable
- Elles font 4 octets de longueurs

### Compositon d'une adresse IP
![](/_src/img/docs/Pasted image 20230327135724.png)
- Identificateur de réseau (Network ID)
	- Assigné par une autorité (par exemple ISP)
- Identificateur de machine (Host ID)
	- Assigné par l’entreprise, l’organisation ou l’utilisateur

## Classes d'adresses IP
Selon la longueur du préfixe réseau, on distingue plusieurs classes d’adresses : 
![](/_src/img/docs/Pasted image 20230327135835.png)

| Classe | Préfixe réseau | Suffixe machine | Plage d’adresses | Exemple Commentaire |
| ------- | ------- | ------- | ------- | ------- |
| A | 8 bits | 1.0.0.0 – 127.255.255.255 | 85.218.0.70 | 126 réseaux, 16 Mio hôtes |
| B | 16 bits | 128.0.0.0 – 191.255.255.255 | 128.178.50.12 | 16k réseaux, 64k hôtes |
| C | 32 bits | 192.0.0.0 – 223.255.255.255 | 193.134.220.23 | 2 Mio réseaux, 254 hôtes |
| D |  | 224.0.0.0 – 239.255.255.255 | 224.0.0.2 | Adresses multicast, par exemple « Tous les routeurs » |

## Adresses particulières
![](/_src/img/docs/Pasted image 20230327140455.png)
