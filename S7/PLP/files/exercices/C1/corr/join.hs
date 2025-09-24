join sep xs = case xs of
    [] -> []
    [x] -> x
    (x:xs) -> x ++ sep ++ join sep xs


join' _ [] = ""
join' _ [x] = x
join' sep (x:xs) = x ++ sep ++ join sep xs