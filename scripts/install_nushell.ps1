# Define o URL do instalador do NuShell
$nushellInstallerUrl = "https://github.com/nushell/nushell/releases/download/0.45.0/nushell-x86_64-pc-windows-msvc.zip"

# Define o diretório de instalação do NuShell
$nushellInstallDir = "$env:ProgramFiles\NuShell"

# Define o diretório onde o Windows Terminal mantém os perfis
$wtProfilesDir = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"

# Define o nome do perfil para NuShell
$profileName = "NuShell"

# Define o arquivo de configuração do Windows Terminal
$wtSettingsFile = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

# Cria o diretório de instalação do NuShell, se não existir
if (-not (Test-Path -Path $nushellInstallDir)) {
    New-Item -Path $nushellInstallDir -ItemType Directory -Force
}

# Faz o download do instalador do NuShell
Invoke-WebRequest -Uri $nushellInstallerUrl -OutFile "$env:TEMP\nushell.zip"

# Extrai os arquivos do instalador
Expand-Archive -Path "$env:TEMP\nushell.zip" -DestinationPath $nushellInstallDir -Force

# Remove o arquivo zip após a extração
Remove-Item "$env:TEMP\nushell.zip" -Force

# Adiciona o perfil do NuShell ao Windows Terminal
$wtSettings = Get-Content -Path $wtSettingsFile -Raw | ConvertFrom-Json
$profile = @{
    "guid" = "{f2cf5ad4-27a4-4958-b8cc-7d1c537e2583}"
    "name" = $profileName
    "commandline" = "$nushellInstallDir\nu.exe"
}

$wtSettings.profiles.list += $profile | ConvertTo-Json -Compress
$wtSettings | ConvertTo-Json | Set-Content -Path $wtSettingsFile

# Define o perfil padrão como NuShell
$wtSettings = Get-Content -Path $wtSettingsFile -Raw | ConvertFrom-Json
$wtSettings.defaultProfile = "{f2cf5ad4-27a4-4958-b8cc-7d1c537e2583}"
$wtSettings | ConvertTo-Json | Set-Content -Path $wtSettingsFile
