data Expr 
    = Cst Int
    | Var String
    | Bin Expr Char Expr
    | Let String Expr Expr
    deriving (Show)

-- Check for variable defined multiple times in different scopes
check :: Expr -> [Expr]
check expr = check' expr []
    where
        check' :: Expr -> [String] -> [Expr]
        check' (Cst _) _ = []
        check' (Var v) env 
            | v `elem` env = []
            | otherwise    = [Var v]
        check' (Bin e1 _ e2) env = check' e1 env ++ check' e2 env
        check' (Let v e1 e2) env 
            | v `elem` env = Let v e1 e2 : check' e1 env ++ check' e2 env
            | otherwise    = check' e1 env ++ check' e2 (v:env)

letExpr :: Expr
letExpr = Let "x" (Cst 5) 
            (Let "y" (Cst 2) 
                (Let "x" (Cst 3) 
                    (Bin (Var "x") '+' (Var "y"))))