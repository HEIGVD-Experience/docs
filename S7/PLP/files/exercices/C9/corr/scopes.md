
```hs
import Prelude (elem, reverse)

unique :: Eq a => [a] -> [a]
unique xs = unique' xs []
    where
        unique' [] xs' = reverse xs'
        unique' (x:xs) xs'
            | elem x xs' = unique' xs xs'
            | otherwise  = unique' xs (x:xs')
```

GlobalScope
    symbols: elem, reverse, unique
    children:
        FunctionScope
        symbols: xs, unique'
        children:
            LocalScope
                symbols: xs'
                children: .
            LocalScope
                symbols: x, xs, xs'
                children: .