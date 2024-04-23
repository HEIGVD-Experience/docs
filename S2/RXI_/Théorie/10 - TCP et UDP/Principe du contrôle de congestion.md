---
Type: PriseDeNote
MiseAuPropre: oui
---

## Contrôle de congestion
- État de congestion
	- Le réseau n’est plus en mesure de transporter tout le trafic injecté et perd des paquets
- Danger de l’amplification d’une congestion par TCP
	- TCP réagit à une perte avec une retransmission
	- La retransmission peut augmenter la charge du réseau

Le contrôle de congestion de TCP doit optimiser le débit de transmission sans mettre en danger la stabilité du réseau

- L’émetteur adapte valeur cwnd en fonction des acquittements reçus ou des pertes détectées
- Il y a trois phases, avec des règles différentes pour adapter cwnd
	- **Démarrage lent** : Pour détecter le débit optimal, TCP commence avec une petite fenêtre de congestion et augmente rapidement le débit
	- **Évitement de congestion** : Dès que TCP s’approche de la zone de congestion, TCP augment le débit plus lentement
	- **Accroissement additif** - décroissance multiplicative : Dès qu’une perte est détectée TCP ralentit rapidement puis augmente à nouveau lentement

## Démarrage lent (Slow Start)
- TCP doit fonctionner correctement pour n’importe quelle capacité du réseau (entre bits/s et Gb/s)
- Il faut éviter de surcharger un lien lent au départ
	- Petite fenêtre cwnd au début
- Il faut rapidement arriver à exploiter la capacité de liens importants
	- Augmentation rapide de cwnd

>[!important] Algorithme Slow Start
>- Initialement cwnd = 1 MSS
>- Ensuite cwnd est incrémenté de 1 MSS par acquittement reçu
>
>(MSS: Maximum Segment Size: taille maximum d’un paquet)
>Cwnd double chaque RTT (délai aller-retour)

![[/_src/img/docs/Pasted image 20230624215005.png]]


## Évitement de congestion
- Dans Slow Start, la taille de cwnd augmente exponentiellement
- Augmentation doit ralentir quand TCP s’approche du ‘débit optimal’
- Un seuil d’évitement de congestion indique quand on s’approche d’une congestion
	- Paramètre ssthresh de TCP

>[!important] Algorithme Congestion Avoidance
> - Dès que cwnd > ssthresh, cwnd est agrandie linéairement
> - Pour chaque acquittement reçu : 
>   ![[/_src/img/docs/Pasted image 20230624215210.png]]
>   
>   Augmentation d’un MSS par RTT

### Déterminer la valeur du seuil de congestion de ssthresh ? 
1. Lorsqu’il n’y a pas de congestion, ssthresh croît linéairement avec cwnd → **accroissement additif** 
2. Lorsqu’une perte a été détectée, ssthresh est diminué à la moitié → **décroissance multiplicative**
	- Théorie des files d’attente : Pour garantir la stabilité du réseau, le débit doit diminuer de manière exponentielle

## Comportement de cwnd et ssthresh
- Trois phases
	- Slow Start avec une croissance exponentielle de cwnd
	- Congestion avoidance (accroissement additif de ssthresh)
	- Diminution de ssthresh lors d’une perte (décroissance multiplicative de ssthresh)

## Recouvrement rapide
- L’utilisation de Slow Start après des pertes isolées n’est pas optimale
	- Si des segments intermédiaires ont été perdus mais les segments suivants sont arrivés, cela indique une congestion légère et ne justifie pas Slow Start

**Recouvrement rapide** pour résoudre rapidement la perte de segments isolés
- Utilisé en combinaison avec Retransmission Rapide

>[!important] Algorithme Recouvrement Rapide
>- Retransmettre rapidement le segment manquant
>- Diminuer la fenêtre à la moitié
>- Continuer avec Congestion Avoidance

