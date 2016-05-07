
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
function Set-BinariesScaffolding {
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory)]
		[String]
		$Path
	)
    
    $Path = Join-Path -Path $Path -ChildPath 'Binaries'
    Set-FolderScaffolding -Path $Path
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath 'DLL AND EXE FILES USED BY MODULE' ) | Out-Null
}