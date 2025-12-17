import System.Environment (getArgs)

main :: IO()
main = do
    args <- getArgs
    case args of
        [input, output] -> numberLines input output
        _ -> putStrLn "usage: ln <input> <output>"

numberLines :: FilePath -> FilePath -> IO()
numberLines input output = do
        content <- readFile input
        let numberedLines = zipWith formatLine [1..] (lines content)
        writeFile output (unlines numberedLines) 
    
formatLine :: Int -> String -> String
formatLine n line = show n ++ " " ++ line