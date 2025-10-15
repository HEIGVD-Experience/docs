data Operator
    = Add
    | Sub
    | Mul
    | Div

instance Show Operator where
    show Add = "+"
    show Sub = "-"
    show Mul = "*"
    show Div = "/"


data Expr
    = Number Int
    | Variable String
    | Binary Expr Operator Expr
    | Parenthesis Expr

instance Show Expr where
    show (Number n) = show n
    show (Binary e1 op e2) = show e1 ++ show op ++ show e2
    show (Variable x) = x
    show (Parenthesis e) = "(" ++ show e ++ ")"


type Env = [(String, Int)]

eval :: Expr -> Env -> Int
eval (Number n) _ = n
eval (Parenthesis e) env = eval e env
eval (Binary left Add right) env = eval left env + eval right env
eval (Binary left Sub right) env = eval left env - eval right env
eval (Binary left Mul right) env = eval left env * eval right env
eval (Binary left Div right) env = eval left env `div` eval right env
eval (Variable x) env = resolve x env



resolve :: String -> Env -> Int
resolve x [] = error ("undefined variable " ++ x)
resolve x ((x', v) : rest)
    | x == x' = v
    | otherwise = resolve x rest
