$limit = 10  # Disk space threshold in percent
$logFilePath = "C:\Logs\DiskLogs.txt"
# create file if not exists
if (-not(Test-Path -Path $logFilePath)) { New-Item -ItemType File -Path $logFilePath}

while ($true) {
    $TotalDiskSpace = (Get-Disk).Size / 1GB # Total disk space in GB
    $FreeSpace = (Get-PSDrive -PSProvider FileSystem).Free / 1GB # free dick space in GB
    $DiskSpace = ($FreeSpace / $TotalDiskSpace)*100 # disk space in percent

    if ($DiskSpace -lt $limit) {
        $logMessage = "$(Get-Date) : WARNING - Disk space is below 10%."
        Add-Content -Path $logFilePath -Value $logMessage
    }
    else {
        Write-Host "the free space in percent is" $DiskSpace"% - everything is OK" 
    }
    Start-Sleep -Seconds 300  # Wait for 5 minutes and recheck..
}