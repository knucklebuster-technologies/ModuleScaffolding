

<#
.Synopsis
   Creates a directory structure for a powershell module
.DESCRIPTION
    Creates a directory structure for a powershell module. It also includes the psd1 and psm1 files along with an simple way to define what is exported and
	what is kept internal for the module
.PARAMETER ModuleName
	The name of the module project you want to create
.PARAMETER Path
	The Path of the Directory you wish to create the Module Project Structure
.EXAMPLE
   New-ModuleScaffolding -ModuleName NewModule -Path C:\ModuleProjects
.INPUTS
   String and DirectoryInfo Object
.NOTES
   Does not overwrite any existing directories
.FUNCTIONALITY
   Creates Directory Structure
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