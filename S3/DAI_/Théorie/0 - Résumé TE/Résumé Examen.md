````col
```col-md
flexGrow=1
===
# Markdown
- `-` -> Liste non ordonnée
- `+ / 1.` -> Liste ordonnée
- `**` -> Gras
- `*` -> Italique
- `#` -> Titre (niveau = nombre de dièses)
- `~~` -> Barré

# Git
- *Répertoire* -> Source de vérité du code mise dans Git
- *Clones* -> Copies du répertoire pour des copies de travail (peut être hors ligne)
- *Commit* -> Un instantané du répertoire à un moment donné
- *Hash* -> Dans git, c'est l'identifiant d'un *Commit* (Immutable)
- *Tag* -> Référence globale du répertoire à un commit (utilisé pour marquer les versions)
- *Branche* -> Nom + Un pointeur vers le dernier commit (la *tête*), mis à jour après chaque commit dedans
- *Staging* -> Où les modifications sélectionnées sont placées pour le commit
- *Push* -> Actions de soumission des commits au *Répertoire* distant
- *Pull* -> Récupère les dernières modifications de la branche actuelle depuis le distant

## Commandes Git
| Commande Git                                      | Commentaire                                     |
| --------------------------------------------------- | ----------------------------------------------- |
| `git clone <url>`                                  | Cloner un dépôt Git                              |
| `git checkout -b <nom-branche>`                    | Créer une branche et passer à celle-ci          |
| `git checkout <nom-branche>`                       | Passer à une branche                             |
| `git add <fichier>`                                | Ajouter des modifications à la zone de staging  |
| `git diff <fichier>`                               | Voir les différences entre le répertoire de travail et la zone de staging |
| `git status`                                       | Vérifier l'état de Git                           |
| `git commit -m "Message du commit"`                | Commit des modifications                        |
| `git push origin <nom-branche>`                    | Pousser les modifications vers une branche      |
| `git pull origin <nom-branche>`                    | Récupérer les modifications d'une branche       |
| `git merge <nom-branche>`                          | Fusionner une branche dans une autre             |

## Flux recommandé (GH)
1 Créer une issue
2 Forker le dépôt (si vous n'avez pas les droits)
3 Implémenter la correction dans une autre branche
4 Commit (avec `'#'` + le numéro du problème) sur cette branche
5 Créer une PR (avec la référence au problème)
6 Attendre une revue
7 Merge de la branche

## Protocole d'application
##### Section 1 - Aperçu
Définit le but du protocole et le problème qu'il cherche à résoudre.
##### Section 2 - Protocole de transport
Spécifie le protocole de transport (par exemple, TCP) et le port du serveur (par exemple, 55555) et décrit comment le client établit et ferme les connexions.
##### Section 3 - Messages
Détaille les messages échangés entre le client et le serveur (par exemple, `GET`, `QUIT`, `OK`, `FILE`, `ERROR`).
##### Section 4 - Exemples
Illustre l'échange de messages entre le client et le serveur.
```
```col-md
flexGrow=1
===
# Java IOs
*Note :* N'utilisez pas la classe `PrintWriter` ! Elle ignore les exceptions.
## Formats de fichier
Le format *binaire* ne fait pas d'hypothèses sur le tableau d'octets sous-jacent (généralement défini par une autre spécification, voir PNG).

Le format *texte* fait des hypothèses sur les bits sous-jacents du fichier. L'interprétation des bits vers un caractère est spécifiée par un *encodage de caractères*.
- *ASCII* : Standard pour les caractères latins, avec seulement 128 caractères (publié en 1963)
  - Pour les utilisations internationales (français), des *pages de code* étaient utilisées. Différentes pour chaque langue, appelées `ISO-8859-*`, `Latin-*`, ou `Windows-*`)
