###########
# NanaZip #
function Invoke-NanaZip {
	
	<#
		.SYNOPSIS
		
		.DESCRIPTION
	#>
	
	Get-FileFromWeb -Url "https://github.com/M2Team/NanaZip/releases/download/5.0.1263.0/NanaZip_5.0.1263.0.msixbundle" -File "$env:TEMP\NanaZip_5.0.1263.0.msixbundle"
	PowerShell -NoLogo -NoProfile -NonInteractive -InputFormat None -ExecutionPolicy Bypass Add-AppxPackage -DeferRegistrationWhenPackagesAreInUse -ForceUpdateFromAnyVersion -Path "$env:TEMP\NanaZip_5.0.1263.0.msixbundle"
}

