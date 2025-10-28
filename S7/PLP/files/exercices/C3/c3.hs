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