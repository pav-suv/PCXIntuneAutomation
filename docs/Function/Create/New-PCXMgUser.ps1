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
}
end {
    Write-PCXMessageEnd
}

<#
MS-Document :

Command Line :
New-MgUser -DisplayName "Suvarna" -UserPrincipalName "su.na@IntuneOn.onmicrosoft.com" -MailNickname "suv" 

Usage command :
New-PCXMgUser -DisplayName "Suvarna" -UserPrincipalName "su.na@IntuneOn.onmicrosoft.com" -MailNickname "suv" 

#>

