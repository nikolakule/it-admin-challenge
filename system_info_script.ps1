# Check if script is running as Administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Script must be run as Administrator to change execution policy."
    Write-Host "Please run the script as Administrator and try again."
    Exit
}

# Change Execution Policy for Current User
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Get basic system specifications
$cpuModel = Get-WmiObject Win32_Processor | Select-Object -ExpandProperty Name
$ram = [Math]::Round((Get-WmiObject Win32_ComputerSystem | Select-Object -ExpandProperty TotalPhysicalMemory) / 1GB, 2)
$osVersion = (Get-WmiObject Win32_OperatingSystem).Caption

Write-Host "CPU Model: $cpuModel"
Write-Host "RAM: $($ram) GB"  # Format RAM displayed with two decimals
Write-Host "OS Version: $osVersion"

# Show all running processes
Get-Process | Format-Table -AutoSize

# Create directory and .txt file
New-Item -ItemType Directory -Path ".\Leanpay" -Force
Set-Content -Path ".\Leanpay\hello_world.txt" -Value "Hello world!"
