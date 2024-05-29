#import "/_settings/typst/template-note.typ": conf
#show: doc => conf(
  title: [
    Résumé CLD - TE1
  ],
  lesson: "CLD",
  chapter: "",
  definition: "",
  col: 1,
  doc,
)

= AWS
== EC2
*Statut d'instance*
- Pending : démarrage de l'instance
- Running : instance en cours d'exécution, coût sur la RAM, CPU, espace mémoire et IP
- Stopping : arrêt de l'instance
- Stopped : instance arrêtée, coût sur l'espace mémoire et IP
- Terminated : instance va être supprimée définitivement

== Security Group
Les security groups sont des pare-feu virtuels qui contrôlent le trafic entrant et sortant d'une instance. Ceux-ci peuvent être attribués à une ou plusieurs instances.

Ils permettent de contrôler avec des *inbounds* et *outbounds* rules le trafic entrant et sortant d'une instance. Pour cela, nous pouvons définir quel *port* ou *protocole* doit être autorisé ou non.

== NAT
Le NAT permet de faire une translation d'adresse IP privée vers une adresse IP publique. Il permet de faire communiquer des instances privées avec l'extérieur.

== Gestion des coûts
- Prendre des instances moins performantes et adaptées à nos besoins
- Limiter le temps d'utilisation des instances
- Utiliser un mode de facturation par paiement en avance

== CLI 
Le CLI d'AWS utilise des commandes pour interagir avec les services AWS. Il utilise le protocole HTTP/S pour dialoguer avec les API d'AWS.

== Load Balancer
Le Load Balancer permet de répartir la charge entre plusieurs instances. De plus, peu importe le nombre d'instances, on doit exposer au client qu'un seul point d'entrée.

= Notion de réseaux
== Load Balancer
=== Load Balancer applicatif
*Attention!* pour que LB puisse être appliqué à une application il faut absolument que celle-ci soit *stateless*.

=== TCP vs HTTP

== Forward policies
