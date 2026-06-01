function New-PCXMgUser {
    param (
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [string]$Displayname,

        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName,

        [Parameter(Mandatory = $true)]
        [string]$MailNickname
    
    )
    begin {
        Write-PCXMessageBegin
    }
    Process {
        try {
            $PasswordProfile = @{
                Password                      = "TempP@ss1234"
                ForceChangePasswordNextSignIn = $false
            }
            Write-Host "We are creating new UserCollection : $Displayname " -ForegroundColor Yellow
            New-MgUser -DisplayName $Displayname -UserPrincipalName $UserPrincipalName -MailNickname $MailNickname -AccountEnabled -PasswordProfile $PasswordProfile
            Write-Host "DisplayName $Displayname is created." -ForegroundColor Green
            Write-Host "We tried and successfuly created Dispalyname................."  -ForegroundColor Magenta
        
        }
        catch {
            <#Do this if a terminating exception happens#>
            Write-Host $_ -ForegroundColor Red

        }
        finally {
            <#Do this after the try block regardless of whether an exception occurred or not#>
            Write-Host "This is finaly block runs even for success and even for failure" -ForegroundColor Cyan

        }
    
    }

    end {
        Write-PCXMessageEnd
    }
}
<#
MS-Document :

Command Line :
New-MgUser -DisplayName "Suvarna" -UserPrincipalName "su.na@IntuneOn.onmicrosoft.com" -MailNickname "suv" 

Usage command :
New-PCXMgUser -DisplayName "Suvarna" -UserPrincipalName "su.na@IntuneOn.onmicrosoft.com" -MailNickname "suv" 

#>
function Prepare-PCXUPNFromName {
    param (
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [string] $ParameterName
    )

    $UPN = $ParameterName + "@IntuneOn.onmicrosoft.com" 
    return $UPN            

}

#Prepare-PCXUPNFromName -ParameterName "Mass"

#----------------------------------------------------------------------------------------------------------------
$Users = @(
    
    "Pavana"
    "Harshith"
    "Agastya"
)
function New-PCXMgUsers {
    param (
        [Parameter(Mandatory = $true)]
        [Array]$Users 
    )
}

foreach ($User in $Users ) {

    Write-Host "Iam Creating $($User)" -ForegroundColor Yellow

    $UserPrincipalName = Prepare-PCXUPNFromName -ParameterName $User
    New-PCXMgUser -DisplayName $User -UserPrincipalName $UserPrincipalName -MailNickname  $User 

    Write-Host "What happened to $($User) creation please check and Press F 11" -ForegroundColor Red
}

New-PCXMgUsers -Users $Users


####################################################################################

New-MgGroup -DisplayName 'Test Group01' -MailEnabled:$False  -MailNickName 'testgroup2' -SecurityEnabled

Remove-MgGroup -GroupId '0b27352a-8f01-472d-a64e-24c3b1f8a388'


$Groups = @(
    "GC Install",
    "GC UnInstall",
    "GC Available",
    "GC Exception"
)


Write-Host "Iam creating $($Groups[0])"
Write-Host "Iam creating $($Groups[1])"
Write-Host "Iam creating $($Groups[2])"
Write-Host "Iam creating $($Groups[3])"


foreach($Group in $Groups)
{
Write-Host "Iam creating $($Group)" -ForegroundColor Cyan

New-MgGroup -DisplayName $Group -MailEnabled:$False  -MailNickName 'gp' -SecurityEnabled

}
