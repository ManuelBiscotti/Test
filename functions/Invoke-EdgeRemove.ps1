#Requires -Version 5.0

function Invoke-EdgeRemove {

	<#
		.SYNOPSIS
		Uninstalls or reinstalls Microsoft Edge and its related components. Made by @he3als.
	
		.Description
		Uninstalls or reinstalls Microsoft Edge and its related components in a non-forceful manner, based upon switches or user choices in a TUI.
	
		.PARAMETER UninstallEdge
		Uninstalls Edge, leaving the Edge user data.
	
		.PARAMETER InstallEdge
		Installs Edge, leaving the previous Edge user data.
	
		.PARAMETER InstallWebView
		Installs Edge WebView2 using the Evergreen installer.
	
		.PARAMETER RemoveEdgeData
		Removes all Edge user data. Compatible with -InstallEdge.
	
		.PARAMETER KeepAppX
		Doesn't check for and remove the AppX, in case you want to use alternative AppX removal methods. Doesn't work with UninstallEdge.
	
		.PARAMETER NonInteractive
		When combined with other parameters, this does not prompt the user for anything.
	
		.LINK
		https://github.com/he3als/EdgeRemover
	#>
	
	# Windows 10
	if ((Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').CurrentBuild -le 19045) {
		
		Invoke-WebRequest `
    		-Uri "https://cdn.jsdelivr.net/gh/he3als/EdgeRemover@main/get.ps1" `
    		-OutFile ([System.IO.Path]::Combine($env:TEMP, 'EdgeRemover.ps1')) `
    		-UseBasicParsing

		Start-Process -FilePath "powershell.exe" `
    		-ArgumentList (
				'-NoProfile','-ExecutionPolicy', 'Bypass',
                '-File', [System.IO.Path]::Combine($env:TEMP, 'EdgeRemover.ps1'),
                '-UninstallEdge', '-RemoveEdgeData', '-NonInteractive'
			) `
    		-Wait

	}

	<#

		.SYNOPSIS
		Uninstall Microsoft Edge 
		
		.DESCRIPTION
		Microsoft Edge will be completely uninstalled. The Microsoft Edge Update service might remain, this is normal as it is required for updating WebView2.

		.LINK
		https://gist.github.com/ave9858/c3451d9f452389ac7607c99d45edecc6

	#>

	# Windows 11
	elseif ((Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').CurrentBuild -ge 22000) {
		
		Invoke-RestMethod "https://gist.github.com/ave9858/c3451d9f452389ac7607c99d45edecc6/raw/UninstallEdge.ps1" |
		ForEach-Object {$_ -replace '\$ErrorActionPreference = "Stop"', '$ErrorActionPreference = "SilentlyContinue"'} |
		Set-Content -Path ([System.IO.Path]::Combine($env:TEMP, 'UninstallEdge.ps1')) -Encoding UTF8
		Start-Process -FilePath "PowerShell.exe" `
    		-ArgumentList ('-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', [System.IO.Path]::Combine($env:TEMP, 'UninstallEdge.ps1')) `
		-Wait
	}
	else{
    	Write-Host $_.Exception.Message -ForegroundColor Red
	}

	<#
		.SYNOPSIS
		Uninstall EdgeUpdate and Remove EdgeWebView2

		.LINK
		https://github.com/FR33THYFR33THY/Ultimate-Windows-Optimization-Guide/blob/main/6%20Windows/14%20Edge.ps1

	#>
	<#
	Write-Output "Uninstalling Microsoft EdgeUpdate service...."
	# find edgeupdate.exe
	$edgeupdate = @(); "LocalApplicationData", "ProgramFilesX86", "ProgramFiles" | ForEach-Object {
	$folder = [Environment]::GetFolderPath($_)
	$edgeupdate += Get-ChildItem "$folder\Microsoft\EdgeUpdate\*.*.*.*\MicrosoftEdgeUpdate.exe" -rec -ea 0
	}
	# find edgeupdate & allow uninstall regedit
	$global:REG = "HKCU:\SOFTWARE", "HKLM:\SOFTWARE", "HKCU:\SOFTWARE\Policies", "HKLM:\SOFTWARE\Policies", "HKCU:\SOFTWARE\WOW6432Node", "HKLM:\SOFTWARE\WOW6432Node", "HKCU:\SOFTWARE\WOW6432Node\Policies", "HKLM:\SOFTWARE\WOW6432Node\Policies"
	foreach ($location in $REG) { Remove-Item "$location\Microsoft\EdgeUpdate" -recurse -force}
	# uninstall edgeupdate
	foreach ($path in $edgeupdate) {
	if (Test-Path $path) { Start-Process -Wait $path -Args "/unregsvc" | Out-Null }
	do { Start-Sleep 3 } while ((Get-Process -Name "setup", "MicrosoftEdge*").Path -like "*\Microsoft\Edge*")
	if (Test-Path $path) { Start-Process -Wait $path -Args "/uninstall" | Out-Null }
	do { Start-Sleep 3 } while ((Get-Process -Name "setup", "MicrosoftEdge*").Path -like "*\Microsoft\Edge*")
	}

	Write-Output "Removing EdgeWebview2...."
	# remove edgewebview regedit
	cmd /c "reg delete `"HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft EdgeWebView`" /f >nul 2>&1"
	cmd /c "reg delete `"HKCU\Software\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft EdgeWebView`" /f >nul 2>&1"
	# remove folders edge edgecore edgeupdate edgewebview temp
	Remove-Item -Recurse -Force "$env:SystemDrive\Program Files (x86)\Microsoft" | Out-Null
	#>
}