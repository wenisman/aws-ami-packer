# Disable Windows Updates
cmd /c reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f

# turn off windows updates
New-Item HKLM:\SOFTWARE\Policies\Microsoft\Windows -Name WindowsUpdate
New-Item HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate -Name AU
New-ItemProperty HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU -Name NoAutoUpdate -Value 1

# turn off the windows firewall
netsh advfirewall set allprofiles state off

tzutil /s "AUS Eastern Standard Time"

Install-WindowsFeature Web-Server
Install-WindowsFeature Web-Mgmt-Tools
Install-WindowsFeature Web-App-Dev -IncludeAllSubFeature

#Write-output "Installing Dot Net Framework"
New-Item c:\temp -type directory
$source="https://go.microsoft.com/fwlink/?linkid=848827"
$destination="C:\temp\dotnet-core.exe"
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($source,$destination)
Start-Process -FilePath $destination -ArgumentList "/q /norestart" -Wait -Verb RunAs
