#import "/_settings/typst/template-te.typ": *
#show: resume.with(
  "Résumé DMA TE1",
  "Guillaume Trüeb",
  cols: 2
)

= Communication sans fil
== Le milieu air & Shannon
- Communication via *ondes électromagnétiques* (radio, micro-ondes)
- Capacité limitée par la formule de Shannon : $C = W dot log_2(1 + S/N)$
- $W$ = largeur de bande (limitée), $S/N$ = rapport signal/bruit
- Puissance reçue $P_r$ décroît avec le *carré de la distance* et le *carré de la fréquence*

== Modulation
Trois types principaux (variation d'un paramètre de l'onde porteuse) :
- *Amplitude* (AM), *Fréquence* (FM), *Phase* (PM)
- Critère de Nyquist : $f_m <= 2 f_p$ pour reconstruire le signal

== Réseaux cellulaires
- Fréquences limitées → réutilisation par clusters (ex. taille 7)
- Types de cellules :
  - Macrocell : >10 km, 40 W, ~2000 users
  - Femtocell : ~20 m, 0.1 W, ~5 users

== Évolution des générations mobiles
#table(
  columns: (auto, auto, auto, auto),
  [*Gen*], [*Année*], [*Débit*], [*Latence*],
  [2G/GSM], [1992], [kbit/s], [< 1000 ms],
  [3G/UMTS], [2003], [Mbit/s], [< 500 ms],
  [4G/LTE], [2010], [Gbit/s], [< 100 ms],
  [5G], [2019], [Gbit/s], [< 5 ms],
  [6G], [2030?], [Tbit/s], [0.1 ms],
)

== Wi-Fi (802.11)
- Protocole d'*accès réseau*, pas un réseau (pas d'itinérance native)
- Wi-Fi 6E (2021) : jusqu'à 4'800 Mbit/s sur 2.4 / 5 / 6 GHz
- Wi-Fi 7 (2024) : jusqu'à 30'000 Mbit/s

== LoRaWAN
- IoT / M2M, très bas débit (0.3-50 kbit/s), portée ~10 km
- Batterie ~10 ans, payload ~51 bytes

== Contraintes applicatives
- Émission = consommation batterie → favoriser protocoles légers
- Connexion intermittente → prévoir *cache* et *look-ahead*
- Protocoles HTTP synchrones → masquer par couche asynchrone
- Dissymétrie uplink/downlink → souvent inversée dans les apps modernes

== Électrosmog & santé
- Ondes mobiles = *non-ionisantes* (pas de rupture de liaisons moléculaires)
- Norme ICNIRP : 0.08 W/kg pour la population
- DAS max autorisé sur mobile : *2 W/kg*
- Aucun consensus scientifique sur des effets cancérigènes prouvés
- La Suisse applique des limites *10x plus strictes* que l'UE (4-6 V/m vs 42-61 V/m)

= Protocoles mobiles
Le protocol HTTP (basé sur TCP/IP) s'est imposé comme protocol principal pour le web mais n'est pas forcément adapté au mobile.

- `XML-RPC`: non standardisé, mais concis et intéréssanst pour une solution ad-hoc
- `SOAP`: extrêmement verbeux et redondant, à déconseiller pour du mobile
- `REST`: très répandu pour les applications web
- `GraphQL`: développé par Facebook, relativement récent

Souvent utilisé avec des formats de données légers comme JSON ou XML.

*TCP/IP a été conçu pour des réseaux stables et filaires, pas pour des connexions mobiles intermittentes et à haute latence.*

== HTTP
- HTTP/1.1 figé pendant ~20 ans
- *HTTP/2 (2015)* : multiplexage + compression des headers
- *HTTP/3 (2022)* : remplace TCP par *QUIC* (basé sur UDP)

#image("img/image.png")

== HTTP/3 & QUIC
- TLS 1.3 *intégré* au transport → handshake plus rapide
- Requêtes *en parallèle* → pas de blocage si paquet perdu
- *Multipath* → Wi-Fi + LTE simultanément
- Fallback TCP si UDP bloqué par NAT
- Adoption rapide : 20% du trafic EU en 2021 (encore en brouillon)

