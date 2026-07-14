# PowerShell IT Toolkit

## Overview

PowerShell IT Toolkit is a Windows diagnostics utility that automates the collection of system, hardware, networking, storage, and event log information into a single, easy-to-read report. It is designed to assist with troubleshooting and provide technicians with a quick overview of a Windows system's health.

This project was created to strengthen my PowerShell scripting skills while building a practical tool that reflects common IT support and systems administration tasks.

---

## Features

* Collects general system information

  * Computer name
  * Domain
  * Domain role
  * BIOS version
  * Processor information

* Gathers network information

  * Network adapters
  * IP address configuration
  * Internet connectivity test

* Reports storage information

  * Volumes and available disk space

* Retrieves recent critical Windows System Event Log entries

* Generates a formatted text report

* Automatically creates an output folder if one does not already exist

---

## Requirements

* Windows 10 or Windows 11
* Windows PowerShell 5.1 or PowerShell 7+
* Administrative privileges may be required for some system information depending on the environment.

---

## Usage

Run with the default report name:

```powershell
.\IT-Toolkit.ps1
```

Generate a report with a custom filename:

```powershell
.\IT-Toolkit.ps1 -ReportName OfficePC
```

Specify a custom output folder:

```powershell
.\IT-Toolkit.ps1 -ReportName OfficePC -OutputFolder Reports
```

---

## Sample Output

The generated report contains sections similar to:

```
System Report Generated On: 07/14/2026

===================
System Information
===================
Host Name: OFFICE-PC
Domain: WORKGROUP
Role: Standalone Workstation
BIOS: F.22
Processor: Intel(R) Core(TM) i7-12700K

===================
Network
===================
Network Adapters
IP Information
Connectivity Test

===================
Storage
===================
Disk / Volume Information

===================
Critical Event Logs
===================
Recent critical system events
```

---

## Technologies Used

* PowerShell
* Get-ComputerInfo
* Test-Connection
* Get-NetIPAddress
* Get-Volume
* Get-WinEvent

---

## Future Improvements

* HTML report generation
* CSV and JSON export
* SMART disk health reporting
* Windows service status monitoring
* Installed software inventory
* Windows Update status
* Trace route diagnostics
* Hardware health summary
* Interactive menu interface
* PowerShell module version

---

## About the Project

This project was developed as part of my effort to build practical Windows administration and IT infrastructure skills while pursuing a Bachelor of Science in Computer Science. It reflects the types of troubleshooting and system information gathering commonly performed in IT support, systems administration, and data center environments.

---

## Author

**Jason Gonzalez Molina**
