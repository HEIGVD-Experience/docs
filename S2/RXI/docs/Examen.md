
| Type de réseau                  | Distance                                             | Utilisations courantes                                                    |
| ------------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------- |
| PAN (Personal Area Network)     | 1 - 10m                                      | Connexion de périphériques personnels (ex. : Bluetooth)                   |
| LAN (Local Area Network)        | 1m - 1km                                 | Réseaux d'entreprise, universités, domiciles                              |
| MAN (Metropolitan Area Network) | 1 - 10km          | Interconnexion de réseaux locaux, fournisseurs d'accès Internet régionaux |
| WAN (Wide Area Network)         | 10 - 1000km | Connexion de sites distants, réseaux d'entreprise étendus                 |
| Internet                        | Étendu à l'échelle mondiale                          | Accès à l'information, communication mondiale                             |

| Couche           | Description                                                                                                                  | Actions typiques                                                                                                                                   |
|------------------|------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| Couche physique  | Transfert de bits bruts sur le support physique (câbles, signaux électriques, ondes radio, etc.)                            | - Conversion des données numériques en signaux physiques<br>- Transmission et réception des bits<br>- Gestion des propriétés physiques du support |
| Couche liaison de données | Fiabilité de la transmission des données sur le support physique en fournissant un transfert sans erreur et un contrôle d'accès au support | - Encapsulation des données en trames ou en paquets<br>- Détection et correction des erreurs<br>- Accès au support partagé<br>- Contrôle de flux  |
| Couche réseau    | Routage des paquets de données à travers le réseau en utilisant des adresses logiques                                          | - Routage des paquets entre les réseaux<br>- Adressage logique (IP)<br>- Fragmentation et réassemblage des paquets                                 |
| Couche transport | Transport fiable des données de bout en bout entre des applications                                                         | - Segmentation et réassemblage des données<br>- Contrôle de flux<br>- Contrôle de la fiabilité                                                     |
| Couche session   | Établissement, gestion et terminaison des sessions de communication entre des applications                                   | - Établissement, maintien et fermeture des sessions<br>- Synchronisation et reprise des sessions<br>- Gestion des jetons de session                  |
| Couche présentation | Conversion et formatage des données pour une présentation appropriée aux applications                                     | - Encodage et conversion de formats de données<br>- Compression et chiffrement des données                                                         |
| Couche application | Fournit une interface pour les applications réseau et prend en charge des services de haut niveau                           | - Communication entre les applications<br>- Services tels que le courrier électronique, le transfert de fichiers, la résolution de noms, etc.        |

|Modèle OSI|Modèle TCP/IP|
|---|---|
|Couche physique|Interface réseau|
|Couche liaison de données|Interface réseau|
|Couche réseau|Internet|
|Couche transport|Transport|
|Couche session|-|
|Couche présentation|-|
|Couche application|Application|

| Couche           | Description                                                                                                                          | Actions typiques                                                                                                                        |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------- |
| Interface réseau | Gère les aspects physiques de la communication réseau et fournit une interface entre les couches supérieures et les médias physiques | - Conversion des données en signaux électriques ou optiques<br>- Transmission et réception des données<br>- Contrôle d'accès au support |
| Internet         | Permet le routage des paquets de données à travers les réseaux en utilisant des adresses IP                                          | - Routage des paquets entre les réseaux<br>- Fragmentation et réassemblage des paquets<br>- Adressage logique (IP)                      |
| Transport        | Assure le transport fiable des données de bout en bout entre les applications                                                        | - Segmentation et réassemblage des données<br>- Contrôle de flux<br>- Contrôle de la fiabilité                                          |
| Application      | Fournit des services de haut niveau aux utilisateurs et aux applications                                                             | - Communication entre les applications<br>- Protocoles spécifiques tels que HTTP, FTP, DNS, SMTP, etc.                                  |

|Classe d'adresse IP privée|Plage d'adresses IP|Masque de sous-réseau|
|---|---|---|
|Classe A|10.0.0.0 - 10.255.255.255|255.0.0.0|
|Classe B|172.16.0.0 - 172.31.255.255|255.240.0.0|
|Classe C|192.168.0.0 - 192.168.255.255|255.255.0.0|

- **CSMA/CD (Carrier Sense Multiple Access with Collision Detection)** :
    - Utilisé dans les réseaux Ethernet câblés.
    - Écoute le média de transmission pour détecter si le canal est occupé.
    - Si le canal est occupé, il attend un temps aléatoire avant de réessayer la transmission en cas de collision.
    - En cas de collision, les nœuds arrêtent la transmission et envoient un signal de collision pour avertir les autres nœuds d'une collision sur le réseau.

- **CSMA/CA (Carrier Sense Multiple Access with Collision Avoidance)** :
    - Utilisé dans les réseaux sans fil, notamment dans les normes Wi-Fi.
    - Écoute le média de transmission pour détecter si le canal est occupé.
    - Avant la transmission, le nœud envoie une demande de réservation du canal.
    - Si le canal est libre, le nœud commence la transmission.
    - Utilise des mécanismes de détection de collision pour éviter les collisions entre les nœuds.

- **CSMA/RA (Carrier Sense Multiple Access with Receiver-initiated Acknowledgment)** :
    - Utilisé dans certains réseaux sans fil, tels que les réseaux ZigBee.
    - Les nœuds destinataires envoient un acquittement (ACK) aux nœuds émetteurs pour confirmer la réception des données.
    - Permet de garantir la fiabilité de la transmission en utilisant des ACK pour confirmer la réception des paquets.


