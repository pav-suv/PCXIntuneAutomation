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
            Write-Host "We are creating new User : $Displayname " -ForegroundColor Yellow
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
https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.groups/new-mggroup?view=graph-powershell-1.0

Command Line :
New-MgUser -DisplayName "Suvarna" -UserPrincipalName "su.na@IntuneOn.onmicrosoft.com" -MailNickname "suv" 

Usage command :
New-PCXMgUser -DisplayName "Suvarna" -UserPrincipalName "su.na@IntuneOn.onmicrosoft.com" -MailNickname "suv" 

#>

#Prepare-PCXUPNFromName -ParameterName "Mass"

#----------------------------------------------------------------------------------------------------------------
function New-PCXMgUsers {
    param (
        [Parameter(Mandatory = $true)]
        [Array]$Users 
    )
    begin {
        Write-PCXMessageBegin
    }
    Process {
        try {
            foreach ($User in $Users ) {

                Write-Host "Iam Creating $($User)" -ForegroundColor Yellow

                #$UserPrincipalName = Prepare-PCXUPNFromName -ParameterName $User
                New-PCXMgUser -DisplayName $User.DisplayName -UserPrincipalName $User.UserPrincipalName -MailNickname $User.MailNickname

                Write-Host "What happened to $($User.DisplayName) creation please check and Press F 11" -ForegroundColor Red
            }
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

# Usage example for internal array
#New-PCXMgUsers -Users $Users
#----------------------------------------------------------------------------------------------------------------

function New-PCXMgUsersFromCSV {
    Param(
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [string]$Path
       
    )
    begin {
        Write-PCXMessageBegin
    }
    Process {
        try {
            # importing csv file to employee varialbe
            $Employees = Import-Csv -Path $Path

            foreach ($Employee in $Employees) {
                Write-Host "##################################"
                Write-host "the names is $($Employee.Names) " -ForegroundColor Green 
                Write-host "the upn is $($Employee.UserPrincipalName) " -ForegroundColor Yellow 
                Write-host "the emailnickname is $($Employee.MailNickname) " -ForegroundColor Magenta 
                New-PCXMgUser -Displayname $Employee.Names -UserPrincipalName $Employee.UserPrincipalName -MailNickname $Employee.MailNickname

                Write-Host "##################################"
            }
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
    
New-PCXMgUsersFromCSV -Path "C:\Projects\Mangalore_Udupi_Employees_6.csv"
####################################################################################

    