# Define the URL for the WinZip installer
$winzipUrl = "https://download.winzip.com/gl/nkln/winzip24-home.exe"

# Define the path for saving the WinZip installer
$winzipPath = "$env:TEMP\winzip-installer.exe"

try {
    # Download the WinZip installer using Invoke-WebRequest
    Write-Host "Downloading WinZip installer..."
    Invoke-WebRequest -Uri $winzipUrl -OutFile $winzipPath
    Write-Host "WinZip installer downloaded successfully."

    # Install WinZip
    Write-Host "Installing WinZip..."
    Start-Process -FilePath $winzipPath -ArgumentList "/S /qn" -Wait
    Write-Host "WinZip installation completed successfully."
} catch {
    Write-Host "Error downloading or installing WinZip: $_"
}

# Clean up the temporary file
if (Test-Path $winzipPath) {
    Remove-Item $winzipPath
}
