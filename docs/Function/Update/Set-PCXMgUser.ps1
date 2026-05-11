function Set-PCXMgUser{
    param (
        # Parameter help description
        [Parameter(Mandatory=$true)]
        [string]$Displayname,
        $UserId
        
    )
 Set-MgUser -UserId $UserId -DisplayName $Displayname
}

 Set-PCXMgUser -UserId "35fef7f1-410c-4aab-9f1e-3fefaaf08a8a" -DisplayName "Suvarna raj"
