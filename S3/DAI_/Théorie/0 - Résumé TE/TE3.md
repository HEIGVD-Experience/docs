````col
```col-md
flexGrow=1
===
# Définir un protocole d'application
## Composition d'un protocole d'application
### Section 1 - Aperçu
Cette section définit le but du protocole. Quel est l'objectif du protocole ? Quel est le problème qu'il tente de résoudre ?

### Section 2 - Protocole de transport
Cette section présente le protocole et le port qui seront choisis.

### Section 3 - Messages
Cette section définit les messages qui peuvent être échangés entre le client et le serveur.

## Ports connus
- `20` et `21` : FTP
- `22` : SSH
- `23` : Telnet
- `25`, `465` et `587` : SMTP
- `53` : DNS
- `80` et `443` : HTTP/HTTPS
- `110` et `995` : POP3
- `123` : NTP
- `143` et `993` : IMAP

# Docker
## Moyens d'exécuter des applications
Le bare metal, la virtualisation et la conteneurisation sont trois méthodes pour exécuter des logiciels sur un ordinateur. Le bare metal consiste à installer un logiciel directement sur l'ordinateur, offrant un accès rapide et direct à toutes les ressources. La virtualisation utilise des machines virtuelles avec un accès limité pour isoler le logiciel du reste du système, mais elle est plus lourde et plus lente. La conteneurisation installe le logiciel dans des conteneurs légers, qui sont isolés comme des machines virtuelles mais utilisent le système d'exploitation sous-jacent de l'ordinateur, ce qui le rend plus efficace que la virtualisation.

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

Un Dockerfile est utilisé pour construire une image Docker avec la commande `docker build`. Après la construction, l'image peut être exécutée en utilisant `docker run`. Les conteneurs, isolés de l'hôte, ne sont pas des barrières de sécurité pour le démon Docker, qui s'exécute avec des privilèges root. Il est important de prendre en compte la sécurité et d'éviter d'exécuter des conteneurs en tant que root lorsque cela est possible. Les images Docker peuvent être basées sur divers systèmes d'exploitation, et les conteneurs Linux peuvent s'exécuter sur Linux, macOS et Windows. Les détails de la spécification du fichier Dockerfile peuvent être trouvés dans la documentation officielle. Pour renforcer la sécurité, ignorez les fichiers inutiles lors de la construction de l'image en créant un fichier `.dockerignore` dans le contexte de construction, similaire à `.gitignore`.
```
```col-md
flexGrow=1
===
# Docker compose
Docker Compose simplifie l'exécution d'applications Docker multi-conteneurs. Il utilise un fichier YAML (`docker-compose.yml`) pour définir et gérer des conteneurs liés, tels que ceux d'une seule application.

- **Spécification :** Définit les termes tels que service, volume et réseau pour les configurations multi-conteneurs.
- **Format :** Fichier YAML pour une configuration facile et une gestion de version avec l'application.

**Versions :**

- **v1 :** Originale, basée sur Python, obsolète.
- **v2 :** Recommandée, basée sur Go, utilise la commande `docker compose`.
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
