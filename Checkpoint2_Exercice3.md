# Q.3.1

C'est un switch. Il permet aux ordinateurs qui sont sur le même réseau de communiquer entre eux ou via la passerelle.

# Q.3.2

C'est un routeur. Il permet au réseau `10.10.0.0/16` de communiquer avec les autres réseaux.

# Q.3.3

f0/0 et g1/0 sont des noms d'interface.

# Q.3.4

Le /16 représente le masque de sous-réseau (255.255.0.0).

# Q.3.5

C'est la passerelle par défaut.

# Q.3.6

|                        |       PC1        |       PC2        |       PC5        |
| :--------------------: | :--------------: | :--------------: | :--------------: |
|        Adresse         |   10.10.4.1/16   |  10.11.80.2/16   |   10.10.4.7/15   |
|    Adresse réseaux     |   10.10.0.0/16   |   10.11.0.0/16   |   10.10.0.0/15   |
|   1er Adresse dispo.   |   10.10.0.1/16   |   10.11.0.1/16   |   10.10.0.1/15   |
| Dernière adress. dipo. | 10.10.255.254/16 | 10.11.255.254/16 | 10.11.255.254/15 |
|  Adresse de broadcast  | 10.10.255.255/16 | 10.11.255.255/16 | 10.11.255.255/15 |

# Q.3.7

PC1, PC2, PC3, PC4 et PC5 vont pouvoir communiquer entre eux.

# Q.3.8

PC1, PC2, PC3, PC4 et PC5 vont pouvoir atteindre le réseau `172.16.5.0/24` grâce à la passerelle `10.10.255.254/16`.

# Q.3.9

Aucune incidence pour PC2 et PC3.

# Q.3.10

Il faudrait mettre un serveur DHCP par sous-réseau ou un DHCP global mais tout le monde sur le même réseau.

# Q.3.11

`00:20:79:66:68:00` et c'est PC1.

# Q.3.12

Oui c'est réussi, la ligne 5 indique `reply`. C'est un ping avec PC4 (`	00:50:79:66:68:03`).

# Q.3.13

- Request : PC1. Adresse IP : `10.10.4.1`. Adresse MAC : `00:50:79:66:68:00`.
- Reply : PC4. Adresse IP : `10.10.4.2`. Adresse MAC : `00:50:79:66:68:03`.

# Q.3.14


