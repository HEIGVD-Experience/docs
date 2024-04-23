---
Type: PriseDeNote
MiseAuPropre: oui
---

## Composition d'un firewall
- Un firewall comprend généralement plusieurs éléments
	- Un ou plusieurs **filtres de paquets**
	- Un ou plusieurs **passerelles applicatives** 
	- Un ou plusieurs **réseaux confinés** 

>[!important]
>✓ La sécurité ne dépend pas d’un seul élément 
>✓ L’agresseur doit franchir plusieurs barrières

## Routeur écran simple
- Architecture simple avec un seul niveau de protection
- Utilisé par exemple dans les réseaux à domicile
  
| Avantages | Inconvénient |
| --------- | ------------ |
|• Simple à mettre en place <br>• Niveau de sécurité basic|              • Pas de défense en profondeur (une seule barrière à franchir)|

## Hôte à double réseau
- L’hôte à double réseau est connecté aux réseaux interne et externe 
- Le routage est désactivé 
- Connexion avec l’extérieur:
	- Les utilisateurs peuvent se loguer sur l’hôte et accéder le service sur Internet
- Applicable si peu de connexions avec l’extérieur

| Avantages                | Inconvénient |
| ------------------------ | ------------ |
| • Bon niveau de sécurité |• Solution peu commode pour les utilisateurs <br>• Gestion des comptes est vulnérable|

## Routeur écran avec bastion
- Machine bastion située sur le réseau interne 
- Bastion: machine exposée à Internet 
	- Peut recevoir des connexions depuis l’extérieur 
	- Peut travailler comme proxy pour les connexions depuis l’intérieur 
	- Le routeur écran ne permet que les connexions depuis / vers le bastion

| Avantages                                                         | Inconvénient |
| ----------------------------------------------------------------- | ------------ |
| • Bon niveau de sécurité <br>• Plus commode pour les utilisateurs |• Le bastion se trouve sur le réseau interne <br>• Le routeur écran est l’unique point de défense|

## Sous-réseau à écran (DMZ)
- Couche de sécurité supplémentaire: réseau périphérique ou DMZ
	- Isole le bastion, qui est vulnérable aux attaques 
	- Un intrus ayant réussi à s’infiltrer sur le bastion doit encore franchir le routeur écran intérieur 
	- Le trafic LAN ne peut pas être espionné depuis le bastion

| Avantages                                                                       | Inconvénient |
| ------------------------------------------------------------------------------- | ------------ |
| • Solution très sécurisée <br>• Solution standard dans les réseaux d’entreprise |• Solution coûteuse|

## Variantes
1. Utilisation de plusieurs bastions
	- + Performances améliorées
	- + Différents niveaux de sécurité 
	- - Solution coûteuse
2. Fusionner routeurs externe et interne
	- + Ne diminue que peu la sécurité 
	- - Le routeur est le seul élément de défense
3. Fusionner routeur externe et bastion
	- + Ne diminue que peu la sécurité





