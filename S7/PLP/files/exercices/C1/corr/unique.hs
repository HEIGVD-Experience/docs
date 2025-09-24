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