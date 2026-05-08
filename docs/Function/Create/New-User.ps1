function New-PCXMgUser {
    param (
        # Parameter help description
        [Parameter(Mandatory=$true)]
        [string]$Displayname,
        [string]$UserPrincipalName,
        [string]$MailNickname
    
    )
 $PasswordProfile = @{
 Password = "TempP@ss1234"
 ForceChangePasswordNextSignIn = $false
 }
New-MgUser -DisplayName $Displayname -UserPrincipalName $UserPrincipalName -MailNickname $MailNickname -AccountEnabled -PasswordProfile $PasswordProfile
    
}

New-PCXMgUser -DisplayName "Suvarna" -UserPrincipalName "su.na@IntuneOn.onmicrosoft.com" -MailNickname "suv" 
