---
Type: PriseDeNote
MiseAuPropre: oui
---

## Définition TCP
Le protocole TCP est utilisé pour transmettre des données entre deux noeuds informatique. Le protocole TCP à comme caractéristiques : 
- Transmission fiable de bout en bout
	- Numéros de séquence
	- Acquittements
	- Retransmission
- Etablissement et terminaison de connexions
	- Connexions bidirectionnelles et point-à-point
- Régulation du débit
	- Contrôle de flux : adaptation de la vitesse au récepteur
	- Contrôle de congestion : adaptation de la vitesse au réseau

## Service à flot d’octets
1. L’application passe des blocs de données à TCP 
2. TCP les met dans un tampon d’émission 
3. TCP regroupe les données en segments à transmettre 
4. Le récepteur TCP place les segments reçus dans un tampon de réception 
5. L’application lit des blocs de données, sans tenir compte de segments

## Type de transmission
Le protocole TCP garanti la délivrance des données dans l'ordre d'émission. Pour cela il est nécessaire d'avoir les mécanismes suivant :
1. Numéros de séquence 
2. Acquittement 
3. Retransmission
![What is TCP protocol – BytesofGigabytes](https://s1.qwant.com/thumbr/700x0/8/3/cb5aed9564ba5dfec142928c153fbde988cc81e23ed272a2e4ac20f9af919e/tcp%20packet%20format.png?u=https%3A%2F%2Fbytesofgigabytes.com%2FIMAGES%2FNetworking%2FTCPIPProtocol%2Ftcp%2520packet%2520format.png&q=0&b=1&p=0&a=0)

Les octets sont numérotés, non pas les segments. L’émetteur indique le numéro du premier octet des données du segment.