Get-Service -ComputerName ServerName -Name "ServiceName" | Select -Expand Status | Out-File c:\scripts\service.txt
