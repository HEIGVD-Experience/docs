-- Exercice 1
sumOfSquares :: [Int] -> Int
sumOfSquares xs = sum [x^2 | x <- xs]

-- Exercice 3
-- a) A recursive function that calculates the sum of numbers from 0 to a given non-negative integer.
sumRecNonNeg :: [Int] -> Int
sumRecNonNeg [] = 0
sumRecNonNeg (x:xs)
    | x < 0     = sumRecNonNeg xs
    | otherwise = x + sumRecNonNeg xs

-- b) A recursive function that calculates the factorial of a given non-negative integer.

factRecNonNeg :: [Int] -> Int
factRecNonNeg [] = 1
factRecNonNeg (x:xs)
    | x < 0     = factRecNonNeg xs
    | otherwise = x * factRecNonNeg xs

-- Si on donne [1,2,3] on aura, 1 * factRecNonNeg [2,3] 2 * factRecNonNeg [3] 3

-- c) A recursive function that calculates the nth Fibonacci number.

fiboRecursive :: Int -> Int
fiboRecursive 0 = 0
fiboRecursive 1 = 1
fiboRecursive n = fiboRecursive (n - 1) + fiboRecursive (n - 2)

-- Exercice 5
-- Write a Haskell function to convert seconds into hours, minutes, and seconds without relying on division or modulo operations.

convertSecs :: Int -> String
convertSecs totalSeconds = 
    let hours = countHours totalSeconds 0
        remainingAfterHours = totalSeconds - (hours * 3600)
        minutes = countMinutes remainingAfterHours 0
        seconds = remainingAfterHours - (minutes * 60)
    in show hours ++ " hours, " ++ show minutes ++ " minutes, " ++ show seconds ++ " seconds"
    where
        countHours secs h
            | secs >= 3600 = countHours (secs - 3600) (h + 1)
            | otherwise    = h
        countMinutes secs m
            | secs >= 60   = countMinutes (secs - 60) (m + 1)
            | otherwise    = m

-- Exercice 6
-- Define the following lists using list comprehensions:
-- List of odd numbers from 1 to 20.
showOddNumbers :: Int -> String
showOddNumbers n = show [x | x <- [1..n], odd x]
-- [x = valeur à afficher | x = variable de la liste, <- = dans, [1..n] = liste de 1 à n, odd x = condition pour les nombres impairs]

-- Exercice 8
-- Write a tail-recursive function reverse' that returns the elements of a list in reverse order.
reverse' :: [a] -> [a]
reverse' xs = reverse'' xs [] -- adding a list accumulator
    where
        reverse'' [] acc = acc -- if the initial list is empty and the acc not, return the acc
        reverse'' (x:xs) acc = reverse'' xs (x:acc) -- if list is not empty, append the first value of the list to the acc

-- Exercice 9
-- Implement the singleton function in Haskell that takes an element and returns a list containing only that element.
singletonEx :: a -> [a]
singletonEx x = [x]