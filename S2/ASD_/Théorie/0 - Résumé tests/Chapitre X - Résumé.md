---
Type: Resume
MiseAuPropre: oui
---

### Variables statiques
Création : dans un bloc
Destruction : fin du programme

### Variables automatiques
Création : dans un bloc
Destruction : fin de bloc

### Variables dynamiques
Création : quand l'utilisateur choisi
Destruction : quand l'utilisateur choisi

### Pointeurs constants
![[S0/PiecesJointes/Pasted image 20230404203509.png]]
### std::move
La fonction move proposé par la librairie **utility** permet de déplacer une valeur d'une variable dans une autre. En prenant les valeurs nous allons supprimer tous les valeurs de la variable copiée mais sera pas détruite.


|                                                        |                                                                                                                                                                                                                                     |
| ------------------------------------------------------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Vecteur vide                                           | Reserve 1 espace mémoire (Sans construction)                                                                                                                                                                                        |
| Capacité insuffisante<br>(= **RAL**)                   | Alloue capaciter * 2                                                                                                                                                                                                                |
| Copie vector à vector<br>(= **CV**)                    | Construct. mouv de chaque élément (end() objet au begin() objet)                                                                                                                                                                    |
| Détruire vector<br>(=**DV**)                           | Destructeur de chaque élément (end() objet au begin() objet)                                                                                                                                                                        |
| Emplace<br>Emplace(objet)                              | **RAL** + Construit l’objet direct dans le vecteur + **CV** + **DV**<br>Objet est construit + **RAL** + construct. mouv. + **CV** + **DV** + destruct. objet                                                                        |
| Push_back<br>Push_back(objet)                          | Construit objet + **RAL** + construct. mouv. (copie) + **CV** + **DV** + destruct.                                                                                                                                                  |
| [x] = [y]                                              | Opérateur =                                                                                                                                                                                                                         |
| [x] = Objet                                            | Construit l’objet + Opérateur = mouv. + destruct.                                                                                                                                                                                   |
| Insert(pos, objet)<br>Si **RAL**<br>Insert(pos, objet) | Construit l’objet + **RAL** + construct. mouv. + **CV** [pos à begin()] + **CV** [pos à end()] + **DV** + destuct. Objet<br>Construit l’objet + construct. mouv de end() + opérateur = mouv. de [end() – 1 à pos] + destruct. objet |
| Erase(pos)                                             | Operateur = mouv. de [pos à end()-1] + destruct. end()                                                                                                                                                                              |

