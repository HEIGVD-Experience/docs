#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Authentification",
  course: "SLH - Sécurité logicielle haut niveau",
  author: "Guillaume Trüeb",
  date: "06 décembre 2025",
  toc: true,
  col: 1,
  doc,
)

= Introduction

L'authentification vérifie l'identité d'un utilisateur ou système avant d'autoriser l'accès aux ressources.

== Triangle d'impossibilité de Zooko

Propriétés d'une identité (max 2/3) :
- *Authentifiable* : vérifiable
- *Globale* : sans coordination centrale
- *Conviviale* : mémorable pour humains

Compromis :
- *G + C* : Surnoms, pseudos (pas authentifiables)
- *A + G* : Clés publiques, Bitcoin (pas conviviaux)
- *A + C* : Username, email, DNS (coordination nécessaire)

== Usernames

Bonnes pratiques :
- Unicité dans le système
- Prévenir attaques homographiques (ASCII uniquement ou normalisation Unicode)
- Normaliser la casse (généralement en minuscules)
- Valider longueur et caractères autorisés

#warning[
  Dépendance aux tiers (email) : prévoir migration si l'utilisateur change d'adresse.
]

== Facteurs d'authentification

*Humains* :
- Ce que l'on *sait* : mot de passe, PIN
- Ce que l'on *possède* : token, smartphone, carte à puce
- Ce que l'on *est* : biométrie

*Machines* :
- Ce que l'on *sait* : bearer token, clés API
- Ce que l'on *possède* : certificats TLS

= Mots de passe

== Politiques modernes (NIST SP 800-63B)

*Recommandations* :
- Autoriser tous caractères Unicode + espaces
- Longueur : min 8, max 64+ caractères
- Vérifier contre fuites (Have I Been Pwned)
- Permettre copier-coller et gestionnaires

*À éviter* :
- ❌ Règles de composition complexes (→ `Password1!`)
- ❌ Changement périodique forcé
- ❌ Questions secrètes

*Protection DoS* : longueur max 64-128, rate limiting, hachage lent

== Validation

Utiliser *zxcvbn* pour estimer l'entropie et vérifier contre dictionnaires + fuites connues.

= Stockage sécurisé

== Principes

*Pourquoi hacher (pas chiffrer ni stocker en clair)* :
- Réutilisation des mots de passe entre sites
- Chiffrement réversible → clé compromise = tous les mots de passe compromis
- Hachage = fonction à sens unique, lente intentionnellement

== Algorithmes

*Recommandé* : *Argon2* (résistant GPU/ASIC, paramètres temps/mémoire/parallélisme)

*Acceptable* : bcrypt, scrypt, PBKDF2 (100k+ itérations)

#warning[
  ❌ Jamais : MD5, SHA-1, SHA-256/512 seuls (trop rapides)
]

== Sel (Salt)

Valeur aléatoire ajoutée au mot de passe avant hachage.

*Objectif* : empêcher les rainbow tables (tables pré-calculées de hashes)

*Propriétés* :
- *Unique* par utilisateur
- Min 16 octets (128 bits)
- Cryptographiquement aléatoire
- Stocké en clair à côté du hash (avec Argon2/bcrypt, encodé dans le hash)

```sql
CREATE TABLE users (
    username VARCHAR(255) UNIQUE,
    password_hash VARCHAR(255)  -- contient sel + hash encodés
);
``` 

== Poivre (Pepper)

Secret *global* ajouté aux mots de passe, stocké hors BDD.

*Différences avec le sel* :
- *Secret* (pas en BDD, dans config/HSM)
- *Global* à toute l'application
- Protection additionnelle si BDD compromise

*Inconvénient* : difficile à changer (re-hash tous les mots de passe nécessaire)

== Migration d'algorithme

Détecter l'algo existant au login, re-hasher avec nouvel algo si connexion réussie.

```python
if user.hash.startswith('$2b$'):  # bcrypt
    if verify(password, user.hash):
        user.hash = argon2.hash(password)  # upgrade
```
= Authentification multi-facteurs (MFA)

== Méthodes

