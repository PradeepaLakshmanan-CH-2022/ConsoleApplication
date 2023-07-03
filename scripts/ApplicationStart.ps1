# Stop the console application if it's already running
Get-Process -Name "ConsolePipeline" -ErrorAction SilentlyContinue | Stop-Process -Force

# Specify the path to your console application executable
$consoleAppPath = "C:\ConsoleApp\ConsolePipeline.exe"

# Specify the path for the output file
$outputFilePath = "C:\Outputfile\Output.txt"

# Run the console application and redirect the output to a file
Start-Process -FilePath $consoleAppPath -NoNewWindow -RedirectStandardOutput $outputFilePath -Wait

# Read the output file and display its contents
$outputContent = Get-Content -Path $outputFilePath -Raw
Write-Host "Console application output:"
Write-Host $outputContent
