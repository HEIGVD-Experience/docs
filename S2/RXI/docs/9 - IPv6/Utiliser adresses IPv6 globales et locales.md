---
Type: PriseDeNote
MiseAuPropre: oui
---

## Adresses locales de lien
- Une interface IPv6 peut avoir plusieurs adresses
	- Une adresse locale de lien (obligatoire)
		- Pour la communication à l’intérieur de son LAN (‘lien’)
		- Sans traverser un routeur
	- Une adresse unicast globale (optionnelle)
		- Pour la communication sur Internet 

- Format des adresses locales de lien
	- Préfixe FE80::/64
	- Exemple : FE80::12:34FF:FEAB:CDEF

## Auto-configuration identificateur interface
- L’ID de l’interface peut être construite automatiquement à partir de l’adresse MAC
	- Méthode EUI-64 modifiée 
		- Prendre l’adresse MAC d’une interface 
		- Ajouter FFFE au milieu 
		- Inverser le deuxième bit de poids faible du premier octet

Permet d’identifier un utilisateur à distance via l’adresse IPv6!