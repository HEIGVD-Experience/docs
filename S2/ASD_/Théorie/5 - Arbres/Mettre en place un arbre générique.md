---
Type: PriseDeNote
MiseAuPropre: oui
---

>[!important]
>Un arbre est avant tout une `classe` ou un `type structuré` en fonction du besoin.

Exemple d'implémentation
```cpp
structure Noeud<T>
	T étiquette
	Noeud* ainé
	Noeud* puiné
	Noeud* parent
```

## Explication
Dans cet exemple d'implémentation nous utilisons 3 pointeurs pointant chacun sur un élément important de notre arbre. De ce nous pourrons plus simplement naviguer dans celui-ci. Si le noeuds ne possède pas un des éléments dans `ainé, puiné ou parent` celui-ci vaudra alors un `nullptr`.
![[S0/PiecesJointes/Capture d’écran 2023-05-23 à 21.41.39.png]]

