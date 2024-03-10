# Define URLs for downloading installers
$goInstallerUrl = "https://go.dev/dl/go1.22.1.windows-amd64.msi"
$rustInstallerUrl = "https://win.rustup.rs/x86_64"
$pythonInstallerUrl = "https://www.python.org/ftp/python/3.12.2/python-3.12.2-amd64.exe"
$rubyInstallerUrl = "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-3.1.0-1/rubyinstaller-devkit-3.1.0-1-x64.exe"
$elixirInstallerUrl = "https://github.com/elixir-lang/elixir/releases/download/v1.12.3/Precompiled.zip"

# Define the download directory
$downloadsDir = "$env:USERPROFILE\Downloads\dev_tools"

# Create the directory if it doesn't exist
if (-not (Test-Path -Path $downloadsDir)) {
    New-Item -Path $downloadsDir -ItemType Directory -Force
}

# Download the installers
Invoke-WebRequest -Uri $goInstallerUrl -OutFile "$downloadsDir\go-installer.msi"
Invoke-WebRequest -Uri $rustInstallerUrl -OutFile "$downloadsDir\rust-installer.exe"
Invoke-WebRequest -Uri $pythonInstallerUrl -OutFile "$downloadsDir\python-installer.exe"
Invoke-WebRequest -Uri $rubyInstallerUrl -OutFile "$downloadsDir\ruby-installer.exe"
Invoke-WebRequest -Uri $elixirInstallerUrl -OutFile "$downloadsDir\elixir-installer.zip"

Write-Host "Downloaded Go, Rust, Python, Ruby, and Elixir installers to $downloadsDir"
