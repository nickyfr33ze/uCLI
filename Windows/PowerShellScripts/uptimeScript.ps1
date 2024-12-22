# Description: This script will get the uptime of a remote computer
# Created by: Nick Friesen
# Date: 12/21/2024

$computerName = Read-Host "Enter the computer name: "
$computerName += ".ad.uoregon.edu"
Write-Host "Querying when $computerName was last booted up..."
Start-Sleep -Seconds 1
$uptimeCMD = (Get-CimInstance -ComputerName $computerName -ClassName Win32_OperatingSystem).LastBootUpTime
$uptime = (Get-Date) - $uptimeCMD
Write-Host "The computer $computerName was last booted up on $uptimeCMD"
Start-Sleep -Seconds 1
Write-Host "The computer $computerName has been up for $uptime"
