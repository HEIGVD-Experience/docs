
import Data.List (singleton)

x1 = fst((even 128, id "foo"), ())        :: (Bool, String)
x2 = 3.141592                             :: Double -- juste mais pas parfait on aurait plutot Fractional a => a
x3 = head(head[show 42, "42"])            :: Char
x4 = length ['z' ..] `div` 2              :: Int
x5 = head (singleton True) : [not False]  :: [Bool]