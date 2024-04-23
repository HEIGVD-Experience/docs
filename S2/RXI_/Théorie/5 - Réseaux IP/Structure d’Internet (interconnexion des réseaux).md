---
MiseAuPropre: oui
---

## Architecture d'internet
![](/_src/img/docs/Pasted image 20230327133332.png)

Les utilisateurs (particuliers, entreprises et organisations) sont connectés à Internet par un ISP (Internet Service Provider).

### Technologies
- xDSL (ADSL, VDSL, typiquement 1 – 20 Mb/s)
- Modem câble (typiquement 1 – 100 Mb/s)
- Accès mobile (3G ou LTE, typiquement 1 Mb/s – 100 Mb/s)
- Fibre optique avec Ethernet (typiquement 100 Mb/s – 1 Gb/s)

## ISP (tier 1 et tier 2)
Les ISP tier 1 et tier 2 fournissent des connexions internationnales et intercontinentales. Ils forment l'épine dorsale (**Backbone**) d'internet.
Ces connexions sont en fibre optique et avec des débits allant jusqu'à 100gb/s.
Les ISP se connectent à des **IXP** (Internet Exchange Point)

### IXP
Un IXP est simplement une salle avec des routeurs appartenant à différents ISP. Un LAN haute vitesse permet d’interconnecter les routeurs de deux ISP pour effectuer le **peering**.

## Routeurs pour l’interconnexion des réseaux
![](/_src/img/docs/Pasted image 20230327135057.png)
Un routeur est un équipement de la couche 3 (**OSI**) qui permet d’interconnecter plusieurs réseaux. Un routeur permet d'interconnecter les réseaux mais aussi de les séparer.