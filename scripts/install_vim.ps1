# Checks if Chocolatey is installed, if not, installs Chocolatey
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Installs Vim using Chocolatey
choco install vim -y

# Installs Neovim using Chocolatey
choco install neovim -y

# Installs Astronvim using Chocolatey
choco install astronvim -y
