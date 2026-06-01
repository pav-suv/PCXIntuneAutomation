
Import-Csv -Path "C:\Projects\Mangalore_Udupi_Employees_3.csv"

Write-Host "Csv file updated" -ForegroundColor Cyan

Import-Csv -Path "C:\Projects\Mangalore_Udupi_Employees_3_NoSpace.csv"
Write-Host "Csv file updated" -ForegroundColor Cyan

###########################################################################

$Path = "C:\Projects\Mangalore_Udupi_Employees_3_NoSpace.csv"
Import-Csv -Path $Path
Write-Host "Csv file update" -ForegroundColor Yellow

###########################################################################

$Path = "C:\Projects\Mangalore_Udupi_Employees_3_NoSpace.csv"

$result = Import-Csv -Path $Path

Write-Host "Csv file update" -ForegroundColor Yellow

$result
$result.Length
$result.GetType() # you got strigh array only now your job is easy
$result[1]
$result[1].Address
$result[1].Names

Write-Host "employee Name is $result[1].Names" # you need wrapper for vaiable when you used inside write-host
Write-Host "employee Name is $($result[1].Names)" # you need wrapper for vaiable when you used inside write-host


foreach ($Names in $result) {
    Write-host "the names is $Names[1]" -ForegroundColor Red # yoru code
    Write-host "the names is $($Names.Names) " -ForegroundColor Green 
}


$Path = "C:\Projects\Mangalore_Udupi_Employees_3_NoSpace.csv"

$Employees = Import-Csv -Path $Path

foreach ($Employee in $Employees) {
    #Write-host "the names is $Names[1]" -ForegroundColor Red # yoru code
    Write-Host "##################################"

    Write-host "the names is $($Employee.Names) " -ForegroundColor Green 
    Write-host "the upn is $($Employee.UserPrincipalName) " -ForegroundColor Yellow 
    Write-host "the emailnickname is $($Employee.MailNickname) " -ForegroundColor Magenta 
    Write-host "the address is $($Employee.Address) " -ForegroundColor Cyan 
    Write-host "the pincode is $($Employee.Pincode) " -ForegroundColor Blue 
    Write-Host "##################################"
}

# Contune


#think yousself and complete it dont check
#######################################################################################################
#Import-Csv Path "C:\Projects\Mangalore_Udupi_Employees_6.csv"
Import-Csv -Path "C:\Projects\Mangalore_Udupi_Employees_6.csv"


$Emp = Import-Csv -Path "C:\Projects\Mangalore_Udupi_Employees_6.csv" 

Write-Host "employee serial number is $($Emp[1].'Serial Number')"
Write-Host "employee serial number is $($Emp[0].'Serial Number')"
Write-Host "employee name is $($Emp[0].Names)"

foreach ($a in $Emp) {
#tyry try this it will work
Write-Host "The serial number is $($a.'Serial Number')" -ForegroundColor Cyan
Write-Host "The name is $($a.'Names')" -ForegroundColor Yellow
Write-Host "The upn is $($a.'UserPrincipalName')" -ForegroundColor Blue
Write-Host "The nickname is $($a.'MailNickName')" -ForegroundColor Magenta
Write-Host "The address is $($a.'Address')" -ForegroundColor Red
Write-Host "The pincode is $($a.'Pincode')" -ForegroundColor Cyan
}

##########################################




#$Path = "C:\Projects\Mangalore_Udupi_Employees_3_NoSpace.csv"

$Path = "C:\Projects\Coastal_Karnataka_Employees_50000_Shuffled.csv"

$Employees = Import-Csv -Path $Path

foreach ($Employee in $Employees) {
    Write-Host "##################################"
    Write-host "the names is $($Employee.Names) " -ForegroundColor Green 
    Write-host "the upn is $($Employee.UserPrincipalName) " -ForegroundColor Yellow 
    Write-host "the emailnickname is $($Employee.MailNickname) " -ForegroundColor Magenta 
    Write-Host "##################################"
}

# Done - This is the beauty of coding Once written then you should be able to reause it every time 
# even if you bring 1lac users same code works

# its a good learning for you 


foreach ($Employee in $Employees) {
    Write-Host "##################################"
    Write-host "the names is $($Employee.Names) " -ForegroundColor Green 
    Write-host "the upn is $($Employee.UserPrincipalName) " -ForegroundColor Yellow 
    Write-host "the emailnickname is $($Employee.MailNickname) " -ForegroundColor Magenta 
    New-PCXMgUser -Displayname -UserPrincipalName -MailNickname 
    Write-Host "##################################"
}
