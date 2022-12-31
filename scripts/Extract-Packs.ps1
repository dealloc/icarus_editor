Add-Type -AssemblyName System.Windows.Forms
$FileBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$FileBrowser.ShowDialog()
$icarus = $FileBrowser.SelectedPath
$packFile = Join-Path $icarus "Icarus\Content\Data\data.pak"

if (Test-Path -Path $packFile -PathType Leaf) {
    ..\src\UnrealPakTool\UnrealPak.exe -Filter="*D_ItemsStatic.json" -Extract $packFile ../icarus_editor_core/lib/src/generated
    ..\src\UnrealPakTool\UnrealPak.exe -Filter="*D_Itemable.json" -Extract $packFile ../icarus_editor_core/lib/src/generated
    ..\src\UnrealPakTool\UnrealPak.exe -Filter="*D_Durable.json" -Extract $packFile ../icarus_editor_core/lib/src/generated

    cd ../src/icarus_editor_core
    flutter pub run build_runner build
} else {
    Write-Error "Failed to find data.pak file, please select the Icarus root folder"
}