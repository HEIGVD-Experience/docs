#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Intrusions web
  ],
  lesson: "ISI",
  chapter: "2 - Intrusions",
  definition: "Ce document traite de la cryptographie, une discipline essentielle pour sécuriser les communications en ligne. Il couvre les concepts fondamentaux des appels et réponses HTTP, la gestion des cookies, les outils de sécurité web (OWASP), et les techniques d'attaques web telles que le détournement de session, le cross-site scripting (XSS), et l'injection de commandes.",
  col: 1,
  doc,
)

= Rappel technologie web
== Appel HTTP
=== Appel HTTP
Un appel HTTP est une requête envoyée par un client à un serveur. Il est composé de deux parties : une ligne de requête et un corps de requête. La ligne de requête contient la méthode HTTP, l'URI et la version du protocole. Le corps de requête contient les données envoyées par le client.

==== Exemple d'appel HTTP
```
GET / HTTP/1.1
Host: www.lemonde.fr
Connection: keep-alive
Cache-Control: max-age=0
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_4) …
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
Accept-Encoding: gzip, deflate, sdch
Accept-Language: fr-FR,fr;q=0.8,en-US;q=0.6,en;q=0.4
Cookie: _ga=GA1.2.374864853.1475228586; xtvrn=$43260$; _cb_ls=1...
If-Modified-Since: Fri, 30 Sep 2016 16:10:47 GMT
```

=== Réponse HTTP
Une réponse HTTP est envoyée par un serveur à un client. Elle est composée de deux parties : une ligne de statut et un corps de réponse. La ligne de statut contient la version du protocole, le code de statut et le message de statut. Le corps de réponse contient les données envoyées par le serveur.

==== Exemple de réponse HTTP
```
HTTP/1.1 200 OK
Date: Fri, 30 Sep 2016 16:10:47 GMT
Server: Apache
Last-Modified: Fri, 30 Sep 2016 16:10:47 GMT
ETag: "1d3-53e3a1f1f7d00"
Accept-Ranges: bytes
Content-Length: 467
Keep-Alive: timeout=5, max=100
Connection: Keep-Alive
Content-Type: text/html
```

=== En-têtes HTTP
Les en-têtes HTTP sont des informations supplémentaires envoyées avec une requête ou une réponse HTTP

==== Exemple d'en-têtes HTTP
===== Generaux
```
Cache-Control: max-age=3600, public
Date: Tue, 15 Nov 2005 08:12:31 GMT
```
===== Requêtes
```
Accept: text/plain;q=0.5, text/html
Accept-Charset: iso-8859-5, unicode-1-1;q=0.8
From: user@heig-vd.ch
Referer: http://www.iict.ch/index.html
User-Agent: Mozilla/4.0 (compatible; MSIE 5.0; Windows 95)
Cookie: PHPSESSID=r2t5uvjq435r4q7ib3vtdjq120; foo=bar
Authorization: Basic bXl1c2VyOm15cGFzcw==
```
===== Réponse
```
Location: http://www.heig-vd.ch
Server: Microsoft-IIS/6.0
Set-Cookie: session-id=120-7333518-8165026; path=/; domain=.amazon.com; expires=Sat Feb 27…
```
===== Contenu
```
Content-Encoding: gzip
Content-Length: 3495 (en octets)
Content-Type: text/html; charset=ISO-8859-4
Last-Modified: Tue, 15 Nov 2005 12:45:26 GMT
```

=== HTTP sans état
HTTP est un protocole sans état, ce qui signifie que le serveur ne conserve pas l'état de la session entre les requêtes. Cela signifie que chaque requête est traitée indépendamment des autres requêtes.

=== Cookies
Les cookies sont des fichiers stockés sur le client qui contiennent des informations sur l'utilisateur. Ils sont envoyés avec chaque requête HTTP et permettent au serveur de conserver l'état de la session entre les requêtes.

==== Exemple de cookie
- Set-Cookie (dans une réponse) : dépose un cookie sur le client.
- Cookie (dans une requête) : valeur du cookie déposé auparavant.


= Références et outils
== OWASP
- Open Web Application Security Project (OWASP)
- Organisation internationale, Open Source
- Participation gratuite et ouverte à tous
- Mission : promouvoir la sécurité des applications

