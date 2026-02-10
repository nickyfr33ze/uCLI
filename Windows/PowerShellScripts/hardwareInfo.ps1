echo "[*] Gathering system information..."
Start-Sleep -Seconds 1
echo "--------------------------"
Get-ComputerInfo
echo "--------------------------"
echo "[*] Gathering CPU information..."
Get-WmiObject Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors
echo "--------------------------"
echo "[*] Gathering memory information..."
Get-WmiObject Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum | Select-Object @{Name="TotalRAM(GB)";Expression={$_.Sum/1GB}}
echo "--------------------------"
echo "[*] Gathering disk information..."
Get-WmiObject Win32_LogicalDisk | Select-Object DeviceID, VolumeName, @{Name="Size(GB)";Expression={$_.Size/1GB}}, @{Name="FreeSpace(GB)";Expression={$_.FreeSpace/1GB}}
