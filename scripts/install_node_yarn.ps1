# Function to check if Node.js is already installed
function Check-NodeInstalled {
    if (Test-Path (Join-Path $env:ProgramFiles "nodejs\node.exe")) {
        Write-Output "Node.js is already installed."
        return $true
    } else {
        return $false
    }
}

# Function to check if Yarn is already installed
function Check-YarnInstalled {
    if (Test-Path (Join-Path $env:AppData "npm\yarn.cmd")) {
        Write-Output "Yarn is already installed."
        return $true
    } else {
        return $false
    }
}

# Function to install Node.js
function Install-Node {
    if (-not (Check-NodeInstalled)) {
        Write-Output "Downloading and installing Node.js..."
        $url = "https://nodejs.org/dist/latest-lts/node-$(curl -L -s -S https://nodejs.org/dist/latest-lts/ | Select-String -Pattern 'node-v(\d+\.\d+\.\d+-x64.msi)' | ForEach-Object { $_.Matches.Groups[0].Value })"
        $tempFile = "$env:TEMP\node.msi"
        Invoke-WebRequest -Uri $url -OutFile $tempFile
        Start-Process msiexec.exe -ArgumentList "/i $tempFile /quiet /norestart" -Wait
        Write-Output "Node.js installed successfully!"
    }
}

# Function to install Yarn
function Install-Yarn {
    if (-not (Check-YarnInstalled)) {
        Write-Output "Downloading and installing Yarn..."
        npm install -g yarn
        Write-Output "Yarn installed successfully!"
    }
}

# Execution of functions
Install-Node
Install-Yarn

Write-Output "Installation process completed."
