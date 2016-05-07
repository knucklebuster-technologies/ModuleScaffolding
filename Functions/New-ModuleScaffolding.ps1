#
# New-ModuleScaffolding.ps1
#
function New-ModuleScaffolding {
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory)]
		[String]
		$ModuleName,
		[String]
		$Path = $(Get-Location).Path
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