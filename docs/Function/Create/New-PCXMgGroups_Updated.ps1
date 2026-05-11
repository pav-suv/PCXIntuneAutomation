function New-PCXMgGroups_Updated {

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

                <# Validate required properties
                if (-not $Group.DisplayName -or -not $Group.MailNickname) {

                    Write-Host "Skipping invalid object: $($Group | Out-String)" -ForegroundColor Yellow
                    continue
                }
                    #>

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