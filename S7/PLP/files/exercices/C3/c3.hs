-- Exercice 1
-- Implement the sortBy function from the Haskell standard library from scratch, using your own custom sorting algorithm.
sortBy' :: (a -> a -> Ordering) -> [a] -> [a]
sortBy' _ [] = []
sortBy' comparator xs = foldl insertBy [] xs
    where
        insertBy [] y = [y]
        insertBy (z:zs) y =
            case comparator y z of
                LT -> y : z : zs
                _  -> z : insertBy zs y

-- Exercice 3
-- Write recursive implementations for the following standard Haskell list API higher-order functions.
-- all
all' :: (a -> Bool) -> [a] -> Bool
all' _ [] = True
all' comp (x:xs) = comp x && all' comp xs

-- Exercice 4
-- Implement the following standard higher-order functions in Haskell using the foldr and foldl functions
-- map
map' :: (a -> b) -> [a] -> [b]
map' fn = foldr (\x acc -> fn x : acc) []

-- filter
filter' :: (a -> Bool) -> [a] -> [a]
filter' fn = foldr (\x acc -> if fn x then x : acc else acc) []

-- reverse  
reverse' :: [a] -> [a]
reverse' = foldl (\x acc -> acc : x) []

-- maximum
maximum' :: (Ord a) => [a] -> a
maximum' (x:xs) = foldl max x xs


-- Exercice 5
f :: Eq a => a -> [a] -> Int
f x = length . filter (== x)

-- Exercice 6
-- Reimplement the minimum function from the Haskell standard library using continuation-passing style (CPS).
minimum' :: Ord a => [a] -> (a -> r) -> r
minimum' [] k = error "Empty list has no minimum"
minimum' [x] k = k x
minimum' (x:xs) k = minimum' xs (\minRest -> k (min x minRest))