#import "/_settings/typst/template-te.typ": *
#show: resume.with(
  "Résumé PLP TE2",
  "Guillaume Trüeb",
  cols: 3
)

= Interactive Programming

== Type `IO`
Le type `IO a` représente une action qui produit une valeur de type `a` avec des effets secondaires possibles.
```haskell
main :: IO ()
main = do
    putStrLn "Entrez une ligne de texte:"
    input <- getLine
    putStrLn ("Vous avez entré: " ++ input)
```

== Basic I/O Functions
```haskell
return :: a -> IO a
(>>=)  :: IO a -> (a -> IO b) -> IO b
(>>)   :: IO a -> IO b -> IO b

getChar :: IO Char
getLine :: IO String
putChar :: Char -> IO ()
putStr  :: String -> IO ()
putStrLn :: String -> IO ()
```

== Do Blocks
La notation `do` facilite l'écriture de séquences d'actions I/O.
```haskell
getLine :: IO String
getLine = do c <- getChar
    if c == '\n' then return ""
    else do line <- getLine
        return (c:line)
```

- Les actions sont exécutées dans l'ordre
- `<-` capture le résultat d'une action I/O
- `let` définit des variables locales sans I/O

== Control Flow Actions
```haskell
-- Exécute une liste d'actions
sequence_ :: [IO a] -> IO ()

-- Applique une fonction I/O à une liste
mapM_ :: (a -> IO b) -> [a] -> IO ()

-- Version avec arguments inversés
forM_ :: [a] -> (a -> IO b) -> IO ()

-- Exécution conditionnelle
when :: Bool -> IO () -> IO ()
unless :: Bool -> IO () -> IO ()
```

== Files
```haskell
import System.IO

-- Écriture
writeFile "example.txt" "Hello, World!"

-- Lecture
contents <- readFile "example.txt"

-- Gestion des lignes
let linesToWrite = ["Line 1", "Line 2"]
writeFile "file.txt" (unlines linesToWrite)
fileLines = lines contents
```

= Monads and more

== Functors
`fmap` applique une fonction à une valeur encapsulée dans un contexte.
```haskell
class Functor f where
    fmap :: (a -> b) -> f a -> f b
    (<$) :: a -> f b -> f a
```

*Lois* : 
1. Identité : `fmap id = id`
2. Composition : `fmap f (fmap g x) == fmap (f . g) x`

*Opérateur `<$`* : remplace toutes les valeurs dans un contexte.
```haskell
> "abc" <$ Just 123
Just "abc"
```

== Applicative
Permet d'appliquer un nombre illimité d'arguments dans un foncteur.
```haskell
class Functor f => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b
```

*Exemple avec Maybe* :
```haskell
> pure (+) <*> Just 1 <*> Just 2
Just 3
> pure (+) <*> Nothing <*> Just 2
Nothing
```

== Monads
Les monades permettent de chaîner des opérations dépendantes.
```haskell
class Applicative m => Monad m where
    return :: a -> m a
    (>>=) :: m a -> (a -> m b) -> m b
```

*Lois* :
1. Left identity : `return a >>= f == f a`
2. Right identity : `m >>= return == m`
3. Associativity : `(m >>= f) >>= g == m >>= (\x -> f x >>= g)`

*Do Notation* :
```haskell
result :: Maybe Double
result = do
    a <- safeDivide 10 2
    b <- safeDivide a 0
    return b
```

== Lazy Evaluation

=== Reduction Strategies
#image("../img/image copy 11.png", width: 100%)

*Innermost reduction* : réduit les expressions internes en premier.
```haskell
square (3 + 4)
= square 7
= 7 * 7
= 49
```

*Outermost reduction* : réduit les expressions externes en premier.
```haskell
square (3 + 4)
= (3 + 4) * (3 + 4)
= 7 * (3 + 4)
= 7 * 7
= 49
```

L'outermost reduction évite les évaluations inutiles et permet de travailler avec des structures infinies.

=== Infinite Lists
```haskell
ones :: [Int]
ones = 1 : ones

head ones = head (1 : ones)
          = 1
```

=== Strict Evaluation
Force l'évaluation immédiate avec `seq` ou `$!`.
```haskell
(!$) :: (a -> b) -> a -> b
f $! x = x `seq` f x

> const 42 $ undefined
42
> const 42 $! undefined
*** Exception: undefined
```

= Syntax Analysis

== Concrete vs Abstract Syntax
#image("../img/image copy 4.png", width: 100%)

*Syntaxe concrète* : représentation textuelle du code (lexèmes, grammaire, ponctuation).

*Syntaxe abstraite* : structure logique représentée par des AST.
```hs
data Expr = Const Int 
          | Var String
          | Binary Char Expr Expr
```

== Abstract Syntax Tree (AST)
#image("../img/image copy 5.png", width: 80%)

== Context-Free Grammars
Une grammaire $G = (V, Sigma, R, S)$ avec :
- V : variables (non-terminaux)
- $Sigma$ : symboles terminaux
- R : règles de production
- S : symbole de départ

=== Backus-Naur Form (BNF)
#image("../img/image copy 6.png", width: 100%)

#image("../img/image copy 7.png", width: 100%)

=== Derivation
#image("../img/image copy 8.png", width: 100%)

=== Parse Tree
#image("../img/image copy 9.png", width: 80%)

=== EBNF Extensions
- Options : `[ ... ]` (optionnel)
- Répétitions : `{ ... }` (zéro ou plusieurs fois)
- Groupements : `( ... )`

=== Syntax Diagram
#image("../img/image copy 10.png", width: 100%)

== Precedence and Associativity

*Précédence* : ordre d'évaluation des opérateurs.
```
3 + 4 * 5 = 3 + (4 * 5)  // * avant +
```

*Associativité* :
- Left-associative : `5 - 3 - 2 = (5 - 3) - 2`
- Right-associative : `2 ^ 3 ^ 2 = 2 ^ (3 ^ 2)`