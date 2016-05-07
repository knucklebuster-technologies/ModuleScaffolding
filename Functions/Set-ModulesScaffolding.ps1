
function Set-ModulesScaffolding {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Path 
    )

    $Path = Join-Path -Path $Path -ChildPath 'Modules'
    Set-FolderScaffolding -Path $Path
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath 'PSM1 FILES IMPORTED BY THE MODULE' ) | Out-Null
}