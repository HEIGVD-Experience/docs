#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Syntax Analysis",
  course: "PLP",
  col: 1,
  doc,
)

= Syntax Analysis
L'analyse syntaxique est une étape cruciale dans le processus de compilation, où le code source est transformé en une structure hiérarchique appelée arbre syntaxique abstrait (AST). Cette étape permet de vérifier la conformité du code aux règles grammaticales du langage de programmation utilisé.

Un programme qui est syntaxiquement incorrect possède donc des erreurs de syntaxe.

== Syntax
La syntaxe d'un langage de programmation définit la structure et les règles qui régissent la formation des instructions et des expressions. Elle spécifie comment les différents éléments du langage, tels que les mots-clés, les opérateurs, les identificateurs et les littéraux, peuvent être combinés pour former des programmes valides.

=== Concrete syntax
La syntaxe concrète fait référence à la représentation textuelle réelle du code source, telle qu'elle est écrite par les programmeurs. Elle inclut les règles de grammaire, la ponctuation, les espaces blancs et les commentaires.

La spécification formelle de la syntaxe inclus deux types de règles :
- Les règles lexicales, qui définissent les unités de base du langage, appelées lexèmes (mots-clés, identificateurs, opérateurs, etc.).
- Les règles syntaxiques, qui définissent comment les lexèmes peuvent être combinés pour former des structures plus complexes, telles que les expressions, les instructions et les blocs de code.

==== Example
#himg("S7/PLP/docs/img/image copy 4.png", "Exemple de syntaxe concrète")

=== Abstract syntax
La syntaxe abstraite, en revanche, se concentre sur la structure logique et hiérarchique du code, indépendamment de sa représentation textuelle. Elle est souvent représentée sous forme d'arbres syntaxiques abstraits (AST), où chaque nœud de l'arbre représente une construction syntaxique spécifique.

==== Example
```hs
type Env = [(String, Int)]
data Expr = Const Int 
          | Var String
          | Binary Char Expr Expr

eval :: Expr -> Env -> Int
```

== Abstract Syntax Tree (AST)
#columns(2)[
  Un arbre syntaxique abstrait (AST) est une représentation arborescente de la structure syntaxique d'un programme. Chaque nœud de l'arbre correspond à une construction syntaxique spécifique, telle qu'une expression, une instruction ou une déclaration.
  #colbreak()
  #himg("S7/PLP/docs/img/image copy 5.png", "Exemple d'arbre syntaxique abstrait (AST)")
]

== Syntactic sugar
Le sucre syntaxique (syntactic sugar) fait référence à des constructions syntaxiques qui rendent le code plus lisible ou plus facile à écrire, sans ajouter de nouvelles fonctionnalités au langage. Le sucre syntaxique est souvent utilisé pour simplifier des expressions complexes ou pour introduire des raccourcis syntaxiques.

=== Désucrage
Le désucrage (desugaring) est le processus de transformation du sucre syntaxique en des constructions syntaxiques plus fondamentales. Cela permet de simplifier l'analyse syntaxique et la génération de code en réduisant la variété des constructions syntaxiques à traiter.

==== Example
```hs
f x y = x * y

-- Désucrage
f = \x y -> x * y

-- Désucrage
f = \x -> \y -> x * y
```

== Sytax Errors
Les erreurs de syntaxe se produisent lorsque le code source ne respecte pas les règles grammaticales du langage de programmation. Ces erreurs peuvent inclure des fautes de frappe, des parenthèses non appariées, des mots-clés mal utilisés ou des structures incorrectes.

Il peut y avoir différentes catégories d'erreurs de syntaxe :
- Utilisation incorrecte de la ponctuation.
- Parenthèses ou accolades non appariées.
- Constructions mal formées.
- Et pleins d'autres.

= Context-free grammars
Une grammaire sans contexte (context-free grammar, CFG) est un ensemble de règles qui définissent la structure syntaxique d'un langage de programmation. Une CFG est composée des 4 éléments suivants $G = (V, Sigma, R, S)$
- V : un ensemble fini de variables (ou non-terminaux) qui représentent les différentes constructions syntaxiques du langage.
- $Sigma$ : un ensemble fini de symboles terminaux qui représentent les unités de base du langage (mots-clés, opérateurs, identificateurs, etc.).
- R : un ensemble de règles de production qui définissent comment les variables peuvent être remplacées par des combinaisons de variables et de symboles terminaux.
- S : une variable spéciale appelée symbole de départ, qui représente la construction syntaxique la plus élevée du langage (généralement le programme entier).

== Backus-Naur Form (BNF)
La forme de Backus-Naur (Backus-Naur Form, BNF) est une notation utilisée pour décrire les grammaires sans contexte. Elle utilise des règles de production pour spécifier comment les différentes constructions syntaxiques du langage peuvent être formées.

