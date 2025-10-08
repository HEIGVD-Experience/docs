-- retourner la somme des nombres pair au carré sans recursion
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Fuse foldr/map" #-}
{-# HLINT ignore "Use sum" #-}
sum' :: [Int] -> Int
sum' = foldr (+) 0 . map (^2) . filter even

sum'' = sum . map (^2) . filter even