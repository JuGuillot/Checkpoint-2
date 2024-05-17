# Q.1.1

Le ping entre la machine serveur et la machine client n'est pas possible puisque le serveur a pour adresse IP `172.16.10.10` et le client `172.16.100.50`. Elles sont donc respectivement sur les réseaux `172.16.10.0/24` et `172.16.100.0/24` et ne peuvent pas communiquer entre elles.

Afin de rendre le ping possible entre les 2 machines, je vais modifier l'adresse IP du client e, `172.16.10.50`pour qu'il soit sur le même réseau que le serveur :

![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/304ae688-fb56-4ac3-b9c5-ccdabfbea31c)

## Ping des machines 

- Client vers serveur :

![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/f5b61752-f2d2-4c8f-987f-c7279d2a31cb)

- Serveur vers client :
  
![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/5362825a-3658-4ee2-b80c-b32b2c9f9ae8)

# Q.1.2

![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/d95b0a64-3207-42b7-a805-d141bca23265)

Le ping avec le nom de la machine client se fait mais en IPv6.

# Q.1.3

Une fois le protocole IPv6 désactivé sur le client, le ping avec le nom de la machine s'effectue bien en IPv4.

![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/52657c08-a0da-4e4e-9ef8-01d845a710d4)

Je n'ai pas eu de modifications à faire pour que le ping fonctionne.

# Q.1.4

Afin de mettre en place le DHCP sur le client, il est nécessaire de faire la modification suivante :

![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/3d1ecc89-bf03-4c4a-abca-ef93b3f4dbdd)

On obtiens alors bien une adresse DHCP en `172.16.10.20`:

![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/35b88c94-aabe-42e8-a511-33df3f01e73c)

# Q.1.5

Le client ne récupère pas la première adresse disponible sur cette plage car le DHCP est configuré de la sorte : les adresses de `172.16.10.1` à `172.16.10.19` et de `172.16.10.241` à `172.16.10.254` sont exclues des adresses attribuables, donc l'adresse que le client récupère est la `172.16.10.20`.

Configuration : 

![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/30cc4105-4409-48eb-857f-70ac8ea9048d)

Adresse du client : 

![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/addd9a4c-3927-46b6-bf3a-e84e180beeea)

# Q.1.6

Pour que le client puisse avoir l'adresse IP `172.16.10.15`, il faut faire une réservation d'adresse via le rôle DHCP sur le serveur.

Pour cela : 

![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/a85eaf93-6e3f-4a1d-8070-fd1cc1533982)


On obtient bien sur le client :

![image](https://github.com/JuGuillot/Checkpoint-2/assets/161329881/e9e15779-49ef-4e73-82bc-389278bcf329)

# Q.1.7

Un des intérêts de passer en IPv6 (outre le plus grand nombre possible d'addressage) est l'auto-configuration (SLAAC) des réseaux en IPv6 et donc de ne plus dépendre d'un serveur DHCP.

# Q.1.8

Le DHCP ne devient pas obsolète avec l'IPv6 mais optionnel, il n'est plus nécessaire au bon fonctionnement.

Une des modifications possibles est de configurer le DHCPv6 afin qu'il gère les adresses IPv6 de la même manière qu'avec les adresses IPv4.
