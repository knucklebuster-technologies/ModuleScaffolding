
function Set-ResourcesScaffolding {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Path 
    )

    $Path = Join-Path -Path $Path -ChildPath 'Resources'
    Set-FolderScaffolding -Path $Path
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath 'MISC FILES USED BY MODULE' ) | Out-Null
}