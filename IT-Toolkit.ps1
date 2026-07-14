<#
.SYNOPSIS
    Windows IT Diagnostics Toolkit

.DESCRIPTION
    Collects system, hardware, networking, storage, and event log information
    and generates a diagnostic report for troubleshooting purposes.

.PARAMETER Outputfolder
    Folder where the report will be saved to

.EXAMPLE
    .\IT-Toolkit.ps1

.EXAMPLE
    .\IT-Toolkit.ps1 -ReportName OfficePC

.AUTHOR
    Jason Gonzalez Molina
#>
param(
    [string]$ReportName = "SystemStatus",
    [string]$OutputFolder = "ComputerStatus"
)


try {
    $info = Get-ComputerInfo
    $reportFolder = $OutputFolder
    if(-not (Test-Path $reportFolder -PathType Container)) {
        New-Item -ItemType Directory -Path $reportFolder | Out-Null
    }
    $targetPath = Join-Path $reportFolder "$ReportName.txt"
    
    $connectivityTest = Test-Connection "google.com" -Count 4 | 
    Format-Table -AutoSize | 
    Out-String

    $ipAddressInfo = Get-NetIPAddress | 
    Format-Table -AutoSize | 
    Out-String

    $volume = Get-Volume | 
    Format-Table -AutoSize | 
    Out-String

    $eventLog = Get-WinEvent -FilterHashtable @{
        LogName = 'System' 
        Level   = 1
    } -MaxEvents 10 | 
    Select-Object TimeCreated, Id, LevelDisplayName, Message | 
    Format-Table -Wrap | 
    Out-String

    $reportText = @"
System Report Generated On: $(Get-Date)

===================
System Information
===================
Host Name: $($info.CsName)
Domain: $($info.CsDomain)
Role: $($info.CsDomainRole)
BIOS: $($info.BiosBIOSVersion | Out-String)
Processor: $($info.CsProcessors | Out-String)

===================
Network
===================
Network Adapters: $($info.CsNetworkAdapters | Out-String)
IP Information: $ipAddressInfo
Connectivity Test: $connectivityTest

===================
Storage
===================
Disk/Volume Information: $volume

===================
Critical Event Logs
===================
Logs: $eventLog
"@

    Set-Content -Path $targetPath -Value $reportText
    Write-Host "Success! Report saved to $targetPath"
}
catch {
    Write-Error "An unexpected error occurred: $_"
}