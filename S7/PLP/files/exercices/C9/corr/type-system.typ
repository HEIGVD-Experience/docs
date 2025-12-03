


$

Gamma - "Cons" frac(Gamma tack.r t_1:T "  " Gamma tack.r t_2 : [T], Gamma tack.r t_1 : t_2 : [T]) \ \

Gamma - "Concat" frac(Gamma tack.r t_1 : [T] "  " Gamma tack.r t_2 : [T], Gamma tack.r t_1 ++ t_2 : [T]) \ \ 

Gamma - "Head" frac(Gamma tack.r t : [t], Gamma tack.r "head" t : T) \ \

Gamma - "Elem" frac(Gamma tack.r t_1 : T "  " Gamma tack.r t_2 : [T], Gamma tack.r "elem" t_1 t_2 : "Bool") \ \

Gamma - "Length" frac(Gamma tack.r t : [T], Gamma tack.r "length" t : "Int")
$