import Data.List
data JSON
    = JSONObject [(String, JSON)]
    | JSONString String
    | JSONNumber Int
    | JSONBool Bool
    | JSONNull
    | JSONArray [JSON]


instance Show JSON where
    show x = case x of
        JSONString s -> "\"" ++ s ++ "\""
        JSONNumber n -> show n
        JSONBool b -> show b
        JSONNull -> "null"
        JSONArray a -> "[" ++ intercalate ", " (map show a) ++ "]"
        JSONObject o -> "{" ++ intercalate ", " (map showObj o) ++ "}"
            where
                showObj (k,v) = "\"" ++ k ++ "\": " ++ show v


test = JSONObject [("test", JSONString "Hello, World!"), ("fromage", JSONBool True), ("numbers", JSONArray [JSONObject [("number", JSONNumber 42)], JSONObject [("number", JSONNumber 43)], JSONObject [("number", JSONNumber 44)]])]