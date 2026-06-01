function New-PCXMgUser {

    [CmdletBinding()]
    param (

        [Parameter(Mandatory = $true)]
        [string]$DisplayName,

        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName,

        [Parameter(Mandatory = $true)]
        [string]$MailNickname,

        [Parameter(Mandatory = $true)]
        [string]$ReportPath
    )

    begin {

        Write-PCXLog -Message "========================================="
        Write-PCXLog -Message "Starting New-PCXMgUser"
        Write-PCXLog -Message "========================================="

        # Password profile for new user
        $PasswordProfile = @{
            Password                      = "TempP@ss1234"
            ForceChangePasswordNextSignIn = $true
        }

        Write-PCXLog -Message "Password profile prepared"
    }

    process {

        try {

            # ==========================================================
            # CHECK IF USER ALREADY EXISTS
            # ==========================================================
            <#
            $ExistingUser = Get-MgUser `
                -Filter "userPrincipalName eq '$UserPrincipalName'" `
                -ErrorAction SilentlyContinue
#>
            $ExistingUser = Get-MgUser `
                -UserId $UserPrincipalName `
                -ErrorAction SilentlyContinue

            # Learning-friendly condition (preferred style)
            if ($ExistingUser -ne $null) {

                Write-PCXLog -Message "User already exists: $UserPrincipalName" -Level WARNING

                $Result = [PSCustomObject]@{
                    DisplayName       = $DisplayName
                    UserPrincipalName = $UserPrincipalName
                    MailNickname      = $MailNickname
                    Status            = "AlreadyExists"
                    UserId            = $ExistingUser.Id
                    ErrorMessage      = $null
                    Timestamp         = Get-Date
                }

                $Result | Export-Csv -Path $ReportPath -NoTypeInformation -Append
                return $Result
            }

            # ==========================================================
            # CREATE NEW USER
            # ==========================================================

            Write-PCXLog -Message "Creating user: $DisplayName"

            $User = New-MgUser `
                -DisplayName $DisplayName `
                -UserPrincipalName $UserPrincipalName `
                -MailNickname $MailNickname `
                -AccountEnabled:$true `
                -PasswordProfile $PasswordProfile `
                -ErrorAction Stop

            Write-PCXLog -Message "User created successfully"
            Write-PCXLog -Message "User ID: $($User.Id)"

            $Result = [PSCustomObject]@{
                DisplayName       = $DisplayName
                UserPrincipalName = $UserPrincipalName
                MailNickname      = $MailNickname
                Status            = "Success"
                UserId            = $User.Id
                ErrorMessage      = $null
                Timestamp         = Get-Date
            }

            $Result | Export-Csv -Path $ReportPath -NoTypeInformation -Append
            return $Result
        }

        catch {

            Write-PCXLog -Message "New-PCXMgUser failed" -Level ERROR
            Write-PCXLog -Message $_.Exception.Message -Level ERROR

            $Result = [PSCustomObject]@{
                DisplayName       = $DisplayName
                UserPrincipalName = $UserPrincipalName
                MailNickname      = $MailNickname
                Status            = "Failed"
                UserId            = $null
                ErrorMessage      = $_.Exception.Message
                Timestamp         = Get-Date
            }

            $Result | Export-Csv -Path $ReportPath -NoTypeInformation -Append
            return $Result
        }

        finally {
            Write-PCXLog -Message "New-PCXMgUser process completed"
        }
    }

    end {

        Write-PCXLog -Message "========================================="
        Write-PCXLog -Message "New-PCXMgUser completed"
        Write-PCXLog -Message "========================================="
    }
}

<# 
$Result = New-PCXMgUser `
    -DisplayName "Kiran Shetty" `
    -UserPrincipalName "kiran.shetty@IntuneOn.onmicrosoft.com" `
    -MailNickname "kirans" `
    -ReportPath $ReportPath

$Result | Format-Table -AutoSize
#>
