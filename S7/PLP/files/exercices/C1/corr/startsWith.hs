
-- `take` function offer a way to get a part of a list
-- we can use it to check if a list starts with another one
startsWith xs ys = take (length xs) ys == xs

-- otber way to do it
startsWith' [] _ = True
startsWith' _ [] = False
startsWith' (x:xs) (y:ys) = x == y && startsWith' xs ys