function Write-PCXMessageEnd {
    
    [Console]::beep(1400, 200)
    Start-Sleep -Milliseconds 100
    [Console]::beep(1800, 300)

    Write-Host "`n⚡ PCXLAB Thank you for using service ⚡" -ForegroundColor Green
    Write-Host "🌐 www.pcxlab.com`n" -ForegroundColor Cyan
}

<#
PCX-Document : 
To be updated

Direct command :
[Console]::beep(1400, 200)

function usage example :
Write-PCXMessageEnd
#>
