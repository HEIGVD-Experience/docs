#import "/_settings/typst/template-qk-note.typ": *
#show: doc => conf(
  title: "Bases de données orientées graphe",
  course: "MAC - Méthode d'accès aux données",
  col: 1,
  doc,
)

= Concepts fondamentaux

== Les graphes sont partout
Le monde est un graphe connecté: personnes, lieux, événements, etc. Les graphes sont présents dans tous les domaines (sciences, technologies, éducation, art).

== Structure de données de graphe
Un *graphe* est un type de donnée abstrait composé de:
- *Sommets* (nœuds): les entités du graphe
- *Arêtes* (relations): les connexions entre paires de sommets

== Bases de données orientées graphe
Une base de données orientée graphe utilise des structures de graphes pour représenter et interroger les données via:
- *Nœuds*: entités avec propriétés (paires clé-valeur)
- *Arêtes*: relations dirigées et nommées entre nœuds
- *Propriétés*: attributs des nœuds et relations

*Avantages clés*:
- Les relations sont des éléments de première classe
- Traversée très rapide des relations
- Relations stockées (non calculées à la requête)

*Cas d'usage*: réseaux sociaux, moteurs de recommandation, détection de fraudes

== Graphes vs Bases relationnelles

=== Différences fondamentales
*Bases relationnelles*:
- Relations calculées au moment de la requête via JOIN coûteux
- Performance dégradée avec données hautement connectées

*Bases de données graphes*:
- Relations stockées directement avec les données
- Performance constante indépendante de la taille des données
- Excellentes pour données hautement connectées et requêtes complexes

=== Exemple: réseau social
Expérience sur 1'000'000 de personnes avec ~50 amis chacune, recherche d'amis à profondeur 5:

