# Start the console application and store the output in a text document
$consoleAppPath = "C:\ConsolepipelineDeploy\ConsolePipeline.exe"
$outputPath = "C:\Path\To\Output\Output.txt"

Start-Process -FilePath $consoleAppPath -NoNewWindow -RedirectStandardOutput $outputPath -WorkingDirectory (Split-Path $consoleAppPath)