- *Unicode* : Standard plus récent, avec pour objectif de résoudre les problèmes ASCII, et plus encore (comme le support de plusieurs alphabets, ou emojis). Un *SUR-ENSEMBLE* d'ASCII (tous les fichiers ASCII peuvent être lus avec Unicode)
  - Après la norme, il existe plusieurs *Unicode Transformation Format*, ou *UTF*. Les plus courants sont `UTF-8` ou `UTF-16`.
  - Tous les formats utilisent le nombre de "1" en tête comme le nombre de blocs *y compris lui-même* (sauf un, qui utilise un "0" en tête), (8 bits pour UTF-8, 16 pour UTF-16...), et tous les blocs suivants utilisent un "10" en tête pour indiquer qu'ils font partie d'un caractère (et ne sont pas un caractère en soi).

Tous les ensembles d'encodage de caractères définissent un caractère ou un groupe de caractères de fin de ligne (EOL).
- Sur Windows, `\r\n` (CRLF)
- Sur les systèmes Unix (Mac, Linux...), `\n` (LF)

## Classes Java IO
NIO (New IO) non utilisé.
- `{Input,Output}Stream` pour le binaire
  - `File{Input,Output}Stream` pour les fichiers
  - `ByteArray{Input,Output}Stream` pour la mémoire (`byte[]`)
  - `Buffered{Input,Output}Stream` pour la gestion de la mise en mémoire tampon (préférée dans ce cours)
- `Reader` / `Writer` pour le texte
  - *IMPORTANT* : Fournir toujours un encodage pour les classes Non-String (String utilise des valeurs standard)
  - `File{Reader,Writer}` pour les fichiers
  - `String{Reader,Writer}` pour les chaînes (en mémoire)
  - `CharArray{Reader,Writer}` pour `char[]`
  - `{Input,Output}Stream{Reader,Writer}` pour la conversion bytes $<->$ char
  - `Buffered{Reader,Writer}` pour la mise en mémoire tampon gérée (préférée)

## Mise en mémoire tampon et vidage
Les appels à `.flush()` sont *importants* ! Dans de nombreux cas, le tampon mémoire augmentera jusqu'à ce que vous appeliez le vidage (si vous n'utilisez pas une classe `Buffered*`, cela peut causer des problèmes).

Pour la lecture, l'utilisation d'une classe tamponnée est agréable pour les petites lectures (lors de la lecture ligne par ligne par exemple), sinon, un appel système est effectué pour chaque appel read()/write().

`close()` / `try-with-resources` va vider avant la fermeture.

## try-with-resources
try (InputStream inputStream = new FileInputStream("example.txt")) {
    // Faire des opérations avec le flux d'entrée
} catch (IOException e) {
    // Gérer l'erreur, la fermeture du flux InputStream est déjà gérée.
}
```
````
<div style="page-break-after: always;"></div>


````col
```col-md
flexGrow=1
===
# SMTP
Simple Mail Transfer Protocol (tcp/25)
Communication initiée par l'expéditeur
La réception des e-mails nécessite un serveur (ne peut pas être utilisé par les clients)

Pas un protocole sécurisé !
- Pas d'authentification
- Pas de chiffrement
- Pas de validation d'e-mail

Commandes pour envoyer un e-mail :
EHLO `domaine expéditeur` 
MAIL FROM: <`e-mail expéditeur`> 
RCPT TO: <`e-mail destinataire`> 
DATA 
Subject: `ligne d'objet` 
From: `nom de la source` <`e-mail de la source`> 
To: `nom du destinataire` <`e-mail du destinataire`> 
Content-Type: tex/plain; charset="utf-8"
`votre contenu du mail ici`
. `<- pour terminer l'envoi`
# POP3
Post Office Protocol (tcp/110)
Communication initiée par le client
Permet la *récupération de messages*, pas la *synchronisation*

# IMAP
Internet Message Access Protocol (tcp/143)
Communication initiée par le client
Permet une communication bidirectionnelle, par exemple pour le statut de lecture.

# SSH
Secure SHell (tcp/22)
Communication initiée par le client
Permet d'ouvrir un shell sécurisé (terminal de commande) sur un serveur distant

- En-tête (`<-`)
- Énumération de la méthode d'authentification (`->`)
- Demande de méthode d'authentification (`<-`)
- Réponse à la méthode d'authentification (`->`)
- Changement de méthode d'authentification ou authentification réussie

