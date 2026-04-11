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


= Localisation

= Protocole de proximité