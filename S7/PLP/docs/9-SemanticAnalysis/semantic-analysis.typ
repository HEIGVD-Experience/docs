#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Semantic Analysis",
  course: "PLP",
  col: 1,
  doc,
)

= Semantic Analysis

La sémantique d'un langage de programmation concerne la signification des constructions syntaxiques. L'analyse sémantique vérifie que les programmes respectent les règles sémantiques du langage, au-delà de la simple syntaxe.

Cette phase effectue des vérifications comme :
- *Name analysis* : Vérifie que toutes les variables et fonctions utilisées sont déclarées
- *Type checking* : Assure la compatibilité des types dans les opérations

== Semantic Checks

Les validations sémantiques courantes incluent :
- Variables lues avant initialisation
- Labels dupliqués dans un switch
- Réaffectation de constantes
- Exhaustivité du pattern matching
- Visibilité des méthodes invoquées

== Semantic Rules

Les règles sémantiques se divisent en deux catégories :
- *Static rules* : Vérifiées à la compilation (types, portée des variables)
- *Dynamic rules* : Vérifiées à l'exécution (division par zéro, accès ressources)

== Warnings vs Errors

*Semantic errors* : Violations des règles sémantiques qui empêchent la compilation
- Variables non déclarées, types incompatibles, violations de portée

*Warnings* : Problèmes potentiels qui ne bloquent pas la compilation
- Variables non utilisées, code inaccessible, conversions de types implicites

= Name Analysis

L'analyse de noms vérifie que toutes les références aux identificateurs sont valides.

== Scope

La *portée* (scope) d'un identificateur définit la région du code où il est accessible. Les langages utilisent différentes stratégies de portée :
- *Portée lexicale* (lexical/static scope) : La portée est déterminée par la structure du code source
- *Portée dynamique* (dynamic scope) : La portée dépend de l'ordre d'exécution

== Nested Scopes

Les portées peuvent être imbriquées. Une portée interne peut accéder aux variables de la portée externe, mais pas l'inverse.

```java
int x = 10;
{
    int y = 20;
    // x et y accessibles ici
}
// seul x est accessible ici
```

== Shadowing

Le *shadowing* se produit quand une variable dans une portée interne a le même nom qu'une variable dans une portée externe. La variable interne "masque" la variable externe.

```java
int x = 10;
{
    int x = 20; // shadowing
    System.out.println(x); // affiche 20
}
System.out.println(x); // affiche 10
```

== Duplicated Definitions

Les définitions dupliquées dans la même portée sont généralement interdites :

```java
int x = 10;
int x = 20; // erreur : x déjà défini
```

== Symbol Table

La *table des symboles* (symbol table) est une structure de données utilisée pour stocker les informations sur les identificateurs :
- Nom de la variable
- Type
- Portée
- Adresse mémoire (pour la génération de code)

Structure typique : dictionnaire avec recherche dans les portées imbriquées.

= Type Systems

Un système de types définit les types de données disponibles dans un langage et les règles régissant leur utilisation.

== Types

Les types peuvent être :
- *Primitifs* : int, float, bool, char
- *Composés* : arrays, structs, classes
- *Fonction* : type des paramètres et du retour

== Static vs Dynamic Typing

*Static typing* : Les types sont vérifiés à la compilation
- Avantages : Détection précoce d'erreurs, optimisation
- Exemples : Java, C++, Rust

*Dynamic typing* : Les types sont vérifiés à l'exécution
- Avantages : Flexibilité, moins de code
- Exemples : Python, JavaScript, Ruby

== Strong vs Weak Typing

*Strong typing* : Conversions de types explicites requises
- Exemple : Python (pas de conversion implicite int → str)

*Weak typing* : Conversions implicites fréquentes
- Exemple : JavaScript ("5" + 3 donne "53")

== Type Inference

L'*inférence de types* permet au compilateur de déduire automatiquement les types sans annotations explicites.

```scala
val x = 42        // inféré comme Int
val y = "hello"   // inféré comme String
```

= Type Checking

Le *type checking* vérifie que les opérations sont effectuées sur des types compatibles.

== Typing Rules

Les règles de typage définissent comment les types sont assignés aux expressions. Notation formelle :

$ Gamma tack.r e : tau $

Signifie : "Dans l'environnement $Gamma$, l'expression $e$ a le type $tau$"

=== Basic Rules

*Literals* :
$ Gamma tack.r n : "int" quad quad Gamma tack.r "true" : "bool" $

*Variables* :
$ (x : tau) in Gamma ==> Gamma tack.r x : tau $

*Addition* :
$ (Gamma tack.r e_1 : "int" quad Gamma tack.r e_2 : "int") / (Gamma tack.r e_1 + e_2 : "int") $

=== Function Rules

*Application* :
$ (Gamma tack.r f : tau_1 arrow tau_2 quad Gamma tack.r e : tau_1) / (Gamma tack.r f(e) : tau_2) $

*Abstraction* :
$ (Gamma, x : tau_1 tack.r e : tau_2) / (Gamma tack.r lambda x . e : tau_1 arrow tau_2) $

== Derivation Trees

Les arbres de dérivation montrent l'application des règles de typage pour vérifier qu'une expression est bien typée.

```
      Γ ⊢ e₁ : int    Γ ⊢ e₂ : int
      ─────────────────────────────
           Γ ⊢ e₁ + e₂ : int
```

== Type Errors

Erreurs de typage courantes :
- Type mismatch : `int x = "hello";`
- Fonction appelée avec mauvais arguments
- Opération non supportée : `"hello" - 5`
- Retour de type incorrect

= Type Inference

L'inférence de types permet de déduire automatiquement les types sans annotations.

== Hindley-Milner Type System

Système d'inférence de types utilisé dans ML, Haskell, OCaml :
- Inférence complète sans annotations
- Polymorphisme paramétrique
- Types principaux (most general type)

== Algorithm W

Algorithme d'inférence de types en deux phases :
1. *Génération de contraintes* : Parcourt l'AST et crée des équations de types
2. *Unification* : Résout les contraintes pour trouver les types

== Type Variables

Variables de type (α, β) représentent des types inconnus :

```haskell
id :: α → α
id x = x
```

== Type Constraints

Les contraintes de types sont des équations à résoudre :
- `α = int`
- `α = β → γ`
- `β = bool`

== Unification

L'*unification* résout les contraintes de types en trouvant une substitution qui rend les types égaux.

Algorithme d'unification :
1. Si `α = α`, succès
2. Si `α = τ` où α n'apparaît pas dans τ, substituer α par τ
3. Si `τ₁ → τ₂ = τ₃ → τ₄`, unifier τ₁ avec τ₃ et τ₂ avec τ₄
4. Sinon, échec

*Occurs check* : Empêche les types récursifs infinis comme `α = α → β`

== Exemple Complet

```haskell
let id = λx. x in id 5
```

1. Génération contraintes :
   - `id : α → α`
   - `5 : int`
   - Application : `α = int`

2. Unification : `α = int`

3. Type final : `id : int → int`, résultat : `int`