- **NAT (Network Address Translation)** :
    - Technique utilisée pour traduire les adresses IP d'un réseau vers un autre.
    - Permet de connecter un réseau local à Internet en utilisant une seule adresse IP publique.
    - Les adresses IP privées du réseau local sont traduites en une adresse IP publique au niveau du routeur NAT.
    - Protège les adresses IP privées du réseau local, les rendant invisibles et non routables depuis Internet.

- **NAPT (Network Address and Port Translation)** :
    - Une extension du NAT qui ajoute la traduction des ports aux adresses IP.
    - Permet de partager une seule adresse IP publique entre plusieurs hôtes du réseau local.
    - Traduit les adresses IP privées en adresses IP publiques et associe des numéros de port uniques à chaque connexion.
    - Utilise des ports pour acheminer correctement les paquets de données vers les hôtes appropriés du réseau local.

Le protocole ARP (Address Resolution Protocol) est utilisé pour résoudre les adresses IP en adresses MAC dans un réseau local. Voici quelques points clés à retenir :

- **Résolution d'adresses**: L'ARP associe une adresse IP à une adresse MAC dans un réseau local.
- **Table ARP**: Chaque machine dispose d'une table ARP pour stocker les associations IP-MAC.
- **Requêtes ARP**: Lorsqu'une machine souhaite envoyer des données à une autre machine, elle envoie une requête ARP pour demander l'adresse MAC correspondante à une adresse IP.
- **Réponses ARP**: La machine cible répond avec son adresse MAC, qui est ensuite mise en cache dans la table ARP de la machine émettrice.
- **Cache ARP**: Les adresses IP-MAC sont conservées dans la table ARP pour éviter les requêtes fréquentes.

Le protocole ARP est essentiel pour la communication au niveau de la couche de liaison de données dans les réseaux locaux. Il facilite l'acheminement des paquets en trouvant les adresses MAC correspondantes aux adresses IP.

| Type                    | Explication                                              |
|-------------------------|----------------------------------------------------------|
| Loopback                | L'adresse IP loopback (127.0.0.1) est utilisée pour tester la connectivité réseau sur la propre machine. Elle permet à un programme d'envoyer et de recevoir des données sur la même machine sans passer par le réseau physique. |
| Broadcast local         | L'adresse IP de broadcast local (127.255.255.255) est utilisée pour envoyer des paquets à toutes les interfaces du réseau local. Les paquets envoyés à cette adresse seront reçus par toutes les machines du réseau local. |
| Adresse du réseau       | L'adresse IP du réseau (par exemple, 192.168.0.0) représente l'adresse de réseau d'un sous-réseau spécifique. Elle est utilisée pour identifier le réseau lui-même, et les adresses IP qui lui sont attribuées appartiennent à ce réseau. |
| Adresse broadcast réseau| L'adresse de broadcast du réseau (par exemple, 192.168.255.255) est utilisée pour envoyer des paquets à toutes les machines du réseau spécifié. Préfixe réseaux + tous les autres bits à 1. |

| Type   | Signification                 | Valeur                                                    |
|--------|------------------------------|-----------------------------------------------------------|
| A      | Adresse                      | Enregistre une adresse IPv4 correspondant à un nom de domaine.|
| AAAA   | Adresse                      | Enregistre une adresse IPv6 correspondant à un nom de domaine.|
| CNAME  | Alias canonique              | Établit un alias canonique pour un nom de domaine. Permet de créer un nom alternatif (alias) pour un autre nom de domaine existant. |
| MX     | Enregistrement de messagerie | Spécifie le serveur de messagerie responsable de la réception des emails pour un nom de domaine. Utilisé pour le routage des emails. |
| NS     | Serveur de noms              | Identifie les serveurs de noms autoritaires pour un nom de domaine spécifique. Indique les serveurs DNS qui ont l'autorité sur la résolution des noms de ce domaine. |
| TXT    | Enregistrement texte          | Permet de stocker des informations textuelles associées à un nom de domaine. Souvent utilisé pour des notes ou des informations de configuration. |
| PTR    | Enregistrement de pointeur    | Effectue la traduction inverse d'une adresse IP en un nom de domaine. Utilisé pour rechercher le nom de domaine associé à une adresse IP. |
| SOA    | Autorité de zone              | Définit les informations d'autorité pour une zone DNS spécifique. Fournit des détails tels que le serveur de noms primaire, l'adresse e-mail de l'administrateur et d'autres paramètres de la zone. |

| Nom de domaine | Durée de vie                                                                                                   | Classe                                       | Type                                                     | Valeur                                                                                                      |
| -------------- | -------------------------------------------------------------------------------------------------------------- | -------------------------------------------- | -------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- |
| Standard DNS   | Indique pendant combien de temps (en secondes) le RR peut être mis en cache avant d'être actualisé. En général entre 86'400 (1 jour) et 60 secondes| La classe de RR, généralement IN (Internet). | Le type de RR, tel que A, AAAA, CNAME, MX, NS, TXT, etc. | Les données spécifiques au type de RR, telles que l'adresse IP (A et AAAA), le nom de domaine (CNAME), etc. |

