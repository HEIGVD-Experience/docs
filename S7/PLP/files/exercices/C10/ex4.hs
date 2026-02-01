data Expr  = ...
data Stmt  = ... | DoWhile Expr Stmt
data Value = ... | Bool Boolean
    deriving Eq

type State = Map String Value

eval :: Expr -> State -> Value
eval expr = ...

exec :: Stmt -> State -> State
exec stmt = ...
exec (DoWhile cond body) state =
    let state' = exec body state -- Execute the body first
    in if (eval cond state') == Bool True
         then exec (DoWhile cond body) state' -- Repeat if condition is true
         else state' -- Otherwise, return the final state