#Requires -RunAsAdministrator

function Invoke-EdgeWebViewRemove {

	<#
		.SYNOPSIS		
		Remove Edge and Webview2

		.DESCRIPTION
		Uninstall Microsoft Edge with an executable or batch script.
		
		Requires WebView
			
		- Eclipse IDEs
		- Gmpublisher (Garry's Mod)  
		- ImageGlass
		- Lenovo USB Recovery Creator Tool
		- Microsoft Photos App (Edit)
		- PowerToys File Explorer add-ons utility
		- Quicken
		- Windows Mail  
		- Xbox App
		 
		EXE Version

		Edge Only
		No Terminal - Edge only, with no terminal. Useful for Task Scheduler
		Edge + WebView

		Batch Version (Mostly by XakerTwo)

		Both - Removes both Edge, and WebView.
		Edge - Removes Edge and Appx version of Edge only.
		Edge-Appx - Remove Appx version of Edge only. Leave Webview / Chrome version alone.

		.PARAMETER Remove-EdgeWeb.exe
		
		.PARAMETER Both.bat

		.LINK
		https://github.com/ShadowWhisperer/Remove-MS-Edge

		.NOTES 
			General notes
	#>

	# EXE Version
	Invoke-WebRequest -Uri "https://github.com/ShadowWhisperer/Remove-MS-Edge/releases/latest/download/Remove-EdgeWeb.exe" -OutFile "$env:TEMP\Remove-EdgeWeb.exe"
	# Start-Process "$env:TEMP\Remove-EdgeWeb.exe" -Args "/s" -Wait -NoNewWindow
	# Remove-Item "$env:TEMP\Remove-EdgeWeb.exe" -Force

	# Batch Version
	Invoke-WebRequest -Uri "https://github.com/ShadowWhisperer/Remove-MS-Edge/raw/refs/heads/main/Batch/Both.bat" -OutFile "$env:TEMP\Both.bat"
	Start-Process "cmd.exe" -ArgumentList "/c echo Y | `"%TEMP%\Both.bat`""

}