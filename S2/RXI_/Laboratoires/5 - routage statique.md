---
Note: 5.8
Chapitre: 6 - Routage IP
DateDeRetour: 2023-05-08
---

## Objectif 1
### Question 1
1. L'objectif est d'apprendre à configurer des routes statiques sur un routeur.
2. L'objectif est atteint si nous arrivons à faire des pings entre tous les PC du réseau.

### Question 2
```
ip route 0.0.0.0 0.0.0.0 10.1.0.2  
ip route 10.2.0.0 255.255.0.0 10.2.0.1  
ip route 10.3.0.0 255.255.0.0 10.3.0.1
```

### Question 3
```
ip route 0.0.0.0 0.0.0.0 10.2.0.2
```

### Question 4
```
ip route 0.0.0.0 0.0.0.0 10.3.0.2
```

### Question 5
```
ip route 0.0.0.0 0.0.0.0 193.134.0.1  
ip route 10.1.0.0 255.255.0.0 10.0.0.1
```

## Objectif 2
### Question 6
1. L'objectif est d'apprendre à mettre en place un routage sur sur le Firewall_int.
2. L'objectif est atteint si nous arrivons à pinger depuis les PCs du réseau HEIG sur Internet.

### Question 7
```
auto ens3
iface ens3 inet static
address 10.1.0.2/30
post-up ip route add 10.0.0.0/8 via 10.1.0.1 dev ens3

auto ens4
iface ens4 inet static
address 10.0.0.1/30
post-up ip route add default via 10.0.0.2 dev ens4
```
### Question 8
```
default via 10.0.0.2 dev ens4 10.0.0.0/30 dev 
ens4 proto kernel scope link src 10.0.0.1
```
### Question 9
```
PING 10.3.1.2 (10.3.1.2) 56(84) bytes of data.
64 bytes from 10.3.1.2: icmp_seq=1 ttl=61 time=8.19 ms
64 bytes from 10.3.1.2: icmp_seq=2 ttl=61 time=4.55 ms
64 bytes from 10.3.1.2: icmp_seq=3 ttl=61 time=3.92 ms
64 bytes from 10.3.1.2: icmp_seq=4 ttl=61 time=4.16 ms
64 bytes from 10.3.1.2: icmp_seq=5 ttl=61 time=4.32 ms
64 bytes from 10.3.1.2: icmp_seq=6 ttl=61 time=3.81 ms
--- 10.3.1.2 ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 15ms
rtt min/avg/max/mdev = 3.814/4.825/8.187/1.523 ms
```
### Question 10
```
PING 193.134.0.1 (193.134.0.1) 56(84) bytes of data.
64 bytes from 193.134.0.1: icmp_seq=1 ttl=61 time=3.31 ms
64 bytes from 193.134.0.1: icmp_seq=2 ttl=61 time=2.74 ms
64 bytes from 193.134.0.1: icmp_seq=3 ttl=61 time=3.51 ms
64 bytes from 193.134.0.1: icmp_seq=4 ttl=61 time=3.02 ms
64 bytes from 193.134.0.1: icmp_seq=5 ttl=61 time=3.37 ms
--- 193.134.0.1 ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 12ms
rtt min/avg/max/mdev = 2.735/3.187/3.508/0.276 ms
```
## Objectif 3
### Question 11
1. Apprendre à utiliser la commande traceroute pour le dépannage et comprendre son fonctionnement.
2. L'objectif est atteint si nous savons expliquer comment fonctionne le traceroute et comment celui-ci arrive à trouver le chemin parcouru par un paquet.

### Question 12
```
traceroute to 10.3.1.2 (10.3.1.2), 30 hops max, 60 byte packets
 1   10.2.1.1 (10.2.1.1)     1.005 ms   0.964 ms  0.927 ms
 2  10.2.0.2 (10.2.0.2)  0.922 ms  0.887 ms  0.883 ms
 3  10.3.0.1 (10.3.0.1)    1.942 ms  1.935 ms   1.919 ms
 4  10.3.1.2 (10.3.1.2)    1.909 ms  1.896 ms   2.843 ms
```
### Question 13
```
traceroute to 193.134.0.1 (193.134.0.1), 30 hops max, 60 byte packets
 1   10.1.1.1 (10.1.1.1)       1.240 ms  1.345 ms   1.288 ms
 2  10.1.0.2 (10.1.0.2)    1.216 ms   1.250 ms   1.241 ms
 3  10.0.0.2 (10.0.0.2)  1.200 ms   1.953 ms  2.189 ms
 4  193.134.0.1 (193.134.0.1)  2.177 ms  2.150 ms  2.119 ms
```

### Question 14
La commande traceroute permet de suivre le trajet des paquets (sauts de routeur à routeur) entre une source et une destination sur un réseau. 

- Elle envoie des paquets ICMP de type "echo request" avec des TTL croissants aux différents routeurs qu'elle traverse.

- Chaque routeur sur le chemin décrémente le TTL et envoie une réponse ICMP de type "time exceeded" à la source. Ainsi, la source peut déterminer les adresses IP des routeurs traversés. 

- Les routeurs renvoient des messages ICMP de type "time exceeded" et la destination répond avec des messages ICMP de type "echo request".

- Traceroute détermine qu'il a atteint le destinataire final en observant les réponses ICMP de type "echo reply" (réponse d'écho) reçues de la destination spécifiée. Lorsque la destination reçoit les paquets avec un TTL suffisamment élevé, elle répond avec des messages ICMP de type "echo reply" pour indiquer que les paquets sont arrivés à destination. Traceroute arrête l'exécution et affiche les résultats lorsque ces réponses d'écho sont reçues.