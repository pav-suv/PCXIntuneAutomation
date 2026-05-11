function New-PCXMgGroup {
    param (
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [string]$Displayname,

        [Parameter(Mandatory = $true)]
        [string]$MailNickname
    )

    begin {
        Write-PCXMessageBegin
    }
    Process {

        try {
            Write-Host "Iam creating Group $Displayname" -ForegroundColor Cyan
            New-MgGroup -DisplayName $Displayname -MailEnabled:$False  -MailNickName $MailNickname -SecurityEnabled
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
    New-PCXMgGroup -DisplayName 'TestGroup' -MailEnabled:$False  -MailNickName 'Tgp' -SecurityEnabled


Usage command :
New-PCXMgGroup -DisplayName 'TestGroup' -MailEnabled:$False  -MailNickName 'Tgp' -SecurityEnabled

#> 

#New-PCXMgGroup -DisplayName 'TestGroup' -MailNickName 'Tgp' 

function New-PCXMgGroups {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory = $true)]
        [array]$Groups

    )

    begin {
        Write-PCXMessageBegin
        Write-Host "Starting bulk group creation..." -ForegroundColor Cyan
    }

    process {

        foreach ($Group in $Groups) {

            try {

                # Validate required properties
                if (-not $Group.DisplayName -or -not $Group.MailNickname) {

                    Write-Host "Skipping invalid object: $($Group | Out-String)" -ForegroundColor Yellow
                    continue
                }

                Write-Host "Processing group: $($Group.DisplayName)" -ForegroundColor Cyan

                # Call existing function
                New-PCXMgGroup `
                    -DisplayName $Group.DisplayName `
                    -MailNickname $Group.MailNickname

            }
            catch {

                Write-Host "Failed to create group $($Group.DisplayName)" -ForegroundColor Red
                Write-Host $_ -ForegroundColor Red

            }

            finally {

                Write-Host "Finally block executed for group: $($Group.DisplayName)" -ForegroundColor Magenta

            }

        }

    }

    end {

        Write-Host "Bulk group creation completed." -ForegroundColor Green
        Write-PCXMessageEnd

    }

}

<# Usage example (Single group )
New-PCXMgGroup -Displayname "Single Function" -MailNickname "singlefunction"
#>

<# Usage example (Multiple groups )
$Groups = @(

    [PSCustomObject]@{ DisplayName  = "Google Chrome [Install]" 
                       MailNickname = "gcinstall"
                      },

    [PSCustomObject]@{ DisplayName  = "Google Chrome [Uninstall]"
                       MailNickname = "gcuninstall"
                     },

    [PSCustomObject]@{ DisplayName  = "Google Chrome [Availalbe]"
                       MailNickname = "gcavailalbe"
                     }

    [PSCustomObject]@{ DisplayName  = "Google Chrome [Exception]"
                       MailNickname = "gcexception"
                     }
)

New-PCXMgGroups -Groups $Groups

#>




























