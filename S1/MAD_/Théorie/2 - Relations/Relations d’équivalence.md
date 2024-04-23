---
Type: PriseDeNote
MiseAuPropre: non
---
## Définition
>[!important]
>Une relation d'équivalence en mathématiques discrètes est une manière de regrouper des éléments d'un ensemble en classes où les éléments de chaque classe sont similaires les uns aux autres selon certaines règles.

Une relation d’équivalence existe au moment ou la relation est :

- Réflexive
- Symétrique
- Transitive

Le symbole de notation est a ≡ b on dit qu’ils sont alors équivalents

Exemple : A est l’ensemble des mots du dictionnaire et comme relation d’équivalence nous pourrions avoir une relation avec les mots ayant un nombre de lettres définis. Cette relation est équivalente sur A.

Pour définir une relation d’équivalence il faut avoir une condition.

$$ [a] R = {s∈A | aRs}={s∈A|(a,s)∈R}

$$

**Théorème.** _Deux classes d’équivalence_ [a] _et_ [b] _sont ou bien égales ou bien disjointes._

Pour une équivalence nous pourrions avoir la notation $max(x,y) = 2$. Celle-ci signifie que la plus grande valeur acceptable pour le couple $(x,y)$ est 2.

### Trouver une classe d’équivalence dans une matrice

Voici une matrice $R_1$

$$ {\begin{pmatrix} a & b & c & d \\ 1 & 1 & 0 & 0 & a \\ 1 & 1 & 0 & 0 & b \\ 0 & 0 & 1 & 1 & c \\ 0 & 0 & 1 & 1 & d \\ \end{pmatrix}} $$

On peut déduire que cette matrice est réflexive, symétrique et transitive.

Pour trouver ses classes d’équivalence prenons la première ligne de la matrice et traçons toute les lignes qui ont une valeur dans la première. Cela définira la première classe d’équivalence.