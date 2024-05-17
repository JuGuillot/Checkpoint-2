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

# Q.2.9

# On peut copier la fonction et la coller dans le script directement.

# Q.2.16

# Ca sert pour enlever les caractères spéciaux ainsi que les majuscules, utile pour Styrbjörn.

Write-Host "--- Début du script ---"

function Log
{
    param([string]$FilePath,[string]$Content)
    $Log= "C:\Scripts\Log.log"
    # Vérifie si le fichier existe, sinon le crée
    If (-not (Test-Path -Path $Log))
    {
        New-Item -ItemType File -Path $Log | Out-Null
    }

    # Construit la ligne de journal
    $Date = Get-Date -Format "dd/MM/yyyy-HH:mm:ss"
    $User = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
    $logLine = "$Date;$User;$Content"

    # Ajoute la ligne de journal au fichier
    Add-Content -Path $Log -Value $logLine
}

Function Random-Password ($length = 12)
{
    $punc = 46..46
    $digits = 48..57
    $letters = 65..90 + 97..122

    $password = get-random -count $length -input ($punc + $digits + $letters) |`
        ForEach -begin { $aa = $null } -process {$aa += [char]$_} -end {$aa}
    Return $password.ToString()
}

Function ManageAccentsAndCapitalLetters
{
    param ([String]$String)
    
    $StringWithoutAccent = $String -replace '[éèêë]', 'e' -replace '[àâä]', 'a' -replace '[îï]', 'i' -replace '[ôö]', 'o' -replace '[ùûü]', 'u'
    $StringWithoutAccentAndCapitalLetters = $StringWithoutAccent.ToLower()
    $StringWithoutAccentAndCapitalLetters
}

$Path = "C:\Scripts"
$CsvFile = "$Path\Users.csv"
$LogFile = "$Path\Log.log"

$Users = Import-Csv -Path $CsvFile -Delimiter ";" -Header "prenom","nom","societe","fonction","service","description" -Encoding UTF8  | Select-Object -Skip 1

foreach ($User in $Users)
{
    $Prenom = ManageAccentsAndCapitalLetters -String $User.prenom
    $Nom = ManageAccentsAndCapitalLetters -String $User.Nom
    $Prenom.$Nom = "$Prenom.$Nom"
    If (-not(Get-LocalUser -Name "$Prenom.$Nom" -ErrorAction SilentlyContinue))
    {
        $Pass = Random-Password
        $Password = (ConvertTo-secureString $Pass -AsPlainText -Force)
        $Description = "$($user.description) - $($User.fonction)"
        $UserInfo = @{
            Name                 = "$Prenom.$Nom"
            FullName             = "$Prenom.$Nom"
            Description          = "$Description"
            Password             = $Password
            AccountNeverExpires  = $true
            PasswordNeverExpires = $true
        }

        New-LocalUser @UserInfo
        Add-LocalGroupMember -Group "Utilisateurs" -Member "$Prenom.$Nom"
        Write-Host "L'utilisateur $Prenom.$Nom a été crée avec le mot de passe $Pass" -ForegroundColor Green
    }
    else
    {
        write-host "Le compte $Prenom.$Nom existe déjà." -ForegroundColor Red
    }
Log
}

Read-Host "Appuyez sur Entrée pour terminer."
Write-Host "--- Fin du script ---"
Start-Sleep -Seconds 10
