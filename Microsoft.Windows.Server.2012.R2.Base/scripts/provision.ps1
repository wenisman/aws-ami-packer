# Disable Windows Updates
cmd /c reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /v AUOptions /t REG_DWORD /d 1 /f

tzutil /s "AUS Eastern Standard Time"

Install-WindowsFeature Web-Server
Install-WindowsFeature Web-Mgmt-Tools
Install-WindowsFeature Web-App-Dev -IncludeAllSubFeature

#Write-output "Installing Dot Net Framework"
New-Item c:\temp -type directory
$source="https://nexus.prod.sbet.com.au/nexus/content/repositories/thirdparty/au/wh/NDP461-KB3102436-x86-x64-AllOS-ENU/4.6.1/NDP461-KB3102436-x86-x64-AllOS-ENU-4.6.1.exe"
$destination="C:\temp\dotnet.exe"
$webClient = New-Object System.Net.WebClient
$webClient.DownloadFile($source,$destination)
Start-Process -FilePath $destination -ArgumentList "/q /norestart" -Wait -Verb RunAs
