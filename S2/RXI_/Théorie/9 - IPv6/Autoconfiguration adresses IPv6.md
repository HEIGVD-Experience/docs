---
Type: PriseDeNote
MiseAuPropre: oui
---

## Fonctionnement autoconfiguration sans-état
1. La machine construit une adresse local de lien 
	- Préfixe FE80::/64 + ID interface EUI-64 modifié
	- Duplicate Address Detection : La machine envoie une Sollicitation de Voisins pour cette adresse. Pas de réponse → OK 
2. La machine envoie une Sollicitation de Routeurs à l’adresse multicast ‘Tous les routeurs’ du lien 
3. Le routeur renvoie une Annonce de Routeur avec le préfixe du réseau 
4. La machine construit l’adresse globale 
	- Préfixe de réseau + ID interface EUI-64 modifié
	- Duplicate Address Detection : La machine envoie une Sollicitation de Voisins pour cette adresse. Pas de réponse → OK


