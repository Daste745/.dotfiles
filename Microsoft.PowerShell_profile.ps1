# Standard terminal stuff
Set-PSReadlineKeyHandler -Key ctrl+d -Function ViExit
Set-PSReadlineKeyHandler -Key ctrl+l -Function ClearScreen

# Shortcut for opening the cwd in explorer
function Open-Workdir {
    explorer.exe .
}
Set-Alias -Name e -Value Open-Workdir
