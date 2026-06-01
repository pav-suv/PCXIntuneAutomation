function Test {
    param (
        [parameter(Mandatory = $true)][string] $CollectionName,
        [Parameter(Mandatory = $true)][string] $LimitingCollection
    )
    begin {
        Write-Host  "Starting Test"
    }
    process {
        try {
            $ExistingCollection = Get-CMDeviceCollection -Name $CollectionName 
            if ($ExistingCollection -ne $null) {
                Write-Host "Collection alredy exist" -ForegroundColor Yellow 
                throw
            }
            $Collection = New-CMDeviceCollection -Name $CollectionName -LimitingCollectionName $LimitingCollection
            Write-Host "Collection creation successful" -ForegroundColor Green
        }
        catch {
            <#Do this if a terminating exception happens#>
            Write-Host "Collection creation failed" -ForegroundColor Red
        }
        finally {
            <#Do this after the try block regardless of whether an exception occurred or not#>
            Write-Host "Collection process completed" -ForegroundColor Magenta
        }
    }
    end {
        Write-Host "New-DeviceCollection completed"
    }
}
Test -CollectionName "7Zip" -LimitingCollection "All Systems"



