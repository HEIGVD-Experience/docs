#import "/_settings/typst/template-te-land.typ": *
#show: resume.with(
    "Résumé Examen",
    "Guillaume Trüeb",
    cols: 5,
    header: false,
)

= Analyse sémantique
L'analyse sémantique, consiste en une validation que la sémantique du langage est correcte. Quelques examples:
- Variables lues avant initialisation
- Labels dupliqués dans un switch
- Réaffectation de constantes
- Visibilité des méthodes invoquées

*Types de règles*

- *Static rules*: vérifiées à la compilation
- *Dynamic rules*: vérifiées à l'éxécution

== Analyse de nom
L'analyse de nom consiste en la validation des identifiants des variables. On valide aussi le *scope* des variables. Les erreurs classiques analysées ici sont:

- *Nested scope*: les variables définies dans les scopes enfant ne sont pas accessible par les parents

```java
int x = 10;
{
    int y = 20;
    // x et y accessibles ici
}
// seul x est accessible ici
```

- *Shadowing*: une variable dans une portée interne a le même nom qu'une variable dans une portée externe. La variable interne "masque" la variable externe.
- *Duplicated Definitions*: une variable est définie deux fois avec le même nom #sym.arrow *erreur*

Pour gérer l'analyse de nom on utilise une *tables des symboles* qui peut stocker les infos suivantes:
- Nom de la variable
- Type
- Portée
- Adresse mémoire (pour la génération de code)

== Systèmes de types
- *Primitifs*: `int, float, bool, char`
- *Composés*: `arrays, structs, classes`
- *Fonction*: types des params. et retour

*Strong vs Weak typing*
- *Strong*: conversions de types explicites requises
- *Weak*: conversions implicites fréquentes

*Inférence de types*
Déduire automatiquement le type de la valeur:
```java
var x = 42; // Int
var y = "hello"; // String
```

== Type checking
*Literals* :
$ Gamma tack.r n : "int" $
$ Gamma tack.r "true" : "bool" $

*Variables* :
$ (x : tau) in Gamma ==> Gamma tack.r x : tau $

*Addition* :
$ (Gamma tack.r e_1 : "int" quad Gamma tack.r e_2 : "int") / (Gamma tack.r e_1 + e_2 : "int") $

*Augmenter l'environnement*:
$
  "LETIN" (Gamma tack.r e_1 : T_1 quad Gamma [x -> T_1] tack.r e_2 : T_2) / (Gamma "let" x = e_1 "in" e_2 : T_2)
$

=== Règles de fonctions

*Application* :
$ (Gamma tack.r f : tau_1 arrow tau_2 quad Gamma tack.r e : tau_1) / (Gamma tack.r f(e) : tau_2) $

Si $f$ prend un $T_1$ et retourne un $T_2$ et que $e$ est un $T_1$, alors $f(e)$ donne un $T_2$.

*Abstraction* :
$ (Gamma, x : tau_1 tack.r e : tau_2) / (Gamma tack.r lambda x . e : tau_1 arrow tau_2) $

Si en supposant que $x$ est de type $T_1$, l'expression $e$ a le type $T_2$, alors la fonction $lambda x.e$ a le type $T_1 -> T_2$.

$lambda x.e$: focntion anonyme $x$ param, $e$ corps de la fonction.

=== Arbres de dérivation
Un arbre de dérivation est la preuve visuelle qu'un programme respecte les règles de types, construite en empilant les règles.
#image("../img/image copy 27.png")
#image("../img/image copy 26.png")

*Erreurs de typage courantes* :
- Type mismatch : `int x = "hello";`
- Fonction appelée avec mauvais arguments
- Opération non supportée : `"hello" - 5`
- Retour de type incorrect

== Inférence de type
Mécanisme pour déterminer les types d'expressions à la compilation *sans annotations de type explicites*.
```haskell
-- Type inféré: id :: a -> a
id x = x
a = id True      -- a :: Bool
b = id "hello"   -- b :: String
```

*Type Variables*

Placeholders pour types pas encore connus : `a`, `b`, `T`
```haskell
swap :: (a, b) -> (b, a)
swap (x, y) = (y, x)
```

*Type Constraints*

Conditions imposées sur les types basées sur leur usage.

*Formes :*
1. *Equality Constraints* : Types identiques requis
2. *Function Type Constraints* : Contraintes sur paramètres et retour

*Unification*

Résout les contraintes de type en trouvant itérativement des substitutions pour les variables de type.

*Algorithme Hindley–Milner*

Algorithme largement utilisé pour l'inférence de type.

*Étapes :*
1. *Type Variables* : Assigner variables de type uniques
2. *Type Constraints* : Générer contraintes basées sur opérations
3. *Unification* : Trouver substitution cohérente
4. *Generalization* : Trouver le type le plus général

= Interpréteurs
Les interpreteurs se basent sur les étapes d'analyse lexicale, syntaxique et sémantique pour traduire du code source en actions exécutables.

Les langages interprétés sont souvent *plus faciles à apprendre*, *plus rapide à utiliser*, *indépendant de la plateforme* et *plus facile à déboguer*. Cependant, ils peuvent être *plus lents* en termes de performance, *moins optimisés* et *moins adaptés* aux applications nécessitant une haute performance.

== REPL
- *Read* : Lit l'entrée de l'utilisateur.
- *Eval* : Évalue l'expression ou la commande.
- *Print* : Affiche le résultat de l'évaluation.
- *Loop* : Répète le processus pour chaque nouvelle entrée.

== AST (Abstract Syntax Tree)
Représentation arborescente abstraite de la structure syntaxique du code source. 


// Write the AST here
```

                   *
                  / \
                 +   4
                / \
               2   3
```
Vaudrait l'expression: $2 + 3 * 4$, en Haskell nous pouvons écrire la fonction pour évaluer l'AST:
```haskell
eval :: Expr -> Int
eval (Const n) = n
eval (Binary left op right) =
  case op of
    '+' -> eval left + eval right
    '-' -> eval left - eval right
    '*' -> eval left * eval right
    _ -> error "Unknown operator"
```

== Statements et états
Un *statement* est une instruction qui effectue une action, comme l'affectation d'une variable ou une boucle.
- *Statements*: modifient l'état du programme.
- *Expressions*: produisent des valeurs.

=== Environnement
L'environnement est une structure de données qui mappe les variables à leurs valeurs actuelles dans le contexte d'exécution. Les fonctions d'évaluation utilisent l'environnement pour *accéder* et *modifier* les variables.

```haskell
type Env = Map String Value
```

= Compilateurs



= Gestion mémoire