var x1 >= 0; # nombre de carton de type 1
var x2 >= 0; # nombre de carton de type 2

maximize
    Z: 3*x1 + 5*x2; # on cherche à maximiser le profit

subject to
    C1: x1+2*x2 <= 7500; # quantité maximum de carton disponible
    C2: 2*x1+3*x2 <= 13200; # minutes de fabrication disponibles sur la semaine
    C3: 2*x1+3*x2 <= 14000; # nombres maximum d'agrafes disponibles

end;