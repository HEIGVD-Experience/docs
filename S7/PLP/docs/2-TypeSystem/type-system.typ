#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: [
    Element of Programming
  ],
  lesson: "PLP",
  col: 1,
  doc,
)

= Type system
Haskell est un langage ayant les caractérisiques de typages fort:
- Typage fort et statique
- Types et classes de types
- Inférence de types
- Paramétrisation polymorphique

#info[
  Les programmes Haskell peuvent être considéré comme `type-safe` (sécurité de type). Cela signifie que les erreurs de types sont détectées à la compilation et non à l'exécution, ce qui réduit le nombre d'erreurs potentielles lors de l'exécution du programme.
]

== Typing expression
Chaque expression dans Haskell a un type, qui est déterminé lors de la compilation. Le type d'une expression peut être explicite (déclaré par le programmeur) ou implicite (inféré par le compilateur).

Dans le cas ou celle-ci est définie explicitement, on utilise la syntaxe suivante:
```haskell
> :type 'c'
'c' :: Char
```