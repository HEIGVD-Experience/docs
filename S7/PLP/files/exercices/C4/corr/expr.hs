data Operator
    = Add
    | Sub
    | Mul
    | Div
    deriving (Show)


data Expr
    = Number Int
    | Binary Expr Operator Expr
    | Parenthesis Expr
    deriving (Show)

    