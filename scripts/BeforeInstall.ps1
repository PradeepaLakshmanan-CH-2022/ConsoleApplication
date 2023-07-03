# Stop the console application if it's already running
Get-Process -Name "ConsolePipeline" -ErrorAction SilentlyContinue | Stop-Process -Force

# Remove any previous output file
Remove-Item -Path "C:\Output\Output.txt" -ErrorAction SilentlyContinue


