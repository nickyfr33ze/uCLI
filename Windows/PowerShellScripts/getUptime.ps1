# Prompt for the remote computer name or IP address
$remoteComputer = Read-Host "Enter the remote computer name or IP address"

# Prompt for the credentials for the remote session
$credential = Get-Credential -Message "Enter the credentials for the remote computer"

# Script block to get the system uptime
$scriptBlock = {
    $uptime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
    $uptimeDuration = (Get-Date) - $uptime
    $days = $uptimeDuration.Days
    $hours = $uptimeDuration.Hours
    $minutes = $uptimeDuration.Minutes
    $seconds = $uptimeDuration.Seconds
    "System Uptime: $days days, $hours hours, $minutes minutes, $seconds seconds"
}

# Execute the script block on the remote computer
Invoke-Command -ComputerName $remoteComputer -Credential $credential -ScriptBlock $scriptBlock
