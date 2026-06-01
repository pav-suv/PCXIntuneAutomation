function Package {
    param (
        [parameter(Mandatory = $true)][string] $PackageName,
        [Parameter(Mandatory = $true)][string] $Company,
        [Parameter(Mandatory = $true)][string] $Version,
        [Parameter(Mandatory = $true)][string] $Language,
        [Parameter(Mandatory = $true)][string] $Path
    )
    begin {
        Write-Host  "Starting Package"
    }
    process {
        try {
            $ExistingPackage = Get-CMPackage -Name $PackageName
            if ($ExistingPackage -ne $null) {
                Write-Host "Package alredy exist" -ForegroundColor Yellow 
                throw
            }

$Package = New-CMPackage -Name $Packagename -Manufacturer $Company -Version $Version -Language $Language -Path $Path       

            Write-Host "Package creation successful" -ForegroundColor Green
        }
        catch {
            <#Do this if a terminating exception happens#>
            Write-Host "Package creation failed" -ForegroundColor Red
        }
        finally {
            <#Do this after the try block regardless of whether an exception occurred or not#>
            Write-Host "Package process completed" -ForegroundColor Magenta
        }
    }
    end {
        Write-Host "Package completed"
    }
}

Package -PackageName "7zip" -Company "Igor Pavlov" -Version "26.0.0.0" -Path "E:\Package_Source\Applications\Igor_Pavlov\7Zip\7Zip_26.0.0.0" -Language "EN-US"



