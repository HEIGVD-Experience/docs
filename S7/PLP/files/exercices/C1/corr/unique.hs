-- unique xs = 
unique [] = []
unique (x:xs) = if x `elem` xs
                then unique xs
                else x : unique xs


-- if we decide to not use `elem`
unique' [] = []
unique' (x:xs) = if isInList x xs
                 then unique' xs
                 else x : unique' xs
  where
    isInList _ [] = False
    isInList y (z:zs) = (y == z) || isInList y zs


-- the best approach
unique'' xs = unique'' xs []
    where
        unique'' [] acc = reverse acc           -- check if list is empty then reverse the accumulator
        unique'' (x:xs) acc
            | x `elem` acc = unique'' xs acc
            | otherwise    = unique'' xs (x:acc)