Ensuite, REPL pour les commandes. Pour la sécurité, Diffie-Hellman est utilisé (déduction de clé commune). `ssh-keygen` est utilisé pour la génération de clés.
Algorithmes de clés courants (clé publique) :
- RSA
- DSA
- ECDSA (suffisamment sécurisé)
- Ed25519 (le plus sécurisé)

La clé publique d'une paire de clés asymétriques ne doit *jamais* être partagée, tandis que la privée *devrait*, afin d'être utile.
La clé privée est généralement protégée par une phrase de passe sur le disque (utilisant un chiffrement symétrique).
# DNS
Un magasin de clés distribué, principalement utilisé pour la traduction de domaine `<->` IP entre différents protocoles.
Types d'enregistrements courants :

| A | Adresse IPv4 pour un domaine donné |
| ---- | ---- |
| AAAA | Adresse IPv6 pour un domaine donné |
| MX | Serveur de messagerie pour un domaine donné |
| TXT | Stockage de texte générique lié au domaine. Utilisé pour `SPF` (IP autorisées pour l'envoi de courrier) entre autres utilisations. |
```
```col-md
flexGrow=1
===
# Programmation TCP Java
Un socket est l'une des deux extrémités d'un lien de communication bidirectionnelle entre deux programmes distants (en cours d'exécution sur un réseau).
Un socket client est celui qui initie la connexion, en utilisant un hôte connu (IP ou Nom d'hôte), et un port distant. Dans l'opération, il déclare un port local sur lequel il recevra des paquets.
Le _serveur_, de l'autre côté, écoute toujours les demandes de connexion du client et crée la connexion (lien bidirectionnel).
# Concurrence
La concurrence permet à plusieurs actions d'être effectuées simultanément, en permettant des actions _concurrentes_ sur différents _threads_.
Plusieurs façons existent pour gérer la concurrence :
- Multi-Processing (créer plusieurs processus, lourd pour le système d'exploitation, et la mémoire ne peut pas être partagée)
- Multi-Threading (unités de concurrence fournies par le système d'exploitation, la mémoire est partagée, plus léger que les processus)
- Programmation asynchrone (unités de concurrence au niveau du langage, plus léger, utilise un système d'attente personnalisé)
# Classes Java
## Sockets
- `ServerSocket`, un socket passif, gérant l'initialisation de la connexion, et créant de nouveaux Sockets avec des clients.
- `Socket` est un socket pré-fait, avec les deux côtés définis & prêts à communiquer (le client peut en créer un directement).
## Multithreading
Dépend d'un `Executor` sous-jacent (créé avec `Executors`).

|Executor |Commentaire |
|---|---|
|Pas d'exécuteur|Relativement clair, 1 connexion max, et bloque le thread principal.                 |
| SingleThreadExecutor | Utilise un modèle d'exécuteur facile à échanger et traite hors du thread principal, mais toujours 1 connexion max ouverte. |
| MultiThread          | 1 thread par connexion, repose sur l'ordonnanceur du système d'exploitation, donc gaspille des ressources. La création d'un thread est coûteuse.  |
| CachedThreadPool     | Pool de threads dynamique, évolue selon la demande, mais réutilise les anciens threads pour de nouvelles connexions, moins gaspilleur.   |
| FixedThreadPool      | Limite la concurrence à X connexions parallèles. Réutilise toujours les anciens threads lorsque les connexions se ferment. Communément utilisé, afin de ne pas priver le système. |
| VirtualThread        | En utilisant le projet loom (threads de niveau de langage), offre le moins de temps de calcul gaspillé et la meilleure performance.           |

| Ligne Java                                  | Commentaire                               |
|---------------------------------------------|-------------------------------------------|
| `Executors.newSingleThreadExecutor()`        | // Exécution sur un seul thread           |
| `Executors.newCachedThreadPool()`            | // Threads mis en cache                   |
| `Executors.newFixedThreadPool(nbThreads)`    | // Threads fixes avec une limite de X connexions parallèles, nbThreads est le nombre spécifié. |
| `Executors.newVirtualThreadPerTask()`        | // Threads virtuels, un par tâche         |
| `executor.execute(Runnable)`                 | // Soumettre une tâche à un ExecutorService |
| `Thread thread = new Thread(Runnable);`      | // Multithreading - Pour chaque tâche, créer un thread  |
| `thread.start();`                            | // Démarrer le thread                    |

## Bonnes pratiques
- `flush()` seulement lorsque la communication est terminée (une commande / réponse), pour éviter d'envoyer des paquets partiels à travers le réseau.
```
````
<div style="page-break-after: always;"></div>

````col
```col-md
flexGrow=1
===
# Docker
## Moyens d'exécuter des applications
**Bare Metal :**
- Installation directe du logiciel sur l'ordinateur.
- Accès rapide et direct à toutes les ressources.
**Virtualisation :**
- Utilisation de machines virtuelles.
- Accès limité pour isoler le logiciel du reste du système.
- Plus lourde et plus lente que le bare metal.
**Conteneurisation :**
- Installation du logiciel dans des conteneurs légers.
- Isolation similaire à des machines virtuelles.
- Utilisation du système d'exploitation sous-jacent de l'ordinateur.
- Plus efficace que la virtualisation.

## Présentation
- Le démon Docker : un service en arrière-plan qui gère les conteneurs
- L'interface en ligne de commande Docker (CLI) : une interface en ligne de commande pour interagir avec le démon Docker
### Spécification du fichier Dockerfile
- Dockerfile : un fichier texte contenant des instructions pour construire une image Docker
- Contexte de construction : un répertoire contenant les fichiers nécessaires pour construire une image Docker

### Instruction fichier Dockerfile
- `FROM` : spécifie l'image de base
- `ARG` : spécifie un argument à passer à la commande de construction
- `RUN` : exécute une commande dans le conteneur
- `COPY` : copie des fichiers du contexte de construction vers le conteneur
- `CMD` : spécifie la commande à exécuter lorsque le conteneur démarre
- `ENTRYPOINT` : spécifie le point d'entrée du conteneur
- `ENV` : spécifie une variable d'environnement
- `EXPOSE` : spécifie le port à exposer
- `WORKDIR` : spécifie le répertoire de travail
- `VOLUME` : spécifie un volume

# Docker compose
Docker Compose simplifie l'exécution d'applications Docker multi-conteneurs. Il utilise un fichier YAML (`docker-compose.yml`) pour définir et gérer des conteneurs liés, tels que ceux d'une seule application.

- **Spécification :** Définit les termes tels que service, volume et réseau pour les configurations multi-conteneurs.
- **Format :** Fichier YAML pour une configuration facile et une gestion de version avec l'application.

**Versions :**

- **v1 :** Originale, basée sur Python, obsolète.
- **v2 :** Recommandée, basée sur Go, utilise la commande `docker compose`.

## Exemple docker-compose
![](/_src/img/docs/Pasted%20image%2020240205173307.png)

```
```col-md
flexGrow=1
===
# Programmation UDP en Java
## Aperçu de l'UDP

UDP (User Datagram Protocol) est un protocole de transport sans connexion pour l'envoi de données sur le réseau. Contrairement à TCP, UDP ne nécessite pas l'établissement d'une connexion avant la transmission de données et ne dispose pas de mécanismes de fiabilité. Il ne garantit pas la réception ou l'ordre des données.

### Caractéristiques clés
- **Datagrammes :** UDP envoie des données sous forme de morceaux discrets appelés datagrammes.
- **Limite de taille :** La taille de la charge utile est limitée à 65 507 octets.
- **Fiabilité :** Aucune fiabilité intégrée ; des mécanismes au niveau de l'application sont nécessaires.
- **Modèles de messagerie :** Les modèles courants incluent le fire-and-forget et la demande-réponse.

### Types de communication
- **Unicast :** Communication de un à un, similaire à TCP.
- **Broadcast :** Communication de un à tous, envoyée à tous les hôtes sur le réseau.
- **Multicast :** Communication de un à plusieurs, envoyée à un groupe d'hôtes à l'aide d'adresses multicast spécifiques.

### Protocoles de découverte de service
- **Passif :** Basé sur la diffusion ou le multicast, annonce la présence d'un service sur le réseau.
- **Actif :** Combine la diffusion ou le multicast avec unicast, interroge le réseau pour trouver un service.
- **Modèles :** Publicité (passif) et Requête (actif).

**Attention :** La diffusion a des limitations sur Internet public ; utilisez des tunnels comme des VPN pour surmonter les restrictions.

### Modèles de messagerie en UDP
- **Fire-and-Forget :** Communication simple à sens unique sans attente de réponse.
- **Demande-Réponse :** Communication bidirectionnelle, où une réponse est attendue.

### Modèles de protocole de découverte de service
- **Publicité :** Le fournisseur de services annonce sa présence via la diffusion ou le multicast, et les consommateurs de services écoutent pour découvrir les services sur le réseau.
- **Requête :** Les consommateurs de services interrogent activement le réseau via unicast pour trouver un service spécifique.

**Remarque :** Ces modèles sont applicables à d'autres protocoles comme TCP, mais l'absence de mécanisme de connexion d'UDP le rend polyvalent pour des scénarios spécifiques.

| TCP                                 | UDP                                        |
| ----------------------------------- | ------------------------------------------ |
| Connection-oriented                 | Connectionless                             |
| Reliable                            | Unreliable                                 |
| Stream protocol                     | Datagram protocol                          |
| Unicast                             | Unicast, broadcast and multicast           |
| Request-response                    | Fire-and-forget, request-response (manual) |
| -                                   | Service discovery protocols                |
| Used for FTP, HTTP, SMTP, SSH, etc. | Used for DNS, streaming, gaming, etc.      |

```
````
<div style="page-break-after: always;"></div>


````col
```col-md
flexGrow=1
===
# HTTP
*HTTP* est un protocole sans état. L'état est géré via les cookies ou les paramètres d'URL.
- HTTP 1.0 utilise une connexion par requête.
- HTTP 1.1 peut mettre en pipeline / maintenir la connexion pour de multiples requêtes.

**IMPORTANT**
HTTP utilise `\r\n` comme caractère de saut de ligne pour tout sauf le corps (là, c'est FFA).

`<MÉTHODE> <URL> HTTP/1.1 `
`<En-tête>: <valeur>` 
`\n`

**Format**
Notez la ligne vide à la fin (représentée par `\n`).
### Méthodes HTTP (verbes)
Des méthodes décrivant une action sur une URL donnée.
Une *requête idempotente* signifie que plusieurs requêtes devraient avoir le même effet que si une seule avait été effectuée.
La spécification définit les mots suivants :

| Méthode | Idempotente? | Description |
| ---- | ---- | ---- |
| GET | *true* | Obtient / récupère une ressource du serveur. |
| POST | *false* | Envoie des données au serveur. Si quelque chose est créé, utilisez `201 Created`. |
| PUT | *true* | Crée ou met à jour une ressource. |
| PATCH | *false* (mais peut) | Applique des modifications partielles à une ressource. |
| DELETE | *false* | Supprime une ressource. |
#### Réponses `DELETE`
- `202 Accepted` => L'action réussira probablement mais n'a pas encore été effectuée.
- `204 No content` => L'action a été effectuée, mais aucune information n'est renvoyée.
- `200 OK` => L'action a été effectuée et a un message de réponse personnalisé.
### Codes d'état
Les codes d'état sont une façon d'indiquer l'état d'une requête de manière normalisée.

| Plage de codes | Signification     |
|-----------------|-------------------|
| 1xx             | Informatif        |
| 2xx             | Réussite          |
| 3xx             | Redirection       |
| 4xx             | Erreur client     |
| 5xx             | Erreur serveur    |
# cURL
##### Format
`curl [flags] <url>`
##### Flags
| Flag                   | Description                                                                                   |
|------------------------|-----------------------------------------------------------------------------------------------|
| `-i`                   | Inclut les en-têtes HTTP de la réponse (utilisez -v pour les en-têtes de la requête).          |
| `-X [MÉTHODE]`         | La méthode de la requête à envoyer.                                                           |
| `-H [EN-TÊTE]`         | Ajoute un en-tête à la requête, tel que formaté dans la spécification HTTP (`Clé: valeur`), de préférence avec des guillemets. |
| `-d [DONNÉES]`         | Ajoute un corps à la requête, utilisez des guillemets ou transférez directement un fichier. Définit également la méthode par défaut à `POST`. |
| `--cookie [cookie]`    | Ajoute un cookie à la requête. Suit le format de la spécification HTTP (`clé=valeur`).          |

```
```col-md
flexGrow=1
===
# REST
Principes d'une API REST :
- _Interface uniforme_ : Toutes les requêtes devraient avoir la même apparence pour une URL donnée (pour un type différent, utilisez une autre URL).
- _Client-Serveur_ : Les clients et les serveurs sont séparés et n'interagissent qu'à travers l'API.
- _Mémorisable_ : L'API doit prendre en charge la mise en cache pour un sous-ensemble de ses requêtes (si possible).
- _Architecture à système en couches_ : L'API doit prendre en charge la superposition d'autres couches, comme un CDN, un proxy ou un cache (ne supposez pas que le serveur communique directement avec le client).
- _Sans état_ : Les API REST doivent être sans état, chaque requête étant indépendante des autres. _Aucune session côté serveur n'est autorisée_.
- _Code sur demande (facultatif)_ : La réponse PEUT contenir du code exécutable, comme du JS. Dans ce cas, le code ne peut être exécuté que sur demande.
# Infrastructures Web
## Équilibreur de charge
_Répartit_ les tâches sur un ensemble de ressources pour rendre le processus efficace.

|Stratégies |Explications |
|----|-|
| Round-Robin       | Chaque serveur reçoit une tâche à tour de rôle.                                     |
| Sticky-Sessions    | Une fois qu'une session a été attribuée à un serveur (en utilisant une autre stratégie), elle continue d'être attribuée au même serveur. |
| Least connections  | Attribue la tâche au serveur ayant le moins de connexions ouvertes.                    |
| Least response time| Transmet les requêtes au serveur avec le temps de réponse le plus faible.              |
| Hashing            | Transmet la requête en fonction du hachage d'une partie sélectionnée de la requête (IP, URL, cookie de session, etc.) et du poids du serveur (probabilité de recevoir la requête). |
### Mise en cache basée sur l'expiration
- `Cache-Control: max-age=<secs>` => Définit la durée maximale, en secondes, pendant laquelle la réponse doit être considérée comme _fraîche_.
Après cela, les données sont considérées comme _obsolètes_.
Mais elles peuvent être _validées_ pour être toujours utilisées.
### Mise en cache basée sur la validation
- `If-Modified-Since: <horodatage>` => Si le fichier n'a pas été modifié depuis l'horodatage, le serveur doit renvoyer un `304 Not Modified`, indiquant que le client possède une version à jour. Sinon, retourne comme s'il s'agissait d'une requête standard.
- `ETag` => Hachage du fichier (format décidé par le serveur), stocké avec celui-ci sur le disque du client. Peut être ajouté avec l'en-tête `Date` (valide pour une durée indéterminée).
- `If-None-Match` => Si le fichier a toujours le même hachage, le serveur peut renvoyer un `304 Not Modified`, indiquant que la valeur n'a pas changé. Sinon, retourne la requête normalement.
## Proxy inverse
Service qui _propage_ une requête entrante et la transmet à un serveur en aval sélectionné par sa configuration (généralement avec l'en-tête `Host`).
- Utile pour servir plusieurs sites Web derrière la même adresse IP à grande échelle.
- Peut appliquer l'_équilibrage de charge_ et la _mise en cache_, en fonction du service.
## CDN
Un réseau de proxies inverses distribués géographiquement. Permet une meilleure performance en raison de latences plus faibles avec les clients pour les fichiers et ressources statiques / mis en cache.
# Scalabilité
La scalabilité, ou l'amélioration de la quantité de travail pouvant être traitée par un système, peut être réalisée de deux manières :
- _Scalabilité verticale_ : Ajouter plus de ressources à une machine _existante_ (également appelée _montée en échelle_).
- _Scalabilité horizontale_ : Ajouter plus de machines pour gérer le travail et équilibrer la charge entre elles (également appelée _extension_).
```
````
