# Define the URLs for downloading the installers
$wingetInstallerUrl = "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
$scoopInstallerUrl = "https://get.scoop.sh"
$chocoInstallerUrl = "https://chocolatey.org/install.ps1"

# Define the download locations
$downloadsDir = "$env:USERPROFILE\Downloads\dev_tools"

# Download the installers
Invoke-WebRequest -Uri $wingetInstallerUrl -OutFile "$downloadsDir\winget.msixbundle"
Invoke-WebRequest -Uri $scoopInstallerUrl -OutFile "$downloadsDir\scoop.ps1"
Invoke-WebRequest -Uri $chocoInstallerUrl -OutFile "$downloadsDir\choco_install.ps1"

Write-Host "Downloaded Winget, Scoop, and Chocolatey installers to $downloadsDir"
