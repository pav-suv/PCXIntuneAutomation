$PSVersionTable.PSVersion

Install-Module Microsoft.Graph -Scope CurrentUser -Force

#Import-Module microsoft.MgGraph

Connect-MgGraph


#Import-Module "C:\Users\Administrator.PCXLAB\Documents\PowerShell\Modules\Microsoft.Graph"

Connect-MgGraph `
 -Scopes "User.ReadWrite.All","Directory.ReadWrite.All" `
 -UseDeviceAuthentication `
 -ContextScope Process

 Get-MgContext

 Get-MgUser -Top 3

 $PasswordProfile = @{
 Password = "TempP@ss1234"
 ForceChangePasswordNextSignIn = $true
}

New-MgUser `
 -DisplayName "Automation User 1" `
 -UserPrincipalName "autouser1@<tenant>.onmicrosoft.com" `
 -MailNickname "autouser1" `
 -AccountEnabled `
 -PasswordProfile $PasswordProfile

 $PasswordProfile = @{
 Password = "TempP@ss1234"
 ForceChangePasswordNextSignIn = $false
}

 New-MgUser -DisplayName "Krishav" -UserPrincipalName kri.sh@IntuneOn.onmicrosoft.com -MailNickname "krish" -AccountEnabled -PasswordProfile $PasswordProfile

 Get-MgUser -All
 Remove-MgUser -UserId "499116e4-c30a-4f6a-b179-db149b3404e0" 

 Set-MgUser -UserId "f254fba0-3c58-4a7e-a0f3-e85bc6743aee" -DisplayName "Krishav Harshithraj"

 Get-MgUserLicenseDetail 

Get-MgSubscribedSku  | Select-Object SkuId, SkuPartNumber

$licence = "061f9ace-7d42-4136-88ac-31dc755f143f"

 Set-MgUserLicense -UserId "f254fba0-3c58-4a7e-a0f3-e85bc6743aee" -AddLicenses @{SkuId = $licence} -RemoveLicenses @()
 Set-MgUserLicense -UserId "kri.sh@IntuneOn.onmicrosoft.com" -AddLicenses @{SkuId = $licence} -RemoveLicenses @() .\.github

Update-MgUser `
  -UserId "kri.sh@IntuneOn.onmicrosoft.com" `
  -UsageLocation "IN"

  Get-MgUser `
  -UserId "kri.sh@IntuneOn.onmicrosoft.com" `
  | Select-Object DisplayName, UsageLocation

$licence = "061f9ace-7d42-4136-88ac-31dc755f143f"

# Assign license
Set-MgUserLicense `
  -UserId "kri.sh@IntuneOn.onmicrosoft.com" `
  -AddLicenses @{SkuId = $licence} `
  -RemoveLicenses @()

  Get-MgUserLicenseDetail -UserId "f254fba0-3c58-4a7e-a0f3-e85bc6743aee"

#--------------------------------------------------------------------------------------------------------------------------------------
$PasswordProfile = @{
 Password = "TempP@ss1234"
 ForceChangePasswordNextSignIn = $false
}
 

New-MgUser -DisplayName "Suvarna" -UserPrincipalName "su.na@IntuneOn.onmicrosoft.com" -MailNickname "suv" -AccountEnabled -PasswordProfile $PasswordProfile

Get-MgUser -All

 Set-MgUser -UserId "6b776cbc-e13f-4eec-bfe2-117d91118f93" -DisplayName "Suvarna raj"




