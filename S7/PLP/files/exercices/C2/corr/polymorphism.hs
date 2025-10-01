sorted :: Ord a => [a] -> Bool
sorted []       = True
sorted [x]      = True
sorted (x:y:xs) = x <= y && sorted (y:xs)