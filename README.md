# Icarus save editor

A simple Icarus save file editor allowing you to quickly alter XP, credits, exotics and inventory durability.
now with dark mode support

## What if an item from a recent update isn't working?
The editor needs to be updated whenever the game files change.
You need to have a few things installed on your system to run the steps below:
- Git
- Flutter

To do this, clone this repository with Git using following command:
```shell
git clone https://github.com/dealloc/icarus_editor.git --recurse-submodules
```

Then open a powershell window in the root folder (the folder that just created after running `git clone`)
you can do this by holding shift and right clicking the empty space in the folder
![powershell](./docs//powershell-open.png)
and run the following command:
```powershell
.\scripts\Extract-Packs.ps1
```
This should open a popup asking to select a folder, here you need to select the root folder of your Icarus installation (under your steamapps etc):
![folder](./docs//select-folder.png)
Once you do the build runners should automatically generate the required code which you can submit in your fork.

## Screenshots
![charcter editor](./docs/character-editor.png)
![item editor](./docs/item-editor.png)
![profile editor](./docs/profile-editor.png)
and dark mode
![charcter editor (dark mode)](./docs/character-editor-dark.png)
![item editor (dark mode)](./docs/item-editor-dark.png)
![profile editor (dark mode)](./docs/profile-editor-dark.png)