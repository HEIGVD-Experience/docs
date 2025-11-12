repeat' :: a -> [a]
repeat' x = x : repeat' x

replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = take n $ repeat' x