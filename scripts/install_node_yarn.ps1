# Function to check if Node.js is already installed
function Check-NodeInstalled {
    if (Test-Path "$(Get-Command node | Select-Object -ExpandProperty Source)") {
        Write-Host "Node.js is already installed."
        return $true
    } else {
        return $false
    }
}

# Function to check if Yarn is already installed
function Check-YarnInstalled {
    if (Test-Path "$(Get-Command yarn | Select-Object -ExpandProperty Source)") {
        Write-Host "Yarn is already installed."
        return $true
    } else {
        return $false
    }
}

# Function to install Node.js
function Install-Node {
    if (-not (Check-NodeInstalled)) {
        Write-Host "Downloading and installing Node.js..."
        Invoke-WebRequest -Uri https://deb.nodesource.com/setup_14.x -OutFile setup_nodejs.sh
        ./setup_nodejs.sh
        sudo apt-get install -y nodejs
        Write-Host "Node.js installed successfully!"
    }
}

# Function to install Yarn
function Install-Yarn {
    if (-not (Check-YarnInstalled)) {
        Write-Host "Downloading and installing Yarn..."
        npm install -g yarn
        Write-Host "Yarn installed successfully!"
    }
}

# Execution of functions
Install-Node
Install-Yarn

Write-Host "Installation process completed."
