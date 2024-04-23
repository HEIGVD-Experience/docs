---
Type: PriseDeNote
MiseAuPropre: oui
---

## RIP
La méthode de RIP (Routing Information Protocol) est un protocole de routage utilisé pour calculer les routes dans les réseaux de taille moyenne à grande. Voici comment fonctionne la méthode de RIP pour calculer les routes :

1.  Chaque routeur RIP envoie périodiquement une mise à jour de sa table de routage à tous les autres routeurs RIP du réseau.
2.  La mise à jour de la table de routage contient les informations suivantes pour chaque route : l'adresse de destination, le masque de sous-réseau, le prochain saut et le coût.
3.  Le coût est généralement défini comme le nombre de sauts à travers les routeurs pour atteindre la destination.
4.  Lorsqu'un routeur reçoit une mise à jour de la table de routage, il compare les informations de la mise à jour avec celles de sa propre table de routage.
5.  Si les informations de la mise à jour sont meilleures que celles de sa propre table de routage (c'est-à-dire si le coût est inférieur), le routeur met à jour sa table de routage avec les nouvelles informations.
6.  Si les informations de la mise à jour sont équivalentes ou pires que celles de sa propre table de routage, le routeur ignore la mise à jour.
7.  Ce processus de mise à jour et de comparaison continue périodiquement, permettant aux routeurs RIP de s'adapter aux changements de topologie du réseau.

Il convient de noter que la méthode de RIP utilise une distance maximale de 15 sauts pour éviter les boucles de routage, ce qui limite la taille des réseaux que le protocole peut prendre en charge. De plus, comme les mises à jour de la table de routage sont envoyées périodiquement à tous les routeurs du réseau, cela peut générer beaucoup de trafic sur le réseau.