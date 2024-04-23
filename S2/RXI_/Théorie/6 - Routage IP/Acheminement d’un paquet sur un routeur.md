---
Type: PriseDeNote
MiseAuPropre: oui
---

## Différence acheminement et routage

| Acheminement                                                                                                                                       | Routage                                                                                                                                                                                           |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| – Fonctionnalité du protocole IP<br>– IP utilise la table de routage pour déterminer le prochain saut <br>– Exécutée pour chaque paquet (rapide !) | – Fonctionnalité des protocoles de routage, comme RIP <br>– Remplir la table de routage avec les routes optimales <br>– Exécutée périodiquement pour mettre à jour les tables de routage (lente!) | 

## Acheminement
- Chaque paquet IP contient l’adresse de destination
- Le routeur a une table de routage 
- Le routeur cherche dans sa table l’entrée pour le réseau de destination
- Si aucune route trouvée:
	- Utiliser la route par défaut, s’il y en a
	- Ecarter le paquet avec une erreur « Non routable »