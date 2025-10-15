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
    | Binary Expr Operator Expr
    | Parenthesis Expr

instance Show Expr where
    show (Number n) = show n
    show (Binary e1 op e2) = show e1 ++ show op ++ show e2
    show (Parenthesis e) = "(" ++ show e ++ ")"


eval :: Expr -> Int
eval (Number n) = n
eval (Parenthesis e) = eval e
eval (Binary left Add right) = eval left + eval right
eval (Binary left Sub right) = eval left - eval right
eval (Binary left Mul right) = eval left * eval right
eval (Binary left Div right) = eval left `div` eval right