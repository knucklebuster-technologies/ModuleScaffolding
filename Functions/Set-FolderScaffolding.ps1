 
function Set-FolderScaffolding {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Path
    )

    if(-not (Test-Path -Path $Path)) {
        New-Item -Path $Path -ItemType Directory | Out-Null
    }
}