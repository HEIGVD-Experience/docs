partition :: (a -> Bool) -> [a] -> ([a], [a])
partition p xs = (filter p xs, filter (not . p) xs)

partition' _ [] = ([], [])
partition' p (x:xs)
    | p x     = (x:xs, ys)
    | otherwise = (ys, x:zs)
  where (ys, zs) = partition' p xs