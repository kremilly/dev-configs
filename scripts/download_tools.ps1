# Define URLs for downloading installers
$gitInstallerUrl = "https://github.com/git-for-windows/git/releases/download/v2.35.1.windows.1/Git-2.35.1-64-bit.exe"
$vscodeInstallerUrl = "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-user"
$postmanInstallerUrl = "https://dl.pstmn.io/download/latest/win64"
$pycharmInstallerUrl = "https://download.jetbrains.com/python/pycharm-community-2021.3.2.exe"
$ghInstallerUrl = "https://github.com/cli/cli/releases/download/v2.4.0/gh_2.4.0_windows_amd64.zip"
$githubDesktopInstallerUrl = "https://desktop.githubusercontent.com/releases/2.10.2-84d31b97/GitHubDesktopSetup.exe"

# Define the download directory
$downloadsDir = "$env:USERPROFILE\Downloads\dev_tools"

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $downloadsDir)) {
    New-Item -Path $downloadsDir -ItemType Directory -Force
}

# Download the installers
Invoke-WebRequest -Uri $gitInstallerUrl -OutFile "$downloadsDir\git-installer.exe"
Invoke-WebRequest -Uri $vscodeInstallerUrl -OutFile "$downloadsDir\vscode-installer.exe"
Invoke-WebRequest -Uri $postmanInstallerUrl -OutFile "$downloadsDir\postman-installer.exe"
Invoke-WebRequest -Uri $pycharmInstallerUrl -OutFile "$downloadsDir\pycharm-installer.exe"
Invoke-WebRequest -Uri $ghInstallerUrl -OutFile "$downloadsDir\gh-installer.zip"
Invoke-WebRequest -Uri $githubDesktopInstallerUrl -OutFile "$downloadsDir\github-desktop-installer.exe"

Write-Host "Downloaded Git, VSCode, Postman, PyCharm, gh, and GitHub Desktop installers to $downloadsDir"
