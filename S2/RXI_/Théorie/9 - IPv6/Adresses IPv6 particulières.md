---
Type: PriseDeNote
MiseAuPropre: oui
---

| Adresse IPv6         | Description                                                |
|----------------------|------------------------------------------------------------|
| ::1                  | Adresse de rebouclage (loopback)<br>Similaire à 127.0.0.1 en IPv4 |
| ::                   | Adresse non spécifiée<br>Similaire à 0.0.0.0 en IPv4<br>Utilisée si l’adresse n’est pas encore connue |
| FF00::/8             | Adresses multicast<br>Par exemple FF02::1 → tous les nœuds du ‘lien’ (=LAN)<br>L’adresse FF02::1 correspond à 255.255.255.255 en IPv4 |
| FC00::/7             | Adresse locale unique<br>Similaire aux adresses privées<br>Pour la communication à l’intérieure d’une organisation (non routable sur Internet) |
| Comme unicast globale| Adresse anycast<br>Une adresse globale peut être assignée à plusieurs interfaces/machines<br>Le routage normal fait qu’un paquet avec une adresse anycast comme destination est routé vers l’interface la plus proche |
