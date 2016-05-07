
function Set-TestsScaffolding {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Path 
    )

    $Path = Join-Path -Path $Path -ChildPath 'Tests'
    Set-FolderScaffolding -Path $Path
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath 'PESTER TESTS FOR THE MODULE' ) | Out-Null
}