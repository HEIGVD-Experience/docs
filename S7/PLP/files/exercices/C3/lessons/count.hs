count :: (a -> Bool) -> [a] -> Int
count _ [] = 0
count p (x:xs)
    | p x       = 1 + count p xs
    | otherwise = count p xs