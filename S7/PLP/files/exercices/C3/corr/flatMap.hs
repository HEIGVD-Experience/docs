{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use concatMap" #-}
import Data.List

flatMap :: (a -> [b]) -> [a] -> [b]
flatMap _ [] = []
flatMap f (x:xs) = f x ++ flatMap f xs

flatMap' f xs = concat (map f xs)