# Stop the console application if it's already running
Get-Process -Name "ConsolePipeline" -ErrorAction SilentlyContinue | Stop-Process -Force

# Remove any previous output file
Remove-Item -Path "C:\Path\To\Output\Output.txt" -ErrorAction SilentlyContinue

# Install .NET runtime
$dotnetInstallerUrl = "https://download.visualstudio.microsoft.com/download/pr/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/dxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/dotnet-runtime-6.0.x-windows-x64.exe"

$dotnetInstallerPath = "C:\DotnetApp\dotnet-runtime-6.0.x-windows-x64.exe"
$dotnetInstallLogPath = "C:\DotnetApp\dotnet-install.log"

Invoke-WebRequest -Uri $dotnetInstallerUrl -OutFile $dotnetInstallerPath
Start-Process -FilePath $dotnetInstallerPath -ArgumentList "/quiet /log $dotnetInstallLogPath" -Wait

# Check if the installation succeeded
$dotnetInstallLogContent = Get-Content -Path $dotnetInstallLogPath -Raw
$installationSuccess = $dotnetInstallLogContent -match "Installation succeeded."

if ($installationSuccess) {
    Write-Host "Installation of .NET runtime succeeded."
} else {
    Write-Host "Installation of .NET runtime failed. Check $dotnetInstallLogPath for more details."
    exit 1
}