#image("img/image copy.png")

== Limites de TCP/IP sur mobile
- Overhead > payload sur petits messages
- Slow start inadapté à la latence mobile
- Handshake coûteux en temps
- Changement d'IP fréquent → connexion coupée

== Particularités applicatives
- HTTP est *synchrone* (requête → réponse) → bloque l'app, *mauvais sur mobile*
- *iOS* : modèle de délégation imposé, pas d'accès direct aux threads
- *Android* : flexible (coroutines, threads) mais complexe

*À retenir :* toujours masquer le caractère synchrone des communications
à l'utilisateur via des mécanismes *asynchrones*.

== Sérialisation
En utilisant du HTTP, il existe deux technologies principales pour sérialiser les données :

=== XML
- Verbeux mais partiellement auto-documenté
- Validable via DTD ou XML Schema
```xml
<?xml version="1.0" encoding="UTF-8"?>
<endereco>
  <cep>31270901</cep>
  <city>Belo Horizonte</city>
  <shops>
    <shop><name>Loja 1</name><distance>500m</distance></shop>
  </shops>
</endereco>
```

==== XML DTD
Le DTD (Document Type Definition) définit la structure autorisée d'un document XML
(éléments, attributs, relations). Limitation : typage très limité, tout est textuel (\#PCDATA)
```xml
<!ELEMENT endereco (cep, city, shops)>
<!ELEMENT shops (shop*)>
<!ELEMENT shop (name, distance)>
<!ATTLIST shop id CDATA #REQUIRED status (OK|NEW|ERROR) #REQUIRED>
```

==== XML Schema
- Remplace le DTD avec plus de flexibilité
- Typage précis des données (ex: distinguer une date d'une valeur numérique)
- Limitation par intervalles, indicateurs d'occurrences, support des namespaces

==== Parseurs XML
- *SAX* : lecture streaming ligne par ligne, faible mémoire → adapté au mobile
- *DOM* : chargement complet en mémoire sous forme d'arbre → simple mais lourd
  - ex: un fichier XLSX de 30 Mo peut prendre ~10 Go en mémoire !
- Certaines librairies permettent le *marshalling* direct vers des objets

=== JSON
- Compact et concis, validation via librairies externes
```json
{
  "city": "Belo Horizonte",
  "shops": [
    {"name": "Loja 1", "distance": "500m"}
  ]
}
```

=== Introspection & Réflexion

#image("img/image copy 2.png")

Permet la sérialisation automatique d'objets sans tout écrire manuellement.
- Java/Kotlin offrent des APIs d'introspection puissantes → bien supporté sur Android
- Kotlin dispose de sa propre librairie :
```kotlin
implementation("org.jetbrains.kotlin:kotlin-reflect:x.y.z")

// Exemple d'introspection
val c = Person::class
c.constructors  // tous les constructeurs
c.members       // toutes les propriétés et fonctions
```

=== Protobuf (Protocol Buffers)
Le protobuf est un format de sérialisation binaire développé par Google, conçu pour être plus rapide et plus compact que JSON ou XML. Il nécessite la définition d'un schéma (.proto) qui décrit la structure des données.
```proto
message Person {
  string          user_name       = 1;
  int64           favorite_number = 2;
  repeated string interests       = 3;
}
```

== Services web et API
Il existe plusieurs familles de service web:
- `RPC`: Remote Procedure Call, permet d'invoquer des fonctions à distance
- `SOAP`: Simple Object Access Protocol, basé sur XML, très verbeux
- `RESTful`: REpresentational State Transfer, utilise HTTP et des ressources identifiées par des URI

=== XML-RPC
- RPC est un protocole réseau permettant de faire des appels de procédures sur un ordinateur distant.
- XML-RPC utilise XML pour encoder les appels et les réponses, et HTTP comme protocole de transport.

- `POST /my_rpc`
```xml
<?xml version="1.0"?>
<methodCall>
  <methodName>examples.getStateName</methodName>
  <params>
    <param>
      <value><i4>40</i4></value>
    </param>
  </params>
</methodCall>
```
- Réponse
```xml
<?xml version="1.0"?>
<methodResponse>
  <params>
    <param>
      <value><string>South Dakota</string></value>
    </param>
  </params>
</methodResponse>
```

La grosse critique de RPC est que cela n'ajoute pas de valeur par rapport à l'utilisation simple de XMl. On pourrait faire la même chose en envoyant une requête HTTP classique avec un payload XML.
- `POST /examples/getStateName`
```xml
<?xml version="1.0"?>
<id>40</id>
```
- Réponse
```xml
<?xml version="1.0"?>
<name>South Dakota</name>
```

=== SOAP
- Le protocole SOAP est proche de XML-RPC mais plus complexe et relativement lourd (XML Schema, namespace, etc.).

- Avantage: permet de décrire les services et types de données offerts par un service SOAP via un fichier WSDL (Web Services Description Language), ce qui facilite la découverte et l'intégration des services.

- Client
```xml
<Envelope xmlns="http://schemas.xmlsoap.org/soap/envelope/">
  <Body>
    <GetStudentDetailsRequest xmlns="http://in28minutes.com/students">
      <id>1</id>
    </GetStudentDetailsRequest>
  </Body>
</Envelope>
```
- Réponse
```xml
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/">
  <SOAP-ENV:Header/>
  <SOAP-ENV:Body>
    <ns2:GetStudentDetailsResponse xmlns:ns2="http://in28minutes.com/students">
      <ns2:StudentDetails>
        <ns2:id>1</ns2:id>
        <ns2:name>Adam</ns2:name>
        <ns2:passportNumber>E1234567</ns2:passportNumber>
      </ns2:StudentDetails>
    </ns2:GetStudentDetailsResponse>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
```

=== RESTful
- REST (REpresentational State Transfer) est un style d'architecture pour les services web avec quelques contraintes:
- Séparation client/serveur
- Sans état
- Mise en cache
- Interface uniforme (chaque ressource a une URI unique)

*Un service respectant ces contraintes est dit RESTful.*

- Permet l'utilisation de `JSON` ou `XML` pour les échanges de données, mais JSON est plus courant pour sa légèreté.

=== Multiplaxage
- Permet d'envoyer plusieurs requêtes en parallèle sur la même connexion TCP (HTTP/2) ou même de les faire coexister (HTTP/3 avec QUIC)
- Réduit la latence en évitant les blocages liés à l'attente de réponses
- Important pour les applications mobiles où la latence est un facteur critique

```xml
<?xml version="1.0" encoding="utf-8"?>
<apdu>
  <opdu className="ch.iict.dma.server.storeTemperature">
    <param name="lat" value="46.78" />
    <param name="lon" value="6.65" />
    <param name="temp" value="23.8" />
  </opdu>
  <opdu className="ch.iict.dma.server.docQuery">
    <param name="docId" value="345678" />
  </opdu>
  <opdu className="ch.iict.dma.server.messageAck">
    <param name="msgId" value="234" />
    <param name="ack" value="true" />
  </opdu>
</apdu>
```

=== GraphQL
- Développé par Facebook, permet au client de spécifier exactement les données dont il a besoin
- Réduit le surcoût de données inutiles (overfetching) et les requêtes multiples (underfetching)
- Plus complexe à mettre en place que REST, mais offre une grande flexibilité pour les clients ce qui est pratique pour les applications mobiles

Il permet de faire du requêtage (plus ou moins complexe) sur les données exposées par le serveur, et de n'obtenir que les champs nécessaires à l'affichage de l'interface utilisateur.

- Requête
```graphql
{ "query" : "{findAllAuthors{id, books{id, title}}}"}
```
- Réponse
```json
{"data": {
    "findAllAuthors": [
      {
        "id": "1",
        "books": [{
            "id": "125",
            "title": "Sequi unde corrupti tenetur id."
          },{
            "id": "782",
            "title": "Perferendis … commodi labore totam quia."
          },{
            "id": "45",
            "title": "A animi non laudantium doloribus in."
          },{
            "id": "3001",
            "title": "Aut … laborum recusandae."
          }
        ]
        },{
        "id": "2",
        " books": [{
            "id": "2512",
            "title": "Sit quia … molestias consequatur."
        }]
      }
    ]
  }
}
```

=== Evolution du protocole
- Prévoir dès la v1 comment gérer les futures versions (v2, v3...)
- Sur mobile, difficile de synchroniser la mise à jour app + backend
  → certains utilisateurs restent sur d'anciennes versions

- *Parseurs stricts* (ex: Xstream) : refusent de désérialiser si le modèle a changé
  → oblige à garder l'historique de tous les modèles côté serveur → vite ingérable
- *Parseurs permissifs* (ex: Gson) : variables manquantes = `null`
  → plus flexible, mais le code doit gérer les cas null

=== Objets volumineux
- Sérialisation JSON peut vite atteindre plusieurs Mo
- Problématique sur connexion lente ou intermittente

- *Solution* : compresser les données (ex: algorithme DEFLATE)
  - Attention : POST compressé n'est pas standard HTTP
    → nécessite la maîtrise du client *et* du serveur
  - Fichiers déjà compressés (jpeg, mp3, png...) → inutile de recompresser
  - Base64 → rarement la bonne solution (augmente la taille de ~33%)

== Polling & Notifications

=== Active Poll
- Le client interroge *périodiquement* le serveur pour savoir si une info est disponible
- Intéressant si les interrogations restent *rares*
- Exemple : vérification d'emails toutes les 15 min (IMAP/POP3)

==== Contraintes mobiles (Android)
Les OS mobiles mettent les apps en veille pour économiser l'énergie :
- *Doze* (API 23) : désactive réseau, Wi-Fi, synchronisation...
- *App Standby Buckets* (API 28) : priorise les apps selon l'usage
- *App Hibernation* (API 30) : mise en veille profonde

- Le smartphone ne se réveille que lors de *fenêtres de maintenance*
- Solutions :
  - *Jetpack WorkManager* : synchroniser le poll avec ces fenêtres
  - *Foreground notification* : pour garder la main sur l'app

=== Lazy Poll
- Problème de l'active poll : beaucoup de requêtes inutiles (pas de nouvelles données)
- Solution : profiter des requêtes *existantes* pour transmettre une info en retour
  - Ex: lors de l'envoi d'un message, le serveur ajoute un header indiquant
    qu'une mise à jour est disponible
- Souvent combiné avec l'active poll pour garantir une réactivité minimum

=== Poll on Request
- Utiliser un *canal externe* pour notifier le client qu'une info est disponible
- Historique :
  - SMS : l'app écoutait les SMS, exécutait la commande et supprimait le SMS
  - Blackberry : push email via extension du protocole téléphonique
- Aujourd'hui : accès SMS/téléphonie très limité pour apps tierces
- Solutions actuelles :
  - *Firebase Cloud Messaging (FCM)* → Android (Google)
  - *Apple Push Notifications (APN)* → iOS

==== Firebase Cloud Messaging
- Service *gratuit* de Google
- Permet d'envoyer notifications/messages push à un user, un groupe ou tous
- Payload très limité et non sécurisé → utilisé uniquement pour *notifier*
  que des données sont à récupérer sur le serveur
- Nécessite *Google Play Services* → pas disponible sur tous les appareils

=== Techniques complémentaires
- *Multiplexage* : regrouper plusieurs messages en une seule requête
- *Mise en cache & look-ahead* : anticiper les données nécessaires
- *Envoi différé* : profiter d'une connexion existante pour envoyer des données secondaires

= Géolocalisation et positionnement en intérieur

== Principes de base
- Localisation = se référer à des *points de référence* (naturels, artificiels, satellites...)
- Deux techniques :
  - *Triangulation* : utilisation des angles
  - *Trilatération* : utilisation des distances

== Coordonnées géographiques
- La Terre = ellipsoïde → nécessite une *projection* pour représentation plane
- *Suisse* : système MN03 (1903) → MN95 (1995, officiel depuis 2016)
  - Axes x/y en mètres, y toujours > x sur territoire suisse
  - HEIG-VD : 2'540'503.0, 1'181'241.4
- *WGS 84* : standard mondial utilisé par GPS
  - Basé sur méridien de Greenwich + équateur
  - HEIG-VD : 46°46′46.286″N 6°39′33.587″E

== GNSS / GPS
- GPS : 32 satellites opérationnels, altitude ~20'184 km, période ~12h
- Principe : satellites émettent timestamp → récepteur calcule distances → trilatération
- *A-GPS* : téléchargement des éphémérides via Internet → premier fix plus rapide
- Précision civile : ~3-5m (signal volontairement dégradé jusqu'en 2000 : ~100m)
- Autres constellations : Glonass (Russie), Galileo (EU), BeiDou (Chine)
- Smartphones actuels peuvent utiliser *toutes les constellations*

=== Améliorer la précision
- *DGPS* : stations fixes corrigent les erreurs → précision métrique/décimétrique
- *RTK* : mesure de phase de l'onde porteuse → précision centimétrique
  - Usage: aviation, drones, topographie (pas directement sur smartphone)

== Géolocalisation sans GNSS
- GNSS limité : ne fonctionne pas en intérieur, consomme la batterie
- Alternatives :
  - *Wi-Fi / Réseaux mobiles* : fingerprint DB propriétaire (Google/Apple)
    - Précision ~50m (Wi-Fi), moins pour mobile
    - Partage de position avec service tiers
  - *Balises BLE*, *Balises UWB*

=== Exemple réel - Manifestation à Payerne
- Téléphones allumés à Payerne mais géolocalisés à Aarau ou Grisons
- Raison : la DB de localisation mobile utilise la position des antennes,
  pas la position réelle → erreurs possibles selon la configuration du réseau

== Mise en œuvre Android
- *LocationManager* (SDK natif) : GPS_PROVIDER, NETWORK_PROVIDER, FUSED_PROVIDER
- *FusedLocationProviderClient* (Google Play Services) :
  - Plus simple, mutualise la localisation entre apps
  - Gère automatiquement les sources et le filtrage
  - Spécifier ses besoins (intervalle, précision) → la lib notifie

```kotlin
val locationRequest = LocationRequest.Builder(1000L)
  .setPriority(QUALITY_BALANCED_POWER_ACCURACY)
  .build()
```
- Permissions requises :
  - `ACCESS_COARSE_LOCATION` : ~2km
  - `ACCESS_FINE_LOCATION` : haute précision
  - `ACCESS_BACKGROUND_LOCATION` : arrière-plan

== Géocodage inverse
- Convertir coordonnées brutes → adresse/point d'intérêt
- Repose sur DB en ligne → pas toujours dispo hors réseau
- Service souvent payant/limité → ne requêter que si déplacement significatif

== Geofencing
- Surveiller entrée/sortie d'une zone géographique circulaire
- Déléguer au *système* (iOS/Android) la surveillance → économise la batterie
- Bonnes pratiques :
  - Rayon minimum *100-150m* (surtout en intérieur)
  - Réactivité de ~5 min pour économiser l'énergie
  - Être transparent avec l'utilisateur sur la permission background
  - Si Wi-Fi désactivé → détection moins fiable

== Positionnement en intérieur

=== Balises BLE - iBeacons
- Introduit par Apple en 2013, basé sur *BLE* (portée ~100m)
- Fonctionnement : balise broadcast en permanence (pas de connexion)
  → app détecte la balise → déduit sa position
- Format iBeacon : 31 bytes → UUID (16b) + Majeur (2b) + Mineur (2b)
  - Ex: majeur = étage, mineur = salle
- Limites :
  - Estimation de distance *peu fiable* (basée sur RSSI)
  - Toutes les annonces ne sont pas forcément reçues
- Sécurité :
  - *Spoofing* : cloner une balise (même UUID/major/minor)
  - *Piggybacking* : utiliser les IDs d'une balise tierce
- Alternatives : *AltBeacon* (open source), *Eddystone* (Google, arrêté en 2021)

=== Balises UWB - AirTags
- Apple AirTags (2021) : BLE (position grossière) + UWB (position précise)
- Fonctionnement :
  + Tag diffuse avec clé publique
  + iPhones à proximité captent et remontent la position à Apple
  + Propriétaire récupère la localisation
- UWB : étalement de spectre, impulsions courtes, robuste aux interférences
- APIs : iOS (publique), Android Samsung (privée), Android Jetpack beta (mars 2026)
- Alternatives :
  - *Samsung SmartTag+* : BLE ou BLE+UWB, Samsung uniquement
  - *Oppo Zero-Power Tag* : sans batterie, énergie via champ EM (4G/5G), backscattering

=== BLE 5.1
- Mesure des *angles* de départ/arrivée des signaux BLE
- Fonctionnalité optionnelle, pas encore répandue sur smartphones

=== Wi-Fi RTT (802.11mc FTM)
- Disponible depuis *Android 9*, peu d'AP compatibles
- Distance basée sur *temps de propagation* → trilatération avec 3+ AP
- Précision *< 1m* en intérieur (moyenne sur plusieurs mesures)

=== Centrale Inertielle (IMU)
- Gyromètres + Accéléromètres + Magnétomètre (optionnel)
- Intégration des mouvements depuis un point connu → position actuelle
- Limitations : *drift* (erreurs cumulatives) + capteurs smartphones insuffisants

= Protocoles de proximité

== USB
- Présent sur tous les mobiles récents, fiable pour gros volumes de données
- Smartphone peut être *périphérique* (ex: debug Android Studio) ou *hôte* (brancher un périphérique)

=== USB-C
- Connecteur réversible 24 pins : données + alimentation
- *Power Delivery* :
  - Base : 5V x 0.5A = 2.5W
  - Max : 48V x 5A = 240W
- Standards de débit :
  - USB 2.0 : 480 Mbps (2000)
  - USB 3.2 Gen 2 : 10 Gbps (2013)
  - USB 4 v2.0 : 80/120 Gbps (2022)
- *Thunderbolt* = version certifiée d'USB (TB3 → base d'USB4)
- Aucun smartphone n'embarque USB4/Thunderbolt en 2026

=== Android
- Périphériques supportés nativement : stockage, clavier, souris, Ethernet...
- SDK permet d'intégrer un *pilote USB custom* pour périphériques spécifiques

=== iOS
- Accessoires non natifs → *programme MFi* (certification Apple obligatoire)
- Coût ~4\$ par accessoire vendu, NDA strict
- Lightning : débit USB 2.0 → iPhone 15 : transition vers USB 3.2 Gen 2
- Alternatives : port jack (supprimé en 2016), Ethernet nativement supporté

== Codes-barres

=== 1D
- Données encodées dans l'épaisseur/espacement des barres
- Formats : Code-128, EAN-13, UPC-A, Code-39...
- Lecture par *laser*, densité d'information faible → surtout pour identifiants

=== 2D
- Formats : *QR Code*, Data Matrix, Aztec, PDF417...
- Lecture par *analyse photo*
- QR Code : correction d'erreurs intégrée (4 niveaux : L=7%, M=15%, Q=25%, H=30%)
- Capacité max : 7'089 chiffres / 4'296 alphanum / 2'953 ISO-8859-1
- Tailles : Version 1 (21x21) → Version 40 (177x177)

=== Types de contenu QR
- URL, vCard, événement, géolocalisation, Wi-Fi, email, téléphone...
- *Texte libre* : JSON, données custom (ex: certificat COVID en Base45)
- *GS1* : remplacera les EAN d'ici 2027 (identifiant + URI produit + métadonnées)
- *Dynamiques* : contenu modifiable, redirection selon OS, statistiques d'usage
  - ⚠️ Confiance au fournisseur requise (disponibilité, vie privée)

=== Lecture sur Android
- *zxing* : librairie Java, licence Apache, mode maintenance
- *ML Kit* : librairie Google ML, modèles entraînés, Terms of Service Google

== NFC
- Classe particulière de *RFID*, lecture à max 3-4 cm
- Tag peut être *passif* (alimenté par champ EM du lecteur)
- Communication *bidirectionnelle*

=== Modes de fonctionnement
- *HCE* (émulation de carte) : terminal mobile agit comme carte sans contact (paiement)
- *Lecture/Écriture* : lire/écrire des tags passifs
- *Peer-to-peer* : échange direct entre 2 appareils NFC

=== Technologies & Tags
- NFC-A/B/F/V, MifareClassic, MifareUltralight
- Tags courants : NTAG213 (144b), NTAG216 (888b), SLIX (112b)

=== NDEF
- Format standardisé de messages lisibles sur la plupart des tags
- Types Well-Known : *URI*, *TEXT*, *SMARTPOSTER*
- Travailler au plus haut niveau d'abstraction recommandé

=== Android vs iOS
- *Android* : SDK très complet, tous niveaux d'abstraction, quasi tous modèles équipés
- *iOS* :
  - HW depuis 2014, API tierce depuis 2017 (lecture NDEF uniquement)
  - 2019 : écriture NDEF, 2022 : Commission EU accuse Apple d'abus de position dominante
  - iOS 18.1 : API étendue pour paiements/billetterie, pays et devs sélectionnés uniquement

=== Utilisation Android
```kotlin
// Permission requise
<uses-permission android:name="android.permission.NFC" />

// 3 niveaux d'abstraction
ACTION_NDEF_DISCOVERED   // tag NDEF
ACTION_TECH_DISCOVERED   // technologie spécifique
ACTION_TAG_DISCOVERED    // n'importe quel tag
```

== Bluetooth Classique
- Alternative sans-fil à USB, portée ~10m, connexion bidirectionnelle chiffrée
- Peu adapté à la mobilité (consommation)
- Évolution : 1.0 (1999, 721 kbps) → 3.0 (2009) → 4.0 (2010, définit BLE)

=== Profils principaux
- *A2DP* : streaming audio (casque, enceinte)
- *HFP/HSP* : kit mains-libres
- *HID/HOGP* : clavier, souris, manette
- *PAN* : partage de connexion
- Profil custom → *MFi obligatoire sur iOS*, possible mais complexe sur Android

== Bluetooth Low Energy (BLE)
- Technologie *indépendante* du BT classique (non compatible)
- Portée 5-100m, débit utile ~100 kbps, fonctionne des *mois sur pile bouton*
- Topologie *client/serveur*

=== Phases de communication
- *GAP* (avant connexion) : diffusion nom, services disponibles, connexion possible ?
- *GATT* (connecté) : services, characteristics, descripteurs

=== Structure GATT
- *Service* = ensemble de Characteristics (ex: Heart Rate 0x180D, Battery 0x180F)
- *Characteristic* = variable (max 20 bytes par défaut, 512 max)
  - Opérations : *Lecture*, *Écriture*, *Notification/Indication*
- *Descriptor* = métadonnées d'une Characteristic

=== Sécurité / Appairage
- *Just Works* : automatique, vulnérable MITM
- *Out of Band* : via NFC/Wi-Fi
- *Passkey* : code PIN
- *Numeric comparison* : 2 écrans (BLE 4.2+)

=== Évolutions BLE
- *5.0* (2016) : x2 débit ou portée, mesh networks
- *5.1* (2019) : calcul d'angle (localisation)
- *5.2* (2020) : profil audio BLE (remplace A2DP)
- *5.4* (2023) : chiffrement des annonces
- *6.0* (2024) : Channel Sounding (localisation précise)

== Autres protocoles de proximité
- *Wi-Fi Direct* : connexion p2p Wi-Fi, idéal pour gros volumes
- *Google Nearby* : API p2p Android combinant BT + Wi-Fi + ultrasons
- *AirDrop* : Apple uniquement (macOS/iOS/iPadOS), BT + Wi-Fi, partage de fichiers