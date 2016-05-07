
function Set-HelpScaffolding {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [System.IO.DirectoryInfo]
        $Path
    )

    $ModuleName = Split-Path -Path $Path -Leaf
    $Path = Join-Path -Path $Path -ChildPath 'en-US'
    Set-FolderScaffolding -Path $Path
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath $( 'about_' + "$ModuleName" + '_walkthru.help.txt' )) | Out-Null
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath 'HELP FILES FOR THE MODULE' ) | Out-Null
}

