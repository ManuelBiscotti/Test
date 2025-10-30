function Invoke-DefenderEnable {

	<#
	
		.SYNOPSIS
			Enable Windows Defender and Security
		
		.DESCRIPTION
			Enable Microsoft Defender and Security app completely without remove and broke Windows
		
		.LINK
			https://github.com/lostzombie/AchillesScript
			
		.PARAMETER restore
			Restoring default settings

	#>
	
	# Invoke-WebRequest -Uri 'https://github.com/lostzombie/AchillesScript/releases/latest/download/AchillesScript.cmd' -OutFile "$env:TEMP\AchillesScript.cmd"
	# & "$env:TEMP\AchillesScript.cmd" restore

	# Enable Defender (Atlas)
    if (Test-Path "C:\Windows\AtlasModules") {
        Start-Process -FilePath 'C:\Windows\AtlasModules\EnableDefender.cmd' -NoNewWindow -Wait
    }else {
 	    Invoke-WebRequest -Uri "https://github.com/ManuelBiscotti/test/raw/refs/heads/main/tools/AtlasModules.zip" -OutFile "$env:TEMP\AtlasModules.zip"
	    Expand-Archive -Path "$env:TEMP\AtlasModules.zip" -DestinationPath "$env:TEMP" -Force -ErrorAction SilentlyContinue
	    Move-Item -Path (Join-Path $env:TEMP 'AtlasModules') -Destination 'C:\Windows' -Force -ErrorAction SilentlyContinue
        Start-Process -FilePath 'C:\Windows\AtlasModules\EnableDefender.cmd' -NoNewWindow -Wait       
    }
	
}
	