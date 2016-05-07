

function Set-FunctionsScaffolding {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Path 
    )

    $Path = Join-Path -Path $Path -ChildPath 'Functions'
    Set-FolderScaffolding -Path $Path
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath 'POWERSHELL FUNCTIONS DOT SOURCED INTO MODULE' ) | Out-Null
}