$list = @(
    "Apple",
    "Orange",
    "Banaja",
    "Water melon",
    "Mango",
    "Grapes"
) # Array


foreach ($item in $list) {
    Write-Host "Now the item is $item" -ForegroundColor Yellow
    Write-Host "New-PCXCMDeviceCollection -Name $item"
    Write-Host "I love $item" -ForegroundColor Green
}
