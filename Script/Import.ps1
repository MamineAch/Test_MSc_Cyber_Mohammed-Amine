Import-Module ActiveDirectory
$csvPath = "C:\Users\Administrateur\Documents\Lab\Utilisateurs.csv"
$users = Import-Csv -Path $csvPath -Delimiter "," -Encoding utf8

foreach ($row in $users) {
    # Création du login (ex: malexandre)
    $sam = ($row.prénom[0] + $row.nom).ToLower().Replace(" ", "")
    $securePass = ConvertTo-SecureString "Azerty_2025!" -AsPlainText -Force

    Write-Host "Création de : $($row.prénom) $($row.nom)" -ForegroundColor Cyan
    
    #  Information de l'utilisateur
    New-ADUser -Name "$($row.prénom) $($row.nom)" `
               -SamAccountName $sam `
               -GivenName $row.prénom `
               -Surname $row.nom `
               -AccountPassword $securePass `
               -Enabled $true `
               -ChangePasswordAtLogon $true `
               -Path "CN=Users,DC=laplateforme,DC=io"

    #  Boucle sur les colonnes de groupes dans le fichier csv
    $groupes = @($row.groupe1, $row.groupe2, $row.groupe3, $row.groupe4, $row.groupe5, $row.groupe6)
    foreach ($grp in $groupes) {
        if (-not [string]::IsNullOrWhiteSpace($grp)) {
            # Créer le groupe s'il n'existe pas
            if (-not (Get-ADGroup -Filter "Name -eq '$grp'")) {
                New-ADGroup -Name $grp -GroupCategory Security -GroupScope Global
            }
            # Ajoute l'utilisateur
            Add-ADGroupMember -Identity $grp -Members $sam
        }
    }
}