*TOTP (Time-based OTP)* :
- Code 6 chiffres généré toutes les 30s (RFC 6238)
- Secret partagé via QR code
- Apps : Google Authenticator, Authy
- ⚠️ Vulnérable au phishing

*SMS/Email OTP* :
- Familier mais vulnérable (SIM swapping, MITM)
- Non recommandé NIST pour applications critiques

*WebAuthn/FIDO2* :
- Cryptographie à clé publique, dispositif physique (Yubikey)
- Résistant au phishing, support navigateurs
- *Recommandé*

*Codes de récupération* :
- 8-10 codes à usage unique (8-12 caractères)
- Hasher avant stockage
- Afficher une seule fois

== Mise en œuvre

Flux : mot de passe → second facteur → session créée

"Remember device" pour 30 jours, redemander MFA pour actions sensibles.

= Sessions

== Tokens

*Cookies* : `HttpOnly` + `Secure` + `SameSite=Strict` (protection XSS/CSRF)

*JWT* : Auto-contenus, signés, stateless
#warning[
  JWT difficiles à révoquer → préférer tokens opaques côté serveur pour apps critiques
]

== Révocation

Techniques : liste noire, invalidation globale utilisateur, short-lived + refresh tokens
= Fédération & SSO

== OAuth 2.0

Protocole d'*autorisation* pour accès ressources sans exposer credentials.

Flux Authorization Code :
1. Redirection vers provider
2. Authentification + consentement
3. Redirection avec `code`
4. Échange `code` → `access_token`

== OpenID Connect (OIDC)

Extension OAuth pour *authentification*.
- Ajoute `id_token` (JWT) avec identité utilisateur
- Endpoint `/userinfo`
= Fédération & SSO

== OAuth 2.0

Protocole d'*autorisation* pour accès ressources sans exposer credentials.

Flux Authorization Code :
1. Redirection vers provider
2. Authentification + consentement
3. Redirection avec `code`
4. Échange `code` → `access_token`

== OpenID Connect (OIDC)

Extension OAuth pour *authentification*.
- Ajoute `id_token` (JWT) avec identité utilisateur
- Endpoint `/userinfo`
- Standard pour SSO moderne

== SAML 2.0

Standard XML pour SSO entreprise.
- IdP (Active Directory) + SP (application)
- Mature, support Single Logout
- Complexe, moins adapté au web moderne

== Bonnes pratiques

- Valider signatures/expiration/audience
- HTTPS obligatoire, PKCE pour OAuth
- Permettre liaison/déliaison comptes
- Gérer changement email provider

= Attaques et contre-mesures

== Credential Stuffing

Utilisation de couples username/password volés ailleurs.

Contre-mesures : rate limiting IP/compte, CAPTCHA, vérification Have I Been Pwned

== Brute Force

Test systématique de mots de passe.

Contre-mesures : délai exponentiel, verrouillage temporaire, WAF

== Phishing

Faux site pour voler credentials.

Contre-mesures : WebAuthn (résistant), éducation utilisateurs, monitoring domaines similaires

== Session Hijacking

Vol de token de session.

Contre-mesures : cookies `HttpOnly`/`Secure`, rotation tokens, expiration courte

= Checklist de sécurité

*Mots de passe* :
- [ ] Utiliser Argon2 ou bcrypt
- [ ] Sel unique par utilisateur
- [ ] Longueur min 8 caractères, max 64+
- [ ] Vérifier contre les fuites connues
- [ ] Pas de règles de composition arbitraires

*MFA* :
- [ ] Proposer TOTP ou WebAuthn
- [ ] Codes de récupération disponibles
- [ ] Possibilité de gérer plusieurs dispositifs

*Sessions* :
- [ ] Cookies `HttpOnly`, `Secure`, `SameSite`
- [ ] Expiration raisonnable (15-60 min)
- [ ] Révocation possible (logout)
- [ ] Rotation après changement de privilège

*Général* :
- [ ] HTTPS obligatoire
- [ ] Rate limiting
- [ ] Protection CSRF
- [ ] Logs des tentatives de connexion