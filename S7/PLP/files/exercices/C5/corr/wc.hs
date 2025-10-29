{-
import Control.Monad
import Data.Char
import System.Environment
import System.IO

concatenate :: Int -> Int -> Int -> String -> String
concatenate lines words bytes filename =
    show lines ++ "    " ++ show words ++ "    " ++ show bytes ++ "    " ++ filename ++ "\n"

main :: IO()
main = do
    args <- getArgs
    when (length args == 1) $ do
        let filePath = head args
        size <- withFile filePath ReadMode hFileSize
        contents <- readFile filePath
        putStr $ concatenate (length (lines contents)) (length (words contents)) (fromIntegral size) filePath
-}
import System.Environment
import System.IO
import Text.Printf

type Count = (Int, Int, Int)

stats :: String -> Count
stats str = (lineCount, wordCount, byteCount)
    where
        lineCount = length (lines str)
        wordCount = length (words str)
        byteCount = length str

display :: Count -> String -> IO()
display (lineCount, wordCount, byteCount) =
    printf "%5d %5d %5d %s\n" lineCount wordCount byteCount

usage :: IO()
usage = do
    progName <- getProgName
    putStrLn ("usage: " ++ progName ++ " <file>")


main :: IO()
main = do
    args <- getArgs
    case args of
        [filename] -> do
            content <- readFile filename
            let count = stats content
            display count filename
        _ -> usage