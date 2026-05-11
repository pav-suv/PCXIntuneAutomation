function New-PCXMgGroups {
    param (
        # Parameter help description
        [Parameter(Mandatory = $true)]
        [string]$Displayname,

        [Parameter(Mandatory = $true)]
        [string]$MailNickname
    
    )
    begin {
        Write-PCXMessageBegin

        Write-Host "abcd"
    }
    Process {
        try {
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

            foreach ($Group in $Groups) {
                Write-Host "Iam creating $($Group)" -ForegroundColor Cyan

                New-MgGroup -DisplayName $Group -MailEnabled:$False  -MailNickName 'gp' -SecurityEnabled
                Write-Host "DisplayName $Displayname is created." -ForegroundColor Green

                Write-Host "We tried and successfuly created Dispalyname................."  -ForegroundColor Magenta

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

<#
MS-Document :
https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.groups/new-mggroup?view=graph-powershell-1.0

Command Line :
    New-PCXMgGroup -DisplayName $Group1 -MailEnabled:$False  -MailNickName 'gp11' -SecurityEnabled


Usage command :
    New-MgGroup -DisplayName $Group1 -MailEnabled:$False  -MailNickName 'gp1' -SecurityEnabled

#>

New-PCXMgGroups -DisplayName 'Group' -MailEnabled:$False  -MailNickName 'gp' -SecurityEnabled





