=== Strcuture
Une règle de production en BNF a la forme suivante :
```
<symbol> ::= <expression>
```
où `<symbol>` est une variable (non-terminal) et `<expression>` est une combinaison de variables et de symboles terminaux.

#himg("S7/PLP/docs/img/image copy 6.png", "Exemple de grammaire en BNF")
#himg("S7/PLP/docs/img/image copy 7.png", "Exemple de grammaire en BNF")

== Derivation
La dérivation est le processus de génération d'une chaîne de symboles terminaux à partir du symbole de départ en appliquant les règles de production de la grammaire. Chaque application d'une règle de production remplace une variable par l'expression correspondante.

=== Example
On derive une une expression arithmétique $x * 2 + 1$ en appliquant les règles de production de la grammaire définie précédemment.

#himg("S7/PLP/docs/img/image copy 8.png", "Exemple de dérivation")

== Parse tree
Un arbre de dérivation (parse tree) est une représentation arborescente de la dérivation d'une chaîne de symboles terminaux à partir du symbole de départ. Chaque nœud de l'arbre correspond à une application d'une règle de production, et les feuilles de l'arbre représentent les symboles terminaux de la chaîne dérivée.

=== Example
Pareil que pour l'exemple de dérivation précédent, on peut représenter la dérivation de l'expression arithmétique $x * 2 + 1$ sous forme d'un arbre de dérivation.

#himg("S7/PLP/docs/img/image copy 9.png", "Exemple d'arbre de dérivation")

== Extended Backus-Naur Form (EBNF)
La forme de Backus-Naur étendue (Extended Backus-Naur Form, EBNF) est une extension de la BNF qui introduit des notations supplémentaires pour simplifier la description des grammaires sans contexte. L'EBNF utilise des opérateurs pour représenter des constructions syntaxiques plus complexes, telles que les répétitions et les options.

- Options: `[ ... ]` indique que l'élément à l'intérieur des crochets est optionnel.
- Répétitions: `{ ... }` indique que l'élément à l'intérieur des accolades peut apparaître zéro ou plusieurs fois.
- Groupements: `( ... )` permet de grouper des éléments pour appliquer des opérateurs à l'ensemble du groupe.

== Syntax diagram
Un diagramme syntaxique (syntax diagram) est une représentation graphique de la grammaire d'un langage de programmation. Il utilise des formes géométriques pour représenter les différentes constructions syntaxiques et les relations entre elles.

#himg("S7/PLP/docs/img/image copy 10.png", "Exemple de diagramme syntaxique")

= Ambiguity
Une grammaire est dite ambiguë si une même chaîne de symboles terminaux peut être dérivée de plusieurs façons différentes, conduisant à des arbres de dérivation distincts. L'ambiguïté peut poser des problèmes lors de l'analyse syntaxique, car elle rend difficile la détermination de la structure correcte du code source.

== The dangling else problem
Le problème du "dangling else" est un exemple classique d'ambiguïté dans les grammaires de langages de programmation. Il se produit lorsqu'une instruction "else" peut être associée à plusieurs instructions "if" imbriquées, ce qui conduit à des interprétations différentes du code source.

La plus part des langages de programmation résolvent ce problème en associant chaque "else" à l'instruction "if" la plus proche qui n'a pas encore d'"else".

= Predecence and associativity
Un parser qui evaluerait des expressions doit établir l'ordre dans lequel des opérations doivent être effectuées. Cela est déterminé par deux concepts clés : la précédence et l'associativité.

Sans une gestion appropriée de la précédence et de l'associativité, un parser pourrait interpréter une expression de manière incorrecte, conduisant à des résultats inattendus.

== Precedence
La précédence détermine l'ordre dans lequel les opérateurs sont évalués dans une expression. Les opérateurs avec une précédence plus élevée sont évalués avant ceux avec une précédence plus basse.

=== Example
Dans l'expression `3 + 4 * 5`, l'opérateur `*` a une précédence plus élevée que l'opérateur `+`, donc l'expression est évaluée comme `3 + (4 * 5)`.

== Associativity
L'associativité détermine l'ordre dans lequel les opérateurs de même précédence sont évalués. Les opérateurs peuvent être associatifs à gauche (left-associative) ou à droite (right-associative).

=== Example
Dans l'expression `5 - 3 - 2`, l'opérateur `-` est associatif à gauche, donc l'expression est évaluée comme `(5 - 3) - 2`.

=== Types of associativity
- Left-associative: Les opérateurs sont évalués de gauche à droite.
- Right-associative: Les opérateurs sont évalués de droite à gauche.

Dans la majorité des langages de programmation, les opérateurs arithmétiques tels que `+`, `-`, `*`, et `/` sont left-associative, tandis que l'opérateur d'exponentiation (par exemple, `^`) est souvent right-associative.