
function Set-TypesScaffolding {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Path 
    )

    $Path = Join-Path -Path $Path -ChildPath 'Types'
    Set-FolderScaffolding -Path $Path
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath 'POWERSHELL CLASSES USED BY MODULE' ) | Out-Null
}