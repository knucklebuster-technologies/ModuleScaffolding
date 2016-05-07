
 <#
.Synopsis
   Short description
.DESCRIPTION
   Long description
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#> 
function Set-HelpScaffolding {
    [CmdletBinding()]
    Param (
        [Parameter(Mandatory)]
        [String]
        $Path
    )

    $ModuleName = Split-Path -Path $Path -Leaf
    $Path = Join-Path -Path $Path -ChildPath 'en-US'
    Set-FolderScaffolding -Path $Path
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath $( 'about_' + "$ModuleName" + '_walkthru.help.txt' )) | Out-Null
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath 'HELP FILES FOR THE MODULE' ) | Out-Null
}

