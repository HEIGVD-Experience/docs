---
Type: PriseDeNote
MiseAuPropre: oui
---

## Objectifs IPv6
- Fournir suffisamment d’adresses, même avec une allocation très inefficace
- Rendre plus efficace le traitement des paquets par les routeurs 
- Mieux structurer les protocoles annexes à IP (ICMP, ARP, …)
- Rendre le protocole plus évolutif 
- Réduire la croissance des tables de routage
- Permettre la mobilité des utilisateurs (IP Mobile)
- Mieux intégrer les services de sécurité (IPSec)
- Permettre une coexistence entre IPv4 et IPv6

## Caractéristiques principales
1. Adresses sur 128 bits au lieu de 32 bits dans IPv4 
2. En-tête simplifié 
	- Nombre de champs réduit à la moitié 
3. Pas de fragmentation par les routeurs 
4. Extensibilité de l’en-tête par des options 
5. Nouvelles fonctionnalités
	- Autoconfiguration d’adresses des machines (sans DHCP)
	- Découverte de la MTU le long d’une route 
6. ARP, ICMP, IGMP remplacés par ICMPv6

## Notation des adresses
- **8 groupes** de 4 chiffres hexadécimaux, séparés par `:`
**Exemple:** 
`2001:AB75:4345:4A45:AF3F:3255:F431:A44B`

### Simplification
- Les premiers 0 d’un groupe peuvent être omis:
	- `A12` au lieu de `0A12`
- Plusieurs groupes de 0 peuvent être remplacé par `::` 
**Exemples:** 
`2010:0:0:0:0:800:200C:2342` -> `2010::800:200C:2342`
`0:0:0:0:0:0:0:1` -> `::1`

## Structure des adresses

|IPv6| Network identifier | Interface identifier |
|----| ------------------ | -------------------- |
|| 64 `bits`          | 64 `bits`            |

| Network identifier | Routing prefix   | Subnet ID        |
| ------------------ | ---------------- | ---------------- |
|                    | $\geq$ 48 `bits` | de 0 à 16 `bits` |

## Politique d’allocation typique 
- IANA donne aux RIRs des blocs de /12 à /23 
- Les RIRs donnent aux LIRs des blocs de /19 à /32 
- Les LIRs donnent aux clients des blocs de /48 à /56 
- L’utilisateur dispose de 8 – 16 bits pour créer des sous-réseaux s’il veut 
Actuellement, uniquement les préfixes 2000::/3 sont alloués
- Préfixes 2000:: - 3FFF:: de toutes les adresses globales utilisables actuellement
- Un huitième de l’espace d’adressage total

## En-tête IPv6
- Classe de trafic (8 bit)
	- Permet d’introduire des services différenciés
- Identificateur de flux (20 bit)
	- Permettra à l’avenir le traitement plus efficace de flux de paquets
- Longueur des données (16 bit)
	- Longueur maximale en mode normale: 65’535 octets
	- Option ‘Jumbogrammes’ pour datagrammes plus longs
- En-tête suivant (8 bit)
	- Indique le type de l’en-tête qui suit (extension ou couche supérieure)
- Nombre de sauts – Similaire à TTL en IPv4

## Méthodes de transition
1. Double-pile IPv4 et IPv6
	- Les machines utilisent IPv4 et IPv6 en parallèle
	- DNS indique s’il faut communiquer en IPv6 ou IPv4 
2. Tunneling
	- Permet aux réseaux IPv6 de communiquer à travers un réseau intermédiaire IPv4
	- Méthode 6to4 : encapsulation automatique de paquets IPv6 en paquets IPv4 
3. Proxies et translation pour machines sans IPv4
	- Après l’épuisement des adresses IPv4, l’interopérabilité entre IPv4 et IPv6 nécessite la traduction de paquets

