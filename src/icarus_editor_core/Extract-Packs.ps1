Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$FileBrowser.ShowDialog()
$icarus = $FileBrowser.SelectedPath
$packFile = Join-Path $icarus "Icarus\Content\Data\data.pak"

if (Test-Path -Path $packFile -PathType Leaf) {
    ..\UnrealPakTool\UnrealPak.exe -Filter="*D_ItemsStatic.json" -Extract $packFile ../icarus_editor_core/assets/json
    ..\UnrealPakTool\UnrealPak.exe -Filter="*D_Itemable.json" -Extract $packFile ../icarus_editor_core/assets/json
    ..\UnrealPakTool\UnrealPak.exe -Filter="*D_Durable.json" -Extract $packFile ../icarus_editor_core/assets/json
} else {
    Write-Error "Failed to find data.pak file, please select the Icarus root folder"
}