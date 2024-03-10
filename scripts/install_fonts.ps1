# Define the URL for downloading NuShell installer
$nushellInstallerUrl = "https://github.com/nushell/nushell/releases/download/0.45.0/nushell-x86_64-pc-windows-msvc.zip"

# Define the NuShell installation directory
$nushellInstallDir = "$env:ProgramFiles\NuShell"

# Define the directory where Windows Terminal keeps profiles
$wtProfilesDir = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

# Define the profile name for NuShell
$profileName = "NuShell"

# Define the Windows Terminal settings file
$wtSettingsFile = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# Create the NuShell installation directory if it doesn't exist
if (-not (Test-Path -Path $nushellInstallDir)) {
    New-Item -Path $nushellInstallDir -ItemType Directory -Force
}

# Download the NuShell installer
Invoke-WebRequest -Uri $nushellInstallerUrl -OutFile "$env:TEMP\nushell.zip"

# Extract files from the installer
Expand-Archive -Path "$env:TEMP\nushell.zip" -DestinationPath $nushellInstallDir -Force

# Remove the zip file after extraction
Remove-Item "$env:TEMP\nushell.zip" -Force

# Add NuShell profile to Windows Terminal
$wtSettings = Get-Content -Path $wtSettingsFile -Raw | ConvertFrom-Json
$profile = @{
    "guid" = "{f2cf5ad4-27a4-4958-b8cc-7d1c537e2583}"
    "name" = $profileName
    "commandline" = "$nushellInstallDir\nu.exe"
}
$wtSettings.profiles.list += $profile | ConvertTo-Json -Compress
$wtSettings | ConvertTo-Json | Set-Content -Path $wtSettingsFile

# Set the default profile to NuShell
$wtSettings = Get-Content -Path $wtSettingsFile -Raw | ConvertFrom-Json
$wtSettings.defaultProfile = "{f2cf5ad4-27a4-4958-b8cc-7d1c537e2583}"
$wtSettings | ConvertTo-Json | Set-Content -Path $wtSettingsFile
