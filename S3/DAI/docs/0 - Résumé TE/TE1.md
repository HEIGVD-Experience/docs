````col
```col-md
flexGrow=1
===
# Protocole d'application
**Qu'est-ce qu'un protocole d'application ?**
 - Définit la communication entre deux applications.
 - Souvent appelé RFC (Request For Comments) et disponible sur le [site de l'IETF](https://www.ietf.org/).
 - Les RFC résultent de discussions, sont ouvertes aux commentaires et sont mises à jour avant de devenir une norme.
 - Reposant sur les protocoles de transport (TCP ou UDP) et réseau (IP).
 - Plusieurs révisions existent ; chacune est définie par une RFC différente.
 - Exemples incluent HTTP/1.0, HTTP/1.1, HTTP/2, HTTP/3 pour le protocole HTTP.

 **Comment est structuré un protocole d'application ?**
 - Défini par des règles dans une RFC, spécifiant comment les parties communiquent.
 - Les règles sont présentées sous forme de messages ; la RFC décrit les messages, leur format et l'ordre d'échange.
 - Exemple : messages du protocole SMTP (`HELO`, `EHLO`, `MAIL`, `RCPT`, `DATA`, `RSET`).
 - Les messages ont des formats spécifiques ; l'ordre d'échange est défini à l'aide de diagrammes de séquence.
 - La RFC couvre les cas d'erreur et les situations limites pour éviter toute ambiguïté.

 **Comment définir un protocole d'application ?**
 - Définir un protocole nécessite une réflexion minutieuse et des tests.
 - Un protocole n'est jamais parfait et peut être amélioré ; l'ouverture d'esprit est cruciale.
 - Une conception approfondie réduit la nécessité de modifications futures et révèle les problèmes.

 **Section 1 - Aperçu**
 - Définit le but du protocole et le problème qu'il cherche à résoudre.
 - Exemple : le protocole DAI transfère des fichiers sur le réseau ; modèle client-serveur.

 **Section 2 - Protocole de transport**
 - Spécifie le protocole de transport (par exemple, TCP) et le port du serveur (par exemple, 55555).
 - Décrit comment le client établit et ferme les connexions.

 **Section 3 - Messages**
 - Détaille les messages échangés entre le client et le serveur (par exemple, `GET`, `QUIT`, `OK`, `FILE`, `ERROR`).
 - Fournit les formats des messages (par exemple, `MAIL FROM:<expéditeur>`).
 - Explique l'encodage et la transmission du contenu des fichiers.

 **Section 4 - Exemples**
 - Illustre l'échange de messages entre le client et le serveur.
 - Utilise des diagrammes de séquence pour aider les lecteurs à comprendre le protocole.

 **Ports réservés**
 - Les ports sont des points de communication ; identifiés par des nombres sur 16 bits.
 - Ports bien connus (0-1023) réservés à des protocoles spécifiques (par exemple, FTP, SSH).
 - Ports enregistrés (1024-49151) officiellement enregistrés ; disponibles pour une utilisation générale.
 - Ports dynamiques (49152-65535) pour des services privés, personnalisés ou temporaires.

 **Note rapide sur la philosophie Unix et POSIX**
 - La [philosophie Unix](https://en.wikipedia.org/wiki/Unix_philosophy) guide le développement logiciel minimaliste et modulaire.
 - Les règles incluent écrire des programmes qui font une chose bien et travailler ensemble.
 - La norme POSIX maintient la compatibilité entre les systèmes d'exploitation, assurant la portabilité.
 - Respecter POSIX facilite l'exécution de programmes sur divers systèmes d'exploitation.

# SSH et SCP
**Sécurité et SSH**
- Protocole sécurisé: chiffre les données pour confidentialité et intégrité.
- Reposent sur la cryptographie et une clé d'encryption.
- Authentification client: paire de clés publique/privée (SSH, GPG).
- SSH: remplace Telnet, utilise TCP sur port 22, clés publiques/privées.
- Algorithmes de clés: RSA, DSA, ECDSA, Ed25519 (plus sécurisés).
- Empreinte digitale de clé: hash de la clé publique, détecte attaques man-in-the-middle.
- Génération de clé SSH: `ssh-keygen`, clé privée cryptée avec phrase secrète.
- SCP: protocole de copie de fichiers via SSH, illustration architecture client/serveur.
```
```col-md
flexGrow=1
===
# SMTP et Telnet
**Protocole Internet (IP)**
 - Chaque ordinateur connecté à Internet a une [adresse IP](https://en.wikipedia.org/wiki/IP_address).
 - IPv4 étant limité, des routeurs NAT sont utilisés pour partager une seule adresse IP entre plusieurs ordinateurs.
 - Création d'IPv6 pour pallier la limitation d'IPv4.

 **Système de noms de domaine (DNS)**
 - Le DNS mappe un nom de domaine à une adresse IP (ex. : `heig-vd.ch` à `193.134.223.20`).
 - Commande [nslookup](https://en.wikipedia.org/wiki/Nslookup) pour vérifier la correspondance IP.

 **Enregistrements DNS courants**
 - `NS`: Serveurs de noms pour un domaine donné.
 - `CNAME`: Alias pour un nom de domaine donné.
 - `A`: Adresse IP d'un nom de domaine donné (IPv4).
 - `AAAA`: Adresse IP d'un nom de domaine donné (IPv6).

 **Protocoles de messagerie électronique : SMTP, POP3 et IMAP**
 - SMTP (Simple Mail Transfer Protocol)
 - POP3 (Post Office Protocol)
 - IMAP (Internet Message Access Protocol)
 - Utilisation par des clients de messagerie tels que Thunderbird, Gmail pour envoyer/recevoir des emails via des serveurs de messagerie.

 **SMTP**
 - Protocole pour envoyer des emails, utilisant les ports TCP 25, 465 ou 587.
 - Ports 465 et 587 recommandés pour les connexions chiffrées.

 **POP3**
 - Protocole pour récupérer des emails, utilisant les ports TCP 110 ou 995.

 **IMAP**
 - Protocole pour récupérer et synchroniser des emails, utilisant les ports TCP 143 ou 993.
 - Permet la synchronisation entre le serveur et le client, contrairement à POP3.

 **Enregistrements DNS liés aux emails**
 - Utilisation du DNS pour trouver l'adresse IP du serveur de messagerie.
 - Recherche des enregistrements DNS tels que `MX` (serveur email), `A` (adresse IPv4), `TXT` (SPF).
 - Commande [dig](https://en.wikipedia.org/wiki/Dig_(command)) pour vérifier ces enregistrements.

 **Sécurité et listes noires**
 - Protocoles de messagerie électronique anciens avec des lacunes de sécurité (SMTP ne nécessite pas d'authentification, etc.).
 - Nombreuses listes noires pour les spammeurs, impactant la capacité d'envoi d'emails des serveurs blacklistés.
 - Maintenance complexe des serveurs email, d'où l'utilisation de services tiers comme Google ou Microsoft 365.
 - Utilisation d'un serveur factice (MailHog) pour les tests.

 **Focus sur le protocole SMTP**
 - Décrit dans [RFC 5321](https://datatracker.ietf.org/doc/html/rfc5321).
 - Utilise TCP sur les ports 25, 465 ou 587, avec des commandes telles que `HELO`, `MAIL FROM`, `RCPT TO`, `DATA`, `QUIT`.

 **Telnet**
 - Protocole client/serveur permettant de se connecter à un serveur et d'envoyer des commandes.
 - Utilisé pour tester des services comme SMTP ou configurer des périphériques réseau.
 - Protocole décrit dans [RFC 854](https://datatracker.ietf.org/doc/html/rfc854).

# Java TCP
**TCP (Transmission Control Protocol)**
- Protocole de transport bidirectionnel, fiable, utilise numéros de port.
- TCP orienté flux, segments identifiés par numéros de séquence dans paquets IP.

**API Socket**
- API Java pour clients/serveurs TCP/UDP, développée en C à Berkeley, portée en Java.
- Socket: comme fichier, identifié par IP et numéro de port.
- Workflows client/serveur: création, connexion, lecture, écriture, vidage, fermeture.

**Traitement des Données des Flux**
- Sockets utilisent des flux pour communication, entrée lit, sortie écrit.
- Flux décorés pour texte/binaire, flux en mémoire tampon pour performances.
- Vidage crucial pour envoyer données restantes dans la mémoire tampon.

**Données de Longueur Variable**
- Traitement avec délimiteurs ou longueurs fixes.
- Exemple délimiteur: lecteur en mémoire tampon.
- Exemple longueur fixe: envoi longueur avant données réelles.

**Gestion d'un Client à la Fois**
- Serveurs à thread unique: traitement client à la fois, pour tests et apprentissage.
- Analogie: restaurant avec une seule table, client à la fois, non adapté à la production.

**Gestion de Plusieurs Clients avec Concurrency**
- Concurrence pour traiter plusieurs clients simultanément.
- Options: multiprocessus, multithreading, programmation asynchrone.
- Accent sur le multithreading dans ce cours.

**Multithreading**
- Capacité à gérer plusieurs threads simultanément, partage même espace mémoire.
- Moins coûteux à créer/détruire que les processus.
- Deux approches: threads illimités ou pool de threads avec nombre limité.

**Programmation Asynchrone**
- Capacité à gérer plusieurs tâches sans bloquer le thread principal.
- Utilise des rappels, analogie: camion de nourriture sans tables, clients reçoivent des tickets, peuvent effectuer d'autres tâches en attendant.
- Complexité de mise en œuvre, non traitée dans ce cours.
```
````
