---
MiseAuPropre: oui
---

## Définition
Subdiviser une plage d’adresse en plages plus petites et les allouer à différents réseaux physiques. Un sous réseau permet le découpage d'un nombre définit d'adresse IP en un nombre plus élevé en utilisant une nouvelle couche : les masques de sous-réseaux.
Nous aurons donc 3 couches : **net id, subnetmask** et **subnet**.

## Masque de sous-réseaux
![[/_src/img/docs/Pasted image 20230327142609.png]]
Dans le réseau ci-dessus on peut voir que 6 bits on été récupéré pour créer des sous-réseaux. Ces 6 bits ont été pris dans le 3ème block de l'adresse. Cela permet de créer $2^6 = 64$ sous réseaux qui chaqu'un pourront contenir $2^{10} = 1024$ noeuds. 