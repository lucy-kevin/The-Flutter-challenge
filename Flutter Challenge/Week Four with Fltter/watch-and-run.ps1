$folder = "E:\Flutter challenge\Flutter 100 Days Challenge\Week Four with Fltter\bin"
$filter = "*.dart"

$fsWatcher = New-Object System.IO.FileSystemWatcher
$fsWatcher.Path = $folder
$fsWatcher.Filter = $filter
$fsWatcher.IncludeSubdirectories = $true
$fsWatcher.EnableRaisingEvents = $true

$action = {
    Clear-Host
    Write-Host "File change detected. Running Dart file..."
    & dart E:\Flutter challenge\Flutter 100 Days Challenge\Week Four with Fltter\bin\methodsByVandad.dart
}

Register-ObjectEvent -InputObject $fsWatcher -EventName Changed -Action $action
Register-ObjectEvent -InputObject $fsWatcher -EventName Created -Action $action
Register-ObjectEvent -InputObject $fsWatcher -EventName Deleted -Action $action
Register-ObjectEvent -InputObject $fsWatcher -EventName Renamed -Action $action

Write-Host "Watching for file changes in $folder. Press [Enter] to exit."
Read-Host
