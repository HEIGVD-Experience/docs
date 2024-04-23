---
Type: PriseDeNote
MiseAuPropre: oui
---

## Etapes de résolution itératives
1. Demande au server DNS du réseau ou serveur DNS local si connaissance de l'URL demandée
2. Le serveur DNS du réseau ou local ne connaît pas la réponse. Il envoie la requête à l'un des **13 serveurs** racine
3. Le serveur en question lui renvoie l'adresse du serveur DNS de la zone TLD (ex .ch)
4. Le serveur DNS du réseau ou local utilise cette adresse et contacte la zone contenant la partie de l'URL avant le TLD (ex. **monsite**.ch)
5. La requête parviendra au serveur officiel (**Authoriative**), il connaît l'adresse IP de l'URL demandée et répondra donc au demandeur

## Etapes de résolution récursive
1. Demande au server DNS du réseau ou serveur DNS local si connaissance de l'URL demandée
2. Le serveur DNS du réseau ou local ne connaît pas la réponse. Il envoie la requête à l'un des **13 serveurs** racine
3. Le serveur en questions fera une requête récursive jusqu'à trouver lui directement la bonne adresse et répondra donc directement au demandeur.

## Cache DNS
- Afin de réduire le trafic DNS, un serveur DNS peut garder une copie d’une réponse en cache 
	- Le paramètre « Durée de vie » (TTL) d’un enregistrement indique le temps qu’un serveur peut garder une réponse dans son cache
	- Le serveur indique alors dans sa réponse qu’il s’agit d’une réponse non officielle en ajoutant un (**Non-Authoriative**)

## DNS round-robin
Le DNS round-robin est une manière de répartir la charge entre différents serveurs DNS quand ceux-ci sont beaucoup sollicités.
- Le système DNS de réaliser une méthode simple de répartition de charge 
- Méthode 
	- Un nom de domaine est associé avec plusieurs adresses IP 
	- Toutes ces machines réalisent le même service (par exemple serveurs Web pour un site donné) 
	- Le serveur DNS effectue une permutation des enregistrements à chaque requête DNS

