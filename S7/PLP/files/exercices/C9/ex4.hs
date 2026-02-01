data Type = ...
    deriving (Eq, Show)

data Expr = ... 
          | Let String Expr Expr
    deriving (Eq, Show)

type Env = [(String, Type)]


typecheck :: Expr -> Env -> Type
typecheck (Let x e1 e2) env = t2
    where 
        t1 = typecheck e1 env
        t2 = typecheck e2 ((x, t1) : env)
typecheck _ _ = ...

