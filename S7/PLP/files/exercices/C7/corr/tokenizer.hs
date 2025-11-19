import Data.Char

data Token = LPar
           | RPar
           | Lambda
           | Dot
           | Var Char
  deriving (Show, Eq)

tokenize :: String -> [Token]
tokenize [] = []
tokenize (c:cs)
  | isSpace c = tokenize cs
  | c == '('  = LPar : tokenize cs
  | c == ')'  = RPar : tokenize cs
  | c == 'λ'  = Lambda : tokenize cs
  | c == '.'  = Dot : tokenize cs
  | isLower c = Var c : tokenize cs
  | otherwise = error ("Unexpected character: " ++ [c])