#table(
  columns: 4,
  [*Profondeur*], [*RDBMS (s)*], [*Neo4j (s)*], [*Résultats*],
  [2], [0.016], [0.01], [~2500],
  [3], [30.267], [0.168], [~110'000],
  [4], [1543.505], [1.359], [~600'000],
  [5], [Unfinished], [2.132], [~800'000]
)

== Modèle Property Graph

=== Composants
*Nœuds*:
- Entités du graphe
- Contiennent des propriétés (paires clé-valeur)
- Peuvent avoir 0 à plusieurs labels (catégories)

*Relations*:
- Associations dirigées et nommées entre deux nœuds
- Ont un type, une direction, un nœud source et destination
- Peuvent avoir des propriétés
- Une relation doit toujours relier deux nœuds

=== Stockage natif
*Bases de données graphes natives*:
- Stockage natif de graphes dès la conception
- *Index-free adjacency*: relations stockées, pas calculées
- Avantage de performance significatif

*Bases de données graphes non-natives*:
- Sérialisent les données dans des BD relationnelles ou autres

*Attention*: Les index sont toujours nécessaires pour accélérer l'accès aux nœuds de départ d'une traversée.

= Neo4j et le langage Cypher

== Introduction à Neo4j

=== Qu'est-ce que Neo4j?
- Base de données graphe native open source NoSQL
- Développement initial: 2003, public depuis 2007
- Code source en Java et Scala
- Éditions communautaire et entreprise

=== Caractéristiques de Neo4j
- *Cypher*: langage de requête déclaratif optimisé pour les graphes (projet openCypher)
- *Performance*: parcours à temps constant dans les grands graphes
- *Flexibilité*: schéma de graphe flexible évolutif
- *Pilotes*: Java, JavaScript, .NET, Python, etc.
- *Scalabilité*: jusqu'à des milliards de nœuds

=== Convention de nommage Cypher
- *Labels de nœuds*: CamelCase, majuscule initiale (`:VehicleOwner`)
- *Types de relations*: MAJUSCULES, tiret bas (`:OWNS_VEHICLE`)
- *Autres* (propriétés, variables, paramètres): camelCase, minuscule initiale (`title`, `businessAddress`)

== Syntaxe de base

=== Représentation des nœuds
```cypher
()                    // nœud anonyme
(p:Person)            // nœud avec label Person, variable p
(work:Company)        // nœud avec label Company, variable work
(:Technology)         // label Technology, sans variable
```

=== Représentation des relations
```cypher
(a)-->(b)                    // relation dirigée
(a)-[r]->(b)                 // avec variable r
(a)-[r:REL_TYPE]->(b)        // avec type de relation
(a)-[r {prop: value}]->(b)   // avec propriété
```

*Important*: Direction obligatoire à la création, mais peut être ignorée lors des recherches.

=== Propriétés
```cypher
(p:Person {name: 'Jennifer'})  // propriété de nœud
(p1)-[rel:FRIENDS {since: 2018}]->(p2)  // propriété de relation
```

== Opérations CRUD

==== CREATE - Création de données
```cypher
// Créer un nœud
CREATE (movie:Movie {title: 'The Matrix', released: 1999})

// Créer une relation
CREATE (actor:Person {name: 'Keanu Reeves'})
CREATE (actor)-[:ACTED_IN {roles: ['Neo']}]->(movie)
```

=== MATCH et RETURN - Interrogation
```cypher
// Tous les titres de films
MATCH (movie:Movie)
RETURN movie.title

// Acteurs d'un film spécifique
MATCH (:Movie {title: 'The Matrix'})<-[:ACTED_IN]-(actor)
RETURN actor.name

// Retourner tout
MATCH p = (person)-[r]->(m)
RETURN *
```

=== WHERE - Filtrage
```cypher
// Filtrage simple
MATCH (movie:Movie)
WHERE movie.released >= 1990 AND movie.released < 2000
RETURN movie.title

// WHERE dans le motif de nœud
MATCH (movie:Movie WHERE movie.released >= 1990)
RETURN movie.title

// Utilisation de NOT
MATCH (p:Person)
WHERE NOT p.name = 'Jennifer'
RETURN p

// Test d'existence de propriété
WHERE p.birthdate IS NOT NULL
WHERE rel.startYear IS NULL
```

=== SET et DELETE - Mise à jour et suppression
```cypher
// Mise à jour
MATCH (p:Person {name: 'Jennifer'})
SET p.birthdate = date('1980-01-01')

// Suppression de relation
MATCH (j)-[r:IS_FRIENDS_WITH]->(m)
DELETE r

// Suppression de nœud avec relations
MATCH (m:Person {name: 'Mark'})
DETACH DELETE m

// Suppression de propriété
REMOVE n.birthdate
// ou
SET n.birthdate = null
```

=== MERGE - Éviter les doublons
Opération "sélection ou insertion":
```cypher
// Fusion de nœud
MERGE (mark:Person {name: 'Mark'})

// Fusion de relation
MATCH (j:Person {name: 'Jennifer'})
MATCH (m:Person {name: 'Mark'})
MERGE (j)-[r:IS_FRIENDS_WITH]->(m)

// Avec ON CREATE / ON MATCH
MERGE (keanu:Person {name: 'Keanu Reeves'})
ON CREATE SET keanu.created = timestamp()
ON MATCH SET keanu.lastSeen = timestamp()
```

== Index et contraintes

=== Création d'index
```cypher
// Index simple
CREATE INDEX FOR (a:Actor) ON (a.name)

// Index composite
CREATE INDEX FOR (a:Actor) ON (a.name, a.born)

// Inspection des index
SHOW indexes YIELD labelsOrTypes, properties, entityType
```

*Utilité*: Accélérer la recherche des points de départ d'un parcours de graphe.

=== Contraintes
```cypher
// Contrainte d'unicité
CREATE CONSTRAINT FOR (movie:Movie) 
REQUIRE movie.title IS UNIQUE

// Inspection des contraintes
SHOW constraints YIELD type, labelsOrTypes, properties
```

*Note*: Une contrainte d'unicité crée implicitement un index.

= Requêtes avancées en Cypher

== Fonctions d'agrégation

==== Fonctions de base
```cypher
// Moyenne, max, min, sum
MATCH (p:Person)
RETURN avg(p.age), max(p.age), min(p.age), sum(p.age)

// Comptage
MATCH (p:Person {name: 'Keanu'})-[r]->()
RETURN type(r), count(*)

// Collection
MATCH (p1:Person)-[:KNOWS]->(p2:Person)
RETURN p1.name, collect(p2.name) AS acquaintances
```

=== DISTINCT et regroupement
```cypher
// Comptage avec DISTINCT
MATCH (p:Person)-->(friend)-->(friendOfFriend)
WHERE p.name = 'Keanu'
RETURN friendOfFriend.name, 
       count(DISTINCT friendOfFriend),
       count(friendOfFriend)

// Avec regroupement
MATCH (p1:Person)-[:KNOWS]->(p2:Person)
RETURN p1.name, max(p2.age) as ageOfOldestFriend
```

== Clauses de transformation

==== WITH - Calculs intermédiaires
```cypher
// Reporter toutes les variables + nouvelles
MATCH (person)-[r]->(otherPerson)
WITH *, type(r) AS connectionType
RETURN person.name, otherPerson.name, connectionType

// Filtrage sur agrégation
MATCH (david {name: 'David'})--(other)-->()
WITH other, count(*) AS connections
WHERE connections > 1
RETURN other.name
```

=== UNWIND - Transformer liste en lignes
```cypher
// Recherche sur liste de technologies
WITH ['Graphs', 'Query Languages'] AS techReqs
UNWIND techReqs AS technology
MATCH (p:Person)-[:LIKES]-(t:Technology {type: technology})
RETURN t.type, collect(p.name) AS candidates

// Créer liste distincte
WITH [1, 1, 2, 2] AS coll
UNWIND coll AS x
WITH DISTINCT x
RETURN collect(x) AS setOfVals
```

=== ORDER BY et DISTINCT
```cypher
// Tri des résultats
WITH [4, 5, 6, 7] AS experienceRange
UNWIND experienceRange AS number
MATCH (p:Person)
WHERE p.yearsExp = number
RETURN p.name, p.yearsExp
ORDER BY p.yearsExp DESC

// Résultats uniques
MATCH (user:Person)
WHERE user.twitter IS NOT null
WITH user
MATCH (user)-[:LIKES]-(t:Technology)
WHERE t.type IN ['Graphs', 'Query Languages']
RETURN DISTINCT user.name
```

== Motifs de chemins

==== Longueur variable
```cypher
// Un ou plusieurs sauts
MATCH (a)-[:KNOWS*]->(b)

// Exactement 3 sauts
MATCH (a)-[:KNOWS*3]->(b)

// Entre 3 et 5 sauts
MATCH (a)-[:KNOWS*3..5]->(b)

// 3 sauts ou plus
MATCH (a)-[:KNOWS*3..]->(b)

// 5 sauts ou moins
MATCH (a)-[:KNOWS*..5]->(b)

// Nommer un chemin
MATCH p = (a)-[:KNOWS*3..5]->(b)
```

=== Chemins les plus courts
```cypher
// Films et acteurs jusqu'à 3 sauts
MATCH p = (bacon:Person {name: "Kevin Bacon"})-[*1..3]-(hollywood)
RETURN p

// Plus court chemin (Bacon number)
MATCH p = shortestPath(
  (bacon:Person {name: "Kevin Bacon"})-[*]-
  (meg:Person {name: "Meg Ryan"})
)
RETURN p
```