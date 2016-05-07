

function Set-BinariesScaffolding {
	[CmdletBinding()]
	Param (
		[Parameter(Mandatory)]
		[System.IO.DirectoryInfo]
		$Path
	)
    
    $Path = Join-Path -Path $Path -ChildPath 'Binaries'
    Set-FolderScaffolding -Path $Path
    New-Item -ItemType File -Path $( Join-Path -Path $Path -ChildPath 'DLL AND EXE FILES USED BY MODULE' ) | Out-Null
}