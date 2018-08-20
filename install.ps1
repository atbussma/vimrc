#
#   push the vimrc configuration to $env:HOME excluding unnecessary files
#
BEGIN {}

PROCESS
{
    $destPath = $env:HOME
    if ($destPath -eq $null) {
        $destPath = $env:USERPROFILE
    }

    $tempPath = "$destPath\.temp"
    if (! (Test-Path $tempPath)) {
        New-Item -Path $tempPath -ItemType Directory -Force
        $tempDir = Get-Item $tempPath
        $tempDir.Attributes = $tempDir.Attributes -bor "Hidden"
    }

    $vimPath = "$destPath\.vim"
    if (! (Test-Path $vimPath)) {
        New-Item -Path $vimPath -ItemType Directory -Force
        $tempDir = Get-Item $vimPath 
        $tempDir.Attributes = $tempDir.Attributes -bor "Hidden"
    }

    $sourcePath = $PSScriptRoot
    Copy-Item -Path "$sourcePath\.vimrc" -Destination "$destPath\.vimrc" -Force
    Copy-Item -Path "$sourcePath\.vim" -Destination "$destPath" -Recurse -Force
    New-Item -Path $destPath\vimfiles -ItemType SymbolicLink -Value $destPath\.vim -Force | Out-Null
}

END {}
