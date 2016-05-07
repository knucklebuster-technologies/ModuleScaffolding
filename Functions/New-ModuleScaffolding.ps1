

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
function New-ModuleScaffolding {
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory)]
		[String]
		$ModuleName,
        [Parameter(Mandatory)]
		[System.IO.DirectoryInfo]
		$Path
	)

	# calculate modules full path name
	if ((Split-Path -Path $Path -Leaf) -ne $ModuleName) {
		Write-Verbose -Message "Joining $ModuleName and $Path to create Modules full path"
		$Path = Join-Path -Path $Path -ChildPath $ModuleName
	}

	# create Module Folder Tree
	Set-FolderScaffolding -Path $Path
    Set-BinariesScaffolding -Path $Path
	Set-HelpScaffolding -Path $Path
    Set-FunctionsScaffolding -Path $Path
    Set-ModulesScaffolding -Path $Path
    Set-ResourcesScaffolding -Path $Path
    Set-TestsScaffolding -Path $Path
    Set-TypesScaffolding -Path $Path

	# copy psm1 file if one does not exist
	$PSM1 = Join-Path -Path $Path -ChildPath "$ModuleName.psm1"
	if(-not (Test-Path -Path $PSM1)) {
		$RootFile = Join-Path -Path $RootPath -ChildPath 'Resources\RootModule.psm1'
		Copy-Item -Path $RootFile -Destination $PSM1
	}

	# create a psd1 file if one does not exist
	$PSD1 = Join-Path -Path $Path -ChildPath "$ModuleName.psd1"
	if(-not (Test-Path -Path $PSD1)) {
		New-ModuleManifest -Path $PSD1 -RootModule "$ModuleName.psm1"
	}

	# copy exports script if one does not exist
	$Exports = Join-Path -Path $Path -ChildPath "Exports.ps1"
	if(-not (Test-Path -Path $Exports)) {
		$RootScript = Join-Path -Path $RootPath -ChildPath 'Resources\Exports.ps1'
		Copy-Item -Path $RootScript -Destination $Exports
	}
}