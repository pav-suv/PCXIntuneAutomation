function Get-PCXMgUser{
    param (
        # Parameter help description
        [Parameter(Mandatory=$true)]
        [string]$Displayname,
        $UserId
        
    )
 Get-MgUser -UserId $UserId 
}
Get-PCXMgUser -UserId "35fef7f1-410c-4aab-9f1e-3fefaaf08a8a"