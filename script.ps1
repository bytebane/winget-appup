# Function to log messages with timestamps
function Log-Message {
    param (
        [string]$message
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    Write-Host "[$timestamp] $message"
}

# Check if winget is installed
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Log-Message "winget is not installed. Please install winget and try again."
    exit 1
}

# Update winget if an update is available
$wingetUpdateAvailable = winget upgrade --id Microsoft.Winget.Source -s winget | Select-String -Pattern "Upgrade available"
if ($wingetUpdateAvailable) {
    Log-Message "Updating winget..."
    winget upgrade --id Microsoft.Winget.Source --silent --accept-package-agreements --accept-source-agreements
    Log-Message "winget has been updated. Please restart the script."
    exit 0
} else {
    Log-Message "winget is up to date."
}

# Read the configuration file
$config = Get-Content -Path ".\apps.json" | ConvertFrom-Json

# Install or update each app in the list
foreach ($app in $config.apps) {
    $appInstalled = winget list --id $app -s winget | Select-String -Pattern $app
    if ($appInstalled) {
        Log-Message "Updating $app..."
        winget upgrade --id $app --silent --accept-package-agreements --accept-source-agreements
    } else {
        Log-Message "$app is not installed. Installing..."
        winget install --id $app --silent --accept-package-agreements --accept-source-agreements
    }
}

Log-Message "All updates completed."
