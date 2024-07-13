$pathToWatch = "bin"
$filter = "*.*"

$fileWatcher = New-Object System.IO.FileSystemWatcher
$fileWatcher.Path = $pathToWatch
$fileWatcher.Filter = $filter
$fileWatcher.IncludeSubdirectories = $true
$fileWatcher.EnableRaisingEvents = $true

$action = {
    Clear-Host
    & dart bin/prac12.dart
}

Register-ObjectEvent $fileWatcher Changed -Action $action
Register-ObjectEvent $fileWatcher Created -Action $action
Register-ObjectEvent $fileWatcher Deleted -Action $action
Register-ObjectEvent $fileWatcher Renamed -Action $action

Write-Host "Watching for changes in $pathToWatch"
while ($true) { Start-Sleep 1 }
