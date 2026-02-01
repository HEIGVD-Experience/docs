data Expr
    = Cst Int
    | Var String
    | Bin Expr Char Expr
    | Let String Expr Expr
    deriving (Eq, Show)

check :: Expr -> [Expr]
check expr = check' expr []
    where 
        check' :: Expr -> [String] -> [Expr]
        check' (Cst _) _ = []
        check' (Var v) env = [Var v | v `notElem` env]
        check' (Bin e1 _ e2) env = check' e1 env ++ check' e2 env
        check' (Let x e1 e2) env = check' e1 env ++ check' e2 (x : env)