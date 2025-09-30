#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: [
    Introduction
  ],
  lesson: "SLH",
  col: 1,
  doc,
)

= Introduction
== Risque sur validation mot de passe
```java
boolean isEqual = userhash.length() == hash.length();
for (int i = 0; i != userhash.length(); i++) {
 isEqual &= (hash.indexOf(i) == userhash.indexOf(i));
}
return isEqual;
```

#warning[
  - Le code `indexOf` fait une recherche il aurait fallut utiliser `charAt`
]

== Stratégies
=== Penetrate & patch
On développe sans se soucier de la sécurité, puis on corrige les failles au fur et à mesure qu'elles sont découvertes. Corriger *réactivement* les problèmes lors-ce qu'ils sont signalés.

=== Défense périmétrique
Utilisation de couche de sécurité pour protéger les systèmes critiques. Par exemple, un pare-feu pour protéger un réseau interne. Firewall, WAF, SIEM, zerotrust...

=== Meilleur approche
#image("../img/image.png")
Plus les erreurs arrivent tôt dans le cycle de développement, plus elles sont couteuses à corriger.

=== 7 royaumes
==== Validation des entrées
Le programme s'appuie sur des hypothèses non vérifiées sur le contenu de données utilisateurs. Utilisation d'XSS, SSRF, injections SQL, buffer overflow...

*Solution*:
Utiliser le typage statique pour:
- Imposer la validation des entrées
- Garder trace de l'orgine des données

==== Utilisation incorecte des API
Une API requiert des contraintes d’utilisation mais l’utilisateur ne les respecte pas. Par exemple un double free, casts `void*`...

*Solution*:
- Concevoir des API de manière à rendre l'utilisation incorrecte impossible

==== Mécanisme de sécurité
Un mécanisme de sécurité est utilisé de manière incorrecte. Par exemple, privilèges excessifs, umask erroné, nonce constant, cookie statique, CA non vérifiée, …

*Solution*:
- Comprendre les mécanismes de sécurité à disposition et modéliser la menace

==== Concurrence
Un ordre d’exécution inhabituel dans un système distribué (multithread, cloud, …) génère un état inattendu et incorrect. Par exemples : deadlocks, TOCTTOU

*Solution*:
- Utiliser les techniques de prog distribuée adaptées
- Les vérifier avec du typage statique
- Concevoir des API résistantes (demander pardon, pas la permission, …)

==== Traitement des erreurs
Un chemin de code exceptionnel n'est pas suffisamment testé. Par exemple, code d’erreur ignoré, exception masquée, erreurs avec infos sensibles affichées à l’utilisateur…

*Solution*:
- Imposer le traitement des erreurs correct

==== Qualité du code
Les erreurs passent inaperçues quand le code est difficile à lire. Par exemples : exemple ci-dessus, goto fail , while (a = b) , ...

*Solution*:
- Utiliser des langages modernes et de haut niveau

==== Isolation
Les différents agents dans le système (applications, réseau, utilisateurs) sont insuffisamment cloisonnés, Par exemples : Absence de chiffrement, CSRF, validation coté client, ...

*Solution* : 
- Modéliser la menace

==== Environnement
On parle de 7+1 car l'environnement dans lequel le logiciel s'exécute peut aussi être une source de vulnérabilité. Par exemples : OS compromis, dépendances non sécurisées, configuration par défaut, ...

== CVSS
Common Vulnerability Scoring System

== PR
- *N* one: aucun accès requis
- *L* ow: accès en lecture
- *H* igh: accès en écriture

== UI
- *N* one: aucune interaction requise
- *P* assive: interaction requise mais pas de l'utilisateur
- *A* ctive: interaction requise de l'utilisateur

== CIA
- *N* one: aucun impact
- *L* ow: impact limité
- *H* igh: impact total

La classification récente décompose le risque en la sévérité de la vulnérabilité (Base), à la menace (patchée ou pas, exploit disponible publiquement), et à l’environnement.