== Outils
- Plugins pour navigateurs (Tamper data, Firebug, etc.)
- Outils externes, interception et analyse des communications
 - Exemple : Proxys d'interception
- Logiciels de proxy avec beaucoup de fonctionnalités
 - Exemple : Burp suite

== Outils automatisés
- Scanner/fuzzer/spider Web
- SAST = Static Analysis Security Tools
- DAST = Dynamic Analysis Security Tools

=== SAST
#image("/_src/img/docs/image copy 50.png")

#colbreak()

=== DAST
#image("/_src/img/docs/image copy 51.png")

== Proxys d'interception
- Règles / Interception
- Historique ou Spider
- Match-and-replace
- Fuzzer
- Scanner de vulnérabilités
- Requêtes manuelles
- Analyse des cookies/sessions/tokens

#image("/_src/img/docs/image copy 49.png")

= Attaques WEB
- Manipulation des données (URL, cookies, etc.)
- Contournement de protections côté client
- «Session Hijacking»
- «Cross-site scripting» (XSS)
- «Cross-site request forgeries» (CSRF)
- Injections de commandes (SQL ou autres)

== Objectifs d'une attaque
- Contourner un mécanisme de sécurité (authenticité ou …)
- Extraire des données (confidentialité)
- Ajouter ou modifier des données (integrité)
- Déterminer le schéma de la base de données

== Points d'injection
=== Premier ordre
- L'application traite incorrectement une donnée malveillante directement
- Exemples:
 - Entrées utilisateur / formulaires
 - Cookies
 - URLs

=== Second ordre
- L'application traite incorrectement une donnée enregistrée précédemment
- Exemples:
 - Contenu d'une base de données
 - Fichiers uploadés
 - Variables côté serveur

== Protection côté client
Toute protection côté client peut être contournée. C'est pourquoi il est important de mettre en place des protections côté serveur.
- Contenu des cookies
- En-tête HTTP (Referer, User-agent, etc.)
- Champs des formulaires (même si cachés, restreint au choix dans une liste, ou validés en javascript)
- Tout contrôle en javascript (fait côté client)

Une application web doit toujours répéter chaque validation côté serveur.

== Détournement de session
- Un attaquant récupère un identifiant de session valide pour contourner le mécanisme d'authentification.
- La technique varie en fonction du protocole (TCP, HTTP)
 - Courant pour HTTP: vol de cookie, vol d'URL, falsification d'URL, etc.

#image("/_src/img/docs/image copy 52.png")

== Cross-site scripting (XSS)
=== Reflected XSS (sans persistance)
- Le client contrôle une valeur utilisée telle quelle dans la réponse
- Exemple : moteurs de recherche personnalisés.
=== Stored XSS (avec persistance)
- Le client contrôle une valeur enregistrée côté serveur.
- La valeur est utilisée ultérieurement dans plusieurs autres réponses.
- Exemples : forums, livre d'or, ....
=== DOM-based XSS
- Modification du « Document Object Model » (DOM)
- La payload n'est pas dans la réponse mais dans l'URL, et exploite une faille dans le code côté client.

=== Vol de cookies (XSS par mail)
#image("/_src/img/docs/image copy 53.png")

#colbreak()

=== Vol de cookies (XSS sur un forum)
#image("/_src/img/docs/image copy 54.png")

=== DOM-based XSS
#image("/_src/img/docs/image copy 55.png")

== CSRF (Cross-site request forgery)
- Objectif = forcer la victime à exécuter une action malveillante sur une application web
- La victime ouvre une URL malveillante
- L'attaque déclenche une requête vers le site ciblé

#image("/_src/img/docs/image copy 56.png")

== Injection de commandes
=== Injections dans des commandes SQL
- Une donnée utilisateur sert à construire une commande SQL pour la base de données.
 - Formulaire, cookie, paramètre de l'URL, etc.
- Sans protection, il est possible de modifier le sens de la commande SQL!
- Et donc de manipuler la base de données !
 - Vol de la base de données (tout ou partie)
 - Destruction de la base de données (tout ou partie)
 - Modification/altération des données
=== Injection dans une commande système
- Même idée, mais l'application construit une commande système (shell)
 - e.g. php include (https://brightsec.com/blog/code-injection-php/)
- Il devient possible d'exécuter des commandes autres que celles prévues par le développeur

#image("/_src/img/docs/image copy 57.png")