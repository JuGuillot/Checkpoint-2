# Q.2.1
# Pour récupérer les scripts sur le serveur depuis le client, je suis passé par le bureau à distance. J'ai mis dans "ordinateur" l'adresse IP du server (172.16.10.10), il demande les idenfitifants. 
# Une fois connecté, je suis allé là où sont rangés les scripts sur le serveur (C:\Scripts), clic droit, partager, partage avancé, cocher la case partager ce dossier.
# Sur le client, dans la barre de recherche taper "\\172.16.10.10\Scripts" et faire un copié de tout les fichiers. Créer un dosser en local \Scripts et y coller tous les fichiers.

# Q.2.2
# A l'exécution du script `main.ps1`, rien ne se passe à part l'ouverture de nouveau de PowerShell ISE. 
# Pour que le script main.ps1 exécute bien le script AddLocalUsers.ps1 : Start-Process -Filepath "powershell.exe" -ArgumentList "C:\Scripts\AddLocalUsers.ps1" -Verb RunAs -WindowsStyle Maximized. Le chemin pour l'ouverture du script n'était pas le bon.

# Q.2.3

# L'option -Verb RunAs sert à lancer le script avec les privilèges élévés (admin).

# Q.2.4

# Cette option sert à lancer une nouvelle fenêtre en mode plein écran.

# Q.2.5

# Il n'est jamais pris en compte car à la ligne 27 de AddLocalUsers.ps1 il y avait un "Select-Object -Skip 2", la ligne 2 étant celle du premier utilisateur. La mettre à 1.

# Q.2.6

# Le champs description n'était pas pris en compte car il faut le rajouter dans les $UserInfo, j'ai rajouté la ligne 42 "Description      = "$Description"

