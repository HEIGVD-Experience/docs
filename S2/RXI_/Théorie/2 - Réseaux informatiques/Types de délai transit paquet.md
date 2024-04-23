---
MiseAuPropre: oui
---

## Délai de transmission

<aside> 💡 Le délai de transmission est le délai permettant d’émettre tout les bits sur le réseau.

</aside>

Le délai de transmission se calcule de la manière suivante :

$$ \begin{split}
t_{transmission} &= \frac{n}{r} \\ 
n &= Longueur \> du \> paquet \\ 
r &= Débit \> binaire \> du \> lien 
\end{split}
$$

La longueur du paquet est souvent exprimée en B (byte ou octet) tant dis que le débit binaire est lui exprimé en b (bite).

⚠️ Il faut donc multiplier la longueur du paquet par $8$ pour obtenir des bits.

## Délai de propagation

<aside> 💡 Le délai de propagation est le délai du signal physique entre émetteur et récepteur.

</aside>

Le délai de propagation se calcule de la manière suivante :

$$\begin{split}
t_{prop} &= \frac{L}{v_{prop}} \\ 
L &= Longueur \> du \> lien \\ 
V_{prop} &= Vitesse \> de \> propagation 
\end{split}
$$

⚠️ La vitesse de propagation est une constante qui vaut : $300'000\> km/s = 3*10^8\>m/s$.

## Délai de traitement

<aside> 💡 Le délai de traitement est le délai de calcul nécessaire à un noeud.

-   Vérification de la somme de contrôle
-   Recherche dans la table de routage </aside>

Le délai de traitement ne peut pas être calculé comme ça étant donné qu’il dépend de beaucoup de paramètres. Il dépend du noeud, des opération à effectuer.

<aside> ⚠️ Le délai de traitement est généralement très faible comparé aux autres délais</aside>

## Délai d’attente

<aside> 💡 Le délai d’attente est le délai causé par la file d’attente de l’interface de sortie.

</aside>

Le délai d’attente se calcule de la manière suivante :

$$ \begin{split}
t_{attente} &= \sum \frac{n_i}{r} \\ 
\sum_i n_i &= Somme \> des \> longueurs \> de \> tous \> les \> paquets \> devant le \> paquet \> considéré \\
r &= Débit \> binaire \> du \> lien 
\end{split}
$$

## Types de délai transit paquet

|Type de délai|Résumé|Graph|
|----|----|----|
|Délai de transmission|Le délai de transmission est le délai permettant d’émettre tout les bits sur le réseau.|![[/_src/img/docs/Pasted image 20230623210026.png]]
|Délai de propagation|Le délai de propagation est le délai du signal physique entre émetteur et récepteur.|![[/_src/img/docs/Pasted image 20230623210134.png]]|
|Délai de traitement|Le délai de traitement est le délai de calcul nécessaire à un noeud. <br>- Vérification de la somme de contrôle <br>- Recherche dans la table de routage|![[/_src/img/docs/Pasted image 20230623210253.png]]|
|Délai d'attente|Le délai d’attente est le délai causé par la file d’attente de l’interface de sortie.|![[/_src/img/docs/Pasted image 20230623210253.png]]|


|Puissance|Nom|Valeur|
|---|---|---|
|$10^{12}$|Téra|$1,000,000,000,000$|
|$10^{9}$|Giga|$1,000,000,000$|
|$10^{6}$|Méga|$1,000,000$|
|$10^{3}$|Kilo|$1,000$|
|$10^{0}$||$1$|
|$10^{-3}$|Milli|$0.001$|
|$10^{-6}$|Micro|$0.000001$|
|$10^{-9}$|Nano|$0.000000001$|
|$10^{-12}$|Pico|$0.000000000001$|


