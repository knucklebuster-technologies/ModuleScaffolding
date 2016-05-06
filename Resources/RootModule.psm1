$RootPath = $PSScriptRoot

Get-ChildItem -Path "$RootPath\Modules" | ForEach-Object {
	Import-Module $($PSItem.FullName) -Force
}

Get-ChildItem -Path "$RootPath\Functions" | ForEach-Object {
	. $($PSItem.FullName)
}

if ($args[0] -eq 'DevMode') {
	Write-Warning 'DevMode Activated All Module Members Will Be Exported'
	Export-ModuleMember -Alias * -Cmdlet * -Function * -Variable *
}
else {
	$Exports = & "$RootPath\Exports.ps1"
	Export-ModuleMember -Alias $Exports.Alias -Cmdlet $Exports.Cmdlet -Function $Exports.Function -Variable $Exports.Variable
}