$PSVersionTable.PSVersion

<<<<<<< HEAD
New-CMDeviceCollection

New-PCXCMDeviceCollection

Import-Module C:\Projects\PCXMECMAutomation\src\Modules\PCXLab.SCCM

Get-Module PCXLab.SCCM

Import-Module C:\Projects\PCXMECMAutomation\src\Modules\PCXLab.Core

Get-Module PCXLab.Core

connect-MgGraph

Import-Module microsoft.MgGraph

Install-Module microsoft.MgGraph

Install-Module Microsoft.Graph -Scope CurrentUser -Force

Connect-MgGraph

Import-Module microsoft.MgGraph

Import-Module "C:\Users\Administrator.PCXLAB\Documents\PowerShell\Modules\Microsoft.Graph"


=======
Install-Module Microsoft.Graph -Scope CurrentUser -Force

#Import-Module microsoft.MgGraph

Connect-MgGraph


#Import-Module "C:\Users\Administrator.PCXLAB\Documents\PowerShell\Modules\Microsoft.Graph"

Connect-MgGraph `
  -Scopes "User.ReadWrite.All", "Directory.ReadWrite.All" `
  -UseDeviceAuthentication `
  -ContextScope Process

Get-MgContext

Get-MgUser -Top 3

$PasswordProfile = @{
  Password                      = "TempP@ss1234"
  ForceChangePasswordNextSignIn = $true
}

New-MgUser `
  -DisplayName "Automation User 1" `
  -UserPrincipalName "autouser1@<tenant>.onmicrosoft.com" `
  -MailNickname "autouser1" `
  -AccountEnabled `
  -PasswordProfile $PasswordProfile

$PasswordProfile = @{
  Password                      = "TempP@ss1234"
  ForceChangePasswordNextSignIn = $false
}

New-MgUser -DisplayName "Krishav" -UserPrincipalName kri.sh@IntuneOn.onmicrosoft.com -MailNickname "krish" -AccountEnabled -PasswordProfile $PasswordProfile

Get-MgUser -All
Remove-MgUser -UserId "499116e4-c30a-4f6a-b179-db149b3404e0" 

Set-MgUser -UserId "f254fba0-3c58-4a7e-a0f3-e85bc6743aee" -DisplayName "Krishav Harshithraj"

Get-MgUserLicenseDetail 

Get-MgSubscribedSku  | Select-Object SkuId, SkuPartNumber

$licence = "061f9ace-7d42-4136-88ac-31dc755f143f"

Set-MgUserLicense -UserId "f254fba0-3c58-4a7e-a0f3-e85bc6743aee" -AddLicenses @{SkuId = $licence } -RemoveLicenses @()
Set-MgUserLicense -UserId "kri.sh@IntuneOn.onmicrosoft.com" -AddLicenses @{SkuId = $licence } -RemoveLicenses @() .\.github

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
  -AddLicenses @{SkuId = $licence } `
  -RemoveLicenses @()

Get-MgUserLicenseDetail -UserId "f254fba0-3c58-4a7e-a0f3-e85bc6743aee"

#--------------------------------------------------------------------------------------------------------------------------------------
$PasswordProfile = @{
  Password                      = "TempP@ss1234"
  ForceChangePasswordNextSignIn = $false
}
 

New-MgUser -DisplayName "Suvarna" -UserPrincipalName "su.na@IntuneOn.onmicrosoft.com" -MailNickname "suv" -AccountEnabled -PasswordProfile $PasswordProfile

Get-MgUser -All

Set-MgUser -UserId "6b776cbc-e13f-4eec-bfe2-117d91118f93" -DisplayName "Suvarna raj"


$Mcastudent = @{
  Name    = "navya"
  Regno   = "mca212"
  Gender  = "female"
  Address = "mangalore"
}
 
$Mcastudent.Gender

$Mcastudent.GetType()

#---------------------------------------------------------------------
$Subjects = @(
  "Computer Science",
  "Machine Learning",
  "Cloud Computing"
)

$Subjects[0]
$Subjects[2]

Write-Host "I Love $($Subjects[0])"

Write-Host "I Love $($Subjects[1])"

Write-Host "I Love $($Subjects[2])"

foreach($Subject in $Subjects){
  Write-Host "I Love $($Subject)" -ForegroundColor Green
}

foreach($Theory in $Subjects){
  Write-Host "I Love $($Theory)" -ForegroundColor Red
}

foreach($T in $Subjects){
  Write-Host "I Love $($T)" -ForegroundColor Yellow
}

foreach($Fruit in $Subjects){
  Write-Host "I Love $($Fruit)" -ForegroundColor Cyan
}

$Collections = @(
"GoogleChrome Install",
  "GoogleChrome Uninstall",
  "GoogleChrome Avaialbe",
  "GoogleChrome Exception"
)


Write-Host "Iam creating $($Collections[0])"
Write-Host "Iam creating $($Collections[1])"
Write-Host "Iam creating $($Collections[2])"
Write-Host "Iam creating $($Collections[3])"

foreach($Collection in $Collections){
  Write-Host "Iam Creating $($Collection)" -ForegroundColor Yellow
}
#-------------------------------------------------------------------------------------------------------------------------


$Users = @(
  "Admin"
  "Pavana"
  "Harshith"
  "Agastya"
)

Write-Host "Iam Creating $($Users[0])"
Write-Host "Iam Creating $($Users[1])"
Write-Host "Iam Creating $($Users[2])"
Write-Host "Iam Creating $($Users[3])"

foreach($User in $Users ){
  Write-Host "Iam Creating $($User)" -ForegroundColor Yellow
}
>>>>>>> 94ff994f4dc848dbd736775b9d2071673c6e2885
