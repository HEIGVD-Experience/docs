---
Note: 5.0
Chapitre: 7-DNS
DateDeRetour: 2023-05-15
---

## Objectif 1
### Question 1
```
labo@debian10:~$ nslookup www.a.com
Server: 193.134.2.200
Address: 193.134.2.200#53

Non-authoritative answer:
Name: www.a.com
Address: 6.0.0.123
```

### Question 2
```
labo@debian10:~$ nslookup
>set debug
>www.a.com
Server: 193.134.2.200
Address: 193.134.2.200#53
------------
QUESTIONS:
	www.a.com, type = A, class = lN
ANSWERS:
	—> www.a.com
	internet address = 6.0.0.123
	ttl = 604394
AUTHORITY RECORDS:
	-> a.oom
	nameserver = ns.a.com.
	ttl = 604394
ADDITIONAL RECORDS:
	—> ns.a.com
	internet address = 6.0.0.200
	ttl = 604394
------------
Non-authoritative answer:
Name: www.a.com
Address: 6.0.0.123
------------
QUESTIONS:
	www.a.com, type = AAAA, Glass = IN
ANSWERS:
AUTHORITY RECORDS:
	-> a.com
	origin = ns.a.com
	mail addr = juergen.heig-vd.ch
	serial = 1
	refresh = 604800
	retry = 86400
	expire = 2419200
	minimum = 604800
	ttl = 10394
ADDITIONAL RECORDS:
------------
```

### Question 3
```
labo@debian10:~$ nslookup -type=soa a.com
Server: 193.134.2.200
Address: 193.134.2.200#53
Non-authoritative answer:
a.com

origin = ns.a.com

mail addr = juergen.heig-vd.ch

serial = 1

refresh = 604800

retry = 86400

expire = 2419200

minimum = 604800
Authoritative answers oan be found from:
a.com nameserver = ns.a.com.
ns.a.com internet address = 6.0.0.200
```
### Question 4
Pour résoudre le noeud www.a.com, le serveur d'autorité ns.a.com est utilisé.

## Objectif 2
### Question 5
Diagramme
### Question 6
Diagramme
### Question 7
Depuis terminal MacOs
nslookup -q=MX vd.ch

Server: 192.168.1.1
Address: 192.168.1.1#53

Non-authoritative answer:
vd.ch mail exchanger = 10 mail2.rcv.ch.
vd.ch mail exchanger = 10 mail.rcv.ch.